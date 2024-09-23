@implementation COMeshLocalNode

- (COMeshLocalNode)initWithCompanionLinkClient:(id)a3 source:(id)a4
{
  id v6;
  COMeshLocalNode *v7;
  NSDictionary *v8;
  NSDictionary *commands;
  NSArray *v10;
  NSArray *nodes;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSSet *ignoredIDSIdentifiers;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)COMeshLocalNode;
  v7 = -[COMeshNode initWithCompanionLinkClient:source:](&v18, sel_initWithCompanionLinkClient_source_, v6, a4);
  if (v7)
  {
    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    commands = v7->_commands;
    v7->_commands = v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    nodes = v7->_nodes;
    v7->_nodes = v10;

    objc_msgSend(v6, "localDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshLocalNode _updateListeningPort:](v7, "_updateListeningPort:", v12);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringArrayForKey:", CFSTR("IgnoredIDSIdentifiers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      ignoredIDSIdentifiers = v7->_ignoredIDSIdentifiers;
      v7->_ignoredIDSIdentifiers = (NSSet *)v15;

    }
  }

  return v7;
}

- (void)_updateListeningPort:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unsigned __int16 v7;
  NSObject *v8;
  int v9;
  COMeshLocalNode *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "listeningPort");
    if (v6 >= 1)
    {
      v7 = v6;
      if (v6 != -[COMeshLocalNode listeningPort](self, "listeningPort"))
      {
        self->_listeningPort = v7;
        COCoreLogForCategory(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 138412546;
          v10 = self;
          v11 = 1024;
          v12 = -[COMeshLocalNode listeningPort](self, "listeningPort");
          _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%@ listening port updated to %hu", (uint8_t *)&v9, 0x12u);
        }

        -[COMeshLocalNode _handleActivation:](self, "_handleActivation:", 0);
      }
    }
  }

}

- (void)setCommands:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *commands;
  NSDictionary *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  -[COMeshLocalNode commands](self, "commands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToDictionary:", v4) & 1) == 0)
  {
    -[COMeshNode client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __31__COMeshLocalNode_setCommands___block_invoke;
    v17[3] = &unk_24D4B2CB8;
    v8 = v6;
    v18 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v17);
    v9 = (NSDictionary *)objc_msgSend(v4, "copy");
    commands = self->_commands;
    self->_commands = v9;

    objc_initWeak(&location, self);
    v11 = self->_commands;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __31__COMeshLocalNode_setCommands___block_invoke_2;
    v13[3] = &unk_24D4B2D08;
    v12 = v8;
    v14 = v12;
    objc_copyWeak(&v15, &location);
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }

}

void __31__COMeshLocalNode_setCommands___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(a3, "isSubclassOfClass:", objc_opt_class());
  v6 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v6, "deregisterRequestID:", v7);
  else
    objc_msgSend(v6, "deregisterEventID:", v7);

}

void __31__COMeshLocalNode_setCommands___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  id *v8;
  _QWORD *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = objc_msgSend(a3, "isSubclassOfClass:", objc_opt_class());
  v7 = *(void **)(a1 + 32);
  v8 = (id *)(a1 + 40);
  if (v6)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __31__COMeshLocalNode_setCommands___block_invoke_3;
    v14[3] = &unk_24D4B0E28;
    v9 = v14;
    v10 = &v16;
    objc_copyWeak(&v16, v8);
    v15 = v5;
    objc_msgSend(v7, "registerRequestID:options:handler:", v15, 0, v14);
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __31__COMeshLocalNode_setCommands___block_invoke_242;
    v11[3] = &unk_24D4B0E78;
    v9 = v11;
    v10 = &v13;
    objc_copyWeak(&v13, v8);
    v12 = v5;
    objc_msgSend(v7, "registerEventID:options:handler:", v12, 0, v11);
  }

  objc_destroyWeak(v10);
}

