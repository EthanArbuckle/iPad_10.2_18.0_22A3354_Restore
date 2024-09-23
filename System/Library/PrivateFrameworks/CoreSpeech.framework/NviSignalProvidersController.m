@implementation NviSignalProvidersController

- (NviSignalProvidersController)initWithAssetsProvider:(id)a3 dataSourceMap:(id)a4 signalProviderToDataSourceMap:(id)a5
{
  id v9;
  id v10;
  id v11;
  NviSignalProvidersController *v12;
  id *p_isa;
  NSObject *v14;
  NviSignalProvidersController *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NviSignalProvidersController;
  v12 = -[NviSignalProvidersController init](&v17, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12
    && (objc_storeStrong((id *)&v12->_assetsProvider, a3),
        objc_storeStrong(p_isa + 2, a4),
        !objc_msgSend(p_isa, "_setupSignalProviders:", v11)))
  {
    v15 = 0;
  }
  else
  {
    v14 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[NviSignalProvidersController initWithAssetsProvider:dataSourceMap:signalProviderToDataSourceMap:]";
      v20 = 2048;
      v21 = p_isa;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s %p created", buf, 0x16u);
    }
    v15 = p_isa;
  }

  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  NviSignalProvidersController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[NviSignalProvidersController dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s %p dealloced", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)NviSignalProvidersController;
  -[NviSignalProvidersController dealloc](&v4, sel_dealloc);
}

- (BOOL)_setupSignalProviders:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *sigProvidersMap;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSDictionary *dataSrcMap;
  void *v14;
  void *v15;
  NviDirectionalitySignalProvider *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSMapTable *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  sigProvidersMap = self->_sigProvidersMap;
  self->_sigProvidersMap = v5;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        dataSrcMap = self->_dataSrcMap;
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](dataSrcMap, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", objc_msgSend(v12, "unsignedIntegerValue"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NviSignalProvidersController.m"), 72, CFSTR("No DataSource found for SignalType: %@"), v19);

        }
        if (objc_msgSend(v12, "unsignedIntegerValue") != 4)
        {
          v23 = (void *)NviLogContextFacility;
          if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
          {
            v24 = v23;
            +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", objc_msgSend(v12, "unsignedIntegerValue"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v36 = "-[NviSignalProvidersController _setupSignalProviders:]";
            v37 = 2112;
            v38 = v25;
            _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s %@ not supported yet.", buf, 0x16u);

          }
LABEL_19:
          v26 = (void *)NviLogContextFacility;
          if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v26;
            +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", objc_msgSend(v12, "unsignedIntegerValue"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v36 = "-[NviSignalProvidersController _setupSignalProviders:]";
            v37 = 2112;
            v38 = v28;
            _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "%s Failed to create: %@", buf, 0x16u);

          }
          v22 = 0;
          goto LABEL_22;
        }
        v16 = -[NviDirectionalitySignalProvider initWithDataSource:assetsProvider:]([NviDirectionalitySignalProvider alloc], "initWithDataSource:assetsProvider:", v15, self->_assetsProvider);
        v17 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "-[NviSignalProvidersController _setupSignalProviders:]";
          v37 = 2048;
          v38 = v16;
          _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s sp=%p", buf, 0x16u);
        }
        if (!v16)
          goto LABEL_19;
        -[NSMapTable setObject:forKeyedSubscript:](self->_sigProvidersMap, "setObject:forKeyedSubscript:", v16, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v9)
        continue;
      break;
    }
  }

  v20 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_sigProvidersMap;
    *(_DWORD *)buf = 136315394;
    v36 = "-[NviSignalProvidersController _setupSignalProviders:]";
    v37 = 2112;
    v38 = v21;
    _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s SigPrvdrs: %@", buf, 0x16u);
  }
  v22 = 1;
LABEL_22:

  return v22;
}

