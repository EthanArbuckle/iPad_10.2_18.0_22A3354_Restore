@implementation _DKNetworkQualityMonitor

- (id)initForInterfaceType:(int64_t)a3 connectionStatusKeyPath:(id)a4 qualityKeyPath:(id)a5 predictedQualityKeyPath:(id)a6 discretionaryInvitedPath:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _DKNetworkQualityMonitor *v17;
  _DKNetworkQualityMonitor *v18;
  uint64_t v19;
  NSMutableDictionary *statusDictionary;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *noiKeyPaths;
  dispatch_queue_t v26;
  OS_dispatch_queue *noiManagerQueue;
  NWNetworkOfInterestManager *v28;
  NWNetworkOfInterestManager *noiManager;
  objc_super v31;
  _QWORD v32[3];
  _QWORD v33[6];

  v33[5] = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)_DKNetworkQualityMonitor;
  v17 = -[_DKMonitor init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_interfaceType = a3;
    v17->_initialized = 0;
    objc_storeStrong((id *)&v17->_statusKeyPath, a4);
    v18->_previousQuality = 0;
    objc_storeStrong((id *)&v18->_qualityKeyPath, a5);
    objc_storeStrong((id *)&v18->_predictedQualityKeyPath, a6);
    objc_storeStrong((id *)&v18->_discretionaryInvitedKeyPath, a7);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    statusDictionary = v18->_statusDictionary;
    v18->_statusDictionary = (NSMutableDictionary *)v19;

    if (a3 == 2)
    {
      v33[0] = CFSTR("predictionsGeneratedAt");
      v33[1] = CFSTR("linkQuality");
      v33[2] = CFSTR("discretionaryTrafficInvited");
      v33[3] = CFSTR("powerCostUL");
      v33[4] = CFSTR("interfaceClass");
      v21 = (void *)MEMORY[0x24BDBCE30];
      v22 = v33;
      v23 = 5;
    }
    else
    {
      v32[0] = CFSTR("predictionsGeneratedAt");
      v32[1] = CFSTR("linkQuality");
      v32[2] = CFSTR("interfaceClass");
      v21 = (void *)MEMORY[0x24BDBCE30];
      v22 = v32;
      v23 = 3;
    }
    objc_msgSend(v21, "arrayWithObjects:count:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    noiKeyPaths = v18->_noiKeyPaths;
    v18->_noiKeyPaths = (NSArray *)v24;

    v26 = dispatch_queue_create("com.apple.duetknowledgecollector.networkQualityMonitorQueue", 0);
    noiManagerQueue = v18->_noiManagerQueue;
    v18->_noiManagerQueue = (OS_dispatch_queue *)v26;

    v28 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x24BEB3620]);
    noiManager = v18->_noiManager;
    v18->_noiManager = v28;

    -[NWNetworkOfInterestManager setQueue:](v18->_noiManager, "setQueue:", v18->_noiManagerQueue);
    -[NWNetworkOfInterestManager setDelegate:](v18->_noiManager, "setDelegate:", v18);
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKNetworkQualityMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKNetworkQualityMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

- (id)predictionTimelineFromNOIPredictions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v7)
  {

    v10 = 0;
LABEL_15:
    objc_msgSend(MEMORY[0x24BE1B0E8], "predictionUnavailable");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_16;
  }
  v8 = v7;
  v27 = v5;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v29;
  do
  {
    v12 = v6;
    v13 = 0;
    v14 = v10;
    do
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(v12);
      v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
      objc_msgSend(v15, "changePointAt");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v9)
      {
        objc_msgSend(v16, "timeIntervalSinceDate:", v14);
        v19 = v18;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v20);

      }
      else
      {
        v9 = v16;
      }
      objc_msgSend(v15, "changePointAt");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "toQuality"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v21);

      v22 = objc_msgSend(v15, "resolutionSeconds");
      ++v13;
      v14 = v10;
    }
    while (v8 != v13);
    v23 = v22;
    v6 = v12;
    v8 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v8);

  if (!v9)
  {
    v5 = v27;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(2 * v23));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  objc_msgSend(v27, "addObject:", v24);

  objc_msgSend(MEMORY[0x24BE1B0E8], "timelineWithValues:forDurations:startingAt:", v4, v27, v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v25;
}

- (void)updatePredictionAsync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_predictedQualityKeyPath)
  {
    -[NWNetworkOfInterest predictions](self->_noi, "predictions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[NWNetworkOfInterest predictions](self->_noi, "predictions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKNetworkQualityMonitor predictionTimelineFromNOIPredictions:](self, "predictionTimelineFromNOIPredictions:", v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1B0E8], "predictionUnavailable");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, self->_predictedQualityKeyPath);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_statusDictionary, "setObject:forKeyedSubscript:", v8, CFSTR("prediction"));
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_statusDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, self->_statusKeyPath);

  }
}

