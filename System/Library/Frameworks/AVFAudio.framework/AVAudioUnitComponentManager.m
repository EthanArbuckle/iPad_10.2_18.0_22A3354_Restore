@implementation AVAudioUnitComponentManager

+ (AVAudioUnitComponentManager)sharedAudioUnitComponentManager
{
  pthread_once(&gAVAudioUnitComponentManagerInitOnce, (void (*)(void))AVAudioUnitComponentManagerInitOnce);
  return (AVAudioUnitComponentManager *)(id)gAVAudioUnitComponentManager;
}

+ (void)privateAllocInitSingleton
{
  uint64_t v2;
  void *v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AVAudioUnitComponentManager;
  v2 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  v3 = (void *)gAVAudioUnitComponentManager;
  gAVAudioUnitComponentManager = v2;

}

+ (AVAudioUnitComponentManager)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "sharedAudioUnitComponentManager", a3);
  return (AVAudioUnitComponentManager *)objc_claimAutoreleasedReturnValue();
}

- (AVAudioUnitComponentManager)init
{
  AVAudioUnitComponentManager *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  OpaqueAudioComponent *i;
  AVAudioUnitComponent *v8;
  AVAudioUnitComponent *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  AudioComponentDescription outDesc;
  AudioComponentDescription inDesc;
  AudioComponentDescription v22;

  v19.receiver = self;
  v19.super_class = (Class)AVAudioUnitComponentManager;
  v2 = -[AVAudioUnitComponentManager init](&v19, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_QWORD *)v3 = &off_1E3BE9708;
    *(_QWORD *)(v3 + 8) = 0;
    *(_QWORD *)(v3 + 32) = 850045863;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = 0;
    *(_OWORD *)(v3 + 40) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 72) = 0u;
    *(_QWORD *)(v3 + 88) = 0;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&inDesc, 0, sizeof(inDesc));
    for (i = AudioComponentFindNext(0, &inDesc); i; i = AudioComponentFindNext(i, &inDesc))
    {
      memset(&outDesc, 0, sizeof(outDesc));
      AudioComponentGetDescription(i, &outDesc);
      if (HIWORD(outDesc.componentType) == 24949)
      {
        v8 = [AVAudioUnitComponent alloc];
        v22 = outDesc;
        v9 = -[AVAudioUnitComponent initWithComponentDescription:withAVAUManagerImpl:](v8, "initWithComponentDescription:withAVAUManagerImpl:", &v22, v3);
        objc_msgSend(*(id *)(v3 + 8), "addObject:", v9);
        -[AVAudioUnitComponent allTagNames](v9, "allTagNames");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v10);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "mutableCopy");
    v14 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v13;

    v2->_impl = (void *)v3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel_localeChanged_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel_registrationsChanged_, *MEMORY[0x1E0CFFD18], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel_registrationsChanged_, *MEMORY[0x1E0CFFD10], 0);

  }
  return v2;
}

- (void)localeChanged:(id)a3
{
  std::mutex *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (std::mutex *)((char *)self->_impl + 32);
  std::mutex::lock(v4);
  v5 = *((id *)self->_impl + 1);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "localeChanged", (_QWORD)v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  std::mutex::unlock(v4);
}