- (void)_startDataSourcesWithContext:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  intptr_t v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  double v20;
  __int128 v21;
  NSHashTable *obj;
  id v23;
  _QWORD v24[5];
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  double v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v4 = dispatch_group_create();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_currActiveDataSourceTypes;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v27;
    *(_QWORD *)&v6 = 136315394;
    v21 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_dataSrcMap, "objectForKeyedSubscript:", v10, v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v21;
          v31 = "-[NviSignalProvidersController _startDataSourcesWithContext:]";
          v32 = 2112;
          v33 = *(double *)&v11;
          _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Starting datasrc: %@", buf, 0x16u);
        }
        dispatch_group_enter(v4);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __61__NviSignalProvidersController__startDataSourcesWithContext___block_invoke;
        v24[3] = &unk_1E7C251F0;
        v24[4] = v10;
        v25 = v4;
        objc_msgSend(v11, "startWithNviContext:didStartHandler:", v23, v24);

      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v7);
  }

  v13 = dispatch_time(0, 2000000000);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_group_wait(v4, v13);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = NviLogContextFacility;
  v18 = os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v18)
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[NviSignalProvidersController _startDataSourcesWithContext:]";
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s WARN: DataSources Start timedout. timeout=2secs", buf, 0xCu);
    }
  }
  else if (v18)
  {
    v19 = v17;
    objc_msgSend(v16, "timeIntervalSinceDate:", v14);
    *(_DWORD *)buf = 136315394;
    v31 = "-[NviSignalProvidersController _startDataSourcesWithContext:]";
    v32 = 2048;
    v33 = v20 * 1000.0;
    _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s >>> All DataSources Started within timeout of 2secs: timeTaken=%f ms", buf, 0x16u);

  }
}

- (void)_startSignalProvidersWithContext:(id)a3
{
  void *v4;
  NSHashTable *v5;
  NSHashTable *currActiveSigProvTypes;
  NSHashTable *v7;
  NSHashTable *currActiveDataSourceTypes;
  NSObject *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  dispatch_time_t v20;
  void *v21;
  intptr_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  double v27;
  __int128 v28;
  id v29;
  _QWORD v30[6];
  id v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  double v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  -[NviAssetsProvider signalProvidersMapForContext:](self->_assetsProvider, "signalProvidersMapForContext:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
  v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  currActiveSigProvTypes = self->_currActiveSigProvTypes;
  self->_currActiveSigProvTypes = v5;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
  v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  currActiveDataSourceTypes = self->_currActiveDataSourceTypes;
  self->_currActiveDataSourceTypes = v7;

  v9 = dispatch_group_create();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v34;
    *(_QWORD *)&v12 = 136315394;
    v28 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", v16, v28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v28;
          v38 = "-[NviSignalProvidersController _startSignalProvidersWithContext:]";
          v39 = 2112;
          v40 = *(double *)&v17;
          _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Starting signal provider: %@", buf, 0x16u);
        }
        dispatch_group_enter(v9);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __65__NviSignalProvidersController__startSignalProvidersWithContext___block_invoke;
        v30[3] = &unk_1E7C25218;
        v30[4] = v16;
        v30[5] = self;
        v19 = v10;
        v31 = v19;
        v32 = v9;
        objc_msgSend(v17, "startWithNviContext:didStartHandler:", v29, v30);

      }
      v13 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v13);
  }

  v20 = dispatch_time(0, 2000000000);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = dispatch_group_wait(v9, v20);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = NviLogContextFacility;
  v25 = os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v25)
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[NviSignalProvidersController _startSignalProvidersWithContext:]";
      _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s WARN: SignalProviders timedout didStart. timeout=2secs", buf, 0xCu);
    }
  }
  else if (v25)
  {
    v26 = v24;
    objc_msgSend(v23, "timeIntervalSinceDate:", v21);
    *(_DWORD *)buf = 136315394;
    v38 = "-[NviSignalProvidersController _startSignalProvidersWithContext:]";
    v39 = 2048;
    v40 = v27 * 1000.0;
    _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_DEFAULT, "%s >>> All SignalProviders didStart within timeout of 2secs: timeTaken=%f ms", buf, 0x16u);

  }
}

