@implementation EMFEmojiPreferences

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (EMFEmojiPreferences)init
{
  id v2;
  EMFEmojiPreferences *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EMFEmojiPreferences;
  v2 = -[EMFEmojiPreferences init](&v5, sel_init);
  v3 = (EMFEmojiPreferences *)v2;
  if (v2)
    *((_QWORD *)v2 + 9) = 30;
  std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((CEM::AdaptationDatabaseController **)v2 + 7, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((CEM::AdaptationDatabaseController **)&self->_adaptationController, 0);
  v3.receiver = self;
  v3.super_class = (Class)EMFEmojiPreferences;
  -[EMFEmojiPreferences dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((CEM::AdaptationDatabaseController **)&self->_adaptationController, 0);
  objc_storeStrong((id *)&self->_categoryIndexes, 0);
  objc_storeStrong((id *)&self->_skinToneBaseKeyPreferences, 0);
  objc_storeStrong((id *)&self->_typingNames, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_usageHistory, 0);
}

+ (id)defaultsDomain
{
  return CFSTR("com.apple.EmojiPreferences");
}

+ (id)_cacheDomain
{
  return CFSTR("com.apple.EmojiCache");
}

+ (id)_recentEmojiStrings
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "_emojiCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_recentStringsInCharacterSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_allRecentStrings
{
  return (id)objc_msgSend(a1, "_recentStringsInCharacterSet:", 0);
}

+ (id)_recentStringsInCharacterSet:(id)a3
{
  id v4;
  NSMutableArray *v5;
  EMFEmojiPreferences *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "deviceStateIsLocked"))
  {
    +[EMFEmojiCategory _emojiSetForIdentifier:](EMFEmojiCategory, "_emojiSetForIdentifier:", CFSTR("EMFEmojiCategoryPrepopulated"));
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(EMFEmojiPreferences);
    -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](v6, "loadDefaultsIfNecessaryThreadSafe");
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](v6->_recents, "count"));
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = (void *)-[NSMutableArray copy](v6->_recents, "copy", 0);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            if (objc_msgSend(v11, "rangeOfCharacterFromSet:", v4) != 0x7FFFFFFFFFFFFFFFLL)
              -[NSMutableArray addObject:](v5, "addObject:", v11);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v8);
      }

    }
    else
    {
      v5 = v6->_recents;
    }

  }
  return v5;
}

- (id)recentEmojisByFillingWithPrepopulatedEmojisUpTo:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if (a3)
    v3 = a3;
  else
    v3 = 500;
  -[EMFEmojiPreferences recentEmojis](self, "recentEmojis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v3 <= objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "subarrayWithRange:", 0, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EMFEmojiCategory _emojiSetForIdentifier:](EMFEmojiCategory, "_emojiSetForIdentifier:", CFSTR("EMFEmojiCategoryPrepopulated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    objc_msgSend(v7, "addObjectsFromArray:", v5);
    v8 = objc_msgSend(v6, "count");
    v9 = objc_msgSend(v7, "count");
    if (v3 >= v8)
      v10 = v8;
    else
      v10 = v3;
    v11 = v10 - v9;
    if (v10 == v9)
    {
      v12 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", v16, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v12);
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
    }
    v13 = (void *)objc_msgSend(v7, "copy");

  }
  return v13;
}

- (NSArray)recentEmojis
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "_emojiCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFEmojiPreferences recentsInCharacterSet:](self, "recentsInCharacterSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)allRecents
{
  return (NSArray *)-[EMFEmojiPreferences recentsInCharacterSet:](self, "recentsInCharacterSet:", 0);
}

- (id)recentsInCharacterSet:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EMFEmojiPreferences_recentsInCharacterSet___block_invoke;
  block[3] = &unk_1E66FA2C0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (void *)v14[5];
  if (!v7)
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __45__EMFEmojiPreferences_recentsInCharacterSet___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (+[EMFEmojiPreferences deviceStateIsLocked](EMFEmojiPreferences, "deviceStateIsLocked"))
  {
    +[EMFEmojiCategory _emojiSetForIdentifier:](EMFEmojiCategory, "_emojiSetForIdentifier:", CFSTR("EMFEmojiCategoryPrepopulated"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "copy");

  }
  else
  {
    v3 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "copy");
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (!a1[5]
          || objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "rangeOfCharacterFromSet:", (_QWORD)v14) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", v11, 0, (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)valueForKeyInLocalCachedDefaultsThreadsafe:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__EMFEmojiPreferences_valueForKeyInLocalCachedDefaultsThreadsafe___block_invoke;
  block[3] = &unk_1E66FA2E8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__EMFEmojiPreferences_valueForKeyInLocalCachedDefaultsThreadsafe___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)previouslyUsedCategory
{
  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  return (NSString *)-[EMFEmojiPreferences valueForKeyInLocalCachedDefaultsThreadsafe:](self, "valueForKeyInLocalCachedDefaultsThreadsafe:", CFSTR("EMFPreviouslyUsedCategoryKey"));
}

