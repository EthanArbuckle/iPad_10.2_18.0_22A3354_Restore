@implementation MFDataDetectors

+ (id)sharedDetectionController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (sharedDetectionController__DDDetectionControllerClass)
  {
    objc_msgSend((id)sharedDetectionController__DDDetectionControllerClass, "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_sync_enter(v3);
    if ((sharedDetectionController_inited & 1) == 0)
    {
      sharedDetectionController_inited = 1;
      MEMORY[0x1AF432B4C](v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/DataDetectorsUI.framework/DataDetectorsUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_retainAutorelease(v6);
      if (dlopen((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 4))
      {
        sharedDetectionController__DDDetectionControllerClass = (uint64_t)NSClassFromString(CFSTR("DDDetectionController"));
      }
      else
      {
        MFLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315138;
          v11 = dlerror();
          _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Failed to load DataDetectorsUI.framework (%s)", (uint8_t *)&v10, 0xCu);
        }

      }
    }
    objc_sync_exit(v3);

    objc_msgSend((id)sharedDetectionController__DDDetectionControllerClass, "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (Class)_DDURLifierClass
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)_DDURLifierClass__DDURLifierClass;
  if (!_DDURLifierClass__DDURLifierClass)
  {
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_sync_enter(v3);
    if ((_DDURLifierClass_inited & 1) == 0)
    {
      _DDURLifierClass_inited = 1;
      MEMORY[0x1AF432B4C](v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/DataDetectorsCore.framework/DataDetectorsCore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_retainAutorelease(v6);
      if (dlopen((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 4))
      {
        _DDURLifierClass__DDURLifierClass = (uint64_t)NSClassFromString(CFSTR("DDURLifier"));
      }
      else
      {
        MFLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315138;
          v11 = dlerror();
          _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Failed to load DataDetectorsCore.framework (%s)", (uint8_t *)&v10, 0xCu);
        }

      }
    }
    objc_sync_exit(v3);

    v2 = (void *)_DDURLifierClass__DDURLifierClass;
  }
  return (Class)v2;
}

+ (id)urlMatchesForString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_DDURLifierClass"), "urlMatchesForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)urlMatchesForString:(id)a3 includingTel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_DDURLifierClass"), "urlMatchesForString:includingTel:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)urlIfyNode:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(a1) = objc_msgSend((id)objc_msgSend(a1, "_DDURLifierClass"), "urlIfyNode:", v4);

  return (char)a1;
}

+ (BOOL)urlIfyNode:(id)a3 phoneNumberTypes:(unint64_t)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend((id)objc_msgSend(a1, "_DDURLifierClass"), "urlIfyNode:phoneNumberTypes:", v6, a4);

  return a4;
}

@end