- (void)updateInstantQuality
{
  NWNetworkOfInterest *noi;
  uint64_t v4;
  int64_t v5;
  NSObject *v6;
  _CDContextualKeyPath *qualityKeyPath;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *statusDictionary;
  void *v13;
  int v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  _CDContextualKeyPath *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  noi = self->_noi;
  if (noi)
  {
    v4 = -[NWNetworkOfInterest linkQuality](noi, "linkQuality");
    v5 = v4;
    if (!self->_initialized || v4 != self->_previousQuality)
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        qualityKeyPath = self->_qualityKeyPath;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = qualityKeyPath;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_219056000, v6, OS_LOG_TYPE_DEFAULT, "Network quality for %@ is %@", (uint8_t *)&v20, 0x16u);

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B170], "userContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, self->_qualityKeyPath);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      statusDictionary = self->_statusDictionary;
      objc_msgSend(MEMORY[0x24BE1B1B8], "connectionQualityKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](statusDictionary, "setObject:forKeyedSubscript:", v11, v13);

      LODWORD(v11) = -[NWNetworkOfInterest atHomeScopedNOI](self->_noi, "atHomeScopedNOI");
      v14 = -[NWNetworkOfInterest atWorkScopedNOI](self->_noi, "atWorkScopedNOI");
      if ((_DWORD)v11)
      {
        v15 = self->_statusDictionary;
        objc_msgSend(MEMORY[0x24BE1B1B8], "loiKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = &unk_24DA70FD8;
      }
      else
      {
        if (!v14)
        {
LABEL_11:
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_statusDictionary);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE1B170], "userContext");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, self->_statusKeyPath);

          self->_previousQuality = v5;
          self->_initialized = 1;
          return;
        }
        v15 = self->_statusDictionary;
        objc_msgSend(MEMORY[0x24BE1B1B8], "loiKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = &unk_24DA70FF0;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, v16);

      goto LABEL_11;
    }
  }
}

- (void)updateDiscretionaryTrafficInvited
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *statusDictionary;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWNetworkOfInterest discretionaryTrafficInvited](self->_noi, "discretionaryTrafficInvited"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, self->_discretionaryInvitedKeyPath);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWNetworkOfInterest discretionaryTrafficInvited](self->_noi, "discretionaryTrafficInvited"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  statusDictionary = self->_statusDictionary;
  objc_msgSend(MEMORY[0x24BE1B1B8], "interfaceUpKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](statusDictionary, "setObject:forKeyedSubscript:", v5, v7);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_statusDictionary);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, self->_statusKeyPath);

}

- (void)updatePowerCostDL
{
  void *v3;
  NSMutableDictionary *statusDictionary;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NWNetworkOfInterest powerCostDL](self->_noi, "powerCostDL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  statusDictionary = self->_statusDictionary;
  objc_msgSend(MEMORY[0x24BE1B1B8], "downloadPowerCostKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](statusDictionary, "setObject:forKeyedSubscript:", v3, v5);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_statusDictionary);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, self->_statusKeyPath);

}

- (void)updatePowerCostUL
{
  void *v3;
  NSMutableDictionary *statusDictionary;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NWNetworkOfInterest powerCostUL](self->_noi, "powerCostUL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  statusDictionary = self->_statusDictionary;
  objc_msgSend(MEMORY[0x24BE1B1B8], "uploadPowerCostKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](statusDictionary, "setObject:forKeyedSubscript:", v3, v5);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_statusDictionary);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, self->_statusKeyPath);

}

- (void)updateInterfaceClass
{
  void *v3;
  NSMutableDictionary *statusDictionary;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NWNetworkOfInterest interfaceClass](self->_noi, "interfaceClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  statusDictionary = self->_statusDictionary;
  objc_msgSend(MEMORY[0x24BE1B1B8], "interfaceClassKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](statusDictionary, "setObject:forKeyedSubscript:", v3, v5);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_statusDictionary);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, self->_statusKeyPath);

}

- (void)didStartTrackingNOI:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[4];
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!self->_noi)
  {
    objc_storeStrong((id *)&self->_noi, a3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_noiKeyPaths;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((!objc_msgSend(v11, "isEqualToString:", CFSTR("predictionsGeneratedAt"))
             || self->_predictedQualityKeyPath)
            && (!objc_msgSend(v11, "isEqualToString:", CFSTR("discretionaryTrafficInvited"))
             || self->_discretionaryInvitedKeyPath))
          {
            objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, v11, 1, 0);
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v8);
    }

    -[_DKMonitor queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __48___DKNetworkQualityMonitor_didStartTrackingNOI___block_invoke;
    v17[3] = &unk_24DA66D10;
    v17[4] = self;
    v14 = v17;
    v15 = (void *)os_transaction_create();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_7;
    block[3] = &unk_24DA66E28;
    v23 = v15;
    v24 = v14;
    v16 = v15;
    dispatch_async(v12, block);

  }
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NWNetworkOfInterest *noi;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_noi))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_noiKeyPaths;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((!objc_msgSend(v10, "isEqualToString:", CFSTR("predictionsGeneratedAt"))
             || self->_predictedQualityKeyPath)
            && (!objc_msgSend(v10, "isEqualToString:", CFSTR("discretionaryTrafficInvited"))
             || self->_discretionaryInvitedKeyPath))
          {
            objc_msgSend(v4, "removeObserver:forKeyPath:", self, v10);
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    noi = self->_noi;
    self->_noi = 0;

  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[_DKNetworkQualityMonitor didStopTrackingNOI:](self, "didStopTrackingNOI:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (self->_enabled)
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](self->_noiManager, "trackNOIAnyForInterfaceType:options:", self->_interfaceType, 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _DKNetworkQualityMonitor *v16;
  _QWORD block[4];
  id v18;
  id v19;

  v8 = a3;
  if (objc_msgSend(a4, "isEqual:", self->_noi))
  {
    -[_DKMonitor queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __75___DKNetworkQualityMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v14[3] = &unk_24DA66D60;
    v15 = v8;
    v16 = self;
    v11 = v14;
    v12 = (void *)os_transaction_create();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_7;
    block[3] = &unk_24DA66E28;
    v18 = v12;
    v19 = v11;
    v13 = v12;
    dispatch_async(v9, block);

  }
}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNetworkQualityMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v3, sel_instantMonitorNeedsActivation))
  {
    self->_enabled = 1;
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](self->_noiManager, "trackNOIAnyForInterfaceType:options:", self->_interfaceType, 0);
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNetworkQualityMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKNetworkQualityMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  NWNetworkOfInterestManager *noiManager;
  id v3;

  if (self->_enabled)
  {
    self->_enabled = 0;
    self->_initialized = 0;
    noiManager = self->_noiManager;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", self->_noi, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NWNetworkOfInterestManager stopTrackingNOIs:](noiManager, "stopTrackingNOIs:", v3);

  }
}

