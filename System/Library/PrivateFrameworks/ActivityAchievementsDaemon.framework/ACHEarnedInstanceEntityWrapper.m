@implementation ACHEarnedInstanceEntityWrapper

- (ACHEarnedInstanceEntityWrapper)initWithProfile:(id)a3
{
  id v4;
  ACHEarnedInstanceEntityWrapper *v5;
  ACHEarnedInstanceEntityWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACHEarnedInstanceEntityWrapper;
  v5 = -[ACHEarnedInstanceEntityWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (void)setSyncedEarnedInstancesObserver:(id)a3
{
  id v4;
  ACHEarnedInstanceEntityWrapper *v5;

  v4 = objc_storeWeak((id *)&self->_syncedEarnedInstancesObserver, a3);
  if (a3)
    v5 = self;
  else
    v5 = 0;
  +[ACHEarnedInstanceEntity setSyncedEarnedInstancesObserver:](ACHEarnedInstanceEntity, "setSyncedEarnedInstancesObserver:", v5);

}

- (id)insertEarnedInstances:(id)a3 provenance:(int64_t)a4 databaseContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a3;
  -[ACHEarnedInstanceEntityWrapper profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACHEarnedInstanceEntity insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:](ACHEarnedInstanceEntity, "insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v11, a4, 0, v12, v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[ACHEarnedInstanceEntityWrapper profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[ACHEarnedInstanceEntity removeEarnedInstances:profile:error:](ACHEarnedInstanceEntity, "removeEarnedInstances:profile:error:", v6, v7, a4);

  return (char)a4;
}

- (id)allEarnedInstancesWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[ACHEarnedInstanceEntityWrapper profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACHEarnedInstanceEntity allEarnedInstancesWithProfile:error:](ACHEarnedInstanceEntity, "allEarnedInstancesWithProfile:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)earnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[ACHEarnedInstanceEntityWrapper profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACHEarnedInstanceEntity earnedInstancesForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "earnedInstancesForTemplateUniqueName:profile:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)earnedInstancesForDateComponents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[ACHEarnedInstanceEntityWrapper profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACHEarnedInstanceEntity earnedInstancesForDateComponents:profile:error:](ACHEarnedInstanceEntity, "earnedInstancesForDateComponents:profile:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)removeEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[ACHEarnedInstanceEntityWrapper profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[ACHEarnedInstanceEntity removeEarnedInstancesForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "removeEarnedInstancesForTemplateUniqueName:profile:error:", v6, v7, a4);

  return (char)a4;
}

- (BOOL)removeAllEarnedInstancesWithError:(id *)a3
{
  void *v4;

  -[ACHEarnedInstanceEntityWrapper profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[ACHEarnedInstanceEntity removeAllEarnedInstancesWithProfile:error:](ACHEarnedInstanceEntity, "removeAllEarnedInstancesWithProfile:error:", v4, a3);

  return (char)a3;
}

- (BOOL)earnedInstanceEntityDidReceiveSyncedEarnedInstances:(id)a3 provenance:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;

  v6 = a3;
  ACHLogSync();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACHEarnedInstanceEntityWrapper earnedInstanceEntityDidReceiveSyncedEarnedInstances:provenance:].cold.1(self, v7);

  -[ACHEarnedInstanceEntityWrapper syncedEarnedInstancesObserver](self, "syncedEarnedInstancesObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "earnedInstanceEntityDidReceiveSyncedEarnedInstances:provenance:", v6, a4);

  return v9;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHEarnedInstanceEntitySyncedEarnedInstancesObserver)syncedEarnedInstancesObserver
{
  return (ACHEarnedInstanceEntitySyncedEarnedInstancesObserver *)objc_loadWeakRetained((id *)&self->_syncedEarnedInstancesObserver);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syncedEarnedInstancesObserver);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)earnedInstanceEntityDidReceiveSyncedEarnedInstances:(void *)a1 provenance:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "syncedEarnedInstancesObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21407B000, a2, OS_LOG_TYPE_DEBUG, "Earned Instance Entity Wrapper got notified about newly synced earned instances, passing that along to syncedEarnedInstancesObserver (%@)", (uint8_t *)&v4, 0xCu);

}

@end