void __31__COMeshLocalNode_setCommands___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD *WeakRetained;
  _QWORD *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31[2];
  uint8_t buf[4];
  _QWORD *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __31__COMeshLocalNode_setCommands___block_invoke_4;
  v26 = &unk_24D4B2CE0;
  v11 = (id *)(a1 + 40);
  objc_copyWeak(v31, (id *)(a1 + 40));
  v12 = v8;
  v27 = v12;
  v28 = *(id *)(a1 + 32);
  v13 = v7;
  v29 = v13;
  v14 = v9;
  v30 = v14;
  v31[1] = v10;
  v15 = (void (**)(_QWORD))MEMORY[0x2199F3D40](&v23);
  WeakRetained = objc_loadWeakRetained(v11);
  v17 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "nodeActivated", v23, v24, v25, v26, v27, v28, v29) & 1) == 0)
  {
    COCoreLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v17;
      v34 = 2112;
      v35 = v13;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "%@ deferring request %@ with options %@, not fully activated", buf, 0x20u);
    }

    objc_msgSend(v17, "pendingActivation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "mutableCopy");

    if (!v20)
      v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v21 = (void *)MEMORY[0x2199F3D40](v15);
    objc_msgSend(v20, "addObject:", v21);

    v22 = (void *)v17[24];
    v17[24] = v20;

  }
  else
  {
    v15[2](v15);
  }

  objc_destroyWeak(v31);
}

void __31__COMeshLocalNode_setCommands___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE7CD00]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(v5, "_nodeForIDSIdentifier:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v5, "_handleRequestIdentifier:rapportRepresentation:options:responseHandler:fromNode:at:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v4, *(_QWORD *)(a1 + 72));

    WeakRetained = v5;
  }

}

void __31__COMeshLocalNode_setCommands___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  _QWORD *WeakRetained;
  _QWORD *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  _QWORD *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __31__COMeshLocalNode_setCommands___block_invoke_2_243;
  v21 = &unk_24D4B2A88;
  v7 = (id *)(a1 + 40);
  objc_copyWeak(&v25, (id *)(a1 + 40));
  v8 = v6;
  v22 = v8;
  v23 = *(id *)(a1 + 32);
  v9 = v5;
  v24 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x2199F3D40](&v18);
  WeakRetained = objc_loadWeakRetained(v7);
  v12 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "nodeActivated", v18, v19, v20, v21, v22, v23) & 1) == 0)
  {
    COCoreLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v27 = v12;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%@ deferring command %@ with options %@, not fully activated", buf, 0x20u);
    }

    objc_msgSend(v12, "pendingActivation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "mutableCopy");

    if (!v15)
      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = (void *)MEMORY[0x2199F3D40](v10);
    objc_msgSend(v15, "addObject:", v16);

    v17 = (void *)v12[24];
    v12[24] = v15;

  }
  else
  {
    v10[2](v10);
  }

  objc_destroyWeak(&v25);
}

void __31__COMeshLocalNode_setCommands___block_invoke_2_243(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE7CD00]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(v5, "_nodeForIDSIdentifier:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v5, "_handleEventIdentifier:rapportRepresentation:options:fromNode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v4);

    WeakRetained = v5;
  }

}

- (id)IDSIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[COMeshNode client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (void)setAcceptableCommands:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  NSSet *v7;
  NSSet *acceptableCommands;
  NSSet *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  COMeshLocalNode *v14;

  v11 = a3;
  -[COMeshLocalNode acceptableCommands](self, "acceptableCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToSet:", v11);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v7 = (NSSet *)objc_msgSend(v11, "copy");
    acceptableCommands = self->_acceptableCommands;
    self->_acceptableCommands = v7;

    v9 = self->_acceptableCommands;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__COMeshLocalNode_setAcceptableCommands___block_invoke;
    v12[3] = &unk_24D4B2D30;
    v13 = v6;
    v14 = self;
    v10 = v6;
    -[NSSet enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v12);
    -[COMeshLocalNode setCommands:](self, "setCommands:", v10);

  }
}

void __41__COMeshLocalNode_setAcceptableCommands___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_eventIDForClass:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", a2, v4);

}

- (void)activate
{
  void *v3;
  uint64_t v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[COMeshNode client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __27__COMeshLocalNode_activate__block_invoke;
  v10[3] = &unk_24D4B0AA0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setDeviceFoundHandler:", v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __27__COMeshLocalNode_activate__block_invoke_2;
  v8[3] = &unk_24D4B0AA0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setDeviceLostHandler:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __27__COMeshLocalNode_activate__block_invoke_3;
  v6[3] = &unk_24D4B0AA0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setLocalDeviceUpdatedHandler:", v6);
  v5.receiver = self;
  v5.super_class = (Class)COMeshLocalNode;
  -[COMeshNode activate](&v5, sel_activate);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __27__COMeshLocalNode_activate__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleFoundDevice:", v5);

}

void __27__COMeshLocalNode_activate__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleLostDevice:", v5);

}

