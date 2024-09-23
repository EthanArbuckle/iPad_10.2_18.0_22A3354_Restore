@implementation _MPCQueueControllerBehaviorMusic

- (id)_itemForContentItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("_PLACEHOLDER_AUTOPLAY_")) & 1) == 0)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "engineID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v22;
      v28 = 2114;
      v29 = v23;
      v30 = 2114;
      v31 = v4;
      v32 = 2114;
      v33 = v7;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForContentItemID | returning nil [unknown section ID] contentItemID=%{public}@ sectionID=%{public}@", buf, 0x2Au);

    }
    v17 = 0;
    goto LABEL_16;
  }
  -[_MPCQueueControllerBehaviorMusic _itemForComponents:](self, "_itemForComponents:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
LABEL_8:
    v11 = v11;
    v17 = v11;
    goto LABEL_16;
  }
  -[NSObject contentItemID](v10, "contentItemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sectionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  if ((objc_msgSend(v14, "isEqualToString:", v7) & 1) != 0)
  {
    objc_msgSend(v13, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v8);

    if ((v16 & 1) != 0)
    {

      v8 = v25;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v5, "engineID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject contentItemID](v11, "contentItemID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v19;
    v28 = 2114;
    v29 = v20;
    v30 = 2114;
    v31 = v21;
    v32 = 2114;
    v33 = v4;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_FAULT, "[ITFIT:%{public}@:%{public}@] _itemForContentItemID | faulting [content item ID mismatch] item.contentItemID=%{public}@ - contentItemID=%{public}@", buf, 0x2Au);

  }
  v17 = 0;
  v8 = v25;
LABEL_16:

  return v17;
}

- (MPCQueueControllerBehaviorHost)host
{
  return (MPCQueueControllerBehaviorHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (id)_identifierListForSection:(id)a3
{
  id v4;
  MPShuffleableSectionedIdentifierList **p_identifierList;
  MPSectionedIdentifierList **p_autoPlayIdentifierList;
  MPSectionedIdentifierList *autoPlayIdentifierList;
  MPShuffleableSectionedIdentifierList *v8;

  v4 = a3;
  p_identifierList = &self->_identifierList;
  if ((-[MPShuffleableSectionedIdentifierList hasSection:](self->_identifierList, "hasSection:", v4) & 1) == 0)
  {
    autoPlayIdentifierList = self->_autoPlayIdentifierList;
    p_autoPlayIdentifierList = &self->_autoPlayIdentifierList;
    if (!-[MPSectionedIdentifierList hasSection:](autoPlayIdentifierList, "hasSection:", v4))
    {
      v8 = 0;
      goto LABEL_6;
    }
    p_identifierList = p_autoPlayIdentifierList;
  }
  v8 = *p_identifierList;
LABEL_6:

  return v8;
}

- (id)_itemForComponents:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  _QWORD v51[5];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3385, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components != nil"));

  }
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") == 2)
  {
    objc_msgSend(v9, "tailPlaceholderItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");

    if (!v11)
      v11 = objc_alloc_init(MEMORY[0x24BDDCB00]);
    objc_msgSend(v5, "contentItemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setContentItemID:queueSectionID:queueItemID:](v11, "setContentItemID:queueSectionID:queueItemID:", v12, v7, v8);

    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "engineID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v14;
      v54 = 2114;
      v55 = v15;
      v56 = 2114;
      v57 = v11;
      v16 = "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning placeholder [SectionPlaceholder] item=%{public}@";
LABEL_18:
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0x20u);

      goto LABEL_42;
    }
    goto LABEL_42;
  }
  if (objc_msgSend(v5, "type") != 3)
  {
    if (objc_msgSend(v5, "type") == 1)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDDCB00]);
      objc_msgSend(v5, "contentItemID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sectionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setContentItemID:queueSectionID:queueItemID:](v11, "setContentItemID:queueSectionID:queueItemID:", v19, v20, v21);

      if (objc_msgSend(v8, "isEqualToString:", CFSTR("_PLACEHOLDER_AUTOPLAY_")))
      {
        -[NSObject setAutoPlayItem:](v11, "setAutoPlayItem:", 1);
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __55___MPCQueueControllerBehaviorMusic__itemForComponents___block_invoke;
        v51[3] = &unk_24CABA1A8;
        v51[4] = self;
        -[NSObject setArtworkCatalogBlock:](v11, "setArtworkCatalogBlock:", v51);
      }
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "engineID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v14;
        v54 = 2114;
        v55 = v15;
        v56 = 2114;
        v57 = v11;
        v16 = "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning placeholder [ItemPlaceholder] item=%{public}@";
        goto LABEL_18;
      }
      goto LABEL_42;
    }
    -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v22 = -[NSObject hasItem:inSection:](v13, "hasItem:inSection:", v8, v7);
    v23 = -[NSObject isDeletedItem:inSection:](v13, "isDeletedItem:inSection:", v8, v7);
    v24 = v23;
    if (!v22 || (v23 & 1) != 0)
    {
      objc_msgSend(v5, "contentItemID");
      v50 = objc_claimAutoreleasedReturnValue();
      if (v13 == self->_identifierList)
      {
        v32 = CFSTR("base");
      }
      else if (v13 == self->_autoPlayIdentifierList)
      {
        v32 = CFSTR("auto");
      }
      else
      {
        v32 = CFSTR("null");
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]=%@"), v32, v13);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v38)
        {
          objc_msgSend(v6, "engineID");
          v46 = v37;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v53 = v39;
          v54 = 2114;
          v55 = v40;
          v56 = 2114;
          v57 = v50;
          v58 = 2114;
          v59 = v49;
          v60 = 1024;
          v61 = v22;
          v62 = 1024;
          v63 = v24;
          _os_log_impl(&dword_210BD8000, v46, OS_LOG_TYPE_ERROR, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning nil [failed to create item] missingContentItemID=%{public}@ identifierList%{public}@ hasItem=%{BOOL}u isDeletedItem=%{BOOL}u", buf, 0x36u);

          v37 = v46;
        }
      }
      else if (v38)
      {
        objc_msgSend(v6, "engineID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v53 = v47;
        v54 = 2114;
        v55 = v41;
        v56 = 2114;
        v57 = v50;
        v58 = 2114;
        v59 = v49;
        v60 = 1024;
        v61 = v22;
        v62 = 1024;
        v63 = v24;
        _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_ERROR, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning nil [item missing datasource] missingContentItemID=%{public}@ identifierList%{public}@ hasItem=%{BOOL}u isDeletedItem=%{BOOL}u", buf, 0x36u);

      }
      v11 = 0;
    }
    else
    {
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3428, CFSTR("Unexpected state: missing dataSourceState for section: %@ dataSources: %@"), v7, self->_dataSources);

      }
      if (!objc_msgSend(v9, "shouldUsePlaceholderForItem:inSection:", v8, v7))
      {
        objc_msgSend(v9, "itemForItem:inSection:", v8, v7);
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contentItemID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setContentItemID:queueSectionID:queueItemID:](v11, "setContentItemID:queueSectionID:queueItemID:", v33, v7, v8);

        -[NSObject setAutoPlayItem:](v11, "setAutoPlayItem:", objc_msgSend(v5, "behaviorFlags") & 1);
        -[NSObject setIsHostingSharedSession:](v11, "setIsHostingSharedSession:", self->_activeHostingSharedSessionID != 0);
        v34 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "engineID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v53 = v35;
          v54 = 2114;
          v55 = v36;
          v56 = 2114;
          v57 = v11;
          _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning item [] item=%{public}@", buf, 0x20u);

        }
        goto LABEL_41;
      }
      v11 = objc_alloc_init(MEMORY[0x24BDDCB00]);
      +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v7, v8);
      v50 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)-[NSObject copyAsPlaceholder](v50, "copyAsPlaceholder");
      objc_msgSend(v25, "contentItemID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sectionID");
      v45 = v6;
      v48 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "itemID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setContentItemID:queueSectionID:queueItemID:](v11, "setContentItemID:queueSectionID:queueItemID:", v26, v27, v28);

      v6 = v45;
      -[NSObject setAutoPlayItem:](v11, "setAutoPlayItem:", v13 == self->_autoPlayIdentifierList);
      v29 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v45, "engineID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v30;
        v54 = 2114;
        v55 = v31;
        v56 = 2114;
        v57 = v11;
        _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning placeholder [datasource specified placeholder] item=%{public}@", buf, 0x20u);

      }
    }
    v34 = v50;
LABEL_41:

    goto LABEL_42;
  }
  objc_msgSend(v9, "tailPlaceholderItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v17, "copy");

  if (!v11)
    v11 = objc_alloc_init(MEMORY[0x24BDDCB00]);
  objc_msgSend(v5, "contentItemID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setContentItemID:queueSectionID:queueItemID:](v11, "setContentItemID:queueSectionID:queueItemID:", v18, v7, v8);

  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "engineID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v14;
    v54 = 2114;
    v55 = v15;
    v56 = 2114;
    v57 = v11;
    v16 = "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning placeholder [EndOfQueuePlaceholder] item=%{public}@";
    goto LABEL_18;
  }
LABEL_42:

  return v11;
}

- (id)_componentsForContentItemID:(id)a3
{
  id v5;
  void *v6;
  MPSectionedIdentifierList *autoPlayIdentifierList;
  void *v8;
  int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemID.length > 0"));

  }
  MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  autoPlayIdentifierList = self->_autoPlayIdentifierList;
  objc_msgSend(v6, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPSectionedIdentifierList hasSection:](autoPlayIdentifierList, "hasSection:", v8);

  if (objc_msgSend(v6, "type") == 1)
  {
    objc_msgSend(v6, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("_PLACEHOLDER_AUTOPLAY_"));

  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_msgSend(v6, "copyWithBehaviorFlags:", v9 | v11);

  return v12;
}

- (NSString)sessionID
{
  return (NSString *)-[MPShuffleableSectionedIdentifierList identifier](self->_identifierList, "identifier");
}

- (id)contentItemIDWithoutRepeatIteration:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "repeatIteration"))
  {
    v4 = objc_msgSend(v3, "copyWithRepeatIteration:", 0);

    v3 = (void *)v4;
  }
  objc_msgSend(v3, "contentItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5
{
  char v5;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _MPCQueueControllerBehaviorMusicEnumerator *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;

  v5 = a5;
  v9 = a3;
  v10 = v9;
  if (a4 == 3)
  {
    if (self->_repeatType == 1)
      v11 = 5;
    else
      v11 = 1;
  }
  else
  {
    v11 = 1;
  }
  v12 = v5 & 1;
  if (objc_msgSend(v9, "length"))
  {
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");
    if (!v12 && a4 == 1 && v14)
    {
      objc_msgSend(MEMORY[0x24BDBD1A8], "objectEnumerator");
      v15 = (_MPCQueueControllerBehaviorMusicEnumerator *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    objc_msgSend(v13, "sectionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v13, "type"))
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDDCBC0], "positionForItem:inSection:", v18, v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 1:
        objc_msgSend(MEMORY[0x24BDDCBC0], "positionForItem:inSection:", v18, v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2 || !v19)
          goto LABEL_25;
        if ((objc_msgSend(v19, "shouldUsePlaceholderForItem:inSection:", v18, v17) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBD1A8], "objectEnumerator");
          v15 = (_MPCQueueControllerBehaviorMusicEnumerator *)objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        }
        v11 = 5;
LABEL_25:

LABEL_26:
        break;
      case 2:
        objc_msgSend(MEMORY[0x24BDDCBC0], "positionForHeadOfSection:", v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 5;
        goto LABEL_26;
      case 3:
        v30 = v17;
        v31 = v18;
        objc_msgSend(v13, "deferredNextContentItemID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 668, CFSTR("Invalid identifier components (EndOfQueuePlaceHolder must have deferredNextContentItemID: %@"), v10);

        }
        objc_msgSend(v13, "deferredNextContentItemID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x24BDDCBC0];
        objc_msgSend(v23, "itemID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sectionID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "positionForItem:inSection:", v25, v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v30;
        v18 = v31;
        goto LABEL_26;
      default:
        v16 = 0;
        goto LABEL_26;
    }
  }
  else
  {
    v16 = 0;
    v13 = 0;
  }
  +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:](_MPCQueueControllerEnumerator, "enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:", self, a4, v11 | (8 * v12), v16, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_MPCQueueControllerBehaviorMusicEnumerator initWithQueueEnumerator:startingComponents:]([_MPCQueueControllerBehaviorMusicEnumerator alloc], "initWithQueueEnumerator:startingComponents:", v27, v13);

LABEL_28:
LABEL_29:

  return v15;
}

- (NSMutableDictionary)dataSources
{
  return self->_dataSources;
}

- (MPSectionedIdentifierList)autoPlayIdentifierList
{
  return self->_autoPlayIdentifierList;
}

- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 extension:(id)a5 reason:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  NSMutableDictionary *dataSources;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 998, CFSTR("unexpected extension: %@"), v13);

  }
  objc_msgSend(v13, "infoForSessionType:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    if (!a6)
      goto LABEL_17;
    v21 = 0;
    v22 = CFSTR("unknown sessionType [Music]");
LABEL_16:
    *a6 = v22;
    goto LABEL_47;
  }
  if ((objc_msgSend(v14, "exportable") & 1) == 0)
  {
    if (a6)
    {
      objc_msgSend(v15, "exportableReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_17:
    v21 = 0;
    goto LABEL_47;
  }
  v16 = -[MPShuffleableSectionedIdentifierList itemCount](self->_identifierList, "itemCount");
  if (!v16)
  {
    if (!a6)
      goto LABEL_17;
    v21 = 0;
    v22 = CFSTR("no items");
    goto LABEL_16;
  }
  v17 = v16;
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "maximumQueueHandOffSize");

  if (-[MPShuffleableSectionedIdentifierList itemCount](self->_identifierList, "itemCount") <= v19)
  {
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isPlaceholder"))
    {
      v21 = 0;
      if (a6)
        *a6 = CFSTR("placeholder item");
      goto LABEL_46;
    }
    objc_msgSend(v23, "sectionID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "itemID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "hasItem:inSection:", v25, v24) & 1) == 0)
    {
      if (a6)
      {
        v21 = 0;
        v27 = CFSTR("item does not exist");
        goto LABEL_27;
      }
LABEL_28:
      v21 = 0;
      goto LABEL_45;
    }
    if (objc_msgSend(v26, "isDeletedItem:inSection:", v25, v24))
    {
      if (a6)
      {
        v21 = 0;
        v27 = CFSTR("item no longer exists");
LABEL_27:
        *a6 = v27;
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
      goto LABEL_28;
    }
    v47 = v26;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v24);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dataSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v24;
    v29 = objc_msgSend(v28, "isExportableMediaTypeForItem:inSection:", v25, v24);
    v30 = v25;
    v31 = v29;

    if ((v31 & 1) == 0)
    {
      v25 = v30;
      v39 = v49;
      v21 = 0;
      if (a6)
        *a6 = CFSTR("item is non-exportable media type");
      v26 = v47;
      goto LABEL_44;
    }
    objc_msgSend(v49, "dataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v30;
    objc_msgSend(v32, "accountIDForItem:inSection:", v30, v48);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v33;
    MPCHashedDSIDFromDSID(v33);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "account");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "hashedDSID");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v45 = v34;
    if (v36 == v34)
    {

      v26 = v47;
    }
    else
    {
      v37 = v36;
      v38 = objc_msgSend(v36, "isEqual:", v34);

      v26 = v47;
      if ((v38 & 1) == 0)
      {
        v21 = 0;
        if (a6)
          *a6 = CFSTR("sessionType account does not match item account");
        v25 = v44;
LABEL_43:

        v39 = v49;
LABEL_44:

        v24 = v48;
        goto LABEL_45;
      }
    }
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 1;
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__4877;
    v55 = __Block_byref_object_dispose__4878;
    v56 = 0;
    dataSources = self->_dataSources;
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __94___MPCQueueControllerBehaviorMusic_isExportableSessionType_forContentItemID_extension_reason___block_invoke;
    v50[3] = &unk_24CAB3310;
    v50[4] = &v51;
    v50[5] = &v57;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSources, "enumerateKeysAndObjectsUsingBlock:", v50);
    v25 = v44;
    if (a6)
    {
      v41 = (void *)v52[5];
      if (v41)
        *a6 = objc_retainAutorelease(v41);
    }
    v21 = *((_BYTE *)v58 + 24) != 0;
    _Block_object_dispose(&v51, 8);

    _Block_object_dispose(&v57, 8);
    goto LABEL_43;
  }
  if (!a6)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("items greater than maximum queue size (itemCount=%ld maximumSize=%ld"), v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v21 = 0;
  *a6 = v20;
LABEL_47:

  return v21;
}

- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4
{
  void *v6;
  __CFString *v7;
  char v8;
  NSMutableDictionary *dataSources;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "type") == 2)
    {
      if (a4)
      {
        v7 = CFSTR("section placeholder");
LABEL_10:
        *a4 = v7;
      }
    }
    else if (objc_msgSend(v6, "type") == 3)
    {
      if (a4)
      {
        v7 = CFSTR("tail placeholder");
        goto LABEL_10;
      }
    }
    else if (v6)
    {
      dataSources = self->_dataSources;
      objc_msgSend(v6, "sectionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](dataSources, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v6, "itemID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "canSkipItem:reason:", v13, a4);

      }
      else
      {
        v8 = 0;
        if (a4)
          *a4 = CFSTR("sectionID not in dataSource");
      }

      goto LABEL_12;
    }
    v8 = 1;
LABEL_12:

    return v8;
  }
  v8 = 0;
  if (a4)
    *a4 = CFSTR("nil contentItemID");
  return v8;
}

- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4
{
  void *v6;
  char v7;
  __CFString *v8;
  NSMutableDictionary *dataSources;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "type") == 2)
    {
      if (a4)
      {
        v7 = 0;
        v8 = CFSTR("section placeholder");
LABEL_10:
        *a4 = v8;
LABEL_19:

        return v7;
      }
    }
    else
    {
      if (objc_msgSend(v6, "type") != 3)
      {
        if (v6)
        {
          dataSources = self->_dataSources;
          objc_msgSend(v6, "sectionID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](dataSources, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v6, "itemID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v11, "canSkipItem:reason:", v12, a4);

          }
          else
          {
            v7 = 0;
            if (a4)
              *a4 = CFSTR("sectionID not in dataSource");
          }

        }
        else
        {
          v7 = 1;
        }
        goto LABEL_19;
      }
      if (a4)
      {
        v7 = 0;
        v8 = CFSTR("tail placeholder");
        goto LABEL_10;
      }
    }
    v7 = 0;
    goto LABEL_19;
  }
  v7 = 0;
  if (a4)
    *a4 = CFSTR("nil contentItemID");
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)autoPlayEnabled
{
  return (self->_autoPlayState < 0xAuLL) & (0x2D4u >> self->_autoPlayState);
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (MPShuffleableSectionedIdentifierList)identifierList
{
  return self->_identifierList;
}

- (MPSectionedIdentifierListPosition)autoPlayEndPosition
{
  return self->_autoPlayEndPosition;
}

- (void)_emitEventsForAddingPlaybackContext:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t quot;
  uint64_t v19;
  char *v20;
  lldiv_t v21;
  uint64_t v22;
  const UInt8 *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  __CFString *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _QWORD v100[10];
  _QWORD v101[10];
  _QWORD v102[8];
  _QWORD v103[8];
  const __CFString *v104;
  uint64_t v105;
  _QWORD v106[4];
  _QWORD v107[4];
  _QWORD v108[2];

  v108[0] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v8;
  objc_msgSend(v8, "accountForUserIdentity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = v10;
  objc_msgSend(v10, "hashedDSID");
  v11 = objc_claimAutoreleasedReturnValue();
  v80 = -[_MPCQueueControllerBehaviorMusic _privateListeningSourceForContext:](self, "_privateListeningSourceForContext:", v6);
  v85 = v7;
  v83 = (void *)v11;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_254A9D5E8))
  {
    v12 = v6;
    objc_msgSend(v12, "playbackRequestEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestingBundleIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestingBundleVersion");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegationProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v88 = (void *)v14;
    if (v16)
    {
      v93 = v12;
      quot = objc_msgSend(v16, "storeAccountID");
      v19 = quot;
      v20 = (char *)v108 + 1;
      do
      {
        v21 = lldiv(quot, 10);
        quot = v21.quot;
        if (v21.rem >= 0)
          LOBYTE(v22) = v21.rem;
        else
          v22 = -v21.rem;
        *(v20 - 2) = v22 + 48;
        v23 = (const UInt8 *)(v20 - 2);
        --v20;
      }
      while (v21.quot);
      if (v19 < 0)
      {
        *(v20 - 2) = 45;
        v23 = (const UInt8 *)(v20 - 2);
      }
      v24 = (__CFString *)CFStringCreateWithBytes(0, v23, (char *)v108 - (char *)v23, 0x8000100u, 0);
      objc_msgSend(v84, "accountForDSID:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = v25;
      objc_msgSend(v25, "hashedDSID");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v106[0] = CFSTR("device-guid");
      objc_msgSend(v17, "deviceGUID");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (!v26)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      v95 = v15;
      v97 = (void *)v26;
      v107[0] = v26;
      v106[1] = CFSTR("user-agent");
      objc_msgSend(v17, "requestUserAgent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v28)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v107[1] = v29;
      v106[2] = CFSTR("device-name");
      objc_msgSend(v17, "deviceName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v107[2] = v31;
      v106[3] = CFSTR("device-software-variant");
      v32 = objc_msgSend(v17, "systemReleaseType") - 1;
      if (v32 <= 3)
      {
        v33 = off_24CAB3710[v32];
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v107[3] = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v107, v106, 4);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 >= 4)

      v12 = v93;
      if (!v30)

      if (!v28)
      v15 = v95;
      if (!v27)

      v104 = CFSTR("private-listening-enabled");
      objc_msgSend(v93, "privateListeningOverride");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      v36 = MEMORY[0x24BDBD1C8];
      if (v34)
        v36 = v34;
      v105 = v36;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v85;
      v11 = (uint64_t)v83;
    }
    else
    {
      v98 = 0;
      v99 = 0;
      v87 = 0;
    }

  }
  else
  {
    v15 = 0;
    v87 = 0;
    v88 = 0;
    v98 = 0;
    v99 = 0;
  }
  objc_msgSend(v6, "description");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playActivityFeatureName");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateListeningOverride");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "request");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startItemIdentifiers");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
    v38 = 0;
  }
  v39 = (void *)MEMORY[0x24BDD17C8];
  v40 = objc_opt_class();
  objc_msgSend(v6, "queueDescriptor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_opt_class();
  v79 = (void *)v37;
  objc_msgSend(v39, "stringWithFormat:", CFSTR("%@-%@-%@"), v40, v42, objc_opt_class());
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v89, "eventStream");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = CFSTR("queue-start-item-ids");
  v43 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v43;
  v103[0] = v43;
  v103[1] = v7;
  v102[1] = CFSTR("queue-section-id");
  v102[2] = CFSTR("account-id");
  v44 = v11;
  v45 = (void *)v15;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v44;
  v103[2] = v44;
  v102[3] = CFSTR("queue-delegated-account-id");
  v46 = (uint64_t)v99;
  if (!v99)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v46;
  v103[3] = v46;
  v102[4] = CFSTR("queue-delegated-account-metadata");
  v47 = (uint64_t)v98;
  if (!v98)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)v47;
  v103[4] = v47;
  v102[5] = CFSTR("queue-description");
  v48 = (uint64_t)v94;
  if (!v94)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v48;
  v103[5] = v48;
  v102[6] = CFSTR("private-listening-source");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v80);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v103[6] = v77;
  v102[7] = CFSTR("queue-reporting-metadata");
  v100[0] = CFSTR("queue-grouping-id");
  objc_msgSend(v6, "playActivityQueueGroupingID");
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v49;
  v101[0] = v49;
  v100[1] = CFSTR("feature-name");
  v51 = (uint64_t)v92;
  if (!v92)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)v38;
  v69 = (void *)v51;
  v101[1] = v51;
  v100[2] = CFSTR("reco-data");
  objc_msgSend(v6, "playActivityRecommendationData");
  v52 = objc_claimAutoreleasedReturnValue();
  v76 = (void *)v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v52;
  v101[2] = v52;
  v100[3] = CFSTR("siri-ref-id");
  objc_msgSend(v6, "siriReferenceIdentifier");
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v67 = (void *)v53;
  v101[3] = v53;
  v100[4] = CFSTR("siri-wha-metrics");
  objc_msgSend(v6, "siriWHAMetricsInfo");
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v55;
  v101[4] = v55;
  v100[5] = CFSTR("private-listening-enabled");
  v57 = (uint64_t)v96;
  if (!v96)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v57 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v57;
  v101[5] = v57;
  v100[6] = CFSTR("application-bundle-id");
  v58 = v88;
  if (!v88)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v101[6] = v58;
  v100[7] = CFSTR("application-version");
  v59 = (void *)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v81 = v6;
  v101[7] = v59;
  v100[8] = CFSTR("playback-context-class-name");
  v60 = v90;
  if (!v90)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v61 = v45;
  v101[8] = v60;
  v100[9] = CFSTR("device-metadata");
  v62 = v87;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v101[9] = v62;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v101, v100, 10);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v103[7] = v63;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v103, v102, 8);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "emitEventType:payload:", CFSTR("queue-add"), v64);

  if (!v87)
  if (!v90)

  if (!v61)
  if (!v88)

  if (!v96)
  if (!v56)

  if (!v54)
  if (!v76)

  if (v92)
  {
    if (v50)
      goto LABEL_84;
  }
  else
  {

    if (v50)
      goto LABEL_84;
  }

