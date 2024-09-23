@implementation COMeshController

- (COMeshController)initWithConstituentType:(unint64_t)a3
{
  char *v4;
  COConstituent *v5;
  void *v6;
  id v7;
  void *v8;
  COBallot *v9;
  void *v10;
  COMeshNodeStateTrackerSet *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)COMeshController;
  v4 = -[COMeshController init](&v35, sel_init);
  if (v4)
  {
    v5 = -[COConstituent initWithType:]([COConstituent alloc], "initWithType:", a3);
    v6 = (void *)*((_QWORD *)v4 + 5);
    *((_QWORD *)v4 + 5) = v5;

    if ((objc_msgSend(*((id *)v4 + 5), "supportsBackoff") & 1) == 0)
      *((_QWORD *)v4 + 3) |= 1uLL;
    v7 = objc_alloc_init(MEMORY[0x24BDBCF00]);
    v8 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v7;

    v9 = -[COBallot initWithCandidate:]([COBallot alloc], "initWithCandidate:", *((_QWORD *)v4 + 5));
    v10 = (void *)*((_QWORD *)v4 + 11);
    *((_QWORD *)v4 + 11) = v9;

    v11 = objc_alloc_init(COMeshNodeStateTrackerSet);
    v12 = (void *)*((_QWORD *)v4 + 21);
    *((_QWORD *)v4 + 21) = v11;

    +[CODiscoveryManager managerWithDiscoveryDelay:delegate:](CODiscoveryManager, "managerWithDiscoveryDelay:delegate:", v4, 30.0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v4 + 22);
    *((_QWORD *)v4 + 22) = v13;

    v15 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    v16 = (void *)*((_QWORD *)v4 + 23);
    *((_QWORD *)v4 + 23) = v15;

    v17 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    v18 = (void *)*((_QWORD *)v4 + 24);
    *((_QWORD *)v4 + 24) = v17;

    v19 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    v20 = (void *)*((_QWORD *)v4 + 25);
    *((_QWORD *)v4 + 25) = v19;

    v21 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v22 = (void *)*((_QWORD *)v4 + 26);
    *((_QWORD *)v4 + 26) = v21;

    v23 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v24 = (void *)*((_QWORD *)v4 + 27);
    *((_QWORD *)v4 + 27) = v23;

    objc_storeStrong((id *)v4 + 7, MEMORY[0x24BDAC9B8]);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bundleIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v4 + 36);
    *((_QWORD *)v4 + 36) = v26;

    if (!objc_msgSend(*((id *)v4 + 36), "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "processName");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)*((_QWORD *)v4 + 36);
      *((_QWORD *)v4 + 36) = v29;

    }
    v31 = objc_msgSend(*((id *)v4 + 36), "copy");
    v32 = (void *)*((_QWORD *)v4 + 9);
    *((_QWORD *)v4 + 9) = v31;

    v33 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = &__block_literal_global_1;

    *((_QWORD *)v4 + 10) = 1;
    *(_OWORD *)(v4 + 232) = xmmword_215F52EB0;
  }
  return (COMeshController *)v4;
}

uint64_t __44__COMeshController_initWithConstituentType___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (COMeshController)init
{
  return -[COMeshController initWithConstituentType:](self, "initWithConstituentType:", -1);
}

- (NSString)description
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[COMeshController state](self, "state");
  if (v3 > 4)
    v4 = CFSTR("Unknown");
  else
    v4 = off_24D4B19E8[v3];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshController nodes](self, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, %@, %@>"), v7, self, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)setInternalFlags:(unint64_t)a3
{
  char v3;
  int v5;
  unint64_t v6;
  id v7;

  v3 = a3;
  self->_internalFlags = a3;
  if (!-[COMeshController state](self, "state"))
  {
    -[COMeshController me](self, "me");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (((v3 & 1) == 0) != objc_msgSend(v7, "supportsBackoff"))
    {
      v5 = objc_msgSend(v7, "flags");
      if ((v3 & 1) != 0)
        v6 = 0;
      else
        v6 = 0xFFFFFFFF80000000;
      objc_msgSend(v7, "setFlags:", v6 & 0xFFFFFFFF80000000 | v5 & 0x7FFFFFFF);
    }

  }
}

- (COCompanionLinkClientFactoryProtocol)companionLinkClientFactory
{
  COCompanionLinkClientFactoryProtocol *companionLinkClientFactory;
  COCompanionLinkClientFactory *v4;
  COCompanionLinkClientFactoryProtocol *v5;

  companionLinkClientFactory = self->_companionLinkClientFactory;
  if (!companionLinkClientFactory)
  {
    v4 = objc_alloc_init(COCompanionLinkClientFactory);
    v5 = self->_companionLinkClientFactory;
    self->_companionLinkClientFactory = (COCompanionLinkClientFactoryProtocol *)v4;

    companionLinkClientFactory = self->_companionLinkClientFactory;
  }
  return companionLinkClientFactory;
}

- (void)addBrowser:(id)a3
{
  -[CONodeManager addBrowser:](self->_nodeManager, "addBrowser:", a3);
}

- (void)setListener:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  COMeshLocalNode **p_listener;
  NSObject *v10;
  COMeshLocalNode *v11;
  void *v12;
  COMeshLocalNode *listener;
  void *v14;
  COMeshLocalNode *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[COMeshController listener](self, "listener");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 != v5)
  {
    if (v7)
    {
      objc_msgSend(v7, "setDelegate:", 0);
      objc_msgSend(v8, "invalidate");
    }
    p_listener = &self->_listener;
    objc_storeStrong((id *)&self->_listener, a3);
    COCoreLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[COMeshController setListener:].cold.1();

    v11 = *p_listener;
    if (*p_listener)
    {
      -[COMeshController meshName](self, "meshName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshNode setMeshName:](v11, "setMeshName:", v12);

      listener = self->_listener;
      -[COMeshController label](self, "label");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshNode setLabel:](listener, "setLabel:", v14);

      v15 = self->_listener;
      -[COMeshController recorder](self, "recorder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshNode setRecorder:](v15, "setRecorder:", v16);

      v17 = (void *)MEMORY[0x24BDBCEF0];
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshController commandHandlers](self, "commandHandlers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v23);

      -[COMeshController notificationHandlers](self, "notificationHandlers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allKeys");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v25);

      -[COMeshController requestHandlers](self, "requestHandlers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "allKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v27);

      -[COMeshLocalNode setAcceptableCommands:](self->_listener, "setAcceptableCommands:", v21);
      -[COMeshNode setDelegate:](self->_listener, "setDelegate:", self);
      -[COMeshLocalNode activate](self->_listener, "activate");

    }
  }

}

- (COConstituent)leader
{
  COConstituent *v3;
  COMeshController *v4;

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    if (-[COMeshController state](self, "state") == 3)
    {
      -[CONodeManager leader](self->_nodeManager, "leader");
      v3 = (COConstituent *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    if (-[COMeshController state](v4, "state") == 3)
      v3 = v4->_leader;
    else
      v3 = 0;
    objc_sync_exit(v4);

  }
  return v3;
}

- (COMeshNode)nodeForMe
{
  void *v3;
  COMeshLocalNode *v4;

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshController nodeManager](self, "nodeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nodeForMe");
    v4 = (COMeshLocalNode *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_listener;
  }
  return (COMeshNode *)v4;
}

- (unint64_t)generation
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (!objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
    return self->_generation;
  -[COMeshController nodeManager](self, "nodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "electionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "generation");

  return v5;
}

- (COBallot)ballot
{
  void *v3;
  void *v4;
  COBallot *v5;

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshController nodeManager](self, "nodeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "electionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ballot");
    v5 = (COBallot *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_ballot;
  }
  return v5;
}

- (NSOrderedSet)addOns
{
  COMeshController *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSOrderedSet copy](v2->_addOns, "copy");
  objc_sync_exit(v2);

  return (NSOrderedSet *)v3;
}

- (void)setAddOns:(id)a3
{
  COMeshController *v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSOrderedSet *addOns;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[COMeshController addOns](v4, "addOns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToOrderedSet:", v9);

  if ((v6 & 1) == 0)
  {
    v7 = objc_msgSend(v9, "copy");
    addOns = v4->_addOns;
    v4->_addOns = (NSOrderedSet *)v7;

  }
  objc_sync_exit(v4);

}

- (void)setElectionPrevious:(unint64_t)a3
{
  if (self->_electionPrevious != a3)
  {
    if (!a3)
      self->_electionEnd = 0;
    self->_electionPrevious = a3;
  }
}

- (void)setElectionStart:(unint64_t)a3
{
  if (self->_electionStart != a3)
  {
    -[COMeshController setElectionElapsedTimer:](self, "setElectionElapsedTimer:", 0);
    -[COMeshController setElectionPrevious:](self, "setElectionPrevious:", self->_electionStart);
    self->_electionStart = a3;
  }
}

- (void)setElectionEnd:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_time_t v23;
  COConstituent *longestBackedOffConstituent;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD handler[4];
  id v29;
  COMeshController *v30;
  id v31[6];
  id location;
  _QWORD v33[4];
  id v34;
  COMeshController *v35;
  double v36;
  uint64_t v37;
  char *v38;
  char *v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (self->_electionEnd != a3)
  {
    v5 = -[COMeshController electionPrevious](self, "electionPrevious");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[COMeshController electionStart](self, "electionStart");
      v27 = (void *)v7;
      if (self->_electionEnd)
        v8 = (double)(v7 - (unint64_t)v6) / 1000000000.0;
      else
        v8 = 0.0;
      -[COMeshController label](self, "label");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshController nodes](self, "nodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v9, "count");

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      -[COMeshController nodes](self, "nodes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v12 = 0;
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v42 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if (objc_msgSend(v16, "connectionType") == 2)
            {
              ++v11;
              if (objc_msgSend(v16, "discoveryType") == 2)
                ++v12;
            }
          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v13);
      }

      -[COMeshController recorder](self, "recorder");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __35__COMeshController_setElectionEnd___block_invoke;
      v33[3] = &unk_24D4B1568;
      v36 = (double)(a3 - (unint64_t)v27) / 1000000.0;
      v37 = v25 + 1;
      v38 = v11;
      v39 = v12;
      v40 = v8;
      v18 = v26;
      v34 = v18;
      v35 = self;
      ((void (**)(_QWORD, const __CFString *, _QWORD *))v17)[2](v17, CFSTR("com.apple.CoordinationCore.MeshElection"), v33);

      self->_electionEnd = a3;
      -[COMeshController electionElapsedTimer](self, "electionElapsedTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (v20)
      {
        -[COMeshController dispatchQueue](self, "dispatchQueue");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v21);

        if (v22)
        {
          v23 = dispatch_walltime(0, 86400000000000);
          dispatch_source_set_timer(v22, v23, 0x4E94914F0000uLL, 0);
          objc_initWeak(&location, self);
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = __35__COMeshController_setElectionEnd___block_invoke_2;
          handler[3] = &unk_24D4B15B8;
          objc_copyWeak(v31, &location);
          v31[1] = v6;
          v31[2] = v27;
          v31[3] = (id)(v25 + 1);
          v31[4] = v11;
          v31[5] = v12;
          v29 = v18;
          v30 = self;
          dispatch_source_set_event_handler(v22, handler);
          -[COMeshController setElectionElapsedTimer:](self, "setElectionElapsedTimer:", v22);

          objc_destroyWeak(v31);
          objc_destroyWeak(&location);
        }

      }
    }
  }
  longestBackedOffConstituent = self->_longestBackedOffConstituent;
  self->_longestBackOff = 0;
  self->_longestBackedOffConstituent = 0;

}

id __35__COMeshController_setElectionEnd___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x24BDAC8D0];
  v15[0] = 0x24D4B5458;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v15[1] = 0x24D4B5478;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = 0x24D4B5498;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = 0x24D4B54B8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = 0x24D4B5438;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v16[4] = v6;
  v16[5] = v7;
  v15[5] = 0x24D4B5418;
  v15[6] = 0x24D4B5698;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(v8 + 248));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = *(_QWORD **)(a1 + 40);
  if (v12[32])
  {
    objc_msgSend(v12, "_constituentCharacteristics:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, 0x24D4B56B8);

  }
  return v11;
}

void __35__COMeshController_setElectionEnd___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 == objc_msgSend(WeakRetained, "electionPrevious"))
    {
      v5 = *(_QWORD *)(a1 + 64);
      if (v5 == objc_msgSend(v3, "electionStart"))
      {
        objc_msgSend(v3, "recorder");
        v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __35__COMeshController_setElectionEnd___block_invoke_3;
        v9[3] = &unk_24D4B1590;
        v12 = *(_OWORD *)(a1 + 72);
        v13 = *(_QWORD *)(a1 + 88);
        v7 = *(id *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        v10 = v7;
        v11 = v8;
        ((void (**)(_QWORD, const __CFString *, _QWORD *))v6)[2](v6, CFSTR("com.apple.CoordinationCore.MeshElection"), v9);

      }
    }
  }

}

id __35__COMeshController_setElectionEnd___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x24BDAC8D0];
  v13[0] = &unk_24D4CF390;
  v12[0] = 0x24D4B5458;
  v12[1] = 0x24D4B5478;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v2;
  v12[2] = 0x24D4B5498;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v3;
  v12[3] = 0x24D4B54B8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v4;
  v13[4] = &unk_24D4CF450;
  v12[4] = 0x24D4B5438;
  v12[5] = 0x24D4B5418;
  v5 = a1[5];
  v13[5] = a1[4];
  v12[6] = 0x24D4B5698;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(v5 + 248));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = (_QWORD *)a1[5];
  if (v9[32])
  {
    objc_msgSend(v9, "_constituentCharacteristics:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, 0x24D4B56B8);

  }
  return v8;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *dispatchQueue;

  v4 = (OS_dispatch_queue *)a3;
  if (self->_dispatchQueue != v4 && objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshController nodeManager](self, "nodeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKey:", v4, 0x24D4B6778);
    -[COMeshController nodeManager](self, "nodeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExecutionContext:", v7);

  }
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v4;

}

- (void)setRecorder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id recorder;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_recorder != v4)
  {
    v5 = objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled");
    v4 = v13;
    if (v5)
    {
      -[COMeshController nodeManager](self, "nodeManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "executionContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      v9 = (void *)MEMORY[0x2199F3D40](v13);
      objc_msgSend(v8, "setObject:forKey:", v9, 0x24D4B6798);

      -[COMeshController nodeManager](self, "nodeManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setExecutionContext:", v8);

      v4 = v13;
    }
  }
  v11 = (void *)MEMORY[0x2199F3D40](v4);
  recorder = self->_recorder;
  self->_recorder = v11;

}

- (void)setElectionElapsedTimer:(id)a3
{
  OS_dispatch_source *v5;
  NSObject *v6;
  OS_dispatch_source **p_electionElapsedTimer;
  OS_dispatch_source *electionElapsedTimer;
  OS_dispatch_source *v9;

  v5 = (OS_dispatch_source *)a3;
  electionElapsedTimer = self->_electionElapsedTimer;
  p_electionElapsedTimer = &self->_electionElapsedTimer;
  v6 = electionElapsedTimer;
  v9 = v5;
  if (electionElapsedTimer != v5)
  {
    if (v6)
      dispatch_source_cancel(v6);
    objc_storeStrong((id *)p_electionElapsedTimer, a3);
    if (*p_electionElapsedTimer)
      dispatch_resume((dispatch_object_t)*p_electionElapsedTimer);
  }

}

- (NSArray)nodes
{
  COMeshController *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshController nodeManager](self, "nodeManager");
    v3 = (COMeshController *)objc_claimAutoreleasedReturnValue();
    -[COMeshController nodes](v3, "nodes");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = self;
    objc_sync_enter(v3);
    -[COMeshController trackers](v3, "trackers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __25__COMeshController_nodes__block_invoke;
    v8[3] = &unk_24D4B15E0;
    v4 = v5;
    v9 = v4;
    objc_msgSend(v6, "enumerateNodeStateTrackersOfStatus:usingBlock:", 1, v8);

    objc_sync_exit(v3);
  }

  return (NSArray *)v4;
}