- (BOOL)hasDisplayedSkinToneHelp
{
  void *v3;
  char v4;

  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  -[EMFEmojiPreferences valueForKeyInLocalCachedDefaultsThreadsafe:](self, "valueForKeyInLocalCachedDefaultsThreadsafe:", CFSTR("EMFDidDisplaySkinToneHelpKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)adaptationControllerForLocaleIdentifier:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  CEM::AdaptationDatabaseController **p_adaptationController;
  AdaptationDatabaseController *value;
  const std::string::value_type *v9;
  size_t v10;
  uint64_t v11;
  CEM::AdaptationDatabaseController *v12;
  void *v13;
  size_t v14;
  CEM::AdaptationDatabaseController *v15;
  std::string __p;
  void *v18;
  size_t v19;
  unsigned __int8 v20;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v18, (char *)objc_msgSend(v5, "UTF8String"));

  value = self->_adaptationController.__ptr_.__value_;
  p_adaptationController = (CEM::AdaptationDatabaseController **)&self->_adaptationController;
  v6 = (uint64_t)value;
  if (value)
  {
    if ((v20 & 0x80u) == 0)
      v9 = (const std::string::value_type *)&v18;
    else
      v9 = (const std::string::value_type *)v18;
    if ((v20 & 0x80u) == 0)
      v10 = v20;
    else
      v10 = v19;
    CEM::AdaptationDatabaseController::setLocale(v6, v9, v10);
  }
  else
  {
    getEmojiAdaptationDatabasePath(0, &__p);
    v11 = operator new();
    v12 = (CEM::AdaptationDatabaseController *)v11;
    if ((v20 & 0x80u) == 0)
      v13 = &v18;
    else
      v13 = v18;
    if ((v20 & 0x80u) == 0)
      v14 = v20;
    else
      v14 = v19;
    CEM::AdaptationDatabaseController::AdaptationDatabaseController(v11, v13, v14, &__p);
    std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100](p_adaptationController, v12);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v15 = *p_adaptationController;
  if ((char)v20 < 0)
    operator delete(v18);

  return v15;
}

- (BOOL)recordEmojiEngagement:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void **v14;
  size_t v15;
  void **v16;
  size_t v17;
  BOOL v18;
  void *__p[2];
  unsigned __int8 v21;
  void *v22[2];
  unsigned __int8 v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = -[EMFEmojiPreferences adaptationControllerForLocaleIdentifier:](self, "adaptationControllerForLocaleIdentifier:", v10);
    std::string::basic_string[abi:ne180100]<0>(v22, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseStringWithLocale:", v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));

    if ((v21 & 0x80u) == 0)
      v14 = __p;
    else
      v14 = (void **)__p[0];
    if ((v21 & 0x80u) == 0)
      v15 = v21;
    else
      v15 = (size_t)__p[1];
    if ((v23 & 0x80u) == 0)
      v16 = v22;
    else
      v16 = (void **)v22[0];
    if ((v23 & 0x80u) == 0)
      v17 = v23;
    else
      v17 = (size_t)v22[1];
    v18 = CEM::AdaptationDatabaseController::recordEmojiEngagement((uint64_t)v11, v14, v15, v16, v17) != 0;
    if ((char)v21 < 0)
      operator delete(__p[0]);

    if ((char)v23 < 0)
      operator delete(v22[0]);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)copySortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  CEM::AdaptationDatabaseController *v11;
  void *v12;
  id v13;
  void **v14;
  size_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  uint64_t *v23;
  void *v24;
  unint64_t i;
  void *v26;
  id v27;
  void *__p[2];
  char v30;
  unint64_t v31;
  _OWORD v32[2];
  int v33;
  unsigned __int8 *v34;
  unsigned __int8 *v35;
  void *v36[2];
  unsigned __int8 v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[EMFEmojiPreferences adaptationControllerForLocaleIdentifier:](self, "adaptationControllerForLocaleIdentifier:", v10);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseStringWithLocale:", v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v36, (char *)objc_msgSend(v13, "UTF8String"));

  if ((v37 & 0x80u) == 0)
    v14 = v36;
  else
    v14 = (void **)v36[0];
  if ((v37 & 0x80u) == 0)
    v15 = v37;
  else
    v15 = (size_t)v36[1];
  CEM::AdaptationDatabaseController::getRecentEmojisForString(v11, v14, v15, (uint64_t *)&v34);
  if (v34 == v35)
  {
    v19 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v16 = 0;
    memset(v32, 0, sizeof(v32));
    v33 = 1065353216;
    while (1)
    {
      v31 = v16;
      if (v16 >= objc_msgSend(v8, "count"))
        break;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "string");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v18, "UTF8String"));

      std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::string&,long &>((uint64_t)v32, (unsigned __int8 *)__p, (uint64_t)__p, &v31);
      if (v30 < 0)
        operator delete(__p[0]);

      v16 = v31 + 1;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v34;
    v21 = v35;
    while (v20 != v21)
    {
      v22 = std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>>>::find<std::string>(v32, v20);
      v23 = (uint64_t *)v22;
      if (v22)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", *((_QWORD *)v22 + 5));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v24);

        std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::erase(v32, v23);
      }
      v20 += 24;
    }
    for (i = 0; i < objc_msgSend(v8, "count"); ++i)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "string");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v27, "UTF8String"));

      if (std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>>>::find<std::string>(v32, (unsigned __int8 *)__p))
      {
        objc_msgSend(v19, "addObject:", v26);
      }
      if (v30 < 0)
        operator delete(__p[0]);

    }
    std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::~__hash_table((uint64_t)v32);
  }
  *(_QWORD *)&v32[0] = &v34;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v32);
  if ((char)v37 < 0)
    operator delete(v36[0]);

  return v19;
}