LABEL_84:
  if (!v94)

  if (!v98)
  if (v99)
  {
    if (v83)
      goto LABEL_90;
LABEL_95:

    if (v78)
      goto LABEL_91;
LABEL_96:

    goto LABEL_91;
  }

  if (!v83)
    goto LABEL_95;
LABEL_90:
  if (!v78)
    goto LABEL_96;
LABEL_91:

}

- (int64_t)_privateListeningSourceForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (MSVDeviceIsAudioAccessory()
    && (objc_msgSend(MEMORY[0x24BDDC748], "isCurrentDeviceValidHomeAccessory") & 1) == 0
    && (objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "isDevicePrivateListeningEnabled"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "BOOLValue"),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "privateListeningOverride");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7 = 3;
    }
    else
    {
      objc_msgSend(v3, "userIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v7 = 2;
      else
        v7 = 1;
    }
  }

  return v7;
}

- (BOOL)allowsQueueModifications
{
  return -[MPShuffleableSectionedIdentifierList automaticallyReversesNonDestructiveDataSourceEdits](self->_identifierList, "automaticallyReversesNonDestructiveDataSourceEdits") ^ 1;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (BOOL)canUserEnableAutoPlayWithReason:(id *)a3
{
  int64_t autoPlayState;
  __CFString *v4;
  BOOL result;

  autoPlayState = self->_autoPlayState;
  if ((unint64_t)(autoPlayState - 1) < 2)
  {
    if (a3)
    {
      v4 = CFSTR("unsupported content");
      goto LABEL_10;
    }
    return 0;
  }
  if ((unint64_t)(autoPlayState - 4) < 2)
  {
    if (a3)
    {
      v4 = CFSTR("waiting for items");
LABEL_10:
      result = 0;
      *a3 = v4;
      return result;
    }
    return 0;
  }
  if (!autoPlayState)
  {
    if (a3)
    {
      v4 = CFSTR("unknown state");
      goto LABEL_10;
    }
    return 0;
  }
  return 1;
}

- (int64_t)displayItemCount
{
  int64_t v3;

  v3 = -[MPShuffleableSectionedIdentifierList itemCount](self->_identifierList, "itemCount");
  if (-[_MPCQueueControllerBehaviorMusic autoPlayEnabled](self, "autoPlayEnabled")
    && !-[_MPCQueueControllerBehaviorMusic repeatType](self, "repeatType"))
  {
    v3 += -[MPSectionedIdentifierList itemCount](self->_autoPlayIdentifierList, "itemCount");
  }
  return v3;
}

- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5
{
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  __CFString *v13;
  BOOL v14;
  __CFString *v16;
  void *v17;

  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 1754, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemID"));

  }
  if (-[_MPCQueueControllerBehaviorMusic canNextItemFromContentItemID:reason:](self, "canNextItemFromContentItemID:reason:", v9, a5))
  {
    v10 = 1;
    switch(a3)
    {
      case 0:
      case 3:
        goto LABEL_31;
      case 1:
        if (!_os_feature_enabled_impl())
        {
          if (!a5)
            goto LABEL_15;
          v10 = 0;
          v13 = CFSTR("FF MediaPlayer/QueueFA is OFF");
          goto LABEL_30;
        }
        -[_MPCQueueControllerBehaviorMusic tailInsertionContentItemIDForTargetContentItemID:](self, "tailInsertionContentItemIDForTargetContentItemID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_38;
        if ((self->_activeItemFlags & 1) != 0)
        {
          if (a5)
          {
            v10 = 0;
            v16 = CFSTR("active item from AutoPlay");
LABEL_36:
            *a5 = v16;
            goto LABEL_38;
          }
        }
        else
        {
          if (-[_MPCQueueControllerBehaviorMusic _allDataSourcesSupportInsertionPositionLast](self, "_allDataSourcesSupportInsertionPositionLast"))
          {
            -[_MPCQueueControllerBehaviorMusic lastSectionContentItemIDForTargetContentItemID:](self, "lastSectionContentItemIDForTargetContentItemID:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v12 != 0;
            if (a5 && !v12)
              *a5 = CFSTR("no UpNext section, no LastSectionContentItemID");

            goto LABEL_38;
          }
          if (a5)
          {
            v10 = 0;
            v16 = CFSTR("data source does not support position Tail (interpretted as Last)");
            goto LABEL_36;
          }
        }
        v10 = 0;
LABEL_38:

        goto LABEL_31;
      case 2:
        if (_os_feature_enabled_impl())
        {
          if (!a5)
            goto LABEL_15;
          v10 = 0;
          v13 = CFSTR("FF MediaPlayer/QueueFA is ON");
          goto LABEL_30;
        }
        if ((self->_activeItemFlags & 1) != 0)
        {
          if (!a5)
            goto LABEL_15;
          v10 = 0;
          v13 = CFSTR("active item from AutoPlay");
          goto LABEL_30;
        }
        v14 = -[_MPCQueueControllerBehaviorMusic _allDataSourcesSupportInsertionPositionLast](self, "_allDataSourcesSupportInsertionPositionLast");
        v10 = v14;
        if (a5 && !v14)
        {
          v10 = 0;
          v13 = CFSTR("data source does not support position Last");
          goto LABEL_30;
        }
        goto LABEL_31;
      default:
        if (!a5)
          goto LABEL_15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unsupported position: %ld"), a3);
        v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
    }
  }
  if (a5 && !*a5)
  {
    v10 = 0;
    v13 = CFSTR("unskippable item");
LABEL_30:
    *a5 = v13;
  }
  else
  {
LABEL_15:
    v10 = 0;
  }
LABEL_31:

  return v10;
}

- (void)currentItemDidChangeFromContentItemID:(id)a3 toContentItemID:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *dataSources;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_storeStrong((id *)&self->_playNowInsertionContentItemID, a4);
  if (v6)
  {
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dataSources = self->_dataSources;
    objc_msgSend(v7, "sectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](dataSources, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sectionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sectionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if ((v14 & 1) == 0)
      {
        v15 = self->_dataSources;
        objc_msgSend(v11, "sectionID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "itemDidBeginPlayback:", 0);
      }

    }
    if (!objc_msgSend(v7, "type"))
    {
      -[_MPCQueueControllerBehaviorMusic _itemForContentItemID:](self, "_itemForContentItemID:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemDidBeginPlayback:", v18);

    }
  }

}

+ (id)makeExtensionWithInvalidatable:(id)a3
{
  id v3;
  _MPCQueueControllerBehaviorMusicTransportableExtension *v4;

  v3 = a3;
  v4 = -[_MPCQueueControllerBehaviorMusicTransportableExtension initWithInvalidatable:]([_MPCQueueControllerBehaviorMusicTransportableExtension alloc], "initWithInvalidatable:", v3);

  return v4;
}

- (void)setMusicBehaviorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_musicBehaviorDelegate, a3);
}

- (void)didConnectToHost:(id)a3
{
  NSDictionary *lastEmittedBehaviorMetadata;
  NSMutableDictionary *dataSources;
  _QWORD v6[5];

  lastEmittedBehaviorMetadata = self->_lastEmittedBehaviorMetadata;
  self->_lastEmittedBehaviorMetadata = 0;

  -[_MPCQueueControllerBehaviorMusic _emitEventsForPlaybackBehaviorChangeIfNeeded](self, "_emitEventsForPlaybackBehaviorChangeIfNeeded");
  dataSources = self->_dataSources;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53___MPCQueueControllerBehaviorMusic_didConnectToHost___block_invoke;
  v6[3] = &unk_24CAB31D0;
  v6[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSources, "enumerateKeysAndObjectsUsingBlock:", v6);
}

- (void)_emitEventsForPlaybackBehaviorChangeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *lastEmittedBehaviorMetadata;
  NSDictionary *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v19[0] = CFSTR("repeat-type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_repeatType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v19[1] = CFSTR("shuffle-type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_shuffleType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v4;
  v19[2] = CFSTR("autoplay-mode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[_MPCQueueControllerBehaviorMusic _autoplayMode](self, "_autoplayMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  v7 = self->_lastEmittedBehaviorMetadata;
  lastEmittedBehaviorMetadata = v6;
  if (v7 == v6)
  {
LABEL_8:

    goto LABEL_9;
  }
  v9 = v7;
  v10 = -[NSDictionary isEqual:](v7, "isEqual:", v6);

  if ((v10 & 1) == 0)
  {
    -[_MPCQueueControllerBehaviorMusic host](self, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("session-id");
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17[1] = CFSTR("playback-behavior-metadata");
    v18[0] = v14;
    v18[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "emitEventType:payload:", CFSTR("playback-behavior-changed"), v15);

    if (!v13)
    v16 = v6;
    lastEmittedBehaviorMetadata = self->_lastEmittedBehaviorMetadata;
    self->_lastEmittedBehaviorMetadata = v16;
    goto LABEL_8;
  }
LABEL_9:

}

- (int64_t)_autoplayMode
{
  unint64_t autoPlayState;

  autoPlayState = self->_autoPlayState;
  if (autoPlayState > 9)
    return 1;
  else
    return qword_210ED9280[autoPlayState];
}

- (BOOL)_allDataSourcesSupportInsertionPositionLast
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MPShuffleableSectionedIdentifierList allSectionIdentifiers](self->_identifierList, "allSectionIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_msgSend(v8, "isFrozen") & 1) != 0 ? 0 : objc_msgSend(v8, "containsLiveStream");
      v10 = objc_msgSend(v8, "shouldRequestAdditionalItemsAtTail");

      v11 = 0;
      if ((v9 & 1) != 0 || (v10 & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v11 = 1;
  }

  return v11;
}

- (BOOL)canUserChangeRepeatTypeWithReason:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if ((self->_activeItemFlags & 1) != 0)
  {
    v12 = 0;
    if (a3)
      *a3 = CFSTR("in autoplay");
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[MPShuffleableSectionedIdentifierList allSectionIdentifiers](self->_identifierList, "allSectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "shouldRequestAdditionalItemsAtTail"))
          {
            if (a3)
            {
              v13 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v11, "playbackContext");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringWithFormat:", CFSTR("datasource %@ does not support repeat (infinite tracklist)"), objc_opt_class());
              goto LABEL_18;
            }
LABEL_19:

            v12 = 0;
            goto LABEL_20;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_msgSend(v11, "section:supportsShuffleType:", v10, 1) & 1) == 0
            && (objc_msgSend(v11, "section:supportsShuffleType:", v10, 2) & 1) == 0)
          {
            if (a3)
            {
              v16 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v11, "playbackContext");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringWithFormat:", CFSTR("datasource %@ does not support repeat"), objc_opt_class());
LABEL_18:
              *a3 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_19;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_20:

  }
  return v12;
}

- (BOOL)canUserChangeShuffleModeWithReason:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((self->_activeItemFlags & 1) != 0)
  {
    v12 = 0;
    if (a3)
      *a3 = CFSTR("in autoplay");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[MPShuffleableSectionedIdentifierList allSectionIdentifiers](self->_identifierList, "allSectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_msgSend(v11, "section:supportsShuffleType:", v10, 1) & 1) == 0
            && (objc_msgSend(v11, "section:supportsShuffleType:", v10, 2) & 1) == 0)
          {
            if (a3)
            {
              v13 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v11, "playbackContext");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringWithFormat:", CFSTR("datasource %@ does not support shuffle"), objc_opt_class());
              *a3 = (id)objc_claimAutoreleasedReturnValue();

            }
            v12 = 0;
            goto LABEL_18;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_18:

  }
  return v12;
}

- (_MPCQueueControllerBehaviorMusic)initWithCoder:(id)a3
{
  id v4;
  _MPCQueueControllerBehaviorMusic *v5;
  _MPCQueueControllerBehaviorMusic *v6;

  v4 = a3;
  v5 = -[_MPCQueueControllerBehaviorMusic init](self, "init");
  v6 = v5;
  if (v5)
    -[_MPCQueueControllerBehaviorMusic _initializeWithCoder:](v5, "_initializeWithCoder:", v4);

  return v6;
}

- (void)_initializeWithCoder:(id)a3
{
  id v4;
  MPShuffleableSectionedIdentifierList *v5;
  MPShuffleableSectionedIdentifierList *identifierList;
  MPShuffleableSectionedIdentifierList *v7;
  MPSectionedIdentifierList *v8;
  MPSectionedIdentifierList *autoPlayIdentifierList;
  MPSectionedIdentifierListPosition *v10;
  MPSectionedIdentifierListPosition *autoPlayEndPosition;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *dataSources;
  NSObject *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  NSString *v26;
  NSString *latestUpNextSectionID;
  NSString **p_latestUpNextSectionID;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_wasDecoded = 1;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("il"));
  v5 = (MPShuffleableSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
  identifierList = self->_identifierList;
  self->_identifierList = v5;

  v7 = self->_identifierList;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 2, CFSTR("Failed to decode identifierList"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v33);
LABEL_27:

    goto LABEL_28;
  }
  -[MPShuffleableSectionedIdentifierList setDelegate:](v7, "setDelegate:", self);
  -[MPShuffleableSectionedIdentifierList setAnnotationDelegate:](self->_identifierList, "setAnnotationDelegate:", self);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apil"));
  v8 = (MPSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
  autoPlayIdentifierList = self->_autoPlayIdentifierList;
  self->_autoPlayIdentifierList = v8;

  -[MPSectionedIdentifierList setDelegate:](self->_autoPlayIdentifierList, "setDelegate:", self);
  -[MPSectionedIdentifierList setAnnotationDelegate:](self->_autoPlayIdentifierList, "setAnnotationDelegate:", self);
  self->_repeatType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rt"));
  self->_shuffleType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("st"));
  self->_autoPlayState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("aps"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apep"));
  v10 = (MPSectionedIdentifierListPosition *)objc_claimAutoreleasedReturnValue();
  autoPlayEndPosition = self->_autoPlayEndPosition;
  self->_autoPlayEndPosition = v10;

  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("apit"));
  self->_autoPlayIsTriggered = v12;
  if (self->_autoPlayIdentifierList && (v12 & 1) == 0)
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v14;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[AOT:…:%{public}@] initializeWithCoder: | setting autoPlayIsTriggered = YES [decoded non-nil autoPlayIdentifierList]", buf, 0xCu);

    }
    self->_autoPlayIsTriggered = 1;
  }
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("ds"));
  v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  dataSources = self->_dataSources;
  self->_dataSources = v19;

  if (!self->_dataSources)
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v22;
      v47 = 2114;
      v48 = v23;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_FAULT, "[PSP:…:%{public}@] initializeWithCoder: | error detected [dataSources failed to decode] decoder.error=%{public}@", buf, 0x16u);

    }
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v25 = self->_dataSources;
    self->_dataSources = v24;

  }
  self->_hasUserMutations = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hum"));
  -[MPShuffleableSectionedIdentifierList setAutomaticallyReversesNonDestructiveDataSourceEdits:](self->_identifierList, "setAutomaticallyReversesNonDestructiveDataSourceEdits:", 0);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lups"));
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    p_latestUpNextSectionID = &self->_latestUpNextSectionID;
    latestUpNextSectionID = self->_latestUpNextSectionID;
    self->_latestUpNextSectionID = v26;

    if (!self->_latestUpNextSectionID)
    {
      -[MPShuffleableSectionedIdentifierList orderedSectionIdentifiers](self->_identifierList, "orderedSectionIdentifiers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSectionedIdentifierList orderedSectionIdentifiers](self->_autoPlayIdentifierList, "orderedSectionIdentifiers");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      if (v30)
        v32 = v30;
      else
        v32 = MEMORY[0x24BDBD1A8];
      objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v33, "reverseObjectEnumerator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v41 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            if (objc_msgSend(v39, "hasPrefix:", CFSTR("UPNXT-")))
              objc_storeStrong((id *)p_latestUpNextSectionID, v39);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v36);
      }

      goto LABEL_27;
    }
  }
LABEL_28:

}

- (void)connectToHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (void)setHostingSharedSessionID:(id)a3 reason:(id)a4
{
  NSString *v7;
  id v8;
  NSString *v9;
  NSString *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *activeHostingSharedSessionID;
  void *v18;
  MRGroupSession *activeGroupSession;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MRGroupSession *v24;
  MRGroupSession *v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v7 = (NSString *)a3;
  v8 = a4;
  v9 = self->_activeHostingSharedSessionID;
  if (v9 == v7)
  {

  }
  else
  {
    v10 = v9;
    v11 = -[NSString isEqual:](v9, "isEqual:", v7);

    if ((v11 & 1) == 0)
    {
      -[_MPCQueueControllerBehaviorMusic host](self, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (self->_activeHostingSharedSessionID)
      {
        objc_msgSend(v12, "eventStream");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = CFSTR("session-id");
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        activeHostingSharedSessionID = self->_activeHostingSharedSessionID;
        v29[0] = v16;
        v29[1] = activeHostingSharedSessionID;
        v28[1] = CFSTR("shared-session-id");
        v28[2] = CFSTR("shared-session-event-reason");
        v29[2] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "emitEventType:payload:", CFSTR("shared-session-end"), v18);

        if (!v15)
      }
      objc_storeStrong((id *)&self->_activeHostingSharedSessionID, a3);
      activeGroupSession = self->_activeGroupSession;
      self->_activeGroupSession = 0;

      if (v7)
      {
        objc_msgSend(v13, "eventStream");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = CFSTR("session-id");
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (!v21)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v27[0] = v22;
        v27[1] = v7;
        v26[1] = CFSTR("shared-session-id");
        v26[2] = CFSTR("shared-session-type");
        v26[3] = CFSTR("shared-session-event-reason");
        v27[2] = &unk_24CB16AD0;
        v27[3] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "emitEventType:payload:", CFSTR("shared-session-begin"), v23);

        if (!v21)
        objc_msgSend(MEMORY[0x24BE65508], "remoteControlGroupSessionWithIdentifier:delegate:", v7, self);
        v24 = (MRGroupSession *)objc_claimAutoreleasedReturnValue();
        v25 = self->_activeGroupSession;
        self->_activeGroupSession = v24;

      }
    }
  }

}

