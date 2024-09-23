@implementation NUCompositionUtilities

+ (BOOL)isHDRComposition:(id)a3
{
  id v3;
  char v4;
  NUVideoPropertiesRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (!v3 || !+[NUGlobalSettings enableHDRSupport](NUGlobalSettings, "enableHDRSupport"))
  {
    v4 = 0;
    goto LABEL_6;
  }
  if (!+[NUGlobalSettings allAssetsCanUseHDRPipeline](NUGlobalSettings, "allAssetsCanUseHDRPipeline"))
  {
    if (objc_msgSend(v3, "mediaType") == 2)
    {
      v6 = -[NURenderRequest initWithComposition:]([NUVideoPropertiesRequest alloc], "initWithComposition:", v3);
      -[NURenderRequest setName:](v6, "setName:", CFSTR("NUCompositionUtilities-isHDRComposition-videoProperties"));
      v12 = 0;
      -[NUVideoPropertiesRequest submitSynchronous:](v6, "submitSynchronous:", &v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v4 = objc_msgSend(v8, "isHDR");
LABEL_12:

LABEL_14:
        goto LABEL_6;
      }
    }
    else
    {
      v6 = -[NURenderRequest initWithComposition:]([NUImagePropertiesRequest alloc], "initWithComposition:", v3);
      -[NURenderRequest setName:](v6, "setName:", CFSTR("NUCompositionUtilities-isHDRComposition-imageProperties"));
      v11 = 0;
      -[NUVideoPropertiesRequest submitSynchronous:](v6, "submitSynchronous:", &v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "colorSpace");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v10, "isHDR");

        goto LABEL_12;
      }
    }
    v4 = 0;
    goto LABEL_14;
  }
  v4 = 1;
LABEL_6:

  return v4;
}

+ (BOOL)dumpComposition:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;

  v7 = a4;
  +[NUAdjustmentSerialization propertyListFromComposition:error:](NUAdjustmentSerialization, "propertyListFromComposition:error:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "writeToURL:error:", v7, a5);
  else
    v10 = 0;

  return v10;
}

+ (BOOL)dumpComposition:(id)a3 withName:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a4;
  v7 = a3;
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v12 = +[NUCompositionUtilities dumpComposition:toURL:error:](NUCompositionUtilities, "dumpComposition:toURL:error:", v7, v11, &v19);

  v13 = v19;
  if (v12)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23713);
    v14 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      objc_msgSend(v11, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl(&dword_1A6553000, v15, OS_LOG_TYPE_INFO, "Successfully dumped the composition to file %@", buf, 0xCu);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23713);
    v17 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1A6553000, v17, OS_LOG_TYPE_INFO, "Failed to dump the composition: %@", buf, 0xCu);
    }
  }

  return v12;
}

@end
