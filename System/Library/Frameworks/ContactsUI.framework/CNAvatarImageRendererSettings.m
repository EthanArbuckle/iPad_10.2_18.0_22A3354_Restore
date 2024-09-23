@implementation CNAvatarImageRendererSettings

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5 concurrentCaches:(BOOL)a6 skipContactLookup:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CNAvatarImageRendererSettings *v19;

  v7 = a7;
  v8 = a6;
  v11 = a5;
  v12 = (objc_class *)MEMORY[0x1E0D13D48];
  v13 = a3;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithContactStore:schedulerProvider:", v13, v11);

  objc_msgSend(v14, "setProhibitedSources:", 8);
  if (v7)
    objc_msgSend(v14, "setLookupOptions:", 1);
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0D13D28], "rendererWithLikenessResolver:schedulerProvider:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v15;
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D50]), "initWithLikenessResolver:capacity:schedulerProvider:", v15, a4, v11);

    if (v8)
      objc_msgSend(MEMORY[0x1E0D13D28], "concurrentCachingRendererWithLikenessResolver:capacity:schedulerProvider:", v17, a4, v11);
    else
      objc_msgSend(MEMORY[0x1E0D13D28], "cachingRendererWithLikenessResolver:capacity:schedulerProvider:", v17, a4, v11);
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
  }
  v19 = -[CNAvatarImageRendererSettings initWithLikenessResolver:likenessRenderer:schedulerProvider:]([CNAvatarImageRendererSettings alloc], "initWithLikenessResolver:likenessRenderer:schedulerProvider:", v17, v16, v11);

  return v19;
}

- (CNAvatarImageRendererSettings)initWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 schedulerProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAvatarImageRendererSettings *v12;
  CNAvatarImageRendererSettings *v13;
  CNAvatarImageRendererSettings *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNAvatarImageRendererSettings;
  v12 = -[CNAvatarImageRendererSettings init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_likenessResolver, a3);
    objc_storeStrong((id *)&v13->_likenessRenderer, a4);
    objc_storeStrong((id *)&v13->_schedulerProvider, a5);
    v14 = v13;
  }

  return v13;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUIPRLikenessResolver)likenessResolver
{
  return self->_likenessResolver;
}

- (CNUILikenessRendering)likenessRenderer
{
  return self->_likenessRenderer;
}

+ (id)defaultSettings
{
  return (id)objc_msgSend(a1, "defaultSettingsWithCacheSize:", 0);
}

+ (id)defaultSettingsWithCacheSize:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "defaultSettingsWithCacheSize:skipContactLookup:", a3, 0);
}

+ (id)defaultSettingsWithCacheSize:(unint64_t)a3 skipContactLookup:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "settingsWithContactStore:cacheSize:skipContactLookup:", v9, a3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 skipContactLookup:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSchedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "settingsWithContactStore:cacheSize:schedulerProvider:skipContactLookup:", v8, a4, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5 skipContactLookup:(BOOL)a6
{
  return (id)objc_msgSend(a1, "settingsWithContactStore:cacheSize:schedulerProvider:concurrentCaches:skipContactLookup:", a3, a4, a5, 0, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likenessRenderer, 0);
  objc_storeStrong((id *)&self->_likenessResolver, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

+ (id)offMainThreadSynchronousRenderingOnlySettingsWithCacheSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultSchedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inlineScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D13B70]);
  objc_msgSend(v6, "backgroundScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "immediateScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke;
  v21[3] = &unk_1E2049F00;
  v22 = v6;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke_2;
  v19[3] = &unk_1E2049F00;
  v20 = v22;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke_3;
  v17[3] = &unk_1E2049F28;
  v18 = v20;
  v12 = v20;
  v13 = (void *)objc_msgSend(v8, "initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v9, v7, v7, v10, v21, v19, v17);

  objc_msgSend(a1, "settingsWithContactStore:cacheSize:schedulerProvider:concurrentCaches:skipContactLookup:", v5, a3, v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)settingsWithContactStore:(id)a3
{
  return (id)objc_msgSend(a1, "settingsWithContactStore:cacheSize:", a3, 0);
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "settingsWithContactStore:cacheSize:skipContactLookup:", a3, a4, 0);
}

+ (id)settingsWithContactStore:(id)a3 schedulerProvider:(id)a4
{
  return (id)objc_msgSend(a1, "settingsWithContactStore:cacheSize:schedulerProvider:", a3, 0, a4);
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5
{
  return (id)objc_msgSend(a1, "settingsWithContactStore:cacheSize:schedulerProvider:skipContactLookup:", a3, a4, a5, 0);
}

id __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSerialSchedulerWithName:", a2);
}

id __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSynchronousSerialSchedulerWithName:", a2);
}

id __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newReaderWriterSchedulerWithName:", a2);
}

@end
