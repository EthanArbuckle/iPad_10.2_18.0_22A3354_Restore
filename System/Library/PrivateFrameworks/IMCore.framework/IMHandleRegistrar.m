@implementation IMHandleRegistrar

- (void)addHandleToCNIDMap:(id)a3 CNContact:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *CNIDToHandlesMap;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (v15 && v6)
  {
    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handlesForCNIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (self->_CNIDToHandlesMap)
    {
      if (v10)
      {
LABEL_5:
        objc_msgSend(v10, "addObject:", v15);

        goto LABEL_6;
      }
    }
    else
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CNIDToHandlesMap = self->_CNIDToHandlesMap;
      self->_CNIDToHandlesMap = Mutable;

      if (v10)
        goto LABEL_5;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v13 = self->_CNIDToHandlesMap;
    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v10, v14);

    goto LABEL_5;
  }
LABEL_6:

}

- (id)handlesForCNIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_CNIDToHandlesMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_existingChatSiblingsForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v22, "addObject:", v3);
    objc_msgSend(v3, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountsForService:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
          if (v14 != v5)
          {
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v13), "hasCapability:", 1024) & 1) != 0
              || (objc_msgSend(v14, "hasCapability:", 8) & 1) != 0
              || (objc_msgSend(v14, "service"),
                  v15 = (void *)objc_claimAutoreleasedReturnValue(),
                  v15,
                  v15 == v21))
            {
              objc_msgSend(v3, "ID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "existingIMHandleWithID:alreadyCanonical:", v16, 1);
              v17 = (id)objc_claimAutoreleasedReturnValue();

              if (v17)
                v18 = v17 == v3;
              else
                v18 = 1;
              if (!v18)
              {
                objc_msgSend(v17, "_setOriginalID:countryCode:updateSiblings:", v7, v6, 0);
                objc_msgSend(v22, "addObject:", v17);
              }

            }
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    objc_msgSend(v22, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)getIDsForAllIMHandles
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMHandleRegistrar allIMHandles](self, "allIMHandles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "ID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(v9, "ID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)sharedInstance
{
  if (qword_1ECF12508 != -1)
    dispatch_once(&qword_1ECF12508, &unk_1E471D6F8);
  if (qword_1ECF12598 != -1)
    dispatch_once(&qword_1ECF12598, &unk_1E471B920);
  if (qword_1ECF12500 != -1)
    dispatch_once(&qword_1ECF12500, &unk_1E471C270);
  return (id)qword_1ECF125F8;
}

- (void)registerIMHandle:(id)a3
{
  id v4;
  IMHandleRegistrar *v5;
  NSMutableDictionary *siblingsMap;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSHashTable addObject:](v5->_allIMHandles, "addObject:", v4);
  siblingsMap = v5->_siblingsMap;
  objc_msgSend(v4, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](siblingsMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandleRegistrar _emptySiblingCacheForIMHandleGUID:](v5, "_emptySiblingCacheForIMHandleGUID:", v9);

  }
  -[IMHandleRegistrar _addIMHandleToIDToHandlesMap:](v5, "_addIMHandleToIDToHandlesMap:", v4);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "ID");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = -[NSHashTable count](v5->_allIMHandles, "count");
      v13 = 138412546;
      v14 = v11;
      v15 = 1024;
      v16 = v12;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "** Added: %@   (%d now exist)", (uint8_t *)&v13, 0x12u);

    }
  }
  objc_sync_exit(v5);

}

- (void)_emptySiblingCacheForIMHandleGUID:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_siblingsMap, "objectForKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v6 = v3;
      v5 = objc_msgSend(v3, "count");
      v4 = v6;
      if (v5)
      {
        objc_msgSend(v6, "removeAllObjects");
        v4 = v6;
      }
    }

  }
}

- (void)_addIMHandleToIDToHandlesMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *IDToHandlesMap;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "ID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    IDToHandlesMap = self->_IDToHandlesMap;
    objc_msgSend(v5, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "im_stripCategoryLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](IDToHandlesMap, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
      v12 = self->_IDToHandlesMap;
      objc_msgSend(v5, "ID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "im_stripCategoryLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v14);

    }
    if ((objc_msgSend(v11, "containsObject:", v5) & 1) == 0)
      objc_msgSend(v11, "addObject:", v5);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Not adding %@ to IDToHandlesMap", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)removeHandleFromCNIDMap:(id)a3 withCNID:(id)a4
{
  id v6;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *CNIDToHandlesMap;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12 && objc_msgSend(v6, "length"))
  {
    if (!self->_CNIDToHandlesMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CNIDToHandlesMap = self->_CNIDToHandlesMap;
      self->_CNIDToHandlesMap = Mutable;

    }
    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handlesForCNIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (objc_msgSend(v11, "count"))
      objc_msgSend(v11, "removeObject:", v12);
    if (!objc_msgSend(v11, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_CNIDToHandlesMap, "removeObjectForKey:", v6);

  }
}

- (IMHandleRegistrar)init
{
  IMHandleRegistrar *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *siblingsMap;
  uint64_t v5;
  NSHashTable *allIMHandles;
  NSMutableDictionary *v7;
  NSMutableDictionary *CNIDToHandlesMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *IDToHandlesMap;
  IMBusinessNameManager *v11;
  IMBusinessNameManager *businessNameManager;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IMHandleRegistrar;
  v2 = -[IMHandleRegistrar init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    siblingsMap = v2->_siblingsMap;
    v2->_siblingsMap = v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    allIMHandles = v2->_allIMHandles;
    v2->_allIMHandles = (NSHashTable *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CNIDToHandlesMap = v2->_CNIDToHandlesMap;
    v2->_CNIDToHandlesMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    IDToHandlesMap = v2->_IDToHandlesMap;
    v2->_IDToHandlesMap = v9;

    v11 = (IMBusinessNameManager *)objc_alloc_init(MEMORY[0x1E0D39710]);
    businessNameManager = v2->_businessNameManager;
    v2->_businessNameManager = v11;

  }
  return v2;
}

- (id)getIDsForInitialBatch
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_getIDsForAllIMHandles);
}

- (id)allIMHandles
{
  IMHandleRegistrar *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSHashTable allObjects](v2->_allIMHandles, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)_handleDropEverythingChangeHistoryEvent
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Handling drop everything ContactStore change history event", v7, 2u);
    }

  }
  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_addressBookChanged");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0D373C8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("__kIMHandleRegistrarAddressBookChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0D373C0], 0);

}

- (void)_handleDeleteContactChangeHistoryEvent:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Received a DeleteContactChangeHistoryEvent", buf, 2u);
    }

  }
  objc_msgSend(v23, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D376B8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handlesForCNIdentifier:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = v21;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v27)
      {
        v25 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v34 != v25)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance", v21, v22);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "removeHandleFromCNIDMap:withCNID:", v8, v5);

            objc_msgSend(v8, "ID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "removeContactWithID:", v28);

            objc_msgSend(v8, "updateCNContact:", 0);
            -[IMHandleRegistrar getIMHandlesForID:](self, "getIMHandlesForID:", v28);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v30;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v30 != v13)
                    objc_enumerationMutation(v11);
                  v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                  if (v15 != v8)
                  {
                    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "removeHandleFromCNIDMap:withCNID:", v15, v5);

                    objc_msgSend(v15, "updateCNContact:", 0);
                  }
                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
              }
              while (v12);
            }

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v27);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:", *MEMORY[0x1E0D373C8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:", *MEMORY[0x1E0D373C0], 0);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v5;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "No handles with CNID %@ found, no action to take.", buf, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "No action to take in _handleAddContactChangeHistoryEvent", buf, 2u);
    }

  }
}