- (void)startWithNviContext:(id)a3
{
  id v4;

  v4 = a3;
  -[NviSignalProvidersController _startSignalProvidersWithContext:](self, "_startSignalProvidersWithContext:", v4);
  -[NviSignalProvidersController _startDataSourcesWithContext:](self, "_startDataSourcesWithContext:", v4);

}

- (void)reset
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_sigProvidersMap;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reset");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_stopDataSources
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  intptr_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  double v18;
  NSHashTable *obj;
  _QWORD v20[5];
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  double v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_currActiveDataSourceTypes;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_dataSrcMap, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v3);
        v20[0] = v7;
        v20[1] = 3221225472;
        v20[2] = __48__NviSignalProvidersController__stopDataSources__block_invoke;
        v20[3] = &unk_1E7C251F0;
        v20[4] = v9;
        v21 = v3;
        objc_msgSend(v10, "stopWithDidStopHandler:", v20);

      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v5);
  }

  v11 = dispatch_time(0, 2000000000);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_group_wait(v3, v11);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = NviLogContextFacility;
  v16 = os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[NviSignalProvidersController _stopDataSources]";
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s WARN: DataSources timedout stopping. timeout=2secs", buf, 0xCu);
    }
  }
  else if (v16)
  {
    v17 = v15;
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    *(_DWORD *)buf = 136315394;
    v27 = "-[NviSignalProvidersController _stopDataSources]";
    v28 = 2048;
    v29 = v18 * 1000.0;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s >>> All DataSources Stopped within timeout of 2secs: timeTaken=%f ms", buf, 0x16u);

  }
}

- (void)_stopCurrentlyRunningSignalProviders
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  intptr_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  double v18;
  NSHashTable *obj;
  _QWORD v20[5];
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  double v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_currActiveSigProvTypes;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v3);
        v20[0] = v7;
        v20[1] = 3221225472;
        v20[2] = __68__NviSignalProvidersController__stopCurrentlyRunningSignalProviders__block_invoke;
        v20[3] = &unk_1E7C251F0;
        v20[4] = v9;
        v21 = v3;
        objc_msgSend(v10, "stopWithDidStopHandler:", v20);

      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v5);
  }

  v11 = dispatch_time(0, 2000000000);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_group_wait(v3, v11);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = NviLogContextFacility;
  v16 = os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[NviSignalProvidersController _stopCurrentlyRunningSignalProviders]";
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s WARN: SignalProviders timedout didStop. timeout=2secs", buf, 0xCu);
    }
  }
  else if (v16)
  {
    v17 = v15;
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    *(_DWORD *)buf = 136315394;
    v27 = "-[NviSignalProvidersController _stopCurrentlyRunningSignalProviders]";
    v28 = 2048;
    v29 = v18 * 1000.0;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s >>> All SignalProviders didStop within timeout of 2secs: timeTaken=%f ms", buf, 0x16u);

  }
}

- (void)stop
{
  -[NviSignalProvidersController _stopDataSources](self, "_stopDataSources");
  -[NviSignalProvidersController _stopCurrentlyRunningSignalProviders](self, "_stopCurrentlyRunningSignalProviders");
}

- (void)_iterateSignalMask:(unint64_t)a3 withHandler:(id)a4
{
  unsigned int v4;
  void (**v6)(id, void *);
  uint64_t v7;
  __int128 v8;
  NSMapTable *sigProvidersMap;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v7 = 0;
  *(_QWORD *)&v8 = 136315394;
  v15 = v8;
  do
  {
    sigProvidersMap = self->_sigProvidersMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (1 << v7) & v4, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKeyedSubscript:](sigProvidersMap, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v6[2](v6, v11);
    }
    else
    {
      v12 = (void *)NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", (1 << v7) & v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v15;
        v17 = "-[NviSignalProvidersController _iterateSignalMask:withHandler:]";
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s WARN: Cannot find SignalProvider for %@. Skipping", buf, 0x16u);

      }
    }

    ++v7;
  }
  while (v7 != 5);

}

- (void)registerSignalProviderDelegate:(id)a3 forSignalTypes:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__NviSignalProvidersController_registerSignalProviderDelegate_forSignalTypes___block_invoke;
  v8[3] = &unk_1E7C25240;
  v9 = v6;
  v7 = v6;
  -[NviSignalProvidersController _iterateSignalMask:withHandler:](self, "_iterateSignalMask:withHandler:", a4, v8);

}