- (void)sortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5 handler:(id)a6
{
  id v10;
  void (**v11)(id, id);

  v11 = (void (**)(id, id))a6;
  v10 = -[EMFEmojiPreferences copySortedEmojis:keyword:localeIdentifier:](self, "copySortedEmojis:keyword:localeIdentifier:", a3, a4, a5);
  v11[2](v11, v10);

}

- (void)readEmojiDefaults
{
  NSObject *v3;
  _QWORD block[5];

  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EMFEmojiPreferences_readEmojiDefaults__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

  -[EMFEmojiPreferences _readPreferencesFromDefaults](self, "_readPreferencesFromDefaults");
  -[EMFEmojiPreferences _pruneInvalidEmojiFromHistory](self, "_pruneInvalidEmojiFromHistory");
}

void __40__EMFEmojiPreferences_readEmojiDefaults__block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *DeepCopy;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (const __CFString *)objc_msgSend((id)objc_opt_class(), "defaultsDomain");
    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("EMFDefaultsKey"), v3);
    DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v4, 2uLL);
    objc_msgSend(*(id *)(a1 + 32), "setDefaults:", DeepCopy);

    objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDefaults:", v7);

    objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
  }
}

- (void)_readPreferencesFromDefaults
{
  NSObject *v3;
  _QWORD block[5];

  if (!+[EMFEmojiPreferences deviceStateIsLocked](EMFEmojiPreferences, "deviceStateIsLocked"))
  {
    _getSharedSerialOperationQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__EMFEmojiPreferences__readPreferencesFromDefaults__block_invoke;
    block[3] = &unk_1E66FA310;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

void __51__EMFEmojiPreferences__readPreferencesFromDefaults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("EMFRecentsKey"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("EMFUsageHistoryKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("EMFTypingNamesKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v8;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("EMFSkinToneBaseKeyPreferences"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v11;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("EMFViewedInCategoryKey"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("EMFRecentSequenceNumberKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = objc_msgSend(v17, "integerValue");

}

- (void)writeEmojiDefaults
{
  -[EMFEmojiPreferences writeEmojiDefaultsThreadSafeAndNotify:](self, "writeEmojiDefaultsThreadSafeAndNotify:", 1);
}

- (void)writeEmojiDefaultsThreadSafeAndNotify:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (!+[EMFEmojiPreferences deviceStateIsLocked](EMFEmojiPreferences, "deviceStateIsLocked"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    _getSharedSerialOperationQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke;
    block[3] = &unk_1E66FA338;
    block[4] = self;
    block[5] = &v13;
    dispatch_sync(v5, block);

    if (*((_BYTE *)v14 + 24))
    {
      _getSharedSerialOperationQueue();
      v7 = objc_claimAutoreleasedReturnValue();
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke_2;
      v11[3] = &unk_1E66FA310;
      v11[4] = self;
      dispatch_sync(v7, v11);

      -[EMFEmojiPreferences _pruneOldestEmojiUsageFromHistory](self, "_pruneOldestEmojiUsageFromHistory");
      _getSharedSerialOperationQueue();
      v8 = objc_claimAutoreleasedReturnValue();
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke_3;
      v9[3] = &unk_1E66FA360;
      v9[4] = self;
      v10 = a3;
      dispatch_sync(v8, v9);

    }
    _Block_object_dispose(&v13, 8);
  }
}

void __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v4 = (void *)v2;
    LOBYTE(v2) = objc_msgSend(*(id *)(a1 + 32), "isDefaultDirty");
    v3 = v4;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

void __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    objc_msgSend(v2, "defaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("EMFUsageHistoryKey"));

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (v2[6])
  {
    objc_msgSend(v2, "defaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("EMFRecentSequenceNumberKey"));

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (v2[2])
  {
    objc_msgSend(v2, "defaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("EMFRecentsKey"));

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (v2[4])
  {
    objc_msgSend(v2, "defaults");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("EMFSkinToneBaseKeyPreferences"));

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (v2[5])
  {
    objc_msgSend(v2, "defaults");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("EMFViewedInCategoryKey"));

  }
}

void __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke_3(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  const __CFString *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (objc_msgSend(*(id *)(a1 + 32), "isDefaultDirty"))
  {
    objc_msgSend(*(id *)(a1 + 32), "defaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (const __CFString *)objc_msgSend((id)objc_opt_class(), "defaultsDomain");
    CFPreferencesSetAppValue(CFSTR("EMFDefaultsKey"), v2, v3);

    v4 = (const __CFString *)objc_msgSend((id)objc_opt_class(), "defaultsDomain");
    CFPreferencesAppSynchronize(v4);
    objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 0);
    if (*(_BYTE *)(a1 + 40))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleKeyboardsEmojiChangedNotification"), 0, 0, 1u);
    }
  }
}

- (void)resetEmojiDefaults
{
  NSObject *v3;
  _QWORD block[5];

  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__EMFEmojiPreferences_resetEmojiDefaults__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __41__EMFEmojiPreferences_resetEmojiDefaults__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
}

- (void)loadDefaultsIfNecessaryThreadSafe
{
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__EMFEmojiPreferences_loadDefaultsIfNecessaryThreadSafe__block_invoke;
  v4[3] = &unk_1E66FA338;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  if (*((_BYTE *)v6 + 24))
    -[EMFEmojiPreferences readEmojiDefaults](self, "readEmojiDefaults");
  _Block_object_dispose(&v5, 8);
}

void __56__EMFEmojiPreferences_loadDefaultsIfNecessaryThreadSafe__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

}

- (void)_forceReadEmojiDefaults
{
  NSObject *v3;
  _QWORD block[5];

  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EMFEmojiPreferences__forceReadEmojiDefaults__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

  -[EMFEmojiPreferences readEmojiDefaults](self, "readEmojiDefaults");
}

uint64_t __46__EMFEmojiPreferences__forceReadEmojiDefaults__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDefaults:", 0);
}

- (void)migrateFromMajorOSVersion:(int64_t)a3
{
  id v4;

  -[EMFEmojiPreferences _checkForDingbatDuplicates](self, "_checkForDingbatDuplicates", a3);
  -[EMFEmojiPreferences _cleanUpOldFlagsCaches](self, "_cleanUpOldFlagsCaches");
  v4 = +[EMFEmojiCategory _emojiSetForIdentifier:](EMFEmojiCategory, "_emojiSetForIdentifier:", CFSTR("EMFEmojiCategoryFlags"));
}

- (void)_checkForDingbatDuplicates
{
  NSObject *v3;
  _QWORD block[5];

  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EMFEmojiPreferences__checkForDingbatDuplicates__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

  -[EMFEmojiPreferences writeEmojiDefaultsThreadSafeAndNotify:](self, "writeEmojiDefaultsThreadSafeAndNotify:", 0);
}

void __49__EMFEmojiPreferences__checkForDingbatDuplicates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(*(_QWORD *)v2 + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        +[EMFStringUtilities _preferenceIndexString:](EMFStringUtilities, "_preferenceIndexString:", v8, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 != v8)
          objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
        if (objc_msgSend(v3, "containsObject:", v9))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v8);
        }
        else
        {
          objc_msgSend(v3, "addObject:", v9);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isDefaultDirty"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setArray:", v3);

}

- (void)_pruneInvalidEmojiFromHistory
{
  NSObject *v3;
  _QWORD block[5];

  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EMFEmojiPreferences__pruneInvalidEmojiFromHistory__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __52__EMFEmojiPreferences__pruneInvalidEmojiFromHistory__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)v2 + 16));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "shouldCountEmojiStringForUsageHistory:", v8, (_QWORD)v9) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
          objc_msgSend(v3, "removeObject:", v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v8);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isDefaultDirty"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setArray:", v3);

}

