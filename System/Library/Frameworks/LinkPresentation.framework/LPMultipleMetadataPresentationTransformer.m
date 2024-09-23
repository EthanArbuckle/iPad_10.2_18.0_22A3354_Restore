@implementation LPMultipleMetadataPresentationTransformer

- (LPMultipleMetadataPresentationTransformer)initWithMetadata:(id)a3
{
  id v5;
  LPMultipleMetadataPresentationTransformer *v6;
  LPMultipleMetadataPresentationTransformer *v7;
  uint64_t v8;
  NSDictionary *summaryCounts;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  LPMultipleMetadataPresentationTransformer *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)LPMultipleMetadataPresentationTransformer;
  v6 = -[LPMultipleMetadataPresentationTransformer init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metadata, a3);
    -[LPMultipleMetadataPresentationTransformer _summaryCounts](v7, "_summaryCounts");
    v8 = objc_claimAutoreleasedReturnValue();
    summaryCounts = v7->_summaryCounts;
    v7->_summaryCounts = (NSDictionary *)v8;

    v7->_hasOnlyFiles = 1;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v7->_metadata;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "originalURL", (_QWORD)v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = v15;
          }
          else
          {
            objc_msgSend(v14, "URL");
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          v18 = v17;

          objc_msgSend(v14, "specialization");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

          }
          else
          {
            v20 = objc_msgSend(v18, "isFileURL");

            if ((v20 & 1) == 0)
              v7->_hasOnlyFiles = 0;
          }

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }

    v21 = v7;
  }

  return v7;
}

- (id)_summaryCounts
{
  id v2;
  void (**v3)(void *, uint64_t);
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD aBlock[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__LPMultipleMetadataPresentationTransformer__summaryCounts__block_invoke;
  aBlock[3] = &unk_1E44AA800;
  v23 = v2;
  v30 = v23;
  v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_metadata;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
        objc_msgSend(v8, "specialization", v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          && (objc_msgSend(v8, "specialization"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EE5E9D80),
              v10,
              v9,
              v11))
        {
          objc_msgSend(v8, "specialization");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "summaryTypeForTransformer:", self);

          v3[2](v3, v13);
        }
        else
        {
          objc_msgSend(v8, "originalURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 || (objc_msgSend(v8, "URL"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (objc_msgSend(v14, "isFileURL"))
              v15 = 2;
            else
              v15 = 0;
            v3[2](v3, v15);
          }
          else
          {
            objc_msgSend(v8, "image");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {

              v17 = 1;
            }
            else
            {
              objc_msgSend(v8, "alternateImages");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18 == 0;

              if (v19)
                v17 = 3;
              else
                v17 = 1;
            }
            v14 = 0;
            v3[2](v3, v17);
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      v5 = v20;
    }
    while (v20);
  }

  v21 = v23;
  return v21;
}

void __59__LPMultipleMetadataPresentationTransformer__summaryCounts__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v6;
  }
  else
  {
    v10 = &unk_1E44EEC78;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v10, v8);

}

