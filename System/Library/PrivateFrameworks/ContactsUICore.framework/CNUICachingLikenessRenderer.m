@implementation CNUICachingLikenessRenderer

id __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_cold_1(a1, v5, v6);

    objc_msgSend(*(id *)(a1 + 32), "initialRenderedLikenessesForContacts:withBadges:scope:workScheduler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_12;
    v17 = &unk_1EA605A30;
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(v7, "doOnNext:", &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "startCacheEntryWithObservable:contacts:scope:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v14, v15, v16, v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "touchCacheKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "imageObservable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __77___CNUICachingLikenessRenderer_startCacheEntryWithObservable_contacts_scope___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

id __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSynchronousSerialSchedulerWithName:", a2);
}

id __87___CNUICachingLikenessRenderer_createMainThreadSchedulerProviderWithSchedulerProvider___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newReaderWriterSchedulerWithName:", a2);
}

void __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_12_cold_1(a1, (uint64_t)v3, v4);

}

id __77___CNUICachingLikenessRenderer_renderedLikenessForBadge_scope_workScheduler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "renderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "renderedLikenessForBadge:scope:workScheduler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "startCacheEntryWithObservable:contacts:scope:", v6, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "touchCacheKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "imageObservable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, a2, a3, "[LikenessCachingRenderer] Cache miss for %@, scope %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

void __93___CNUICachingLikenessRenderer_renderedLikenessesForContacts_withBadges_scope_workScheduler___block_invoke_12_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  NSSize v15;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pointSize");
  NSStringFromSize(v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_1DD140000, a3, OS_LOG_TYPE_DEBUG, "[LikenessCachingRenderer] New image (%@) for key '%@': %@", (uint8_t *)&v8, 0x20u);

}

@end