void __25__COMeshController_nodes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "node");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)addAddOn:(id)a3
{
  id v4;
  COMeshController *v5;
  void *v6;
  BOOL v7;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[COMeshController addOns](v5, "addOns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[COMeshController state](v5, "state") || (objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v9, "addObject:", v4);
    objc_msgSend(v4, "willAddToMeshController:", v5);
    -[COMeshController setAddOns:](v5, "setAddOns:", v9);
    objc_msgSend(v4, "didAddToMeshController:", v5);

    v7 = 1;
  }

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)removeAddOn:(id)a3
{
  id v4;
  COMeshController *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[COMeshController addOns](v5, "addOns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[COMeshController state](v5, "state") || !objc_msgSend(v6, "containsObject:", v4))
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "removeObject:", v4);
    objc_msgSend(v4, "willRemoveFromMeshController:", v5);
    -[COMeshController setAddOns:](v5, "setAddOns:", v7);
    objc_msgSend(v4, "didRemoveFromMeshController:", v5);

    v8 = 1;
  }

  objc_sync_exit(v5);
  return v8;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__COMeshController_start__block_invoke;
  block[3] = &unk_24D4B0C80;
  block[4] = self;
  dispatch_async(v3, block);

}

void __25__COMeshController_start__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  COMutableExecutionContext *v24;
  void *v25;
  COMutableExecutionContext *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CONetworkActivityFactory *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CONodeManager *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id *v47;
  void *v48;
  void *v49;
  void *v50;
  id *v51;
  void *v52;
  COBallot *v53;
  void *v54;
  COMeshLocalNode *v55;
  void *v56;
  _QWORD v57[5];
  _QWORD v58[5];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(a1 + 32), "state");
  objc_sync_exit(v2);

  if (!v3)
  {
    COCoreLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "meshName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "me");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v60 = v5;
      v61 = 2112;
      v62 = v6;
      v63 = 2112;
      v64 = v7;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p starting \"%@\" mesh (%@)", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setElectionPrevious:", 0);
    objc_msgSend(*(id *)(a1 + 32), "addOns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __25__COMeshController_start__block_invoke_46;
    v58[3] = &unk_24D4B1608;
    v58[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v58);
    objc_msgSend(*(id *)(a1 + 32), "willTransitionToState:", 1);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("coordinated"))
      || (objc_msgSend(*(id *)(a1 + 32), "meshName"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "containsString:", CFSTR("home-mesh")),
          v12,
          v13))
    {
      objc_msgSend(*(id *)(a1 + 32), "_setupCoordinationPrefsObserver");
    }
    v14 = objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled");
    v15 = *(id *)(a1 + 32);
    objc_sync_enter(v15);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    if ((v14 & 1) != 0)
    {
      objc_sync_exit(v15);

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", objc_opt_class());
      objc_msgSend(v16, "addObject:", objc_opt_class());
      if ((objc_msgSend(*(id *)(a1 + 32), "clusterOptions") & 1) != 0)
      {
        objc_msgSend(v16, "addObject:", objc_opt_class());
        objc_msgSend(v16, "addObject:", objc_opt_class());
      }
      objc_msgSend(*(id *)(a1 + 32), "commandHandlers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v18);

      objc_msgSend(*(id *)(a1 + 32), "notificationHandlers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v20);

      objc_msgSend(*(id *)(a1 + 32), "requestHandlers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v22);

      v23 = *(_QWORD **)(a1 + 32);
      if (!v23[33])
      {
        v24 = [COMutableExecutionContext alloc];
        objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[COExecutionContext initWithDispatchQueue:](v24, "initWithDispatchQueue:", v25);

        objc_msgSend(*(id *)(a1 + 32), "meshName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v27, 0x24D4B67B8);

        objc_msgSend(*(id *)(a1 + 32), "label");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v28, 0x24D4B67D8);

        objc_msgSend(*(id *)(a1 + 32), "me");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v29, 0x24D4B67F8);

        objc_msgSend(*(id *)(a1 + 32), "recorder");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v30, 0x24D4B6798);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(a1 + 32));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v31, 0x24D4B6818);

        v32 = objc_alloc_init(CONetworkActivityFactory);
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v32, 0x24D4B6838);

        v33 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "pingMinimum");
        objc_msgSend(v33, "numberWithDouble:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v34, 0x24D4B6858);

        v35 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "pingMaximum");
        objc_msgSend(v35, "numberWithDouble:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v36, 0x24D4B6878);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "clusterOptions"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMutableExecutionContext setObject:forKey:](v26, "setObject:forKey:", v37, 0x24D4B6898);

        v38 = -[CONodeManager initWithExecutionContext:]([CONodeManager alloc], "initWithExecutionContext:", v26);
        v39 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = v38;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "setDelegate:");
        v23 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v23, "_setupBrowsers");
      objc_msgSend(*(id *)(a1 + 32), "nodeManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAcceptableCommands:", v16);

      COCoreLogForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = *(void **)(a1 + 32);
        objc_msgSend(v42, "nodeManager");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v60 = v42;
        v61 = 2112;
        v62 = v43;
        _os_log_impl(&dword_215E92000, v41, OS_LOG_TYPE_DEFAULT, "%p starting NodeManager %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "nodeManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "start");

      COCoreLogForCategory(0);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v60 = v46;
        _os_log_impl(&dword_215E92000, v45, OS_LOG_TYPE_DEFAULT, "%p NodeManager started", buf, 0xCu);
      }

      v48 = *(void **)(a1 + 32);
      v47 = (id *)(a1 + 32);
      objc_msgSend(v48, "addOns");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v9;
      v57[1] = 3221225472;
      v57[2] = __25__COMeshController_start__block_invoke_58;
      v57[3] = &unk_24D4B1608;
      v57[4] = *v47;
      objc_msgSend(v49, "enumerateObjectsUsingBlock:", v57);

      objc_msgSend(*v47, "didTransitionToState:", 1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "trackers");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "removeAllNodeStateTrackers");

      objc_sync_exit(v15);
      v52 = *(void **)(a1 + 32);
      v51 = (id *)(a1 + 32);
      objc_msgSend(v52, "me");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[COBallot initWithCandidate:]([COBallot alloc], "initWithCandidate:", v16);
      v54 = (void *)objc_msgSend(*v51, "_newCompanionLinkClient");
      v55 = -[COMeshLocalNode initWithCompanionLinkClient:source:]([COMeshLocalNode alloc], "initWithCompanionLinkClient:source:", v54, v16);
      objc_msgSend(*v51, "companionLinkClientFactory");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshLocalNode setCompanionLinkClientFactory:](v55, "setCompanionLinkClientFactory:", v56);

      objc_msgSend(*v51, "setBallot:", v53);
      objc_msgSend(*v51, "setListener:", v55);
      objc_msgSend(*v51, "didTransitionToState:", 1);

    }
  }
}

uint64_t __25__COMeshController_start__block_invoke_46(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willStartMeshController:", *(_QWORD *)(a1 + 32));
}

uint64_t __25__COMeshController_start__block_invoke_58(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStartMeshController:", *(_QWORD *)(a1 + 32));
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__COMeshController_stop__block_invoke;
  block[3] = &unk_24D4B0C80;
  block[4] = self;
  dispatch_async(v3, block);

}

void __24__COMeshController_stop__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  __uint64_t v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  id v31;
  COMeshWithdrawalCommand *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  COMeshWithdrawalCommand *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  _QWORD v54[6];
  _QWORD v55[5];
  uint8_t v56[128];
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(a1 + 32), "state");
  objc_sync_exit(v2);

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    COCoreLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "meshName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p stopping \"%@\" mesh", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v58 = __Block_byref_object_copy__9;
    v59 = __Block_byref_object_dispose__9;
    objc_msgSend(*(id *)(a1 + 32), "addOns");
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v8 = MEMORY[0x24BDAC760];
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __24__COMeshController_stop__block_invoke_59;
    v55[3] = &unk_24D4B1608;
    v55[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v55);
    objc_msgSend(*(id *)(a1 + 32), "willTransitionToState:", 4);
    objc_msgSend(*(id *)(a1 + 32), "_tearDownCoordinationPrefsObserver");
    v9 = objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled");
    v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 4;
    if (v9)
    {
      objc_sync_exit(v10);

      objc_msgSend(*(id *)(a1 + 32), "didTransitionToState:", 4);
      objc_msgSend(*(id *)(a1 + 32), "nodeManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v8;
      v54[1] = 3221225472;
      v54[2] = __24__COMeshController_stop__block_invoke_2;
      v54[3] = &unk_24D4B0B18;
      v54[4] = *(_QWORD *)(a1 + 32);
      v54[5] = buf;
      objc_msgSend(v11, "stopWithCompletionHandler:", v54);

      objc_msgSend(*(id *)(a1 + 32), "setRapportBrowser:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setIdsBrowser:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setBallotBrowser:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "trackers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nodeStateTrackersWithStatus:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_sync_exit(v10);
      objc_msgSend(*(id *)(a1 + 32), "listener");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x24BDBCF20]);
      objc_msgSend(v14, "setAcceptableCommands:", v15);

      v16 = objc_msgSend(v13, "count");
      v17 = *(void **)(a1 + 32);
      if (v16)
      {
        v18 = objc_msgSend(v17, "electionEnd");
        if (v18 > objc_msgSend(*(id *)(a1 + 32), "electionStart"))
        {
          objc_msgSend(*(id *)(a1 + 32), "label");
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "nodes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          v51 = 0u;
          v52 = 0u;
          v50 = 0u;
          v49 = 0u;
          objc_msgSend(*(id *)(a1 + 32), "nodes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
          v38 = v21;
          v39 = (void *)v19;
          v24 = 0;
          v25 = 0;
          if (v23)
          {
            v26 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v50 != v26)
                  objc_enumerationMutation(v22);
                v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                if (objc_msgSend(v28, "connectionType") == 2)
                {
                  ++v24;
                  if (objc_msgSend(v28, "discoveryType") == 2)
                    ++v25;
                }
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
            }
            while (v23);
          }

          v8 = MEMORY[0x24BDAC760];
          v29 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          objc_msgSend(*(id *)(a1 + 32), "recorder");
          v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v43[0] = v8;
          v43[1] = 3221225472;
          v43[2] = __24__COMeshController_stop__block_invoke_3;
          v43[3] = &unk_24D4B1630;
          v45 = v38 + 1;
          v46 = v24;
          v47 = v25;
          v48 = (double)(v29 - v18) / 1000000000.0;
          v31 = v39;
          v44 = v31;
          ((void (**)(_QWORD, const __CFString *, _QWORD *))v30)[2](v30, CFSTR("com.apple.CoordinationCore.MeshElection"), v43);

        }
        v40[0] = v8;
        v40[1] = 3221225472;
        v40[2] = __24__COMeshController_stop__block_invoke_4;
        v40[3] = &unk_24D4B1658;
        v42 = 4;
        v32 = objc_alloc_init(COMeshWithdrawalCommand);
        v41 = v32;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v40);

        v33 = 4;
      }
      else
      {
        objc_msgSend(v17, "setElectionStart:", 0);
        objc_msgSend(*(id *)(a1 + 32), "didTransitionToState:", 4);
        objc_msgSend(*(id *)(a1 + 32), "willTransitionToState:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setListener:", 0);
        v34 = *(id *)(a1 + 32);
        objc_sync_enter(v34);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
        objc_msgSend(*(id *)(a1 + 32), "addOns");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v35;

        objc_sync_exit(v34);
        v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
        v53[0] = v8;
        v53[1] = 3221225472;
        v53[2] = __24__COMeshController_stop__block_invoke_2_62;
        v53[3] = &unk_24D4B1608;
        v53[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v37, "enumerateObjectsUsingBlock:", v53);
        v33 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "didTransitionToState:", v33);

    }
    _Block_object_dispose(buf, 8);

  }
}

uint64_t __24__COMeshController_stop__block_invoke_59(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willStopMeshController:", *(_QWORD *)(a1 + 32));
}

uint64_t __24__COMeshController_stop__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "nodeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v13 = v3;
    v14 = 2048;
    v15 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p Node manager %p successfully stopped", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "willTransitionToState:", 0);
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "addOns");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_sync_exit(v5);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __24__COMeshController_stop__block_invoke_60;
  v11[3] = &unk_24D4B1608;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);
  return objc_msgSend(*(id *)(a1 + 32), "didTransitionToState:", 0);
}

uint64_t __24__COMeshController_stop__block_invoke_60(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStopMeshController:", *(_QWORD *)(a1 + 32));
}

uint64_t __24__COMeshController_stop__block_invoke_2_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStopMeshController:", *(_QWORD *)(a1 + 32));
}

id __24__COMeshController_stop__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v10[0] = &unk_24D4CF390;
  v9[0] = 0x24D4B5458;
  v9[1] = 0x24D4B5478;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v2;
  v9[2] = 0x24D4B5498;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v3;
  v9[3] = 0x24D4B54B8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v4;
  v9[4] = 0x24D4B5438;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = 0x24D4B5418;
  v6 = *(_QWORD *)(a1 + 32);
  v10[4] = v5;
  v10[5] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __24__COMeshController_stop__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setState:", v3);
  objc_msgSend(v4, "node");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sendMeshCommand:", *(_QWORD *)(a1 + 32));
}

- (void)willTransitionToState:(unint64_t)a3
{
  NSObject *v5;
  COMeshController *v6;
  id v7;
  _QWORD v8[6];

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = self;
  objc_sync_enter(v6);
  -[COMeshController addOns](v6, "addOns");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__COMeshController_willTransitionToState___block_invoke;
  v8[3] = &unk_24D4B1680;
  v8[4] = v6;
  v8[5] = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __42__COMeshController_willTransitionToState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "meshController:willTransitionToState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didTransitionToState:(unint64_t)a3
{
  NSObject *v5;
  COMeshController *v6;
  id v7;
  _QWORD v8[6];

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = self;
  objc_sync_enter(v6);
  -[COMeshController addOns](v6, "addOns");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__COMeshController_didTransitionToState___block_invoke;
  v8[3] = &unk_24D4B1680;
  v8[4] = v6;
  v8[5] = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __41__COMeshController_didTransitionToState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "meshController:didTransitionToState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)willActivateNode:(id)a3
{
  NSObject *v3;

  -[COMeshController dispatchQueue](self, "dispatchQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)willInvalidateNode:(id)a3 error:(id)a4
{
  NSObject *v4;

  -[COMeshController dispatchQueue](self, "dispatchQueue", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

}

- (void)registerHandler:(id)a3 forCommandClass:(Class)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__COMeshController_registerHandler_forCommandClass___block_invoke;
  block[3] = &unk_24D4B16A8;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __52__COMeshController_registerHandler_forCommandClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__COMeshController_registerHandler_forCommandClass___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "commandHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)MEMORY[0x2199F3D40]();
  objc_msgSend(v4, "setObject:forKey:", v6, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setCommandHandlers:", v4);
}

- (void)deregisterHandlerForCommandClass:(Class)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__COMeshController_deregisterHandlerForCommandClass___block_invoke;
  v6[3] = &unk_24D4B16D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __53__COMeshController_deregisterHandlerForCommandClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__COMeshController_deregisterHandlerForCommandClass___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "commandHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCommandHandlers:", v4);

}

- (void)registerHandler:(id)a3 forNotificationClass:(Class)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__COMeshController_registerHandler_forNotificationClass___block_invoke;
  block[3] = &unk_24D4B16A8;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __57__COMeshController_registerHandler_forNotificationClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__COMeshController_registerHandler_forNotificationClass___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "notificationHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)MEMORY[0x2199F3D40]();
  objc_msgSend(v4, "setObject:forKey:", v6, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setNotificationHandlers:", v4);
}

- (void)deregisterHandlerForNotificationClass:(Class)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__COMeshController_deregisterHandlerForNotificationClass___block_invoke;
  v6[3] = &unk_24D4B16D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __58__COMeshController_deregisterHandlerForNotificationClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__COMeshController_deregisterHandlerForNotificationClass___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "notificationHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNotificationHandlers:", v4);

}

- (void)registerHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__COMeshController_registerHandler_forRequestClass___block_invoke;
  block[3] = &unk_24D4B16A8;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __52__COMeshController_registerHandler_forRequestClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__COMeshController_registerHandler_forRequestClass___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "requestHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)MEMORY[0x2199F3D40]();
  objc_msgSend(v4, "setObject:forKey:", v6, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setRequestHandlers:", v4);
}

- (void)deregisterHandlerForRequestClass:(Class)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__COMeshController_deregisterHandlerForRequestClass___block_invoke;
  v6[3] = &unk_24D4B16D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __53__COMeshController_deregisterHandlerForRequestClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__COMeshController_deregisterHandlerForRequestClass___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "requestHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setRequestHandlers:", v4);

}

- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__COMeshController_sendCommand_withCompletionHandler___block_invoke;
  block[3] = &unk_24D4B0D28;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __54__COMeshController_sendCommand_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  COMeshControllerQueuedCommand *v3;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__COMeshController_sendCommand_withCompletionHandler___block_invoke_cold_1(a1, v2);

  v3 = -[COMeshControllerQueuedCommand initWithCommand:completionHandler:]([COMeshControllerQueuedCommand alloc], "initWithCommand:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_enqueueCommand:", v3);

}

- (void)sendRequest:(id)a3 sentRequestCallback:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__COMeshController_sendRequest_sentRequestCallback___block_invoke;
  v10[3] = &unk_24D4B16F8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x2199F3D40](v10);
  -[COMeshController sendRequest:withCompletionHandler:](self, "sendRequest:withCompletionHandler:", v8, v9);

}

uint64_t __52__COMeshController_sendRequest_sentRequestCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__COMeshController_sendRequest_withCompletionHandler___block_invoke;
  block[3] = &unk_24D4B0D28;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __54__COMeshController_sendRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  COMeshControllerQueuedRequest *v3;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__COMeshController_sendRequest_withCompletionHandler___block_invoke_cold_1(a1, v2);

  v3 = -[COMeshControllerQueuedRequest initWithRequest:completionHandler:]([COMeshControllerQueuedRequest alloc], "initWithRequest:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_enqueueCommand:", v3);

}

- (void)sendCommand:(id)a3 toPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__COMeshController_sendCommand_toPeer___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __39__COMeshController_sendCommand_toPeer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  COMeshControllerQueuedCommand *v3;
  void *v4;
  COMeshControllerQueuedCommand *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __39__COMeshController_sendCommand_toPeer___block_invoke_cold_1();

  v3 = [COMeshControllerQueuedCommand alloc];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__COMeshController_sendCommand_toPeer___block_invoke_68;
  v6[3] = &unk_24D4B1720;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v5 = -[COMeshControllerQueuedCommand initWithCommand:completionHandler:](v3, "initWithCommand:completionHandler:", v7, v6);
  -[COMeshControllerQueuedCommand setDestination:](v5, "setDestination:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_enqueueCommand:", v5);

}

void __39__COMeshController_sendCommand_toPeer___block_invoke_68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __39__COMeshController_sendCommand_toPeer___block_invoke_68_cold_1(a1, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = 134218498;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p sent command %@ to peer %@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)sendRequest:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__COMeshController_sendRequest_toPeer_withCompletionHandler___block_invoke;
  v15[3] = &unk_24D4B0EC8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __61__COMeshController_sendRequest_toPeer_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  COMeshControllerQueuedPeerRequest *v3;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__COMeshController_sendRequest_toPeer_withCompletionHandler___block_invoke_cold_1();

  v3 = -[COMeshControllerQueuedRequest initWithRequest:completionHandler:]([COMeshControllerQueuedPeerRequest alloc], "initWithRequest:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  -[COMeshControllerQueuedRequest setDestination:](v3, "setDestination:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_enqueueCommand:", v3);

}

- (void)broadcastRequest:(id)a3 includingSelf:(BOOL)a4 recipientsCallback:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  COMeshController *v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__COMeshController_broadcastRequest_includingSelf_recipientsCallback_completionHandler___block_invoke;
  block[3] = &unk_24D4B1748;
  v22 = a4;
  v20 = v11;
  v21 = v12;
  v18 = v10;
  v19 = self;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __88__COMeshController_broadcastRequest_includingSelf_recipientsCallback_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  COMeshControllerQueuedBroadcastRequestMarker *v5;

  v5 = -[COMeshControllerQueuedBroadcastRequestMarker initWithRequest:includeSelf:recipientBlock:completionHandler:]([COMeshControllerQueuedBroadcastRequestMarker alloc], "initWithRequest:includeSelf:recipientBlock:completionHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "queuedCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueuedCommands:", v4);

  objc_msgSend(*(id *)(a1 + 40), "_processQueuedCommands");
}

- (void)sendNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__COMeshController_sendNotification___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __37__COMeshController_sendNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  COCoreLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v20 = v10;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v3;
    _os_log_debug_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEBUG, "%p notifying %@ with recipients list %@", buf, 0x20u);

  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __37__COMeshController_sendNotification___block_invoke_72;
  v16 = &unk_24D4B1770;
  v17 = *(id *)(a1 + 40);
  v18 = v5;
  v6 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v13);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "queuedCommands", v13, v14, v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueuedCommands:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_processQueuedCommands");
}

void __37__COMeshController_sendNotification___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  COMeshControllerQueuedNotification *v4;

  v3 = a2;
  v4 = -[COMeshControllerQueuedNotification initWithNotification:destination:]([COMeshControllerQueuedNotification alloc], "initWithNotification:destination:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

- (id)_newCompanionLinkClient
{
  void *v3;
  void *v4;
  void *v5;

  -[COMeshController companionLinkClientFactory](self, "companionLinkClientFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "companionLinkClientForCurrentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDispatchQueue:", v5);

  return v4;
}

- (id)nodeForConstituent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[COMeshController nodes](self, "nodes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "remote");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_currentBallotMergedWithBallot:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COMeshController ballot](self, "ballot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "mergeBallot:", v4);
  -[COMeshController me](self, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "candidates", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isEqual:", v8) & 1) == 0)
        {
          -[COMeshController nodeForConstituent:](self, "nodeForConstituent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            objc_msgSend(v7, "removeCandidate:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

- (void)_pingLeader
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = a4;
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, a3, "%p sending ping (%g)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

- (id)_inflateQueueCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **p_cache;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void **v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  COMeshController *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshController nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = self;
  -[COMeshController queuedCommands](self, "queuedCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    p_cache = &OBJC_METACLASS___COMTResult.cache;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      v28 = v8;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          v15 = v5;
          if (objc_msgSend(v14, "includeSelfInBroadcast"))
          {
            -[COMeshController nodeForMe](v27, "nodeForMe");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "arrayByAddingObject:", v16);
            v17 = v9;
            v18 = v3;
            v19 = p_cache;
            v20 = v6;
            v21 = v5;
            v22 = objc_claimAutoreleasedReturnValue();

            v15 = (id)v22;
            v5 = v21;
            v6 = v20;
            p_cache = v19;
            v3 = v18;
            v9 = v17;
            v11 = MEMORY[0x24BDAC760];
          }
          v29[0] = v11;
          v29[1] = 3221225472;
          v29[2] = __41__COMeshController__inflateQueueCommands__block_invoke;
          v29[3] = &unk_24D4B1770;
          v23 = v14;
          v30 = v23;
          v31 = v3;
          objc_msgSend(v15, "enumerateObjectsUsingBlock:", v29);
          objc_msgSend(v23, "recipientCallback");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v23, "recipientCallback");
            v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id))v25)[2](v25, v15);

          }
          v8 = v28;
        }
        else
        {
          objc_msgSend(v3, "addObject:", v13);
        }
        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  return v3;
}

void __41__COMeshController__inflateQueueCommands__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  COMeshControllerQueuedBroadcastRequest *v4;
  void *v5;
  void *v6;
  COMeshControllerQueuedBroadcastRequest *v7;

  v3 = a2;
  v4 = [COMeshControllerQueuedBroadcastRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COMeshControllerQueuedBroadcastRequest initWithRequest:destination:completionHandler:](v4, "initWithRequest:destination:completionHandler:", v5, v3, v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

- (void)_processQueuedCommands
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p leader is %p, so dispatching queue to self", v1);
  OUTLINED_FUNCTION_2_0();
}

void __42__COMeshController__processQueuedCommands__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResponse:", a2);
  objc_msgSend(*(id *)(a1 + 32), "invokeCallbackWithError:", v6);

}

void __42__COMeshController__processQueuedCommands__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResponse:", a2);
  objc_msgSend(*(id *)(a1 + 32), "invokeCallbackWithError:", v6);

}

void __42__COMeshController__processQueuedCommands__block_invoke_77(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  _QWORD v40[5];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "command");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setSender:", *(_QWORD *)(a1 + 40));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "destination");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "listener");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "isEqual:", v5);

      if (v6)
      {
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __42__COMeshController__processQueuedCommands__block_invoke_2_78;
        v40[3] = &unk_24D4B1798;
        v7 = *(_QWORD *)(a1 + 40);
        v40[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(WeakRetained, "node:didReceiveRequest:responseCallBack:", v7, v3, v40);
LABEL_13:

        goto LABEL_14;
      }
      v13 = *(void **)(a1 + 48);
      objc_msgSend(v13, "sentCommands");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSentCommands:", v15);

      goto LABEL_11;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setDestination:", *(_QWORD *)(a1 + 40));
      COCoreLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v26 = *(_QWORD *)(a1 + 48);
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        v42 = v26;
        v43 = 2112;
        v44 = v28;
        v45 = 2048;
        v46 = v29;
        _os_log_debug_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEBUG, "%p self requesting %@ from %p", buf, 0x20u);

      }
      v9 = *(void **)(a1 + 40);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __42__COMeshController__processQueuedCommands__block_invoke_79;
      v37[3] = &unk_24D4B17C0;
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 32);
      v38 = v10;
      v39 = v11;
      objc_msgSend(WeakRetained, "node:didReceiveRequest:responseCallBack:", v10, v3, v37);
      v12 = v38;
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          COCoreLogForCategory(0);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v30 = *(_QWORD *)(a1 + 48);
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 134218498;
            v42 = v30;
            v43 = 2112;
            v44 = v32;
            v45 = 2048;
            v46 = v33;
            _os_log_debug_impl(&dword_215E92000, v25, OS_LOG_TYPE_DEBUG, "%p self sending %@ to %p", buf, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 32), "invokeCallbackWithError:", 0);
          objc_msgSend(WeakRetained, "node:didReceiveCommand:", *(_QWORD *)(a1 + 40), v3);
          goto LABEL_13;
        }
        objc_msgSend(*(id *)(a1 + 32), "destination");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sendMeshCommand:", v3);
        goto LABEL_12;
      }
      objc_msgSend(*(id *)(a1 + 32), "destination");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "listener");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
      {
        objc_msgSend(WeakRetained, "sentCommands");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setSentCommands:", v24);

LABEL_11:
        objc_msgSend(*(id *)(a1 + 32), "destination");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sendMeshRequest:", v3);
LABEL_12:

        goto LABEL_13;
      }
      v20 = *(void **)(a1 + 40);
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __42__COMeshController__processQueuedCommands__block_invoke_2_80;
      v34[3] = &unk_24D4B17C0;
      v21 = v20;
      v22 = *(_QWORD *)(a1 + 32);
      v35 = v21;
      v36 = v22;
      objc_msgSend(WeakRetained, "node:didReceiveRequest:responseCallBack:", v21, v3, v34);
      v12 = v35;
    }

    goto LABEL_13;
  }
LABEL_14:

}

void __42__COMeshController__processQueuedCommands__block_invoke_2_78(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResponse:", a2);
  objc_msgSend(*(id *)(a1 + 32), "invokeCallbackWithError:", v6);

}

void __42__COMeshController__processQueuedCommands__block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  v6 = a2;
  objc_msgSend(v6, "_setSender:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setResponse:", v6);

  objc_msgSend(*(id *)(a1 + 40), "invokeCallbackWithError:", v7);
}

void __42__COMeshController__processQueuedCommands__block_invoke_2_80(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  v6 = a2;
  objc_msgSend(v6, "_setSender:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setResponse:", v6);

  objc_msgSend(*(id *)(a1 + 40), "invokeCallbackWithError:", v7);
}

- (void)_enqueueCommand:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COMeshController queuedCommands](self, "queuedCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshController setQueuedCommands:](self, "setQueuedCommands:", v7);
  -[COMeshController _processQueuedCommands](self, "_processQueuedCommands");
}

- (void)_removeSentCommand:(id)a3 fromNode:(id)a4 withResponse:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  COMeshController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  id v27;

  v27 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  if ((objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled") & 1) == 0)
  {
    v14 = self;
    objc_sync_enter(v14);
    -[COMeshController trackers](v14, "trackers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nodeStateTrackerForNode:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "state");

    objc_sync_exit(v14);
    if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 0)
      goto LABEL_15;
  }
  -[COMeshController sentCommands](self, "sentCommands");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  if (!v19)
    goto LABEL_14;
  v20 = v19;
  v21 = 0;
  while (1)
  {
    objc_msgSend(v18, "objectAtIndex:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "command");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23 == v27)
      break;

LABEL_8:
    if (v20 == ++v21)
      goto LABEL_14;
  }
  objc_msgSend(v22, "destination");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqual:", v10);

  if (!v25)
    goto LABEL_8;
  v26 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v26, "removeObjectAtIndex:", v21);
  -[COMeshController setSentCommands:](self, "setSentCommands:", v26);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(v22, "setResponse:", v11);
  objc_msgSend(v22, "invokeCallbackWithError:", v12);

LABEL_14:
LABEL_15:

}

- (BOOL)_isCurrentElectionVariant:(int64_t)a3
{
  return a3 == 1;
}

- (id)_electionRequestWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  COMeshElectionRequest *v9;

  v6 = a3;
  -[COMeshController listener](self, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "listeningPort");

  v9 = -[COMeshElectionRequest initWithBallot:generation:listeningPort:]([COMeshElectionRequest alloc], "initWithBallot:generation:listeningPort:", v6, a4, v8);
  return v9;
}

- (id)_ballotResponseWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v5;
  COMeshBallotResponse *v6;

  v5 = a3;
  v6 = -[COMeshBaseBallotResponse initWithBallot:generation:]([COMeshBallotResponse alloc], "initWithBallot:generation:", v5, a4);

  return v6;
}

- (id)_voteRequestWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v5;
  COMeshVoteRequest *v6;

  v5 = a3;
  v6 = -[COMeshBaseBallotRequest initWithBallot:generation:]([COMeshVoteRequest alloc], "initWithBallot:generation:", v5, a4);

  return v6;
}

- (id)_acceptResponseWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v5;
  COMeshAcceptResponse *v6;

  v5 = a3;
  v6 = -[COMeshBaseBallotResponse initWithBallot:generation:]([COMeshAcceptResponse alloc], "initWithBallot:generation:", v5, a4);

  return v6;
}

