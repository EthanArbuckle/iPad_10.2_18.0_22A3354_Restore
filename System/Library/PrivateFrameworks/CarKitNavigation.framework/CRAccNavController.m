@implementation CRAccNavController

- (CRAccNavController)initWithComponent:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CRAccNavController *v9;
  NSObject *v10;
  void *v11;
  CRAccNavInfoCache *v12;
  void *v13;
  uint64_t v14;
  CRAccNavInfoCache *sentManeuvers;
  CRAccNavInfoCache *v16;
  void *v17;
  uint64_t v18;
  CRAccNavInfoCache *sentLaneGuidances;
  objc_super v21;
  uint8_t buf[4];
  CRAccNavController *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CRAccNavController;
  v9 = -[CRAccNavController init](&v21, sel_init);
  if (v9)
  {
    CarNavLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "configDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v9;
      v24 = 2114;
      v25 = v8;
      v26 = 2114;
      v27 = v7;
      v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_23785A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ init! delegate=%{public}@ component=%{public}@ config=%{public}@", buf, 0x2Au);

    }
    objc_storeStrong((id *)&v9->_component, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    v12 = [CRAccNavInfoCache alloc];
    objc_msgSend(v7, "component");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CRAccNavInfoCache initWithCountLimit:](v12, "initWithCountLimit:", objc_msgSend(v13, "maxCapacity_GuidanceManeuver"));
    sentManeuvers = v9->_sentManeuvers;
    v9->_sentManeuvers = (CRAccNavInfoCache *)v14;

    v16 = [CRAccNavInfoCache alloc];
    objc_msgSend(v7, "component");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CRAccNavInfoCache initWithCountLimit:](v16, "initWithCountLimit:", objc_msgSend(v17, "maxCapacity_LaneGuidance"));
    sentLaneGuidances = v9->_sentLaneGuidances;
    v9->_sentLaneGuidances = (CRAccNavInfoCache *)v18;

    -[CRAccNavController reset](v9, "reset");
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRAccNavController component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p component=%@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)uuid
{
  void *v2;
  void *v3;

  -[CRAccNavController component](self, "component");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)sendInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  CRAccNavController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CarNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_23785A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sendInfo", (uint8_t *)&v7, 0xCu);
  }

  -[CRAccNavController sendManeuvers](self, "sendManeuvers");
  -[CRAccNavController sendLaneGuidances](self, "sendLaneGuidances");
  -[CRAccNavController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController routeGuidance](self, "routeGuidance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendInfo:toComponentUID:", v5, v6);

}

- (void)resendInfo
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  CRAccNavController *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  CarNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CRAccNavController sentManeuvers](self, "sentManeuvers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    -[CRAccNavController sentLaneGuidances](self, "sentLaneGuidances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[CRAccNavController routeGuidance](self, "routeGuidance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("YES");
    *(_DWORD *)buf = 138544130;
    v53 = self;
    if (!v8)
      v9 = CFSTR("NO");
    v54 = 2048;
    v55 = v5;
    v56 = 2048;
    v57 = v7;
    v58 = 2114;
    v59 = v9;
    _os_log_impl(&dword_23785A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resendInfo sentManeuvers.count=%ld sentLaneGuidances.count=%ld routeGuidance=%{public}@", buf, 0x2Au);

  }
  -[CRAccNavController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController component](self, "component");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRAccNavRouteGuidance resetForComponent:](CRAccNavRouteGuidance, "resetForComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendInfo:toComponentUID:", v12, v13);

  -[CRAccNavController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController component](self, "component");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sourceName");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("Unknown");
  -[CRAccNavController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRAccNavRouteGuidance loadingForComponent:sourceName:sourceSupported:](CRAccNavRouteGuidance, "loadingForComponent:sourceName:sourceSupported:", v15, v19, objc_msgSend(v20, "sourceSupported"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController uuid](self, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendInfo:toComponentUID:", v21, v22);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[CRAccNavController sentManeuvers](self, "sentManeuvers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v47 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[CRAccNavController delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRAccNavController uuid](self, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sendInfo:toComponentUID:", v28, v30);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v25);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[CRAccNavController sentLaneGuidances](self, "sentLaneGuidances", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
        -[CRAccNavController delegate](self, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRAccNavController uuid](self, "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "sendInfo:toComponentUID:", v36, v38);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v33);
  }

  -[CRAccNavController delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController routeGuidance](self, "routeGuidance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController uuid](self, "uuid");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sendInfo:toComponentUID:", v40, v41);

}

- (void)reset
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  CRAccNavController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CarNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_23785A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reset", (uint8_t *)&v10, 0xCu);
  }

  -[CRAccNavController setRouteGuidance:](self, "setRouteGuidance:", 0);
  -[CRAccNavController sentManeuvers](self, "sentManeuvers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[CRAccNavController sentLaneGuidances](self, "sentLaneGuidances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[CRAccNavController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRAccNavRouteGuidance resetForComponent:](CRAccNavRouteGuidance, "resetForComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendInfo:toComponentUID:", v8, v9);

}

- (void)delegateUpdatedRouteGuidance
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  CRAccNavController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CarNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_23785A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated routeguidance", (uint8_t *)&v11, 0xCu);
  }

  -[CRAccNavController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeGuidanceProviding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navInfoWithComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController setRouteGuidance:](self, "setRouteGuidance:", v7);

  -[CRAccNavController sendManeuvers](self, "sendManeuvers");
  -[CRAccNavController sendLaneGuidances](self, "sendLaneGuidances");
  -[CRAccNavController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController routeGuidance](self, "routeGuidance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavController uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendInfo:toComponentUID:", v9, v10);

}

