@implementation CPSNavigator

- (CPSNavigator)initWithIdentifier:(id)a3 currentSession:(id)a4 forTrip:(id)a5
{
  CPSNavigator *v5;
  NSHashTable *v6;
  NSHashTable *displayDelegates;
  CPSNavigator *v9;
  CPSNavigator *v12;
  objc_super v13;
  id v14;
  id v15;
  id location[2];
  CPSNavigator *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v5 = v17;
  v17 = 0;
  v13.receiver = v5;
  v13.super_class = (Class)CPSNavigator;
  v12 = -[CPSNavigator init](&v13, sel_init);
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    v6 = (NSHashTable *)(id)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    displayDelegates = v17->_displayDelegates;
    v17->_displayDelegates = v6;

    objc_storeStrong((id *)&v17->_currentSession, v15);
    objc_storeStrong((id *)&v17->_trip, v14);
  }
  v9 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (void)setAppSupportsInstrumentCluster:(BOOL)a3
{
  CARSession *currentSession;
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  SEL v8;
  CPSNavigator *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8 = a2;
  v7 = a3;
  if (self->_appSupportsInstrumentCluster != a3)
  {
    v9->_appSupportsInstrumentCluster = v7;
    if (v9->_appSupportsInstrumentCluster)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("maps:/car/instrumentcluster"));
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("maps:/car/instrumentcluster/map"));
      currentSession = v9->_currentSession;
      v10[0] = v6;
      v10[1] = v5;
      v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
      -[CARSession suggestUI:](currentSession, "suggestUI:");

      objc_storeStrong((id *)&v5, 0);
      objc_storeStrong((id *)&v6, 0);
    }
  }
}

- (void)invalidate
{
  NSHashTable *v2;

  -[CPSNavigator setMetadataDelegate:](self, "setMetadataDelegate:", 0);
  v2 = -[CPSNavigator displayDelegates](self, "displayDelegates");
  -[NSHashTable removeAllObjects](v2, "removeAllObjects");

}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CPSNavigator *v4;

  v4 = self;
  v3 = a2;
  -[CPSNavigator invalidate](self, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)CPSNavigator;
  -[CPSNavigator dealloc](&v2, sel_dealloc);
}

- (void)setCompleted:(BOOL)a3
{
  if (self->_completed != a3)
    self->_completed = a3;
}

