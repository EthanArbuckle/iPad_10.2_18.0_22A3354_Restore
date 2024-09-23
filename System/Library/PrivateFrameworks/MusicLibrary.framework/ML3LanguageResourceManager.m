@implementation ML3LanguageResourceManager

- (ML3LanguageResources)resources
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__20827;
  v10 = __Block_byref_object_dispose__20828;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ML3LanguageResourceManager_resources__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ML3LanguageResources *)v3;
}

+ (ML3LanguageResourceManager)sharedResourceManager
{
  if (sharedResourceManager___once != -1)
    dispatch_once(&sharedResourceManager___once, &__block_literal_global_20836);
  return (ML3LanguageResourceManager *)(id)sharedResourceManager___sharedResourceManager;
}

void __51__ML3LanguageResourceManager_sharedResourceManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ML3LanguageResourceManager _init]([ML3LanguageResourceManager alloc], "_init");
  v1 = (void *)sharedResourceManager___sharedResourceManager;
  sharedResourceManager___sharedResourceManager = (uint64_t)v0;

}

- (id)_init
{
  ML3LanguageResourceManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3LanguageResourceManager;
  v2 = -[ML3LanguageResourceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MusicLibrary.ML3LanguageResourceManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

void __39__ML3LanguageResourceManager_resources__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    if (__daemonProcessInfo)
    {
      objc_msgSend(v2, "_buildLanguageResources");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 8);
      *(_QWORD *)(v5 + 8) = v4;
    }
    else
    {
      +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __39__ML3LanguageResourceManager_resources__block_invoke_2;
      v7[3] = &unk_1E5B65B10;
      v7[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "getLanguageResourcesWithCompletion:", v7);
    }

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __39__ML3LanguageResourceManager_resources__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Error fetching language resources. (Error = %{public}@) Falling back to building resources in-process.", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_buildLanguageResources");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = v9;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
  }

}

- (void)invalidateCachedResources
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ML3LanguageResourceManager_invalidateCachedResources__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (id)_buildLanguageResources
{
  const __CFString *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  const __CFString *ValueAtIndex;
  __CFString *CanonicalLanguageIdentifierFromString;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ML3LanguageResources *v11;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B228];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B228]);
  v3 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), v2);
  if (!v3)
    goto LABEL_6;
  v4 = v3;
  if (CFArrayGetCount(v3) <= 0)
  {
    CFRelease(v4);
LABEL_6:
    CanonicalLanguageIdentifierFromString = CFSTR("en");
    goto LABEL_7;
  }
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, 0);
  CanonicalLanguageIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLanguageIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], ValueAtIndex);
  CFRelease(v4);
  if (!CanonicalLanguageIdentifierFromString)
    goto LABEL_6;
LABEL_7:
  +[ML3MusicLibrary pathForResourceFileOrFolder:](ML3MusicLibrary, "pathForResourceFileOrFolder:", 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v7);
  +[ML3MusicLibrary pathForResourceFileOrFolder:](ML3MusicLibrary, "pathForResourceFileOrFolder:", 17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v9);
  v11 = -[ML3LanguageResources initWithSectionsInfo:sortingDetails:canonicalLanguageIdentifier:]([ML3LanguageResources alloc], "initWithSectionsInfo:sortingDetails:canonicalLanguageIdentifier:", v8, v10, CanonicalLanguageIdentifierFromString);

  return v11;
}

- (ML3LanguageResources)cachedResources
{
  return self->_cachedResources;
}

- (void)setCachedResources:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResources, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_cachedResources, 0);
}

void __55__ML3LanguageResourceManager_invalidateCachedResources__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

@end
