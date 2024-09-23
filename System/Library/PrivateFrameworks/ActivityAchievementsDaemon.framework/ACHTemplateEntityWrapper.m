@implementation ACHTemplateEntityWrapper

- (ACHTemplateEntityWrapper)initWithProfile:(id)a3
{
  id v4;
  ACHTemplateEntityWrapper *v5;
  ACHTemplateEntityWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACHTemplateEntityWrapper;
  v5 = -[ACHTemplateEntityWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (void)setSyncedTemplatesObserver:(id)a3
{
  id v4;
  ACHTemplateEntityWrapper *v5;

  v4 = objc_storeWeak((id *)&self->_syncedTemplatesObserver, a3);
  if (a3)
    v5 = self;
  else
    v5 = 0;
  +[ACHTemplateEntity setSyncedTemplatesObserver:](ACHTemplateEntity, "setSyncedTemplatesObserver:", v5);

}

- (BOOL)insertTemplates:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a3;
  -[ACHTemplateEntityWrapper profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = +[ACHTemplateEntity insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:](ACHTemplateEntity, "insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v11, a4, 0, v12, v10, a6);

  return (char)a6;
}

- (BOOL)removeTemplates:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[ACHTemplateEntityWrapper profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[ACHTemplateEntity removeTemplates:profile:error:](ACHTemplateEntity, "removeTemplates:profile:error:", v6, v7, a4);

  return (char)a4;
}

- (id)allTemplatesWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[ACHTemplateEntityWrapper profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACHTemplateEntity allTemplatesWithProfile:error:](ACHTemplateEntity, "allTemplatesWithProfile:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)templateEntityDidReceiveSyncedTemplates:(id)a3 provenance:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  ACHLogSync();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACHTemplateEntityWrapper templateEntityDidReceiveSyncedTemplates:provenance:].cold.1(self, v7);

  -[ACHTemplateEntityWrapper syncedTemplatesObserver](self, "syncedTemplatesObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "templateEntityDidReceiveSyncedTemplates:provenance:", v6, a4);

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHTemplateEntitySyncedTemplatesObserver)syncedTemplatesObserver
{
  return (ACHTemplateEntitySyncedTemplatesObserver *)objc_loadWeakRetained((id *)&self->_syncedTemplatesObserver);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syncedTemplatesObserver);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)templateEntityDidReceiveSyncedTemplates:(void *)a1 provenance:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "syncedTemplatesObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21407B000, a2, OS_LOG_TYPE_DEBUG, "Template Entity Wrapper got notified about newly synced templates, passing that along to syncedTemplatesObserver (%@)", (uint8_t *)&v4, 0xCu);

}

@end