- (id)finalizeStateRestorationWithTargetContentItemID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  dispatch_group_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _MPCQueueControllerBehaviorMusic *v26;
  id v27;
  id v28;
  dispatch_group_t v29;

  v6 = a3;
  v7 = a4;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)-[NSMutableDictionary copy](self->_dataSources, "copy");
  v13 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke;
  v24[3] = &unk_24CAB32C0;
  v25 = v8;
  v26 = self;
  v27 = v11;
  v14 = v10;
  v28 = v14;
  v29 = v9;
  v15 = v9;
  v16 = v11;
  v17 = v8;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v24);

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_212;
  v21[3] = &unk_24CAB98A8;
  v21[4] = self;
  v22 = v14;
  v23 = v7;
  v18 = v7;
  v19 = v14;
  dispatch_group_notify(v15, MEMORY[0x24BDAC9B8], v21);

  return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p identifierList=%@>"), objc_opt_class(), self, self->_identifierList);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("## BehaviorMusic <%p> [%@]\n"), self, v4);

  -[_MPCQueueControllerBehaviorMusic identifierList](self, "identifierList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_MPCQueueControllerBehaviorMusic autoPlayEnabled](self, "autoPlayEnabled"))
  {
    -[_MPCQueueControllerBehaviorMusic autoPlayIdentifierList](self, "autoPlayIdentifierList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[_MPCQueueControllerBehaviorMusic _stateDictionaryIncludingQueue:](self, "_stateDictionaryIncludingQueue:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!self->_dataSources)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 282, CFSTR("Attempt to encode BehaviorMusic without _dataSources"));

    v5 = v7;
  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifierList, CFSTR("il"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_autoPlayIdentifierList, CFSTR("apil"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_dataSources, CFSTR("ds"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_repeatType, CFSTR("rt"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_shuffleType, CFSTR("st"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_hasUserMutations, CFSTR("hum"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_autoPlayState, CFSTR("aps"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_autoPlayEndPosition, CFSTR("apep"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_autoPlayIsTriggered, CFSTR("apit"));
  if (_os_feature_enabled_impl())
    objc_msgSend(v7, "encodeObject:forKey:", self->_latestUpNextSectionID, CFSTR("lups"));

}

- (void)restoreWithSharedCoder:(id)a3 block:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, id))a4;
  v7 = a3;
  -[_MPCQueueControllerBehaviorMusic _initializeWithCoder:](self, "_initializeWithCoder:", v7);
  objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nci"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!-[_MPCQueueControllerBehaviorMusic itemExistsForContentItemID:](self, "itemExistsForContentItemID:", v8))
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[PSP:…:%{public}@] restoreWithSharedCoder:block: | ignoring nextContentItemID [item does not exist] nextContentItemID=%{public}@", (uint8_t *)&v12, 0x16u);

    }
    goto LABEL_7;
  }
  v9 = v8;
LABEL_8:
  v6[2](v6, v9);

}

- (_MPCQueueControllerBehaviorMusic)initWithSessionID:(id)a3
{
  id v4;
  _MPCQueueControllerBehaviorMusic *v5;
  uint64_t v6;
  MPShuffleableSectionedIdentifierList *identifierList;
  MPSectionedIdentifierList *autoPlayIdentifierList;
  NSMutableDictionary *v9;
  NSMutableDictionary *dataSources;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MPCQueueControllerBehaviorMusic;
  v5 = -[_MPCQueueControllerBehaviorMusic init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDDCBF0]), "initWithIdentifier:", v4);
    identifierList = v5->_identifierList;
    v5->_identifierList = (MPShuffleableSectionedIdentifierList *)v6;

    -[MPShuffleableSectionedIdentifierList setDelegate:](v5->_identifierList, "setDelegate:", v5);
    -[MPShuffleableSectionedIdentifierList setAnnotationDelegate:](v5->_identifierList, "setAnnotationDelegate:", v5);
    v5->_repeatType = 0;
    autoPlayIdentifierList = v5->_autoPlayIdentifierList;
    v5->_autoPlayIdentifierList = 0;
    v5->_autoPlayState = 0;

    v5->_autoPlayIsTriggered = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataSources = v5->_dataSources;
    v5->_dataSources = v9;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MPShuffleableSectionedIdentifierList setDelegate:](self->_identifierList, "setDelegate:", 0);
  -[MPShuffleableSectionedIdentifierList setAnnotationDelegate:](self->_identifierList, "setAnnotationDelegate:", 0);
  -[MPSectionedIdentifierList setDelegate:](self->_autoPlayIdentifierList, "setDelegate:", 0);
  -[MPSectionedIdentifierList setAnnotationDelegate:](self->_autoPlayIdentifierList, "setAnnotationDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_MPCQueueControllerBehaviorMusic;
  -[_MPCQueueControllerBehaviorMusic dealloc](&v3, sel_dealloc);
}

- (void)disconnectFromHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, 0);
}

- (int64_t)playbackPositionRestorationPolicy
{
  return 1;
}

- (id)performLoadCommand:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _MPCQueueControllerBehaviorMusic *v23;
  id v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(v7, "playbackQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v11 = objc_msgSend(v9, "canLoadQueue:reason:", v10, &v25);
  v12 = v25;

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 424, CFSTR("unsupported playback queue: %@"), v12);

  }
  objc_msgSend(v7, "playbackQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_MPCQueueControllerBehaviorMusic _playbackContextOptions](self, "_playbackContextOptions");
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __66___MPCQueueControllerBehaviorMusic_performLoadCommand_completion___block_invoke;
  v21[3] = &unk_24CAB7A78;
  v23 = self;
  v24 = v8;
  v22 = v7;
  v16 = v7;
  v17 = v8;
  objc_msgSend(v14, "getMusicPlaybackContextWithOptions:completion:", v15, v21);

  -[_MPCQueueControllerBehaviorMusic contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", 0, 2, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nextObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)activeItemFlagsDidChange:(unsigned __int16)a3
{
  if ((a3 & 1) != 0)
    -[_MPCQueueControllerBehaviorMusic _setRepeatType:](self, "_setRepeatType:", 0);
  self->_activeItemFlags = a3;
}

- (BOOL)itemExistsForContentItemID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSMutableDictionary *dataSources;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "type");
  if (v8)
  {
    switch(v9)
    {
      case 0:
        objc_msgSend(v6, "itemID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "hasItem:inSection:", v10, v11))
        {
          objc_msgSend(v6, "itemID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sectionID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v8, "isDeletedItem:inSection:", v12, v13) ^ 1;

        }
        else
        {
          LOBYTE(v14) = 0;
        }

        goto LABEL_42;
      case 1:
        objc_msgSend(v6, "itemID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "hasItem:inSection:", v17, v18) & 1) == 0)
        {

          goto LABEL_38;
        }
        objc_msgSend(v6, "itemID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v8, "isDeletedItem:inSection:", v19, v20);

        if ((v21 & 1) != 0)
          goto LABEL_38;
        dataSources = self->_dataSources;
        objc_msgSend(v6, "sectionID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](dataSources, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sectionID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 504, CFSTR("DataSource does not exists for section: %@ [ItemPlaceholder] contentItemID: %@"), v46, v5);

        }
        objc_msgSend(v6, "itemID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = objc_msgSend(v24, "shouldUsePlaceholderForItem:inSection:", v25, v26);

        goto LABEL_23;
      case 2:
        v27 = self->_dataSources;
        objc_msgSend(v6, "sectionID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_msgSend(v15, "state") == 1;
          goto LABEL_15;
        }
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[NSMutableDictionary allValues](self->_dataSources, "allValues");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (!v39)
          goto LABEL_36;
        v40 = v39;
        v41 = *(_QWORD *)v49;
        break;
      case 3:
        objc_msgSend(v6, "deferredNextContentItemID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "sectionID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "itemID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sectionID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v31, "hasItem:inSection:", v32, v33);

        if (v14)
        {
          v34 = self->_dataSources;
          objc_msgSend(v6, "sectionID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "sectionID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 535, CFSTR("DataSource does not exists for section: %@ [ItemPlaceholder] contentItemID: %@"), v47, v5);

          }
          v37 = objc_msgSend(v36, "state");

          if (v37 != 2)
          {

            goto LABEL_38;
          }
        }

LABEL_23:
        goto LABEL_42;
      default:
        goto LABEL_38;
    }
    while (2)
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(v38);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "state") != 1)
        {
          LOBYTE(v14) = 0;
          goto LABEL_40;
        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v40)
        continue;
      break;
    }
LABEL_36:
    LOBYTE(v14) = 1;
LABEL_40:

    goto LABEL_41;
  }
  if (v9 == 1)
  {
    objc_msgSend(v6, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("_PLACEHOLDER_AUTOPLAY_")))
    {
      v16 = self->_autoPlayState == 9;
LABEL_15:
      LOBYTE(v14) = v16;
    }
    else
    {
      LOBYTE(v14) = 0;
    }
LABEL_41:

    goto LABEL_42;
  }
LABEL_38:
  LOBYTE(v14) = 0;
LABEL_42:

  return v14;
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v6 = a3;
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasItem:inSection:", v8, v9)
    && (objc_msgSend(v10, "isDeletedItem:inSection:", v8, v9) & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "canJumpToItem:reason:", v8, a4);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contentItemID (%@) not found"), v6);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEmpty
{
  return -[_MPCQueueControllerBehaviorMusic displayItemCount](self, "displayItemCount") == 0;
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t autoPlayState;
  __CFString *v13;
  MPSectionedIdentifierListPosition *autoPlayEndPosition;
  uint64_t v15;
  void *v16;
  const __CFString *latestUpNextSectionID;
  NSString *playNowInsertionContentItemID;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v32[11];
  _QWORD v33[13];

  v3 = a3;
  v33[11] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self, CFSTR("__obj"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_state == 1)
    v7 = CFSTR("Ready");
  else
    v7 = CFSTR("Loading");
  v33[0] = v5;
  v33[1] = v7;
  v32[1] = CFSTR("_state");
  v32[2] = CFSTR("_allowsQueueModifications");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_MPCQueueControllerBehaviorMusic allowsQueueModifications](self, "allowsQueueModifications"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v8;
  v32[3] = CFSTR("_repeatType");
  MPRepeatTypeDescription();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v9;
  v32[4] = CFSTR("_shuffleType");
  MPShuffleTypeDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v10;
  v32[5] = CFSTR("_hasUserMutations");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasUserMutations);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v11;
  v32[6] = CFSTR("_autoPlayState");
  autoPlayState = self->_autoPlayState;
  if (autoPlayState >= 0xA)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedState:%ld"), self->_autoPlayState);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_24CAB3730[autoPlayState];
  }
  autoPlayEndPosition = self->_autoPlayEndPosition;
  if (!autoPlayEndPosition)
    autoPlayEndPosition = (MPSectionedIdentifierListPosition *)CFSTR("@");
  v33[6] = v13;
  v33[7] = autoPlayEndPosition;
  v32[7] = CFSTR("_autoPlayEndPosition");
  v32[8] = CFSTR("__wasDecoded");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wasDecoded);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  latestUpNextSectionID = (const __CFString *)self->_latestUpNextSectionID;
  playNowInsertionContentItemID = self->_playNowInsertionContentItemID;
  if (!latestUpNextSectionID)
    latestUpNextSectionID = CFSTR("@");
  v33[8] = v15;
  v33[9] = latestUpNextSectionID;
  v32[9] = CFSTR("_latestUpNextSectionID");
  v32[10] = CFSTR("_playNowInsertionContentItemID");
  if (playNowInsertionContentItemID)
    v19 = (const __CFString *)playNowInsertionContentItemID;
  else
    v19 = CFSTR("@");
  v33[10] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v21 = (void *)objc_msgSend(v20, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MPShuffleableSectionedIdentifierList itemCount](self->_identifierList, "itemCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("~_identifierListItemCount"));

    -[MPShuffleableSectionedIdentifierList debugDescription](self->_identifierList, "debugDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("\n"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (const __CFString *)v24;
    else
      v26 = CFSTR("@");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("~identifierList"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MPSectionedIdentifierList itemCount](self->_autoPlayIdentifierList, "itemCount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("~_autoPlayIdentifierListItemCount"));

    -[MPSectionedIdentifierList debugDescription](self->_autoPlayIdentifierList, "debugDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsSeparatedByString:", CFSTR("\n"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, CFSTR("~autoPlayIdentifierList"));

    v30 = objc_msgSend(v21, "copy");
    v20 = (void *)v30;
  }
  return v20;
}

- (int64_t)preferredUpcomingItemCount
{
  NSMutableDictionary *dataSources;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  dataSources = self->_dataSources;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62___MPCQueueControllerBehaviorMusic_preferredUpcomingItemCount__block_invoke;
  v12[3] = &unk_24CAB31F8;
  v12[4] = self;
  v12[5] = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSources, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (self->_autoPlayState == 9)
  {
    -[_MPCQueueControllerBehaviorMusic _accountForAutoPlay](self, "_accountForAutoPlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "radioConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v14[3];
    v8 = objc_msgSend(v6, "continueListeningMaxUpcomingTracksSizeToMaintain");
    if (v7 <= v8)
      v9 = v8;
    else
      v9 = v7;
    v14[3] = v9;

  }
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)loadAdditionalUpcomingItems:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  dispatch_group_t v8;
  uint64_t v9;
  NSMutableDictionary *dataSources;
  NSObject *v11;
  id v12;
  void *v13;
  id loadAdditionalItemsCompletion;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  NSObject *v21;
  id v22;
  uint64_t *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v8 = dispatch_group_create();
  v9 = MEMORY[0x24BDAC760];
  dataSources = self->_dataSources;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke;
  v20[3] = &unk_24CAB3248;
  v20[4] = self;
  v11 = v8;
  v21 = v11;
  v24 = a3;
  v12 = v7;
  v22 = v12;
  v23 = &v25;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSources, "enumerateKeysAndObjectsUsingBlock:", v20);
  if (!*((_BYTE *)v26 + 24)
    || (v18[0] = v9,
        v18[1] = 3221225472,
        v18[2] = __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke_142,
        v18[3] = &unk_24CAB9720,
        v19 = v6,
        dispatch_group_notify(v11, MEMORY[0x24BDAC9B8], v18),
        v19,
        !*((_BYTE *)v26 + 24)))
  {
    if (self->_autoPlayState == 9)
    {
      v13 = _Block_copy(v6);
      loadAdditionalItemsCompletion = self->_loadAdditionalItemsCompletion;
      self->_loadAdditionalItemsCompletion = v13;

      self->_autoPlayIsTriggered = 1;
      v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "engineID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v16;
        v31 = 2114;
        v32 = v17;
        _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] loadAdditionalUpcomingItems:completion: | evaluating autoPlayIsTriggered [loadAdditionalUpcomingItems called while WaitingForTriggerToEnable] triggered=YES", buf, 0x16u);

      }
      -[_MPCQueueControllerBehaviorMusic _transitionToAutoPlayState:](self, "_transitionToAutoPlayState:", 9);
    }
  }

  _Block_object_dispose(&v25, 8);
}

- (BOOL)containsRestorableContent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char isKindOfClass;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[NSMutableDictionary count](self->_dataSources, "count")
    || !-[MPShuffleableSectionedIdentifierList itemCount](self->_identifierList, "itemCount"))
  {
    return 0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_dataSources, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v10 = 0;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_14:

  return v10;
}

- (void)didReachEndOfQueueWithReason:(id)a3
{
  if (self->_autoPlayState == 8)
    -[_MPCQueueControllerBehaviorMusic _transitionToAutoPlayState:](self, "_transitionToAutoPlayState:", 3);
}

- (void)setRepeatType:(int64_t)a3 completion:(id)a4
{
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 1113, CFSTR("User default should be resolved before setting on queue controller."));

  }
  -[_MPCQueueControllerBehaviorMusic _setRepeatType:](self, "_setRepeatType:", a3);
  v8[2](v8, 0);

}

- (void)setShuffleType:(int64_t)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a5;
  -[_MPCQueueControllerBehaviorMusic _setShuffleType:startingContentItemID:randomSource:](self, "_setShuffleType:startingContentItemID:randomSource:", a3, a4, 0);
  v8[2](v8, 0);

}

- (void)reshuffleWithTargetContentItemID:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  int64_t shuffleType;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginEditWithReason:", CFSTR("BehaviorMusic-reshuffle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  shuffleType = self->_shuffleType;
  if (shuffleType)
    -[MPShuffleableSectionedIdentifierList setShuffleType:](self->_identifierList, "setShuffleType:", 0);
  self->_shuffleType = 1;
  -[MPShuffleableSectionedIdentifierList setShuffleType:](self->_identifierList, "setShuffleType:", 1);
  -[_MPCQueueControllerBehaviorMusic contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", 0, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuggestedContentItemIDForStart:", v10);
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] reshuffleWithTargetContentItemID:completion: | committing edit [update after reshuffle] sugggestedStartingContentItemID=%{public}@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(v7, "commit");
  if (!shuffleType)
  {
    -[_MPCQueueControllerBehaviorMusic _emitEventsForPlaybackBehaviorChangeIfNeeded](self, "_emitEventsForPlaybackBehaviorChangeIfNeeded");
    WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    objc_msgSend(WeakRetained, "behavior:didChangeShuffleType:", self, 1);

  }
  v5[2](v5, 0);

}

- (void)setAutoPlayEnabled:(BOOL)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unint64_t autoPlayState;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MPSectionedIdentifierListPosition *v21;
  MPSectionedIdentifierListPosition *autoPlayEndPosition;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v6 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[_MPCQueueControllerBehaviorMusic _setRepeatType:](self, "_setRepeatType:", 0);
  switch(self->_autoPlayState)
  {
    case 0:
    case 1:
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "engineID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        autoPlayState = self->_autoPlayState;
        if (autoPlayState >= 0xA)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedState:%ld"), self->_autoPlayState);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = off_24CAB3730[autoPlayState];
        }
        *(_DWORD *)buf = 138544130;
        v27 = v12;
        v28 = 2114;
        v29 = v13;
        v30 = 2114;
        v31 = v15;
        v32 = 1024;
        v33 = v6;
        _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] setAutoPlayEnabled:targetContentItemID:completion: | ignoring setter [autoPlayState=%{public}@] autoPlayEnabled:%{BOOL}u", buf, 0x26u);

      }
      goto LABEL_32;
    case 2:
      if (v6)
        goto LABEL_25;
      if ((self->_activeItemFlags & 1) != 0)
        goto LABEL_21;
      v16 = 1;
      goto LABEL_28;
    case 3:
      if (v6)
        goto LABEL_25;
      if ((self->_activeItemFlags & 1) == 0)
        goto LABEL_32;
      goto LABEL_21;
    case 4:
      if (v6)
        goto LABEL_32;
      v16 = 5;
      goto LABEL_28;
    case 5:
      if (!v6)
        goto LABEL_19;
      v16 = 4;
      goto LABEL_28;
    case 6:
    case 7:
    case 9:
      if (v6)
        goto LABEL_32;
LABEL_19:
      if ((self->_activeItemFlags & 1) == 0)
        goto LABEL_20;
LABEL_21:
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDDCBC0];
      objc_msgSend(v17, "itemID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sectionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "positionForItem:inSection:", v19, v20);
      v21 = (MPSectionedIdentifierListPosition *)objc_claimAutoreleasedReturnValue();
      autoPlayEndPosition = self->_autoPlayEndPosition;
      self->_autoPlayEndPosition = v21;

      v16 = 8;
      goto LABEL_28;
    case 8:
      if (v6)
      {
        if (self->_autoPlayIdentifierList)
        {
          v16 = 7;
        }
        else
        {
LABEL_25:
          v23 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "engineID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v27 = v24;
            v28 = 2114;
            v29 = v25;
            _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] setAutoPlayEnabled:targetContentItemID:completion: | autoplay waiting for trigger [set enabled]", buf, 0x16u);

          }
          v16 = 9;
        }
        goto LABEL_28;
      }
      if ((self->_activeItemFlags & 1) == 0)
      {
LABEL_20:
        v16 = 3;
LABEL_28:
        -[_MPCQueueControllerBehaviorMusic _transitionToAutoPlayState:](self, "_transitionToAutoPlayState:", v16);
      }
LABEL_32:
      v9[2](v9, 0);

      return;
    default:
      goto LABEL_32;
  }
}

- (BOOL)isAutoPlayContentItemID:(id)a3
{
  void *v3;
  _BOOL8 v4;

  if (a3)
  {
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "behaviorFlags") & 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)getSharedQueueTracklistWithStartingContentItemID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  MPSectionedIdentifierList *autoPlayIdentifierList;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *dataSources;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  MPSectionedIdentifierList *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  char v61;
  char v62;
  id v63;
  id v64;
  void *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  id v80;

  v80 = a3;
  v6 = a4;
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v80);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:](_MPCQueueControllerEnumerator, "enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:", self, 0, 1, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BE65C68]);
  v79 = 0;
  v10 = 0;
  v11 = 0;
  while (1)
  {
    v12 = v11;
    objc_msgSend(v8, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      break;
    v13 = objc_msgSend(v11, "entryType");
    switch(v13)
    {
      case 2:
        autoPlayIdentifierList = self->_autoPlayIdentifierList;
        objc_msgSend(v11, "trackingEntryResult");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sectionIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(autoPlayIdentifierList) = -[MPSectionedIdentifierList hasSection:](autoPlayIdentifierList, "hasSection:", v24);

        if ((_DWORD)autoPlayIdentifierList)
          goto LABEL_50;
        break;
      case 4:
        objc_msgSend(v11, "trackingEntryResult");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        dataSources = self->_dataSources;
        objc_msgSend(v25, "sectionIdentifier");
        v27 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](dataSources, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v27) = objc_msgSend(v28, "shouldRequestAdditionalItemsAtTail");
        if ((v27 & 1) != 0)
          goto LABEL_50;
        break;
      case 3:
        objc_msgSend(v11, "itemResult");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = self->_dataSources;
        objc_msgSend(v14, "sectionIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dataSource");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "sectionIdentifier");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "identifier");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v75 = v7;
        v76 = v9;
        v72 = v14;
        if (v18 != v19)
        {
          v20 = v19;
          v21 = objc_msgSend(v18, "isEqual:", v19);

          if ((v21 & 1) != 0)
          {
            v9 = v76;
            goto LABEL_31;
          }
          objc_msgSend(v14, "itemIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sectionIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "modelPlayEventForItem:inSection:", v30, v31);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = objc_msgSend(v29, "itemType");
          if (v32 == 4)
          {
            objc_msgSend(v29, "radioStation");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "identifiers");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "radio");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stationStringID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
              goto LABEL_28;
            v42 = self->_autoPlayIdentifierList;
            objc_msgSend(v72, "sectionIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = -[MPSectionedIdentifierList hasSection:](v42, "hasSection:", v43);

            v45 = (void *)MEMORY[0x24BEC89A0];
            objc_msgSend(v29, "featureName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44)
              objc_msgSend(v45, "autoPlayContainerWithMediaIdentifier:featureName:", v35, v37);
            else
              objc_msgSend(v45, "radioContainerWithMediaIdentifier:featureName:", v35, v37);
            v38 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v32 != 3)
            {
              if (v32 == 1)
              {
                objc_msgSend(v29, "album");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "identifiers");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "preferredStoreStringIdentifierForPersonID:", 0);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v35)
                {
                  v36 = (void *)MEMORY[0x24BEC89A0];
                  objc_msgSend(v29, "featureName");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "albumContainerWithMediaIdentifier:featureName:", v35, v37);
                  v38 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_27;
                }
              }
LABEL_28:
              v50 = (void *)MEMORY[0x24BEC89A0];
              objc_msgSend(v29, "featureName");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "groupWithFeatureName:", v51);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
              objc_msgSend(v72, "sectionIdentifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setIdentifier:", v52);

              objc_msgSend(v76, "appendSection:", v49);
              v18 = v79;
              v79 = v49;
              v9 = v76;
              v14 = v72;
              goto LABEL_30;
            }
            objc_msgSend(v29, "playlist");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "identifiers");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "preferredStoreStringIdentifierForPersonID:", 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
              goto LABEL_28;
            v48 = (void *)MEMORY[0x24BEC89A0];
            objc_msgSend(v29, "featureName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "playlistContainerWithMediaIdentifier:featureName:", v35, v37);
            v38 = objc_claimAutoreleasedReturnValue();
          }
LABEL_27:
          v49 = (void *)v38;

          if (!v49)
            goto LABEL_28;
          goto LABEL_29;
        }

        v29 = v18;
LABEL_30:

