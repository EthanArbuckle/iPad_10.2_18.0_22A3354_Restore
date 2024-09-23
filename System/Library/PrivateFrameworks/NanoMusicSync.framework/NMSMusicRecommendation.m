@implementation NMSMusicRecommendation

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_selected)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p identifier: %@, selected: %@>"), v5, self, self->_identifier, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (NMSMusicRecommendation)initWithIdentifier:(id)a3 title:(id)a4 items:(id)a5
{
  id v9;
  id v10;
  id v11;
  NMSMusicRecommendation *v12;
  NMSMusicRecommendation *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *serializerQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NMSMusicRecommendation;
  v12 = -[NMSMusicRecommendation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_items, a5);
    v13->_selected = 1;
    v14 = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicRecommendation", 0);
    serializerQueue = v13->_serializerQueue;
    v13->_serializerQueue = (OS_dispatch_queue *)v14;

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  NMSMusicRecommendation *v4;
  NMSMusicRecommendation *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;

  v4 = (NMSMusicRecommendation *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 != self)
    {
      v5 = v4;
      if (!-[NSString isEqual:](self->_identifier, "isEqual:", v5->_identifier))
      {
        v9 = 0;
LABEL_14:

        goto LABEL_15;
      }
      -[NSOrderedSet valueForKey:](self->_items, "valueForKey:", CFSTR("identifiers"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[NSOrderedSet valueForKey:](v5->_items, "valueForKey:", CFSTR("identifiers"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v9 = self->_selected == v5->_selected;
      goto LABEL_13;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (NSDate)lastModifiedDate
{
  NSObject *serializerQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  serializerQueue = self->_serializerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__NMSMusicRecommendation_lastModifiedDate__block_invoke;
  v5[3] = &unk_24D6476D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serializerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __42__NMSMusicRecommendation_lastModifiedDate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", NMSRecommendationRecentMusicIdentifier) & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");

    if (v3 != 1)
      goto LABEL_7;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v2;
      objc_msgSend(v4, "lastModifiedDateComponents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = objc_alloc(MEMORY[0x24BDBCE48]);
        v7 = objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
        objc_msgSend(v4, "lastModifiedDateComponents");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject dateFromComponents:](v7, "dateFromComponents:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 32);
        *(_QWORD *)(v10 + 32) = v9;

      }
      else
      {
        NMLogForCategory(5);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __42__NMSMusicRecommendation_lastModifiedDate__block_invoke_cold_1((uint64_t)v4, v7);
      }

    }
  }

LABEL_7:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (MPArtworkCatalog)artworkCatalog
{
  NSObject *serializerQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  serializerQueue = self->_serializerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__NMSMusicRecommendation_artworkCatalog__block_invoke;
  v5[3] = &unk_24D6476D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serializerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPArtworkCatalog *)v3;
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v1 = a1;
  v35 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 40))
  {
    if (objc_msgSend(*(id *)(v2 + 8), "count") == 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v3;
        objc_msgSend(v4, "artworkCatalog");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (!v5)
        {
          objc_msgSend(v4, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_storeStrong((id *)(*(_QWORD *)(v1 + 32) + 40), v6);
        if (!v5)

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend(v3, "artworkCatalog");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(v1 + 32);
        v4 = *(id *)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;
      }

      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = v1;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = *(id *)(*(_QWORD *)(v1 + 32) + 8);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (!v8)
      goto LABEL_21;
    v9 = v8;
    v10 = *(_QWORD *)v31;
LABEL_11:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v12, "identifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "library");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithLongLong:", objc_msgSend(v15, "persistentID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v28;
        goto LABEL_18;
      }
LABEL_19:
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (!v9)
        {
LABEL_21:

          v1 = v27;
          objc_msgSend(*(id *)(v27 + 32), "_tiledArtworkRequestForPlaylists:albums:", v3, v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2;
          v29[3] = &unk_24D6481E0;
          v29[4] = *(_QWORD *)(v27 + 32);
          objc_msgSend(v19, "setArtworkCatalogsBlock:", v29);
          v20 = objc_alloc(MEMORY[0x24BDDC6D8]);
          objc_msgSend(MEMORY[0x24BDDCCB8], "sharedDataSource");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "initWithToken:dataSource:", v19, v21);
          v23 = *(_QWORD *)(v27 + 32);
          v24 = *(void **)(v23 + 40);
          *(_QWORD *)(v23 + 40) = v22;

          goto LABEL_25;
        }
        goto LABEL_11;
      }
    }
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v12, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "library");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithLongLong:", objc_msgSend(v15, "persistentID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v3;
LABEL_18:
    objc_msgSend(v17, "addObject:", v16);

    goto LABEL_19;
  }
LABEL_26:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(v1 + 32) + 40));
}

