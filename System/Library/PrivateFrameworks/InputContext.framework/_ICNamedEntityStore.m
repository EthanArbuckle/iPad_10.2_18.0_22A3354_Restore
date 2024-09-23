@implementation _ICNamedEntityStore

- (_ICNamedEntityStore)initWithName:(id)a3
{
  return -[_ICNamedEntityStore initWithName:maximumRecentlyAddedEntities:](self, "initWithName:maximumRecentlyAddedEntities:", a3, 500);
}

- (_ICNamedEntityStore)initWithName:(id)a3 maximumRecentlyAddedEntities:(unint64_t)a4
{
  id v6;
  _ICNamedEntityStore *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSMutableOrderedSet *leastRecentlyAddedEntities;
  _ICTransientLexicon *v12;
  void *v13;
  uint64_t v14;
  _ICTransientLexicon *wordLexiconImpl;
  _ICTransientLexicon *v16;
  void *v17;
  uint64_t v18;
  _ICTransientLexicon *phraseLexiconImpl;
  _ICNamedEntityStore *v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_ICNamedEntityStore;
  v7 = -[_ICNamedEntityStore init](&v22, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_maximumRecentlyAddedEntities = a4;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    leastRecentlyAddedEntities = v7->_leastRecentlyAddedEntities;
    v7->_leastRecentlyAddedEntities = (NSMutableOrderedSet *)v10;

    v12 = [_ICTransientLexicon alloc];
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("Words"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_ICTransientLexicon initWithName:typeFlags:](v12, "initWithName:typeFlags:", v13, 1);
    wordLexiconImpl = v7->_wordLexiconImpl;
    v7->_wordLexiconImpl = (_ICTransientLexicon *)v14;

    v16 = [_ICTransientLexicon alloc];
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("Phrases"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_ICTransientLexicon initWithName:typeFlags:](v16, "initWithName:typeFlags:", v17, 5);
    phraseLexiconImpl = v7->_phraseLexiconImpl;
    v7->_phraseLexiconImpl = (_ICTransientLexicon *)v18;

    v7->_minimumWordLength = 4;
    v7->_treatHyphenatedWordAsPhrase = 0;
    v20 = v7;
  }

  return v7;
}

- (_ICLexiconView)wordLexicon
{
  _ICLexiconView *wordLexiconView;
  _ICLexiconView *v4;
  void *v5;
  _ICLexiconView *v6;
  _ICLexiconView *v7;

  wordLexiconView = self->_wordLexiconView;
  if (!wordLexiconView)
  {
    v4 = [_ICLexiconView alloc];
    -[NSString stringByAppendingString:](self->_name, "stringByAppendingString:", CFSTR("Words"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_ICLexiconView initWithName:typeFlags:](v4, "initWithName:typeFlags:", v5, 1);
    v7 = self->_wordLexiconView;
    self->_wordLexiconView = v6;

    wordLexiconView = self->_wordLexiconView;
  }
  return wordLexiconView;
}

- (_ICLexiconView)phraseLexicon
{
  _ICLexiconView *phraseLexiconView;
  _ICLexiconView *v4;
  void *v5;
  _ICLexiconView *v6;
  _ICLexiconView *v7;

  phraseLexiconView = self->_phraseLexiconView;
  if (!phraseLexiconView)
  {
    v4 = [_ICLexiconView alloc];
    -[NSString stringByAppendingString:](self->_name, "stringByAppendingString:", CFSTR("Phrases"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_ICLexiconView initWithName:typeFlags:](v4, "initWithName:typeFlags:", v5, 5);
    v7 = self->_phraseLexiconView;
    self->_phraseLexiconView = v6;

    phraseLexiconView = self->_phraseLexiconView;
  }
  return phraseLexiconView;
}

- (BOOL)isCloserToTitleCase:(id)a3 than:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", v5) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "capitalizedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v8)
      && !objc_msgSend(v6, "isEqualToString:", v8))
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v9 = objc_msgSend(v5, "length");
      v10 = objc_msgSend(v6, "length");
      if (v9 >= v10)
        v9 = v10;
      v11 = objc_msgSend(v8, "length");
      if (v9 >= v11)
        v12 = v11;
      else
        v12 = v9;
      if (v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        do
        {
          v16 = objc_msgSend(v5, "characterAtIndex:", v13);
          if (v16 == objc_msgSend(v8, "characterAtIndex:", v13))
            ++v14;
          v17 = objc_msgSend(v6, "characterAtIndex:", v13);
          if (v17 == objc_msgSend(v8, "characterAtIndex:", v13))
            ++v15;
          ++v13;
        }
        while (v12 != v13);
      }
      else
      {
        v15 = 0;
        v14 = 0;
      }
      v7 = v14 > v15;
    }

  }
  return v7;
}