LABEL_31:
        objc_msgSend(v14, "itemIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sectionIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "identifiersForItem:inSection:", v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v73 = v55;
        objc_msgSend(v55, "preferredStoreStringIdentifierForPersonID:", 0);
        v56 = objc_claimAutoreleasedReturnValue();
        v71 = (void *)v56;
        if (v56)
        {
          objc_msgSend(MEMORY[0x24BEC89A8], "itemWithMediaIdentifier:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "itemIdentifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setIdentifier:", v58);

          v74 = v57;
          objc_msgSend(v9, "appendItem:", v57);
        }
        else
        {
          v74 = 0;
        }
        v7 = v75;
        objc_msgSend(v75, "sectionID");
        v59 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sectionIdentifier");
        v60 = (id)objc_claimAutoreleasedReturnValue();
        if (v59 == v60)
        {

        }
        else
        {
          v61 = objc_msgSend(v59, "isEqual:", v60);

          if ((v61 & 1) == 0)
          {

            v62 = 1;
            goto LABEL_47;
          }
        }
        objc_msgSend(v75, "itemID");
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "itemIdentifier");
        v64 = (id)objc_claimAutoreleasedReturnValue();
        if (v63 == v64)
        {

LABEL_42:
          v7 = v75;
          if (v74)
          {
            v67 = objc_msgSend(v76, "numberOfSections") - 1;
            v68 = objc_msgSend(v76, "numberOfItemsInSection:", v67);
            v14 = v72;
            if (v10)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 1405, CFSTR("Start item was found multiple times while building shared queue tracklist."));

            }
            objc_msgSend(MEMORY[0x24BDD15D8], "msv_indexPathForItem:inSection:", v68 - 1, v67);
            v59 = v10;
            v62 = 1;
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 3, CFSTR("Start item was missing a media identifier while building shared queue tracklist: startingContentItemID=%@ identifiers=%@"), v80, v73, v71);
            v59 = (id)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v59);
            v62 = 0;
            v14 = v72;
          }
LABEL_47:

          v9 = v76;
          goto LABEL_48;
        }
        v65 = v64;
        v66 = objc_msgSend(v63, "isEqual:", v64);

        if ((v66 & 1) != 0)
          goto LABEL_42;
        v62 = 1;
        v7 = v75;
        v9 = v76;
        v14 = v72;
LABEL_48:

        if ((v62 & 1) == 0)
          goto LABEL_53;
        break;
    }
  }
LABEL_50:
  if (v10)
  {
    (*((void (**)(id, id, void *, _QWORD))v6 + 2))(v6, v9, v10, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 3, CFSTR("Failed to find the start item in the shared queue tracklist."));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v70);

  }
LABEL_53:

}

- (void)findFirstContentItemIDForItemIntersectingIdentifierSet:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSMutableDictionary *dataSources;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4877;
  v17 = __Block_byref_object_dispose__4878;
  v18 = 0;
  dataSources = self->_dataSources;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __102___MPCQueueControllerBehaviorMusic_findFirstContentItemIDForItemIntersectingIdentifierSet_completion___block_invoke;
  v10[3] = &unk_24CAB31F8;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSources, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7[2](v7, v14[5], 0);

  _Block_object_dispose(&v13, 8);
}

- (id)copyContentItemID:(id)a3 repeatIteration:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "repeatIteration") != a4)
  {
    v6 = objc_msgSend(v5, "copyWithRepeatIteration:", a4);

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "contentItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)prepareForCreateStationAfterContentItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableDictionary *dataSources;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _MPCQueueControllerBehaviorMusic *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditWithReason:", CFSTR("BehaviorMusic-prepareForCreateStation"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _setRepeatType:](self, "_setRepeatType:", 0);
  v28 = v4;
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDDCBC0];
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionForItem:inSection:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:](_MPCQueueControllerEnumerator, "enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:", self, 0, 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "nextObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      objc_msgSend(v13, "itemResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sectionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "itemResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "itemIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemResult");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sectionIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeItem:fromSection:", v18, v20);

      objc_msgSend(v11, "nextObject");
      v21 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v21;
    }
    while (v21);
  }
  dataSources = self->_dataSources;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __78___MPCQueueControllerBehaviorMusic_prepareForCreateStationAfterContentItemID___block_invoke;
  v29[3] = &unk_24CAB3338;
  v23 = v5;
  v30 = v23;
  v31 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSources, "enumerateKeysAndObjectsUsingBlock:", v29);
  if (!self->_hasUserMutations)
    self->_hasUserMutations = 1;
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v23, "engineID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v25;
    v34 = 2114;
    v35 = v26;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] prepareForCreateStationAfterContentItemID: | committing edit [queue updated]", buf, 0x16u);

  }
  objc_msgSend(v27, "commit");

}

- (id)lastSectionContentItemIDForTargetContentItemID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  -[_MPCQueueControllerBehaviorMusic tailInsertionContentItemIDForTargetContentItemID:](self, "tailInsertionContentItemIDForTargetContentItemID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[MPShuffleableSectionedIdentifierList orderedSectionIdentifiers](self->_identifierList, "orderedSectionIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPShuffleableSectionedIdentifierList enumeratorWithOptions:startPosition:endPosition:](self->_identifierList, "enumeratorWithOptions:startPosition:endPosition:", 24, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nextObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      if (objc_msgSend(v9, "entryType") == 3)
      {
        objc_msgSend(v9, "itemResult");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "itemResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sectionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "modelPlayEventForItem:inSection:", v11, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v16, "itemType") & 0xFFFFFFFFFFFFFFFDLL) == 1)
        {
          +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v13, v11);
          v19 = v11;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "contentItemID");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v19;
        }
        else
        {
          v5 = 0;
        }

      }
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)groupSessionDidConnect:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "participants");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCQueueControllerBehaviorMusic _updateGroupSessionParticipants:localParticipant:](self, "_updateGroupSessionParticipants:localParticipant:", v6, v5);
}

- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4
{
  MRGroupSession *activeGroupSession;

  activeGroupSession = self->_activeGroupSession;
  self->_activeGroupSession = 0;

}

- (void)groupSession:(id)a3 didUpdateParticipants:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(v5, "participants");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCQueueControllerBehaviorMusic _updateGroupSessionParticipants:localParticipant:](self, "_updateGroupSessionParticipants:localParticipant:", v7, v6);
}

- (void)_playNowIfPossible:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (!self->_playNowInsertionContentItemID)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0, 0);
      goto LABEL_21;
    }
    -[_MPCQueueControllerBehaviorMusic tailInsertionContentItemIDForTargetContentItemID:](self, "tailInsertionContentItemIDForTargetContentItemID:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0, 0);
LABEL_20:

      goto LABEL_21;
    }
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", self->_playNowInsertionContentItemID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _upNextSectionIdentifierForItem:](self, "_upNextSectionIdentifierForItem:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "mediaRemoteOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionDialogOptions"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("selectedAction"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("clearQueue")))
        {

LABEL_18:
          v17 = -[_MPCQueueControllerBehaviorMusic _playbackContextOptions](self, "_playbackContextOptions");
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke;
          v18[3] = &unk_24CAB7CC0;
          v18[4] = self;
          v19 = v7;
          objc_msgSend(v6, "getMusicPlaybackContextWithOptions:completion:", v17, v18);

          goto LABEL_19;
        }
      }
      else
      {
        if (objc_msgSend(v6, "replaceIntent") != 1)
          goto LABEL_18;
        -[_MPCQueueControllerBehaviorMusic host](self, "host");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "engineID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v21 = v15;
          v22 = 2114;
          v23 = v16;
          _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _playNowIfPossible: | deferring to SetQueue [replaceIntent = .clearUpNext]", buf, 0x16u);

        }
      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("playNowInsertionContentItemID is non-nil, but upNextSectionID is nil"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v12);
    }
LABEL_19:

    goto LABEL_20;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0, 0);
LABEL_21:

}

- (void)canReuseQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "canLoadQueue:reason:", v6, 0) & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke;
    v8[3] = &unk_24CAB33C8;
    v10 = v7;
    v8[4] = self;
    v9 = v6;
    -[_MPCQueueControllerBehaviorMusic _playNowIfPossible:completion:](self, "_playNowIfPossible:completion:", v9, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0, 0);
  }

}

- (void)setAllowsQueueModifications:(BOOL)a3
{
  -[MPShuffleableSectionedIdentifierList setAutomaticallyReversesNonDestructiveDataSourceEdits:](self->_identifierList, "setAutomaticallyReversesNonDestructiveDataSourceEdits:", !a3);
}

- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  int v16;

  v4 = a3;
  if (v4)
  {
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "type"))
    {
      v6 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[_MPCQueueControllerBehaviorMusic _upNextSectionIdentifierForItem:](self, "_upNextSectionIdentifierForItem:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _tailInsertionComponentsForUpNextSectionID:](self, "_tailInsertionComponentsForUpNextSectionID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    v10 = v9;
    if (objc_msgSend(v5, "repeatIteration"))
    {
      v11 = (void *)objc_msgSend(v5, "copyWithRepeatIteration:", 0);
      objc_msgSend(v11, "contentItemID");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "contentItemID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v12)
    {

    }
    else
    {
      v13 = objc_msgSend(v10, "isEqual:", v12);

      if (!v13)
        goto LABEL_13;
    }
    v14 = objc_msgSend(v5, "repeatIteration");

    if (!v14)
      goto LABEL_14;
    v12 = v8;
    v8 = (void *)objc_msgSend(v8, "copyWithRepeatIteration:", objc_msgSend(v5, "repeatIteration"));
LABEL_13:

LABEL_14:
    objc_msgSend(v8, "contentItemID");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    if (v15 == v9)
    {

    }
    else
    {
      v16 = objc_msgSend(v15, "isEqual:", v9);

      if (!v16)
        goto LABEL_19;
    }

    v6 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v6 = 0;
LABEL_21:

  return v6;
}

- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _MPCQueueControllerBehaviorMusic *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "playbackQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_MPCQueueControllerBehaviorMusic _playbackContextOptions](self, "_playbackContextOptions");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke;
  v17[3] = &unk_24CAB33F0;
  v21 = v9;
  v22 = v10;
  v18 = v11;
  v19 = v8;
  v20 = self;
  v13 = v9;
  v14 = v8;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v15, "getMusicPlaybackContextWithOptions:completion:", v12, v17);

}

- (void)_qfa_performInsertPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8
{
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  _MPCQueueControllerBehaviorMusicDataSourceState *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  _MPCQueueControllerBehaviorMusicDataSourceState *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _MPCQueueControllerBehaviorMusicDataSourceState *v43;
  char v44;
  char v45;
  NSObject *v46;
  void *v47;
  void *v48;
  _MPCQueueControllerBehaviorMusicDataSourceState *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  _MPCQueueControllerBehaviorMusicDataSourceState *v53;
  _MPCQueueControllerBehaviorMusicDataSourceState *v54;
  void *v55;
  void *v56;
  _MPCQueueControllerDataSourceState *v57;
  MPShuffleableSectionedIdentifierList *identifierList;
  _MPCQueueControllerBehaviorMusicDataSourceState *v59;
  _MPCQueueControllerBehaviorMusicDataSourceState *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  MPSectionedIdentifierList *autoPlayIdentifierList;
  _MPCQueueControllerBehaviorMusicDataSourceState *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  MPShuffleableSectionedIdentifierList *v74;
  MPShuffleableSectionedIdentifierList *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  _MPCQueueControllerBehaviorMusicDataSourceState *v84;
  _MPCQueueControllerBehaviorMusicDataSourceState *v85;
  void *v86;
  uint64_t v87;
  int64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  id v97;
  int v98;
  BOOL v99;
  _MPCQueueControllerBehaviorMusic *v100;
  uint64_t v101;
  id v102;
  NSObject *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  _MPCQueueControllerBehaviorMusicDataSourceState *v108;
  NSMutableDictionary *dataSources;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  _MPCQueueControllerBehaviorMusic *v117;
  id v118;
  _MPCQueueControllerBehaviorMusicDataSourceState *v119;
  NSMutableDictionary *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  MPShuffleableSectionedIdentifierList *v126;
  __CFString *v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  const char *v134;
  NSObject *v135;
  void *v136;
  void *v137;
  _MPCQueueControllerBehaviorMusicDataSourceState *v138;
  MPSectionedIdentifierList *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  void *v144;
  _MPCQueueControllerBehaviorMusicDataSourceState *v145;
  MPSectionedIdentifierList *v146;
  NSObject *v147;
  void *v148;
  void *v149;
  _MPCQueueControllerBehaviorMusicDataSourceState *v150;
  MPShuffleableSectionedIdentifierList *v151;
  NSObject *v152;
  void *v153;
  void *v154;
  _MPCQueueControllerBehaviorMusicDataSourceState *v155;
  MPSectionedIdentifierList *v156;
  MPSectionedIdentifierList *v157;
  uint64_t v158;
  uint64_t v159;
  MPSectionedIdentifierList *v160;
  void *v161;
  void *v162;
  MPSectionedIdentifierList *v163;
  void *v164;
  MPShuffleableSectionedIdentifierList *v165;
  MPShuffleableSectionedIdentifierList *v166;
  MPShuffleableSectionedIdentifierList *v167;
  MPShuffleableSectionedIdentifierList *v168;
  NSObject *v169;
  void *v170;
  void *v171;
  _MPCQueueControllerBehaviorMusicDataSourceState *v172;
  const char *v173;
  MPSectionedIdentifierList *v174;
  MPShuffleableSectionedIdentifierList *v175;
  MPShuffleableSectionedIdentifierList *v176;
  MPShuffleableSectionedIdentifierList *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  _MPCQueueControllerBehaviorMusicDataSourceState *v183;
  uint64_t v184;
  uint64_t v185;
  _MPCQueueControllerBehaviorMusicDataSourceState *v186;
  void *v187;
  id v188;
  MPShuffleableSectionedIdentifierList *v189;
  __CFString *v190;
  id v191;
  id v192;
  void *v193;
  id v194;
  SEL v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  _MPCQueueControllerBehaviorMusic *v200;
  _MPCQueueControllerBehaviorMusic *v201;
  _MPCQueueControllerBehaviorMusicDataSourceState *v202;
  void *v203;
  id WeakRetained;
  void *v205;
  unint64_t v206;
  void (**v207)(id, _QWORD, void *);
  id v208;
  void *v209;
  _QWORD aBlock[4];
  id v211;
  id v212;
  _MPCQueueControllerBehaviorMusic *v213;
  _MPCQueueControllerBehaviorMusicDataSourceState *v214;
  id v215;
  id v216;
  void (**v217)(id, _QWORD, void *);
  unint64_t v218;
  char v219;
  uint8_t buf[4];
  void *v221;
  __int16 v222;
  uint64_t v223;
  __int16 v224;
  _MPCQueueControllerBehaviorMusicDataSourceState *v225;
  __int16 v226;
  _MPCQueueControllerBehaviorMusicDataSourceState *v227;
  __int16 v228;
  uint64_t v229;
  __int16 v230;
  uint64_t v231;
  uint64_t v232;

  v232 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v208 = a5;
  v16 = a6;
  v207 = (void (**)(id, _QWORD, void *))a8;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != 2 || (a7 & 0x40) == 0)
  {
    v206 = a7;
    v195 = a2;
    if (a4 == 3)
    {
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v208);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "type") != 3)
      {
        a4 = 3;
        goto LABEL_23;
      }
      v32 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v209, "engineID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deferredNextContentItemID");
        v35 = v15;
        v36 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v221 = v33;
        v222 = 2114;
        v223 = (uint64_t)v34;
        v224 = 2114;
        v225 = v36;
        _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | converting PositionSpecified item to deferredNextContentItem [specified placeholder item] deferredNextContentItem=%{public}@", buf, 0x20u);

        v15 = v35;
      }

      objc_msgSend(v20, "deferredNextContentItemID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        v71 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v209, "engineID");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v221 = v72;
          v222 = 2114;
          v223 = (uint64_t)v73;
          _os_log_impl(&dword_210BD8000, v71, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil]", buf, 0x16u);

        }
        v30 = (void *)MEMORY[0x24BDD1540];
        v31 = CFSTR("The specified insertion position [specified] was unsupported because the specified item is a placeholder and there is no deferredNextContentItemAnchorID.");
        goto LABEL_40;
      }
    }
    else
    {
      if (a4)
      {
        v20 = 0;
        goto LABEL_23;
      }
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v208);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "type") != 3)
      {
        a4 = 0;
        goto LABEL_23;
      }
      v21 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v209, "engineID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deferredNextContentItemID");
        v24 = v15;
        v25 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v221 = v22;
        v222 = 2114;
        v223 = (uint64_t)v23;
        v224 = 2114;
        v225 = v25;
        _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | converting PositionHead to PositionSpecified after deferredNextContentItem [head (current item was placeholder)] deferredNextContentItem=%{public}@", buf, 0x20u);

        v15 = v24;
      }

      objc_msgSend(v20, "deferredNextContentItemID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v27 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v209, "engineID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v221 = v28;
          v222 = 2114;
          v223 = (uint64_t)v29;
          _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil]", buf, 0x16u);

        }
        v30 = (void *)MEMORY[0x24BDD1540];
        v31 = CFSTR("The specified insertion position [head] was unsupported because the current item is a placeholder and there is no deferredNextContentItemAnchorID.");
LABEL_40:
        objc_msgSend(v30, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, v31);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v207[2](v207, 0, v40);