- (void)_pruneOldestEmojiUsageFromHistory
{
  NSObject *v3;
  _QWORD block[5];

  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__EMFEmojiPreferences__pruneOldestEmojiUsageFromHistory__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __56__EMFEmojiPreferences__pruneOldestEmojiUsageFromHistory__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8) && *(uint64_t *)(v1 + 48) >= 1001)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 48);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = *(id *)(v3 + 8);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    v22 = a1;
    v6 = v4 - 500;
    if (v5)
    {
      v21 = *(_QWORD *)v30;
      do
      {
        v23 = v5;
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(v22 + 32) + 8), "objectForKey:", v8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v10 = v24;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v26 != v12)
                  objc_enumerationMutation(v10);
                v14 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "integerValue") - v6;
                if (v14 >= 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "addObject:", v15);

                }
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v11);
          }

          if (objc_msgSend(v9, "count"))
            objc_msgSend(v20, "setObject:forKey:", v9, v8);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v5);
    }

    objc_storeStrong((id *)(*(_QWORD *)(v22 + 32) + 8), v20);
    *(_QWORD *)(*(_QWORD *)(v22 + 32) + 48) -= v6;
    objc_msgSend(*(id *)(v22 + 32), "defaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(v22 + 32) + 8), CFSTR("EMFUsageHistoryKey"));

    objc_msgSend(*(id *)(v22 + 32), "defaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(v22 + 32) + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("EMFRecentSequenceNumberKey"));

  }
}