- (void)_performElectionGeneration:(unint64_t)a3 source:(id)a4 allowingPostTransition:(BOOL)a5
{
  id v7;
  NSObject *v8;
  COMeshController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  COMeshController *v15;
  uint64_t v16;
  void *v17;
  COMutableBallot *v18;
  void *v19;
  COMutableBallot *v20;
  NSObject *v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  void *v25;
  COMutableBallot *v26;
  void *v27;
  const char *v28;
  void *v29;
  COMutableBallot *v30;
  COMutableBallot *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  COMutableBallot *v44;
  void *v45;
  void *v46;
  id v47;
  COMutableBallot *v48;
  void *v49;
  id v50;
  char v51;
  _BOOL4 v52;
  _QWORD v53[5];
  id v54;
  COMutableBallot *v55;
  unint64_t v56;
  _QWORD v57[4];
  id v58;
  id v59;
  COMutableBallot *v60;
  _BYTE *v61;
  unint64_t v62;
  _QWORD v63[5];
  _BYTE buf[24];
  COMutableBallot *v65;
  __int16 v66;
  COMutableBallot *v67;
  uint64_t v68;

  v52 = a5;
  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = self;
  objc_sync_enter(v9);
  v10 = -[COMeshController state](v9, "state");
  -[COMeshController trackers](v9, "trackers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nodeStateTrackersWithStatus:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nodeStateTrackersWithStatus:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v9);
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    goto LABEL_37;
  -[COMeshController _pingLeader](v9, "_pingLeader");
  if (v10 == 2)
  {
    v23 = -[COMeshController generation](v9, "generation");
    v24 = v23 >= a3;
    if (v23 > a3)
      a3 = v23;
    if (v24)
    {
      -[COMeshController ballot](v9, "ballot");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (COMutableBallot *)objc_msgSend(v29, "mutableCopy");

      COCoreLogForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a3;
        v28 = "%p continuing ELECTION (%llu)";
        goto LABEL_17;
      }
    }
    else
    {
      -[COMeshController discoveryManager](v9, "discoveryManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "clearRecords");

      v26 = [COMutableBallot alloc];
      -[COMeshController me](v9, "me");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[COBallot initWithCandidate:](v26, "initWithCandidate:", v27);

      COCoreLogForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a3;
        v28 = "%p update to ELECTION (%llu)";
LABEL_17:
        _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
      }
    }
    v22 = 1;
    goto LABEL_19;
  }
  if (v10 == 1)
  {
    -[COMeshController addOns](v9, "addOns");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke;
    v63[3] = &unk_24D4B1608;
    v63[4] = v9;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v63);

  }
  -[COMeshController setElectionStart:](v9, "setElectionStart:", clock_gettime_nsec_np(_CLOCK_UPTIME_RAW));
  -[COMeshController willTransitionToState:](v9, "willTransitionToState:", 2);
  v15 = v9;
  objc_sync_enter(v15);
  v15->_state = 2;
  objc_sync_exit(v15);

  v16 = -[COMeshController generation](v15, "generation");
  if (v16 + 1 > a3)
    a3 = v16 + 1;
  -[COMeshController discoveryManager](v15, "discoveryManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clearRecords");

  v18 = [COMutableBallot alloc];
  -[COMeshController me](v15, "me");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[COBallot initWithCandidate:](v18, "initWithCandidate:", v19);

  COCoreLogForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, "%p starting ELECTION (%llu)", buf, 0x16u);
  }
  v22 = 0;
LABEL_19:
  v51 = v22;

  -[COMeshController setGeneration:](v9, "setGeneration:", a3);
  if (v7)
  {
    -[COMutableBallot addCandidate:](v20, "addCandidate:", v7);
    -[COMeshController nodeForConstituent:](v9, "nodeForConstituent:", v7);
    v30 = (COMutableBallot *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v30)
    {
LABEL_30:

      goto LABEL_31;
    }
    -[COMutableBallot discoveryRecord](v30, "discoveryRecord");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32 && objc_msgSend(v32, "shouldAdvertise"))
    {
      if (!-[COMutableBallot addDiscoveryRecord:](v20, "addDiscoveryRecord:", v33))
      {
LABEL_29:

        goto LABEL_30;
      }
      COCoreLogForCategory(11);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        -[COBallot discovery](v20, "discovery");
        v35 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2048;
        v65 = v20;
        v49 = (void *)v35;
        _os_log_impl(&dword_215E92000, v34, OS_LOG_TYPE_DEFAULT, "%p updated Discovery %@ in ballot %p", buf, 0x20u);

      }
    }
    else
    {
      COCoreLogForCategory(11);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2112;
        v65 = v31;
        v66 = 2048;
        v67 = v20;
        _os_log_error_impl(&dword_215E92000, v34, OS_LOG_TYPE_ERROR, "%p cannot add Discovery %@ for %@ to ballot %p", buf, 0x2Au);
      }
    }

    goto LABEL_29;
  }
LABEL_31:
  -[COMeshController setBallot:](v9, "setBallot:", v20, v49);
  -[COBallot candidates](v20, "candidates");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshController _electionRequestWithBallot:generation:](v9, "_electionRequestWithBallot:generation:", v20, a3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v7;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v65) = 0;
  v39 = v13;
  v40 = v12;
  v41 = MEMORY[0x24BDAC760];
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke_85;
  v57[3] = &unk_24D4B1810;
  v61 = buf;
  v62 = a3;
  v42 = v37;
  v58 = v42;
  v43 = v38;
  v59 = v43;
  v44 = v20;
  v60 = v44;
  v45 = v40;
  v46 = v40;
  v13 = v39;
  objc_msgSend(v46, "enumerateObjectsUsingBlock:", v57);
  v53[0] = v41;
  v53[1] = 3221225472;
  v53[2] = __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke_2;
  v53[3] = &unk_24D4B1838;
  v53[4] = v9;
  v47 = v43;
  v54 = v47;
  v56 = a3;
  v48 = v44;
  v55 = v48;
  objc_msgSend(v39, "enumerateObjectsUsingBlock:", v53);
  if ((v51 & 1) == 0)
    -[COMeshController didTransitionToState:](v9, "didTransitionToState:", 2);
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24) && v52)
    -[COMeshController _transitionToPostElection](v9, "_transitionToPostElection");

  v7 = v50;
  v12 = v45;

  _Block_object_dispose(buf, 8);
LABEL_37:

}

uint64_t __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStartMeshController:", *(_QWORD *)(a1 + 32));
}

void __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke_85(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "state");
  if (v3 == 3)
  {
    v4 = a1[8];
    if (v4 != objc_msgSend(v10, "lastGenerationReceived"))
      goto LABEL_6;
    v5 = (void *)a1[4];
    objc_msgSend(v10, "lastBallotReceived");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v5) = objc_msgSend(v5, "isEqual:", v8);
    if ((v5 & 1) == 0)
    {
LABEL_6:
      if ((objc_msgSend(v10, "hasOutstandingRequest") & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
        objc_msgSend(v10, "setElectionStage:", 1);
        objc_msgSend(v10, "setState:", 2);
        objc_msgSend(v10, "setOutstandingRequest:", 1);
        objc_msgSend(v10, "node");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sendMeshRequest:", a1[5]);

        objc_msgSend(v10, "setLastGenerationSent:", a1[8]);
        objc_msgSend(v10, "setLastBallotSent:", a1[6]);
      }
    }
  }
  else if (v3 == 2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

void __77__COMeshController__performElectionGeneration_source_allowingPostTransition___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "hasOutstandingProbe") & 1) == 0)
  {
    COCoreLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      objc_msgSend(v3, "node");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218240;
      v9 = v5;
      v10 = 2048;
      v11 = v6;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p sending probe to %p", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(v3, "node");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendMeshRequest:", a1[5]);

    objc_msgSend(v3, "setElectionStage:", 1);
    objc_msgSend(v3, "setLastGenerationSent:", a1[7]);
    objc_msgSend(v3, "setLastBallotSent:", a1[6]);
    objc_msgSend(v3, "setOutstandingProbe:", 1);
  }

}

- (BOOL)_isElectionComplete
{
  COMeshController *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v2 = self;
  objc_sync_enter(v2);
  -[COMeshController trackers](v2, "trackers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__COMeshController__isElectionComplete__block_invoke;
  v5[3] = &unk_24D4B1860;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateNodeStateTrackersOfStatus:usingBlock:", 1, v5);

  objc_sync_exit(v2);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __39__COMeshController__isElectionComplete__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  if (result == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (void)_setupBrowsers
{
  NSObject *v3;
  CORapportBrowser *v4;
  void *v5;
  CORapportBrowser *rapportBrowser;
  CORapportBrowser *v7;
  COBallotBrowser *v8;
  COBallotBrowser *ballotBrowser;
  COBallotBrowser *v10;
  COIDSBrowser *v11;
  void *v12;
  void *v13;
  COIDSBrowser *v14;
  COIDSBrowser *idsBrowser;
  COIDSBrowser *v16;

  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_rapportBrowser)
  {
    v4 = objc_alloc_init(CORapportBrowser);
    -[COMeshController companionLinkClientFactory](self, "companionLinkClientFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[CORapportBrowser setCompanionLinkClientFactory:](v4, "setCompanionLinkClientFactory:", v5);
    rapportBrowser = self->_rapportBrowser;
    self->_rapportBrowser = v4;
    v7 = v4;

    -[COMeshController addBrowser:](self, "addBrowser:", v7);
  }
  if (!self->_ballotBrowser)
  {
    v8 = -[COBallotBrowser initWithDiscoveryDelay:]([COBallotBrowser alloc], "initWithDiscoveryDelay:", 30.0);
    -[COBallotBrowser setRapportBrowser:](v8, "setRapportBrowser:", self->_rapportBrowser);
    ballotBrowser = self->_ballotBrowser;
    self->_ballotBrowser = v8;
    v10 = v8;

    -[COMeshController addBrowser:](self, "addBrowser:", v10);
  }
  if (self->_globalServiceName)
  {
    if (!self->_idsBrowser)
    {
      v11 = [COIDSBrowser alloc];
      -[COMeshController meshName](self, "meshName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshController globalServiceName](self, "globalServiceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[COIDSBrowser initWithMeshName:idsServiceName:](v11, "initWithMeshName:idsServiceName:", v12, v13);

      idsBrowser = self->_idsBrowser;
      self->_idsBrowser = v14;
      v16 = v14;

      -[COMeshController addBrowser:](self, "addBrowser:", v16);
    }
  }
}

- (id)_constituentCharacteristics:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = objc_msgSend(v4, "device");
  v6 = objc_msgSend(v4, "flags");

  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%d, %llu"), v5, v6);
}

- (id)_nodeDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "remote");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destinationDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "destinationDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v5, "connectionType");
    if (v13 > 2)
      v14 = 0;
    else
      v14 = off_24D4B1A10[v13];
    v16 = objc_msgSend(v5, "discoveryType");
    v17 = 67;
    if ((v16 & 2) == 0)
      v17 = 99;
    v18 = 82;
    if ((v16 & 1) == 0)
      v18 = 114;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c"), v18, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[COMeshController me](self, "me");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = 0;
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[COMeshNode : %p] %@ [Name] - %@ [Rapport ID] - %@ [Conn] - %@ [Disc] - %@"), v5, v6, v9, v12, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_logElectionSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  _QWORD v31[6];
  _QWORD v32[6];
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  COMeshController *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[COMeshController ballot](self, "ballot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__9;
  v40 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[COMeshController trackers](self, "trackers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __39__COMeshController__logElectionSummary__block_invoke;
  v33[3] = &unk_24D4B1888;
  v35 = &v36;
  v33[4] = self;
  v8 = v5;
  v34 = v8;
  objc_msgSend(v6, "enumerateNodeStateTrackersOfStatus:usingBlock:", 1, v33);

  v9 = (void *)v37[5];
  -[COMeshController _nodeDetails:](self, "_nodeDetails:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("%@\n"), v10);

  -[COMeshController me](self, "me");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v11);

  COCoreLogForCategory(8);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshController meshName](self, "meshName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[COMeshController generation](self, "generation");
    v15 = (void *)v37[5];
    *(_DWORD *)buf = 134218754;
    v43 = self;
    v44 = 2114;
    v45 = v13;
    v46 = 2048;
    v47 = v14;
    v48 = 2114;
    v49 = v15;
    _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p %{public}@ : Candidate summary for Election(%llu)\n%{public}@", buf, 0x2Au);

  }
  if (objc_msgSend(v8, "count"))
  {
    COCoreLogForCategory(8);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[COMeshController meshName](self, "meshName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[COMeshController generation](self, "generation");
      *(_DWORD *)buf = 134218754;
      v43 = self;
      v44 = 2114;
      v45 = v29;
      v46 = 2048;
      v47 = v30;
      v48 = 2112;
      v49 = v8;
      _os_log_error_impl(&dword_215E92000, v16, OS_LOG_TYPE_ERROR, "%p %{public}@ : Ballot contituents and active trackers are mismatched for Election(%llu). Constituents not found in active trackers = %@", buf, 0x2Au);

    }
  }
  v17 = (void *)v37[5];
  v37[5] = 0;

  -[COMeshController trackers](self, "trackers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __39__COMeshController__logElectionSummary__block_invoke_104;
  v32[3] = &unk_24D4B18B0;
  v32[4] = self;
  v32[5] = &v36;
  objc_msgSend(v18, "enumerateNodeStateTrackersOfStatus:usingBlock:", 2, v32);

  COCoreLogForCategory(8);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshController meshName](self, "meshName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[COMeshController generation](self, "generation");
    v22 = (void *)v37[5];
    *(_DWORD *)buf = 134218754;
    v43 = self;
    v44 = 2114;
    v45 = v20;
    v46 = 2048;
    v47 = v21;
    v48 = 2114;
    v49 = v22;
    _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%p %{public}@ : Dormant trackers summary for Election(%llu)\n%{public}@", buf, 0x2Au);

  }
  v23 = (void *)v37[5];
  v37[5] = 0;

  -[COMeshController trackers](self, "trackers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __39__COMeshController__logElectionSummary__block_invoke_105;
  v31[3] = &unk_24D4B18B0;
  v31[4] = self;
  v31[5] = &v36;
  objc_msgSend(v24, "enumerateNodeStateTrackersOfStatus:usingBlock:", 0, v31);

  COCoreLogForCategory(8);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshController meshName](self, "meshName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[COMeshController generation](self, "generation");
    v28 = (void *)v37[5];
    *(_DWORD *)buf = 134218754;
    v43 = self;
    v44 = 2114;
    v45 = v26;
    v46 = 2048;
    v47 = v27;
    v48 = 2114;
    v49 = v28;
    _os_log_impl(&dword_215E92000, v25, OS_LOG_TYPE_DEFAULT, "%p %{public}@ : Discovered trackers summary for Election(%llu)\n%{public}@", buf, 0x2Au);

  }
  _Block_object_dispose(&v36, 8);

}

void __39__COMeshController__logElectionSummary__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v4 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v5, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_nodeDetails:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v7);

  v8 = (void *)a1[5];
  objc_msgSend(v5, "node");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "remote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

}

void __39__COMeshController__logElectionSummary__block_invoke_104(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v11 = v3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v11;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v3, "node");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_nodeDetails:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v10);

}

void __39__COMeshController__logElectionSummary__block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v11 = v3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v11;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v3, "node");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_nodeDetails:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v10);

}

- (void)_processBackedOffNodesExcludingTracker:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  COMeshElectionRequest *v7;
  void *v8;
  COMeshElectionRequest *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  COMeshController *v14;
  COMeshElectionRequest *v15;
  unint64_t v16;

  v4 = a3;
  if ((self->_internalFlags & 1) != 0)
  {
    COCoreLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[COMeshController _processBackedOffNodesExcludingTracker:].cold.1();
  }
  else
  {
    -[COMeshController ballot](self, "ballot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[COMeshController generation](self, "generation");
    v7 = -[COMeshBaseBallotRequest initWithBallot:generation:]([COMeshElectionRequest alloc], "initWithBallot:generation:", v5, v6);
    -[COMeshController trackers](self, "trackers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__COMeshController__processBackedOffNodesExcludingTracker___block_invoke;
    v11[3] = &unk_24D4B18D8;
    v12 = v4;
    v13 = v5;
    v15 = v7;
    v16 = v6;
    v14 = self;
    v9 = v7;
    v10 = v5;
    objc_msgSend(v8, "enumerateNodeStateTrackersUsingBlock:", v11);

  }
}

void __59__COMeshController__processBackedOffNodesExcludingTracker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 2 && (objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(v3, "lastBallotSent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToBallot:", *(_QWORD *)(a1 + 40));

    v6 = objc_msgSend(v3, "lastGenerationSent");
    if ((!v5 || v6 != *(_QWORD *)(a1 + 64))
      && (!objc_msgSend(v3, "electionStage") || objc_msgSend(v3, "electionStage") == 4))
    {
      objc_msgSend(v3, "backoffResponse");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v3, "setLastGenerationSent:", *(_QWORD *)(a1 + 64));
        objc_msgSend(v3, "setLastBallotSent:", *(_QWORD *)(a1 + 40));
        COCoreLogForCategory(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 48);
          v10 = *(_QWORD *)(a1 + 64);
          objc_msgSend(v3, "node");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 134218496;
          v20 = v9;
          v21 = 2048;
          v22 = v10;
          v23 = 2048;
          v24 = v11;
          _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p delayed BALLOT (%llu) to %p", (uint8_t *)&v19, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 48), "_ballotResponseWithBallot:generation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v12, 0);

        objc_msgSend(v3, "setBackoffResponse:", 0);
      }
      else if ((objc_msgSend(v3, "hasOutstandingRequest") & 1) == 0)
      {
        objc_msgSend(v3, "setLastGenerationSent:", *(_QWORD *)(a1 + 64));
        objc_msgSend(v3, "setLastBallotSent:", *(_QWORD *)(a1 + 40));
        COCoreLogForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v3, "node");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          v19 = 134218496;
          v20 = v14;
          if (v5)
            v17 = 103;
          else
            v17 = 98;
          v21 = 2048;
          v22 = v15;
          v23 = 1024;
          LODWORD(v24) = v17;
          _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p resend election to %p because our %c has changed", (uint8_t *)&v19, 0x1Cu);

        }
        objc_msgSend(v3, "setElectionStage:", 1);
        objc_msgSend(v3, "node");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendMeshRequest:", *(_QWORD *)(a1 + 56));

      }
    }
  }

}