LABEL_151:

        goto LABEL_152;
      }
    }
    objc_msgSend(v20, "deferredNextContentItemID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v38);
    v39 = objc_claimAutoreleasedReturnValue();

    a4 = 3;
    v20 = (void *)v39;
LABEL_23:
    v40 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BehaviorMusic-insertPlaybackContext-<%@: %p>"), objc_opt_class(), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "beginEditWithReason:", v41);
    v205 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    -[_MPCQueueControllerBehaviorMusic tailInsertionContentItemIDForTargetContentItemID:](self, "tailInsertionContentItemIDForTargetContentItemID:", v208);
    v42 = objc_claimAutoreleasedReturnValue();
    v203 = (void *)v42;
    if ((a7 & 0x40) == 0 || v42)
    {
      -[_MPCQueueControllerBehaviorMusic _upNextSectionIdentifierForItem:](self, "_upNextSectionIdentifierForItem:", v20);
      v43 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
    }
    else
    {
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v208);
      v43 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
      v44 = -[_MPCQueueControllerBehaviorMusicDataSourceState behaviorFlags](v43, "behaviorFlags");
      v45 = v44;
      if (a4 == 1 && (v44 & 1) != 0)
      {
        objc_msgSend(v205, "rollback");
        v46 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v209, "engineID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v221 = v47;
          v222 = 2114;
          v223 = (uint64_t)v48;
          _os_log_impl(&dword_210BD8000, v46, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | rolling back edit [cannot insert at end of autoPlayIdentifierList]", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("Cannot insert at end of autoPlayIdentifierList [no existing UpNextSection]"));
        v49 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        v207[2](v207, 0, v49);
        goto LABEL_150;
      }
      v197 = v40;
      v192 = v15;
      MSVNanoIDCreateTaggedPointer();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("UPNXT-"), "stringByAppendingString:", v50);
      v49 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_latestUpNextSectionID, v49);
      v51 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v209, "engineID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v53 = v49;
        v54 = v43;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v221 = v52;
        v222 = 2114;
        v223 = (uint64_t)v55;
        v224 = 2114;
        v225 = v53;
        _os_log_impl(&dword_210BD8000, v51, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | creating new UpNext section [] upNextSectionIdentifier=%{public}@", buf, 0x20u);

        v43 = v54;
        v49 = v53;

      }
      v56 = (void *)objc_opt_new();
      objc_msgSend(v56, "setLabel:", CFSTR("Up Next"));
      objc_msgSend(v56, "setOverrideSILSectionID:", v49);
      v57 = -[_MPCQueueControllerBehaviorMusicDataSourceState initWithPlaybackContext:]([_MPCQueueControllerDataSourceState alloc], "initWithPlaybackContext:", v56);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataSources, "setObject:forKeyedSubscript:", v57, v49);
      if ((v45 & 1) != 0)
      {
        autoPlayIdentifierList = self->_autoPlayIdentifierList;
        -[_MPCQueueControllerBehaviorMusicDataSourceState itemID](v43, "itemID");
        v66 = v43;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusicDataSourceState sectionID](v66, "sectionID");
        v201 = self;
        v68 = v20;
        v69 = v16;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSectionedIdentifierList addDataSource:section:afterItem:inSection:completion:](autoPlayIdentifierList, "addDataSource:section:afterItem:inSection:completion:", v57, v49, v67, v70, &__block_literal_global_353);

        v16 = v69;
        v20 = v68;
        self = v201;

        v43 = v66;
      }
      else
      {
        identifierList = self->_identifierList;
        if (a4 == 1)
        {
          -[MPShuffleableSectionedIdentifierList addDataSourceAtEnd:section:sequentially:completion:](self->_identifierList, "addDataSourceAtEnd:section:sequentially:completion:", v57, v49, 1, &__block_literal_global_354);
        }
        else
        {
          -[_MPCQueueControllerBehaviorMusicDataSourceState itemID](v43, "itemID");
          v59 = v49;
          v60 = v43;
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicDataSourceState sectionID](v60, "sectionID");
          v200 = self;
          v62 = v20;
          v63 = v16;
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:afterItem:inSection:completion:](identifierList, "addDataSource:section:sequentially:afterItem:inSection:completion:", v57, v59, 1, v61, v64, &__block_literal_global_355);

          v16 = v63;
          v20 = v62;
          self = v200;

          v43 = v60;
          v49 = v59;
        }
      }

      v43 = 0;
      v15 = v192;
      v40 = v197;
    }
    -[_MPCQueueControllerBehaviorMusic _idenitiferListForPosition:afterContentItemID:existingUpNextSectionID:createdUpNextSectionID:](self, "_idenitiferListForPosition:afterContentItemID:existingUpNextSectionID:createdUpNextSectionID:", a4, v208, v43, v49);
    v74 = (MPShuffleableSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    v202 = v43;
    if (!v74)
    {
      v81 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v209, "engineID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v221 = v82;
        v222 = 2114;
        v223 = (uint64_t)v83;
        v224 = 2114;
        v225 = v202;
        v226 = 2114;
        v227 = v49;
        v228 = 2114;
        v229 = (uint64_t)v205;
        _os_log_impl(&dword_210BD8000, v81, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | rolling back edit [no valid identifierList] latestUpNextSectionID=%{public}@ newUpNextSectionIdentifier=%{public}@ edit=%{public}@", buf, 0x34u);

        v43 = v202;
      }

      objc_msgSend(v205, "rollback");
      v79 = (void *)MEMORY[0x24BDD1540];
      if (v43)
        v84 = v43;
      else
        v84 = v49;
      v183 = v84;
      v80 = CFSTR("Cannot find UpNextSection in either identifier list: %@");
      goto LABEL_55;
    }
    if (v74 != self->_identifierList)
    {
      if (a4 == 4)
      {
        objc_msgSend(v205, "rollback");
        v76 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v209, "engineID");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v221 = v77;
          v222 = 2114;
          v223 = (uint64_t)v78;
          _os_log_impl(&dword_210BD8000, v76, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | rolling back edit [cannot insert at start of autoPlayIdentifierList]", buf, 0x16u);

          v43 = v202;
        }

        v79 = (void *)MEMORY[0x24BDD1540];
        v80 = CFSTR("Cannot insert at start of autoPlayIdentifierList");
LABEL_55:
        objc_msgSend(v79, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, v80, v183);
        v85 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        v207[2](v207, 0, v85);
LABEL_149:

LABEL_150:
        goto LABEL_151;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v102 = v40;
        if (objc_msgSend(v102, "continueListeningStation"))
          objc_msgSend(v102, "setContinueListeningQueueProvider:", self);

      }
LABEL_82:
      v188 = v16;
      v199 = v40;
      v108 = -[_MPCQueueControllerBehaviorMusicDataSourceState initWithPlaybackContext:]([_MPCQueueControllerBehaviorMusicDataSourceState alloc], "initWithPlaybackContext:", v40);
      dataSources = self->_dataSources;
      -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v108, "sectionIdentifier");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](dataSources, "objectForKeyedSubscript:", v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      if (v111)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "handleFailureInMethod:object:file:lineNumber:description:", v195, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2100, CFSTR("Attempting to add datasource for an already existing section."));

      }
      objc_msgSend(v209, "eventStream");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusicDataSourceState setEventStream:](v108, "setEventStream:", v112);

      objc_msgSend(v209, "playerID");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusicDataSourceState setPlayerID:](v108, "setPlayerID:", v113);

      v114 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v209, "engineID");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v108, "sectionIdentifier");
        v193 = v20;
        v117 = self;
        v118 = v15;
        v119 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v221 = v115;
        v222 = 2114;
        v223 = (uint64_t)v116;
        v224 = 2048;
        v225 = v108;
        v226 = 2114;
        v227 = v119;
        _os_log_impl(&dword_210BD8000, v114, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding dataSource [] dataSource=%p section=%{public}@", buf, 0x2Au);

        v15 = v118;
        self = v117;
        v20 = v193;

      }
      v120 = self->_dataSources;
      -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v108, "sectionIdentifier");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v120, "setObject:forKeyedSubscript:", v108, v121);

      -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v108, "sectionIdentifier");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic _emitEventsForAddingPlaybackContext:sectionIdentifier:](self, "_emitEventsForAddingPlaybackContext:sectionIdentifier:", v15, v122);

      if ((v206 & 2) == 0)
      {
        -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](v108, "playbackContext");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setShuffleType:", 0);

      }
      v40 = v199;
      if ((v206 & 4) == 0)
      {
        -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](v108, "playbackContext");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "setRepeatType:", 0);

      }
      v194 = v15;
      if ((v206 & 1) == 0)
      {
        -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](v108, "playbackContext");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "clearStartItem");

      }
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __137___MPCQueueControllerBehaviorMusic__qfa_performInsertPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_363;
      aBlock[3] = &unk_24CAB34A0;
      v218 = v206;
      v211 = v199;
      v191 = v209;
      v212 = v191;
      v213 = self;
      v85 = v108;
      v214 = v85;
      v215 = WeakRetained;
      v219 = v206 & 1;
      v216 = v205;
      v217 = v207;
      v187 = _Block_copy(aBlock);
      v126 = self->_identifierList;
      v127 = CFSTR("auto");
      if (v75 == v126)
        v127 = CFSTR("base");
      v190 = v127;
      v43 = v202;
      switch(a4)
      {
        case 0:
          if (v202)
          {
            _MPCLogCategoryMusicBehavior();
            v128 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
              goto LABEL_122;
            objc_msgSend(v191, "engineID");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
            v184 = objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
            v186 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "itemID");
            v129 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sectionID");
            v130 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v221 = v196;
            v222 = 2114;
            v131 = (void *)v184;
            v223 = v184;
            v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            v226 = 2114;
            v227 = v186;
            v228 = 2114;
            v229 = v129;
            v132 = (void *)v129;
            v230 = 2114;
            v231 = v130;
            v133 = (void *)v130;
            v134 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ po"
                   "sition=Head section=%{public}@ afterItem=%{public}@ inSection=%{public}@";
            goto LABEL_121;
          }
          if (!v49)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v180, "handleFailureInMethod:object:file:lineNumber:description:", v195, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2172, CFSTR("Attempt to insert at Head without creating UpNext section"));

          }
          _MPCLogCategoryMusicBehavior();
          v169 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v191, "engineID");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
            v172 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v221 = v170;
            v222 = 2114;
            v223 = (uint64_t)v171;
            v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            v226 = 2114;
            v227 = v172;
            v228 = 2114;
            v229 = (uint64_t)v49;
            v173 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ po"
                   "sition=Head section=%{public}@ upNextSection=%{public}@";
            goto LABEL_140;
          }
          goto LABEL_141;
        case 1:
          if (v202)
          {
            _MPCLogCategoryMusicBehavior();
            v152 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v191, "engineID");
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v155 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v221 = v153;
              v222 = 2114;
              v223 = (uint64_t)v154;
              v224 = 2114;
              v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
              v226 = 2114;
              v227 = v155;
              v228 = 2114;
              v229 = (uint64_t)v202;
              _os_log_impl(&dword_210BD8000, v152, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ position=Tail section=%{public}@ upNextSection=%{public}@", buf, 0x34u);

              v40 = v199;
            }

            v16 = v188;
            if (v75 == v126)
            {
              v176 = self->_identifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v177 = v176;
              v43 = v202;
              v141 = v187;
              -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:beforeTailOfSection:completion:](v177, "addDataSource:section:sequentially:beforeTailOfSection:completion:", v85, v140, 1, v202, v187);
            }
            else
            {
              v156 = self->_autoPlayIdentifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v157 = v156;
              v43 = v202;
              v141 = v187;
              -[MPSectionedIdentifierList addDataSource:section:beforeTailOfSection:completion:](v157, "addDataSource:section:beforeTailOfSection:completion:", v85, v140, v202, v187);
            }
            goto LABEL_145;
          }
          if (!v49)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v181, "handleFailureInMethod:object:file:lineNumber:description:", v195, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2233, CFSTR("Attempt to insert at Tail without creating UpNext section"));

          }
          _MPCLogCategoryMusicBehavior();
          v169 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v191, "engineID");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
            v172 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v221 = v170;
            v222 = 2114;
            v223 = (uint64_t)v171;
            v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            v226 = 2114;
            v227 = v172;
            v228 = 2114;
            v229 = (uint64_t)v49;
            v173 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ po"
                   "sition=Tail section=%{public}@ upNextSection=%{public}@";
            goto LABEL_140;
          }
          goto LABEL_141;
        case 2:
          v142 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v191, "engineID");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
            v145 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v221 = v143;
            v222 = 2114;
            v223 = (uint64_t)v144;
            v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            v226 = 2114;
            v227 = v145;
            _os_log_impl(&dword_210BD8000, v142, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ position=Last section=%{public}@", buf, 0x2Au);

            v40 = v199;
          }

          v16 = v188;
          if (v75 == v126)
          {
            v168 = self->_identifierList;
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = v187;
            -[MPShuffleableSectionedIdentifierList addDataSourceAtEnd:section:sequentially:completion:](v168, "addDataSourceAtEnd:section:sequentially:completion:", v85, v140, 1, v187);
          }
          else
          {
            v146 = self->_autoPlayIdentifierList;
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = v187;
            -[MPSectionedIdentifierList addDataSourceAtEnd:section:completion:](v146, "addDataSourceAtEnd:section:completion:", v85, v140, v187);
          }
          goto LABEL_144;
        case 3:
          if (v202)
          {
            _MPCLogCategoryMusicBehavior();
            v128 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v191, "engineID");
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
              v185 = objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v186 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "itemID");
              v158 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "sectionID");
              v159 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v221 = v196;
              v222 = 2114;
              v131 = (void *)v185;
              v223 = v185;
              v224 = 2114;
              v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
              v226 = 2114;
              v227 = v186;
              v228 = 2114;
              v229 = v158;
              v132 = (void *)v158;
              v230 = 2114;
              v231 = v159;
              v133 = (void *)v159;
              v134 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ "
                     "position=Specified section=%{public}@ afterItem=%{public}@ inSection=%{public}@";
LABEL_121:
              _os_log_impl(&dword_210BD8000, v128, OS_LOG_TYPE_DEFAULT, v134, buf, 0x3Eu);

              v40 = v199;
            }
LABEL_122:

            if (v75 == v126)
            {
              v165 = self->_identifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "itemID");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "sectionID");
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              v166 = v165;
              v164 = v187;
              -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:afterItem:inSection:completion:](v166, "addDataSource:section:sequentially:afterItem:inSection:completion:", v85, v140, 1, v161, v162, v187);
            }
            else
            {
              v160 = self->_autoPlayIdentifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "itemID");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "sectionID");
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              v163 = v160;
              v164 = v187;
              -[MPSectionedIdentifierList addDataSource:section:afterItem:inSection:completion:](v163, "addDataSource:section:afterItem:inSection:completion:", v85, v140, v161, v162, v187);
            }

            v141 = v164;
            v16 = v188;
          }
          else
          {
            if (!v49)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v182, "handleFailureInMethod:object:file:lineNumber:description:", v195, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2195, CFSTR("Attempt to insert at Specified without creating UpNext section"));

            }
            _MPCLogCategoryMusicBehavior();
            v169 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v191, "engineID");
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v172 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v221 = v170;
              v222 = 2114;
              v223 = (uint64_t)v171;
              v224 = 2114;
              v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
              v226 = 2114;
              v227 = v172;
              v228 = 2114;
              v229 = (uint64_t)v49;
              v173 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ "
                     "position=Specified section=%{public}@ upNextSection=%{public}@";
LABEL_140:
              _os_log_impl(&dword_210BD8000, v169, OS_LOG_TYPE_DEFAULT, v173, buf, 0x34u);

              v40 = v199;
            }
LABEL_141:

            v16 = v188;
            if (v75 == v126)
            {
              v175 = self->_identifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = v187;
              -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:beforeTailOfSection:completion:](v175, "addDataSource:section:sequentially:beforeTailOfSection:completion:", v85, v140, 1, v49, v187);
            }
            else
            {
              v174 = self->_autoPlayIdentifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = v187;
              -[MPSectionedIdentifierList addDataSource:section:beforeTailOfSection:completion:](v174, "addDataSource:section:beforeTailOfSection:completion:", v85, v140, v49, v187);
            }
          }
          goto LABEL_144;
        case 4:
          v147 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v191, "engineID");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
            v150 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v221 = v148;
            v222 = 2114;
            v223 = (uint64_t)v149;
            v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            v226 = 2114;
            v227 = v150;
            _os_log_impl(&dword_210BD8000, v147, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ position=Start section=%{public}@", buf, 0x2Au);

            v40 = v199;
          }

          v16 = v188;
          if (v75 != v126)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v179, "handleFailureInMethod:object:file:lineNumber:description:", v195, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2218, CFSTR("Cannot insert at Start of AutoPlay SIL"));

          }
          v151 = self->_identifierList;
          -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v141 = v187;
          -[MPShuffleableSectionedIdentifierList addDataSourceAtStart:section:completion:](v151, "addDataSourceAtStart:section:completion:", v85, v140, v187);
          goto LABEL_144;
        default:
          if (a4 == 100)
          {
            v135 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v191, "engineID");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v138 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v221 = v136;
              v222 = 2114;
              v223 = (uint64_t)v137;
              v224 = 2114;
              v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
              v226 = 2114;
              v227 = v138;
              v228 = 2114;
              v229 = (uint64_t)v188;
              _os_log_impl(&dword_210BD8000, v135, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ position=AfterSection section=%{public}@ afterSection=%{public}@", buf, 0x34u);

              v40 = v199;
            }

            if (v75 == v126)
            {
              v167 = self->_identifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = v187;
              v16 = v188;
              -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:afterTailOfSection:completion:](v167, "addDataSource:section:sequentially:afterTailOfSection:completion:", v85, v140, 1, v188, v187);
            }
            else
            {
              v139 = self->_autoPlayIdentifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v85, "sectionIdentifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = v187;
              v16 = v188;
              -[MPSectionedIdentifierList addDataSource:section:afterTailOfSection:completion:](v139, "addDataSource:section:afterTailOfSection:completion:", v85, v140, v188, v187);
            }
LABEL_144:
            v43 = v202;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "handleFailureInMethod:object:file:lineNumber:description:", v195, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2254, CFSTR("Unsupported insertion position %d for %s | "), a4, "-[_MPCQueueControllerBehaviorMusic _qfa_performInsertPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:]");
            v141 = v187;
            v16 = v188;
          }
LABEL_145:

          if ((v206 & 0x10) == 0 && !self->_hasUserMutations)
            self->_hasUserMutations = 1;
          objc_msgSend(v191, "behaviorDidChange");

          v15 = v194;
          break;
      }
      goto LABEL_149;
    }
    if (objc_msgSend(v40, "shuffleType") == 1000)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "musicShuffleType");

      objc_msgSend(v40, "setShuffleType:", v87);
    }
    v88 = objc_msgSend(v40, "repeatType");
    if (v88 == 3)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v89, "musicRepeatType");

      objc_msgSend(v40, "setRepeatType:", v88);
    }
    if ((v206 & 4) != 0 && self->_repeatType != v88)
    {
      self->_repeatType = v88;
      -[_MPCQueueControllerBehaviorMusic _emitEventsForPlaybackBehaviorChangeIfNeeded](self, "_emitEventsForPlaybackBehaviorChangeIfNeeded");
      objc_msgSend(WeakRetained, "behavior:didChangeRepeatType:", self, v88);
    }
    if (objc_msgSend((id)objc_opt_class(), "supportsAutoPlay"))
    {
      v90 = objc_msgSend(v40, "queueEndAction");
      if (v90 == 1000)
      {
        objc_msgSend(v40, "userIdentity");
        v91 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v189 = v75;
        v93 = (void *)v91;
        v94 = objc_msgSend(v92, "autoPlayEnabledForUserIdentity:", v91);
        v95 = v40;
        v96 = v20;
        v97 = v16;
        v98 = v94;

        v99 = v98 == 0;
        v16 = v97;
        v20 = v96;
        v40 = v95;
        if (v99)
          v90 = 2;
        else
          v90 = 3;
        objc_msgSend(v95, "setQueueEndAction:", v90);

        v75 = v189;
      }
      if ((v206 & 0x20) == 0 || self->_autoPlayState)
        goto LABEL_82;
      v100 = self;
      if (v90 == 3)
        v101 = 4;
      else
        v101 = 5;
    }
    else
    {
      if (self->_autoPlayState == 1)
        goto LABEL_82;
      _MPCLogCategoryMusicBehavior();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v209, "engineID");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v198 = v40;
        v105 = v20;
        v106 = v16;
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v221 = v104;
        v222 = 2114;
        v223 = (uint64_t)v107;
        _os_log_impl(&dword_210BD8000, v103, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | disabling auto play [data source unsupported]", buf, 0x16u);

        v16 = v106;
        v20 = v105;
        v40 = v198;

      }
      v100 = self;
      v101 = 1;
    }
    -[_MPCQueueControllerBehaviorMusic _transitionToAutoPlayState:](v100, "_transitionToAutoPlayState:", v101);
    goto LABEL_82;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v209, "engineID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v221 = v18;
    v222 = 2114;
    v223 = (uint64_t)v19;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | failed [insert at Last is not supported -- MediaPlayer/QueueFA is ON]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("Cannot insert at Last [MediaPlayer/QueueFA is ON"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v207[2](v207, 0, v20);
LABEL_152:

}

- (id)_idenitiferListForPosition:(int64_t)a3 afterContentItemID:(id)a4 existingUpNextSectionID:(id)a5 createdUpNextSectionID:(id)a6
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _MPCQueueControllerBehaviorMusic *v18;
  void *v19;
  MPShuffleableSectionedIdentifierList *v20;
  void *v21;
  void *v23;

  v11 = a4;
  v12 = (unint64_t)a5;
  v13 = (unint64_t)a6;
  v14 = (void *)v13;
  if (a3 == 2)
  {
LABEL_2:
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!(v12 | v13))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2266, CFSTR("Missing upNextSectionID for position: %ld afterContentItemID: %@"), a3, v11);

    }
    switch(a3)
    {
      case 0:
      case 3:
        if (v12)
          goto LABEL_2;
        v18 = self;
        v19 = v14;
        goto LABEL_12;
      case 1:
        if (v12)
          v19 = (void *)v12;
        else
          v19 = v14;
        v18 = self;
LABEL_12:
        -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](v18, "_identifierListForSection:", v19);
        v20 = (MPShuffleableSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 4:
        v20 = self->_identifierList;
LABEL_15:
        v17 = v20;
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2291, CFSTR("Unsupported insertion position %d for %s | "), a3, "-[_MPCQueueControllerBehaviorMusic _idenitiferListForPosition:afterContentItemID:existingUpNextSectionID:createdUpNextSectionID:]");

        v17 = 0;
        break;
    }
  }

  return v17;
}

- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD block[5];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, _QWORD))a5;
  v9 = a4;
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "hasItem:inSection:", v14, v15);

  if ((v16 & 1) != 0)
  {
    objc_msgSend(v11, "sectionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "itemID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "hasItem:inSection:", v19, v20);

    if ((v21 & 1) != 0)
    {
      if (v13 == v18)
      {
        -[_MPCQueueControllerBehaviorMusic host](self, "host");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "beginEditWithReason:", CFSTR("BehaviorMusic-moveItemAfterItem"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sectionID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sectionID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "moveItem:fromSection:afterItem:inSection:", v26, v27, v28, v29);

        if (!self->_hasUserMutations)
          self->_hasUserMutations = 1;
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v34, "engineID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v31;
          v38 = 2114;
          v39 = v32;
          _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] moveContentItemID:afterContentItemID:completion: | committing edit [update for move after]", buf, 0x16u);

        }
        objc_msgSend(v33, "commit");
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __84___MPCQueueControllerBehaviorMusic_moveContentItemID_afterContentItemID_completion___block_invoke;
        block[3] = &unk_24CABA2D0;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        -[_MPCQueueControllerBehaviorMusic _evaluateLoadingDataSourceItemThresholds](self, "_evaluateLoadingDataSourceItemThresholds");
        v8[2](v8, 0);

        goto LABEL_8;
      }
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = CFSTR("Received a move command but the source and target lists are not the same. Moving items between auto play and the queue is not supported.");
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = CFSTR("Received a move command but the target is not available in the queue.");
    }
    objc_msgSend(v22, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 5, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v8)[2](v8, v25);

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 5, CFSTR("Received a move command but the source is not available in the queue."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v8)[2](v8, v24);

LABEL_9:
}

- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5
{
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD block[5];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v9 = (void (**)(id, _QWORD))a5;
  v10 = a4;
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "itemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "hasItem:inSection:", v15, v16);

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v12, "sectionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "itemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "hasItem:inSection:", v20, v21);

    if ((v22 & 1) != 0)
    {
      if (v14 == v19)
      {
        v45 = v19;
        -[_MPCQueueControllerBehaviorMusic host](self, "host");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "beginEditWithReason:", CFSTR("BehaviorMusic-moveItemBeforeItem"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x24BDDCBC0];
        objc_msgSend(v12, "itemID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sectionID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "positionForItem:inSection:", v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "enumeratorWithOptions:startPosition:endPosition:", 9, v30, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = v31;
        objc_msgSend(v31, "nextObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v32, "entryType"))
        {
          case 0:
          case 1:
          case 5:
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2375, CFSTR("Unexpected entry type when reverse enumerating for before item: %d"), objc_msgSend(v32, "entryType"));
            goto LABEL_16;
          case 2:
            objc_msgSend(v11, "itemID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "sectionID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "trackingEntryResult");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "sectionIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "moveItem:fromSection:afterHeadOfSection:", v33, v34, v36);
            goto LABEL_15;
          case 3:
            objc_msgSend(v11, "itemID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "sectionID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "itemResult");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "itemIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "itemResult");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "sectionIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "moveItem:fromSection:afterItem:inSection:", v33, v44, v37, v39);

            goto LABEL_16;
          case 4:
            objc_msgSend(v11, "itemID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "sectionID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "trackingEntryResult");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "sectionIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "moveItem:fromSection:afterTailOfSection:", v33, v34, v36);
LABEL_15:

LABEL_16:
            break;
          default:
            break;
        }
        if (!self->_hasUserMutations)
          self->_hasUserMutations = 1;
        v40 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        v19 = v45;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v48, "engineID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v41;
          v52 = 2114;
          v53 = v42;
          _os_log_impl(&dword_210BD8000, v40, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] moveContentItemID:beforeContentItemID:completion: | committing edit [update for move before]", buf, 0x16u);

        }
        objc_msgSend(v47, "commit");
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __85___MPCQueueControllerBehaviorMusic_moveContentItemID_beforeContentItemID_completion___block_invoke;
        block[3] = &unk_24CABA2D0;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        -[_MPCQueueControllerBehaviorMusic _evaluateLoadingDataSourceItemThresholds](self, "_evaluateLoadingDataSourceItemThresholds");
        v9[2](v9, 0);

        goto LABEL_8;
      }
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = CFSTR("Received a move command but the source and target lists are not the same. Moving items between auto play and the queue is not supported.");
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = CFSTR("Received a move command but the target is not available in the queue.");
    }
    objc_msgSend(v23, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 5, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v9)[2](v9, v26);

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 5, CFSTR("Received a move command but the source is not available in the queue."));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v9)[2](v9, v25);

LABEL_9:
}

- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4
{
  return 1;
}

- (void)removeContentItemID:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hasItem:inSection:", v9, v8) & 1) != 0)
  {
    -[_MPCQueueControllerBehaviorMusic host](self, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginEditWithReason:", CFSTR("BehaviorMusic-removeItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsLiveStream");

    if (v14)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFrozen:", 1);

    }
    objc_msgSend(v10, "removeItem:fromSection:", v9, v8);
    if (!self->_hasUserMutations)
      self->_hasUserMutations = 1;
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "engineID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v21 = v11;
      v18 = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] removeContentItemID:completion: | committing edit [update removed item]", buf, 0x16u);

      v12 = v18;
      v11 = v21;

    }
    objc_msgSend(v12, "commit");
    -[_MPCQueueControllerBehaviorMusic _evaluateLoadingDataSourceItemThresholds](self, "_evaluateLoadingDataSourceItemThresholds");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67___MPCQueueControllerBehaviorMusic_removeContentItemID_completion___block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v6[2](v6, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 5, CFSTR("Requested removing content item that is not in the queue."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v6)[2](v6, v20);

  }
}

- (void)clearAllItemsAfterContentItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  _QWORD block[5];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusic tailInsertionContentItemIDForTargetContentItemID:](self, "tailInsertionContentItemIDForTargetContentItemID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v38 = v5;
    objc_msgSend(v5, "beginEditWithReason:", CFSTR("BehaviorMusic-clearUpNext"));
    v37 = objc_claimAutoreleasedReturnValue();
    v39 = v4;
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDDCBC0];
    objc_msgSend(v7, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v7;
    objc_msgSend(v7, "sectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "positionForItem:inSection:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDDCBC0];
    objc_msgSend(v12, "itemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "positionForItem:inSection:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v16;
    v35 = (void *)v11;
    +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:](_MPCQueueControllerEnumerator, "enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:", self, 1, 64, v11, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nextObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      do
      {
        objc_msgSend(v19, "itemResult");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sectionIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "itemResult");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "itemIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "itemResult");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sectionIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeItem:fromSection:", v24, v26);

        objc_msgSend(v17, "nextObject");
        v27 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v27;
      }
      while (v27);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68___MPCQueueControllerBehaviorMusic_clearAllItemsAfterContentItemID___block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    if (!self->_hasUserMutations)
      self->_hasUserMutations = 1;
    v28 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    v5 = v38;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v38, "engineID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v29;
      v43 = 2114;
      v44 = v30;
      _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] clearAllItemsAfterContentItemID: | committing edit [queue updated]", buf, 0x16u);

    }
    v31 = v37;
    -[NSObject commit](v37, "commit");

    v4 = v39;
  }
  else
  {
    v31 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "engineID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v32;
      v43 = 2114;
      v44 = v33;
      _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] clearAllItemsAfterContentItemID: | ignoring [tailInsertionContentItemID is nil]", buf, 0x16u);

    }
  }

}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return 0;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return a3 != 0;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90___MPCQueueControllerBehaviorMusic_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v7[3] = &unk_24CAB9830;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return CFSTR("AutoPlayPlaceholderArtworkVisualIdenticality");
}

- (id)debugDescriptionForSection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  __CFString *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "playbackContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptionComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "state");
    if (v7 > 4)
      v8 = CFSTR("▫️");
    else
      v8 = off_24CAB36E8[v7];
    if (objc_msgSend(v4, "isFrozen"))
    {
      -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("❄️"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)MEMORY[0x24BDD16A8];
    v22 = v5;
    objc_msgSend((id)objc_opt_class(), "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v8;
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v6, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendFormat:", CFSTR(" %@=%@"), v18, v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)debugDescriptionForItem:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasItem:inSection:", v6, v7)
    && (objc_msgSend(v8, "isDeletedItem:inSection:", v6, v7) & 1) == 0)
  {
    +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentItemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _itemForContentItemID:](self, "_itemForContentItemID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentItemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v10, "type");
    v15 = (void *)MEMORY[0x24BDD17C8];
    if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v16 = CFSTR("⏳");
    else
      v16 = CFSTR("▫️");
    objc_msgSend(v12, "mainTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@"), v16, v17);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("▫️ (null)");
  }

  return v9;
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidEndTransactionForSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidEndTransactionForSection___block_invoke;
  block[3] = &unk_24CABAA28;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidMoveItems:(id)a4 inSection:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _MPCQueueControllerBehaviorMusic *v20;
  id v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v8 = a4;
  v23 = a5;
  v20 = self;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "eventStream");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = CFSTR("queue-section-id");
        v36[1] = CFSTR("queue-item-id");
        v37[0] = v23;
        v37[1] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "emitEventType:payload:", CFSTR("queue-item-reorder"), v16);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    }
    while (v11);
  }

  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "engineID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](v20, "sessionID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v18;
    v30 = 2114;
    v31 = v19;
    v32 = 2048;
    v33 = v21;
    v34 = 2114;
    v35 = v23;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidMoveItems:inSection:%{public}@ | editing [data source moved items]", buf, 0x2Au);

  }
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidRemoveItems:(id)a4 fromSection:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __97___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidRemoveItems_fromSection___block_invoke;
  v14[3] = &unk_24CAB7438;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidAddItems:(id)a4 toSection:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __92___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidAddItems_toSection___block_invoke;
  v14[3] = &unk_24CAB7438;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidUpdateItems:(id)a4 inSection:(id)a5
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidUpdateItems_inSection___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidChangeItems:(id)a4 inSection:(id)a5
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidChangeItems_inSection___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidUpdateSection:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidUpdateSection___block_invoke;
  v7[3] = &unk_24CABA1D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (void)didDequeueShuffledItemsInSectionedIdentifierList:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85___MPCQueueControllerBehaviorMusic_didDequeueShuffledItemsInSectionedIdentifierList___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (id)queueReferencesWithMaxCount:(int64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableDictionary *dataSources;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v41;
  NSObject *v42;
  void *v43;
  _MPCQueueControllerBehaviorMusic *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self;
  -[_MPCQueueControllerBehaviorMusic _accountForAutoPlay](self, "_accountForAutoPlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(v4, "engineID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](v45, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v8;
      v48 = 2114;
      v49 = v9;
      v50 = 2048;
      v51 = a3;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] queueReferencesWithMaxCount: | enumerating items [] maxCount=%ld", buf, 0x20u);

    }
    v41 = v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:](_MPCQueueControllerEnumerator, "enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:", v45, 1, 8, 0, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "nextObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v42 = v6;
      while (1)
      {
        if (-[NSObject count](v6, "count") >= (unint64_t)a3)
        {
LABEL_17:

          goto LABEL_18;
        }
        v12 = (void *)MEMORY[0x212BD2784]();
        dataSources = v45->_dataSources;
        objc_msgSend(v11, "itemResult");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sectionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](dataSources, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "dataSource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemResult");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "itemIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemResult");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sectionIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v17, "supportsAutoPlayForItem:inSection:", v19, v21);

        if (v22)
          break;
LABEL_16:

        objc_autoreleasePoolPop(v12);
        objc_msgSend(v43, "nextObject");
        v35 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v35;
        if (!v35)
          goto LABEL_17;
      }
      objc_msgSend(v11, "itemResult");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sectionIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "itemResult");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "itemIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[_MPCQueueControllerBehaviorMusic _itemForComponents:](v45, "_itemForComponents:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v28;
        objc_msgSend(v29, "trackInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v29, "storeItemInt64ID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[MPCModelRadioContentReference referenceWithStoreIdentifier:trackInfo:](MPCModelRadioContentReference, "referenceWithStoreIdentifier:trackInfo:", v31, v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v42;
          if (v32)
            goto LABEL_14;
        }
        else
        {

        }
      }
      objc_msgSend(v28, "modelGenericObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "modelPlayEvent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCModelRadioContentReference referenceWithMPModelObject:containerModelPlayEvent:](MPCModelRadioContentReference, "referenceWithMPModelObject:containerModelPlayEvent:", v33, v34);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v42;
      if (!v32)
      {
LABEL_15:

        goto LABEL_16;
      }
LABEL_14:
      -[NSObject insertObject:atIndex:](v6, "insertObject:atIndex:", v32, 0);

      goto LABEL_15;
    }
LABEL_18:
    v36 = -[NSObject copy](v6, "copy");

    v4 = v41;
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v4, "engineID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](v45, "sessionID");
      v38 = v6;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v37;
      v48 = 2114;
      v49 = v39;
      _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] queueReferencesWithMaxCount: | returning no items [_accountForAutoPlay was nil]", buf, 0x16u);

      v6 = v38;
    }
    v36 = (id)MEMORY[0x24BDBD1A8];
  }

  return v36;
}

- (id)_accountForAutoPlay
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MPShuffleableSectionedIdentifierList allSectionIdentifiers](self->_identifierList, "allSectionIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "playbackContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "accountForUserIdentity:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "canAutoPlay") & 1) != 0)
          {

            goto LABEL_13;
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)_addPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8
{
  void (**v15)(id, void *);
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _MPCQueueControllerBehaviorMusic *v26;
  void *v27;
  void *v28;
  _MPCQueueControllerBehaviorMusicDataSourceState *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _MPCQueueControllerBehaviorMusic *v39;
  void *v40;
  void *v41;
  _MPCQueueControllerBehaviorMusicDataSourceState *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSMutableDictionary *dataSources;
  MPShuffleableSectionedIdentifierList *v47;
  MPShuffleableSectionedIdentifierList *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  _MPCQueueControllerBehaviorMusicDataSourceState *v54;
  void *v55;
  void (**v56)(id, void *);
  void *v57;
  void *v58;
  _MPCQueueControllerBehaviorMusicDataSourceState *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  _MPCQueueControllerBehaviorMusicDataSourceState *v66;
  int64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  void *v76;
  _MPCQueueControllerBehaviorMusicDataSourceState *v77;
  NSMutableDictionary *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  unint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void (**v90)(id, void *);
  void *v91;
  NSMutableDictionary *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  _MPCQueueControllerBehaviorMusicDataSourceState *v100;
  char v101;
  _MPCQueueControllerBehaviorMusicDataSourceState *v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void (**v106)(id, void *);
  _MPCQueueControllerBehaviorMusicDataSourceState *v107;
  MPShuffleableSectionedIdentifierList *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void (**v113)(id, void *);
  _MPCQueueControllerBehaviorMusicDataSourceState *v114;
  MPShuffleableSectionedIdentifierList *v115;
  void *v116;
  _MPCQueueControllerBehaviorMusicDataSourceState *v117;
  void *v118;
  char v119;
  _MPCQueueControllerBehaviorMusicDataSourceState *v120;
  MPShuffleableSectionedIdentifierList *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  void (**v127)(id, void *);
  _MPCQueueControllerBehaviorMusicDataSourceState *v128;
  MPShuffleableSectionedIdentifierList *v129;
  void *v130;
  NSObject *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  _MPCQueueControllerBehaviorMusic *v140;
  _MPCQueueControllerBehaviorMusic *v141;
  _MPCQueueControllerBehaviorMusic *v142;
  SEL v143;
  void (**v144)(id, void *);
  void *v145;
  void *v146;
  void *v147;
  MPShuffleableSectionedIdentifierList **p_identifierList;
  int64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  MPShuffleableSectionedIdentifierList *v155;
  unint64_t v156;
  unint64_t v157;
  void *v158;
  id WeakRetained;
  _MPCQueueControllerBehaviorMusicDataSourceState *v160;
  id v161;
  id v162;
  id v163;
  _QWORD aBlock[4];
  id v165;
  _MPCQueueControllerBehaviorMusic *v166;
  _MPCQueueControllerBehaviorMusicDataSourceState *v167;
  id v168;
  _MPCQueueControllerBehaviorMusicDataSourceState *v169;
  void (**v170)(id, void *);
  unint64_t v171;
  uint64_t v172;
  char v173;
  _QWORD v174[4];
  id v175;
  _MPCQueueControllerBehaviorMusic *v176;
  uint8_t buf[4];
  void *v178;
  __int16 v179;
  void *v180;
  __int16 v181;
  _MPCQueueControllerBehaviorMusicDataSourceState *v182;
  __int16 v183;
  id v184;
  __int16 v185;
  _MPCQueueControllerBehaviorMusicDataSourceState *v186;
  uint64_t v187;

  v187 = *MEMORY[0x24BDAC8D0];
  v163 = a3;
  v162 = a5;
  v161 = a6;
  v15 = (void (**)(id, void *))a8;
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != 1)
  {
    v143 = a2;
    v20 = (void *)objc_msgSend(v163, "copy");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BehaviorMusic-addPlaybackContext-<%@: %p>"), objc_opt_class(), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginEditWithReason:", v21);
    v160 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    if (a4 == 3)
    {
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v162);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "type") != 3)
      {
        v149 = 3;
        goto LABEL_23;
      }
      v36 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "engineID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deferredNextContentItemID");
        v157 = a7;
        v39 = self;
        v40 = v22;
        v41 = v20;
        v42 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v178 = v37;
        v179 = 2114;
        v180 = v38;
        v181 = 2114;
        v182 = v42;
        _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | converting PositionSpecified item to deferredNextContentItem [specified placeholder item] deferredNextContentItem=%{public}@", buf, 0x20u);

        v20 = v41;
        v22 = v40;
        self = v39;
        a7 = v157;

      }
      objc_msgSend(v22, "deferredNextContentItemID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        v131 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "engineID");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v178 = v132;
          v179 = 2114;
          v180 = v133;
          v181 = 2114;
          v182 = v160;
          _os_log_impl(&dword_210BD8000, v131, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil] edit=%{public}@", buf, 0x20u);

        }
        -[_MPCQueueControllerBehaviorMusicDataSourceState rollback](v160, "rollback");
        v34 = (void *)MEMORY[0x24BDD1540];
        v35 = CFSTR("The specified insertion position [specified] was unsupported because the specified item is a placeholder and there is no deferredNextContentItemAnchorID.");
        goto LABEL_93;
      }
    }
    else
    {
      if (a4)
      {
        p_identifierList = &self->_identifierList;
        v155 = self->_identifierList;
        if (a4 == 2)
        {
          dataSources = self->_dataSources;
          v174[0] = MEMORY[0x24BDAC760];
          v174[1] = 3221225472;
          v174[2] = __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke;
          v174[3] = &unk_24CAB3338;
          v175 = v16;
          v176 = self;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSources, "enumerateKeysAndObjectsUsingBlock:", v174);

          v22 = 0;
          v149 = 2;
        }
        else
        {
          v149 = a4;
          v22 = 0;
        }
        goto LABEL_29;
      }
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v162);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "type") != 3)
      {
        v149 = 0;
        goto LABEL_23;
      }
      v23 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "engineID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deferredNextContentItemID");
        v156 = a7;
        v26 = self;
        v27 = v22;
        v28 = v20;
        v29 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v178 = v24;
        v179 = 2114;
        v180 = v25;
        v181 = 2114;
        v182 = v29;
        _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | converting PositionHead to PositionSpecified after deferredNextContentItem [head (current item was placeholder)] deferredNextContentItem=%{public}@", buf, 0x20u);

        v20 = v28;
        v22 = v27;
        self = v26;
        a7 = v156;

      }
      objc_msgSend(v22, "deferredNextContentItemID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v31 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "engineID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v178 = v32;
          v179 = 2114;
          v180 = v33;
          v181 = 2114;
          v182 = v160;
          _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil] edit=%{public}@", buf, 0x20u);

        }
        -[_MPCQueueControllerBehaviorMusicDataSourceState rollback](v160, "rollback");
        v34 = (void *)MEMORY[0x24BDD1540];
        v35 = CFSTR("The specified insertion position [head] was unsupported because the current item is a placeholder and there is no deferredNextContentItemAnchorID.");
LABEL_93:
        objc_msgSend(v34, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, v35);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, v130);
        goto LABEL_88;
      }
    }
    objc_msgSend(v22, "deferredNextContentItemID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v44);
    v45 = objc_claimAutoreleasedReturnValue();

    v149 = 3;
    v22 = (void *)v45;
LABEL_23:
    p_identifierList = &self->_identifierList;
    v47 = self->_identifierList;
    v155 = v47;
    if (v22)
    {
      v48 = v47;
      objc_msgSend(v22, "itemID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sectionID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v48) = -[MPShuffleableSectionedIdentifierList hasItem:inSection:](v48, "hasItem:inSection:", v49, v50);

      if ((v48 & 1) == 0)
      {
        v51 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "engineID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sectionID");
          v150 = v20;
          v54 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "itemID");
          v55 = v22;
          v56 = v15;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v178 = v52;
          v179 = 2114;
          v180 = v53;
          v181 = 2114;
          v182 = v54;
          v183 = 2114;
          v184 = v57;
          v185 = 2114;
          v186 = v160;
          _os_log_impl(&dword_210BD8000, v51, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | rolling back edit [identifierList does not contain afterItem] afterSection=%{public}@ afterItem=%{public}@ edit=%{public}@", buf, 0x34u);

          v15 = v56;
          v22 = v55;

          v20 = v150;
        }

        -[_MPCQueueControllerBehaviorMusicDataSourceState rollback](v160, "rollback");
        v58 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v22, "contentItemID");
        v59 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("Cannot insert after unknown item (in identifier list): %@"), v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, v60);
LABEL_87:
        v130 = v155;

LABEL_88:
        goto LABEL_89;
      }
    }
LABEL_29:
    v61 = objc_msgSend(v20, "shuffleType");
    if (v61 == 1000)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v62, "musicShuffleType");

      objc_msgSend(v20, "setShuffleType:", v61);
    }
    v158 = v22;
    if ((a7 & 2) != 0 && !v61 && self->_shuffleType)
    {
      self->_shuffleType = 0;
      v63 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "engineID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        MPShuffleTypeDescription();
        v66 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v178 = v64;
        v179 = 2114;
        v180 = v65;
        v181 = 2114;
        v182 = v66;
        _os_log_impl(&dword_210BD8000, v63, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | setting SIL shuffle type [first data source] shuffleType=%{public}@", buf, 0x20u);

      }
      -[MPShuffleableSectionedIdentifierList setShuffleType:](self->_identifierList, "setShuffleType:", 0);
      -[_MPCQueueControllerBehaviorMusic _emitEventsForPlaybackBehaviorChangeIfNeeded](self, "_emitEventsForPlaybackBehaviorChangeIfNeeded");
      objc_msgSend(WeakRetained, "behavior:didChangeShuffleType:", self, 0);
    }
    v67 = objc_msgSend(v20, "repeatType");
    if (v67 == 3)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v68, "musicRepeatType");

      objc_msgSend(v20, "setRepeatType:", v67);
    }
    if ((a7 & 4) != 0 && self->_repeatType != v67)
    {
      self->_repeatType = v67;
      -[_MPCQueueControllerBehaviorMusic _emitEventsForPlaybackBehaviorChangeIfNeeded](self, "_emitEventsForPlaybackBehaviorChangeIfNeeded");
      objc_msgSend(WeakRetained, "behavior:didChangeRepeatType:", self, v67);
    }
    if (objc_msgSend((id)objc_opt_class(), "supportsAutoPlay"))
    {
      v69 = objc_msgSend(v20, "queueEndAction");
      if (v69 == 1000)
      {
        objc_msgSend(v20, "userIdentity");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "autoPlayEnabledForUserIdentity:", v70);

        if (v72)
          v69 = 3;
        else
          v69 = 2;
        objc_msgSend(v20, "setQueueEndAction:", v69);

      }
      if ((a7 & 0x20) == 0 || self->_autoPlayState)
        goto LABEL_58;
      if (v69 == 3)
        v73 = 4;
      else
        v73 = 5;
    }
    else
    {
      if (self->_autoPlayState == 1)
      {
LABEL_58:
        v77 = -[_MPCQueueControllerBehaviorMusicDataSourceState initWithPlaybackContext:]([_MPCQueueControllerBehaviorMusicDataSourceState alloc], "initWithPlaybackContext:", v20);
        v78 = self->_dataSources;
        -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v77, "sectionIdentifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v78, "objectForKeyedSubscript:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        if (v80)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "handleFailureInMethod:object:file:lineNumber:description:", v143, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2906, CFSTR("Attempting to add datasource for an already existing section."));

        }
        objc_msgSend(v16, "eventStream");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusicDataSourceState setEventStream:](v77, "setEventStream:", v81);

        objc_msgSend(v16, "playerID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusicDataSourceState setPlayerID:](v77, "setPlayerID:", v82);

        v83 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "engineID");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
          v140 = self;
          v85 = a7;
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v77, "sectionIdentifier");
          v87 = v61;
          v88 = v20;
          v89 = v16;
          v90 = v15;
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v178 = v84;
          v179 = 2114;
          v180 = v86;
          v181 = 2048;
          v182 = v77;
          v183 = 2114;
          v184 = v91;
          _os_log_impl(&dword_210BD8000, v83, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding dataSource [] dataSource=%p section=%{public}@", buf, 0x2Au);

          v15 = v90;
          v16 = v89;
          v20 = v88;
          v61 = v87;

          a7 = v85;
          self = v140;

        }
        v92 = self->_dataSources;
        -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v77, "sectionIdentifier");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v92, "setObject:forKeyedSubscript:", v77, v93);

        -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v77, "sectionIdentifier");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic _emitEventsForAddingPlaybackContext:sectionIdentifier:](self, "_emitEventsForAddingPlaybackContext:sectionIdentifier:", v163, v94);

        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_446;
        aBlock[3] = &unk_24CAB34F0;
        v171 = a7;
        v172 = v61;
        v95 = v16;
        v165 = v95;
        v166 = self;
        v59 = v77;
        v167 = v59;
        v168 = WeakRetained;
        v173 = a7 & 1;
        v169 = v160;
        v170 = v15;
        v96 = _Block_copy(aBlock);
        if ((a7 & 2) == 0)
        {
          -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](v59, "playbackContext");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setShuffleType:", 0);

        }
        if ((a7 & 1) == 0)
        {
          -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](v59, "playbackContext");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "clearStartItem");

        }
        switch(v149)
        {
          case 0:
            v151 = v20;
            v144 = v15;
            v99 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v95, "engineID");
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
              v100 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v158, "itemID");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v158, "sectionID");
              v141 = self;
              v101 = a7;
              a7 = (unint64_t)v96;
              v102 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v178 = v138;
              v179 = 2114;
              v180 = v136;
              v181 = 2114;
              v182 = v100;
              v183 = 2114;
              v184 = v135;
              v185 = 2114;
              v186 = v102;
              _os_log_impl(&dword_210BD8000, v99, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=Head section=%{public}@ afterItem=%{public}@ inSection=%{public}@", buf, 0x34u);

              v96 = (void *)a7;
              LOBYTE(a7) = v101;
              self = v141;

            }
            goto LABEL_79;
          case 1:
            goto LABEL_73;
          case 2:
            v110 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v95, "engineID");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
              v153 = v20;
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
              v146 = v16;
              v113 = v15;
              v114 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v178 = v111;
              v179 = 2114;
              v180 = v112;
              v181 = 2114;
              v182 = v114;
              _os_log_impl(&dword_210BD8000, v110, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=Last section=%{public}@", buf, 0x20u);

              v15 = v113;
              v16 = v146;

              v20 = v153;
            }

            v115 = *p_identifierList;
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPShuffleableSectionedIdentifierList addDataSourceAtEnd:section:sequentially:completion:](v115, "addDataSourceAtEnd:section:sequentially:completion:", v59, v109, 1, v96);
            goto LABEL_83;
          case 3:
            v151 = v20;
            v144 = v15;
            v99 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v95, "engineID");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
              v117 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v158, "itemID");
              v139 = v95;
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v158, "sectionID");
              v142 = self;
              v119 = a7;
              a7 = (unint64_t)v96;
              v120 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v178 = v116;
              v179 = 2114;
              v180 = v137;
              v181 = 2114;
              v182 = v117;
              v183 = 2114;
              v184 = v118;
              v185 = 2114;
              v186 = v120;
              _os_log_impl(&dword_210BD8000, v99, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=Specified section=%{public}@ afterItem=%{public}@ inSection=%{public}@", buf, 0x34u);

              v96 = (void *)a7;
              LOBYTE(a7) = v119;
              self = v142;

              v95 = v139;
            }