- (void)_cleanUpOldFlagsCaches
{
  NSObject *v3;
  _QWORD block[5];

  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EMFEmojiPreferences__cleanUpOldFlagsCaches__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __45__EMFEmojiPreferences__cleanUpOldFlagsCaches__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  objc_msgSend((id)objc_opt_class(), "defaultsDomain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithSuiteName:", v1);

  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", CFSTR("EMFDefaultsKey"));
  objc_msgSend(v5, "removeObject:", CFSTR("DidMigrateToEMF"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v2, "synchronize");
  v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
  objc_msgSend((id)objc_opt_class(), "_cacheDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithSuiteName:", v11);

  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(v12, "synchronize");
}

- (void)migrateInRecentEmoji:(id)a3 usages:(id)a4 typingNames:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  EMFEmojiPreferences *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _getSharedSerialOperationQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__EMFEmojiPreferences_migrateInRecentEmoji_usages_typingNames___block_invoke;
  block[3] = &unk_1E66FA388;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_sync(v11, block);

}

void __63__EMFEmojiPreferences_migrateInRecentEmoji_usages_typingNames___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v2, "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v35;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v35 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v7, "integerValue", (_QWORD)v34) > *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = objc_msgSend(v7, "integerValue");
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v4);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DE8];
    v9 = (void *)MEMORY[0x1E0CB37E8];
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
    objc_msgSend(v9, "numberWithInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v11;
  }
  +[EMFStringUtilities _preferenceIndexString:](EMFStringUtilities, "_preferenceIndexString:", *(_QWORD *)(a1 + 48), (_QWORD)v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD **)(a1 + 40);
  if (v13[1])
    v14 = 1;
  else
    v14 = v3 == 0;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(v16 + 8);
    *(_QWORD *)(v16 + 8) = v15;

    objc_msgSend(*(id *)(a1 + 40), "defaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("EMFUsageHistoryKey"));

    v13 = *(_QWORD **)(a1 + 40);
  }
  if (!v13[2] && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(void **)(v20 + 16);
    *(_QWORD *)(v20 + 16) = v19;

    objc_msgSend(*(id *)(a1 + 40), "defaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("EMFRecentsKey"));

    v13 = *(_QWORD **)(a1 + 40);
  }
  if (!v13[3] && *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(void **)(v24 + 24);
    *(_QWORD *)(v24 + 24) = v23;

    objc_msgSend(*(id *)(a1 + 40), "defaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("EMFTypingNamesKey"));

  }
  if (v3 && v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27 == 0;

    if (v28)
    {
      v29 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      v30 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v29, "setObject:forKey:", v30, v12);

    }
  }
  else if (!v12)
  {
    goto LABEL_37;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsObject:", v12) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v12);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == 0;

    if (v32)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 56), v12);
  }
LABEL_37:
  if (objc_msgSend(*(id *)(a1 + 40), "maximumRecentsCount"))
  {
    v33 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
    if (v33 > objc_msgSend(*(id *)(a1 + 40), "maximumRecentsCount"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectsInRange:", objc_msgSend(*(id *)(a1 + 40), "maximumRecentsCount"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count")- objc_msgSend(*(id *)(a1 + 40), "maximumRecentsCount"));
  }
  objc_msgSend(*(id *)(a1 + 40), "setIsDefaultDirty:", 1);

}

- (void)migrateInSkinTonePreferences:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EMFEmojiPreferences_migrateInSkinTonePreferences___block_invoke;
  block[3] = &unk_1E66FA3B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __52__EMFEmojiPreferences_migrateInSkinTonePreferences___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[4];
  objc_msgSend(v5, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("EMFSkinToneBaseKeyPreferences"));
  else
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("EMFSkinToneBaseKeyPreferences"));

  return objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
}

- (void)migrateInPreviouslyUsedCategory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  EMFEmojiPreferences *v9;

  v4 = a3;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__EMFEmojiPreferences_migrateInPreviouslyUsedCategory___block_invoke;
  block[3] = &unk_1E66FA3B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __55__EMFEmojiPreferences_migrateInPreviouslyUsedCategory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("EMFPreviouslyUsedCategoryKey"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("EMFPreviouslyUsedCategoryKey"));

  return objc_msgSend(*(id *)(a1 + 40), "setIsDefaultDirty:", 1);
}

- (void)migrateInPreviouslyUsedCategoryIndexes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__EMFEmojiPreferences_migrateInPreviouslyUsedCategoryIndexes___block_invoke;
  block[3] = &unk_1E66FA3B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __62__EMFEmojiPreferences_migrateInPreviouslyUsedCategoryIndexes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[5];
  objc_msgSend(v5, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("EMFViewedInCategoryKey"));
  else
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("EMFViewedInCategoryKey"));

  return objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
}

- (void)migrateInDidDisplaySkinToneHelp:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__EMFEmojiPreferences_migrateInDidDisplaySkinToneHelp___block_invoke;
  v6[3] = &unk_1E66FA360;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __55__EMFEmojiPreferences_migrateInDidDisplaySkinToneHelp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("EMFDidDisplaySkinToneHelpKey"));

  return objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
}

- (double)scoreForSequenceUnsafe:(int64_t)a3
{
  int64_t v3;

  v3 = self->_currentSequence - a3;
  if (v3 < 1)
    return 0.0;
  else
    return 1.0 / ((double)v3 * 0.1 + 1.0);
}