void __27__COMeshLocalNode_activate__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateListeningPort:", v5);

}

- (void)_handleActivation:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *pendingActivation;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  COMeshLocalNode *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)COMeshLocalNode;
  -[COMeshNode _handleActivation:](&v30, sel__handleActivation_, a3);
  -[COMeshNode client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138412546;
    v34 = self;
    v35 = 2048;
    v36 = v7;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%@ triggering found events for %lu devices post-activation", buf, 0x16u);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        -[COMeshLocalNode _handleFoundDevice:](self, "_handleFoundDevice:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v10);
  }

  -[COMeshLocalNode pendingActivation](self, "pendingActivation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  pendingActivation = self->_pendingActivation;
  self->_pendingActivation = 0;

  COCoreLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 138412546;
    v34 = self;
    v35 = 2048;
    v36 = v16;
    _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%@ triggering %lu pending actions post-activation", buf, 0x16u);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21) + 16))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21));
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v19);
  }

}

- (id)_nodeForIDSIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[4];
  id v17;
  COMeshLocalNode *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v5 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__15;
  v26 = __Block_byref_object_dispose__15;
  v27 = 0;
  v6 = MEMORY[0x24BDAC760];
  v7 = 1;
  while (1)
  {
    v8 = v7;
    -[COMeshLocalNode nodes](self, "nodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __41__COMeshLocalNode__nodeForIDSIdentifier___block_invoke;
    v19[3] = &unk_24D4B2D58;
    v10 = v4;
    v20 = v10;
    v21 = &v22;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);
    if (v23[5])
      break;
    -[COMeshNode client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "count"))
      goto LABEL_7;
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __41__COMeshLocalNode__nodeForIDSIdentifier___block_invoke_2;
    v16[3] = &unk_24D4B2D80;
    v17 = v10;
    v18 = self;
    v13 = objc_msgSend(v12, "indexOfObjectPassingTest:", v16);

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_7:

      break;
    }

    v7 = 0;
    v5 = v9;
    if ((v8 & 1) == 0)
      goto LABEL_9;
  }

LABEL_9:
  v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __41__COMeshLocalNode__nodeForIDSIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "IDSIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "compare:options:", *(_QWORD *)(a1 + 32), 1);
    *a4 = v9 == 0;
    if (!v9)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

BOOL __41__COMeshLocalNode__nodeForIDSIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;

  v6 = a2;
  objc_msgSend(v6, "idsDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "compare:options:", *(_QWORD *)(a1 + 32), 1);
    *a4 = v9 == 0;
    if (!v9)
      objc_msgSend(*(id *)(a1 + 40), "_handleFoundDevice:", v6);
  }
  v10 = *a4;

  return v10;
}

- (void)_handleFoundDevice:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, BOOL *);
  void *v20;
  id v21;
  _BYTE *v22;
  uint8_t v23[4];
  COMeshLocalNode *v24;
  __int16 v25;
  id v26;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "idsDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COMeshNode nodeActivated](self, "nodeActivated");
  v7 = objc_msgSend(v5, "length");
  if (v6)
  {
    if (v7)
    {
      -[COMeshLocalNode ignoredIDSIdentifiers](self, "ignoredIDSIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v5);

      if (v9)
      {
        COCoreLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[COMeshLocalNode _handleFoundDevice:].cold.1();
      }
      else
      {
        -[COMeshLocalNode nodes](self, "nodes");
        v10 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v28 = __Block_byref_object_copy__15;
        v29 = __Block_byref_object_dispose__15;
        v30 = 0;
        v17 = MEMORY[0x24BDAC760];
        v18 = 3221225472;
        v19 = __38__COMeshLocalNode__handleFoundDevice___block_invoke;
        v20 = &unk_24D4B2D58;
        v11 = v5;
        v21 = v11;
        v22 = buf;
        -[NSObject enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", &v17);
        v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v12)
        {
          v13 = objc_msgSend(v12, "discoveryType", v17, v18, v19, v20);
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDiscoveryType:", v13 | 1);
          if (!objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "connectionType"))
          {
            COCoreLogForCategory(0);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v23 = 138412546;
              v24 = self;
              v25 = 2112;
              v26 = v11;
              _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%@ updating unknown connection type for %@", v23, 0x16u);
            }

            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setConnectionType:", 1);
          }
        }
        else
        {
          COCoreLogForCategory(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v23 = 138412546;
            v24 = self;
            v25 = 2112;
            v26 = v11;
            _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%@ found %@", v23, 0x16u);
          }

          v16 = -[COMeshLocalNode _createNodeForDevice:IDSIdentifier:configure:](self, "_createNodeForDevice:IDSIdentifier:configure:", v4, v11, &__block_literal_global_254, v17, v18, v19, v20);
        }

        _Block_object_dispose(buf, 8);
      }
LABEL_18:

    }
  }
  else if (v7)
  {
    COCoreLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%@ ignore found %@, not fully activated", buf, 0x16u);
    }
    goto LABEL_18;
  }

}