LABEL_79:

            v121 = *p_identifierList;
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "itemID");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "sectionID");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:afterItem:inSection:completion:](v121, "addDataSource:section:sequentially:afterItem:inSection:completion:", v59, v109, 1, v122, v123, v96);

            v15 = v144;
            v20 = v151;
            goto LABEL_83;
          case 4:
            v124 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v95, "engineID");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
              v154 = v20;
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
              v147 = v16;
              v127 = v15;
              v128 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v178 = v125;
              v179 = 2114;
              v180 = v126;
              v181 = 2114;
              v182 = v128;
              _os_log_impl(&dword_210BD8000, v124, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=Start section=%{public}@", buf, 0x20u);

              v15 = v127;
              v16 = v147;

              v20 = v154;
            }

            v129 = *p_identifierList;
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPShuffleableSectionedIdentifierList addDataSourceAtStart:section:completion:](v129, "addDataSourceAtStart:section:completion:", v59, v109, v96);
            goto LABEL_83;
          default:
            if (v149 == 100)
            {
              v103 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v95, "engineID");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
                v152 = v20;
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
                v145 = v16;
                v106 = v15;
                v107 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v178 = v104;
                v179 = 2114;
                v180 = v105;
                v181 = 2114;
                v182 = v107;
                v183 = 2114;
                v184 = v161;
                _os_log_impl(&dword_210BD8000, v103, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=AfterSection section=%{public}@ afterSection=%{public}@", buf, 0x2Au);

                v15 = v106;
                v16 = v145;

                v20 = v152;
              }

              v108 = *p_identifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v59, "sectionIdentifier");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPShuffleableSectionedIdentifierList addDataSource:section:sequentially:afterTailOfSection:completion:](v108, "addDataSource:section:sequentially:afterTailOfSection:completion:", v59, v109, 1, v161, v96);
            }
            else
            {
LABEL_73:
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "handleFailureInMethod:object:file:lineNumber:description:", v143, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 2987, CFSTR("Unsupported insertion position %d for %s | "), v149, "-[_MPCQueueControllerBehaviorMusic _addPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:]");
            }
LABEL_83:

            if ((a7 & 0x10) == 0 && !self->_hasUserMutations)
              self->_hasUserMutations = 1;
            objc_msgSend(v95, "behaviorDidChange");

            v60 = v165;
            v22 = v158;
            break;
        }
        goto LABEL_87;
      }
      v74 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "engineID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v178 = v75;
        v179 = 2114;
        v180 = v76;
        _os_log_impl(&dword_210BD8000, v74, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | disabling auto play [data source unsupported]", buf, 0x16u);

      }
      v73 = 1;
    }
    -[_MPCQueueControllerBehaviorMusic _transitionToAutoPlayState:](self, "_transitionToAutoPlayState:", v73);
    goto LABEL_58;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v16, "engineID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v178 = v18;
    v179 = 2114;
    v180 = v19;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | failed [insert at Tail is not supported -- MediaPlayer/QueueFA is OFF]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("Cannot insert at Tail [MediaPlayer/QueueFA is OFF]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, v20);
LABEL_89:

}

- (void)_addAutoPlayPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8
{
  id v13;
  void (**v14)(id, MPSectionedIdentifierList *);
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  MPSectionedIdentifierList *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _MPCQueueControllerBehaviorMusicDataSourceState *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  _MPCQueueControllerBehaviorMusic *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  _MPCQueueControllerBehaviorMusicDataSourceState *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  MPSectionedIdentifierList *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  id v54;
  _MPCQueueControllerBehaviorMusicDataSourceState *v55;
  _MPCQueueControllerBehaviorMusic *v56;
  NSMutableDictionary *dataSources;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  NSMutableDictionary *v67;
  void *v68;
  void *v69;
  void *v70;
  _MPCQueueControllerBehaviorMusicDataSourceState *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  _MPCQueueControllerBehaviorMusicDataSourceState *v76;
  void *v77;
  void *v78;
  const char *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  id v83;
  _MPCQueueControllerBehaviorMusicDataSourceState *v84;
  MPSectionedIdentifierList *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  _MPCQueueControllerBehaviorMusicDataSourceState *v90;
  void *v91;
  void *v92;
  void *v93;
  MPSectionedIdentifierList *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  id v98;
  _MPCQueueControllerBehaviorMusicDataSourceState *v99;
  MPSectionedIdentifierList *v100;
  MPSectionedIdentifierList *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  id v107;
  _MPCQueueControllerBehaviorMusicDataSourceState *v108;
  MPSectionedIdentifierList *v109;
  NSObject *v110;
  uint64_t v111;
  _MPCQueueControllerBehaviorMusic *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  MPSectionedIdentifierList **p_autoPlayIdentifierList;
  MPSectionedIdentifierList *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v126;
  void *v127;
  _MPCQueueControllerBehaviorMusic *v128;
  id v129;
  MPSectionedIdentifierList *v130;
  char v131;
  id v132;
  id v133;
  _QWORD aBlock[4];
  id v135;
  _MPCQueueControllerBehaviorMusic *v136;
  id v137;
  _MPCQueueControllerBehaviorMusicDataSourceState *v138;
  MPSectionedIdentifierList *v139;
  void (**v140)(id, MPSectionedIdentifierList *);
  char v141;
  uint8_t buf[4];
  void *v143;
  __int16 v144;
  void *v145;
  __int16 v146;
  _MPCQueueControllerBehaviorMusicDataSourceState *v147;
  __int16 v148;
  id v149;
  __int16 v150;
  void *v151;
  uint64_t v152;

  v131 = a7;
  v152 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v133 = a5;
  v132 = a6;
  v14 = (void (**)(id, MPSectionedIdentifierList *))a8;
  v15 = (void *)objc_msgSend(v13, "copy");
  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BehaviorMusic-addAutoPlayPlaybackContext-<%@: %p>"), objc_opt_class(), v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginEditWithReason:", v22);
    v130 = (MPSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();

    v128 = self;
    if (a4)
    {
      if (a4 != 3)
      {
        p_autoPlayIdentifierList = &self->_autoPlayIdentifierList;
        v48 = self->_autoPlayIdentifierList;
        goto LABEL_25;
      }
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v133);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "type") != 3)
        goto LABEL_19;
      v24 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "engineID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deferredNextContentItemID");
        v27 = v23;
        v28 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v143 = v25;
        v144 = 2114;
        v145 = v26;
        v146 = 2114;
        v147 = v28;
        _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | converting PositionSpecified item to deferredNextContentItem [specified placeholder item] deferredNextContentItem=%{public}@", buf, 0x20u);

        v23 = v27;
      }

      objc_msgSend(v23, "deferredNextContentItemID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v21 = v130;
        -[MPSectionedIdentifierList rollback](v130, "rollback");
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "engineID");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = self;
          v33 = v23;
          v34 = (void *)v31;
          -[_MPCQueueControllerBehaviorMusic sessionID](v32, "sessionID");
          v35 = v15;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v143 = v34;
          v144 = 2114;
          v145 = v36;
          _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil]", buf, 0x16u);

          v15 = v35;
          v23 = v33;
        }

        v37 = (void *)MEMORY[0x24BDD1540];
        v38 = CFSTR("The specified insertion position [specified] was unsupported because the specified item is a placeholder and there is no deferredNextContentItemAnchorID.");
LABEL_67:
        objc_msgSend(v37, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, v38);
        v48 = (MPSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, v48);
        goto LABEL_62;
      }
    }
    else
    {
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v133);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "type") != 3)
      {
        a4 = 0;
LABEL_22:
        p_autoPlayIdentifierList = &self->_autoPlayIdentifierList;
        v48 = self->_autoPlayIdentifierList;
        if (v23)
        {
          v49 = v16;
          objc_msgSend(v23, "itemID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v23;
          objc_msgSend(v23, "sectionID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = -[MPSectionedIdentifierList hasItem:inSection:](v48, "hasItem:inSection:", v50, v52);

          if ((v53 & 1) == 0)
          {
            v21 = v130;
            -[MPSectionedIdentifierList rollback](v130, "rollback");
            v87 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v49, "engineID");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](v128, "sessionID");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "sectionID");
              v124 = v15;
              v90 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "itemID");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v143 = v88;
              v144 = 2114;
              v145 = v89;
              v146 = 2114;
              v147 = v90;
              v148 = 2114;
              v149 = v91;
              _os_log_impl(&dword_210BD8000, v87, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | rolling back edit [autoPlayIdentifierList does not contain afterItem] afterSection=%{public}@ afterItem=%{public}@", buf, 0x2Au);

              v21 = v130;
              v15 = v124;

            }
            v92 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(v51, "contentItemID");
            v71 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
            v93 = v92;
            v23 = v51;
            objc_msgSend(v93, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("Cannot insert after unknown item (in autoplay identifier list): %@"), v71);
            v94 = (MPSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
            v14[2](v14, v94);
            v16 = v49;
            goto LABEL_61;
          }
          v16 = v49;
LABEL_26:
          v127 = v16;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v54 = v15;
            if (objc_msgSend(v54, "continueListeningStation"))
              objc_msgSend(v54, "setContinueListeningQueueProvider:", v128);

          }
          v120 = v48;
          v122 = v51;
          v55 = -[_MPCQueueControllerBehaviorMusicDataSourceState initWithPlaybackContext:]([_MPCQueueControllerBehaviorMusicDataSourceState alloc], "initWithPlaybackContext:", v15);
          v56 = v128;
          dataSources = v128->_dataSources;
          -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v55, "sectionIdentifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](dataSources, "objectForKeyedSubscript:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "handleFailureInMethod:object:file:lineNumber:description:", a2, v128, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3064, CFSTR("Attempting to add datasource for an already existing section."));

          }
          v16 = v127;
          objc_msgSend(v127, "eventStream");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicDataSourceState setEventStream:](v55, "setEventStream:", v60);

          objc_msgSend(v127, "playerID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicDataSourceState setPlayerID:](v55, "setPlayerID:", v61);

          v62 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v127, "engineID");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusic sessionID](v128, "sessionID");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v55, "sectionIdentifier");
            v65 = v13;
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v143 = v63;
            v144 = 2114;
            v145 = v64;
            v146 = 2048;
            v147 = v55;
            v148 = 2114;
            v149 = v66;
            _os_log_impl(&dword_210BD8000, v62, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding dataSource [] dataSource=%p section=%{public}@", buf, 0x2Au);

            v13 = v65;
            v56 = v128;

            v16 = v127;
          }

          v67 = v56->_dataSources;
          -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v55, "sectionIdentifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v67, "setObject:forKeyedSubscript:", v55, v68);

          -[MPSectionedIdentifierList identifier](v56->_autoPlayIdentifierList, "identifier");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v55, "sectionIdentifier");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusic _emitEventsForAddingPlaybackContext:sectionIdentifier:](v56, "_emitEventsForAddingPlaybackContext:sectionIdentifier:", v13, v70);

          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __131___MPCQueueControllerBehaviorMusic__addAutoPlayPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke;
          aBlock[3] = &unk_24CAB3540;
          v118 = v69;
          v135 = v118;
          v136 = v56;
          v121 = v16;
          v137 = v121;
          v71 = v55;
          v138 = v71;
          v139 = v130;
          v140 = v14;
          v141 = v131 & 1;
          v123 = _Block_copy(aBlock);
          -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](v71, "playbackContext");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setShuffleType:", 0);

          if ((v131 & 1) == 0)
          {
            -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](v71, "playbackContext");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "clearStartItem");

          }
          v48 = v120;
          switch(a4)
          {
            case 0:
              v129 = v13;
              v74 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                goto LABEL_53;
              objc_msgSend(v121, "engineID");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusic sessionID](v56, "sessionID");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
              v76 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "itemID");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "sectionID");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v143 = v126;
              v144 = 2114;
              v145 = v75;
              v146 = 2114;
              v147 = v76;
              v148 = 2114;
              v149 = v77;
              v150 = 2114;
              v151 = v78;
              v79 = "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=Head sect"
                    "ion=%{public}@ afterItem=%{public}@ inSection=%{public}@";
              goto LABEL_52;
            case 1:
              goto LABEL_46;
            case 2:
              v95 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v121, "engineID");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusic sessionID](v56, "sessionID");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
                v98 = v13;
                v99 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v143 = v96;
                v144 = 2114;
                v145 = v97;
                v146 = 2114;
                v147 = v99;
                _os_log_impl(&dword_210BD8000, v95, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=Last section=%{public}@", buf, 0x20u);

                v13 = v98;
                v48 = v120;
                v56 = v128;

                v16 = v127;
              }

              v100 = *p_autoPlayIdentifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPSectionedIdentifierList addDataSourceAtEnd:section:completion:](v100, "addDataSourceAtEnd:section:completion:", v71, v86, v123);
              goto LABEL_57;
            case 3:
              v129 = v13;
              v74 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v121, "engineID");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusic sessionID](v56, "sessionID");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
                v76 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "itemID");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "sectionID");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v143 = v126;
                v144 = 2114;
                v145 = v75;
                v146 = 2114;
                v147 = v76;
                v148 = 2114;
                v149 = v77;
                v150 = 2114;
                v151 = v78;
                v79 = "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=Specifi"
                      "ed section=%{public}@ afterItem=%{public}@ inSection=%{public}@";
LABEL_52:
                _os_log_impl(&dword_210BD8000, v74, OS_LOG_TYPE_DEFAULT, v79, buf, 0x34u);

              }
LABEL_53:

              v101 = *p_autoPlayIdentifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "itemID");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "sectionID");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPSectionedIdentifierList addDataSource:section:afterItem:inSection:completion:](v101, "addDataSource:section:afterItem:inSection:completion:", v71, v86, v102, v103, v123);

              v16 = v127;
              v13 = v129;
              goto LABEL_57;
            case 4:
              v104 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v121, "engineID");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusic sessionID](v56, "sessionID");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
                v107 = v13;
                v108 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v143 = v105;
                v144 = 2114;
                v145 = v106;
                v146 = 2114;
                v147 = v108;
                _os_log_impl(&dword_210BD8000, v104, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=Start section=%{public}@", buf, 0x20u);

                v13 = v107;
                v48 = v120;
                v56 = v128;

                v16 = v127;
              }

              v109 = *p_autoPlayIdentifierList;
              -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPSectionedIdentifierList addDataSourceAtStart:section:completion:](v109, "addDataSourceAtStart:section:completion:", v71, v86, v123);
              goto LABEL_57;
            default:
              v48 = v120;
              if (a4 == 100)
              {
                v80 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v121, "engineID");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_MPCQueueControllerBehaviorMusic sessionID](v56, "sessionID");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
                  v83 = v13;
                  v84 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v143 = v81;
                  v144 = 2114;
                  v145 = v82;
                  v146 = 2114;
                  v147 = v84;
                  v148 = 2114;
                  v149 = v132;
                  _os_log_impl(&dword_210BD8000, v80, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=AfterSection section=%{public}@ afterSection=%{public}@", buf, 0x2Au);

                  v13 = v83;
                  v48 = v120;
                  v56 = v128;

                  v16 = v127;
                }

                v85 = *p_autoPlayIdentifierList;
                -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](v71, "sectionIdentifier");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                -[MPSectionedIdentifierList addDataSource:section:afterTailOfSection:completion:](v85, "addDataSource:section:afterTailOfSection:completion:", v71, v86, v132, v123);
              }
              else
              {
LABEL_46:
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, v56, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3141, CFSTR("Unsupported insertion position %d for %s | "), a4, "-[_MPCQueueControllerBehaviorMusic _addAutoPlayPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:]");
              }
LABEL_57:

              v21 = v130;
              if ((v131 & 0x10) == 0 && !v56->_hasUserMutations)
                v56->_hasUserMutations = 1;
              objc_msgSend(v121, "behaviorDidChange");

              v23 = v122;
              v94 = (MPSectionedIdentifierList *)v118;
              break;
          }
LABEL_61:

LABEL_62:
          goto LABEL_63;
        }
LABEL_25:
        v51 = 0;
        goto LABEL_26;
      }
      v39 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "engineID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deferredNextContentItemID");
        v42 = v23;
        v43 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v143 = v40;
        v144 = 2114;
        v145 = v41;
        v146 = 2114;
        v147 = v43;
        _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | converting PositionHead to PositionSpecified after deferredNextContentItem [head (current item was placeholder)] deferredNextContentItem=%{public}@", buf, 0x20u);

        v23 = v42;
      }

      objc_msgSend(v23, "deferredNextContentItemID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        v21 = v130;
        -[MPSectionedIdentifierList rollback](v130, "rollback");
        v110 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "engineID");
          v111 = objc_claimAutoreleasedReturnValue();
          v112 = self;
          v113 = v23;
          v114 = (void *)v111;
          -[_MPCQueueControllerBehaviorMusic sessionID](v112, "sessionID");
          v115 = v15;
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v143 = v114;
          v144 = 2114;
          v145 = v116;
          _os_log_impl(&dword_210BD8000, v110, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil]", buf, 0x16u);

          v15 = v115;
          v23 = v113;
        }

        v37 = (void *)MEMORY[0x24BDD1540];
        v38 = CFSTR("The specified insertion position [head] was unsupported because the current item is a placeholder and there is no deferredNextContentItemAnchorID.");
        goto LABEL_67;
      }
    }
    objc_msgSend(v23, "deferredNextContentItemID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v45);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v23;
    v23 = (void *)v46;

LABEL_19:
    a4 = 3;
    goto LABEL_22;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v16, "engineID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v19 = v16;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v143 = v18;
    v144 = 2114;
    v145 = v20;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | failed [insert at Tail is not supported -- MediaPlayer/QueueFA is OFF]", buf, 0x16u);

    v16 = v19;
  }

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("Cannot insert at Tail [MediaPlayer/QueueFA is OFF"));
  v21 = (MPSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v21);
LABEL_63:

}

- (int64_t)_countOfItemsWithinSection:(id)a3 maxCount:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDDCBC0], "positionForHeadOfSection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCBC0], "positionForTailOfSection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:](_MPCQueueControllerEnumerator, "enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:", self, 0, 16, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (a4 <= 1)
    v11 = 1;
  else
    v11 = a4;
  while (1)
  {
    objc_msgSend(v9, "nextObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      break;
    if (v11 == ++v10)
    {
      v10 = v11;
      break;
    }
  }

  return v10;
}

- (void)_evaluateLoadingDataSourceItemThresholds
{
  void *v3;
  NSMutableDictionary *dataSources;
  id v5;
  _QWORD v6[5];
  id v7;

  -[_MPCQueueControllerBehaviorMusic host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dataSources = self->_dataSources;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76___MPCQueueControllerBehaviorMusic__evaluateLoadingDataSourceItemThresholds__block_invoke;
  v6[3] = &unk_24CAB3338;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSources, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (id)_upNextSectionIdentifierForItem:(id)a3
{
  return -[_MPCQueueControllerBehaviorMusic _upNextSectionIdentifierForItem:shouldLookInBaseList:](self, "_upNextSectionIdentifierForItem:shouldLookInBaseList:", a3, 1);
}

- (id)_autoPlayUpNextSectionIdentifierForItem:(id)a3
{
  return -[_MPCQueueControllerBehaviorMusic _upNextSectionIdentifierForItem:shouldLookInBaseList:](self, "_upNextSectionIdentifierForItem:shouldLookInBaseList:", a3, 0);
}

- (id)_upNextSectionIdentifierForItem:(id)a3 shouldLookInBaseList:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  MPShuffleableSectionedIdentifierList *identifierList;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  SEL v29;
  _MPCQueueControllerBehaviorMusic *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  id v38;
  void *v39;
  char v40;
  uint64_t v41;
  MPSectionedIdentifierList *autoPlayIdentifierList;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  SEL v49;
  _MPCQueueControllerBehaviorMusic *v50;
  uint64_t v51;
  const __CFString *v52;
  void *v53;
  id v54;
  void *v55;
  char v56;
  void *v57;
  id v58;
  void *v59;
  char v60;
  uint64_t v61;
  void *v63;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "type"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3476, CFSTR("unsupported components type: %d"), objc_msgSend(v6, "type"));

    if (v4)
      goto LABEL_3;
  }
  else if (v4)
  {
LABEL_3:
    -[MPShuffleableSectionedIdentifierList orderedSectionIdentifiers](self->_identifierList, "orderedSectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:
  v9 = objc_msgSend(v7, "count");
  if (v9 - 1 < 0)
  {
    v12 = 0;
LABEL_12:
    v11 = 0;
  }
  else
  {
    v10 = v9;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", --v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("UPNXT-"));
      if ((v12 & 1) != 0)
        break;

      if (v10 <= 0)
        goto LABEL_12;
    }
  }
  -[MPSectionedIdentifierList orderedSectionIdentifiers](self->_autoPlayIdentifierList, "orderedSectionIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (v14 - 1 < 0)
  {
LABEL_17:
    v17 = 0;
    if (!v11)
      goto LABEL_23;
  }
  else
  {
    v15 = v14;
    while (1)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", --v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "hasPrefix:", CFSTR("UPNXT-")))
        break;

      if (v15 <= 0)
        goto LABEL_17;
    }

    v12 = 0;
    v17 = 1;
    v11 = v16;
    if (!v16)
    {
LABEL_23:
      v23 = 0;
      goto LABEL_56;
    }
  }
  if (!v6)
  {
    v23 = v11;
    goto LABEL_56;
  }
  v18 = (void *)MEMORY[0x24BDDCBC0];
  objc_msgSend(v6, "itemID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "positionForItem:inSection:", v19, v20);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  identifierList = self->_identifierList;
  objc_msgSend(v6, "sectionID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(identifierList) = -[MPShuffleableSectionedIdentifierList hasSection:](identifierList, "hasSection:", v22);

  if ((_DWORD)identifierList)
  {
    if (v17)
    {
      v23 = v11;
      goto LABEL_55;
    }
    -[MPShuffleableSectionedIdentifierList enumeratorWithOptions:startPosition:endPosition:](self->_identifierList, "enumeratorWithOptions:startPosition:endPosition:", 25, v63, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nextObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      do
      {
        switch(objc_msgSend(v26, "entryType"))
        {
          case 0:
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            v29 = a2;
            v30 = self;
            v31 = 3546;
            v32 = CFSTR("Encountered unexpected Unknown entry while reverse enumerating");
            goto LABEL_36;
          case 1:
            goto LABEL_63;
          case 2:
            objc_msgSend(v26, "trackingEntryResult");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "sectionIdentifier");
            v34 = (id)objc_claimAutoreleasedReturnValue();
            if (v11 == v34)
            {

LABEL_63:
              v23 = v11;
              goto LABEL_66;
            }
            v35 = v34;
            v36 = objc_msgSend(v11, "isEqual:", v34);

            if ((v36 & 1) != 0)
              goto LABEL_63;
            break;
          case 4:
            objc_msgSend(v26, "trackingEntryResult");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "sectionIdentifier");
            v38 = (id)objc_claimAutoreleasedReturnValue();
            if (v11 == v38)
            {

LABEL_65:
              v23 = 0;
LABEL_66:

              goto LABEL_55;
            }
            v39 = v38;
            v40 = objc_msgSend(v11, "isEqual:", v38);

            if ((v40 & 1) != 0)
              goto LABEL_65;
            break;
          case 5:
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            v29 = a2;
            v30 = self;
            v31 = 3543;
            v32 = CFSTR("Encountered unexpected End entry while reverse enumerating");
LABEL_36:
            objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v29, v30, CFSTR("_MPCQueueControllerBehaviorMusic.m"), v31, v32);

            break;
          default:
            break;
        }
        objc_msgSend(v24, "nextObject");
        v41 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v41;
      }
      while (v41);
    }

  }
  autoPlayIdentifierList = self->_autoPlayIdentifierList;
  objc_msgSend(v6, "sectionID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(autoPlayIdentifierList) = -[MPSectionedIdentifierList hasSection:](autoPlayIdentifierList, "hasSection:", v43);

  if (((v12 | autoPlayIdentifierList ^ 1) & 1) != 0)
  {
LABEL_54:
    v23 = 0;
    goto LABEL_55;
  }
  -[MPSectionedIdentifierList enumeratorWithOptions:startPosition:endPosition:](self->_autoPlayIdentifierList, "enumeratorWithOptions:startPosition:endPosition:", 25, v63, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "nextObject");
  v45 = objc_claimAutoreleasedReturnValue();
  if (!v45)
  {
LABEL_53:

    goto LABEL_54;
  }
  v46 = (void *)v45;
  while (2)
  {
    switch(objc_msgSend(v46, "entryType"))
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        v49 = a2;
        v50 = self;
        v51 = 3583;
        v52 = CFSTR("Encountered unexpected Unknown entry while reverse enumerating");
        goto LABEL_51;
      case 1:
        goto LABEL_58;
      case 2:
        objc_msgSend(v46, "trackingEntryResult");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "sectionIdentifier");
        v54 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v54)
        {

LABEL_58:
          v23 = v11;
          goto LABEL_61;
        }
        v55 = v54;
        v56 = objc_msgSend(v11, "isEqual:", v54);

        if ((v56 & 1) != 0)
          goto LABEL_58;
        goto LABEL_52;
      case 4:
        objc_msgSend(v46, "trackingEntryResult");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "sectionIdentifier");
        v58 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 != v58)
        {
          v59 = v58;
          v60 = objc_msgSend(v11, "isEqual:", v58);

          if ((v60 & 1) != 0)
            goto LABEL_60;
LABEL_52:
          objc_msgSend(v44, "nextObject");
          v61 = objc_claimAutoreleasedReturnValue();

          v46 = (void *)v61;
          if (!v61)
            goto LABEL_53;
          continue;
        }