- (double)scoreForSequence:(int64_t)a3
{
  NSObject *v5;
  double v6;
  _QWORD block[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EMFEmojiPreferences_scoreForSequence___block_invoke;
  block[3] = &unk_1E66FA3D8;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

_QWORD *__40__EMFEmojiPreferences_scoreForSequence___block_invoke(_QWORD *result)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(result[4] + 48) - result[6];
  if (v1 < 1)
    v2 = 0.0;
  else
    v2 = 1.0 / ((double)v1 * 0.1 + 1.0);
  *(double *)(*(_QWORD *)(result[5] + 8) + 24) = v2;
  return result;
}

- (double)scoreForEmojiStringUnsafe:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKey:](self->_usageHistory, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          -[EMFEmojiPreferences scoreForSequenceUnsafe:](self, "scoreForSequenceUnsafe:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "integerValue", (_QWORD)v13));
          v9 = v9 + v11;
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (double)scoreForEmojiString:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EMFEmojiPreferences_scoreForEmojiString___block_invoke;
  block[3] = &unk_1E66FA2E8;
  v21 = &v22;
  block[4] = self;
  v6 = v4;
  v20 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)v23[5];
  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          -[EMFEmojiPreferences scoreForSequence:](self, "scoreForSequence:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "integerValue", (_QWORD)v15));
          v11 = v11 + v13;
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

  }
  else
  {
    v11 = 0.0;
  }

  _Block_object_dispose(&v22, 8);
  return v11;
}

void __43__EMFEmojiPreferences_scoreForEmojiString___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  EMFDPEventDispatcher *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = objc_alloc_init(EMFDPEventDispatcher);
  LOBYTE(v24) = a9;
  -[EMFDPEventDispatcher didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](v19, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", v25, a4, v15, v16, v17, v18, v24);
  if (v15)
    v20 = v15;
  else
    v20 = v16;
  v21 = v20;
  if (v21)
  {
    objc_msgSend(v25, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localeIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMFEmojiPreferences recordEmojiEngagement:keyword:localeIdentifier:](self, "recordEmojiEngagement:keyword:localeIdentifier:", v22, v21, v23);

  }
  -[EMFEmojiPreferences didUseEmoji:usageMode:](self, "didUseEmoji:usageMode:", v25, 0);

}

- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 4, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 candidatePosition:(id)a4 replacementContext:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 4, a5, 0, a4, 0, v5);
}

- (void)didUseEmojiInDictation:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 6, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInHandwriting:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 5, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInDFRBar:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 10, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInCharacterPickerLightweight:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 7, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInCharacterPickerPopover:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 8, 0, a4, 0, 0, v5);
}

- (void)didUseEmojiInCharacterPickerExtended:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 9, 0, a4, 0, 0, v5);
}

- (void)didUseEmojiInEmojiKeyboardPalette:(id)a3 wasFromRecentsSection:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
    v4 = 2;
  else
    v4 = 1;
  LOBYTE(v5) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, v4, 0, 0, 0, 0, v5);
}

- (void)didUseEmojiInEmojiKeyboardSearch:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFEmojiPreferences didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 3, 0, a4, a5, 0, v5);
}

- (void)didUseEmoji:(id)a3
{
  -[EMFEmojiPreferences didUseEmoji:usageMode:](self, "didUseEmoji:usageMode:", a3, CFSTR("EmojiKeyboard"));
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4
{
  -[EMFEmojiPreferences didUseEmoji:usageMode:typingName:](self, "didUseEmoji:usageMode:typingName:", a3, a4, 0);
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5 replacementContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    objc_msgSend(v15, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMFEmojiPreferences recordEmojiEngagement:keyword:localeIdentifier:](self, "recordEmojiEngagement:keyword:localeIdentifier:", v13, v12, v14);

  }
  -[EMFEmojiPreferences didUseEmoji:usageMode:typingName:](self, "didUseEmoji:usageMode:typingName:", v15, v10, v11);

}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;

  v7 = a3;
  v8 = a5;
  if (!+[EMFEmojiPreferences deviceStateIsLocked](EMFEmojiPreferences, "deviceStateIsLocked"))
  {
    -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__5;
    v14[4] = __Block_byref_object_dispose__5;
    v15 = 0;
    _getSharedSerialOperationQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__EMFEmojiPreferences_didUseEmoji_usageMode_typingName___block_invoke;
    v10[3] = &unk_1E66FA400;
    v10[4] = self;
    v11 = v8;
    v13 = v14;
    v12 = v7;
    dispatch_sync(v9, v10);

    _Block_object_dispose(v14, 8);
  }

}