- (void)_handleAddContactChangeHistoryEvent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Received a AddContactChangeHistoryEvent", buf, 2u);
    }

  }
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D376D8]);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D376C0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processContactChangeHistoryEventWithHandleIDs:andCNContact:", v7, v8);

  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_8;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "No action to take in _handleAddContactChangeHistoryEvent", v10, 2u);
    }
  }

LABEL_8:
}

- (void)_handleUpdateContactChangeHistoryEvent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Received a UpdateContactChangeHistoryEvent", buf, 2u);
    }

  }
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D376D8]);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D376C0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processContactChangeHistoryEventWithHandleIDs:andCNContact:", v7, v8);

  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_8;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "No action to take in _handleAddContactChangeHistoryEvent", v10, 2u);
    }
  }

LABEL_8:
}

- (void)processContactChangeHistoryEventWithHandleIDs:(id)a3 andCNContact:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v29 = v6;
  v27 = v5;
  if (v6 && v7)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = v5;
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v35;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          IMCleanupPhoneNumber();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "getIMHandlesForID:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "count"))
          {
            if (!v9)
              v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
            objc_msgSend(v9, "addObjectsFromArray:", v15);
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v10);
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Cannot process Contact change history event!. No handles or invalid CNContact recevied.", buf, 2u);
      }

    }
    v9 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v9;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Updating handles with IDs %@ with a new Contact", buf, 0xCu);
    }

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v31;
    v21 = MEMORY[0x1E0C9AA60];
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v22);
        +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "cnContactWithKeys:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeHandleFromCNIDMap:withCNID:", v23, v26);

        objc_msgSend(v23, "updateCNContact:", v29);
        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__postContactChangeHistoryEventClientNotifications, 0);
  -[IMHandleRegistrar performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__postContactChangeHistoryEventClientNotifications, 0, 0.0);

}

- (void)_postContactChangeHistoryEventClientNotifications
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0D373C8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0D373C0], 0);

}

- (void)_addressBookChanged
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v3, "startTimingForKey:", CFSTR("_addressBookChanged"));
  -[IMHandleRegistrar allIMHandles](self, "allIMHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clearSiblingCacheForIMHandle:", v11);

        objc_msgSend(v11, "updateCNContact:", 0);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearCNIDToHandlesMap");

}

- (void)_buildSiblingsForIMHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandleRegistrar _emptySiblingCacheForIMHandleGUID:](self, "_emptySiblingCacheForIMHandleGUID:", v6);

    objc_msgSend(v5, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_siblingsMap, "objectForKey:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[NSMutableDictionary setObject:forKey:](self->_siblingsMap, "setObject:forKey:", v8, v7);
    }
    objc_msgSend(v8, "addObject:", v5);
    objc_msgSend(v5, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handlesForCNIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v20 = v7;
      objc_msgSend(v8, "addObjectsFromArray:", v13);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            if (*(void **)(*((_QWORD *)&v21 + 1) + 8 * v18) != v5)
            {
              objc_msgSend(v5, "guid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "length"))
                -[NSMutableDictionary setObject:forKey:](self->_siblingsMap, "setObject:forKey:", v8, v19);

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v16);
      }

      v7 = v20;
    }

  }
}

- (void)_clearSiblingsCacheForIMHandle:(id)a3 rebuildAfter:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_siblingsMap, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v14);
          if (v15 != v6)
          {
            objc_msgSend(v15, "guid", (_QWORD)v17);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMHandleRegistrar _emptySiblingCacheForIMHandleGUID:](self, "_emptySiblingCacheForIMHandleGUID:", v16);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    -[IMHandleRegistrar _emptySiblingCacheForIMHandleGUID:](self, "_emptySiblingCacheForIMHandleGUID:", v7);
    if (v4)
    {
      -[IMHandleRegistrar _buildSiblingsForIMHandle:](self, "_buildSiblingsForIMHandle:", v6);
      -[IMHandleRegistrar _clearSiblingsCacheForIMHandle:rebuildAfter:](self, "_clearSiblingsCacheForIMHandle:rebuildAfter:", v6, 0);
    }

  }
}