- (void)addDisplayDelegate:(id)a3
{
  NSHashTable *v3;
  id location[2];
  CPSNavigator *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSNavigator displayDelegates](v5, "displayDelegates");
  -[NSHashTable addObject:](v3, "addObject:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)removeDisplayDelegate:(id)a3
{
  NSHashTable *v3;
  id location[2];
  CPSNavigator *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSNavigator displayDelegates](v5, "displayDelegates");
  -[NSHashTable removeObject:](v3, "removeObject:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setCurrentLaneGuidance:(id)a3
{
  CPSNavigationMetadataDelegate *v3;
  id location[2];
  CPSNavigator *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSNavigator metadataDelegate](v5, "metadataDelegate");
  -[CPSNavigationMetadataDelegate setCurrentLaneGuidance:](v3, "setCurrentLaneGuidance:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)clearCurrentLaneGuidance
{
  CPSNavigationMetadataDelegate *v2;

  v2 = -[CPSNavigator metadataDelegate](self, "metadataDelegate");
  -[CPSNavigationMetadataDelegate setCurrentLaneGuidance:](v2, "setCurrentLaneGuidance:", 0);

}

- (void)setManeuverState:(int64_t)a3
{
  CPSNavigationMetadataDelegate *v3;

  v3 = -[CPSNavigator metadataDelegate](self, "metadataDelegate");
  -[CPSNavigationMetadataDelegate setManeuverState:](v3, "setManeuverState:", a3);

}

- (void)setCurrentRoadNameVariants:(id)a3
{
  CPSNavigationMetadataDelegate *v3;
  id location[2];
  CPSNavigator *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSNavigator metadataDelegate](v5, "metadataDelegate");
  -[CPSNavigationMetadataDelegate setCurrentRoadNameVariants:](v3, "setCurrentRoadNameVariants:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)addManeuvers:(id)a3
{
  CPSNavigationMetadataDelegate *v3;
  id location[2];
  CPSNavigator *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSNavigator metadataDelegate](v5, "metadataDelegate");
  -[CPSNavigationMetadataDelegate addManeuvers:](v3, "addManeuvers:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)addLaneGuidances:(id)a3
{
  CPSNavigationMetadataDelegate *v3;
  id location[2];
  CPSNavigator *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSNavigator metadataDelegate](v5, "metadataDelegate");
  -[CPSNavigationMetadataDelegate addLaneGuidances:](v3, "addLaneGuidances:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setSendsNavigationMetadata:(BOOL)a3
{
  BOOL v3;
  CPSNavigationMetadataDelegate *v4;

  self->_sendsNavigationMetadata = a3;
  v3 = a3;
  v4 = -[CPSNavigator metadataDelegate](self, "metadataDelegate");
  -[CPSNavigationMetadataDelegate setSendsNavigationMetadata:](v4, "setSendsNavigationMetadata:", v3);

}

- (void)setDestinationNameVariants:(id)a3
{
  id v3;
  CPSNavigationMetadataDelegate *v4;
  id location[2];
  CPSNavigator *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = -[CPSNavigator metadataDelegate](v6, "metadataDelegate");
  -[CPSNavigationMetadataDelegate setDestinationNameVariants:](v4, "setDestinationNameVariants:", v3);

  objc_storeStrong(location, 0);
}

- (void)pauseTripForReason:(unint64_t)a3 description:(id)a4 turnCardColor:(id)a5
{
  NSObject *queue;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  CPSNavigator *v12;
  id v13;
  id v14[2];
  id v15;
  id location;
  void *v17;
  SEL v18;
  CPSNavigator *v19;

  v19 = self;
  v18 = a2;
  v17 = (void *)a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  queue = MEMORY[0x24BDAC9B8];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __61__CPSNavigator_pauseTripForReason_description_turnCardColor___block_invoke;
  v11 = &unk_24E2704C0;
  v12 = v19;
  v14[1] = v17;
  v13 = location;
  v14[0] = v15;
  dispatch_sync(queue, &v7);

  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
}

void __61__CPSNavigator_pauseTripForReason_description_turnCardColor___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  id obj;
  uint64_t v8;
  _QWORD __b[8];
  id v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = a1;
  v11 = a1;
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "metadataDelegate");
  objc_msgSend(v5, "pauseTripForReason:", *(_QWORD *)(a1 + 56));

  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(*(id *)(a1 + 32), "displayDelegates");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v8)
  {
    v2 = *(_QWORD *)__b[2];
    v3 = 0;
    v4 = v8;
    while (1)
    {
      v1 = v3;
      if (*(_QWORD *)__b[2] != v2)
        objc_enumerationMutation(obj);
      v10 = *(id *)(__b[1] + 8 * v3);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "navigator:pausedTripForReason:description:usingColor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      ++v3;
      if (v1 + 1 >= v4)
      {
        v3 = 0;
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v4)
          break;
      }
    }
  }

}

- (void)startRerouting
{
  CPSNavigationMetadataDelegate *v2;

  v2 = -[CPSNavigator metadataDelegate](self, "metadataDelegate");
  -[CPSNavigationMetadataDelegate startRerouting](v2, "startRerouting");

}

- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4
{
  CPSNavigationMetadataDelegate *v4;
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id location;
  unsigned __int8 v15;
  SEL v16;
  CPSNavigator *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = -[CPSNavigator metadataDelegate](v17, "metadataDelegate");
  -[CPSNavigationMetadataDelegate routeChangedWithReason:routeInfo:](v4, "routeChangedWithReason:routeInfo:", v15, location);

  objc_initWeak(&v13, v17);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __49__CPSNavigator_routeChangedWithReason_routeInfo___block_invoke;
  v10 = &unk_24E2704E8;
  objc_copyWeak(&v12, &v13);
  v11 = location;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(&location, 0);
}

void __49__CPSNavigator_routeChangedWithReason_routeInfo___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11[3];

  v11[2] = a1;
  v11[1] = a1;
  v11[0] = objc_loadWeakRetained(a1 + 5);
  v1 = v11[0];
  v3 = (id)objc_msgSend(a1[4], "routeGuidance");
  v2 = (id)objc_msgSend(v3, "tripTravelEstimates");
  objc_msgSend(v1, "_sync_displayUpdateTripTravelEstimates:");

  v5 = v11[0];
  v10 = (id)objc_msgSend(a1[4], "routeGuidance");
  v9 = (id)objc_msgSend(v10, "maneuverTravelEstimates");
  v8 = (id)objc_msgSend(a1[4], "routeGuidance");
  v7 = (id)objc_msgSend(v8, "currentManeuvers");
  v6 = (id)objc_msgSend(v7, "firstObject");
  objc_msgSend(v5, "_sync_displayUpdateManeuverTravelEstimates:forManeuver:", v9);

  objc_storeStrong(v11, 0);
}

- (void)finishTrip
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  CPSNavigator *v9;

  v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __26__CPSNavigator_finishTrip__block_invoke;
  v7 = &unk_24E26F1B8;
  v8[0] = v9;
  dispatch_sync(queue, &v3);

  objc_storeStrong(v8, 0);
}