- (id)summary
{
  id v3;
  NSDictionary *summaryCounts;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  summaryCounts = self->_summaryCounts;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__LPMultipleMetadataPresentationTransformer_summary__block_invoke;
  v8[3] = &unk_1E44AA828;
  v5 = v3;
  v9 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](summaryCounts, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_27);
  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __52__LPMultipleMetadataPresentationTransformer_summary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  switch(objc_msgSend(v12, "intValue"))
  {
    case 0u:
      v6 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("%ld Link(s)"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, objc_msgSend(v5, "longValue"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1u:
      v9 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("%ld Image(s)"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v7, objc_msgSend(v5, "longValue"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2u:
      v10 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("%ld Document(s)"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v7, objc_msgSend(v5, "longValue"));
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v11 = (void *)v8;

      break;
    case 3u:
      LPLocalizedString(CFSTR("Plain Text"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = 0;
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

uint64_t __52__LPMultipleMetadataPresentationTransformer_summary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "localizedStandardCompare:", a2);
}

- (id)summaryImages
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  void *v32;
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  +[LPResources fileIcon](LPResources, "fileIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[LPResources safariIcon](LPResources, "safariIcon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (self->_hasOnlyFiles && sizeClassPrefersPlaceholderIconForMultipleFiles(self->_preferredSizeClass))
  {
    if (-[NSArray count](self->_metadata, "count") < 2)
    {
      v32 = v6;
      v7 = &v32;
      v8 = 1;
    }
    else
    {
      v33[0] = v6;
      v33[1] = v6;
      v7 = (void **)v33;
      v8 = 2;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_metadata;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "specialization", (_QWORD)v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v14, "image");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            objc_msgSend(v9, "addObject:", v6);
            continue;
          }
LABEL_15:
          objc_msgSend(v14, "image");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);
          goto LABEL_22;
        }
        objc_msgSend(v14, "icon");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v14, "icon");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);
          goto LABEL_22;
        }
        objc_msgSend(v14, "image");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          goto LABEL_15;
        objc_msgSend(v14, "alternateImages");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count") == 0;

        if (v23)
          continue;
        objc_msgSend(v14, "alternateImages");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v24);

LABEL_22:
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v9, "count"))
  {
    +[LPResources safariIcon](LPResources, "safariIcon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v25);

  }
LABEL_29:

  return v9;
}

- (id)_summarySubtitle
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v11;
  id v12;
  void (**v13)(void *, void *);
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD aBlock[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->_hasOnlyFiles)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v3 = self->_metadata;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v4)
    {
      v5 = 0;
      v6 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v31 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "specialization");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "size");

          v5 += v9;
        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v4);

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v5, 0);
        return (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {

    }
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__LPMultipleMetadataPresentationTransformer__summarySubtitle__block_invoke;
  aBlock[3] = &unk_1E44AA870;
  v12 = v11;
  v29 = v12;
  v13 = (void (**)(void *, void *))_Block_copy(aBlock);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_metadata;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (!v15)
    goto LABEL_25;
  v16 = *(_QWORD *)v25;
  do
  {
    for (j = 0; j != v15; ++j)
    {
      if (*(_QWORD *)v25 != v16)
        objc_enumerationMutation(v14);
      v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
      objc_msgSend(v18, "originalURL", (_QWORD)v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        if ((objc_msgSend(v19, "isFileURL") & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v20, "_lp_simplifiedDisplayString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v21);
      }
      else
      {
        objc_msgSend(v18, "summary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_23;
        objc_msgSend(v18, "summary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v21);
      }

LABEL_23:
    }
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  }
  while (v15);
LABEL_25:

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __61__LPMultipleMetadataPresentationTransformer__summarySubtitle__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)summaryMetadata
{
  LPLinkMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LPSummarizedLinkMetadata *v9;

  if (-[NSArray count](self->_metadata, "count") == 1)
  {
    -[NSArray firstObject](self->_metadata, "firstObject");
    v3 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(LPLinkMetadata);
    -[LPMultipleMetadataPresentationTransformer summary](self, "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setTitle:](v3, "setTitle:", v4);

    -[LPMultipleMetadataPresentationTransformer _summarySubtitle](self, "_summarySubtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setSummary:](v3, "setSummary:", v5);

    -[LPMultipleMetadataPresentationTransformer summaryImages](self, "summaryImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkMetadata setIcon:](v3, "setIcon:", v7);

    }
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkMetadata setAlternateImages:](v3, "setAlternateImages:", v8);

    }
    v9 = objc_alloc_init(LPSummarizedLinkMetadata);
    -[LPLinkMetadata setSpecialization:](v3, "setSpecialization:", v9);

  }
  return v3;
}

- (unint64_t)preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (void)setPreferredSizeClass:(unint64_t)a3
{
  self->_preferredSizeClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryCounts, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
