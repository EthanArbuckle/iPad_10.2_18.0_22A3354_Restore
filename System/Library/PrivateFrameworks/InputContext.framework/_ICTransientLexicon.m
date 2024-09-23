@implementation _ICTransientLexicon

- (_QWORD)_mutableNamedEntitiesForLXEntry:(_QWORD *)a1
{
  _QWORD *v1;
  uint64_t TokenID;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    TokenID = LXEntryGetTokenID();
    v3 = (void *)v1[2];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", TokenID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_lexicon);
  v3.receiver = self;
  v3.super_class = (Class)_ICTransientLexicon;
  -[_ICTransientLexicon dealloc](&v3, sel_dealloc);
}

- (_ICTransientLexicon)initWithName:(id)a3 typeFlags:(unsigned __int8)a4
{
  id v7;
  _ICTransientLexicon *v8;
  _ICTransientLexicon *v9;
  uint64_t v10;
  NSMutableDictionary *tokenIdentifierToEntitiesMap;
  uint64_t v12;
  NSMutableDictionary *entityToTokenIdentifiersMap;
  __CFDictionary *Mutable;
  void *v15;
  void *v16;
  _ICTransientLexicon *v17;
  NSObject *v18;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_ICTransientLexicon;
  v8 = -[_ICTransientLexicon init](&v20, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  objc_storeStrong((id *)&v8->_name, a3);
  v9->_typeFlags = a4;
  v9->_identifier = ++generateIdentifier_count;
  v10 = objc_opt_new();
  tokenIdentifierToEntitiesMap = v9->_tokenIdentifierToEntitiesMap;
  v9->_tokenIdentifierToEntitiesMap = (NSMutableDictionary *)v10;

  v12 = objc_opt_new();
  entityToTokenIdentifiersMap = v9->_entityToTokenIdentifiersMap;
  v9->_entityToTokenIdentifiersMap = (NSMutableDictionary *)v12;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE5F1A0], v7);
  v9->_lexicon = (_LXLexicon *)LXLexiconCreateTransient();
  CFRelease(Mutable);
  if (v9->_lexicon)
  {
    transientLexiconMap();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9->_identifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, v16);

    LXLexiconRepositoryAddOrUpdate();
LABEL_4:
    v17 = v9;
    goto LABEL_8;
  }
  _ICPersNamedEntityOSLogFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[_ICTransientLexicon initWithName:typeFlags:].cold.1();

  v17 = 0;
LABEL_8:

  return v17;
}

+ (id)transientLexiconForIdentifier:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  transientLexiconMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_tokenIdentiferForEntry:(uint64_t)TokenID
{
  id v3;
  _LXEntry *v4;
  _LXEntry *v5;

  v3 = a2;
  if (TokenID)
  {
    v4 = +[_ICLexiconUtilities copyEntry:forString:](_ICLexiconUtilities, "copyEntry:forString:", *(_QWORD *)(TokenID + 8), v3);
    if (v4)
    {
      v5 = v4;
      TokenID = LXEntryGetTokenID();
      CFRelease(v5);
    }
    else
    {
      TokenID = 0;
    }
  }

  return TokenID;
}

- (_QWORD)_mutableNamedEntitiesForEntry:(_QWORD *)a1
{
  id v3;
  _LXEntry *v4;
  _LXEntry *v5;

  v3 = a2;
  if (a1)
  {
    v4 = +[_ICLexiconUtilities copyEntry:forString:](_ICLexiconUtilities, "copyEntry:forString:", a1[1], v3);
    if (v4)
    {
      v5 = v4;
      -[_ICTransientLexicon _mutableNamedEntitiesForLXEntry:](a1);
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      CFRelease(v5);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)namedEntitiesForEntry:(id)a3
{
  void *v3;
  void *v4;

  -[_ICTransientLexicon _mutableNamedEntitiesForEntry:](self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (unint64_t)entryCount
{
  return -[NSMutableDictionary count](self->_tokenIdentifierToEntitiesMap, "count");
}

- (void)createAdditionalDataForEntityIfNeeded:(id)a3
{
  id v4;
  NSMutableDictionary *entityToAdditionalDataMap;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  v4 = a3;
  entityToAdditionalDataMap = self->_entityToAdditionalDataMap;
  v9 = v4;
  if (!entityToAdditionalDataMap)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    v7 = self->_entityToAdditionalDataMap;
    self->_entityToAdditionalDataMap = v6;

    v4 = v9;
    entityToAdditionalDataMap = self->_entityToAdditionalDataMap;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](entityToAdditionalDataMap, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entityToAdditionalDataMap, "setObject:forKeyedSubscript:", &unk_24EF76120, v9);

}

- (BOOL)entityIsHyphenatedWord:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToAdditionalDataMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue") & 1;

  return v4;
}

- (void)setIsHyphenatedWord:(BOOL)a3 forEntity:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v6 = a4;
  -[_ICTransientLexicon createAdditionalDataForEntityIfNeeded:](self, "createAdditionalDataForEntityIfNeeded:", v6);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToAdditionalDataMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8 & 0xFFFFFFFFFFFFFFFELL | v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entityToAdditionalDataMap, "setObject:forKeyedSubscript:", v9, v6);

}