void __56__EMFEmojiPreferences_didUseEmoji_usageMode_typingName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  id *v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;

  objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_msgSend(*(id *)(a1 + 32), "defaults");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("EMFRecentsKey"));

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 8))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    objc_msgSend(*(id *)(a1 + 32), "defaults");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("EMFUsageHistoryKey"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "length") && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(_QWORD *)(v10 + 24) = v9;

    objc_msgSend(*(id *)(a1 + 32), "defaults");
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("EMFTypingNamesKey"));

  }
  objc_msgSend(*(id *)(a1 + 48), "string");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  +[EMFStringUtilities _preferenceIndexString:](EMFStringUtilities, "_preferenceIndexString:");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldCountEmojiStringForUsageHistory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "supportsSkinToneVariants"))
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(v16 + 32);
        *(_QWORD *)(v16 + 32) = v15;

        objc_msgSend(*(id *)(a1 + 32), "defaults");
        v54 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("EMFSkinToneBaseKeyPreferences"));

      }
      objc_msgSend(*(id *)(a1 + 48), "string");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      +[EMFStringUtilities _baseStringForEmojiString:](EMFStringUtilities, "_baseStringForEmojiString:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (+[EMFEmojiCategory _supportsCoupleSkinToneSelection:](EMFEmojiCategory, "_supportsCoupleSkinToneSelection:", v18))
      {
        +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", v18, 0);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = objc_msgSend(*(id *)(a1 + 48), "copyWithSkinToneVariant:", 0);
      }
      v56 = (id)v19;
      if (v19)
      {
        v20 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(*(id *)(a1 + 48), "string");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "string");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v21, v22);

      }
    }
    v23 = (void *)MEMORY[0x1E0CB37E8];
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v23, "numberWithInteger:");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "defaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v57, CFSTR("EMFRecentSequenceNumberKey"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "addObject:", v57);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v57);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v26, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "scoreForEmojiStringUnsafe:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v28 = v27;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count")
      && (v29 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)), v29 != 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectAtIndex:", v29);
    }
    else
    {
      v30 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
      if (v30 >= objc_msgSend(*(id *)(a1 + 32), "maximumRecentsCount"))
      {
        v31 = *(id **)(a1 + 32);
        objc_msgSend(v31[2], "lastObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "scoreForEmojiStringUnsafe:", v32);
        v34 = v33;

        if (v34 < v28)
        {
          v35 = *(_QWORD *)(a1 + 32);
          v36 = *(void **)(v35 + 24);
          objc_msgSend(*(id *)(v35 + 16), "lastObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "removeObjectForKey:", v37);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeLastObject");
        }
      }
    }
    v38 = 0;
    do
    {
      v39 = v38;
      if (v38 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
        break;
      v40 = *(id **)(a1 + 32);
      objc_msgSend(v40[2], "objectAtIndex:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "scoreForEmojiStringUnsafe:", v41);
      v43 = v42;

      v38 = v39 + 1;
    }
    while (v43 >= v28);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "insertObject:atIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v39);
    objc_msgSend(*(id *)(a1 + 48), "localeIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = objc_msgSend(*(id *)(a1 + 40), "length");

      if (v45)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v46, "mutableCopy");

        if (!v47)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:");
        }
        v48 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "localeIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKey:", v48, v49);

      }
    }

  }
}

- (BOOL)shouldCountEmojiStringForUsageHistory:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__EMFEmojiPreferences_shouldCountEmojiStringForUsageHistory___block_invoke;
  v7[3] = &unk_1E66FA428;
  v7[4] = &v8;
  objc_msgSend(v3, "_enumerateEmojiTokensInRange:block:", 0, v4, v7);
  v5 = v9[3] == 1;
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __61__EMFEmojiPreferences_shouldCountEmojiStringForUsageHistory___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)didViewEmojiIndex:(int64_t)a3 forCategory:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  _getSharedSerialOperationQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__EMFEmojiPreferences_didViewEmojiIndex_forCategory___block_invoke;
  block[3] = &unk_1E66FA450;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(v7, block);

}

uint64_t __53__EMFEmojiPreferences_didViewEmojiIndex_forCategory___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(a1 + 32), "defaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("EMFViewedInCategoryKey"));

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("EMFPreviouslyUsedCategoryKey"));

  return objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
}

- (void)didDisplaySkinToneHelp
{
  NSObject *v3;
  _QWORD block[5];

  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  _getSharedSerialOperationQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EMFEmojiPreferences_didDisplaySkinToneHelp__block_invoke;
  block[3] = &unk_1E66FA310;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __45__EMFEmojiPreferences_didDisplaySkinToneHelp__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("EMFDidDisplaySkinToneHelpKey"));

  return objc_msgSend(*(id *)(a1 + 32), "setIsDefaultDirty:", 1);
}

- (BOOL)hasLastUsedVariantForEmoji:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  EMFEmojiPreferences *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EMFEmojiPreferences_hasLastUsedVariantForEmoji___block_invoke;
  block[3] = &unk_1E66FA2C0;
  v10 = self;
  v11 = &v12;
  v9 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __50__EMFEmojiPreferences_hasLastUsedVariantForEmoji___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "supportsSkinToneVariants") & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "string");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "skinTone"))
  {
    +[EMFStringUtilities _baseStringForEmojiString:](EMFStringUtilities, "_baseStringForEmojiString:", v5);
    v2 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v2;
  }
  else
  {
    v3 = v5;
  }
  v6 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