- (void)delegateUpdatedManeuvers
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  CRAccNavController *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  CarNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CRAccNavController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maneuversProvidingIndexed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[CRAccNavController routeGuidance](self, "routeGuidance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = self;
    v22 = 2048;
    v23 = v6;
    v24 = 1024;
    v25 = objc_msgSend(v7, "guidanceState");
    _os_log_impl(&dword_23785A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated maneuvers count=%lu guidanceState=%hhu", (uint8_t *)&v20, 0x1Cu);

  }
  -[CRAccNavController routeGuidance](self, "routeGuidance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "guidanceState");

  if (!v9)
  {
    -[CRAccNavController component](self, "component");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceName");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("Unknown");
    -[CRAccNavController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRAccNavRouteGuidance loadingForComponent:sourceName:sourceSupported:](CRAccNavRouteGuidance, "loadingForComponent:sourceName:sourceSupported:", v10, v14, objc_msgSend(v15, "sourceSupported"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController setRouteGuidance:](self, "setRouteGuidance:", v16);

    -[CRAccNavController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController routeGuidance](self, "routeGuidance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController uuid](self, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendInfo:toComponentUID:", v18, v19);

  }
  -[CRAccNavController sendManeuvers](self, "sendManeuvers");
}

- (void)delegateUpdatedManeuver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  CRAccNavController *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRAccNavController sentManeuvers](self, "sentManeuvers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v4, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    CarNavLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = self;
      v17 = 1024;
      v18 = objc_msgSend(v4, "index");
      _os_log_impl(&dword_23785A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated maneuver %d", (uint8_t *)&v15, 0x12u);
    }

    -[CRAccNavController component](self, "component");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navInfoWithComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRAccNavController sentManeuvers](self, "sentManeuvers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v4, "index"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    -[CRAccNavController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController uuid](self, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendInfo:toComponentUID:", v10, v14);

  }
}