id __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2(uint64_t a1, unint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[16];
  _BYTE v25[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if (!v11)
          {
            NMLogForCategory(5);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_1();
            goto LABEL_21;
          }
          v12 = v11;
          objc_msgSend(v11, "artworkCatalog");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            NMLogForCategory(5);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_2((uint64_t)v25, (uint64_t)v12);
            goto LABEL_21;
          }
          objc_msgSend(v12, "artworkCatalog");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_22;
          v15 = v10;
          if (!v15)
          {
            NMLogForCategory(5);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_3();
            goto LABEL_21;
          }
          v16 = v15;
          objc_msgSend(v15, "artworkCatalog");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            objc_msgSend(v16, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2);
            v14 = objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              NMLogForCategory(5);
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_4((uint64_t)v24, (uint64_t)v16);
              goto LABEL_21;
            }
          }
        }
        objc_msgSend(v4, "addObject:", v14);
LABEL_21:

LABEL_22:
        if (objc_msgSend(v4, "count") >= a2)
          goto LABEL_28;
        ++v9;
      }
      while (v7 != v9);
      v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      v7 = v17;
    }
    while (v17);
  }
LABEL_28:

  objc_msgSend((id)objc_opt_class(), "_fillArtworkMutableArray:toCount:", v4, a2);
  v18 = (void *)objc_msgSend(v4, "copy");

  return v18;
}

- (id)_tiledArtworkRequestForPlaylists:(id)a3 albums:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDDCCC0]);
  objc_msgSend(v8, "setNumberOfRows:", 2);
  objc_msgSend(v8, "setNumberOfColumns:", 2);
  objc_msgSend(v8, "setTileSpacing:", 2.0);
  objc_msgSend(v8, "setEntityIdentifier:", self->_identifier);
  objc_msgSend(v8, "setNamespaceIdentifier:", CFSTR("com.apple.NanoMusic.Recommendation"));
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = v6;
  v34[0] = v6;
  v34[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v26 != v19)
                objc_enumerationMutation(v16);
              v12 += objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "hash");
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v18);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRevisionIdentifier:", v21);

  return v8;
}

+ (id)_missingArtImage
{
  void *v2;
  void *v3;
  CGSize v5;
  CGRect v6;

  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5.width = 1.0;
  v5.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v5, 1, 0.0);
  objc_msgSend(v2, "setFill");
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  UIRectFill(v6);
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v3;
}

+ (void)_fillArtworkMutableArray:(id)a3 toCount:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "count") < a4)
  {
    v6 = (void *)MEMORY[0x24BDDC6D8];
    objc_msgSend((id)objc_opt_class(), "_missingArtImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "staticArtworkCatalogWithImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 134218240;
      v11 = objc_msgSend(v5, "count");
      v12 = 2048;
      v13 = a4;
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_INFO, "Filling tiled artwork catalog %tu -> %tu", (uint8_t *)&v10, 0x16u);
    }

    while (objc_msgSend(v5, "count") < a4)
      objc_msgSend(v5, "addObject:", v8);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_identifier);
    objc_storeStrong((id *)(v5 + 8), self->_items);
    *(_BYTE *)(v5 + 56) = self->_selected;
  }
  return (id)v5;
}

- (NSArray)storeRecommendationModelObjects
{
  return -[NSOrderedSet array](self->_items, "array");
}

- (NSOrderedSet)items
{
  return self->_items;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializerQueue, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

void __42__NMSMusicRecommendation_lastModifiedDate__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_216E27000, a2, OS_LOG_TYPE_ERROR, "No lastModifiedDateComponents for playlist %@", (uint8_t *)&v2, 0xCu);
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(), "identifiers");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1((uint64_t)v0, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_216E27000, v1, v2, "The recommendation [%{public}@] is an album, but the album information is missing. This is likely to manifest as missing artwork in Music's settings in the Watch app.");

  OUTLINED_FUNCTION_1_2();
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(a1, a2), "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_216E27000, v3, v4, "The recommended album [%{public}@] is missing its artwork catalog. This is likely to manifest as missing artwork in Music's settings in the Watch app.");

  OUTLINED_FUNCTION_1_2();
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(), "identifiers");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1((uint64_t)v0, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_216E27000, v1, v2, "The recommendation [%{public}@] is a playlist, but the playlist information is missing. This is likely to manifest as missing artwork in Music's settings in the Watch app.");

  OUTLINED_FUNCTION_1_2();
}

void __40__NMSMusicRecommendation_artworkCatalog__block_invoke_2_cold_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(a1, a2), "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_216E27000, v3, v4, "The recommended playlist [%{public}@] is missing its artwork catalog. This is likely to manifest as missing artwork in Music's settings in the Watch app.");

  OUTLINED_FUNCTION_1_2();
}

@end
