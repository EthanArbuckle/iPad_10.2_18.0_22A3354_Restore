@implementation MUPlacePhotoHeaderAttributionFormatter

- (id)formattedHeaderStringForAttributionItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "visibility", (_QWORD)v22);
        v13 = v4;
        if (v12)
        {
          if (v12 != 1)
            continue;
          v13 = v5;
        }
        objc_msgSend(v13, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  MUMap(v4, &__block_literal_global_31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (objc_msgSend(v5, "count"))
    {
      _MULocalizedStringFromThisBundle(CFSTR("Others [Generic vendor attribution]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
    v18 = objc_alloc_init(MEMORY[0x1E0CB3738]);
    v19 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v18, "stringFromItems:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id __83__MUPlacePhotoHeaderAttributionFormatter_formattedHeaderStringForAttributionItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(v2, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __83__MUPlacePhotoHeaderAttributionFormatter_formattedHeaderStringForAttributionItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

+ (id)formattedHeaderStringForPhotoAttributions:(id)a3
{
  id v3;
  char BOOL;
  void *v5;
  MUPlacePhotoHeaderAttributionFormatter *v6;
  void *v7;
  _QWORD v9[4];
  char v10;

  v3 = a3;
  BOOL = GEOConfigGetBOOL();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __112__MUPlacePhotoHeaderAttributionFormatter_MKMapItemAttributionExtras__formattedHeaderStringForPhotoAttributions___block_invoke;
  v9[3] = &__block_descriptor_33_e40__24__0___MKMapItemPhotosAttribution_8Q16l;
  v10 = BOOL;
  MUMap(v3, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MUPlacePhotoHeaderAttributionFormatter);
  -[MUPlacePhotoHeaderAttributionFormatter formattedHeaderStringForAttributionItems:](v6, "formattedHeaderStringForAttributionItems:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

MUPlacePhotoHeaderAttributionItem *__112__MUPlacePhotoHeaderAttributionFormatter_MKMapItemAttributionExtras__formattedHeaderStringForPhotoAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  MUPlacePhotoHeaderAttributionItem *v6;
  void *v7;
  MUPlacePhotoHeaderAttributionItem *v8;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 32))
    v5 = objc_msgSend(v3, "requiresAttributionInPhotoViewerHeader") ^ 1;
  else
    v5 = 0;
  v6 = [MUPlacePhotoHeaderAttributionItem alloc];
  objc_msgSend(v4, "captionDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MUPlacePhotoHeaderAttributionItem initWithDisplayName:visibility:](v6, "initWithDisplayName:visibility:", v7, v5);

  return v8;
}

@end