- (void)_addEntity:(void *)a3 asAliasOfEntity:(int)a4 isPhrase:
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (a1)
  {
    if (a4)
      objc_msgSend(*(id *)(a1 + 96), "addEntity:asAliasOfEntity:", v8, v7);
    if (objc_msgSend(*(id *)(a1 + 88), "containsEntity:", v7))
      objc_msgSend(*(id *)(a1 + 88), "addEntity:asAliasOfEntity:", v8, v7);
  }

}

- (void)_addEntity:(void *)a3 tokens:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v8 = *(void **)(a1 + 96);
      objc_msgSend(v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addEntity:forEntry:", v5, v9);

    }
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
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v15, "length", (_QWORD)v16) >= *(_QWORD *)(a1 + 72))
            objc_msgSend(*(id *)(a1 + 88), "addEntity:forEntry:", v5, v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (USet)_exemplarSetForCustomLocales:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  USet *v9;
  NSObject *v10;
  int v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!_exemplarSetForCustomLocales__cachedExemplarSets)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_exemplarSetForCustomLocales__cachedExemplarSets;
    _exemplarSetForCustomLocales__cachedExemplarSets = v4;

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exemplarSetForCustomLocales__cachedExemplarSets, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (USet *)objc_msgSend(v7, "pointerValue");
  }
  else
  {
    v12 = 0;
    v9 = (USet *)_createExemplarSetForLocales(v3, &v12);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_exemplarSetForCustomLocales__cachedExemplarSets, "setObject:forKeyedSubscript:", v10, v6);
    }
    else
    {
      _ICPersNamedEntityOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v14 = v12;
        _os_log_impl(&dword_22716D000, v10, OS_LOG_TYPE_DEFAULT, "Unable to create exemplar set for given languages (UErrorCode=%d)", buf, 8u);
      }
    }

  }
  return v9;
}

- (USet)exemplarSetForSupportedLocales
{
  if (exemplarSetForSupportedLocales_onceToken != -1)
    dispatch_once(&exemplarSetForSupportedLocales_onceToken, &__block_literal_global_4);
  return (USet *)exemplarSetForSupportedLocales_exemplarSet;
}