- (void)_transitionToPostElection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p not transitioning because not in election", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleElectionRequest:(id)a3 onNode:(id)a4 responseCallBack:(id)a5
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  COMeshController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void (**v38)(id, void *, _QWORD);
  void *v39;
  id v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  COMeshController *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  _BYTE v48[14];
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v42 = a4;
  v38 = (void (**)(id, void *, _QWORD))a5;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v42, "remote");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v40, "generation");
  v10 = objc_msgSend(v40, "variant");
  objc_msgSend(v40, "ballot");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v39, "software");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v40, "rapportTransactionID");
    objc_msgSend(v41, "candidates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    objc_msgSend(v41, "candidates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 134219778;
    v44 = self;
    v45 = 2048;
    v46 = v9;
    v47 = 1024;
    *(_DWORD *)v48 = v10;
    *(_WORD *)&v48[4] = 2048;
    *(_QWORD *)&v48[6] = v42;
    v49 = 2114;
    v50 = v12;
    v51 = 2048;
    v52 = v13;
    v53 = 2048;
    v54 = v15;
    v55 = 2114;
    v56 = v17;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p received ELECTION (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);

  }
  v18 = self;
  objc_sync_enter(v18);
  -[COMeshController trackers](v18, "trackers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nodeStateTrackerForNode:", v42);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v18);
  objc_msgSend(v20, "setState:", 2);
  if ((v18->_internalFlags & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v42, "remote");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "supportsBackoff") & 1) != 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v20, "lastBallotReceived");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqualToBallot:", v41) & 1) == 0)
  {

    goto LABEL_10;
  }
  v23 = objc_msgSend(v20, "lastGenerationReceived") == v9;

  if (v23)
  {
    objc_msgSend(v20, "setElectionStage:", 4);
    objc_msgSend(v20, "setBackoffResponse:", v38);
    COCoreLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v44 = v18;
      v45 = 2048;
      v46 = (uint64_t)v42;
      _os_log_impl(&dword_215E92000, v24, OS_LOG_TYPE_DEFAULT, "%p backed off legacy node %p", buf, 0x16u);
    }
    goto LABEL_24;
  }
LABEL_11:
  objc_msgSend(v20, "setLastGenerationReceived:", v9);
  objc_msgSend(v20, "setLastBallotReceived:", v41);
  if (!-[COMeshController _isCurrentElectionVariant:](v18, "_isCurrentElectionVariant:", v10))
  {
    -[COMeshController ballot](v18, "ballot");
    v24 = objc_claimAutoreleasedReturnValue();
    v29 = -[COMeshController generation](v18, "generation");
    if ((-[NSObject isEqualToBallot:](v24, "isEqualToBallot:", v41) & 1) == 0)
    {
      -[COMeshController _currentBallotMergedWithBallot:](v18, "_currentBallotMergedWithBallot:", v41);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLastBallotSent:", v30);
      -[NSObject candidates](v24, "candidates");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "candidates");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v33) = objc_msgSend(v32, "isEqual:", v34);
      if ((_DWORD)v33)
      {
        COCoreLogForCategory(0);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          v44 = v18;
          v45 = 2048;
          v46 = v29;
          v47 = 2048;
          *(_QWORD *)v48 = v42;
          _os_log_debug_impl(&dword_215E92000, v35, OS_LOG_TYPE_DEBUG, "%p performing fast election (%llu) with %p", buf, 0x20u);
        }

        -[COMeshController _acceptResponseWithBallot:generation:](v18, "_acceptResponseWithBallot:generation:", v30, v29);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2](v38, v36, 0);

        objc_msgSend(v20, "setState:", 3);
        if (-[COMeshController _isElectionComplete](v18, "_isElectionComplete"))
          -[COMeshController _transitionToPostElection](v18, "_transitionToPostElection");
        goto LABEL_23;
      }
      -[COMeshController _performElectionGeneration:source:allowingPostTransition:](v18, "_performElectionGeneration:source:allowingPostTransition:", -[COMeshController generation](v18, "generation"), v39, 1);

    }
    -[COMeshController ballot](v18, "ballot");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshController _ballotResponseWithBallot:generation:](v18, "_ballotResponseWithBallot:generation:", v30, v29);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2](v38, v37, 0);

LABEL_23:
    goto LABEL_24;
  }
  objc_msgSend(v40, "ballot");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshController _handleDiscoveryUsingBallot:](v18, "_handleDiscoveryUsingBallot:", v25);

  -[COMeshController _performElectionGeneration:source:allowingPostTransition:](v18, "_performElectionGeneration:source:allowingPostTransition:", v9, v39, 1);
  -[COMeshController ballot](v18, "ballot");
  v24 = objc_claimAutoreleasedReturnValue();
  v26 = -[COMeshController generation](v18, "generation");
  objc_msgSend(v20, "setElectionStage:", 0);
  objc_msgSend(v20, "setLastBallotSent:", v24);
  objc_msgSend(v20, "setLastGenerationSent:", v26);
  COCoreLogForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v44 = v18;
    v45 = 2048;
    v46 = v26;
    v47 = 2048;
    *(_QWORD *)v48 = v42;
    _os_log_debug_impl(&dword_215E92000, v27, OS_LOG_TYPE_DEBUG, "%p sending BALLOT (%llu) to %p", buf, 0x20u);
  }

  -[COMeshController _ballotResponseWithBallot:generation:](v18, "_ballotResponseWithBallot:generation:", v24, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2](v38, v28, 0);

  -[COMeshController _processBackedOffNodesExcludingTracker:](v18, "_processBackedOffNodesExcludingTracker:", v20);
LABEL_24:

}

- (void)_handleBallotResponse:(id)a3 onNode:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  COMeshController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  COMeshController *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  _BYTE v52[34];
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v46 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v46, "remote");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v45, "generation");
  v8 = objc_msgSend(v45, "variant");
  objc_msgSend(v45, "ballot");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v43, "software");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v45, "rapportTransactionID");
    objc_msgSend(v44, "candidates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    objc_msgSend(v44, "candidates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 134219778;
    v48 = self;
    v49 = 2048;
    v50 = v7;
    v51 = 1024;
    *(_DWORD *)v52 = v8;
    *(_WORD *)&v52[4] = 2048;
    *(_QWORD *)&v52[6] = v46;
    *(_WORD *)&v52[14] = 2114;
    *(_QWORD *)&v52[16] = v10;
    *(_WORD *)&v52[24] = 2048;
    *(_QWORD *)&v52[26] = v11;
    v53 = 2048;
    v54 = v13;
    v55 = 2114;
    v56 = v15;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p received BALLOT (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);

  }
  v16 = self;
  objc_sync_enter(v16);
  -[COMeshController trackers](v16, "trackers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "nodeStateTrackerForNode:", v46);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v16);
  objc_msgSend(v18, "setState:", 2);
  objc_msgSend(v18, "setLastGenerationReceived:", v7);
  objc_msgSend(v18, "setLastBallotReceived:", v44);
  objc_msgSend(v18, "setOutstandingRequest:", 0);
  if (!-[COMeshController _isCurrentElectionVariant:](v16, "_isCurrentElectionVariant:", v8))
  {
    -[COMeshController ballot](v16, "ballot");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "ballot");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "candidates");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "candidates");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v32) = objc_msgSend(v31, "isEqual:", v33);
    if ((_DWORD)v32)
    {
      objc_msgSend(v18, "setLastBallotSent:", v29);
      -[COMeshController _voteRequestWithBallot:generation:](v16, "_voteRequestWithBallot:generation:", v29, -[COMeshController generation](v16, "generation"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "sendMeshRequest:", v34);

    }
    else
    {
      objc_msgSend(v18, "setState:", 3);
      -[COMeshController _performElectionGeneration:source:allowingPostTransition:](v16, "_performElectionGeneration:source:allowingPostTransition:", -[COMeshController generation](v16, "generation"), v43, 1);
    }

    goto LABEL_33;
  }
  objc_msgSend(v45, "ballot");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshController _handleDiscoveryUsingBallot:](v16, "_handleDiscoveryUsingBallot:", v19);

  if (-[COMeshController generation](v16, "generation") != v7)
  {
    -[COMeshController _performElectionGeneration:source:allowingPostTransition:](v16, "_performElectionGeneration:source:allowingPostTransition:", v7, v43, 1);
    v35 = -[COMeshController generation](v16, "generation");
    -[COMeshController ballot](v16, "ballot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLastBallotSent:", v21);
    objc_msgSend(v18, "setLastGenerationSent:", v35);
    objc_msgSend(v18, "setElectionStage:", 1);
    objc_msgSend(v18, "setOutstandingRequest:", 1);
    -[COMeshController _electionRequestWithBallot:generation:](v16, "_electionRequestWithBallot:generation:", v21, v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sendMeshRequest:", v23);
LABEL_32:

    -[COMeshController _processBackedOffNodesExcludingTracker:](v16, "_processBackedOffNodesExcludingTracker:", v18);
    goto LABEL_33;
  }
  -[COMeshController ballot](v16, "ballot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(v21, "candidates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addCandidate:", v43);
  objc_msgSend(v46, "discoveryRecord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24 || !objc_msgSend(v24, "shouldAdvertise"))
  {
    COCoreLogForCategory(11);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219010;
      v48 = v16;
      v49 = 2112;
      v50 = (uint64_t)v25;
      v51 = 2112;
      *(_QWORD *)v52 = v46;
      *(_WORD *)&v52[8] = 2048;
      *(_QWORD *)&v52[10] = v21;
      *(_WORD *)&v52[18] = 2112;
      *(_QWORD *)&v52[20] = v45;
      _os_log_error_impl(&dword_215E92000, v26, OS_LOG_TYPE_ERROR, "%p cannot add Discovery %@ for %@ to ballot %p when handling response %@", buf, 0x34u);
    }
    goto LABEL_17;
  }
  if (objc_msgSend(v21, "addDiscoveryRecord:", v25))
  {
    COCoreLogForCategory(11);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v21, "discovery");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v48 = v16;
      v49 = 2112;
      v50 = (uint64_t)v27;
      v51 = 2048;
      *(_QWORD *)v52 = v21;
      _os_log_impl(&dword_215E92000, v26, OS_LOG_TYPE_DEFAULT, "%p updated Discovery %@ in ballot %p when handling response", buf, 0x20u);

    }
LABEL_17:

  }
  -[COMeshController setBallot:](v16, "setBallot:", v21);
  objc_msgSend(v44, "candidates");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v36) = objc_msgSend(v23, "isEqual:", v37);
  if ((_DWORD)v36)
  {
    objc_msgSend(v18, "setLastBallotSent:", v21);
    objc_msgSend(v18, "setLastGenerationSent:", v7);
    objc_msgSend(v18, "setElectionStage:", 3);
    objc_msgSend(v18, "setOutstandingRequest:", 1);
    -[COMeshController _voteRequestWithBallot:generation:](v16, "_voteRequestWithBallot:generation:", v21, v7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sendMeshRequest:", v38);
LABEL_31:

    goto LABEL_32;
  }
  if (v23 && (objc_msgSend(v23, "isEqual:", v43) & 1) == 0)
    -[COMeshController _pingLeader](v16, "_pingLeader");
  -[COMeshController _performElectionGeneration:source:allowingPostTransition:](v16, "_performElectionGeneration:source:allowingPostTransition:", v7, v43, 1);
  if ((v16->_internalFlags & 1) != 0)
    goto LABEL_30;
  objc_msgSend(v18, "lastBallotSent");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "isEqualToBallot:", v21) & 1) == 0)
  {

    goto LABEL_30;
  }
  v40 = objc_msgSend(v18, "lastGenerationSent") == v7;

  if (!v40)
  {
LABEL_30:
    objc_msgSend(v18, "setElectionStage:", 1);
    objc_msgSend(v18, "setLastBallotSent:", v21);
    objc_msgSend(v18, "setLastGenerationSent:", v7);
    objc_msgSend(v18, "setOutstandingRequest:", 1);
    -[COMeshController ballot](v16, "ballot");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshController _electionRequestWithBallot:generation:](v16, "_electionRequestWithBallot:generation:", v38, -[COMeshController generation](v16, "generation"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sendMeshRequest:", v42);

    goto LABEL_31;
  }
  objc_msgSend(v18, "setElectionStage:", 4);
  COCoreLogForCategory(0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v48 = v16;
    v49 = 2048;
    v50 = (uint64_t)v46;
    _os_log_impl(&dword_215E92000, v41, OS_LOG_TYPE_DEFAULT, "%p backed off %p", buf, 0x16u);
  }

LABEL_33:
}