- (void)addEntity:(id)a3 asAliasOfEntity:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *entityToTokenIdentifiersMap;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_entityToTokenIdentifiersMap, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  entityToTokenIdentifiersMap = self->_entityToTokenIdentifiersMap;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  -[NSMutableDictionary setObject:forKey:](entityToTokenIdentifiersMap, "setObject:forKey:", v9, v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenIdentifierToEntitiesMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14), (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v6);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)addEntity:(id)a3 forEntry:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  NSMutableDictionary *tokenIdentifierToEntitiesMap;
  void *v14;
  _QWORD v15[5];
  int v16;

  v6 = a3;
  v7 = a4;
  _ICPersNamedEntityOSLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_ICTransientLexicon addEntity:forEntry:].cold.1();

  if ((self->_typeFlags & 4) != 0)
    v9 = 1;
  else
    v9 = 2;
  -[_ICTransientLexicon _mutableNamedEntitiesForEntry:](self, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42___ICTransientLexicon_addEntity_forEntry___block_invoke;
  v15[3] = &unk_24EF71A08;
  v15[4] = self;
  v16 = v9;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2276AC454](v15);
  if (v10)
  {
    objc_msgSend(v10, "addObject:", v6);
    v12 = -[_ICTransientLexicon _tokenIdentiferForEntry:]((uint64_t)self, v7);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", v9);
    objc_msgSend(v10, "addObject:", v6);
    objc_msgSend(v6, "timestamp");
    v12 = LXLexiconAddWithCreationTime();
    LXLexiconIncrementUsageCount();
    LXLexiconSetUserBitfield();
    tokenIdentifierToEntitiesMap = self->_tokenIdentifierToEntitiesMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](tokenIdentifierToEntitiesMap, "setObject:forKeyedSubscript:", v10, v14);

  }
  ((void (**)(_QWORD, id, uint64_t))v11)[2](v11, v6, v12);

}

- (void)removeEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_entityToTokenIdentifiersMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenIdentifierToEntitiesMap, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v4);
          if (!objc_msgSend(v12, "count"))
          {
            -[NSMutableDictionary removeObjectForKey:](self->_tokenIdentifierToEntitiesMap, "removeObjectForKey:", v11);
            objc_msgSend(v11, "unsignedIntValue");
            LXLexiconRemoveEntry();
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_entityToTokenIdentifiersMap, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_entityToAdditionalDataMap, "removeObjectForKey:", v4);
  }

}

- (void)removeAllEntities
{
  LXLexiconClear();
  -[NSMutableDictionary removeAllObjects](self->_entityToTokenIdentifiersMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_tokenIdentifierToEntitiesMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_entityToAdditionalDataMap, "removeAllObjects");
}

- (BOOL)containsEntity:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_entityToTokenIdentifiersMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)contains:(id)a3
{
  return +[_ICLexiconUtilities lexiconContainsEntry:forString:](_ICLexiconUtilities, "lexiconContainsEntry:forString:", self->_lexicon, a3);
}

- (id)sortKeyEquivalents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v4;
  LXLexiconEnumerateEntriesForString();

  v6 = v8;
  return v6;
}

- (_LXLexicon)getLexiconImplementation
{
  return self->_lexicon;
}

- (unsigned)typeFlags
{
  return self->_typeFlags;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityToAdditionalDataMap, 0);
  objc_storeStrong((id *)&self->_entityToTokenIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_tokenIdentifierToEntitiesMap, 0);
}

- (id)getEntries
{
  void *v2;
  const void *RootCursor;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_entityToTokenIdentifiersMap, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  RootCursor = (const void *)LXLexiconCreateRootCursor();
  v5 = v2;
  LXCursorEnumerateEntriesRecursively();
  CFRelease(RootCursor);

  return v5;
}

- (id)getEntryRefCount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[_ICTransientLexicon _mutableNamedEntitiesForEntry:](self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getUsageCount:(id)a3
{
  id v4;
  _LXEntry *v5;
  _LXEntry *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (v5 = +[_ICLexiconUtilities copyEntry:forString:](_ICLexiconUtilities, "copyEntry:forString:", self->_lexicon, v4)) != 0)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", LXEntryGetUsageCount());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)initWithName:typeFlags:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_22716D000, v0, OS_LOG_TYPE_ERROR, "Error creating lexicon (name = %@): %@", v1, 0x16u);
}

- (void)addEntity:forEntry:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_22716D000, v0, OS_LOG_TYPE_DEBUG, "Add: %@ to: %@", v1, 0x16u);
}

@end