- (BOOL)areStringCharactersWhitelisted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  USet *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  -[_ICNamedEntityStore acceptedLanguages](self, "acceptedLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_ICNamedEntityStore acceptedLanguages](self, "acceptedLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_ICNamedEntityStore _exemplarSetForCustomLocales:](self, "_exemplarSetForCustomLocales:", v7);

    if (!v8)
      goto LABEL_9;
  }
  else
  {
    v8 = -[_ICNamedEntityStore exemplarSetForSupportedLocales](self, "exemplarSetForSupportedLocales");
    if (!v8)
      goto LABEL_9;
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  objc_msgSend(v4, "precomposedStringWithCanonicalMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54___ICNamedEntityStore_areStringCharactersWhitelisted___block_invoke;
  v12[3] = &unk_24EF71AC8;
  v12[4] = &v13;
  v12[5] = v8;
  if (objc_msgSend(v9, "_ICEnumerateLongCharactersInRange:usingBlock:", 0, v10, v12))
    LOBYTE(v8) = *((_BYTE *)v14 + 24) != 0;
  else
    LOBYTE(v8) = 0;

  _Block_object_dispose(&v13, 8);
LABEL_9:

  return (char)v8;
}

- (BOOL)isValidNamedEntity:(id)a3 explanation:(id *)a4
{
  id v6;
  __CFString *v7;
  BOOL v8;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x81)
  {
    if (a4)
    {
      v7 = CFSTR("too long");
LABEL_8:
      v8 = 0;
      *a4 = v7;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!-[_ICNamedEntityStore areStringCharactersWhitelisted:](self, "areStringCharactersWhitelisted:", v6))
  {
    if (a4)
    {
      v7 = CFSTR("characters are not whitelisted");
      goto LABEL_8;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (id)_adjustWordsForHyphenationIfNeeded:(id)a3 didAdjust:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = v6;
  if (self->_treatHyphenatedWordAsPhrase
    && objc_msgSend(v6, "count") == 1
    && (objc_msgSend(v7, "objectAtIndexedSubscript:", 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsString:", CFSTR("-")),
        v8,
        (v9 & 1) != 0))
  {
    if (a4)
      *a4 = 1;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("-"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a4)
      *a4 = 0;
    v11 = v7;
  }

  return v11;
}

- (void)addEntity:(id)a3 isDurable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  unint64_t v29;
  id v30;
  char v31;
  id v32;
  _QWORD v33[5];

  v4 = a4;
  v6 = a3;
  if (isTransientLexiconIngestionV2Enabled() && (objc_msgSend(v6, "passesFilters") & 1) == 0)
  {
    _ICPersNamedEntityOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
      -[_ICNamedEntityStore addEntity:isDurable:].cold.5((uint64_t)v6, v8, v23);
  }
  else
  {
    v7 = 64;
    if (v4)
      v7 = 56;
    ++*(Class *)((char *)&self->super.isa + v7);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __43___ICNamedEntityStore_addEntity_isDurable___block_invoke;
    v33[3] = &unk_24EF71AF0;
    v33[4] = self;
    v8 = MEMORY[0x2276AC454](v33);
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v10 = -[_ICNamedEntityStore isValidNamedEntity:explanation:](self, "isValidNamedEntity:explanation:", v9, &v32);
    v11 = v32;

    if (v10)
    {
      v12 = (void *)objc_opt_class();
      objc_msgSend(v6, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tokenize:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = 0;
      -[_ICNamedEntityStore _adjustWordsForHyphenationIfNeeded:didAdjust:](self, "_adjustWordsForHyphenationIfNeeded:didAdjust:", v14, &v31);
      v15 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject count](v15, "count"))
      {
        v29 = -[NSObject count](v15, "count");
        v16 = 88;
        if (v29 > 1)
          v16 = 96;
        objc_msgSend(*(id *)((char *)&self->super.isa + v16), "sortKeyEquivalents:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        __43___ICNamedEntityStore_addEntity_isDurable___block_invoke_2((uint64_t)v18, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          goto LABEL_11;
        objc_msgSend(v6, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v30 = v11;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        v11 = v30;
        if (!v22)
        {
          objc_msgSend(v6, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[_ICNamedEntityStore isCloserToTitleCase:than:](self, "isCloserToTitleCase:than:", v24, v25);

          _ICPersNamedEntityOSLogFacility();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
          if (v28)
          {
            if (v27)
              -[_ICNamedEntityStore addEntity:isDurable:].cold.2(v19, v6);

            -[_ICTransientLexicon removeEntity:](self->_phraseLexiconImpl, "removeEntity:", v19);
            -[_ICTransientLexicon removeEntity:](self->_wordLexiconImpl, "removeEntity:", v19);
            -[_ICNamedEntityStore _addEntity:tokens:]((uint64_t)self, v6, v15);
            -[_ICNamedEntityStore _addEntity:asAliasOfEntity:isPhrase:]((uint64_t)self, v19, v6, v29 > 1);
            v11 = v30;
            if (!v4)
            {
              -[NSMutableOrderedSet removeObject:](self->_leastRecentlyAddedEntities, "removeObject:", v19);
              (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
            }
          }
          else
          {
            if (v27)
              -[_ICNamedEntityStore addEntity:isDurable:].cold.3(v6, v19);

            -[_ICNamedEntityStore _addEntity:asAliasOfEntity:isPhrase:]((uint64_t)self, v6, v19, v29 > 1);
            v11 = v30;
            if (!v4)
              (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v19);
          }
          if (v31)
            -[_ICTransientLexicon setIsHyphenatedWord:forEntity:](self->_wordLexiconImpl, "setIsHyphenatedWord:forEntity:", 1, v6);
        }
        else
        {
LABEL_11:
          -[_ICNamedEntityStore _addEntity:tokens:]((uint64_t)self, v6, v15);
          if (v31)
            -[_ICTransientLexicon setIsHyphenatedWord:forEntity:](self->_wordLexiconImpl, "setIsHyphenatedWord:forEntity:", 1, v6);
          if (!v4)
            (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
        }

      }
      else
      {
        _ICPersNamedEntityOSLogFacility();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[_ICNamedEntityStore addEntity:isDurable:].cold.1(v6, v17);
      }

    }
    else
    {
      _ICPersNamedEntityOSLogFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[_ICNamedEntityStore addEntity:isDurable:].cold.4(v6);
    }

  }
}

- (void)reloadRecents
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_leastRecentlyAddedEntities;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = (void *)objc_opt_class();
        objc_msgSend(v8, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tokenize:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = 0;
        -[_ICNamedEntityStore _adjustWordsForHyphenationIfNeeded:didAdjust:](self, "_adjustWordsForHyphenationIfNeeded:didAdjust:", v11, &v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[_ICNamedEntityStore _addEntity:tokens:]((uint64_t)self, v8, v12);
        if (v13)
          -[_ICTransientLexicon setIsHyphenatedWord:forEntity:](self->_wordLexiconImpl, "setIsHyphenatedWord:forEntity:", 1, v8);

      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)removeAllEntities
{
  -[_ICTransientLexicon removeAllEntities](self->_wordLexiconImpl, "removeAllEntities");
  -[_ICTransientLexicon removeAllEntities](self->_phraseLexiconImpl, "removeAllEntities");
  self->_durableEntitiesAdded = 0;
  self->_recentEntitiesAdded = 0;
}

- (BOOL)entityIsHyphenatedWord:(id)a3
{
  return -[_ICTransientLexicon entityIsHyphenatedWord:](self->_wordLexiconImpl, "entityIsHyphenatedWord:", a3);
}

+ (id)tokenize:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  size_t v7;
  uint64_t v8;
  void *v9;
  CFLocaleRef v10;
  id v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 4 * objc_msgSend(v6, "length");
  v8 = objc_msgSend(v6, "length");
  v9 = malloc_type_malloc(v7, 0x100004077774924uLL);
  v13 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v9, v7, &v13, 4, 0, 0, v8, 0);
  v10 = CFLocaleCreate(0, CFSTR("en_US"));
  LMStreamTokenizerCreate();
  v12 = v5;
  LMStreamTokenizerPushBytes();
  LMStreamTokenizerRelease();
  CFRelease(v10);
  free(v9);

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)durableEntitiesAdded
{
  return self->_durableEntitiesAdded;
}

- (unint64_t)recentEntitiesAdded
{
  return self->_recentEntitiesAdded;
}

- (unint64_t)minimumWordLength
{
  return self->_minimumWordLength;
}

- (void)setMinimumWordLength:(unint64_t)a3
{
  self->_minimumWordLength = a3;
}

- (BOOL)treatHyphenatedWordAsPhrase
{
  return self->_treatHyphenatedWordAsPhrase;
}

- (void)setTreatHyphenatedWordAsPhrase:(BOOL)a3
{
  self->_treatHyphenatedWordAsPhrase = a3;
}

- (NSSet)acceptedLanguages
{
  return self->_acceptedLanguages;
}

- (void)setAcceptedLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (_ICTransientLexicon)wordLexiconImpl
{
  return self->_wordLexiconImpl;
}

- (void)setWordLexiconImpl:(id)a3
{
  objc_storeStrong((id *)&self->_wordLexiconImpl, a3);
}

- (_ICTransientLexicon)phraseLexiconImpl
{
  return self->_phraseLexiconImpl;
}

- (void)setPhraseLexiconImpl:(id)a3
{
  objc_storeStrong((id *)&self->_phraseLexiconImpl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseLexiconImpl, 0);
  objc_storeStrong((id *)&self->_wordLexiconImpl, 0);
  objc_storeStrong((id *)&self->_acceptedLanguages, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_phraseLexiconView, 0);
  objc_storeStrong((id *)&self->_wordLexiconView, 0);
  objc_storeStrong((id *)&self->_leastRecentlyAddedEntities, 0);
}

- (void)addEntity:(void *)a1 isDurable:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138739971;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_22716D000, a2, v4, "Filtering \"%{sensitive}@\" because it does not contain any words.", (uint8_t *)&v5);

}

- (void)addEntity:(void *)a1 isDurable:(void *)a2 .cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_22716D000, v5, v6, "Replacing \"%{sensitive}@\" with \"%{sensitive}@\".", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

- (void)addEntity:(void *)a1 isDurable:(void *)a2 .cold.3(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_22716D000, v5, v6, "Adding \"%{sensitive}@\" as alias of \"%{sensitive}@\".", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

- (void)addEntity:(void *)a1 isDurable:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_22716D000, v2, v3, "Filtering \"%{sensitive}@\" because %@.", v4, v5, v6, v7, 3u);

  OUTLINED_FUNCTION_1_0();
}

- (void)addEntity:(uint64_t)a3 isDurable:.cold.5(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_22716D000, a2, a3, "Rejecting named entity %@ (does not pass local filters)", (uint8_t *)&v3);
}

@end
