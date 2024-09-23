@implementation LNSpotlightCascadeBridge

+ (void)deleteItems:(id)a3 bundleIdentifier:(id)a4 version:(unint64_t)a5 validity:(id)a6 completionHandler:(id)a7
{
  void (**v7)(id, _QWORD);
  NSObject *v8;
  uint8_t v9[16];

  v7 = (void (**)(id, _QWORD))a7;
  getLNLogCategoryVocabulary();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_INFO, "Ignoring AppEntity donations", v9, 2u);
  }

  v7[2](v7, 0);
}

+ (void)donateItems:(id)a3 bundleIdentifier:(id)a4 version:(unint64_t)a5 validity:(id)a6 completionHandler:(id)a7
{
  void (**v7)(id, _QWORD);
  NSObject *v8;
  uint8_t v9[16];

  v7 = (void (**)(id, _QWORD))a7;
  getLNLogCategoryVocabulary();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_INFO, "Ignoring AppEntity donations", v9, 2u);
  }

  v7[2](v7, 0);
}

@end