- (void)clearCNIDToHandlesMap
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Clearing the CNIDToHandlesMap", v4, 2u);
    }

  }
  -[NSMutableDictionary removeAllObjects](self->_CNIDToHandlesMap, "removeAllObjects");
}

- (id)CNIDToHandlesMap
{
  return (id)-[NSMutableDictionary copy](self->_CNIDToHandlesMap, "copy");
}

- (void)unregisterIMHandle:(id)a3
{
  IMHandleRegistrar *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v6, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[NSHashTable removeObject:](v4->_allIMHandles, "removeObject:", v6);
    -[IMHandleRegistrar _clearSiblingsCacheForIMHandle:rebuildAfter:](v4, "_clearSiblingsCacheForIMHandle:rebuildAfter:", v6, 0);
    -[NSMutableDictionary removeObjectForKey:](v4->_siblingsMap, "removeObjectForKey:", v5);
    -[IMHandleRegistrar _removeIMHandleToIDToHandlesMap:](v4, "_removeIMHandleToIDToHandlesMap:", v6);
  }

  objc_sync_exit(v4);
}

- (void)clearSiblingCacheForIMHandle:(id)a3
{
  -[IMHandleRegistrar _clearSiblingsCacheForIMHandle:rebuildAfter:](self, "_clearSiblingsCacheForIMHandle:rebuildAfter:", a3, 0);
}

- (id)siblingsForIMHandle:(id)a3
{
  id v4;
  NSMutableDictionary *siblingsMap;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  siblingsMap = self->_siblingsMap;
  objc_msgSend(v4, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](siblingsMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "count"))
  {
    -[IMHandleRegistrar _buildSiblingsForIMHandle:](self, "_buildSiblingsForIMHandle:", v4);
    v8 = self->_siblingsMap;
    objc_msgSend(v4, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  v11 = (void *)objc_msgSend(v7, "copy");

  return v11;
}

- (void)_removeIMHandleToIDToHandlesMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *IDToHandlesMap;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "ID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    IDToHandlesMap = self->_IDToHandlesMap;
    objc_msgSend(v5, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "im_stripCategoryLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](IDToHandlesMap, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "containsObject:", v5))
      objc_msgSend(v11, "removeObject:", v5);
    if (!objc_msgSend(v11, "count"))
    {
      v12 = self->_IDToHandlesMap;
      objc_msgSend(v5, "ID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "im_stripCategoryLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v14);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Not removing %@ from IDToHandlesMap", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (id)IDToHandlesMap
{
  return (id)-[NSMutableDictionary copy](self->_IDToHandlesMap, "copy");
}

- (id)getIMHandlesForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_IDToHandlesMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(MEMORY[0x1E0D397A8], "dialingForCurrentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count")
      || (objc_msgSend(v4, "hasPrefix:", v8) & 1) != 0
      || !MEMORY[0x1A858280C](v4))
    {
      v9 = (uint64_t)v4;
    }
    else
    {
      IMStripFormattingFromAddress();
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Re-attempting to lookup cache with ID & ITU: %@", buf, 0xCu);
        }

      }
      -[NSMutableDictionary objectForKey:](self->_IDToHandlesMap, "objectForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");

      v7 = (void *)v14;
    }
    v15 = (void *)objc_msgSend(v7, "copy");

    v4 = (id)v9;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)getIDsForFinalBatch
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[IMHandleRegistrar allIMHandles](self, "allIMHandles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isContactWithIDAlreadyFetched:", v11);

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v9, "ID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length");

          if (v14)
          {
            objc_msgSend(v9, "ID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v15);

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_dumpOutAllIMHandles
{
  NSObject *v3;
  NSHashTable *allIMHandles;
  int v5;
  NSHashTable *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      allIMHandles = self->_allIMHandles;
      v5 = 138412290;
      v6 = allIMHandles;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "All handles: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_dumpOutAllIMHandlesForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *v6;
  uint64_t v7;
  __int128 v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_IMWillLog())
    goto LABEL_26;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "All handles for account: %@", buf, 0xCu);
    }

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_allIMHandles;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {

LABEL_22:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "    Hurray, no handles!", buf, 2u);
      }

    }
    goto LABEL_26;
  }
  v9 = 0;
  v10 = *(_QWORD *)v19;
  *(_QWORD *)&v8 = 138412290;
  v17 = v8;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v12, "account", v17, (_QWORD)v18);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v13 == v4;

      if (v14)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            v24 = v12;
            _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "     %@", buf, 0xCu);
          }

        }
        v9 = 1;
      }
    }
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);

  if ((v9 & 1) == 0)
    goto LABEL_22;