- (void)unregisterSignalProviderDelegate:(id)a3 forSignalType:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__NviSignalProvidersController_unregisterSignalProviderDelegate_forSignalType___block_invoke;
  v8[3] = &unk_1E7C25240;
  v9 = v6;
  v7 = v6;
  -[NviSignalProvidersController _iterateSignalMask:withHandler:](self, "_iterateSignalMask:withHandler:", a4, v8);

}

- (void)registerSignalProviderDelegateForAllSignalTypes:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_sigProvidersMap;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addDelegate:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)unregisterSignalProviderDelegateForAllSignalTypes:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_sigProvidersMap;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKeyedSubscript:](self->_sigProvidersMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeDelegate:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NviAssetsProvider)assetsProvider
{
  return self->_assetsProvider;
}

- (void)setAssetsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_assetsProvider, a3);
}

- (NSDictionary)dataSrcMap
{
  return self->_dataSrcMap;
}

- (void)setDataSrcMap:(id)a3
{
  objc_storeStrong((id *)&self->_dataSrcMap, a3);
}

- (NSMapTable)sigProvidersMap
{
  return self->_sigProvidersMap;
}

- (void)setSigProvidersMap:(id)a3
{
  objc_storeStrong((id *)&self->_sigProvidersMap, a3);
}

- (NSHashTable)currActiveSigProvTypes
{
  return self->_currActiveSigProvTypes;
}

- (void)setCurrActiveSigProvTypes:(id)a3
{
  objc_storeStrong((id *)&self->_currActiveSigProvTypes, a3);
}

- (NSHashTable)currActiveDataSourceTypes
{
  return self->_currActiveDataSourceTypes;
}

- (void)setCurrActiveDataSourceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_currActiveDataSourceTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currActiveDataSourceTypes, 0);
  objc_storeStrong((id *)&self->_currActiveSigProvTypes, 0);
  objc_storeStrong((id *)&self->_sigProvidersMap, 0);
  objc_storeStrong((id *)&self->_dataSrcMap, 0);
  objc_storeStrong((id *)&self->_assetsProvider, 0);
}

uint64_t __79__NviSignalProvidersController_unregisterSignalProviderDelegate_forSignalType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeDelegate:", *(_QWORD *)(a1 + 32));
}

uint64_t __78__NviSignalProvidersController_registerSignalProviderDelegate_forSignalTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addDelegate:", *(_QWORD *)(a1 + 32));
}

void __68__NviSignalProvidersController__stopCurrentlyRunningSignalProviders__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", objc_msgSend(v7, "unsignedIntegerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[NviSignalProvidersController _stopCurrentlyRunningSignalProviders]_block_invoke";
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to stop %@: Err=%@", (uint8_t *)&v10, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __48__NviSignalProvidersController__stopDataSources__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      +[NviUtils strRepForNviDataSourceType:](NviUtils, "strRepForNviDataSourceType:", objc_msgSend(v7, "unsignedIntegerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[NviSignalProvidersController _stopDataSources]_block_invoke";
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to start %@. Err=%@", (uint8_t *)&v10, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __65__NviSignalProvidersController__startSignalProvidersWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v8 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", objc_msgSend(v9, "unsignedIntegerValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[NviSignalProvidersController _startSignalProvidersWithContext:]_block_invoke";
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to start %@: Err=%@", (uint8_t *)&v12, 0x20u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", *(_QWORD *)(a1 + 32));
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __61__NviSignalProvidersController__startDataSourcesWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      +[NviUtils strRepForNviDataSourceType:](NviUtils, "strRepForNviDataSourceType:", objc_msgSend(v7, "unsignedIntegerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[NviSignalProvidersController _startDataSourcesWithContext:]_block_invoke";
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to start %@. Err=%@", (uint8_t *)&v10, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && InitNviLogging_once != -1)
    dispatch_once(&InitNviLogging_once, &__block_literal_global_15970);
}

@end