- (void)delegateUpdatedLaneGuidances
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  CRAccNavController *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  CarNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CRAccNavController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "laneGuidanceProvidingIndexed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[CRAccNavController routeGuidance](self, "routeGuidance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = self;
    v22 = 2048;
    v23 = v6;
    v24 = 1024;
    v25 = objc_msgSend(v7, "guidanceState");
    _os_log_impl(&dword_23785A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated laneGuidances count=%lu guidanceState=%hhu", (uint8_t *)&v20, 0x1Cu);

  }
  -[CRAccNavController routeGuidance](self, "routeGuidance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "guidanceState");

  if (!v9)
  {
    -[CRAccNavController component](self, "component");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceName");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("Unknown");
    -[CRAccNavController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRAccNavRouteGuidance loadingForComponent:sourceName:sourceSupported:](CRAccNavRouteGuidance, "loadingForComponent:sourceName:sourceSupported:", v10, v14, objc_msgSend(v15, "sourceSupported"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController setRouteGuidance:](self, "setRouteGuidance:", v16);

    -[CRAccNavController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController routeGuidance](self, "routeGuidance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController uuid](self, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendInfo:toComponentUID:", v18, v19);

  }
  -[CRAccNavController sendLaneGuidances](self, "sendLaneGuidances");
}

- (void)delegateUpdatedLaneGuidance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  CRAccNavController *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRAccNavController sentLaneGuidances](self, "sentLaneGuidances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v4, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    CarNavLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = self;
      v17 = 1024;
      v18 = objc_msgSend(v4, "index");
      _os_log_impl(&dword_23785A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated laneGuidance %d", (uint8_t *)&v15, 0x12u);
    }

    -[CRAccNavController component](self, "component");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navInfoWithComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRAccNavController sentLaneGuidances](self, "sentLaneGuidances");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v4, "index"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    -[CRAccNavController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavController uuid](self, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendInfo:toComponentUID:", v10, v14);

  }
}

- (void)sendManeuvers
{
  void *v1;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend(a1, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maneuversProvidingIndexed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3(v4, v5);
  objc_msgSend(a1, "sentManeuvers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_23785A000, v7, v8, "%{public}@ sendManeuvers start source.count=%lu cache=%{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

- (void)sendLaneGuidances
{
  void *v1;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend(a1, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "laneGuidanceProvidingIndexed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3(v4, v5);
  objc_msgSend(a1, "sentLaneGuidances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_23785A000, v7, v8, "%{public}@ sendLaneGuidances done source.count=%lu cache=%{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

- (void)_sendNavInfoFromIndex:(id)a3 fromSource:(id)a4 cache:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint8_t buf[4];
  CRAccNavController *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  v25 = v10;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = v10;
    while (1)
    {
      if (v12 >= objc_msgSend(v9, "countLimit", v25))
        goto LABEL_12;
      objc_msgSend(v9, "objectForKeyedSubscript:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        break;
      objc_msgSend(v8, "objectForKeyedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRAccNavController component](self, "component");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "navInfoWithComponent:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v13);
        -[CRAccNavController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRAccNavController component](self, "component");
        v20 = v11;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sendInfo:toComponentUID:", v18, v22);

        v11 = v20 + 1;
        goto LABEL_8;
      }
LABEL_9:
      ++v12;
      objc_msgSend(v8, "keyAfter:", v13);
      v23 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v23;
      if (!v23)
        goto LABEL_12;
    }
    v15 = (void *)v14;
LABEL_8:

    goto LABEL_9;
  }
  v12 = 0;
  v11 = 0;
  v13 = 0;
LABEL_12:
  CarNavLogging();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544642;
    v28 = self;
    v29 = 2114;
    v30 = v25;
    v31 = 2048;
    v32 = v11;
    v33 = 2048;
    v34 = objc_msgSend(v8, "count");
    v35 = 2048;
    v36 = v12;
    v37 = 2048;
    v38 = objc_msgSend(v9, "count");
    _os_log_debug_impl(&dword_23785A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ sendNavInfo fromIndex=%{public}@ sentIndexes=%lu source=%lu cache=%lu/%lu", buf, 0x3Eu);
  }

}

- (CRAccNavComponent)component
{
  return self->_component;
}

- (CRAccNavControllerDelegate)delegate
{
  return (CRAccNavControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CRAccNavRouteGuidance)routeGuidance
{
  return self->_routeGuidance;
}

- (void)setRouteGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_routeGuidance, a3);
}

- (CRAccNavInfoCache)sentManeuvers
{
  return self->_sentManeuvers;
}

- (void)setSentManeuvers:(id)a3
{
  objc_storeStrong((id *)&self->_sentManeuvers, a3);
}

- (CRAccNavInfoCache)sentLaneGuidances
{
  return self->_sentLaneGuidances;
}

- (void)setSentLaneGuidances:(id)a3
{
  objc_storeStrong((id *)&self->_sentLaneGuidances, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentLaneGuidances, 0);
  objc_storeStrong((id *)&self->_sentManeuvers, 0);
  objc_storeStrong((id *)&self->_routeGuidance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