LABEL_26:

}

- (id)_accountSiblingsForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v21 = v4;
    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v22, "addObject:", v3);
    objc_msgSend(v3, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountsForService:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
          if (v15 != v7)
          {
            v16 = v3;
            objc_msgSend(v3, "ID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_imHandleWithID:alreadyCanonical:originalID:countryCode:", v17, 1, v6, v5);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 && (objc_msgSend(v22, "containsObject:", v18) & 1) == 0)
              objc_msgSend(v22, "addObject:", v18);

            v3 = v16;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    objc_msgSend(v22, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v21;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_existingAccountSiblingsForHandle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v5, "addObject:", v3);
    objc_msgSend(v3, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountsForService:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (v14 != v6)
          {
            objc_msgSend(v3, "ID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "existingIMHandleWithID:alreadyCanonical:", v15, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              objc_msgSend(v5, "addObject:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    objc_msgSend(v5, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_chatSiblingsForHandle:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "guid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "length"))
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v31, "addObject:", v3);
    objc_msgSend(v3, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v3;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "Handle %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v4;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_DEBUG, "Handle account %@", buf, 0xCu);
      }

    }
    objc_msgSend(v3, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originalID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v3, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siblingServices");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v29)
    {
      v28 = *(_QWORD *)v37;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
          {
            v11 = v10;
            objc_enumerationMutation(obj);
            v10 = v11;
          }
          v30 = v10;
          v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v10);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "accountsForService:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v33;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v33 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
                if (v18 != v4)
                {
                  objc_msgSend(v3, "ID");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "_imHandleWithID:alreadyCanonical:originalID:countryCode:", v19, 1, v8, v7);
                  v20 = (id)objc_claimAutoreleasedReturnValue();

                  if (v20)
                    v21 = v20 == v3;
                  else
                    v21 = 1;
                  if (!v21)
                  {
                    objc_msgSend(v20, "_setOriginalID:countryCode:updateSiblings:", v8, v7, 0);
                    objc_msgSend(v31, "addObject:", v20);
                  }

                }
                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v15);
          }

          v10 = v30 + 1;
        }
        while (v30 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v29);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v31;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_DEBUG, "Account sibling: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v31, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_DEBUG, "No GUID, bailing...", buf, 2u);
      }

    }
    v23 = 0;
  }

  return v23;
}

- (id)businessNameForUID:(id)a3 updateHandler:(id)a4
{
  return (id)-[IMBusinessNameManager businessNameForUID:updateHandler:](self->_businessNameManager, "businessNameForUID:updateHandler:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessNameManager, 0);
  objc_storeStrong((id *)&self->_CNIDToHandlesMap, 0);
  objc_storeStrong((id *)&self->_IDToHandlesMap, 0);
  objc_storeStrong((id *)&self->_allIMHandles, 0);
  objc_storeStrong((id *)&self->_siblingsMap, 0);
}

@end