void __26__CPSNavigator_finishTrip__block_invoke(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  id obj;
  uint64_t v7;
  id v8;
  _QWORD __b[8];
  id v11;
  id location[3];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = a1;
  v8 = (id)objc_msgSend(a1[4], "metadataDelegate");
  objc_msgSend(v8, "finishTrip");

  if ((*((_BYTE *)a1[4] + 8) & 1) != 0)
    objc_msgSend(*((id *)a1[4] + 6), "suggestUI:", MEMORY[0x24BDBD1A8]);
  v5 = (id)objc_msgSend(a1[4], "displayDelegates");
  location[0] = (id)objc_msgSend(v5, "copy");

  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v7)
  {
    v2 = *(_QWORD *)__b[2];
    v3 = 0;
    v4 = v7;
    while (1)
    {
      v1 = v3;
      if (*(_QWORD *)__b[2] != v2)
        objc_enumerationMutation(obj);
      v11 = *(id *)(__b[1] + 8 * v3);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "showManeuvers:usingDisplayStyles:", MEMORY[0x24BDBD1A8]);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "navigator:didEndTrip:", a1[4], 1);
      ++v3;
      if (v1 + 1 >= v4)
      {
        v3 = 0;
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v4)
          break;
      }
    }
  }

  objc_storeStrong((id *)a1[4] + 2, 0);
  objc_msgSend(a1[4], "setCompleted:", 1);
  objc_storeStrong(location, 0);
}

- (void)cancelTrip
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  CPSNavigator *v9;

  v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __26__CPSNavigator_cancelTrip__block_invoke;
  v7 = &unk_24E26F1B8;
  v8[0] = v9;
  dispatch_sync(queue, &v3);

  objc_storeStrong(v8, 0);
}