void __38__COMeshLocalNode__handleFoundDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "IDSIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:options:", *(_QWORD *)(a1 + 32), 1);
  *a4 = v8 == 0;

  if (!v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __38__COMeshLocalNode__handleFoundDevice___block_invoke_252(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDiscoveryType:", 1);
  objc_msgSend(v2, "setConnectionType:", 1);

}

- (void)_handleLostDevice:(id)a3
{
  void *v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  COMeshLocalNode *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "idsDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[COMeshNode nodeActivated](self, "nodeActivated");
  v6 = objc_msgSend(v4, "length");
  if (v5)
  {
    if (v6)
    {
      -[COMeshLocalNode _nodeForIDSIdentifier:](self, "_nodeForIDSIdentifier:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = -[NSObject connectionType](v7, "connectionType");
        v10 = -[NSObject discoveryType](v8, "discoveryType");
        if (v9 == 1)
        {
          -[COMeshLocalNode _handleLostNode:](self, "_handleLostNode:", v8);
        }
        else
        {
          v11 = v10;
          COCoreLogForCategory(0);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = 138412546;
            v14 = self;
            v15 = 2112;
            v16 = v4;
            _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%@ ignoring loss %@", (uint8_t *)&v13, 0x16u);
          }

          -[NSObject setDiscoveryType:](v8, "setDiscoveryType:", v11 & 0xFFFFFFFFFFFFFFFELL);
        }
      }
LABEL_12:

    }
  }
  else if (v6)
  {
    COCoreLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%@ ignore lost %@, not fully activated", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_12;
  }

}

- (void)_handleLostNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  COMeshLocalNode *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshLocalNode nodes](self, "nodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%@ lost %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v4, "setParent:", 0);
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "removeObject:", v4);
  -[COMeshLocalNode setNodes:](self, "setNodes:", v8);
  -[COMeshNode delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "didRemoveNode:", v4);
  }
  else
  {
    objc_msgSend(v4, "invalidate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "didInvalidateNode:", v4);
  }

}

- (id)_handleDiscoveryRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  COMeshLocalNode *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[COMeshLocalNode nodes](self, "nodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__15;
    v24 = __Block_byref_object_dispose__15;
    v25 = 0;
    v7 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __42__COMeshLocalNode__handleDiscoveryRecord___block_invoke;
    v17[3] = &unk_24D4B2D58;
    v8 = v5;
    v18 = v8;
    v19 = &v20;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
    v9 = (void *)v21[5];
    if (v9)
    {
      v10 = objc_msgSend(v9, "discoveryType");
      objc_msgSend((id)v21[5], "setDiscoveryType:", v10 | 2);
      v11 = (id)v21[5];
    }
    else
    {
      objc_msgSend(v4, "companionLinkDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __42__COMeshLocalNode__handleDiscoveryRecord___block_invoke_2;
      v15[3] = &unk_24D4B2DE8;
      v16 = v4;
      -[COMeshLocalNode _createNodeForDevice:IDSIdentifier:configure:](self, "_createNodeForDevice:IDSIdentifier:configure:", v12, v8, v15);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      COCoreLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v27 = self;
        v28 = 2112;
        v29 = v8;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%@ discovered (IP) %@, created %@", buf, 0x20u);
      }

    }
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __42__COMeshLocalNode__handleDiscoveryRecord___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "IDSIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:options:", *(_QWORD *)(a1 + 32), 1);
  *a4 = v8 == 0;

  if (!v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __42__COMeshLocalNode__handleDiscoveryRecord___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDiscoveryRecord:", v2);
  objc_msgSend(v3, "setDiscoveryType:", 2);
  objc_msgSend(v3, "setConnectionType:", 0);

}