- (void)_handleVoteRequest:(id)a3 onNode:(id)a4 responseCallBack:(id)a5
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  COMeshController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(id, void *, _QWORD);
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  COMeshController *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v42 = a4;
  v39 = (void (**)(id, void *, _QWORD))a5;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v42, "remote");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v41, "generation");
  v10 = objc_msgSend(v41, "variant");
  objc_msgSend(v41, "ballot");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v38, "software");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v41, "rapportTransactionID");
    objc_msgSend(v40, "candidates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    objc_msgSend(v40, "candidates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 134219778;
    v44 = self;
    v45 = 2048;
    v46 = v9;
    v47 = 1024;
    v48 = v10;
    v49 = 2048;
    v50 = v42;
    v51 = 2114;
    v52 = v12;
    v53 = 2048;
    v54 = v13;
    v55 = 2048;
    v56 = v15;
    v57 = 2114;
    v58 = v17;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p received VOTE (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);

  }
  v18 = self;
  objc_sync_enter(v18);
  -[COMeshController trackers](v18, "trackers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nodeStateTrackerForNode:", v42);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v18);
  objc_msgSend(v20, "setLastGenerationReceived:", v9);
  objc_msgSend(v20, "setLastBallotReceived:", v40);
  objc_msgSend(v20, "setElectionStage:", 0);
  if (-[COMeshController _isCurrentElectionVariant:](v18, "_isCurrentElectionVariant:", v10))
  {
    objc_msgSend(v41, "ballot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshController _handleDiscoveryUsingBallot:](v18, "_handleDiscoveryUsingBallot:", v21);

    -[COMeshController ballot](v18, "ballot");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[COMeshController generation](v18, "generation");
    if (v23 != v9)
      goto LABEL_11;
    objc_msgSend(v22, "candidates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "candidates");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v26) = objc_msgSend(v25, "isEqual:", v27);
    if ((_DWORD)v26)
    {
      objc_msgSend(v20, "setLastBallotSent:", v22);
      objc_msgSend(v20, "setLastGenerationSent:", v9);
      -[COMeshController _acceptResponseWithBallot:generation:](v18, "_acceptResponseWithBallot:generation:", v22, v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2](v39, v28, 0);

      objc_msgSend(v20, "setState:", 3);
      if (-[COMeshController _isElectionComplete](v18, "_isElectionComplete"))
        -[COMeshController _transitionToPostElection](v18, "_transitionToPostElection");
    }
    else
    {
LABEL_11:
      objc_msgSend(v20, "setLastBallotSent:", v22);
      objc_msgSend(v20, "setLastGenerationSent:", v9);
      -[COMeshController _ballotResponseWithBallot:generation:](v18, "_ballotResponseWithBallot:generation:", v22, v23);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2](v39, v35, 0);

    }
  }
  else
  {
    -[COMeshController ballot](v18, "ballot");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "ballot");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "candidates");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "candidates");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v32) = objc_msgSend(v31, "isEqual:", v33);
    if ((_DWORD)v32)
    {
      -[COMeshController _acceptResponseWithBallot:generation:](v18, "_acceptResponseWithBallot:generation:", v22, -[COMeshController generation](v18, "generation"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2](v39, v34, 0);

      objc_msgSend(v20, "setState:", 3);
      if (-[COMeshController _isElectionComplete](v18, "_isElectionComplete"))
        -[COMeshController _transitionToPostElection](v18, "_transitionToPostElection");
    }
    else
    {
      -[COMeshController _currentBallotMergedWithBallot:](v18, "_currentBallotMergedWithBallot:", v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLastBallotSent:", v36);
      -[COMeshController _ballotResponseWithBallot:generation:](v18, "_ballotResponseWithBallot:generation:", v36, -[COMeshController generation](v18, "generation"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2](v39, v37, 0);

    }
  }

}

- (void)_handleAcceptResponse:(id)a3 onNode:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  COMeshController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  COMeshController *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  int v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v43 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v43, "remote");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v42, "generation");
  v8 = objc_msgSend(v42, "variant");
  objc_msgSend(v42, "ballot");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v40, "software");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v42, "rapportTransactionID");
    objc_msgSend(v41, "candidates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    objc_msgSend(v41, "candidates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 134219778;
    v45 = self;
    v46 = 2048;
    v47 = v7;
    v48 = 1024;
    v49 = v8;
    v50 = 2048;
    v51 = v43;
    v52 = 2114;
    v53 = v10;
    v54 = 2048;
    v55 = v11;
    v56 = 2048;
    v57 = v13;
    v58 = 2114;
    v59 = v15;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p received ACCEPT (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);

  }
  v16 = self;
  objc_sync_enter(v16);
  -[COMeshController trackers](v16, "trackers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "nodeStateTrackerForNode:", v43);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v16);
  objc_msgSend(v18, "setLastGenerationReceived:", v7);
  objc_msgSend(v18, "setLastBallotReceived:", v41);
  objc_msgSend(v18, "setOutstandingRequest:", 0);
  if (-[COMeshController _isCurrentElectionVariant:](v16, "_isCurrentElectionVariant:", v8))
  {
    objc_msgSend(v42, "ballot");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshController _handleDiscoveryUsingBallot:](v16, "_handleDiscoveryUsingBallot:", v19);

    -[COMeshController ballot](v16, "ballot");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[COMeshController generation](v16, "generation");
    if (v21 == v7)
    {
      objc_msgSend(v20, "candidates");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "candidates");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v24) = objc_msgSend(v23, "isEqual:", v25);
      if ((_DWORD)v24)
      {
        objc_msgSend(v18, "setLastBallotSent:", v20);
        objc_msgSend(v18, "setLastGenerationSent:", v7);
        objc_msgSend(v18, "setState:", 3);
        objc_msgSend(v18, "setElectionStage:", 0);
        if (-[COMeshController _isElectionComplete](v16, "_isElectionComplete"))
          -[COMeshController _transitionToPostElection](v16, "_transitionToPostElection");
        goto LABEL_25;
      }
    }
    if ((v16->_internalFlags & 1) == 0)
    {
      objc_msgSend(v18, "lastBallotSent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "isEqualToBallot:", v20) & 1) != 0)
      {
        v32 = objc_msgSend(v18, "lastGenerationSent") == v7;

        if (v32)
        {
          objc_msgSend(v18, "setElectionStage:", 4);
          COCoreLogForCategory(0);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v45 = v16;
            v46 = 2048;
            v47 = (uint64_t)v43;
            _os_log_impl(&dword_215E92000, v33, OS_LOG_TYPE_DEFAULT, "%p backed off %p", buf, 0x16u);
          }

          goto LABEL_25;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v18, "setLastBallotSent:", v20);
    objc_msgSend(v18, "setLastGenerationSent:", v7);
    objc_msgSend(v18, "setElectionStage:", 1);
    objc_msgSend(v18, "setOutstandingRequest:", 1);
    -[COMeshController _electionRequestWithBallot:generation:](v16, "_electionRequestWithBallot:generation:", v20, v21);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "sendMeshRequest:", v39);

    goto LABEL_25;
  }
  objc_msgSend(v18, "setState:", 3);
  -[COMeshController ballot](v16, "ballot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "ballot");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "candidates");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "candidates");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v29) = objc_msgSend(v28, "isEqual:", v30);
  if ((_DWORD)v29)
  {
    if (-[COMeshController _isElectionComplete](v16, "_isElectionComplete"))
      -[COMeshController _transitionToPostElection](v16, "_transitionToPostElection");
  }
  else
  {
    -[COMeshController _currentBallotMergedWithBallot:](v16, "_currentBallotMergedWithBallot:", v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshController setBallot:](v16, "setBallot:", v34);
    objc_msgSend(v20, "candidates");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "candidates");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v37) = objc_msgSend(v36, "isEqual:", v38);
    if ((_DWORD)v37)
    {
      if (-[COMeshController _isElectionComplete](v16, "_isElectionComplete"))
        -[COMeshController _transitionToPostElection](v16, "_transitionToPostElection");
    }
    else
    {
      -[COMeshController _performElectionGeneration:source:allowingPostTransition:](v16, "_performElectionGeneration:source:allowingPostTransition:", -[COMeshController generation](v16, "generation"), 0, 1);
    }

  }
LABEL_25:

}

- (void)_handleDiscoveryUsingBallot:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  COMeshController *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "discovery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v6 = 134217984;
    v19 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[COMeshController me](self, "me", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
        {
          COCoreLogForCategory(0);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v19;
            v25 = self;
            _os_log_debug_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEBUG, "%p ignoring discovery of myself", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v4, "objectForKey:", v11);
          v14 = objc_claimAutoreleasedReturnValue();
          -[COMeshController discoveryManager](self, "discoveryManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v8 |= objc_msgSend(v15, "addDiscoveryRecord:", v14);

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);
    if ((v8 & 1) != 0)
    {
      COCoreLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[COMeshController discoveryManager](self, "discoveryManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 134218240;
        v25 = self;
        v26 = 2048;
        v27 = v18;
        _os_log_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEFAULT, "%p Discovery (IP) has %ld queued records", buf, 0x16u);

      }
    }
  }

}

- (id)_handleDiscoveryUsingElectionRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v18;
  COMeshController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254E1B9B0))
    v5 = objc_msgSend(v4, "listeningPort");
  else
    v5 = 0;
  objc_msgSend(v4, "_sendingConstituent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rapportOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE7CCF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE7CD00]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE7CCC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && objc_msgSend(v8, "length")
    && objc_msgSend(v9, "length")
    && objc_msgSend(v10, "length")
    && (+[CODiscoveryRecord discoveryRecordWithConstituent:rapportIdentifier:IDSIdentifier:peerAddress:port:](CODiscoveryRecord, "discoveryRecordWithConstituent:rapportIdentifier:IDSIdentifier:peerAddress:port:", v6, v8, v9, v10, v5), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    COCoreLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134218242;
      v19 = self;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p discovered (election) %@", (uint8_t *)&v18, 0x16u);
    }

    -[COMeshController listener](self, "listener");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject _handleDiscoveryRecord:](v14, "_handleDiscoveryRecord:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    COCoreLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[COMeshController _handleDiscoveryUsingElectionRequest:].cold.1();
    v12 = 0;
    v15 = 0;
  }

  v16 = v15;
  return v16;
}

- (void)_finalizeCompletionOfNode:(id)a3 memberOfMesh:(BOOL)a4 eventProvider:(id)a5
{
  _BOOL4 v6;
  id v8;
  COMeshController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  COMeshController *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  COMeshController *v30;
  void *v31;
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[5];
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  COMeshController *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v6 = a4;
  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v42 = a5;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v9 = self;
  objc_sync_enter(v9);
  -[COMeshController trackers](v9, "trackers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke;
  v60[3] = &unk_24D4B1860;
  v60[4] = &v61;
  objc_msgSend(v10, "enumerateNodeStateTrackersUsingBlock:", v60);

  v11 = -[COMeshController state](v9, "state");
  -[COMeshController addOns](v9, "addOns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  if (v6)
  {
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_2;
    v59[3] = &unk_24D4B1608;
    v59[4] = v9;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v59);
  }
  if (v11 == 4)
  {
    if (!v62[3])
    {
      -[COMeshController willTransitionToState:](v9, "willTransitionToState:", 0);
      v13 = v9;
      objc_sync_enter(v13);
      v13->_state = 0;
      objc_sync_exit(v13);

      -[COMeshController setListener:](v13, "setListener:", 0);
      -[COMeshController didTransitionToState:](v13, "didTransitionToState:", 0);
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_160;
      v43[3] = &unk_24D4B1608;
      v43[4] = v13;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v43);
    }
  }
  else
  {
    objc_msgSend(v8, "remote");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      -[COMeshController ballot](v9, "ballot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v41, "candidates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "removeCandidate:", v40);
      -[COMeshController setBallot:](v9, "setBallot:", v41);
      -[COMeshController sentCommands](v9, "sentCommands");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_3;
      v55[3] = &unk_24D4B1900;
      v57 = v17;
      v58 = v18;
      v19 = v8;
      v56 = v19;
      objc_msgSend(v16, "indexesOfObjectsPassingTest:", v55);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshControllerErrorDomain"), -4100, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_4;
      v52[3] = &unk_24D4B1928;
      v21 = v16;
      v53 = v21;
      v35 = v20;
      v54 = v35;
      objc_msgSend(v39, "enumerateIndexesUsingBlock:", v52);
      objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v21, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeIndexes:", v39);
      objc_msgSend(v21, "objectsAtIndexes:", v38);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[COMeshController setSentCommands:](v9, "setSentCommands:", v37);
      if (v11)
      {
        if (objc_msgSend(v36, "isEqual:", v40))
        {
          v22 = objc_alloc_init(MEMORY[0x24BDD1698]);
          v23 = objc_alloc_init(MEMORY[0x24BDD1698]);
          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_5;
          v46[3] = &unk_24D4B1950;
          v50 = v17;
          v51 = v18;
          v24 = v22;
          v47 = v24;
          v48 = v19;
          v25 = v23;
          v49 = v25;
          objc_msgSend(v37, "enumerateObjectsUsingBlock:", v46);
          if (objc_msgSend(v24, "count"))
          {
            objc_msgSend(v37, "objectsAtIndexes:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[COMeshController queuedCommands](v9, "queuedCommands");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[COMeshController setQueuedCommands:](v9, "setQueuedCommands:", v28);

          }
          if (objc_msgSend(v25, "count"))
            objc_msgSend(v37, "objectsAtIndexes:", v25);
          else
            objc_msgSend(MEMORY[0x24BDBCE30], "array");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[COMeshController setSentCommands:](v9, "setSentCommands:", v29);

          v30 = v9;
          objc_sync_enter(v30);
          -[COMeshController setLeader:](v30, "setLeader:", 0);
          objc_sync_exit(v30);

          if (!v42)
          {
            -[COMeshController label](v30, "label");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v44[0] = MEMORY[0x24BDAC760];
            v44[1] = 3221225472;
            v44[2] = __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_6;
            v44[3] = &unk_24D4B1978;
            v45 = v31;
            v32 = v31;
            v42 = (id)MEMORY[0x2199F3D40](v44);

          }
          -[COMeshController recorder](v30, "recorder");
          v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, const __CFString *, id))v33)[2](v33, CFSTR("com.apple.CoordinationCore.MeshLostLeader"), v42);

          COCoreLogForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v66 = v30;
            v67 = 2112;
            v68 = v40;
            _os_log_impl(&dword_215E92000, v34, OS_LOG_TYPE_DEFAULT, "%p lost leader %@", buf, 0x16u);
          }

          -[COMeshController _performElectionGeneration:source:allowingPostTransition:](v30, "_performElectionGeneration:source:allowingPostTransition:", -[COMeshController generation](v30, "generation"), 0, 1);
        }
        else if (v11 == 2 && -[COMeshController _isElectionComplete](v9, "_isElectionComplete"))
        {
          -[COMeshController _transitionToPostElection](v9, "_transitionToPostElection");
        }
      }

    }
  }

  _Block_object_dispose(&v61, 8);
}

uint64_t __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  if (result == 4)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didChangeNodesForMeshController:", *(_QWORD *)(a1 + 32));
}

BOOL __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == *(void **)(a1 + 32);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeCallbackWithError:", *(_QWORD *)(a1 + 40));

}

void __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id *v7;
  id v8;

  v8 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (id *)(a1 + 32);
    goto LABEL_6;
  }
  objc_msgSend(v8, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);

  if (v5 != v6)
  {
    v7 = (id *)(a1 + 48);
LABEL_6:
    objc_msgSend(*v7, "addIndex:", a3);
  }

}

id __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x24D4B4878;
  v3[1] = 0x24D4B5418;
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = 0x24D4B55D8;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __73__COMeshController__finalizeCompletionOfNode_memberOfMesh_eventProvider___block_invoke_160(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStopMeshController:", *(_QWORD *)(a1 + 32));
}

- (void)_performStopOfNode:(id)a3 error:(id)a4 eventProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  COMeshController *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  COMeshController *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  COCoreLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218240;
    v18 = self;
    v19 = 2048;
    v20 = v8;
    _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p stopping %p", (uint8_t *)&v17, 0x16u);
  }

  v13 = self;
  objc_sync_enter(v13);
  -[COMeshController trackers](v13, "trackers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9)
  {
    objc_msgSend(v14, "setNodeDormant:withState:error:", v8, 0, v9);
  }
  else
  {
    objc_msgSend(v14, "nodeStateTrackerForNode:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setState:", 0);

  }
  objc_sync_exit(v13);

  -[COMeshController _finalizeCompletionOfNode:memberOfMesh:eventProvider:](v13, "_finalizeCompletionOfNode:memberOfMesh:eventProvider:", v8, 1, v10);
}

- (void)_performInvalidationOfNode:(id)a3 error:(id)a4 eventProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  COMeshController *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  COMeshController *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  COMeshController *v24;
  void *v25;
  NSObject *v26;
  int v27;
  COMeshController *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v8, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  COCoreLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[COMeshController _performInvalidationOfNode:error:eventProvider:].cold.1();

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134218240;
      v28 = self;
      v29 = 2048;
      v30 = v8;
      _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p invalidating %p", (uint8_t *)&v27, 0x16u);
    }

    v16 = self;
    objc_sync_enter(v16);
    -[COMeshController trackers](v16, "trackers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nodeStateTrackerForNode:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19)
    {
      COCoreLogForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[COMeshController _performInvalidationOfNode:error:eventProvider:].cold.2();

      objc_sync_exit(v16);
    }
    else
    {
      objc_sync_exit(v16);

      objc_msgSend(v8, "setDelegate:", 0);
      -[COMeshController willInvalidateNode:error:](v16, "willInvalidateNode:error:", v8, v9);
      v20 = v16;
      objc_sync_enter(v20);
      -[COMeshController trackers](v20, "trackers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "nodeStateTrackerForNode:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "status");

      objc_sync_exit(v20);
      objc_msgSend(v8, "invalidate");
      v24 = v20;
      objc_sync_enter(v24);
      -[COMeshController trackers](v24, "trackers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeNodeStateTrackerForNode:", v8);

      objc_sync_exit(v24);
      -[COMeshController _finalizeCompletionOfNode:memberOfMesh:eventProvider:](v24, "_finalizeCompletionOfNode:memberOfMesh:eventProvider:", v8, v23 == 1, v10);
    }
  }

}