void __26__CPSNavigator_cancelTrip__block_invoke(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  id v7;
  id obj;
  uint64_t v9;
  _QWORD __b[8];
  id v11;
  id location[3];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = a1;
  v5 = (id)objc_msgSend(a1[4], "metadataDelegate");
  objc_msgSend(v5, "cancelTrip");

  v7 = (id)objc_msgSend(a1[4], "displayDelegates");
  location[0] = (id)objc_msgSend(v7, "copy");

  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v9)
  {
    v2 = *(_QWORD *)__b[2];
    v3 = 0;
    v4 = v9;
    while (1)
    {
      v1 = v3;
      if (*(_QWORD *)__b[2] != v2)
        objc_enumerationMutation(obj);
      v11 = *(id *)(__b[1] + 8 * v3);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "showManeuvers:usingDisplayStyles:", MEMORY[0x24BDBD1A8]);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "navigator:didEndTrip:", a1[4], 0);
      ++v3;
      if (v1 + 1 >= v4)
      {
        v3 = 0;
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v4)
          break;
      }
    }
  }

  objc_msgSend(a1[4], "setCompleted:", 1);
  objc_storeStrong(location, 0);
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9);
  void *v10;
  CPSNavigator *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSNavigator *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __49__CPSNavigator_showManeuvers_usingDisplayStyles___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_sync(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __49__CPSNavigator_showManeuvers_usingDisplayStyles___block_invoke(NSObject *a1)
{
  Class isa;
  id v2;
  id v3;
  Class v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  NSObject *log;
  os_log_type_t v15;
  id v16;
  _QWORD __b[8];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  os_log_type_t type;
  os_log_t oslog[11];
  _BYTE v29[128];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  oslog[2] = a1;
  oslog[1] = a1;
  if ((-[objc_class isCompleted](a1[4].isa, "isCompleted") & 1) != 0)
  {
    oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      log = oslog[0];
      v15 = type;
      v16 = (id)-[objc_class trip](a1[4].isa, "trip");
      v26 = v16;
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v26);
      _os_log_error_impl(&dword_21E389000, log, v15, "cannot update maneuvers for completed trip %@", v30, 0xCu);

      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    v13 = (id)-[objc_class metadataDelegate](a1[4].isa, "metadataDelegate");
    objc_msgSend(v13, "setActiveManeuvers:", a1[5].isa);

    v25 = 0;
    v24 = 0;
    if ((unint64_t)-[objc_class count](a1[5].isa, "count") <= 2)
    {
      objc_storeStrong(&v25, a1[5].isa);
      objc_storeStrong(&v24, a1[6].isa);
    }
    else
    {
      isa = a1[5].isa;
      oslog[8] = 0;
      oslog[7] = (os_log_t)2;
      oslog[9] = 0;
      oslog[10] = (os_log_t)2;
      v22 = 0;
      v23 = 2;
      v2 = (id)-[objc_class subarrayWithRange:](isa, "subarrayWithRange:", 0, 2);
      v3 = v25;
      v25 = v2;

      v4 = a1[6].isa;
      oslog[4] = 0;
      oslog[3] = (os_log_t)2;
      oslog[5] = 0;
      oslog[6] = (os_log_t)2;
      v20 = 0;
      v21 = 2;
      v5 = (id)-[objc_class subarrayWithRange:](v4, "subarrayWithRange:", 0, 2);
      v6 = v24;
      v24 = v5;

    }
    memset(__b, 0, sizeof(__b));
    obj = (id)-[objc_class displayDelegates](a1[4].isa, "displayDelegates");
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
    if (v12)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v12;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(obj);
        v19 = *(id *)(__b[1] + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "showManeuvers:usingDisplayStyles:", v25, v24);
        ++v9;
        if (v7 + 1 >= v10)
        {
          v9 = 0;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
          if (!v10)
            break;
        }
      }
    }

    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
  }
}