- (id)_createNodeForDevice:(id)a3 IDSIdentifier:(id)a4 configure:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  COMeshNode *v15;
  void *v16;
  COMeshNode *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = a3;
  -[COMeshNode client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshLocalNode companionLinkClientFactory](self, "companionLinkClientFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "companionLinkClientForDevice:withIDSIdentifier:", v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dispatchQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDispatchQueue:", v14);

  v15 = [COMeshNode alloc];
  -[COMeshNode source](self, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[COMeshNode initWithCompanionLinkClient:source:](v15, "initWithCompanionLinkClient:source:", v13, v16);

  -[COMeshNode setParent:](v17, "setParent:", self);
  -[COMeshNode meshName](self, "meshName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshNode setMeshName:](v17, "setMeshName:", v18);

  -[COMeshNode label](self, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshNode setLabel:](v17, "setLabel:", v19);

  -[COMeshNode recorder](self, "recorder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshNode setRecorder:](v17, "setRecorder:", v20);

  -[COMeshNode _setIDSIdentifier:](v17, "_setIDSIdentifier:", v9);
  v8[2](v8, v17);

  -[COMeshLocalNode nodes](self, "nodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayByAddingObject:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshLocalNode setNodes:](self, "setNodes:", v22);

  -[COMeshNode delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v23, "didAddNode:", v17);
  else
    -[COMeshNode activate](v17, "activate");

  return v17;
}

- (void)_handleEventIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 fromNode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  id v27;
  void (**v28)(_QWORD);
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(_QWORD);
  uint64_t *v34;
  _QWORD v35[5];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__15;
  v83 = __Block_byref_object_dispose__15;
  v13 = a6;
  v84 = v13;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__15;
  v77 = __Block_byref_object_dispose__15;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__15;
  v71 = __Block_byref_object_dispose__15;
  v72 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__15;
  v61 = __Block_byref_object_dispose__15;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__15;
  v55 = __Block_byref_object_dispose__15;
  v56 = 0;
  v14 = (void *)objc_opt_class();
  v15 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke;
  v50[3] = &unk_24D4B0FB8;
  v50[4] = &v57;
  v50[5] = &v51;
  objc_msgSend(v14, "_commandPayloadFromRapportRepresentation:result:", v11, v50);
  if (v52[5])
  {
    -[COMeshLocalNode commands](self, "commands");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "objectForKey:", v10);

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v17, v52[5], 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v68;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v74;
    }
    v23 = (void *)v19[5];
    v19[5] = v18;

  }
  else
  {
    COCoreLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[COMeshLocalNode _handleEventIdentifier:rapportRepresentation:options:fromNode:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v74[5];
    v74[5] = v21;

    *((_BYTE *)v64 + 24) = 1;
  }
  v24 = v68;
  v25 = (void *)v68[5];
  if (v25)
  {
    if (v58[5])
    {
      objc_msgSend(v25, "_setSendingConstituent:");
      v24 = v68;
    }
    if (v80[5])
    {
      objc_msgSend((id)v24[5], "_setSender:");
      v24 = v68;
    }
    objc_msgSend((id)v24[5], "_setRapportOptions:", v12);
  }
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__15;
  v48 = __Block_byref_object_dispose__15;
  v26 = (void *)v80[5];
  if (v26)
    objc_msgSend(v26, "delegate");
  else
    -[COMeshNode delegate](self, "delegate");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260;
  v35[3] = &unk_24D4B2E10;
  v37 = &v79;
  v35[4] = self;
  v27 = v10;
  v36 = v27;
  v38 = &v44;
  v39 = &v57;
  v40 = &v73;
  v41 = &v63;
  v42 = &v67;
  v43 = &v51;
  v28 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v35);
  if (!v80[5] && v58[5] && v68[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v29 = (void *)v45[5];
    v30 = v68[5];
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_265;
    v31[3] = &unk_24D4B2E38;
    v34 = &v79;
    v31[4] = self;
    v32 = v27;
    v33 = v28;
    objc_msgSend(v29, "unknownNodeForCommand:result:", v30, v31);

  }
  else
  {
    v28[2](v28);
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  COCoreLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_4();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_validateSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)) & 1) == 0)
    {
      COCoreLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_3();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = 0;

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = 0;

    }
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    if (v16)
    {
      objc_msgSend(v16, "_setSender:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "node:didReceiveCommand:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (!v17)
      {
        COCoreLogForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_2(a1, v18, v19, v20, v21, v22, v23, v24);

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "node:didReceiveError:forCommand:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v17, 0);
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "_invalidateAndReintroduceNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_1();

  }
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_265(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
  COCoreLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    v7 = a1[4];
    v8 = a1[5];
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%@ received node %@ from delegate for command %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_handleRequestIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 fromNode:(id)a7 at:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  void *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[5];
  id v41;
  void (**v42)(_QWORD);
  uint64_t *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[6];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;

  v14 = a3;
  v15 = a4;
  v39 = a5;
  v16 = a6;
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__15;
  v94 = __Block_byref_object_dispose__15;
  v17 = a7;
  v95 = v17;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__15;
  v88 = __Block_byref_object_dispose__15;
  v89 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__15;
  v82 = __Block_byref_object_dispose__15;
  v83 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__15;
  v72 = __Block_byref_object_dispose__15;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__15;
  v66 = __Block_byref_object_dispose__15;
  v67 = 0;
  v18 = (void *)objc_opt_class();
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke;
  v61[3] = &unk_24D4B0FB8;
  v61[4] = &v68;
  v61[5] = &v62;
  objc_msgSend(v18, "_commandPayloadFromRapportRepresentation:result:", v15, v61);
  if (v63[5])
  {
    -[COMeshLocalNode commands](self, "commands");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "objectForKey:", v14);

    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v20, v63[5], 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v79[5];
    v79[5] = v21;

    if (v79[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (void *)v79[5];
        v79[5] = 0;

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v28 = (void *)v85[5];
        v85[5] = v24;

      }
    }
  }
  else
  {
    COCoreLogForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[COMeshLocalNode _handleRequestIdentifier:rapportRepresentation:options:responseHandler:fromNode:at:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v85[5];
    v85[5] = v26;

    *((_BYTE *)v75 + 24) = 1;
  }
  v29 = v79;
  v30 = (void *)v79[5];
  if (v30)
  {
    if (v69[5])
    {
      objc_msgSend(v30, "_setSendingConstituent:");
      v29 = v79;
    }
    if (v91[5])
    {
      objc_msgSend((id)v29[5], "_setSender:");
      v29 = v79;
    }
    objc_msgSend((id)v29[5], "_setRapportOptions:", v39);
  }
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__15;
  v59 = __Block_byref_object_dispose__15;
  v31 = (void *)v91[5];
  if (v31)
    objc_msgSend(v31, "delegate");
  else
    -[COMeshNode delegate](self, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x24BDAC760];
  v60 = v32;
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_266;
  v44[3] = &unk_24D4B2E88;
  v47 = &v90;
  v44[4] = self;
  v34 = v14;
  v45 = v34;
  v48 = &v84;
  v35 = v16;
  v46 = v35;
  v49 = &v55;
  v50 = &v68;
  v51 = &v74;
  v52 = &v78;
  v53 = &v62;
  v54 = a8;
  v36 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v44);
  if (!v91[5] && v69[5] && v79[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v37 = (void *)v56[5];
    v38 = v79[5];
    v40[0] = v33;
    v40[1] = 3221225472;
    v40[2] = __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_272;
    v40[3] = &unk_24D4B2E38;
    v43 = &v90;
    v40[4] = self;
    v41 = v34;
    v42 = v36;
    objc_msgSend(v37, "unknownNodeForRequest:result:", v38, v40);

  }
  else
  {
    v36[2](v36);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);

}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_266(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t v33;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  COCoreLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_266_cold_4();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_validateSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)) & 1) == 0)
    {
      COCoreLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_266_cold_3();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = 0;

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = 0;

    }
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (v16)
    {
      objc_msgSend(v16, "_setSender:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v19 = *(void **)(a1 + 48);
        v18 = *(_QWORD *)(a1 + 56);
        v20 = *(_QWORD *)(*(_QWORD *)(v18 + 8) + 40);
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_269;
        v30[3] = &unk_24D4B2E60;
        v30[4] = *(_QWORD *)(a1 + 32);
        v32 = v18;
        v33 = *(_QWORD *)(a1 + 112);
        v31 = v19;
        objc_msgSend(v17, "node:didReceiveRequest:responseCallBack:", v20, v21, v30);

      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (!v25)
        {
          COCoreLogForCategory(0);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_266_cold_2();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v29 = *(void **)(v28 + 40);
          *(_QWORD *)(v28 + 40) = v27;

          v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "node:didReceiveError:forCommand:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v25, 0);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        objc_msgSend(*(id *)(a1 + 32), "_invalidateAndReintroduceNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  _QWORD v18[4];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    COCoreLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_269_cold_1(a1, (uint64_t)v6, v7);
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_serializedDataForCommand:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_eventIDForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v20 = v15;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v16;
      _os_log_debug_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEBUG, "%@ responding with %@ to %@", buf, 0x20u);
    }

    v11 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "source", CFSTR("source"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = v7;
    v17[1] = CFSTR("command");
    v17[2] = CFSTR("response");
    v18[2] = v9;
    v17[3] = CFSTR("overhead");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(_QWORD *)(a1 + 56)));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_272(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
  COCoreLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    v7 = a1[4];
    v8 = a1[5];
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%@ received node %@ from delegate for request %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_invalidateAndReintroduceNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  COMeshLocalNode *v13;
  __int16 v14;
  NSObject *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoveryRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");
  if (objc_msgSend(v5, "length"))
  {
    -[COMeshLocalNode _nodeForIDSIdentifier:](self, "_nodeForIDSIdentifier:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      COCoreLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412802;
        v13 = self;
        v14 = 2112;
        v15 = v8;
        v16 = 2112;
        v17 = v4;
        v10 = "%@ reintroduced node %@ for %@";
LABEL_9:
        _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x20u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  if (v6)
  {
    -[COMeshLocalNode _handleDiscoveryRecord:](self, "_handleDiscoveryRecord:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v8 = v11;
      COCoreLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412802;
        v13 = self;
        v14 = 2112;
        v15 = v8;
        v16 = 2112;
        v17 = v4;
        v10 = "%@ reintroduced (IP) node %@ for %@";
        goto LABEL_9;
      }
LABEL_10:

      goto LABEL_13;
    }
  }
  COCoreLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[COMeshLocalNode _invalidateAndReintroduceNode:].cold.1();
LABEL_13:

}

- (NSSet)acceptableCommands
{
  return self->_acceptableCommands;
}

- (NSDictionary)commands
{
  return self->_commands;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (unsigned)listeningPort
{
  return self->_listeningPort;
}

- (NSArray)pendingActivation
{
  return self->_pendingActivation;
}

- (NSSet)ignoredIDSIdentifiers
{
  return self->_ignoredIDSIdentifiers;
}

- (void)setCompanionLinkClientFactory:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClientFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionLinkClientFactory, 0);
  objc_storeStrong((id *)&self->_ignoredIDSIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingActivation, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_acceptableCommands, 0);
}