- (void)didAddNode:(id)a3
{
  NSObject *v4;
  COMeshNodeStateTracker *v5;
  COMeshController *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshController _handleNodeChanges](self, "_handleNodeChanges");
  }
  else
  {
    v5 = -[COMeshNodeStateTracker initWithNode:]([COMeshNodeStateTracker alloc], "initWithNode:", v8);
    -[COMeshNodeStateTracker setDelegate:](v5, "setDelegate:", self);
    v6 = self;
    objc_sync_enter(v6);
    -[COMeshController trackers](v6, "trackers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addNodeStateTracker:", v5);

    objc_sync_exit(v6);
    -[COMeshController willActivateNode:](v6, "willActivateNode:", v8);
    objc_msgSend(v8, "setDelegate:", v6);
    objc_msgSend(v8, "activate");

  }
}

- (void)didActivateNode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  COMeshController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COMeshController listener](self, "listener");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[COMeshController _performElectionGeneration:source:allowingPostTransition:](self, "_performElectionGeneration:source:allowingPostTransition:", -[COMeshController generation](self, "generation"), 0, 1);
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    -[COMeshController trackers](v7, "trackers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nodeStateTrackerForNode:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v7);
    v10 = objc_msgSend(v9, "status");
    COCoreLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10 == 1)
    {
      if (v12)
        -[COMeshController didActivateNode:].cold.1();
    }
    else
    {
      if (v12)
        -[COMeshController didActivateNode:].cold.2();

      objc_msgSend(v9, "setState:", 1);
      -[COMeshController ballot](v7, "ballot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshController _electionRequestWithBallot:generation:](v7, "_electionRequestWithBallot:generation:", v13, -[COMeshController generation](v7, "generation"));
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setElectionStage:", 1);
      objc_msgSend(v9, "setOutstandingRequest:", 1);
      objc_msgSend(v9, "setLastGenerationSent:", -[COMeshController generation](v7, "generation"));
      -[COMeshController ballot](v7, "ballot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLastBallotSent:", v14);

      objc_msgSend(v4, "sendMeshRequest:", v11);
    }

  }
}

- (void)node:(id)a3 didSendCommand:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[COMeshController label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __40__COMeshController_node_didSendCommand___block_invoke;
    v11[3] = &unk_24D4B1978;
    v12 = v9;
    v10 = v9;
    -[COMeshController _performStopOfNode:error:eventProvider:](self, "_performStopOfNode:error:eventProvider:", v6, 0, v11);

  }
  else
  {
    -[COMeshController _removeSentCommand:fromNode:withResponse:error:](self, "_removeSentCommand:fromNode:withResponse:error:", v7, v6, 0, 0);
  }

}

id __40__COMeshController_node_didSendCommand___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x24D4B4878;
  v3[1] = 0x24D4B5418;
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = 0x24D4B5518;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)node:(id)a3 didReceiveCommand:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint8_t buf[4];
  COMeshController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    v9 = (objc_class *)objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[COMeshController notificationHandlers](self, "notificationHandlers");
    else
      -[COMeshController commandHandlers](self, "commandHandlers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v9);
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x2199F3D40]();

    if (v18)
      ((void (**)(_QWORD, id))v18)[2](v18, v7);

    if (!v15)
    {
      COCoreLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_23;
      goto LABEL_21;
    }
  }
  else
  {
    -[COMeshController trackers](self, "trackers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nodeStateTrackerForNode:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    objc_msgSend(v11, "setLastHeard:");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      COCoreLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[COMeshController node:didReceiveCommand:].cold.1();

      -[COMeshController label](self, "label");
      v14 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __43__COMeshController_node_didReceiveCommand___block_invoke;
      v22[3] = &unk_24D4B1978;
      v23 = v14;
      v15 = v14;
      -[COMeshController _performStopOfNode:error:eventProvider:](self, "_performStopOfNode:error:eventProvider:", v6, 0, v22);
      v16 = v23;
      goto LABEL_21;
    }
    v9 = (objc_class *)objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[COMeshController notificationHandlers](self, "notificationHandlers");
    else
      -[COMeshController commandHandlers](self, "commandHandlers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v9);
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x2199F3D40]();

    if (v20)
      ((void (**)(_QWORD, id))v20)[2](v20, v7);

    if (!v15)
    {
      COCoreLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:
        NSStringFromClass(v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v25 = self;
        v26 = 2112;
        v27 = v21;
        v28 = 2048;
        v29 = v6;
        _os_log_debug_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEBUG, "%p found no handler for %@ from %p", buf, 0x20u);

      }
LABEL_21:

    }
  }

}

id __43__COMeshController_node_didReceiveCommand___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x24D4B4878;
  v3[1] = 0x24D4B5418;
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = 0x24D4B54F8;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)unknownNodeForCommand:(id)a3 result:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  COMeshController *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_opt_class();
  objc_msgSend(v6, "_sendingConstituent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 134218754;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v10;
    _os_log_error_impl(&dword_215E92000, v11, OS_LOG_TYPE_ERROR, "%p disregarding command %@ (%@) from unknown node %@", (uint8_t *)&v12, 0x2Au);
  }

  v7[2](v7, 0);
}

- (void)node:(id)a3 didReceiveRequest:(id)a4 responseCallBack:(id)a5
{
  id v8;
  void (**v9)(id, COMeshResponse *, _QWORD);
  NSObject *v10;
  void *v11;
  COMeshResponse *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = (void (**)(id, COMeshResponse *, _QWORD))a5;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
    goto LABEL_2;
  -[COMeshController trackers](self, "trackers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nodeStateTrackerForNode:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "setLastHeard:");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[COMeshController _handleElectionRequest:onNode:responseCallBack:](self, "_handleElectionRequest:onNode:responseCallBack:", v8, v16, v9);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[COMeshController _handleVoteRequest:onNode:responseCallBack:](self, "_handleVoteRequest:onNode:responseCallBack:", v8, v16, v9);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_2:
    -[COMeshController requestHandlers](self, "requestHandlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", objc_opt_class());
    v12 = (COMeshResponse *)objc_claimAutoreleasedReturnValue();

    if (v12)
      ((void (*)(COMeshResponse *, id, id))v12[1].super.super.isa)(v12, v8, v9);
  }
  else
  {
    v12 = objc_alloc_init(COMeshResponse);
    v9[2](v9, v12, 0);
  }

LABEL_9:
}

- (void)node:(id)a3 didReceiveResponse:(id)a4 toRequest:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[COMeshController trackers](self, "trackers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nodeStateTrackerForNode:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "setLastHeard:");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[COMeshController _handleBallotResponse:onNode:](self, "_handleBallotResponse:onNode:", v8, v14);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[COMeshController _handleAcceptResponse:onNode:](self, "_handleAcceptResponse:onNode:", v8, v14);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[COMeshController setPendingPing:](self, "setPendingPing:", 0);
      else
        -[COMeshController _removeSentCommand:fromNode:withResponse:error:](self, "_removeSentCommand:fromNode:withResponse:error:", v9, v14, v8, 0);
    }
  }

}

- (void)node:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  COMeshController *v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  unsigned __int8 isKindOfClass;
  NSObject *v19;
  char v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  char v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshController _removeSentCommand:fromNode:withResponse:error:](self, "_removeSentCommand:fromNode:withResponse:error:", v10, v8, 0, v9);
    goto LABEL_62;
  }
  -[COMeshController listener](self, "listener");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v8)
  {
    v13 = self;
    objc_sync_enter(v13);
    -[COMeshController trackers](v13, "trackers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nodeStateTrackerForNode:", v8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v13);
    v15 = objc_msgSend(v9, "code");
    objc_msgSend(v9, "domain");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v45, "isEqualToString:", CFSTR("COMeshNodeErrorDomain"));
    if (v15 == -4000)
      v17 = v16;
    else
      v17 = 0;
    isKindOfClass = 0;
    v43 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BE7CC90]);
    if (v43 && v15 == -6722)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v42 = 1;
    }
    else
    {
      objc_opt_class();
      v42 = objc_opt_isKindOfClass();
    }
    v20 = v17 | isKindOfClass;
    if (((v17 | isKindOfClass) & 1) != 0 || v43 && v15 == -6714 && ((v42 ^ 1) & 1) == 0)
    {
      v41 = v17;
      if ((isKindOfClass & 1) != 0)
      {
        -[COMeshController label](v13, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __52__COMeshController_node_didReceiveError_forCommand___block_invoke;
        v51[3] = &unk_24D4B19A0;
        v22 = v10;
        v52 = v22;
        v53 = v21;
        v23 = v21;
        v24 = (void *)MEMORY[0x2199F3D40](v51);
        COCoreLogForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[COMeshController node:didReceiveError:forCommand:].cold.5((uint64_t)v13, v22, v25);

        -[COMeshController setPendingPing:](v13, "setPendingPing:", 0);
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(v8, "remote");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        -[COMeshController ballot](v13, "ballot");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "candidates");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v26, "isEqual:", v29))
        {
          v30 = (uint64_t)v24;
          if (!v24)
          {
            -[COMeshController label](v13, "label");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v48[0] = MEMORY[0x24BDAC760];
            v48[1] = 3221225472;
            v48[2] = __52__COMeshController_node_didReceiveError_forCommand___block_invoke_165;
            v48[3] = &unk_24D4B19C8;
            v50 = v41;
            v49 = v31;
            v32 = v31;
            v30 = MEMORY[0x2199F3D40](v48);

            v24 = (void *)v30;
          }
          goto LABEL_32;
        }
        if ((v20 & 1) != 0)
        {
          v30 = 0;
LABEL_32:
          -[COMeshController _performStopOfNode:error:eventProvider:](v13, "_performStopOfNode:error:eventProvider:", v8, v9, v30);
LABEL_33:

          goto LABEL_62;
        }

      }
      if (v41)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v44, "state") == 1)
        {
          -[COMeshController ballot](v13, "ballot");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[COMeshController _electionRequestWithBallot:generation:](v13, "_electionRequestWithBallot:generation:", v33, -[COMeshController generation](v13, "generation"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v44, "setOutstandingRequest:", 1);
          objc_msgSend(v44, "setLastGenerationSent:", -[COMeshController generation](v13, "generation"));
          -[COMeshController ballot](v13, "ballot");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setLastBallotSent:", v34);

          objc_msgSend(v8, "sendMeshRequest:", v29);
          goto LABEL_33;
        }
      }

    }
    -[COMeshController _removeSentCommand:fromNode:withResponse:error:](v13, "_removeSentCommand:fromNode:withResponse:error:", v10, v8, 0, v9);
    v35 = objc_msgSend(v44, "state");
    switch(v35)
    {
      case 4:
        COCoreLogForCategory(0);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          -[COMeshController node:didReceiveError:forCommand:].cold.4();

        -[COMeshController label](v13, "label");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __52__COMeshController_node_didReceiveError_forCommand___block_invoke_166;
        v46[3] = &unk_24D4B1978;
        v47 = v39;
        v40 = v39;
        -[COMeshController _performStopOfNode:error:eventProvider:](v13, "_performStopOfNode:error:eventProvider:", v8, v9, v46);

        goto LABEL_61;
      case 2:
        if ((v43 & v42) != 1)
          goto LABEL_61;
        COCoreLogForCategory(0);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v55 = v8;
          v56 = 2112;
          v57 = v9;
          _os_log_impl(&dword_215E92000, v37, OS_LOG_TYPE_DEFAULT, "electing node %p failed with %@", buf, 0x16u);
        }
        break;
      case 1:
        COCoreLogForCategory(0);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if ((v42 & 1) == 0)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[COMeshController node:didReceiveError:forCommand:].cold.3();
          goto LABEL_47;
        }
        if (v43)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v55 = v8;
            v56 = 2112;
            v57 = v9;
            _os_log_impl(&dword_215E92000, v37, OS_LOG_TYPE_DEFAULT, "starting node %p failed with %@", buf, 0x16u);
          }
LABEL_47:

          objc_msgSend(v44, "setState:", 0);
          goto LABEL_61;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[COMeshController node:didReceiveError:forCommand:].cold.2();
        break;
      default:
LABEL_61:

        goto LABEL_62;
    }

    -[COMeshController _performStopOfNode:error:eventProvider:](v13, "_performStopOfNode:error:eventProvider:", v8, v9, 0);
    goto LABEL_61;
  }
  COCoreLogForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[COMeshController node:didReceiveError:forCommand:].cold.1();

  -[COMeshController stop](self, "stop");
LABEL_62:

}

id __52__COMeshController_node_didReceiveError_forCommand___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = 0x24D4B54D8;
  v7[0] = 0x24D4B4878;
  v7[1] = 0x24D4B54D8;
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "responseTimeout");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = 0x24D4B5418;
  v4 = *(_QWORD *)(a1 + 40);
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __52__COMeshController_node_didReceiveError_forCommand___block_invoke_165(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t *)COMeshControllerLostLeaderReasonGone;
  if (*(_BYTE *)(a1 + 40))
    v1 = &COMeshControllerLostLeaderReasonRoll;
  v2 = *v1;
  v5[0] = 0x24D4B4878;
  v5[1] = 0x24D4B5418;
  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __52__COMeshController_node_didReceiveError_forCommand___block_invoke_166(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x24D4B4878;
  v3[1] = 0x24D4B5418;
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = 0x24D4B5078;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)unknownNodeForRequest:(id)a3 result:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  COMeshController *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[COMeshController _handleDiscoveryUsingElectionRequest:](self, "_handleDiscoveryUsingElectionRequest:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_class();
    objc_msgSend(v6, "_sendingConstituent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 134218754;
      v14 = self;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v11;
      _os_log_error_impl(&dword_215E92000, v12, OS_LOG_TYPE_ERROR, "%p disregarding request %@ (%@) from unknown node %@", (uint8_t *)&v13, 0x2Au);
    }

    v9 = 0;
  }
  v7[2](v7, v9);

}

- (void)didInvalidateNode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  COMeshController *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void (*v14)(_QWORD *, __CFString *, uint64_t *);
  NSObject *v15;
  void *v16;
  void *v17;
  COBallot *v18;
  id v19;
  COMeshLocalNode *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  void *v26;
  _QWORD v27[4];
  void *v28;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COMeshController listener](self, "listener");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v10 = self;
    objc_sync_enter(v10);
    v11 = -[COMeshController state](v10, "state");
    objc_sync_exit(v10);

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      -[COMeshController stop](v10, "stop");
      goto LABEL_8;
    }
    -[COMeshController label](v10, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshController recorder](v10, "recorder");
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __38__COMeshController_didInvalidateNode___block_invoke_2;
    v25 = &unk_24D4B1978;
    v26 = v12;
    v14 = (void (*)(_QWORD *, __CFString *, uint64_t *))v13[2];
    v8 = v12;
    v14(v13, CFSTR("com.apple.CoordinationCore.MeshLostLeader"), &v22);

    COCoreLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[COMeshController didInvalidateNode:].cold.1(v10, v15);

    -[COMeshController trackers](v10, "trackers", v22, v23, v24, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllNodeStateTrackers");

    -[COMeshController me](v10, "me");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[COBallot initWithCandidate:]([COBallot alloc], "initWithCandidate:", v17);
    -[COMeshController setBallot:](v10, "setBallot:", v18);

    v19 = -[COMeshController _newCompanionLinkClient](v10, "_newCompanionLinkClient");
    v20 = -[COMeshLocalNode initWithCompanionLinkClient:source:]([COMeshLocalNode alloc], "initWithCompanionLinkClient:source:", v19, v17);
    -[COMeshController companionLinkClientFactory](v10, "companionLinkClientFactory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshLocalNode setCompanionLinkClientFactory:](v20, "setCompanionLinkClientFactory:", v21);

    -[COMeshController setListener:](v10, "setListener:", v20);
    -[COMeshController _performElectionGeneration:source:allowingPostTransition:](v10, "_performElectionGeneration:source:allowingPostTransition:", -[COMeshController generation](v10, "generation") + 1, 0, 0);

    v9 = v26;
  }
  else
  {
    -[COMeshController label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __38__COMeshController_didInvalidateNode___block_invoke;
    v27[3] = &unk_24D4B1978;
    v28 = v7;
    v8 = v7;
    -[COMeshController _performInvalidationOfNode:error:eventProvider:](self, "_performInvalidationOfNode:error:eventProvider:", v4, 0, v27);
    v9 = v28;
  }

LABEL_8:
}

id __38__COMeshController_didInvalidateNode___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x24D4B4878;
  v3[1] = 0x24D4B5418;
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = 0x24D4B5578;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__COMeshController_didInvalidateNode___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x24D4B4878;
  v3[1] = 0x24D4B5418;
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = 0x24D4B55B8;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didRemoveNode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshController _handleNodeChanges](self, "_handleNodeChanges");
  }
  else
  {
    -[COMeshController label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __34__COMeshController_didRemoveNode___block_invoke;
    v8[3] = &unk_24D4B1978;
    v9 = v6;
    v7 = v6;
    -[COMeshController _performInvalidationOfNode:error:eventProvider:](self, "_performInvalidationOfNode:error:eventProvider:", v4, 0, v8);

  }
}

