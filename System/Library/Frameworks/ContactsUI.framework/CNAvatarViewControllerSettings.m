@implementation CNAvatarViewControllerSettings

- (BOOL)threeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (unint64_t)style
{
  return self->_style;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUILikenessRendering)likenessRenderer
{
  return self->_likenessRenderer;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

+ (id)defaultSettingsWithCacheSize:(unint64_t)a3 threeDTouchEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "settingsWithContactStore:cacheSize:threeDTouchEnabled:", v8, a3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (CNAvatarViewControllerSettings)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 threeDTouchEnabled:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a5;
  v7 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D13D48]);
  objc_msgSend(v8, "defaultSchedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithContactStore:schedulerProvider:", v7, v10);

  objc_msgSend(v11, "setProhibitedSources:", 8);
  v12 = v11;
  if (a4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = (void *)MEMORY[0x1E0D13D28];
    objc_msgSend(v8, "defaultSchedulerProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rendererWithLikenessResolver:schedulerProvider:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D50]), "initWithLikenessResolver:capacity:", v12, a4);

    v14 = (void *)MEMORY[0x1E0D13D28];
    objc_msgSend(v8, "defaultSchedulerProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cachingRendererWithLikenessResolver:capacity:schedulerProvider:", v13, a4, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v8, "defaultSchedulerProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarViewControllerSettings settingsWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:](CNAvatarViewControllerSettings, "settingsWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:", v13, v16, v7, v5, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNAvatarViewControllerSettings *)v19;
}

+ (id)defaultSettings
{
  return (id)objc_msgSend(a1, "defaultSettingsWithBackgroundStyle:", 0);
}

+ (CNAvatarViewControllerSettings)settingsWithContactStore:(id)a3 threeDTouchEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v5 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D13D48]);
  objc_msgSend(v6, "defaultSchedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithContactStore:schedulerProvider:", v5, v8);

  objc_msgSend(v9, "setProhibitedSources:", 8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D50]), "initWithLikenessResolver:", v9);
  v11 = (void *)MEMORY[0x1E0D13D28];
  objc_msgSend(v6, "defaultSchedulerProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cachingRendererWithLikenessResolver:schedulerProvider:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "defaultSchedulerProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarViewControllerSettings settingsWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:](CNAvatarViewControllerSettings, "settingsWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:", v10, v13, v5, v4, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNAvatarViewControllerSettings *)v15;
}

+ (BOOL)threeDTouchEnabledDefaultValue
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_likenessRenderer, 0);
  objc_storeStrong((id *)&self->_likenessResolver, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (CNAvatarViewControllerSettings)initWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 contactStore:(id)a5 threeDTouchEnabled:(BOOL)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CNAvatarViewControllerSettings *v18;
  CNAvatarViewControllerSettings *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CNAvatarViewControllerSettings;
  v18 = -[CNAvatarViewControllerSettings init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_likenessResolver, a3);
    objc_storeStrong((id *)&v19->_likenessRenderer, a4);
    objc_storeStrong((id *)&v19->_contactStore, a5);
    v19->_threeDTouchEnabled = a6;
    objc_storeStrong((id *)&v19->_schedulerProvider, a7);
    v19->_backgroundStyle = a8;
  }

  return v19;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  self->_threeDTouchEnabled = a3;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (CNUIPRLikenessResolver)likenessResolver
{
  return self->_likenessResolver;
}

- (void)setLikenessResolver:(id)a3
{
  objc_storeStrong((id *)&self->_likenessResolver, a3);
}

- (void)setLikenessRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_likenessRenderer, a3);
}

- (void)setSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_schedulerProvider, a3);
}

+ (id)defaultSettingsWithBackgroundStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachingLikenessResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachingLikenessRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "threeDTouchEnabledDefaultValue");
  objc_msgSend(v5, "defaultSchedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "settingsWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:", v6, v7, v8, v9, v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (CNAvatarViewControllerSettings)settingsWithContactStore:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "settingsWithContactStore:threeDTouchEnabled:", v4, objc_msgSend(a1, "threeDTouchEnabledDefaultValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNAvatarViewControllerSettings *)v5;
}

+ (CNAvatarViewControllerSettings)settingsWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 contactStore:(id)a5 threeDTouchEnabled:(BOOL)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  CNAvatarViewControllerSettings *v17;

  v9 = a6;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[CNAvatarViewControllerSettings initWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:]([CNAvatarViewControllerSettings alloc], "initWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:", v16, v15, v14, v9, v13, a8);

  return v17;
}

@end
