@implementation AVEnhanceDialogueOptInManager

- (AVEnhanceDialogueOptInManager)init
{
  AVEnhanceDialogueOptInManager *v2;
  AVEnhanceDialogueOptInManager *v3;
  uint64_t v4;
  NSMutableSet *enhanceDialogueControllers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVEnhanceDialogueOptInManager;
  v2 = -[AVEnhanceDialogueOptInManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enhanceDialoguePreference = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    enhanceDialogueControllers = v3->_enhanceDialogueControllers;
    v3->_enhanceDialogueControllers = (NSMutableSet *)v4;

  }
  return v3;
}

- (void)optInEnhanceDialogueController:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;

  v4 = a3;
  -[AVEnhanceDialogueOptInManager enhanceDialogueControllers](self, "enhanceDialogueControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[AVEnhanceDialogueOptInManager enhanceDialogueControllers](self, "enhanceDialogueControllers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v6 = -[AVEnhanceDialogueOptInManager enhanceDialoguePreference](self, "enhanceDialoguePreference");

    if (v6 != 2)
      -[AVEnhanceDialogueOptInManager setEnhanceDialoguePreference:](self, "setEnhanceDialoguePreference:", 2);
  }
  else
  {

  }
}

- (void)optOutEnhanceDialogueController:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;

  v4 = a3;
  -[AVEnhanceDialogueOptInManager enhanceDialogueControllers](self, "enhanceDialogueControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[AVEnhanceDialogueOptInManager enhanceDialogueControllers](self, "enhanceDialogueControllers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

  }
  else
  {
    v6 = -[AVEnhanceDialogueOptInManager enhanceDialoguePreference](self, "enhanceDialoguePreference");

    if (v6 == 2)
      -[AVEnhanceDialogueOptInManager setEnhanceDialoguePreference:](self, "setEnhanceDialoguePreference:", 1);
  }
}

- (BOOL)isEnhanceDialogueControllerOptedIn:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AVEnhanceDialogueOptInManager enhanceDialogueControllers](self, "enhanceDialogueControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setEnhanceDialoguePreference:(int64_t)a3
{
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_enhanceDialoguePreference != a3)
  {
    v10 = 0;
    v5 = objc_msgSend(MEMORY[0x1E0C89A50], "setEnhanceDialoguePreference:error:");
    v6 = v10;
    if ((v5 & 1) == 0)
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "localizedDescription");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v9 = objc_msgSend(v8, "cStringUsingEncoding:", 4);
        *(_DWORD *)buf = 136315138;
        v12 = v9;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Unable to set Enhance Dialogue preference: %s", buf, 0xCu);

      }
    }
    if (!v6)
      self->_enhanceDialoguePreference = a3;

  }
}

- (int64_t)enhanceDialoguePreference
{
  return self->_enhanceDialoguePreference;
}

- (NSMutableSet)enhanceDialogueControllers
{
  return self->_enhanceDialogueControllers;
}

- (void)setEnhanceDialogueControllers:(id)a3
{
  objc_storeStrong((id *)&self->_enhanceDialogueControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhanceDialogueControllers, 0);
}

+ (AVEnhanceDialogueOptInManager)sharedInstance
{
  void *v2;
  AVEnhanceDialogueOptInManager *v3;
  void *v4;

  v2 = (void *)sharedInstance_sharedInstance_14347;
  if (!sharedInstance_sharedInstance_14347)
  {
    v3 = objc_alloc_init(AVEnhanceDialogueOptInManager);
    v4 = (void *)sharedInstance_sharedInstance_14347;
    sharedInstance_sharedInstance_14347 = (uint64_t)v3;

    v2 = (void *)sharedInstance_sharedInstance_14347;
  }
  return (AVEnhanceDialogueOptInManager *)v2;
}

@end