id __34__COMeshController_didRemoveNode___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x24D4B4878;
  v3[1] = 0x24D4B5418;
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = 0x24D4B5598;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)nodeBecameAvailable:(id)a3
{
  NSObject *v4;
  COMeshController *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = self;
  objc_sync_enter(v5);
  -[COMeshController addOns](v5, "addOns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__COMeshController_nodeBecameAvailable___block_invoke;
  v8[3] = &unk_24D4B1608;
  v8[4] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __40__COMeshController_nodeBecameAvailable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didChangeNodesForMeshController:", *(_QWORD *)(a1 + 32));
}

- (void)nodeShouldRetryAfterBackoff:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  COMeshElectionRequest *v14;
  void *v15;
  int v16;
  COMeshController *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "electionStage") == 4 && objc_msgSend(v4, "state") == 2)
  {
    COCoreLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v4, "backoffBucket") - 1;
      objc_msgSend(v4, "node");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218496;
      v17 = self;
      v18 = 2048;
      v19 = v6;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p back off (%ld) firing for %p", (uint8_t *)&v16, 0x20u);

    }
    -[COMeshController ballot](self, "ballot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[COMeshController generation](self, "generation");
    objc_msgSend(v4, "backoffResponse");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "setLastGenerationSent:", v9);
      objc_msgSend(v4, "setLastBallotSent:", v8);
      COCoreLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "node");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218496;
        v17 = self;
        v18 = 2048;
        v19 = v9;
        v20 = 2048;
        v21 = v12;
        _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p delayed BALLOT (%llu) to %p", (uint8_t *)&v16, 0x20u);

      }
      -[COMeshController _ballotResponseWithBallot:generation:](self, "_ballotResponseWithBallot:generation:", v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v13, 0);

      objc_msgSend(v4, "setBackoffResponse:", 0);
    }
    else if ((objc_msgSend(v4, "hasOutstandingRequest") & 1) == 0)
    {
      objc_msgSend(v4, "setLastGenerationSent:", v9);
      objc_msgSend(v4, "setLastBallotSent:", v8);
      objc_msgSend(v4, "setElectionStage:", 1);
      v14 = -[COMeshBaseBallotRequest initWithBallot:generation:]([COMeshElectionRequest alloc], "initWithBallot:generation:", v8, v9);
      objc_msgSend(v4, "node");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMeshRequest:", v14);

    }
  }

}

- (void)backedOffNodeMovedOutOfElection:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "totalBackedOffTime");
  if (v4 > -[COMeshController longestBackOff](self, "longestBackOff"))
  {
    -[COMeshController setLongestBackOff:](self, "setLongestBackOff:", objc_msgSend(v7, "totalBackedOffTime"));
    objc_msgSend(v7, "node");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remote");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshController setLongestBackedOffConstituent:](self, "setLongestBackedOffConstituent:", v6);

  }
}

- (void)discoveryManager:(id)a3 didDiscoverRecords:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[COMeshController dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__COMeshController_discoveryManager_didDiscoverRecords___block_invoke;
  v8[3] = &unk_24D4B0858;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __56__COMeshController_discoveryManager_didDiscoverRecords___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134218240;
    v19 = v3;
    v20 = 2048;
    v21 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p delayed Discovery (IP) - %lu records", buf, 0x16u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 32), "listener", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "_handleDiscoveryRecord:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)didStartElection
{
  COMeshController *v2;
  unint64_t state;
  COMeshController *v4;
  NSObject *v5;
  int v6;
  COMeshController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  if (state != 2)
  {
    -[COMeshController willTransitionToState:](v2, "willTransitionToState:", 2);
    v4 = v2;
    objc_sync_enter(v4);
    v2->_state = 2;
    objc_sync_exit(v4);

    COCoreLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = v4;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p moved to election state", (uint8_t *)&v6, 0xCu);
    }

    -[COMeshController didTransitionToState:](v4, "didTransitionToState:", 2);
  }
}

- (void)didCompleteElection
{
  COMeshController *v2;
  unint64_t state;
  COMeshController *v4;
  NSObject *v5;
  int v6;
  COMeshController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  if (state != 3)
  {
    -[COMeshController willTransitionToState:](v2, "willTransitionToState:", 3);
    v4 = v2;
    objc_sync_enter(v4);
    v2->_state = 3;
    objc_sync_exit(v4);

    COCoreLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = v4;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p moved to processing state", (uint8_t *)&v6, 0xCu);
    }

    -[COMeshController didTransitionToState:](v4, "didTransitionToState:", 3);
    -[COMeshController setElectionEnd:](v4, "setElectionEnd:", clock_gettime_nsec_np(_CLOCK_UPTIME_RAW));
    -[COMeshController _processQueuedCommands](v4, "_processQueuedCommands");
  }
}

- (void)_handleNodeChanges
{
  COMeshController *v2;
  id v3;
  _QWORD v4[5];

  v2 = self;
  objc_sync_enter(v2);
  -[COMeshController addOns](v2, "addOns");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__COMeshController__handleNodeChanges__block_invoke;
  v4[3] = &unk_24D4B1608;
  v4[4] = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __38__COMeshController__handleNodeChanges__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didChangeNodesForMeshController:", *(_QWORD *)(a1 + 32));
}

- (void)_setupCoordinationPrefsObserver
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSUserDefaults *v6;
  NSUserDefaults *coordinationDefaults;
  int v8;
  COMeshController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p setting up observers to watch coordination prefs", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BE19E28];
  objc_msgSend(MEMORY[0x24BE19E28], "coordinationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDefaultsForIdentifer:", v5);
  v6 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
  coordinationDefaults = self->_coordinationDefaults;
  self->_coordinationDefaults = v6;

  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_coordinationDefaults, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x24BE19C78], 0, 0);
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_coordinationDefaults, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x24BE19C80], 0, 0);
}

- (void)_tearDownCoordinationPrefsObserver
{
  -[NSUserDefaults removeObserver:forKeyPath:](self->_coordinationDefaults, "removeObserver:forKeyPath:", self, *MEMORY[0x24BE19C78]);
  -[NSUserDefaults removeObserver:forKeyPath:](self->_coordinationDefaults, "removeObserver:forKeyPath:", self, *MEMORY[0x24BE19C80]);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  NSObject *v21;
  const char *v22;
  int v23;
  COMeshController *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = *MEMORY[0x24BE19C78];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE19C78]))
  {
    objc_msgSend(v10, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      COCoreLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 134218240;
        v24 = self;
        v25 = 1024;
        v26 = objc_msgSend(v13, "BOOLValue");
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p observed an update to fast fold enablement. new value = %d", (uint8_t *)&v23, 0x12u);
      }

      v15 = objc_msgSend(v13, "BOOLValue");
      if (v15 != objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
      {
        COCoreLogForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        v23 = 134217984;
        v24 = self;
        v22 = "%p fast fold changed. Exiting process";
        goto LABEL_18;
      }
    }

  }
  v16 = *MEMORY[0x24BE19C80];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE19C80]))
  {
    objc_msgSend(v10, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_12;
    COCoreLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v17, "BOOLValue");
      v23 = 134218240;
      v24 = self;
      v25 = 1024;
      v26 = v19;
      _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "%p observed an update to ip diffing enablement. new value = %d", (uint8_t *)&v23, 0x12u);
    }

    v20 = objc_msgSend(v17, "BOOLValue");
    if (v20 == objc_msgSend(MEMORY[0x24BE19E30], "isIPDiscoveryDiffingEnabled"))
    {
LABEL_12:

      goto LABEL_13;
    }
    COCoreLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:

      exit(1);
    }
    v23 = 134217984;
    v24 = self;
    v22 = "%p ip diffing changed. Exiting process";
LABEL_18:
    _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v23, 0xCu);
    goto LABEL_19;
  }
LABEL_13:

}

- (unint64_t)internalFlags
{
  return self->_internalFlags;
}

- (unint64_t)state
{
  return self->_state;
}

- (COConstituent)me
{
  return self->_me;
}

- (void)setLeader:(id)a3
{
  objc_storeStrong((id *)&self->_leader, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)recorder
{
  return self->_recorder;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)clusterOptions
{
  return self->_clusterOptions;
}

- (void)setClusterOptions:(unint64_t)a3
{
  self->_clusterOptions = a3;
}

- (void)setBallot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (unint64_t)electionPrevious
{
  return self->_electionPrevious;
}

- (unint64_t)electionStart
{
  return self->_electionStart;
}

- (unint64_t)electionEnd
{
  return self->_electionEnd;
}

- (OS_dispatch_source)electionElapsedTimer
{
  return self->_electionElapsedTimer;
}

- (COMeshLocalNode)listener
{
  return self->_listener;
}

- (CORapportBrowser)rapportBrowser
{
  return self->_rapportBrowser;
}

- (void)setRapportBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_rapportBrowser, a3);
}

- (COBallotBrowser)ballotBrowser
{
  return self->_ballotBrowser;
}

- (void)setBallotBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_ballotBrowser, a3);
}

- (COIDSBrowser)idsBrowser
{
  return self->_idsBrowser;
}

- (void)setIdsBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_idsBrowser, a3);
}

- (COMeshNodeStateTrackerSet)trackers
{
  return self->_trackers;
}

- (CODiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (NSDictionary)commandHandlers
{
  return self->_commandHandlers;
}

- (void)setCommandHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSDictionary)notificationHandlers
{
  return self->_notificationHandlers;
}

- (void)setNotificationHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDictionary)requestHandlers
{
  return self->_requestHandlers;
}

- (void)setRequestHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)queuedCommands
{
  return self->_queuedCommands;
}

- (void)setQueuedCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)sentCommands
{
  return self->_sentCommands;
}

- (void)setSentCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSUserDefaults)coordinationDefaults
{
  return self->_coordinationDefaults;
}

- (void)setCoordinationDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_coordinationDefaults, a3);
}

- (BOOL)hasPendingPing
{
  return self->_pendingPing;
}

- (void)setPendingPing:(BOOL)a3
{
  self->_pendingPing = a3;
}

- (double)pingMinimum
{
  return self->_pingMinimum;
}

- (void)setPingMinimum:(double)a3
{
  self->_pingMinimum = a3;
}

- (double)pingMaximum
{
  return self->_pingMaximum;
}

- (void)setPingMaximum:(double)a3
{
  self->_pingMaximum = a3;
}

- (unint64_t)longestBackOff
{
  return self->_longestBackOff;
}

- (void)setLongestBackOff:(unint64_t)a3
{
  self->_longestBackOff = a3;
}

- (COConstituent)longestBackedOffConstituent
{
  return self->_longestBackedOffConstituent;
}

- (void)setLongestBackedOffConstituent:(id)a3
{
  objc_storeStrong((id *)&self->_longestBackedOffConstituent, a3);
}

- (CONodeManager)nodeManager
{
  return self->_nodeManager;
}

- (NSString)globalServiceName
{
  return self->_globalServiceName;
}

- (void)setGlobalServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setCompanionLinkClientFactory:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClientFactory, a3);
}

- (NSString)meshName
{
  return self->_meshName;
}

- (void)setMeshName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshName, 0);
  objc_storeStrong((id *)&self->_companionLinkClientFactory, 0);
  objc_storeStrong((id *)&self->_globalServiceName, 0);
  objc_storeStrong((id *)&self->_nodeManager, 0);
  objc_storeStrong((id *)&self->_longestBackedOffConstituent, 0);
  objc_storeStrong((id *)&self->_coordinationDefaults, 0);
  objc_storeStrong((id *)&self->_sentCommands, 0);
  objc_storeStrong((id *)&self->_queuedCommands, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_notificationHandlers, 0);
  objc_storeStrong((id *)&self->_commandHandlers, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_storeStrong((id *)&self->_trackers, 0);
  objc_storeStrong((id *)&self->_idsBrowser, 0);
  objc_storeStrong((id *)&self->_ballotBrowser, 0);
  objc_storeStrong((id *)&self->_rapportBrowser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_electionElapsedTimer, 0);
  objc_storeStrong((id *)&self->_ballot, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_addOns, 0);
}

- (void)setListener:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p listener is now %p", v1);
  OUTLINED_FUNCTION_2_0();
}

void __52__COMeshController_registerHandler_forCommandClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_12_0(a1);
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v5, "%p handler for %@ command registered", v6);

  OUTLINED_FUNCTION_11();
}

void __53__COMeshController_deregisterHandlerForCommandClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(*(Class *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v4, "%p handler for %@ command deregistered", v5);

  OUTLINED_FUNCTION_11();
}

void __57__COMeshController_registerHandler_forNotificationClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_12_0(a1);
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v5, "%p handler for %@ notification registered", v6);

  OUTLINED_FUNCTION_11();
}

void __58__COMeshController_deregisterHandlerForNotificationClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(*(Class *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v4, "%p handler for %@ notification deregistered", v5);

  OUTLINED_FUNCTION_11();
}

void __52__COMeshController_registerHandler_forRequestClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_12_0(a1);
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v5, "%p handler for %@ request registered", v6);

  OUTLINED_FUNCTION_11();
}

void __53__COMeshController_deregisterHandlerForRequestClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(*(Class *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v4, "%p handler for %@ request deregistered", v5);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshController_sendCommand_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_15_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v5, "%p sending %@ to leader", v6);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshController_sendRequest_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_15_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v5, "%p requesting %@ from leader", v6);

  OUTLINED_FUNCTION_11();
}

void __39__COMeshController_sendCommand_toPeer___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_13_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_0(&dword_215E92000, v2, v3, "%p sending command %@ to peer %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __39__COMeshController_sendCommand_toPeer___block_invoke_68_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  objc_class *v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218754;
  v10 = v5;
  OUTLINED_FUNCTION_7_1();
  v11 = v8;
  v12 = a2;
  _os_log_error_impl(&dword_215E92000, a3, OS_LOG_TYPE_ERROR, "%p failed to send command %@ to peer %@. Error %@", (uint8_t *)&v9, 0x2Au);

}

void __61__COMeshController_sendRequest_toPeer_withCompletionHandler___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_13_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_0(&dword_215E92000, v2, v3, "%p requesting %@ from peer %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)_processBackedOffNodesExcludingTracker:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "%p legacy nodes don't need to handle backoffs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleDiscoveryUsingElectionRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p unable to perform node discovery from election request %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_performInvalidationOfNode:error:eventProvider:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p already invalidated or in the process of invalidating %p", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)_performInvalidationOfNode:error:eventProvider:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "Bailing on invalidation of node %p since we're not tracking it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)didActivateNode:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p not probing %p", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)didActivateNode:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p probing %p", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)node:didReceiveCommand:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p received exit from %p", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)node:didReceiveError:forCommand:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "listener failed with %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)node:didReceiveError:forCommand:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "starting node %p failed with %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)node:didReceiveError:forCommand:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "starting node %p unsuccessful with %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)node:didReceiveError:forCommand:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "stopping node %p failed with %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)node:(uint64_t)a1 didReceiveError:(void *)a2 forCommand:(NSObject *)a3 .cold.5(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "responseTimeout");
  v6 = 134218240;
  v7 = a1;
  v8 = 2048;
  v9 = v5;
  _os_log_error_impl(&dword_215E92000, a3, OS_LOG_TYPE_ERROR, "%p ping (%g) failed!", (uint8_t *)&v6, 0x16u);
}

- (void)didInvalidateNode:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "meshName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218498;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_215E92000, a2, OS_LOG_TYPE_ERROR, "%p restarting \"%@\" mesh (%@)", (uint8_t *)&v6, 0x20u);

  OUTLINED_FUNCTION_8();
}

@end