- (void)_handleFoundDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ default set, IGNORING found device %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleEventIdentifier:rapportRepresentation:options:fromNode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ no event payload from %@");
  OUTLINED_FUNCTION_2_0();
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v1, "%@ disregarding %@ from unknown node", v2);
  OUTLINED_FUNCTION_2_0();
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E92000, a2, a3, "%@ did not produce command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ command failed source validation from %@");
  OUTLINED_FUNCTION_2_0();
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_260_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_15_1(&dword_215E92000, v0, v1, "%@ received %@ from %@");
  OUTLINED_FUNCTION_6_1();
}

- (void)_handleRequestIdentifier:rapportRepresentation:options:responseHandler:fromNode:at:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%{public}@ no request payload from %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_266_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ no command from %@");
  OUTLINED_FUNCTION_2_0();
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_266_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ request failed source validation from %@");
  OUTLINED_FUNCTION_2_0();
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_266_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_15_1(&dword_215E92000, v0, v1, "%@ received request %@ from %@");
  OUTLINED_FUNCTION_6_1();
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_269_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = a2;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_215E92000, log, OS_LOG_TYPE_ERROR, "%@ response error (%@) to %@", (uint8_t *)&v5, 0x20u);
  OUTLINED_FUNCTION_6_1();
}

- (void)_invalidateAndReintroduceNode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ failed to reintroduce node for %@");
  OUTLINED_FUNCTION_2_0();
}

@end