- (void)registrationsChanged:(id)a3
{
  char *impl;
  void *v4;
  id v5;
  OpaqueAudioComponent *i;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  AVAudioUnitComponent *v13;
  AVAudioUnitComponent *v14;
  void *v15;
  void *v16;
  void *v17;
  std::mutex *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  AudioComponentDescription outDesc;
  AudioComponentDescription inDesc;
  __int128 v27;
  __int128 v28;
  int v29;
  AudioComponentDescription v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  impl = (char *)self->_impl;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *((_QWORD *)impl + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  memset(&inDesc, 0, sizeof(inDesc));
  for (i = AudioComponentFindNext(0, &inDesc); i; i = AudioComponentFindNext(i, &inDesc))
  {
    memset(&outDesc, 0, sizeof(outDesc));
    AudioComponentGetDescription(i, &outDesc);
    if (HIWORD(outDesc.componentType) == 24949)
    {
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v32;
        while (2)
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v32 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            if ((OpaqueAudioComponent *)objc_msgSend(v11, "audioComponent") == i)
            {
              if (v11)
              {
                objc_msgSend(v11, "audioComponentDescription");
              }
              else
              {
                v28 = 0uLL;
                v29 = 0;
              }
              *(_OWORD *)&v30.componentType = v28;
              v27 = *(_OWORD *)&outDesc.componentType;
              if ((_QWORD)v28 == *(_QWORD *)&outDesc.componentType
                && DWORD2(v28) == (unint64_t)outDesc.componentManufacturer)
              {
                objc_msgSend(v23, "removeObject:", v11);
                v14 = v11;

                goto LABEL_20;
              }
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v8)
            continue;
          break;
        }
      }

      v13 = [AVAudioUnitComponent alloc];
      v30 = outDesc;
      v14 = -[AVAudioUnitComponent initWithComponentDescription:withAVAUManagerImpl:](v13, "initWithComponentDescription:withAVAUManagerImpl:", &v30, impl);
      objc_msgSend(v22, "addObject:", v14);
LABEL_20:
      v15 = (void *)MEMORY[0x1E0C99E60];
      -[AVAudioUnitComponent allTagNames](v14, "allTagNames");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "unionSet:", v17);
    }
  }
  if (objc_msgSend(v22, "count") || objc_msgSend(v23, "count"))
  {
    objc_msgSend(v4, "removeObjectsInArray:", v23);
    objc_msgSend(v4, "addObjectsFromArray:", v22);
    v18 = (std::mutex *)(impl + 32);
    std::mutex::lock((std::mutex *)(impl + 32));
    objc_msgSend(*((id *)impl + 1), "removeAllObjects");
    objc_msgSend(*((id *)impl + 1), "addObjectsFromArray:", v4);
    objc_msgSend(*((id *)impl + 2), "removeAllObjects");
    v19 = (void *)*((_QWORD *)impl + 2);
    objc_msgSend(v5, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v20);

    std::mutex::unlock(v18);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postNotificationName:object:", CFSTR("AVAudioUnitComponentManagerRegistrationsChangedNotification"), self);

}

- (NSArray)tagNames
{
  return (NSArray *)(id)objc_msgSend(*((id *)self->_impl + 2), "copy");
}

- (NSArray)standardLocalizedTagNames
{
  void *impl;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  impl = self->_impl;
  v3 = (void *)*((_QWORD *)impl + 3);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &standardTagNamesKeys, 22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)*((_QWORD *)impl + 3);
    *((_QWORD *)impl + 3) = v5;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.audio.units.Components"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      for (i = 0; objc_msgSend(v4, "count") > i; ++i)
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E3BED4C0, CFSTR("AudioUnitTags"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)impl + 3), "addObject:", v10);

      }
    }

    v3 = (void *)*((_QWORD *)impl + 3);
  }
  v11 = v3;
  v12 = (void *)objc_msgSend(v11, "copy");

  return (NSArray *)v12;
}

- (NSArray)componentsMatchingPredicate:(NSPredicate *)predicate
{
  NSPredicate *v4;
  std::mutex *v5;
  void *v6;

  v4 = predicate;
  v5 = (std::mutex *)((char *)self->_impl + 32);
  std::mutex::lock(v5);
  objc_msgSend(*((id *)self->_impl + 1), "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  std::mutex::unlock(v5);

  return (NSArray *)v6;
}

- (NSArray)componentsPassingTest:(void *)testHandler
{
  unsigned int (**v4)(void *, uint64_t, char *);
  std::mutex *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = testHandler;
  v5 = (std::mutex *)((char *)self->_impl + 32);
  std::mutex::lock(v5);
  v6 = *((id *)self->_impl + 1);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v8);
      v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
      if (v4[2](v4, v12, &v19))
        objc_msgSend(v7, "addObject:", v12, (_QWORD)v15);
      if (v19)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  std::mutex::unlock(v5);
  return (NSArray *)v13;
}

- (NSArray)componentsMatchingDescription:(AudioComponentDescription *)desc
{
  std::mutex *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  UInt32 componentFlagsMask;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (std::mutex *)((char *)self->_impl + 32);
  std::mutex::lock(v5);
  v6 = *((id *)self->_impl + 1);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v15 = *(_OWORD *)&desc->componentType;
        componentFlagsMask = desc->componentFlagsMask;
        if (objc_msgSend(v12, "isComponentDescriptionMatch:", &v15))
          objc_msgSend(v7, "addObject:", v12);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  std::mutex::unlock(v5);
  return (NSArray *)v13;
}

@end
