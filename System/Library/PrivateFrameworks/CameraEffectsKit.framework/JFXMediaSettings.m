@implementation JFXMediaSettings

+ (JFXMediaSettings)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_29);
  return (JFXMediaSettings *)(id)sharedInstance_s_sharedInstance_0;
}

void __34__JFXMediaSettings_sharedInstance__block_invoke()
{
  JFXMediaSettings *v0;
  void *v1;

  v0 = objc_alloc_init(JFXMediaSettings);
  v1 = (void *)sharedInstance_s_sharedInstance_0;
  sharedInstance_s_sharedInstance_0 = (uint64_t)v0;

}

+ (JFXMediaSettingsProvider)providerDelegate
{
  void *v2;
  id v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = (id)jfx_providerDelegate;
  objc_sync_exit(v2);

  return (JFXMediaSettingsProvider *)v3;
}

+ (void)setProviderDelegate:(id)a3
{
  id v3;
  void *v4;
  id obj;

  v3 = a3;
  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v4 = (void *)jfx_providerDelegate;
  jfx_providerDelegate = (uint64_t)v3;

  objc_sync_exit(obj);
}

- (int)frameRate
{
  void *v2;
  int v3;

  objc_msgSend((id)objc_opt_class(), "providerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frameRate");

  return v3;
}

- (int)timeScale
{
  void *v2;
  int v3;

  objc_msgSend((id)objc_opt_class(), "providerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeScale");

  return v3;
}

- (CGSize)renderSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "providerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)compositionSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "providerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositionSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)frameSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "providerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (int)frameRate
{
  void *v2;
  int v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frameRate");

  return v3;
}

+ (int)timeScale
{
  void *v2;
  int v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeScale");

  return v3;
}

+ (CGSize)frameSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)renderSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)compositionSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositionSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

@end