LABEL_60:
        v23 = 0;
LABEL_61:

LABEL_55:
LABEL_56:

        return v23;
      case 5:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        v49 = a2;
        v50 = self;
        v51 = 3580;
        v52 = CFSTR("Encountered unexpected End entry while reverse enumerating");
LABEL_51:
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", v49, v50, CFSTR("_MPCQueueControllerBehaviorMusic.m"), v51, v52);

        goto LABEL_52;
      default:
        goto LABEL_52;
    }
  }
}

- (unint64_t)_playbackContextOptions
{
  _BOOL8 v2;

  v2 = self->_activeHostingSharedSessionID != 0;
  return MSVDeviceSupportsDelegatedIdentities() | (unint64_t)(2 * v2);
}

- (void)_setRepeatType:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_repeatType != a3)
  {
    self->_repeatType = a3;
    -[_MPCQueueControllerBehaviorMusic host](self, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginEditWithReason:", CFSTR("BehaviorMusic-setRepeatType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "engineID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      MPNSStringFromRepeatType();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _setRepeatType: | committing edit [repeatType changed] repeatType=%{public}@", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(v6, "commit");
    -[_MPCQueueControllerBehaviorMusic _emitEventsForPlaybackBehaviorChangeIfNeeded](self, "_emitEventsForPlaybackBehaviorChangeIfNeeded");
    WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    objc_msgSend(WeakRetained, "behavior:didChangeRepeatType:", self, a3);

  }
}

- (void)_setShuffleType:(int64_t)a3 startingContentItemID:(id)a4 randomSource:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  if (a3 == 1000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3640, CFSTR("User default should be resolved before setting on queue controller."));

  }
  if (self->_shuffleType != a3)
  {
    self->_shuffleType = a3;
    if (v9)
    {
      -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v11, "sectionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "type") == 3 || objc_msgSend(v11, "type") == 2)
    {

      v13 = 0;
      v12 = 0;
    }
    v24 = v9;
    -[_MPCQueueControllerBehaviorMusic host](self, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "beginEditWithReason:", CFSTR("BehaviorMusic-setShuffleType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPShuffleableSectionedIdentifierList setShuffleType:startingItem:inSection:randomSource:](self->_identifierList, "setShuffleType:startingItem:inSection:randomSource:", a3, v13, v12, v10);
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "engineID");
      v22 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      MPShuffleTypeDescription();
      v23 = v10;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      v29 = 2114;
      v30 = v19;
      v31 = 2114;
      v32 = v13;
      v33 = 2114;
      v34 = v12;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _setShuffleType:startingContentItemID:randomSource: | committing edit [queue order changed] shuffleType=%{public}@ startItem=%{public}@ startSection=%{public}@", buf, 0x34u);

      v15 = v22;
      v10 = v23;
    }

    objc_msgSend(v15, "commit");
    -[_MPCQueueControllerBehaviorMusic _emitEventsForPlaybackBehaviorChangeIfNeeded](self, "_emitEventsForPlaybackBehaviorChangeIfNeeded");
    WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    objc_msgSend(WeakRetained, "behavior:didChangeShuffleType:", self, a3);

    v9 = v24;
  }

}

- (id)_tailInsertionComponentsForUpNextSectionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    -[_MPCQueueControllerBehaviorMusic _identifierListForSection:](self, "_identifierListForSection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDCBC0], "positionForTailOfSection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enumeratorWithOptions:startPosition:endPosition:", 9, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    while (1)
    {
      v9 = v8;
      objc_msgSend(v7, "nextObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      if (objc_msgSend(v8, "entryType") == 3)
      {
        objc_msgSend(v8, "itemResult");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sectionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "itemResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "itemIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    v14 = 0;
LABEL_8:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_transitionToAutoPlayState:(int64_t)a3
{
  _MPCQueueControllerBehaviorMusic *v4;
  int v5;
  int v6;
  int64_t v7;
  int v8;
  int v9;
  int v10;
  os_log_t v11;
  uint64_t v12;
  __int16 v13;
  BOOL v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  int64_t v25;
  int v26;
  char v27;
  int v28;
  void *v29;
  MPSectionedIdentifierListPosition *autoPlayEndPosition;
  MPSectionedIdentifierList *autoPlayIdentifierList;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  id WeakRetained;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  MPSectionedIdentifierList *v45;
  MPSectionedIdentifierList *v46;
  MPSectionedIdentifierList *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t autoPlayState;
  __CFString *v60;
  __CFString *v61;
  _MPCQueueControllerBehaviorMusic *v62;
  MPSectionedIdentifierList *v64;
  int v65;
  int v66;
  int v67;
  _QWORD v68[5];
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  MPSectionedIdentifierList *v73;
  SEL v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v4 = self;
  v81 = *MEMORY[0x24BDAC8D0];
  v5 = -[_MPCQueueControllerBehaviorMusic autoPlayEnabled](self, "autoPlayEnabled");
  v6 = 0;
  v7 = a3 | (v4->_autoPlayState << 16);
  if (v7 <= 393216)
  {
    if (v7 <= 0x40000)
    {
      if (v7 > 0x20000)
      {
        if (v7 <= 196608)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          LOBYTE(v11) = 0;
          if (v7 == 131073)
            goto LABEL_43;
          v12 = 131081;
LABEL_39:
          if (v7 == v12)
          {
            v6 = 0;
            v8 = 0;
            v9 = 0;
            v10 = 1;
            goto LABEL_41;
          }
          goto LABEL_90;
        }
        v13 = 0;
        if (v7 != 196609)
        {
          v12 = 196617;
          goto LABEL_39;
        }
LABEL_42:
        v8 = 0;
        v10 = 0;
        v9 = v6;
        LOWORD(v11) = v13 | v4->_activeItemFlags;
        v6 = 1;
        goto LABEL_43;
      }
      v14 = (unint64_t)v7 > 5 || ((1 << a3) & 0x32) == 0;
LABEL_28:
      v8 = 0;
      v9 = 0;
      v10 = 0;
      LOBYTE(v11) = 0;
      if (!v14)
        goto LABEL_43;
      goto LABEL_90;
    }
    if (v7 > 327680)
    {
      v15 = v7 - 327681;
      v14 = v15 > 3 || v15 == 1;
      goto LABEL_28;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    LOBYTE(v11) = 0;
    if ((unint64_t)(v7 - 262145) < 2)
      goto LABEL_43;
    if (v7 != 262147)
    {
      v12 = 262153;
      goto LABEL_39;
    }
LABEL_24:
    v6 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
LABEL_41:
    LOBYTE(v11) = 1;
    goto LABEL_43;
  }
  if (v7 <= 524290)
  {
    if (v7 <= 458752)
    {
      switch(v7)
      {
        case 393217:
        case 393219:
          goto LABEL_34;
        case 393218:
          v13 = 0;
          v6 = 1;
          goto LABEL_42;
        case 393223:
          goto LABEL_24;
        default:
          goto LABEL_90;
      }
    }
    if (v7 == 458753)
    {
LABEL_34:
      v6 = 1;
      v13 = 1;
      goto LABEL_42;
    }
    if (v7 != 458755)
    {
      if (v7 != 458760)
      {
LABEL_90:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        autoPlayState = v4->_autoPlayState;
        if (autoPlayState >= 0xA)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedState:%ld"), v4->_autoPlayState);
          v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v60 = off_24CAB3730[autoPlayState];
        }
        if ((unint64_t)a3 >= 0xA)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedState:%ld"), a3);
          v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v61 = off_24CAB3730[a3];
        }
        objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3785, CFSTR("Unexpected state transition from: %@ to: %@"), v60, v61);

        v6 = 0;
        v8 = 0;
        v9 = 0;
        v10 = 0;
        LOBYTE(v11) = 0;
        goto LABEL_43;
      }
      goto LABEL_24;
    }
LABEL_35:
    v6 = 0;
    v8 = 0;
    v10 = 0;
LABEL_36:
    v9 = 1;
    goto LABEL_41;
  }
  if (v7 <= 589824)
  {
    if (v7 != 524291 && v7 != 524295)
    {
      v12 = 524297;
      goto LABEL_39;
    }
    goto LABEL_35;
  }
  v13 = 0;
  switch(v7)
  {
    case 589825:
      goto LABEL_42;
    case 589827:
      goto LABEL_24;
    case 589830:
      v6 = 0;
      v10 = 0;
      v8 = 1;
      goto LABEL_36;
    case 589833:
      v6 = 0;
      v8 = 0;
      v9 = 0;
      LOBYTE(v11) = 0;
      v10 = 1;
      break;
    default:
      goto LABEL_90;
  }
LABEL_43:
  v65 = v10;
  v66 = v9;
  -[_MPCQueueControllerBehaviorMusic host](v4, "host");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = v4->_autoPlayState;
  if (v18 >= 0xA)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedState:%ld"), v4->_autoPlayState);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_24CAB3730[v18];
  }
  if ((unint64_t)a3 >= 0xA)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedState:%ld"), a3);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_24CAB3730[a3];
  }
  objc_msgSend(v17, "stringWithFormat:", CFSTR("[ %@ --> %@ ]"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject engineID](v16, "engineID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](v4, "sessionID");
    v62 = v4;
    v24 = v6;
    v25 = a3;
    v26 = v8;
    v27 = (char)v11;
    v11 = v16;
    v28 = v5;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v76 = v23;
    v77 = 2114;
    v78 = v29;
    v79 = 2114;
    v80 = v21;
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | updating state [] transition=%{public}@", buf, 0x20u);

    v5 = v28;
    v16 = v11;
    LOBYTE(v11) = v27;
    v8 = v26;
    a3 = v25;
    v6 = v24;
    v4 = v62;

  }
  v4->_autoPlayState = a3;
  if (v66)
  {
    autoPlayEndPosition = v4->_autoPlayEndPosition;
    v4->_autoPlayEndPosition = 0;

    if (!v6)
      goto LABEL_53;
LABEL_58:
    autoPlayIdentifierList = v4->_autoPlayIdentifierList;
    v4->_autoPlayIdentifierList = 0;

    if (v8)
      goto LABEL_54;
LABEL_59:
    if ((v11 & 1) != 0)
      goto LABEL_60;
LABEL_64:
    v37 = -[_MPCQueueControllerBehaviorMusic autoPlayEnabled](v4, "autoPlayEnabled");
    if (v5 != v37)
    {
      v38 = v37;
      WeakRetained = objc_loadWeakRetained((id *)&v4->_musicBehaviorDelegate);
      v40 = WeakRetained;
      if (v38)
        v41 = 3;
      else
        v41 = 2;
      objc_msgSend(WeakRetained, "behavior:didChangeActionAtQueueEnd:", v4, v41);

    }
    -[_MPCQueueControllerBehaviorMusic _emitEventsForPlaybackBehaviorChangeIfNeeded](v4, "_emitEventsForPlaybackBehaviorChangeIfNeeded");
    if (v65 && v4->_autoPlayIsTriggered && v4->_autoPlayState != 6)
    {
      v42 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject engineID](v16, "engineID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCQueueControllerBehaviorMusic sessionID](v4, "sessionID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v76 = v43;
        v77 = 2114;
        v78 = v44;
        v79 = 2114;
        v80 = v21;
        _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | loading autoplay [triggered] transition=%{public}@", buf, 0x20u);

      }
      -[_MPCQueueControllerBehaviorMusic _transitionToAutoPlayState:](v4, "_transitionToAutoPlayState:", 6);
    }
    -[NSObject behaviorDidChange](v16, "behaviorDidChange");
    goto LABEL_76;
  }
  if (v6)
    goto LABEL_58;
LABEL_53:
  if (!v8)
    goto LABEL_59;
LABEL_54:
  if (v4->_autoPlayIdentifierList
    || -[MPShuffleableSectionedIdentifierList itemCount](v4->_identifierList, "itemCount") < 1)
  {
    -[_MPCQueueControllerBehaviorMusic _transitionToAutoPlayState:](v4, "_transitionToAutoPlayState:", 7);
    if ((v11 & 1) != 0)
      goto LABEL_60;
    goto LABEL_64;
  }
  v67 = v5;
  v45 = (MPSectionedIdentifierList *)objc_alloc_init(MEMORY[0x24BDDCBB8]);
  v46 = v4->_autoPlayIdentifierList;
  v4->_autoPlayIdentifierList = v45;

  -[MPSectionedIdentifierList setDelegate:](v4->_autoPlayIdentifierList, "setDelegate:", v4);
  -[MPSectionedIdentifierList setAnnotationDelegate:](v4->_autoPlayIdentifierList, "setAnnotationDelegate:", v4);
  v47 = v4->_autoPlayIdentifierList;
  -[_MPCQueueControllerBehaviorMusic _accountForAutoPlay](v4, "_accountForAutoPlay");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCPlaybackIntent continueListeningRadioPlaybackIntent](MPCPlaybackIntent, "continueListeningRadioPlaybackIntent");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bag");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "radioConfiguration");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v51, "isContinueListeningAvailable") & 1) != 0)
  {
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke;
    v68[3] = &unk_24CAB3608;
    v74 = a2;
    v68[4] = v4;
    v69 = v48;
    v70 = v51;
    v71 = v16;
    v72 = v21;
    v73 = v47;
    objc_msgSend(v49, "getRemotePlaybackQueueWithDestination:completion:", 1, v68);

  }
  else
  {
    v55 = (char)v11;
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject engineID](v16, "engineID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](v4, "sessionID");
      v64 = v47;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v56;
      v77 = 2114;
      v78 = v57;
      v79 = 2114;
      v80 = v21;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | disabling autoplay [disabled in bag] transition=%{public}@", buf, 0x20u);

      v47 = v64;
    }

    LOBYTE(v11) = v55;
    if (v4->_autoPlayState != 2)
      -[_MPCQueueControllerBehaviorMusic _transitionToAutoPlayState:](v4, "_transitionToAutoPlayState:", 2);
  }

  v5 = v67;
  if ((v11 & 1) == 0)
    goto LABEL_64;
LABEL_60:
  if (v4->_state)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BehaviorMusic-transitionToAutoPlayState%@"), v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject beginEditWithReason:](v16, "beginEditWithReason:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject engineID](v16, "engineID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusic sessionID](v4, "sessionID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v35;
      v77 = 2114;
      v78 = v36;
      v79 = 2114;
      v80 = v21;
      _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | committing edit [invalidateQueue] transition=%{public}@", buf, 0x20u);

    }
    objc_msgSend(v33, "commit");

    goto LABEL_64;
  }
  v52 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject engineID](v16, "engineID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusic sessionID](v4, "sessionID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v76 = v53;
    v77 = 2114;
    v78 = v54;
    v79 = 2114;
    v80 = v21;
    _os_log_impl(&dword_210BD8000, v52, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | ignoring SIL change [state: Loading] transition=%{public}@", buf, 0x20u);

  }
LABEL_76:

}

- (void)_updateGroupSessionParticipants:(id)a3 localParticipant:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  MPCSharedSessionParticipant *v13;
  _MPCQueueControllerBehaviorMusic *v14;
  _MPCQueueControllerBehaviorMusic *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *activeHostingSharedSessionID;
  void *v28;
  MRGroupSession *activeGroupSession;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_503);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "msv_map:", &__block_literal_global_505);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    v12 = v6;
    v13 = [MPCSharedSessionParticipant alloc];
    if (v13)
    {
      v32.receiver = v13;
      v32.super_class = (Class)MPCSharedSessionParticipant;
      v14 = -[_MPCQueueControllerBehaviorMusic init](&v32, sel_init);
      v15 = v14;
      if (v14)
        v14->_loadAdditionalItemsCompletion = (id)2;
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_setProperty_nonatomic_copy(v15, v16, v17, 48);

    objc_msgSend(v12, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    if (v15)
    {
      objc_setProperty_nonatomic_copy(v15, v20, v19, 56);

      v15->_wasDecoded = 1;
    }
    else
    {

    }
    objc_msgSend(v11, "addObject:", v15);
    v22 = objc_msgSend(v11, "copy");

    v10 = (void *)v22;
  }
  if (self->_activeHostingSharedSessionID)
  {
    -[_MPCQueueControllerBehaviorMusic host](self, "host");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "eventStream");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = CFSTR("session-id");
    -[_MPCQueueControllerBehaviorMusic sessionID](self, "sessionID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    activeHostingSharedSessionID = self->_activeHostingSharedSessionID;
    v34[0] = v26;
    v34[1] = activeHostingSharedSessionID;
    v33[1] = CFSTR("shared-session-id");
    v33[2] = CFSTR("participants");
    v28 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34[2] = v28;
    v33[3] = CFSTR("shared-session-event-route-type");
    activeGroupSession = self->_activeGroupSession;
    if (activeGroupSession)
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[MRGroupSession routeType](activeGroupSession, "routeType"));
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "emitEventType:payload:", CFSTR("shared-session-participants-changed"), v31);

    if (v10)
    {
      if (v25)
      {
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {

      if (v25)
        goto LABEL_20;
    }

    goto LABEL_20;
  }
LABEL_21:

}

- (MPCQueueControllerBehaviorMusicDelegate)musicBehaviorDelegate
{
  return (MPCQueueControllerBehaviorMusicDelegate *)objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
}

- (BOOL)hasUserMutations
{
  return self->_hasUserMutations;
}

- (MRGroupSession)activeGroupSession
{
  return self->_activeGroupSession;
}

- (void)setActiveGroupSession:(id)a3
{
  objc_storeStrong((id *)&self->_activeGroupSession, a3);
}

- (void)setIdentifierList:(id)a3
{
  objc_storeStrong((id *)&self->_identifierList, a3);
}

- (void)setAutoPlayIdentifierList:(id)a3
{
  objc_storeStrong((id *)&self->_autoPlayIdentifierList, a3);
}

- (int64_t)autoPlayState
{
  return self->_autoPlayState;
}

- (void)setAutoPlayState:(int64_t)a3
{
  self->_autoPlayState = a3;
}

- (void)setAutoPlayEndPosition:(id)a3
{
  objc_storeStrong((id *)&self->_autoPlayEndPosition, a3);
}

- (BOOL)autoPlayIsTriggered
{
  return self->_autoPlayIsTriggered;
}

- (void)setAutoPlayIsTriggered:(BOOL)a3
{
  self->_autoPlayIsTriggered = a3;
}

- (void)setDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_dataSources, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)latestUpNextSectionID
{
  return self->_latestUpNextSectionID;
}

- (void)setLatestUpNextSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)playNowInsertionContentItemID
{
  return self->_playNowInsertionContentItemID;
}

- (void)setPlayNowInsertionContentItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playNowInsertionContentItemID, 0);
  objc_storeStrong((id *)&self->_latestUpNextSectionID, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_autoPlayEndPosition, 0);
  objc_storeStrong((id *)&self->_autoPlayIdentifierList, 0);
  objc_storeStrong((id *)&self->_identifierList, 0);
  objc_storeStrong((id *)&self->_activeGroupSession, 0);
  objc_destroyWeak((id *)&self->_musicBehaviorDelegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_activeHostingSharedSessionID, 0);
  objc_storeStrong((id *)&self->_lastEmittedBehaviorMetadata, 0);
  objc_storeStrong(&self->_loadAdditionalItemsCompletion, 0);
}

+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4
{
  id v5;
  char v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "trackIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "msv_firstWhere:", &__block_literal_global_5054);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9 == 0;

    if (a4 && v9)
    {
      v6 = 0;
      *a4 = CFSTR("GenericTracklist contains URLs");
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = CFSTR("InProcess-com.apple.mediaplayer.playbackcontext");
      v12[1] = CFSTR("com.apple.music.playbackqueue.tracklist");
      v12[2] = CFSTR("com.apple.music.playbackqueue.radio");
      v12[3] = CFSTR("com.apple.mediaplayer.playbackcontext");
      v12[4] = CFSTR("com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v11, "containsObject:", v10);

      if (a4 && (v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported custom data playback queue: %@"), v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_3:
        v6 = 1;
        goto LABEL_4;
      }
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported playback queue: %@"), objc_opt_class());
        v6 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
  }
LABEL_4:

  return v6;
}

@end
