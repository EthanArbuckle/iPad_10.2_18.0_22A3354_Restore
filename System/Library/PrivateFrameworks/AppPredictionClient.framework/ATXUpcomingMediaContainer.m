@implementation ATXUpcomingMediaContainer

- (ATXUpcomingMediaContainer)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ATXUpcomingMediaContainer;
  v2 = -[ATXUpcomingMediaContainer init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    v5 = objc_opt_new();
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    v7 = objc_opt_new();
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v7;

    v9 = objc_opt_new();
    v10 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v9;

    v11 = objc_opt_new();
    v12 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v11;

    v13 = objc_opt_new();
    v14 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v13;

    v2[16] = 0;
    v15 = objc_opt_new();
    v16 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v15;

    *(_WORD *)(v2 + 17) = 0;
    v2[19] = 0;
  }
  return (ATXUpcomingMediaContainer *)v2;
}

+ (void)addToDictionary:(id)a3 key:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v7);
    }
    objc_msgSend(v10, "addObject:", v9);

  }
}

- (void)addUpcomingMediaIntent:(id)a3 withRank:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "mediaContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mediaItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v6, v7);
  objc_msgSend(v6, "launchId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.tv"));

  if (v14)
    objc_msgSend(v6, "setExpirationDate:", 0);
  objc_msgSend(v6, "expirationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

  }
  else
  {
    objc_msgSend(v6, "buckets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      +[ATXUpcomingMediaContainer addToDictionary:key:value:](ATXUpcomingMediaContainer, "addToDictionary:key:value:", self->_containerValidUpcomingMedia, v42, v12);
      +[ATXUpcomingMediaContainer addToDictionary:key:value:](ATXUpcomingMediaContainer, "addToDictionary:key:value:", self->_itemValidUpcomingMedia, v11, v12);
      -[NSMutableArray addObject:](self->_maybeSortedUpcomingMedia, "addObject:", v12);
      goto LABEL_32;
    }
  }
  v40 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v6, "buckets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v52;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v52 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v22), "vocabularyIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v20);
  }

  objc_msgSend(v6, "expirationDate");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_23;
  v25 = (void *)v24;
  objc_msgSend(v6, "expirationDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "earlierDate:", v41);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expirationDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqualToDate:", v28);

  if (v29)
  {
    +[ATXUpcomingMediaContainer addToDictionary:key:value:](ATXUpcomingMediaContainer, "addToDictionary:key:value:", self->_containerExpiredUpcomingMedia, v42, v12);
    +[ATXUpcomingMediaContainer addToDictionary:key:value:](ATXUpcomingMediaContainer, "addToDictionary:key:value:", self->_itemExpiredUpcomingMedia, v11, v12);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v30 = v17;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v48;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v48 != v33)
            objc_enumerationMutation(v30);
          +[ATXUpcomingMediaContainer addToDictionary:key:value:](ATXUpcomingMediaContainer, "addToDictionary:key:value:", self->_bucketExpiredUpcomingMedia, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v34++), v12);
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v32);
    }

  }
  else
  {
LABEL_23:
    +[ATXUpcomingMediaContainer addToDictionary:key:value:](ATXUpcomingMediaContainer, "addToDictionary:key:value:", self->_containerValidUpcomingMedia, v42, v12);
    +[ATXUpcomingMediaContainer addToDictionary:key:value:](ATXUpcomingMediaContainer, "addToDictionary:key:value:", self->_itemValidUpcomingMedia, v11, v12);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v35 = v17;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v44;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v44 != v38)
            objc_enumerationMutation(v35);
          +[ATXUpcomingMediaContainer addToDictionary:key:value:](ATXUpcomingMediaContainer, "addToDictionary:key:value:", self->_bucketValidUpcomingMedia, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v39++), v12);
        }
        while (v37 != v39);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v37);
    }

    -[NSMutableArray addObject:](self->_maybeSortedUpcomingMedia, "addObject:", v12);
  }

  v7 = v40;
LABEL_32:
  self->_sorted = 0;

}

- (NSArray)sortedUpcomingMedia
{
  NSMutableArray *maybeSortedUpcomingMedia;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_sorted)
  {
    maybeSortedUpcomingMedia = self->_maybeSortedUpcomingMedia;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("second"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray sortUsingDescriptors:](maybeSortedUpcomingMedia, "sortUsingDescriptors:", v5);

    self->_sorted = 1;
  }
  return (NSArray *)(id)-[NSMutableArray copy](self->_maybeSortedUpcomingMedia, "copy");
}

- (BOOL)appSupportsUpcomingMedia
{
  return -[NSMutableArray count](self->_maybeSortedUpcomingMedia, "count") != 0;
}

- (NSMutableDictionary)itemExpiredUpcomingMedia
{
  return self->_itemExpiredUpcomingMedia;
}

- (NSMutableDictionary)itemValidUpcomingMedia
{
  return self->_itemValidUpcomingMedia;
}

- (NSMutableDictionary)containerExpiredUpcomingMedia
{
  return self->_containerExpiredUpcomingMedia;
}

- (NSMutableDictionary)containerValidUpcomingMedia
{
  return self->_containerValidUpcomingMedia;
}

- (NSMutableDictionary)bucketExpiredUpcomingMedia
{
  return self->_bucketExpiredUpcomingMedia;
}

- (NSMutableDictionary)bucketValidUpcomingMedia
{
  return self->_bucketValidUpcomingMedia;
}

- (BOOL)preferUpcomingMediaForPredictions
{
  return self->_preferUpcomingMediaForPredictions;
}

- (void)setPreferUpcomingMediaForPredictions:(BOOL)a3
{
  self->_preferUpcomingMediaForPredictions = a3;
}

- (BOOL)preferenceForUpcomingMediaIsSet
{
  return self->_preferenceForUpcomingMediaIsSet;
}

- (void)setPreferenceForUpcomingMediaIsSet:(BOOL)a3
{
  self->_preferenceForUpcomingMediaIsSet = a3;
}

- (BOOL)isInternalApplication
{
  return self->_isInternalApplication;
}

- (void)setIsInternalApplication:(BOOL)a3
{
  self->_isInternalApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketValidUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_bucketExpiredUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_containerValidUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_containerExpiredUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_itemValidUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_itemExpiredUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_maybeSortedUpcomingMedia, 0);
}

@end
