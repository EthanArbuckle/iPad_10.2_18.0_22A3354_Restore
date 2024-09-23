@implementation _CNUICachingLikenessRenderer

- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNUILikenessFingerprint *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CNUILikenessFingerprint *v23;
  void *v24;
  CNUILikenessFingerprint *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[CNUILikenessFingerprint initWithContacts:badges:scope:isResolutionIndependent:]([CNUILikenessFingerprint alloc], "initWithContacts:badges:scope:isResolutionIndependent:", v10, v11, v12, 0);
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[_CNUICachingLikenessRenderer renderedLikenessesForContacts:withBadges:scope:workScheduler:].cold.2((uint64_t)v10, (uint64_t)v12, v15);

  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[_CNUICachingLikenessRenderer renderedLikenessesForContacts:withBadges:scope:workScheduler:].cold.1((uint64_t)v14, v16);

  -[_CNUICachingLikenessRenderer imageCache](self, "imageCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v14;
  v27 = v10;
  v28 = v12;
  v29 = v11;
  v30 = v13;
  v19 = v13;
  v20 = v11;
  v21 = v12;
  v22 = v10;
  v23 = v14;
  CNResultWithLock();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (_CNUILikenessImageCache)imageCache
{
  return self->_imageCache;
}

- (id)initialRenderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[_CNUICachingLikenessRenderer renderer](self, "renderer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renderedLikenessesForContacts:withBadges:scope:workScheduler:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)loadingPlaceholderForContactCount:(unint64_t)a3 scope:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[_CNUICachingLikenessRenderer renderer](self, "renderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadingPlaceholderForContactCount:scope:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_CNUILikenessRenderer)renderer
{
  return self->_renderer;
}

- (id)renderedLikenessesForContacts:(id)a3 scope:(id)a4 workScheduler:(id)a5
{
  return -[_CNUICachingLikenessRenderer renderedLikenessesForContacts:withBadges:scope:workScheduler:](self, "renderedLikenessesForContacts:withBadges:scope:workScheduler:", a3, MEMORY[0x1E0C9AA60], a4, a5);
}

+ (id)descriptorForRequiredKeys
{
  return +[_CNUILikenessRenderer descriptorForRequiredKeys](_CNUILikenessRenderer, "descriptorForRequiredKeys");
}

- (id)startCacheEntryWithObservable:(id)a3 contacts:(id)a4 scope:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CNUICachingLikenessRendererReplaySubject *v11;
  void *v12;
  _CNUICachingLikenessRendererReplaySubject *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [_CNUICachingLikenessRendererReplaySubject alloc];
  -[_CNUICachingLikenessRenderer mainThreadSchedulerProvider](self, "mainThreadSchedulerProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNReplaySubject initWithCapacity:schedulerProvider:](v11, "initWithCapacity:schedulerProvider:", 1, v12);

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  objc_msgSend(v8, "subscribe:", v13);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77___CNUICachingLikenessRenderer_startCacheEntryWithObservable_contacts_scope___block_invoke;
  v17[3] = &unk_1EA605A80;
  v17[4] = &v18;
  -[_CNUICachingLikenessRendererReplaySubject doOnTerminate:](v13, "doOnTerminate:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIRenderedLikenessCacheEntry entryWithObservable:token:contacts:scope:](CNUIRenderedLikenessCacheEntry, "entryWithObservable:token:contacts:scope:", v14, v19[5], v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v18, 8);
  return v15;
}

- (CNSchedulerProvider)mainThreadSchedulerProvider
{
  return self->_mainThreadSchedulerProvider;
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNUICachingLikenessRenderer delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPointer:", v4);

}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4 capacity:(unint64_t)a5 shouldRequireMainThread:(BOOL)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  _CNUICachingLikenessRenderer *v14;

  v6 = a6;
  v10 = (objc_class *)MEMORY[0x1E0C97298];
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  v14 = -[_CNUICachingLikenessRenderer initWithLikenessRenderer:schedulerProvider:capacity:shouldRequireMainThread:contactStore:](self, "initWithLikenessRenderer:schedulerProvider:capacity:shouldRequireMainThread:contactStore:", v12, v11, a5, v6, v13);

  return v14;
}

- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4 capacity:(unint64_t)a5 shouldRequireMainThread:(BOOL)a6 contactStore:(id)a7
{
  id v13;
  id v14;
  id v15;
  _CNUICachingLikenessRenderer *v16;
  _CNUICachingLikenessRenderer *v17;
  uint64_t v18;
  CNSchedulerProvider *mainThreadSchedulerProvider;
  _CNUILikenessImageCache *v20;
  _CNUILikenessImageCache *imageCache;
  uint64_t v22;
  NSPointerArray *delegates;
  CNAvatarCacheChangeListener *v24;
  CNAvatarCacheChangeListener *changeHistoryListener;
  _CNUICachingLikenessRenderer *v26;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_CNUICachingLikenessRenderer;
  v16 = -[_CNUICachingLikenessRenderer init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_schedulerProvider, a4);
    objc_msgSend((id)objc_opt_class(), "createMainThreadSchedulerProviderWithSchedulerProvider:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    mainThreadSchedulerProvider = v17->_mainThreadSchedulerProvider;
    v17->_mainThreadSchedulerProvider = (CNSchedulerProvider *)v18;

    objc_storeStrong((id *)&v17->_renderer, a3);
    v20 = -[_CNUILikenessImageCache initWithCapacity:hasContactStore:]([_CNUILikenessImageCache alloc], "initWithCapacity:hasContactStore:", a5, v15 != 0);
    imageCache = v17->_imageCache;
    v17->_imageCache = v20;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v22 = objc_claimAutoreleasedReturnValue();
    delegates = v17->_delegates;
    v17->_delegates = (NSPointerArray *)v22;

    v17->_shouldRequireMainThread = a6;
    if (v15)
    {
      v24 = -[CNAvatarCacheChangeListener initWithContactStore:delegate:]([CNAvatarCacheChangeListener alloc], "initWithContactStore:delegate:", v15, v17);
      changeHistoryListener = v17->_changeHistoryListener;
      v17->_changeHistoryListener = v24;

      -[CNAvatarCacheChangeListener start](v17->_changeHistoryListener, "start");
    }
    v26 = v17;
  }

  return v17;
}

+ (id)createMainThreadSchedulerProviderWithSchedulerProvider:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  objc_msgSend(v3, "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D13B70]);
  objc_msgSend(v3, "inlineScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "immediateScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke;
  v17[3] = &unk_1EA603D00;
  v18 = v4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke_2;
  v15[3] = &unk_1EA603D00;
  v16 = v3;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke_3;
  v13[3] = &unk_1EA6046E0;
  v14 = v16;
  v9 = v16;
  v10 = v4;
  v11 = (void *)objc_msgSend(v5, "initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v10, v10, v6, v7, v17, v15, v13);

  return v11;
}

- (_CNUICachingLikenessRenderer)initWithLikenessRenderer:(id)a3 schedulerProvider:(id)a4
{
  return -[_CNUICachingLikenessRenderer initWithLikenessRenderer:schedulerProvider:capacity:shouldRequireMainThread:](self, "initWithLikenessRenderer:schedulerProvider:capacity:shouldRequireMainThread:", a3, a4, 10, 1);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C96870], 0);

  v4.receiver = self;
  v4.super_class = (Class)_CNUICachingLikenessRenderer;
  -[_CNUICachingLikenessRenderer dealloc](&v4, sel_dealloc);
}

- (void)setLookupOptions:(unint64_t)a3
{
  -[_CNUILikenessRenderer setLookupOptions:](self->_renderer, "setLookupOptions:", a3);
}

+ (id)_cacheKeyForContacts:(id)a3 scope:(id)a4
{
  return +[CNUILikenessFingerprint fingerprintForContacts:scope:](CNUILikenessFingerprint, "fingerprintForContacts:scope:", a3, a4);
}

- (id)renderedLikenessForBadge:(id)a3 scope:(id)a4 workScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNUILikenessFingerprint *v11;
  void *v12;
  CNUILikenessFingerprint *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  CNUILikenessFingerprint *v19;
  void *v20;
  CNUILikenessFingerprint *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [CNUILikenessFingerprint alloc];
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNUILikenessFingerprint initWithContacts:badges:scope:isResolutionIndependent:](v11, "initWithContacts:badges:scope:isResolutionIndependent:", MEMORY[0x1E0C9AA60], v12, v9, 0);

  -[_CNUICachingLikenessRenderer imageCache](self, "imageCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v13;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = v13;
  CNResultWithLock();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)renderedBasicMonogramFromString:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_CNUICachingLikenessRenderer renderer](self, "renderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderedBasicMonogramFromString:scope:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)renderedBasicMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  _CNUICachingLikenessRenderer *v12;
  id v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  CNUnimplementedMethodException();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v13);
}

