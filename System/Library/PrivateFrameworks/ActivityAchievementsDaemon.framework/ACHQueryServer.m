@implementation ACHQueryServer

- (ACHQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ACHQueryServer *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ACHQueryServer;
  v14 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v20, sel_initWithUUID_configuration_client_delegate_, v10, v11, v12, v13);
  if (v14)
  {
    objc_initWeak(&location, v14);
    objc_msgSend(v12, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __61__ACHQueryServer_initWithUUID_configuration_client_delegate___block_invoke;
    v17[3] = &unk_24D13C570;
    objc_copyWeak(&v18, &location);
    ACHRequestProfileExtensionWithError(v15, v17, 0);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __61__ACHQueryServer_initWithUUID_configuration_client_delegate___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "achievementStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(WeakRetained + 25, v4);

  }
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (id)_newSystemEnabledError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = CFSTR("New achievements system is enabled. ACHQuery isn't functional. Use the new system's query mechanisms instead.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements.Query"), 42, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_queue_start
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[8];
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (ACHShouldUseNewAwardsSystem())
  {
    -[ACHQueryServer _clientProxy](self, "_clientProxy");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[ACHQueryServer _newSystemEnabledError](self, "_newSystemEnabledError");
    -[HDQueryServer queryUUID](self, "queryUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "client_deliverError:forQuery:", v3, v4);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ACHQueryServer;
    -[HDQueryServer _queue_start](&v17, sel__queue_start);
    ACHLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Query server starting", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)&self->_achievementStore);
      objc_msgSend(v7, "addObserver:", self);

      v8 = objc_loadWeakRetained((id *)&self->_achievementStore);
      objc_msgSend(v8, "loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:", 0);

    }
    else
    {
      ACHLogXPC();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Query server error: No achievement store available. Delivering error to client.", buf, 2u);
      }

      v10 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0FC8];
      v19[0] = CFSTR("Achievement store was nil; query invalid.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements.Query"), 22, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[ACHQueryServer _clientProxy](self, "_clientProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryServer queryUUID](self, "queryUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "client_deliverError:forQuery:", v12, v14);

    }
  }
}

- (void)_queue_stop
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  objc_super v7;

  if (ACHShouldUseNewAwardsSystem())
  {
    -[ACHQueryServer _clientProxy](self, "_clientProxy");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[ACHQueryServer _newSystemEnabledError](self, "_newSystemEnabledError");
    -[HDQueryServer queryUUID](self, "queryUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "client_deliverError:forQuery:", v3, v4);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ACHQueryServer;
    -[HDQueryServer _queue_stop](&v7, sel__queue_stop);
    WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
    objc_msgSend(WeakRetained, "removeObserver:", self);

  }
}

- (void)achievementStoreDidFinishInitialFetch:(id)a3
{
  ACHAchievementStoring **p_achievementStore;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_achievementStore = &self->_achievementStore;
  WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
  objc_msgSend(WeakRetained, "allAchievements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ACHLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Query server delivered [%lu] achievements", (uint8_t *)&v10, 0xCu);
  }

  -[ACHQueryServer _clientProxy](self, "_clientProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "client_achievementsDidFinishInitialFetch:", v6);

  v9 = objc_loadWeakRetained((id *)p_achievementStore);
  objc_msgSend(v9, "recalculateProgressForAllAchievements");

}

- (void)achievementStore:(id)a3 didAddAchievements:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  ACHLogXPC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Query server delivering [%lu] new achievements", (uint8_t *)&v8, 0xCu);
  }

  -[ACHQueryServer _clientProxy](self, "_clientProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client_deliverNewAchievements:", v5);

}

- (void)achievementStore:(id)a3 didUpdateAchievements:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  ACHLogXPC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Query server delivering [%lu] updated achievements", (uint8_t *)&v8, 0xCu);
  }

  -[ACHQueryServer _clientProxy](self, "_clientProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client_deliverUpdatedAchievements:", v5);

}

- (void)achievementStore:(id)a3 didRemoveAchievements:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  ACHLogXPC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Query server delivering [%lu] removed achievements", (uint8_t *)&v8, 0xCu);
  }

  -[ACHQueryServer _clientProxy](self, "_clientProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client_deliverRemovedAchievements:", v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_achievementStore);
}

@end
