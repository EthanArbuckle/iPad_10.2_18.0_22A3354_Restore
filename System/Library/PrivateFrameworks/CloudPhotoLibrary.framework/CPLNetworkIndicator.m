@implementation CPLNetworkIndicator

+ (void)_reallyShowNetworkIndicatorForBundleWithIdentifierLocked:(id)a3
{
  if (__SBSSetStatusBarShowsActivityForApplication)
    __SBSSetStatusBarShowsActivityForApplication(1, a3, 3600);
}

+ (void)_reallyHideNetworkIndicatorForBundleWithIdentifierLocked:(id)a3
{
  if (__SBSSetStatusBarShowsActivityForApplication)
    __SBSSetStatusBarShowsActivityForApplication(0, a3, 3600);
}

+ (void)_doProtected:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  if (_doProtected__onceToken_20089 != -1)
    dispatch_once(&_doProtected__onceToken_20089, &__block_literal_global_20090);
  v4 = (void *)_doProtected__queue_20091;
  v5 = v3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_20092;
  block[3] = &unk_1E60D71F8;
  v9 = v5;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

+ (void)showNetworkIndicatorForBundleWithIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  _QWORD v7[4];
  __CFString *v8;
  id v9;

  v4 = (__CFString *)a3;
  v5 = CFSTR("com.apple.mobileslideshow");
  if (v4)
    v5 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CPLNetworkIndicator_showNetworkIndicatorForBundleWithIdentifier___block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v8 = v5;
  v9 = a1;
  v6 = v5;
  objc_msgSend(a1, "_doProtected:", v7);

}

+ (void)hideNetworkIndicatorForBundleWithIdentifier:(id)a3
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v8[4];
  __CFString *v9;
  SEL v10;
  id v11;

  v5 = (__CFString *)a3;
  v6 = CFSTR("com.apple.mobileslideshow");
  v8[0] = MEMORY[0x1E0C809B0];
  if (v5)
    v6 = v5;
  v8[1] = 3221225472;
  v8[2] = __67__CPLNetworkIndicator_hideNetworkIndicatorForBundleWithIdentifier___block_invoke;
  v8[3] = &unk_1E60DD0C0;
  v9 = v6;
  v10 = a2;
  v11 = a1;
  v7 = v6;
  objc_msgSend(a1, "_doProtected:", v8);

}

uint64_t __67__CPLNetworkIndicator_hideNetworkIndicatorForBundleWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)bundleIdentifiersWithNetworkIndicator, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "%@ was called too many times for %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLNetworkIndicator.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, v9, 71, CFSTR("%@ was called too many times for %@"), v10, *(_QWORD *)(a1 + 32));

    abort();
  }
  objc_msgSend((id)bundleIdentifiersWithNetworkIndicator, "removeObject:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend((id)bundleIdentifiersWithNetworkIndicator, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 48), "_reallyHideNetworkIndicatorForBundleWithIdentifierLocked:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __67__CPLNetworkIndicator_showNetworkIndicatorForBundleWithIdentifier___block_invoke(uint64_t a1)
{
  if ((objc_msgSend((id)bundleIdentifiersWithNetworkIndicator, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_reallyShowNetworkIndicatorForBundleWithIdentifierLocked:", *(_QWORD *)(a1 + 32));
  return objc_msgSend((id)bundleIdentifiersWithNetworkIndicator, "addObject:", *(_QWORD *)(a1 + 32));
}

void __36__CPLNetworkIndicator__doProtected___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  id v3;
  void *v4;

  CPLCopyDefaultSerialQueueAttributes();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.cpl.networkindicator", v0);
  v2 = (void *)_doProtected__queue_20091;
  _doProtected__queue_20091 = (uint64_t)v1;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v4 = (void *)bundleIdentifiersWithNetworkIndicator;
  bundleIdentifiersWithNetworkIndicator = (uint64_t)v3;

}

@end