- (void)updateContactsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[_CNUICachingLikenessRenderer delegates](self, "delegates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    -[_CNUICachingLikenessRenderer imageCache](self, "imageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateCacheEntriesContainingIdentifiers:", v4);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "avatarCacheDidUpdateForIdentifiers:", v4, (_QWORD)v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD140000, v8, OS_LOG_TYPE_INFO, "No changes to process", buf, 2u);
    }
  }

}

- (unint64_t)lookupOptions
{
  return self->_lookupOptions;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (BOOL)shouldRequireMainThread
{
  return self->_shouldRequireMainThread;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void)setMainThreadSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mainThreadSchedulerProvider, a3);
}

- (CNAvatarCacheChangeListener)changeHistoryListener
{
  return self->_changeHistoryListener;
}

- (void)setChangeHistoryListener:(id)a3
{
  objc_storeStrong((id *)&self->_changeHistoryListener, a3);
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_changeHistoryListener, 0);
  objc_storeStrong((id *)&self->_mainThreadSchedulerProvider, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

- (void)renderedLikenessesForContacts:(uint64_t)a1 withBadges:(NSObject *)a2 scope:workScheduler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DD140000, a2, OS_LOG_TYPE_DEBUG, "[LikenessCachingRenderer] Cache key: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)renderedLikenessesForContacts:(NSObject *)a3 withBadges:scope:workScheduler:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, a3, (uint64_t)a3, "[LikenessCachingRenderer] New Request for %@, %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

@end
