@implementation ASCViewRender

+ (NSString)subsystem
{
  return (NSString *)CFSTR("com.apple.AppStoreComponents");
}

+ (NSString)category
{
  return (NSString *)CFSTR("PageRender");
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__ASCViewRender_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1)
    dispatch_once(&log_onceToken_8, block);
  return (OS_os_log *)(id)log_log_8;
}

void __20__ASCViewRender_log__block_invoke(uint64_t a1)
{
  const char *v2;
  id v3;
  os_log_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "subsystem");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = (const char *)objc_msgSend(v6, "UTF8String");
  objc_msgSend(*(id *)(a1 + 32), "category");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = os_log_create(v2, (const char *)objc_msgSend(v3, "UTF8String"));
  v5 = (void *)log_log_8;
  log_log_8 = (uint64_t)v4;

}

+ (NSSet)requiredFieldNames
{
  return (NSSet *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("pageRequestedTime"), CFSTR("requestStartTime"), CFSTR("requestEndTime"), CFSTR("jsCallStartTime"), CFSTR("jsCallEndTime"), CFSTR("rootViewModelParseStartTime"), CFSTR("rootViewModelParseEndTime"), CFSTR("pageUserReadyTime"), 0);
}

+ (void)overlayRequestedWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 0, CFSTR("overlayRequested"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_EVENT, a3, "overlayRequested", ", v7, 2u);
  }

}

+ (void)modelPrefetchDidBeginWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("modelPrefetchStart"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "modelPrefetch", ", v7, 2u);
  }

}

+ (void)modelPrefetchDidEndWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("modelPrefetchEnd"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_END, a3, "modelPrefetch", ", v7, 2u);
  }

}

+ (void)pageRequestedWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 0, CFSTR("pageRequested"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_EVENT, a3, "pageRequested", ", v7, 2u);
  }

}

+ (void)bootstrapDidBeginWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("bootstrapStart"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "bootstrap", ", v7, 2u);
  }

}

+ (void)bootstrapDidEndWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("bootstrapEnd"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_END, a3, "bootstrap", ", v7, 2u);
  }

}

+ (void)launchCorrelationKeyWithTag:(unint64_t)a3 withString:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 1, CFSTR("launchCorrelationKey"));
  objc_msgSend(a1, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v9 = 138412290;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v8, OS_SIGNPOST_EVENT, a3, "launchCorrelationKey", "String=%{signpost.description:attribute}@", (uint8_t *)&v9, 0xCu);
  }

}

+ (void)requestDidBeginWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("requestStart"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "request", ", v7, 2u);
  }

}

+ (void)requestDidEndWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("requestEnd"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_END, a3, "request", ", v7, 2u);
  }

}

+ (void)jsStackBootstrapDidBeginWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("jsStackBootstrapStart"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "jsStackBootstrap", ", v7, 2u);
  }

}

+ (void)jsStackBootstrapDidEndWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("jsStackBootstrapEnd"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_END, a3, "jsStackBootstrap", ", v7, 2u);
  }

}

+ (void)jsCallDidBeginWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("jsCallStart"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "jsCall", ", v7, 2u);
  }

}

+ (void)jsCallDidEndWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("jsCallEnd"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_END, a3, "jsCall", ", v7, 2u);
  }

}

+ (void)rootViewModelParseDidBeginWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("rootViewModelParseStart"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "rootViewModelParse", ", v7, 2u);
  }

}

+ (void)rootViewModelParseDidEndWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("rootViewModelParseEnd"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_END, a3, "rootViewModelParse", ", v7, 2u);
  }

}

+ (void)rootViewModelPresentWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 0, CFSTR("rootViewModelPresent"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_EVENT, a3, "rootViewModelPresent", ", v7, 2u);
  }

}

+ (void)resourceRequestDidBeginWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("resourceRequestStart"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "resourceRequest", ", v7, 2u);
  }

}

+ (void)resourceRequestDidEndWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 3, CFSTR("resourceRequestEnd"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_INTERVAL_END, a3, "resourceRequest", ", v7, 2u);
  }

}

+ (void)pageUserReadyWithTag:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a1, "willEmitSignpostOfType:withName:", 0, CFSTR("pageUserReady"));
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BCB7B000, v6, OS_SIGNPOST_EVENT, a3, "pageUserReady", ", v7, 2u);
  }

}

@end