- (void)synchronouslyReflectCurrentValue
{
  NSObject *v3;
  _QWORD block[5];

  if (!-[_DKNetworkQualityMonitor initialized](self, "initialized"))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60___DKNetworkQualityMonitor_synchronouslyReflectCurrentValue__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

- (id)loadState
{
  return 0;
}

+ (id)entitlements
{
  return &unk_24DA70E80;
}

- (NSArray)noiKeyPaths
{
  return self->_noiKeyPaths;
}

- (void)setNoiKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_noiKeyPaths, a3);
}

- (OS_dispatch_queue)noiManagerQueue
{
  return self->_noiManagerQueue;
}

- (void)setNoiManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_noiManagerQueue, a3);
}

- (NWNetworkOfInterestManager)noiManager
{
  return self->_noiManager;
}

- (void)setNoiManager:(id)a3
{
  objc_storeStrong((id *)&self->_noiManager, a3);
}

- (NWNetworkOfInterest)noi
{
  return self->_noi;
}

- (void)setNoi:(id)a3
{
  objc_storeStrong((id *)&self->_noi, a3);
}

- (int64_t)previousQuality
{
  return self->_previousQuality;
}

- (void)setPreviousQuality:(int64_t)a3
{
  self->_previousQuality = a3;
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(int64_t)a3
{
  self->_interfaceType = a3;
}

- (_CDContextualKeyPath)qualityKeyPath
{
  return self->_qualityKeyPath;
}

- (void)setQualityKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_qualityKeyPath, a3);
}

- (_CDContextualKeyPath)predictedQualityKeyPath
{
  return self->_predictedQualityKeyPath;
}

- (void)setPredictedQualityKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_predictedQualityKeyPath, a3);
}

- (_CDContextualKeyPath)discretionaryInvitedKeyPath
{
  return self->_discretionaryInvitedKeyPath;
}

- (void)setDiscretionaryInvitedKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_discretionaryInvitedKeyPath, a3);
}

- (_CDContextualKeyPath)statusKeyPath
{
  return self->_statusKeyPath;
}

- (void)setStatusKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_statusKeyPath, a3);
}

- (NSMutableDictionary)statusDictionary
{
  return self->_statusDictionary;
}

- (void)setStatusDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_statusDictionary, a3);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDictionary, 0);
  objc_storeStrong((id *)&self->_statusKeyPath, 0);
  objc_storeStrong((id *)&self->_discretionaryInvitedKeyPath, 0);
  objc_storeStrong((id *)&self->_predictedQualityKeyPath, 0);
  objc_storeStrong((id *)&self->_qualityKeyPath, 0);
  objc_storeStrong((id *)&self->_noi, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);
  objc_storeStrong((id *)&self->_noiManagerQueue, 0);
  objc_storeStrong((id *)&self->_noiKeyPaths, 0);
}

@end