- (void)updateTravelEstimates:(id)a3 forManeuver:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSNavigator *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSNavigator *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __50__CPSNavigator_updateTravelEstimates_forManeuver___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_sync(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __50__CPSNavigator_updateTravelEstimates_forManeuver___block_invoke(uint64_t a1)
{
  id v1;
  NSObject *log;
  os_log_type_t type;
  id v4;
  id v6;
  char v7;
  id v8[3];
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8[2] = (id)a1;
  v8[1] = (id)a1;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCompleted") & 1) != 0)
  {
    v8[0] = CarPlaySupportGeneralLogging();
    v7 = 16;
    if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_ERROR))
    {
      log = v8[0];
      type = v7;
      v4 = (id)objc_msgSend(*(id *)(a1 + 32), "trip");
      v6 = v4;
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
      _os_log_error_impl(&dword_21E389000, log, type, "cannot update maneuver travel estimates for completed trip %@", v9, 0xCu);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(v8, 0);
  }
  else
  {
    v1 = (id)objc_msgSend(*(id *)(a1 + 32), "metadataDelegate");
    objc_msgSend(v1, "updateTravelEstimates:forManeuver:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "_sync_displayUpdateManeuverTravelEstimates:forManeuver:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

- (void)updateTripTravelEstimates:(id)a3
{
  CPSNavigationMetadataDelegate *v3;
  NSObject *log;
  os_log_type_t type;
  CPTrip *v6;
  CPTrip *v7;
  char v8;
  id v9;
  id location[2];
  CPSNavigator *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[CPSNavigator isCompleted](v11, "isCompleted"))
  {
    v9 = CarPlaySupportGeneralLogging();
    v8 = 16;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      log = v9;
      type = v8;
      v6 = -[CPSNavigator trip](v11, "trip");
      v7 = v6;
      __os_log_helper_16_2_1_8_64((uint64_t)v12, (uint64_t)v7);
      _os_log_error_impl(&dword_21E389000, log, type, "cannot update trip travel estimates for completed trip %@", v12, 0xCu);

      objc_storeStrong((id *)&v7, 0);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v3 = -[CPSNavigator metadataDelegate](v11, "metadataDelegate");
    -[CPSNavigationMetadataDelegate updateTripTravelEstimates:](v3, "updateTripTravelEstimates:", location[0]);

    -[CPSNavigator _sync_displayUpdateTripTravelEstimates:](v11, "_sync_displayUpdateTripTravelEstimates:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_sync_displayUpdateManeuverTravelEstimates:(id)a3 forManeuver:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSHashTable *v9;
  uint64_t v10;
  _QWORD __b[8];
  id v12;
  id v13;
  id location[2];
  CPSNavigator *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  memset(__b, 0, sizeof(__b));
  v9 = -[CPSNavigator displayDelegates](v15, "displayDelegates");
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v10)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v10;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(v9);
      v12 = *(id *)(__b[1] + 8 * v6);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "updateEstimates:forManeuver:", location[0], v13);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          break;
      }
    }
  }

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_sync_displayUpdateTripTravelEstimates:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSHashTable *obj;
  uint64_t v8;
  _QWORD __b[8];
  id v10;
  id location[2];
  CPSNavigator *v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = -[CPSNavigator displayDelegates](v12, "displayDelegates");
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v10 = *(id *)(__b[1] + 8 * v5);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "updateTripEstimates:", location[0]);
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v6)
          break;
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  CARNavigationOwnershipManagerDelegate *v3;
  NSObject *log;
  os_log_type_t type;
  __CFString *v6;
  __CFString *v7;
  os_log_type_t v8;
  id v9;
  unint64_t v10;
  SEL v11;
  CPSNavigator *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = CarPlaySupportGeneralLogging();
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    v6 = NSStringFromNavigationOwner_0(v10);
    v7 = v6;
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v12, (uint64_t)v7);
    _os_log_impl(&dword_21E389000, log, type, "%@: Navigation ownership changed to %@", v13, 0x16u);

    objc_storeStrong((id *)&v7, 0);
  }
  objc_storeStrong(&v9, 0);
  v3 = -[CPSNavigator navigationOwnershipDelegate](v12, "navigationOwnershipDelegate");
  -[CARNavigationOwnershipManagerDelegate navigationOwnershipChangedToOwner:](v3, "navigationOwnershipChangedToOwner:", v10);

}

- (CPTrip)trip
{
  return self->_trip;
}

- (void)setTrip:(id)a3
{
  objc_storeStrong((id *)&self->_trip, a3);
}

- (CARNavigationOwnershipManagerDelegate)navigationOwnershipDelegate
{
  return (CARNavigationOwnershipManagerDelegate *)objc_loadWeakRetained((id *)&self->_navigationOwnershipDelegate);
}

- (void)setNavigationOwnershipDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationOwnershipDelegate, a3);
}

- (BOOL)appSupportsInstrumentCluster
{
  return self->_appSupportsInstrumentCluster;
}

- (BOOL)sendsNavigationMetadata
{
  return self->_sendsNavigationMetadata;
}

- (CPSNavigationMetadataDelegate)metadataDelegate
{
  return self->_metadataDelegate;
}

- (void)setMetadataDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDelegate, a3);
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (NSHashTable)displayDelegates
{
  return self->_displayDelegates;
}

- (void)setDisplayDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_displayDelegates, a3);
}

- (CARSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_displayDelegates, 0);
  objc_storeStrong((id *)&self->_metadataDelegate, 0);
  objc_destroyWeak((id *)&self->_navigationOwnershipDelegate);
  objc_storeStrong((id *)&self->_trip, 0);
}

@end