- (id)recentVariantEmojiForEmoji:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v4 = a3;
  v17 = v4;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EMFEmojiPreferences_recentVariantEmojiForEmoji___block_invoke;
  block[3] = &unk_1E66FA478;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__EMFEmojiPreferences_recentVariantEmojiForEmoji___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "recentEmojis", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v6, "isEqualIgnoringModifiers:", *(_QWORD *)(a1 + 40)))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)lastUsedVariantEmojiForEmoji:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  EMFEmojiPreferences *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "supportsSkinToneVariants");
  v6 = v4;
  v7 = v6;
  v8 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMFStringUtilities _baseStringForEmojiString:](EMFStringUtilities, "_baseStringForEmojiString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isCoupleMultiSkinToneEmoji:", v10))
    {
      v31[0] = CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone");
      v31[1] = CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v7, "copyWithSkinToneVariantSpecifier:", v11);

    }
    else
    {
      v12 = v7;
      if (objc_msgSend(v7, "skinTone"))
      {
        v12 = (void *)objc_msgSend(v7, "copyWithSkinToneVariant:", 0);

      }
    }
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__5;
    v29 = __Block_byref_object_dispose__5;
    v30 = 0;
    _getSharedSerialOperationQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __52__EMFEmojiPreferences_lastUsedVariantEmojiForEmoji___block_invoke;
    v21 = &unk_1E66FA2E8;
    v24 = &v25;
    v22 = self;
    v14 = v12;
    v23 = v14;
    dispatch_sync(v13, &v18);

    v15 = v26[5];
    if (v15)
    {
      objc_msgSend(v7, "localeData", v18, v19, v20, v21, v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", v15, v16);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v7;
    }

    _Block_object_dispose(&v25, 8);
  }

  return v8;
}

void __52__EMFEmojiPreferences_lastUsedVariantEmojiForEmoji___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "string");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unint64_t)previouslyUsedIndexInCategory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  _getSharedSerialOperationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__EMFEmojiPreferences_previouslyUsedIndexInCategory___block_invoke;
  block[3] = &unk_1E66FA478;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __53__EMFEmojiPreferences_previouslyUsedIndexInCategory___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");
    v2 = v3;
  }

}

- (id)typingNameForEmoji:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMFStringUtilities _preferenceIndexString:](EMFStringUtilities, "_preferenceIndexString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  _getSharedSerialOperationQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EMFEmojiPreferences_typingNameForEmoji___block_invoke;
  block[3] = &unk_1E66FA2E8;
  v17 = &v18;
  block[4] = self;
  v8 = v6;
  v16 = v8;
  dispatch_sync(v7, block);

  objc_msgSend(v4, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (v10 = (void *)v19[5],
        objc_msgSend(v4, "localeIdentifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKey:", v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    objc_msgSend((id)v19[5], "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __42__EMFEmojiPreferences_typingNameForEmoji___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)deviceStateIsLocked
{
  int v2;

  v2 = MKBGetDeviceLockState();
  return v2 != 3 && v2 != 0;
}

+ (id)_cachedFlagCategoryEmoji:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  CFPropertyListRef v10;
  void *v11;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  EMFGetDeviceBuildVersion();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C997A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%@"), v6, v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v10 = CFPreferencesCopyAppValue(v9, (CFStringRef)objc_msgSend(a1, "_cacheDomain"));
  v11 = (void *)v10;
  if (v4)
  {
    if (!v10)
    {
      v4[2](v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        CFPreferencesSetAppValue(v9, v11, (CFStringRef)objc_msgSend(a1, "_cacheDomain"));
        CFPreferencesAppSynchronize((CFStringRef)objc_msgSend(a1, "_cacheDomain"));
      }
    }
  }

  return v11;
}

- (unint64_t)maximumRecentsCount
{
  return self->_maximumRecentsCount;
}

- (void)setMaximumRecentsCount:(unint64_t)a3
{
  self->_maximumRecentsCount = a3;
}

- (NSMutableDictionary)defaults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)isDefaultDirty
{
  return self->_isDefaultDirty;
}

- (void)setIsDefaultDirty:(BOOL)a3
{
  self->_isDefaultDirty = a3;
}

- (void)_setRecentStrings:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (!+[EMFEmojiPreferences deviceStateIsLocked](EMFEmojiPreferences, "deviceStateIsLocked"))
  {
    -[EMFEmojiPreferences loadDefaultsIfNecessaryThreadSafe](self, "loadDefaultsIfNecessaryThreadSafe");
    _getSharedSerialOperationQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__EMFEmojiPreferences_Testing___setRecentStrings___block_invoke;
    block[3] = &unk_1E66FA3B0;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

uint64_t __50__EMFEmojiPreferences_Testing___setRecentStrings___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 16);
      *(_QWORD *)(v4 + 16) = v3;

      objc_msgSend(*(id *)(a1 + 32), "defaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("EMFRecentsKey"));

      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      v2 = 0;
    }
  }
  return objc_msgSend(v2, "setArray:", *(_QWORD *)(a1 + 40));
}

@end
