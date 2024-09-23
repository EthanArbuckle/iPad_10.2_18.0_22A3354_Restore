@implementation CNUILikenessRenderer

id __92___CNUILikenessRenderer_likenessProvidersForContacts_likenessResolverOptions_workScheduler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "likenessResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "likenessesForContact:options:workScheduler:", v4, a1[5], a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "observeOn:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __97___CNUILikenessRenderer_renderedLikenessesForLikenessProviders_badges_scope_likenessFingerprint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __97___CNUILikenessRenderer_renderedLikenessesForLikenessProviders_badges_scope_likenessFingerprint___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  }
  v11 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "likenessProvidersForBadges:", *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "renderedLikenessesForProviders:likenessBadgeProviders:scope:", v3, v12, *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "size");
      v16 = v15;
      objc_msgSend(v13, "size");
      v17 = *(_QWORD *)(a1 + 32);
      v20 = 134218498;
      v21 = v16;
      v22 = 2048;
      v23 = v18;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_1DD140000, v14, OS_LOG_TYPE_INFO, "[LikenessRenderer] Successful {%.2f, %.2f} result for rendered likeness for %{public}@", (uint8_t *)&v20, 0x20u);
    }

  }
  return v13;
}

+ (id)descriptorForRequiredKeysForCaching
{
  return +[_CNUICachingLikenessRenderer descriptorForRequiredKeys](_CNUICachingLikenessRenderer, "descriptorForRequiredKeys");
}

id __65___CNUILikenessRenderer_loadingPlaceholderForContactCount_scope___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (*(_QWORD *)(a1 + 48) >= 2uLL
    && +[CNUISnowglobeUtilities enableGroupPhoto](CNUISnowglobeUtilities, "enableGroupPhoto"))
  {
    objc_msgSend(*(id *)(a1 + 32), "likenessResolver");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "placeholderProviderFactory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadingGroupPlaceholderProviderWithBackgroundStyle:", objc_msgSend(*(id *)(a1 + 40), "backgroundStyle"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "likenessResolver");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "placeholderProviderFactory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadingPlaceholderProvider");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  objc_msgSend(*(id *)(a1 + 32), "renderedLoadingPlaceholderForContactCount:provider:scope:", *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)descriptorForRequiredKeys
{
  return +[_CNUILikenessRenderer descriptorForRequiredKeys](_CNUILikenessRenderer, "descriptorForRequiredKeys");
}

+ (id)cachingRendererWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5
{
  id v7;
  id v8;
  _CNUILikenessRenderer *v9;
  _CNUICachingLikenessRenderer *v10;
  void *v11;
  _CNUICachingLikenessRenderer *v12;

  v7 = a5;
  v8 = a3;
  v9 = -[_CNUILikenessRenderer initWithLikenessResolver:schedulerProvider:]([_CNUILikenessRenderer alloc], "initWithLikenessResolver:schedulerProvider:", v8, v7);
  v10 = [_CNUICachingLikenessRenderer alloc];
  objc_msgSend(v8, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_CNUICachingLikenessRenderer initWithLikenessRenderer:schedulerProvider:capacity:shouldRequireMainThread:contactStore:](v10, "initWithLikenessRenderer:schedulerProvider:capacity:shouldRequireMainThread:contactStore:", v9, v7, a4, 1, v11);
  return v12;
}

+ (id)cachingRendererWithLikenessResolver:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  id v6;
  _CNUILikenessRenderer *v7;
  _CNUICachingLikenessRenderer *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[_CNUILikenessRenderer initWithLikenessResolver:schedulerProvider:]([_CNUILikenessRenderer alloc], "initWithLikenessResolver:schedulerProvider:", v6, v5);

  v8 = -[_CNUICachingLikenessRenderer initWithLikenessRenderer:schedulerProvider:]([_CNUICachingLikenessRenderer alloc], "initWithLikenessRenderer:schedulerProvider:", v7, v5);
  return v8;
}

+ (id)rendererWithLikenessResolver:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  id v6;
  _CNUILikenessRenderer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CNUILikenessRenderer initWithLikenessResolver:schedulerProvider:]([_CNUILikenessRenderer alloc], "initWithLikenessResolver:schedulerProvider:", v6, v5);

  return v7;
}

id __66___CNUILikenessRenderer_likenessProvidersForBadges_workScheduler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "likenessResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "badgeObservableWithLikenessBadge:workScheduler:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

CNUIPRLikenessBadgeImageProvider *__52___CNUILikenessRenderer_likenessProvidersForBadges___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNUIPRLikenessBadgeImageProvider *v3;

  v2 = a2;
  v3 = -[CNUIPRLikenessBadgeImageProvider initWithBadge:]([CNUIPRLikenessBadgeImageProvider alloc], "initWithBadge:", v2);

  return v3;
}

uint64_t __64___CNUILikenessRenderer_renderedLikenessForBadgeProvider_scope___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGImage *v10;
  double v11;

  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pointSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v10 = (CGImage *)objc_msgSend(v3, "cgImageForLikenessProvider:pointSize:scale:style:alwaysUsePointSize:", v4, objc_msgSend(*(id *)(a1 + 32), "style"), 1, v6, v8, v9);

  CGImageGetWidth(v10);
  CGImageGetHeight(v10);
  objc_msgSend(*(id *)(a1 + 32), "scale");
  return -[objc_class imageWithCGImage:scale:orientation:](NSClassFromString(CFSTR("UIImage")), "imageWithCGImage:scale:orientation:", v10, 0, v11);
}

id __63___CNUILikenessRenderer_renderedBasicMonogramFromString_scope___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 40);
  v9 = a2;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderedLikenessesForProviders:likenessBadgeProviders:scope:", v6, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32), v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)concurrentCachingRendererWithLikenessResolver:(id)a3 capacity:(unint64_t)a4 schedulerProvider:(id)a5
{
  id v7;
  id v8;
  _CNUILikenessRenderer *v9;
  _CNUICachingLikenessRenderer *v10;
  void *v11;
  _CNUICachingLikenessRenderer *v12;

  v7 = a5;
  v8 = a3;
  v9 = -[_CNUILikenessRenderer initWithLikenessResolver:schedulerProvider:]([_CNUILikenessRenderer alloc], "initWithLikenessResolver:schedulerProvider:", v8, v7);
  v10 = [_CNUICachingLikenessRenderer alloc];
  objc_msgSend(v8, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_CNUICachingLikenessRenderer initWithLikenessRenderer:schedulerProvider:capacity:shouldRequireMainThread:contactStore:](v10, "initWithLikenessRenderer:schedulerProvider:capacity:shouldRequireMainThread:contactStore:", v9, v7, a4, 0, v11);
  return v12;
}

void __97___CNUILikenessRenderer_renderedLikenessesForLikenessProviders_badges_scope_likenessFingerprint___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, a2, a3, "[LikenessRenderer] Requesting group rendered likeness for %{public}@", a5, a6, a7, a8, 2u);
}

@end
