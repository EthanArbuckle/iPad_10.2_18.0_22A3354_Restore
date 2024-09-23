@implementation NEUtilConfigurationClient

- (id)initInternalWithClientName:(id)a3
{
  id v4;
  NEUtilConfigurationClient *v5;
  uint64_t v6;
  NSString *clientName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEUtilConfigurationClient;
  v5 = -[NEUtilConfigurationClient init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v6;

  }
  return v5;
}

- (NEUtilConfigurationClient)initWithClientName:(id)a3
{
  id v4;
  NEUtilConfigurationClient *v5;
  NEConfigurationManager *v6;
  NEConfigurationManager *manager;
  NEConfigurationManager *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = -[NEUtilConfigurationClient initInternalWithClientName:](self, "initInternalWithClientName:", v4);
  if (v5)
  {
    if (geteuid())
    {
      v6 = objc_alloc_init(NEConfigurationManager);
    }
    else
    {
      +[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers");
      v6 = (NEConfigurationManager *)objc_claimAutoreleasedReturnValue();
    }
    manager = v5->_manager;
    v5->_manager = v6;

    objc_initWeak(&location, v5);
    v8 = v5->_manager;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__NEUtilConfigurationClient_initWithClientName___block_invoke;
    v12[3] = &unk_1E3CC3BF0;
    objc_copyWeak(&v13, &location);
    -[NEConfigurationManager setChangedQueue:andHandler:](v8, "setChangedQueue:andHandler:", v9, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NEUtilConfigurationClient;
  -[NEUtilConfigurationClient dealloc](&v2, sel_dealloc);
}

- (BOOL)enabled
{
  NEUtilConfigurationClient *v2;
  void *v3;
  const char *v4;
  id Property;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  id v14;
  id v15;
  void *v16;
  const char *v17;
  id v18;
  id v19;
  void *v20;
  const char *v21;
  id v22;
  id v23;
  void *v24;
  const char *v25;
  id v26;
  id v27;
  void *v28;
  const char *v29;
  id v30;
  void *v31;
  char v32;

  v2 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v2)
      Property = objc_getProperty(v2, v4, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
    v31 = v6;
    v32 = objc_msgSend(v6, "isEnabled");

    return v32;
  }
  if (v2)
    v7 = objc_getProperty(v2, v4, 56, 1);
  else
    v7 = 0;
  objc_msgSend(v7, "appVPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v2)
      v10 = objc_getProperty(v2, v9, 56, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "appVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (v2)
    v11 = objc_getProperty(v2, v9, 56, 1);
  else
    v11 = 0;
  objc_msgSend(v11, "contentFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v2)
      v14 = objc_getProperty(v2, v13, 56, 1);
    else
      v14 = 0;
    objc_msgSend(v14, "contentFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (v2)
    v15 = objc_getProperty(v2, v13, 56, 1);
  else
    v15 = 0;
  objc_msgSend(v15, "alwaysOnVPN");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v2)
      v18 = objc_getProperty(v2, v17, 56, 1);
    else
      v18 = 0;
    objc_msgSend(v18, "alwaysOnVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (v2)
    v19 = objc_getProperty(v2, v17, 56, 1);
  else
    v19 = 0;
  objc_msgSend(v19, "dnsProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (v2)
      v22 = objc_getProperty(v2, v21, 56, 1);
    else
      v22 = 0;
    objc_msgSend(v22, "dnsProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (v2)
    v23 = objc_getProperty(v2, v21, 56, 1);
  else
    v23 = 0;
  objc_msgSend(v23, "dnsSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v2)
      v26 = objc_getProperty(v2, v25, 56, 1);
    else
      v26 = 0;
    objc_msgSend(v26, "dnsSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (v2)
    v27 = objc_getProperty(v2, v25, 56, 1);
  else
    v27 = 0;
  objc_msgSend(v27, "relay");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    if (v2)
      v30 = objc_getProperty(v2, v29, 56, 1);
    else
      v30 = 0;
    objc_msgSend(v30, "relay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NEUtilConfigurationClient *v4;
  void *v5;
  const char *v6;
  id Property;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;
  void *v18;
  const char *v19;
  id v20;
  id v21;
  void *v22;
  const char *v23;
  id v24;
  id v25;
  void *v26;
  const char *v27;
  id v28;
  id v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;
  void *v34;
  const char *v35;
  id v36;
  id v37;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
      Property = objc_getProperty(v4, v6, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:
    v37 = v8;
    objc_msgSend(v8, "setEnabled:", v3);

    return;
  }
  if (v4)
    v9 = objc_getProperty(v4, v6, 56, 1);
  else
    v9 = 0;
  objc_msgSend(v9, "appVPN");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v4)
      v12 = objc_getProperty(v4, v11, 56, 1);
    else
      v12 = 0;
    objc_msgSend(v12, "appVPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if (v4)
    v13 = objc_getProperty(v4, v11, 56, 1);
  else
    v13 = 0;
  objc_msgSend(v13, "contentFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v4)
      v16 = objc_getProperty(v4, v15, 56, 1);
    else
      v16 = 0;
    objc_msgSend(v16, "contentFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if (v4)
    v17 = objc_getProperty(v4, v15, 56, 1);
  else
    v17 = 0;
  objc_msgSend(v17, "alwaysOnVPN");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (v4)
      v20 = objc_getProperty(v4, v19, 56, 1);
    else
      v20 = 0;
    objc_msgSend(v20, "alwaysOnVPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if (v4)
    v21 = objc_getProperty(v4, v19, 56, 1);
  else
    v21 = 0;
  objc_msgSend(v21, "dnsSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    if (v4)
      v24 = objc_getProperty(v4, v23, 56, 1);
    else
      v24 = 0;
    objc_msgSend(v24, "dnsSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if (v4)
    v25 = objc_getProperty(v4, v23, 56, 1);
  else
    v25 = 0;
  objc_msgSend(v25, "dnsProxy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if (v4)
      v28 = objc_getProperty(v4, v27, 56, 1);
    else
      v28 = 0;
    objc_msgSend(v28, "dnsProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if (v4)
    v29 = objc_getProperty(v4, v27, 56, 1);
  else
    v29 = 0;
  objc_msgSend(v29, "pathController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    if (v4)
      v32 = objc_getProperty(v4, v31, 56, 1);
    else
      v32 = 0;
    objc_msgSend(v32, "pathController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if (v4)
    v33 = objc_getProperty(v4, v31, 56, 1);
  else
    v33 = 0;
  objc_msgSend(v33, "relay");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (v4)
      v36 = objc_getProperty(v4, v35, 56, 1);
    else
      v36 = 0;
    objc_msgSend(v36, "relay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
}

- (BOOL)onDemandEnabled
{
  NEUtilConfigurationClient *v2;
  void *v3;
  const char *v4;
  id Property;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  char v12;

  v2 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v2)
      Property = objc_getProperty(v2, v4, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v11 = v6;
    v12 = objc_msgSend(v6, "isOnDemandEnabled");

    return v12;
  }
  if (v2)
    v7 = objc_getProperty(v2, v4, 56, 1);
  else
    v7 = 0;
  objc_msgSend(v7, "appVPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v2)
      v10 = objc_getProperty(v2, v9, 56, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "appVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  return 0;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NEUtilConfigurationClient *v4;
  void *v5;
  const char *v6;
  id Property;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
      Property = objc_getProperty(v4, v6, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v13 = v8;
    objc_msgSend(v8, "setOnDemandEnabled:", v3);

    return;
  }
  if (v4)
    v9 = objc_getProperty(v4, v6, 56, 1);
  else
    v9 = 0;
  objc_msgSend(v9, "appVPN");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v4)
      v12 = objc_getProperty(v4, v11, 56, 1);
    else
      v12 = 0;
    objc_msgSend(v12, "appVPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
}

- (BOOL)onDemandUserOverrideDisabled
{
  NEUtilConfigurationClient *v2;
  const char *v3;
  void *v4;
  id Property;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;

  v2 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v2)
      Property = objc_getProperty(v2, v3, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
      v7 = objc_getProperty(v2, v3, 56, 1);
    else
      v7 = 0;
    objc_msgSend(v7, "appVPN");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  v9 = objc_msgSend(v8, "isOnDemandUserOverrideDisabled");
  return v9;
}

- (void)setOnDemandUserOverrideDisabled:(BOOL)a3
{
  _BOOL8 v3;
  NEUtilConfigurationClient *v4;
  const char *v5;
  void *v6;
  id Property;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v4)
      Property = objc_getProperty(v4, v5, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
      v9 = objc_getProperty(v4, v5, 56, 1);
    else
      v9 = 0;
    objc_msgSend(v9, "appVPN");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v8;

  v10 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setOnDemandUserOverrideDisabled:", v3);
    v10 = v11;
  }

}

- (BOOL)disconnectOnDemandEnabled
{
  NEUtilConfigurationClient *v2;
  void *v3;
  const char *v4;
  id Property;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  char v12;

  v2 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v2)
      Property = objc_getProperty(v2, v4, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v11 = v6;
    v12 = objc_msgSend(v6, "isDisconnectOnDemandEnabled");

    return v12;
  }
  if (v2)
    v7 = objc_getProperty(v2, v4, 56, 1);
  else
    v7 = 0;
  objc_msgSend(v7, "appVPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v2)
      v10 = objc_getProperty(v2, v9, 56, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "appVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  return 0;
}

- (void)setDisconnectOnDemandEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NEUtilConfigurationClient *v4;
  void *v5;
  const char *v6;
  id Property;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;

  v3 = a3;
  v4 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
      Property = objc_getProperty(v4, v6, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v13 = v8;
    objc_msgSend(v8, "setDisconnectOnDemandEnabled:", v3);

    return;
  }
  if (v4)
    v9 = objc_getProperty(v4, v6, 56, 1);
  else
    v9 = 0;
  objc_msgSend(v9, "appVPN");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v4)
      v12 = objc_getProperty(v4, v11, 56, 1);
    else
      v12 = 0;
    objc_msgSend(v12, "appVPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
}

- (NSArray)onDemandRules
{
  NEUtilConfigurationClient *v2;
  void *v3;
  const char *v4;
  id Property;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  id v14;
  void *v15;

  v2 = self;
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v2)
      Property = objc_getProperty(v2, v4, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "VPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v15 = v6;
    objc_msgSend(v6, "onDemandRules");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v12;
  }
  if (v2)
    v7 = objc_getProperty(v2, v4, 56, 1);
  else
    v7 = 0;
  objc_msgSend(v7, "appVPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v2)
      v10 = objc_getProperty(v2, v9, 56, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "appVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v2)
    v11 = objc_getProperty(v2, v9, 56, 1);
  else
    v11 = 0;
  objc_msgSend(v11, "dnsSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v2)
      v14 = objc_getProperty(v2, v13, 56, 1);
    else
      v14 = 0;
    objc_msgSend(v14, "dnsSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  return (NSArray *)v12;
}

- (void)setOnDemandRules:(id)a3
{
  const char *v4;
  id Property;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  const char *v14;
  const char *v15;
  id v16;
  id v17;
  void *v18;
  const char *v19;
  id v20;
  void *v21;
  id v22;

  v22 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 56, 1);
  else
    Property = 0;
  objc_msgSend(Property, "VPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = (void *)objc_msgSend(v22, "copy");
    if (self)
      v10 = objc_getProperty(self, v8, 56, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "VPN");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v21 = v11;
    objc_msgSend(v11, "setOnDemandRules:", v9);

    goto LABEL_20;
  }
  if (self)
    v12 = objc_getProperty(self, v7, 56, 1);
  else
    v12 = 0;
  objc_msgSend(v12, "appVPN");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v9 = (void *)objc_msgSend(v22, "copy");
    if (self)
      v16 = objc_getProperty(self, v15, 56, 1);
    else
      v16 = 0;
    objc_msgSend(v16, "appVPN");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (self)
    v17 = objc_getProperty(self, v14, 56, 1);
  else
    v17 = 0;
  objc_msgSend(v17, "dnsSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v9 = (void *)objc_msgSend(v22, "copy");
    if (self)
      v20 = objc_getProperty(self, v19, 56, 1);
    else
      v20 = 0;
    objc_msgSend(v20, "dnsSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_20:

}

- (id)protocolForParameters:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  void *v7;
  const char *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  const char *v20;
  id v21;
  void *v22;
  void *v23;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 56, 1);
  else
    Property = 0;
  objc_msgSend(Property, "VPN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (self)
      v9 = objc_getProperty(self, v8, 56, 1);
    else
      v9 = 0;
    objc_msgSend(v9, "VPN");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v15 = v10;
    objc_msgSend(v10, "protocol");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (self)
    v11 = objc_getProperty(self, v8, 56, 1);
  else
    v11 = 0;
  objc_msgSend(v11, "appVPN");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (self)
      v14 = objc_getProperty(self, v13, 56, 1);
    else
      v14 = 0;
    objc_msgSend(v14, "appVPN");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (self)
    v18 = objc_getProperty(self, v13, 56, 1);
  else
    v18 = 0;
  objc_msgSend(v18, "alwaysOnVPN");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v16 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("interface-name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (self)
      v21 = objc_getProperty(self, v20, 56, 1);
    else
      v21 = 0;
    objc_msgSend(v21, "alwaysOnVPN");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "interfaceProtocolMapping");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
LABEL_14:

LABEL_15:
  return v16;
}

- (NEFilterProviderConfiguration)filterConfiguration
{
  void *v2;
  void *v3;

  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient contentFilter](self, "contentFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NEFilterProviderConfiguration *)v3;
}

- (NEDNSProxyProviderProtocol)dnsProxyConfiguration
{
  void *v2;
  void *v3;

  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  -[NEUtilConfigurationClient dnsProxy](self, "dnsProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NEDNSProxyProviderProtocol *)v3;
}

- (NEDNSSettingsBundle)dnsSettingsBundle
{
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  return (NEDNSSettingsBundle *)-[NEUtilConfigurationClient dnsSettings](self, "dnsSettings");
}

- (NEAppPush)appPush
{
  if (self)
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56, 1);
  return -[NEUtilConfigurationClient appPush](self, "appPush");
}

- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NEConfiguration *v11;
  NEVPNApp *v12;
  BOOL v13;
  const char *v14;
  const char *v15;
  id v16;
  SEL v17;
  id Property;
  NEConfiguration *currentConfiguration;
  NEConfiguration *v20;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("grade"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "isEqualToString:", CFSTR("enterprise")) & 1) == 0)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("personal")) & 1) != 0)
    {
      v10 = 2;
    }
    else
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("system")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid configuration grade: %@"), v9);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      v10 = 3;
    }
  }
  else
  {
    v10 = 1;
  }
  v11 = -[NEConfiguration initWithName:grade:]([NEConfiguration alloc], "initWithName:grade:", v7, v10);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("vpn")))
  {
    v12 = objc_alloc_init(NEVPN);
    -[NEConfiguration setVPN:](v11, "setVPN:", v12);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("aovpn")))
  {
    v12 = objc_alloc_init(NEAOVPN);
    -[NEConfiguration setAlwaysOnVPN:](v11, "setAlwaysOnVPN:", v12);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("appvpn")))
  {
    v12 = objc_alloc_init(NEVPNApp);
    -[NEConfiguration setAppVPN:](v11, "setAppVPN:", v12);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("contentfilter")))
  {
    v12 = objc_alloc_init(NEContentFilter);
    -[NEConfiguration setContentFilter:](v11, "setContentFilter:", v12);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("pathcontroller")))
  {
    v12 = objc_alloc_init(NEPathController);
    -[NEConfiguration setPathController:](v11, "setPathController:", v12);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("dnsproxy")))
  {
    v12 = objc_alloc_init(NEDNSProxy);
    -[NEConfiguration setDnsProxy:](v11, "setDnsProxy:", v12);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("dnssettings")))
  {
    v12 = objc_alloc_init(NEDNSSettingsBundle);
    -[NEConfiguration setDnsSettings:](v11, "setDnsSettings:", v12);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("appPush")))
  {
    v12 = objc_alloc_init(NEAppPush);
    -[NEConfiguration setAppPush:](v11, "setAppPush:", v12);
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("relay")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid configuration type: %@"), v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      goto LABEL_32;
    }
    v12 = objc_alloc_init(NERelayConfiguration);
    -[NEConfiguration setRelay:](v11, "setRelay:", v12);
  }

  if (self)
  {
    if (!objc_getProperty(self, v14, 32, 1))
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_setProperty_atomic(self, v17, v16, 32);

    }
    Property = objc_getProperty(self, v15, 32, 1);
  }
  else
  {

    Property = 0;
  }
  objc_msgSend(Property, "addObject:", v11);
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v11;
  v20 = v11;

  v13 = 1;
LABEL_32:

  return v13;
}

- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  __objc2_class *v8;
  const char *v9;
  NETunnelProviderProtocol *v10;
  id Property;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  const char *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  const char *v27;
  const char *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  BOOL v34;
  const char *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  const char *v40;
  id v41;
  const char *v42;
  id v43;
  const char *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  char v56;
  NEFilterProviderConfiguration *v57;
  void *v58;
  const char *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  char isKindOfClass;
  void *v66;
  const char *v67;
  id v68;
  __CFString *v69;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ikev1")))
  {
    v8 = NEVPNProtocolIPSec;
    goto LABEL_8;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("ikev2")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("l2tp")))
    {
      v8 = NEVPNProtocolL2TP;
      goto LABEL_8;
    }
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("aovpn")))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("plugin")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("plugin-type"));
        v50 = objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v51 = (void *)v50;
          v10 = -[NETunnelProviderProtocol initWithPluginType:]([NETunnelProviderProtocol alloc], "initWithPluginType:", v50);

          if (self)
            goto LABEL_9;
          goto LABEL_57;
        }
        v34 = 0;
        v69 = CFSTR("Missing plugin type");
      }
      else
      {
        v34 = 0;
        v69 = CFSTR("Invalid protocol type");
      }
      *a4 = v69;
      goto LABEL_53;
    }
  }
  v8 = NEVPNProtocolIKEv2;
LABEL_8:
  v10 = (NETunnelProviderProtocol *)objc_alloc_init(v8);
  if (self)
  {
LABEL_9:
    Property = objc_getProperty(self, v9, 56, 1);
    goto LABEL_10;
  }
LABEL_57:
  Property = 0;
LABEL_10:
  objc_msgSend(Property, "alwaysOnVPN");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (self)
      v25 = objc_getProperty(self, v13, 56, 1);
    else
      v25 = 0;
    objc_msgSend(v25, "appVPN");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (-[NEVPNProtocol type](v10, "type") != 4
        && -[NEVPNProtocol type](v10, "type") != 1
        && -[NEVPNProtocol type](v10, "type") != 5)
      {
        v33 = CFSTR("Only \"plugin\" and IKE protocols are supported with App VPN");
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self)
          v29 = objc_getProperty(self, v28, 56, 1);
        else
          v29 = 0;
        objc_msgSend(v29, "appVPN");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = 2;
      }
      else
      {
        if (self)
          v43 = objc_getProperty(self, v28, 56, 1);
        else
          v43 = 0;
        objc_msgSend(v43, "appVPN");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = 1;
      }
      objc_msgSend(v30, "setTunnelType:", v32);

      if (self)
        v45 = objc_getProperty(self, v44, 56, 1);
      else
        v45 = 0;
      objc_msgSend(v45, "appVPN");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (self)
        v38 = objc_getProperty(self, v27, 56, 1);
      else
        v38 = 0;
      objc_msgSend(v38, "VPN");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v39)
      {
        if (self)
          v52 = objc_getProperty(self, v40, 56, 1);
        else
          v52 = 0;
        objc_msgSend(v52, "contentFilter");
        v53 = objc_claimAutoreleasedReturnValue();
        if (v53
          && (v55 = (void *)v53, objc_opt_class(), v56 = objc_opt_isKindOfClass(), v55, (v56 & 1) != 0))
        {
          v57 = objc_alloc_init(NEFilterProviderConfiguration);
          -[NETunnelProviderProtocol pluginType](v10, "pluginType");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEFilterProviderConfiguration setPluginType:](v57, "setPluginType:", v58);

          if (self)
            v60 = objc_getProperty(self, v59, 56, 1);
          else
            v60 = 0;
          objc_msgSend(v60, "contentFilter");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setProvider:", v57);
        }
        else
        {
          if (self)
            v62 = objc_getProperty(self, v54, 56, 1);
          else
            v62 = 0;
          objc_msgSend(v62, "dnsProxy");
          v63 = objc_claimAutoreleasedReturnValue();
          if (!v63
            || (v64 = (void *)v63,
                objc_opt_class(),
                isKindOfClass = objc_opt_isKindOfClass(),
                v64,
                (isKindOfClass & 1) == 0))
          {
            v33 = CFSTR("Configuration does not have a VPN type");
            goto LABEL_29;
          }
          v57 = objc_alloc_init(NEDNSProxyProviderProtocol);
          -[NETunnelProviderProtocol pluginType](v10, "pluginType");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEFilterProviderConfiguration setPluginType:](v57, "setPluginType:", v66);

          if (self)
            v68 = objc_getProperty(self, v67, 56, 1);
          else
            v68 = 0;
          objc_msgSend(v68, "dnsProxy");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setProtocol:", v57);
        }

LABEL_52:
        v34 = 1;
        goto LABEL_53;
      }
      if (self)
        v41 = objc_getProperty(self, v40, 56, 1);
      else
        v41 = 0;
      if (objc_msgSend(v41, "grade") == 2 && -[NEVPNProtocol type](v10, "type") == 2)
      {
        v33 = CFSTR("PPP protocols are not supported with Personal VPN");
        goto LABEL_29;
      }
      if (self)
        v47 = objc_getProperty(self, v42, 56, 1);
      else
        v47 = 0;
      objc_msgSend(v47, "VPN");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v48 = v46;
    objc_msgSend(v46, "setProtocol:", v10);

    goto LABEL_52;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interface-name"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v16 = (void *)v14;
    if (self)
      v17 = objc_getProperty(self, v15, 56, 1);
    else
      v17 = 0;
    objc_msgSend(v17, "alwaysOnVPN");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "interfaceProtocolMapping");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (self)
        v21 = objc_getProperty(self, v20, 56, 1);
      else
        v21 = 0;
      objc_msgSend(v21, "alwaysOnVPN");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "interfaceProtocolMapping");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "mutableCopy");

    }
    else
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v10, v16);
    if (self)
      v36 = objc_getProperty(self, v35, 56, 1);
    else
      v36 = 0;
    objc_msgSend(v36, "alwaysOnVPN");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setInterfaceProtocolMapping:", v24);

    goto LABEL_52;
  }
  v33 = CFSTR("Missing interface name");
LABEL_29:
  *a4 = v33;

  v34 = 0;
LABEL_53:

  return v34;
}

- (BOOL)setFilterPluginWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
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
  void *v32;

  v6 = a3;
  -[NEUtilConfigurationClient filterConfiguration](self, "filterConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("organization"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("organization"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setOrganization:", v9);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filter-browsers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filter-browsers"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilterBrowsers:", objc_msgSend(v11, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filter-sockets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filter-sockets"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilterSockets:", objc_msgSend(v13, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filter-packets"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filter-packets"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilterPackets:", objc_msgSend(v15, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disable-default-drop"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disable-default-drop"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDisableDefaultDrop:", objc_msgSend(v17, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("preserve-existing-connections"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("preserve-existing-connections"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreserveExistingConnections:", objc_msgSend(v19, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vendor-config"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = isa_nsdictionary(v20);

    if (v21)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vendor-config"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVendorConfiguration:", v22);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("provider-bundle-identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("provider-bundle-identifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilterDataProviderBundleIdentifier:", v24);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByRemovingPercentEncoding");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDataProviderDesignatedRequirement:", v27);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("packet-provider-bundle-identifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("packet-provider-bundle-identifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilterPacketProviderBundleIdentifier:", v29);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("packet-provider-designated-requirement"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("packet-provider-designated-requirement"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringByRemovingPercentEncoding");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPacketProviderDesignatedRequirement:", v32);

    }
  }
  else
  {
    *a4 = CFSTR("Filter plugin type has not been set yet");
  }

  return v7 != 0;
}

- (BOOL)unsetFilterPluginParameters:(id)a3 errorStr:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[NEUtilConfigurationClient filterConfiguration](self, "filterConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("organization"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "setOrganization:", 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vendor-config"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "setVendorConfiguration:", 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v6, "setDataProviderDesignatedRequirement:", 0);

  return 1;
}

- (BOOL)setDNSProxyWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[NEUtilConfigurationClient dnsProxyConfiguration](self, "dnsProxyConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vendor-config"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = isa_nsdictionary(v8);

    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vendor-config"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProviderConfiguration:", v10);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByRemovingPercentEncoding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDesignatedRequirement:", v13);

    }
  }
  else
  {
    *a4 = CFSTR("DNS Proxy plugin type has not been set yet");
  }

  return v7 != 0;
}

- (BOOL)unsetDNSProxyWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v5 = a3;
  -[NEUtilConfigurationClient dnsProxyConfiguration](self, "dnsProxyConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vendor-config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = isa_nsdictionary(v7);

  if (v8)
    objc_msgSend(v6, "setProviderConfiguration:", 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v6, "setDesignatedRequirement:", 0);

  return 1;
}

- (BOOL)setCommonParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  const char *v37;
  id v38;
  const char *v39;
  void *v40;
  unint64_t v41;
  const char *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  const char *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  SEL v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;

  v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient filterConfiguration](self, "filterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NEUtilConfigurationClient isAlwaysOn](self, "isAlwaysOn"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interface-name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = isa_nsstring(v9);

    if ((v10 & 1) == 0)
    {
      v17 = 0;
      v18 = CFSTR("Missing interface name");
      goto LABEL_9;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEUtilConfigurationClient setEnabled:](self, "setEnabled:", objc_msgSend(v12, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-address"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v7)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-address"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByRemovingPercentEncoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
    }
    else
    {
      if (!v8)
        goto LABEL_13;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-address"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByRemovingPercentEncoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8;
    }
    objc_msgSend(v16, "setServerAddress:", v15);

  }
LABEL_13:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (v7)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUsername:", v20);

      goto LABEL_17;
    }
    if (v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUsername:", v24);
LABEL_22:

    }
LABEL_23:
    v17 = 1;
    goto LABEL_77;
  }
  if (!v7)
    goto LABEL_23;
LABEL_17:
  if (!-[NEUtilConfigurationClient setPasswordWithParameters:errorStr:](self, "setPasswordWithParameters:errorStr:", v6, a4))
  {
LABEL_76:
    v17 = 0;
    goto LABEL_77;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("on-demand-enabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("on-demand-enabled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disconnect-on-demand-enabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v27 = 0;
    if (!v21)
      goto LABEL_28;
    goto LABEL_27;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disconnect-on-demand-enabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  if (v21)
LABEL_27:
    -[NEUtilConfigurationClient setOnDemandEnabled:](self, "setOnDemandEnabled:", v23);
LABEL_28:
  if (v25)
    -[NEUtilConfigurationClient setDisconnectOnDemandEnabled:](self, "setDisconnectOnDemandEnabled:", v27);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("on-demand-user-override-disabled"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("on-demand-user-override-disabled"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEUtilConfigurationClient setOnDemandUserOverrideDisabled:](self, "setOnDemandUserOverrideDisabled:", objc_msgSend(v29, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disconnect-on-idle-timeout"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disconnect-on-idle-timeout"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisconnectOnIdleTimeout:", objc_msgSend(v31, "intValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disconnect-on-sleep"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disconnect-on-sleep"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisconnectOnSleep:", objc_msgSend(v33, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identity"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identity"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "integerValue");

    if (!self
      || (v38 = objc_getProperty(self, v37, 48, 1)) == 0
      || (v40 = v38, v41 = objc_msgSend(objc_getProperty(self, v39, 48, 1), "count"), v40, v36 >= v41))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@ index, use the \"list-identities\" command to obtain a list of available identities and their indicies"), CFSTR("identity"));
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    }
    objc_msgSend(objc_getProperty(self, v42, 48, 1), "objectAtIndexedSubscript:", v36);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("domain"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "integerValue");

    if (v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, an identity in the %s keychain is required"), CFSTR("identity"), "system");
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_76;
    }
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("persistent-reference"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentityReferenceInternal:", v46);

  }
  if (!-[NEUtilConfigurationClient setProviderTypeWithParameters:errorStr:](self, "setProviderTypeWithParameters:errorStr:", v6, a4))goto LABEL_76;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("provider-bundle-identifier"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = 0;
      v18 = CFSTR("\"provider-bundle-identifier\" can only be specified for provider-based configurations");
      goto LABEL_9;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("provider-bundle-identifier"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProviderBundleIdentifier:", v48);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
LABEL_54:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extensible-sso-provider"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extensible-sso-provider"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringByRemovingPercentEncoding");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExtensibleSSOProvider:", v54);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("access-group"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v7, "passwordKeychainItem");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("access-group"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "passwordKeychainItem");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setAccessGroup:", v58);

      }
      v60 = objc_getProperty(v7, v57, 96, 1);

      if (v60)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("access-group"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_getProperty(v7, v62, 96, 1);
        objc_msgSend(v63, "setAccessGroup:", v61);

      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("include-all-networks"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("include-all-networks"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIncludeAllNetworks:", objc_msgSend(v65, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-local-networks"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-local-networks"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExcludeLocalNetworks:", objc_msgSend(v67, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-cellular-services"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-cellular-services"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExcludeCellularServices:", objc_msgSend(v69, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-apns"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-apns"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExcludeAPNs:", objc_msgSend(v71, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-device-communication"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-device-communication"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExcludeDeviceCommunication:", objc_msgSend(v73, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enforce-routes"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enforce-routes"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnforceRoutes:", objc_msgSend(v75, "BOOLValue"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellular-slice-UUID"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v76)
      goto LABEL_23;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellular-slice-UUID"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "componentsSeparatedByString:", CFSTR("/"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v24, "count") >= 2)
    {
      v78 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)objc_msgSend(v78, "initWithFormat:", CFSTR("%@:%@"), v79, v80);
      objc_msgSend(v7, "setSliceUUID:", v81);

    }
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringByRemovingPercentEncoding");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDesignatedRequirement:", v51);

    goto LABEL_54;
  }
  v17 = 0;
  v18 = CFSTR("\"designated-requirement\" can only be specified for provider-based configurations");
LABEL_9:
  *a4 = v18;
LABEL_77:

  return v17;
}

- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NEKeychainItem *v11;
  const char *v12;
  uint64_t v13;
  id Property;
  NEKeychainItem *v15;

  v5 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v5);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "passwordKeychainItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "passwordKeychainItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPassword:", v9);
    }
    else
    {
      v11 = [NEKeychainItem alloc];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v13 = v6[10];
        Property = objc_getProperty(v6, v12, 88, 1);
      }
      else
      {
        v13 = 0;
        Property = 0;
      }
      v10 = Property;
      v15 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v11, "initWithPassword:domain:accessGroup:", v9, v13, v10);
      objc_msgSend(v6, "setPasswordKeychainItem:", v15);

    }
  }

  return 1;
}

- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const char *v9;
  id Property;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  const char *v21;
  id v22;

  v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("provider-type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_16:
    v20 = 1;
    goto LABEL_17;
  }
  if (self)
    Property = objc_getProperty(self, v9, 56, 1);
  else
    Property = 0;
  objc_msgSend(Property, "appVPN");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = objc_msgSend(v7, "type");

    if (v13 == 4)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("provider-type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("app-proxy")))
      {
        if (self)
          v16 = objc_getProperty(self, v15, 56, 1);
        else
          v16 = 0;
        objc_msgSend(v16, "appVPN");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = 2;
      }
      else
      {
        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("packet-tunnel")))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, must be either \"app-proxy\" or \"packet-tunnel\"), CFSTR("provider-type"));
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v20 = 0;
          goto LABEL_17;
        }
        if (self)
          v22 = objc_getProperty(self, v21, 56, 1);
        else
          v22 = 0;
        objc_msgSend(v22, "appVPN");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = 1;
      }
      objc_msgSend(v17, "setTunnelType:", v19);

      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provider type can only be set for plugin-based per-app VPN configurations"));
  v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v20;
}

- (BOOL)unsetCommonParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  __CFString *v27;

  v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NEUtilConfigurationClient isAlwaysOn](self, "isAlwaysOn"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      v26 = 0;
      v27 = CFSTR("Missing interface name");
      goto LABEL_46;
    }
  }
  if (!v7)
  {
    v26 = 0;
    v27 = CFSTR("Missing protocol");
    goto LABEL_46;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[NEUtilConfigurationClient setEnabled:](self, "setEnabled:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-address"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v7, "setServerAddress:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v7, "setUsername:", 0);
  if (!-[NEUtilConfigurationClient unsetPasswordWithParameters:errorStr:](self, "unsetPasswordWithParameters:errorStr:", v6, a4))
  {
    v26 = 0;
    goto LABEL_47;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disconnect-on-idle-timeout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v7, "setDisconnectOnIdleTimeout:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disconnect-on-sleep"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v7, "setDisconnectOnSleep:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v7, "setIdentityReferenceInternal:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("provider-bundle-identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = 0;
      v27 = CFSTR("\"provider-bundle-identifier\" can only be specified for provider-based configurations");
      goto LABEL_46;
    }
    objc_msgSend(v7, "setProviderBundleIdentifier:", 0);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("designated-requirement"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v7, "setDesignatedRequirement:", 0);
      goto LABEL_24;
    }
    v26 = 0;
    v27 = CFSTR("\"designated-requirement\" can only be specified for provider-based configurations");
LABEL_46:
    *a4 = v27;
    goto LABEL_47;
  }
LABEL_24:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extensible-sso-provider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v7, "setExtensibleSSOProvider:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("include-all-networks"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v7, "setIncludeAllNetworks:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-local-networks"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v7, "setExcludeLocalNetworks:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-cellular-services"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v7, "setExcludeCellularServices:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-apns"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v7, "setExcludeAPNs:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-device-communication"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v7, "setExcludeDeviceCommunication:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enforce-routes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v7, "setEnforceRoutes:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cellular-slice-UUID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v7, "setSliceUUID:", 0);
  v26 = 1;
LABEL_47:

  return v26;
}

- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "passwordKeychainItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "passwordKeychainItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIdentifier:", 0);

    }
  }

  return 1;
}

- (BOOL)setIPSecParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __CFString *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
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
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  unsigned int v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NEUtilConfigurationClient isAlwaysOn](self, "isAlwaysOn"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interface-name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      v13 = 0;
      v14 = CFSTR("Missing interface name");
      goto LABEL_10;
    }
  }
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = 0;
    v14 = CFSTR("Configuration VPN type is not IPSec");
LABEL_10:
    *a4 = v14;
    goto LABEL_11;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authentication-method"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authentication-method"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("certificate")) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("shared-secret")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"none\", \"certificate\", and \"shared-secret\"), CFSTR("authentication-method"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_84;
      }
      v12 = 2;
    }
    objc_msgSend(v7, "setAuthenticationMethod:", v12);

  }
  if (!-[NEUtilConfigurationClient setSharedSecretWithParameters:errorStr:](self, "setSharedSecretWithParameters:errorStr:", v6, a4))
  {
LABEL_84:
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certificate-type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certificate-type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RSA")) & 1) != 0)
    {
      v18 = 1;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ECDSA256")) & 1) != 0)
    {
      v18 = 2;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ECDSA384")) & 1) != 0)
    {
      v18 = 3;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ECDSA521")) & 1) != 0)
    {
      v18 = 4;
    }
    else
    {
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("Ed25519")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"RSA\", \"ECDSA256\", \"ECDSA384\", \"ECDSA521\", and \"Ed25519\"), CFSTR("certificate-type"), v87, v88, v89, v90, v91, v92, v93);
        goto LABEL_83;
      }
      v18 = 5;
    }
    objc_msgSend(v7, "setCertificateType:", v18);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-internal-ip-subnet"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-internal-ip-subnet"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUseConfigurationAttributeInternalIPSubnet:", objc_msgSend(v20, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disable-mobike"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disable-mobike"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisableMOBIKE:", objc_msgSend(v22, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disable-redirect"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disable-redirect"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisableRedirect:", objc_msgSend(v24, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-pfs"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-pfs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnablePFS:", objc_msgSend(v26, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-revocation-check"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if (objc_msgSend(v7, "type") == 5)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-revocation-check"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnableRevocationCheck:", objc_msgSend(v28, "BOOLValue"));

      if ((objc_msgSend(v7, "enableRevocationCheck") & 1) == 0)
        objc_msgSend(v7, "setStrictRevocationCheck:", 0);
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("strict-revocation-check"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29 && objc_msgSend(v7, "type") == 5 && objc_msgSend(v7, "enableRevocationCheck"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("strict-revocation-check"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrictRevocationCheck:", objc_msgSend(v30, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tls-minimum-version"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 && objc_msgSend(v7, "type") == 5)
  {
    v32 = CFSTR("tls-minimum-version");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tls-minimum-version"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("1.0")) & 1) != 0)
    {
      v33 = 1;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("1.1")) & 1) != 0)
    {
      v33 = 2;
    }
    else
    {
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("1.2")) & 1) == 0)
        goto LABEL_82;
      v33 = 3;
    }
    objc_msgSend(v7, "setMinimumTLSVersion:", v33);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tls-maximum-version"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 && objc_msgSend(v7, "type") == 5)
  {
    v32 = CFSTR("tls-maximum-version");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tls-maximum-version"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("1.0")) & 1) != 0)
    {
      v35 = 1;
LABEL_69:
      objc_msgSend(v7, "setMaximumTLSVersion:", v35);

      goto LABEL_70;
    }
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("1.1")) & 1) != 0)
    {
      v35 = 2;
      goto LABEL_69;
    }
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("1.2")) & 1) != 0)
    {
      v35 = 3;
      goto LABEL_69;
    }
LABEL_82:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"1.0\", \"1.1\", and \"1.2\"), v32, v87, v88, v89, v90, v91, v92, v93);
    goto LABEL_83;
  }
LABEL_70:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("local-identifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("local-identifier"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalIdentifier:", v37);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("remote-identifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("remote-identifier"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteIdentifier:", v39);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-extended-authentication"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-extended-authentication"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUseExtendedAuthentication:", objc_msgSend(v41, "BOOLValue"));

  }
  v42 = CFSTR("dead-peer-detection-rate");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dead-peer-detection-rate"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_187;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dead-peer-detection-rate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v44 = 0;
LABEL_89:
      objc_msgSend(v7, "setDeadPeerDetectionRate:", v44);

      goto LABEL_90;
    }
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("low")) & 1) != 0)
    {
      v44 = 1;
      goto LABEL_89;
    }
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("medium")) & 1) != 0)
    {
      v44 = 2;
      goto LABEL_89;
    }
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("high")) & 1) != 0)
    {
      v44 = 3;
      goto LABEL_89;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"none\", \"low\", \"medium\", and \"high\"), CFSTR("dead-peer-detection-rate"), v87, v88, v89, v90, v91, v92, v93);
LABEL_83:
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_84;
  }
LABEL_90:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-CA-name"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-CA-name"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setServerCertificateIssuerCommonName:", v46);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-cert-name"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-cert-name"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setServerCertificateCommonName:", v48);

  }
  v42 = CFSTR("encryption-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encryption-algorithm"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_187;
    v50 = CFSTR("encryption-algorithm");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encryption-algorithm"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("DES")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      v53 = 1;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("3DES")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      v53 = 2;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("AES-128")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      v53 = 3;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("AES-256")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      v53 = 4;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("AES-128-GCM")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      v53 = 5;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("AES-256-GCM")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      v53 = 6;
    }
    else
    {
      if (!objc_msgSend(v17, "isEqualToString:", CFSTR("ChaCha20Poly1305")))
      {
LABEL_167:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", and \"%@\"), v50, CFSTR("DES"), CFSTR("3DES"), CFSTR("AES-128"), CFSTR("AES-256"), CFSTR("AES-128-GCM"), CFSTR("AES-256-GCM"), CFSTR("ChaCha20Poly1305"));
        goto LABEL_83;
      }
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      v53 = 7;
    }
    objc_msgSend(v51, "setEncryptionAlgorithm:", v53);

  }
  v42 = CFSTR("integrity-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("integrity-algorithm"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_187;
    v55 = CFSTR("integrity-algorithm");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("integrity-algorithm"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("SHA1-96")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      v58 = 1;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("SHA1-160")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      v58 = 2;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("SHA2-256")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      v58 = 3;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("SHA2-384")))
    {
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      v58 = 4;
    }
    else
    {
      if (!objc_msgSend(v17, "isEqualToString:", CFSTR("SHA2-512")))
      {
LABEL_190:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"%@\" and \"%@\"), v55, CFSTR("SHA1-96"), CFSTR("SHA1-160"), v89, v90, v91, v92, v93);
        goto LABEL_83;
      }
      objc_msgSend(v7, "IKESecurityAssociationParameters");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      v58 = 5;
    }
    objc_msgSend(v56, "setIntegrityAlgorithm:", v58);

  }
  v42 = CFSTR("diffie-hellman-group");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("diffie-hellman-group"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_187;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("diffie-hellman-group"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "intValue");

    if ((v61 > 0x20 || ((1 << v61) & 0x180000026) == 0) && v61 - 22 <= 0xFFFFFFF7)
      goto LABEL_145;
    objc_msgSend(v7, "IKESecurityAssociationParameters");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setDiffieHellmanGroup:", v61);

  }
  v42 = CFSTR("life-time");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("life-time"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_187;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("life-time"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "intValue");

    if ((v65 - 10) > 0x596)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are in the range %d - %d minutes (24 hours)"), CFSTR("life-time"), 10, 1440);
LABEL_188:
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v7, "IKESecurityAssociationParameters");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setLifetimeMinutes:", v65);

  }
  v42 = CFSTR("child-encryption-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-encryption-algorithm"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_187;
    v50 = CFSTR("child-encryption-algorithm");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-encryption-algorithm"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("DES")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = 1;
LABEL_156:
      objc_msgSend(v68, "setEncryptionAlgorithm:", v70);

      goto LABEL_157;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("3DES")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = 2;
      goto LABEL_156;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("AES-128")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = 3;
      goto LABEL_156;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("AES-256")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = 4;
      goto LABEL_156;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("AES-128-GCM")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = 5;
      goto LABEL_156;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("AES-256-GCM")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = 6;
      goto LABEL_156;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("ChaCha20Poly1305")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = 7;
      goto LABEL_156;
    }
    goto LABEL_167;
  }
LABEL_157:
  v42 = CFSTR("child-integrity-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-integrity-algorithm"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v71)
    goto LABEL_171;
  if (objc_msgSend(v7, "type") != 5)
    goto LABEL_187;
  v55 = CFSTR("child-integrity-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-integrity-algorithm"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("SHA1-96")))
  {
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("SHA1-160")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      v74 = 2;
      goto LABEL_170;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("SHA2-256")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      v74 = 3;
      goto LABEL_170;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("SHA2-384")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      v74 = 4;
      goto LABEL_170;
    }
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("SHA2-512")))
    {
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      v74 = 5;
      goto LABEL_170;
    }
    goto LABEL_190;
  }
  objc_msgSend(v7, "childSecurityAssociationParameters");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v72;
  v74 = 1;
LABEL_170:
  objc_msgSend(v72, "setIntegrityAlgorithm:", v74);

LABEL_171:
  v42 = CFSTR("child-diffie-hellman-group");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-diffie-hellman-group"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_187;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-diffie-hellman-group"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "intValue");

    if ((v77 > 0x20 || ((1 << v77) & 0x180000026) == 0) && v77 - 22 <= 0xFFFFFFF7)
    {
LABEL_145:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are 1, 2, 5, 14-21, 31, 32"), v42, v87, v88);
      goto LABEL_188;
    }
    objc_msgSend(v7, "childSecurityAssociationParameters");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setDiffieHellmanGroup:", v77);

  }
  v42 = CFSTR("child-life-time");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-life-time"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    if (objc_msgSend(v7, "type") == 5)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-life-time"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "intValue");

      if ((v81 - 10) > 0x596)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are in the range 10 - 1440 minutes (24 hours)"), CFSTR("child-life-time"), v87, v88);
        goto LABEL_188;
      }
      objc_msgSend(v7, "childSecurityAssociationParameters");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setLifetimeMinutes:", v81);

      goto LABEL_180;
    }
LABEL_187:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is only available for the IKEv2 protocol"), v42, v87, v88);
    goto LABEL_188;
  }
LABEL_180:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-fallback"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-fallback"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnableFallback:", objc_msgSend(v84, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mtu"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85 && objc_msgSend(v7, "type") == 5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mtu"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMtu:", (int)objc_msgSend(v86, "intValue"));

  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NEKeychainItem *v11;
  const char *v12;
  uint64_t v13;
  id Property;
  NEKeychainItem *v15;

  v5 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v5);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shared-secret"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "sharedSecretKeychainItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shared-secret"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sharedSecretKeychainItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPassword:", v9);
    }
    else
    {
      v11 = [NEKeychainItem alloc];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shared-secret"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v13 = v6[10];
        Property = objc_getProperty(v6, v12, 88, 1);
      }
      else
      {
        v13 = 0;
        Property = 0;
      }
      v10 = Property;
      v15 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v11, "initWithPassword:domain:accessGroup:", v9, v13, v10);
      objc_msgSend(v6, "setSharedSecretKeychainItem:", v15);

    }
  }

  return 1;
}

- (BOOL)unsetIPSecParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  __CFString *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NEUtilConfigurationClient isAlwaysOn](self, "isAlwaysOn"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interface-name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      v17 = 0;
      v18 = CFSTR("Missing interface name");
      goto LABEL_27;
    }
  }
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = 0;
    v18 = CFSTR("Configuration VPN type is not IPSec");
LABEL_27:
    *a4 = v18;
    goto LABEL_28;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authentication-method"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v7, "setAuthenticationMethod:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certificate-type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setCertificateType:", 1);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-internal-ip-subnet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setUseConfigurationAttributeInternalIPSubnet:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disable-mobike"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setDisableMOBIKE:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disable-redirect"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setDisableRedirect:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-pfs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setEnablePFS:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-revocation-check"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (objc_msgSend(v7, "type") == 5)
    {
      objc_msgSend(v7, "setEnableRevocationCheck:", 0);
LABEL_31:
      objc_msgSend(v7, "setStrictRevocationCheck:", 0);
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("strict-revocation-check"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && objc_msgSend(v7, "type") == 5)
      goto LABEL_31;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tls-minimum-version"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setMinimumTLSVersion:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tls-maximum-version"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setMaximumTLSVersion:", 0);
  if (!-[NEUtilConfigurationClient unsetSharedSecretWithParameters:errorStr:](self, "unsetSharedSecretWithParameters:errorStr:", v6, a4))
  {
    v17 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("local-identifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v7, "setLocalIdentifier:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("remote-identifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v7, "setRemoteIdentifier:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-extended-authentication"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v7, "setUseExtendedAuthentication:", 0);
  v26 = CFSTR("dead-peer-detection-rate");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dead-peer-detection-rate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_83;
    objc_msgSend(v7, "setDeadPeerDetectionRate:", 0);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-CA-name"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setServerCertificateIssuerCommonName:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-cert-name"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setServerCertificateCommonName:", 0);
  v26 = CFSTR("encryption-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encryption-algorithm"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_83;
    objc_msgSend(v7, "IKESecurityAssociationParameters");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setEncryptionAlgorithm:", 4);

  }
  v26 = CFSTR("integrity-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("integrity-algorithm"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_83;
    objc_msgSend(v7, "IKESecurityAssociationParameters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIntegrityAlgorithm:", 3);

  }
  v26 = CFSTR("diffie-hellman-group");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("diffie-hellman-group"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_83;
    objc_msgSend(v7, "IKESecurityAssociationParameters");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDiffieHellmanGroup:", 14);

  }
  v26 = CFSTR("life-time");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("life-time"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_83;
    objc_msgSend(v7, "IKESecurityAssociationParameters");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setLifetimeMinutes:", 10);

  }
  v26 = CFSTR("child-encryption-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-encryption-algorithm"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_83;
    objc_msgSend(v7, "childSecurityAssociationParameters");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setEncryptionAlgorithm:", 4);

  }
  v26 = CFSTR("child-integrity-algorithm");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-integrity-algorithm"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_83;
    objc_msgSend(v7, "childSecurityAssociationParameters");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setIntegrityAlgorithm:", 3);

  }
  v26 = CFSTR("child-diffie-hellman-group");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-diffie-hellman-group"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    if (objc_msgSend(v7, "type") != 5)
      goto LABEL_83;
    objc_msgSend(v7, "childSecurityAssociationParameters");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDiffieHellmanGroup:", 14);

  }
  v26 = CFSTR("child-life-time");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("child-life-time"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
    goto LABEL_78;
  if (objc_msgSend(v7, "type") != 5)
  {
LABEL_83:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is only available for the IKEv2 protocol"), v26);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  objc_msgSend(v7, "childSecurityAssociationParameters");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setLifetimeMinutes:", 10);

LABEL_78:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enable-fallback"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46 && objc_msgSend(v7, "type") == 5)
    objc_msgSend(v7, "setEnableFallback:", 0);
  v17 = 1;
LABEL_28:

  return v17;
}

- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shared-secret"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "sharedSecretKeychainItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "sharedSecretKeychainItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIdentifier:", 0);

    }
  }

  return 1;
}

- (BOOL)addOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  __objc2_class **v8;
  id v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("connect")) & 1) != 0)
  {
    v8 = off_1E3CBBD08;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("disconnect")) & 1) != 0)
  {
    v8 = off_1E3CBBD10;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ignore")) & 1) != 0)
  {
    v8 = off_1E3CBBD20;
  }
  else
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("evaluateconnection")) & 1) == 0)
    {
      v38 = 0;
      *a4 = CFSTR("Invalid action");
      goto LABEL_36;
    }
    v8 = off_1E3CBBD18;
  }
  v9 = objc_alloc_init(*v8);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dns-search-domain-match"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dns-search-domain-match"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if ((isKindOfClass & 1) != 0)
  {
    v42[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDNSSearchDomainMatch:", v14);

  }
  else
  {
    objc_msgSend(v9, "setDNSSearchDomainMatch:", v12);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dns-server-match"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dns-server-match"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if ((v16 & 1) != 0)
  {
    v41 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDNSServerAddressMatch:", v19);

  }
  else
  {
    objc_msgSend(v9, "setDNSServerAddressMatch:", v17);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interface-type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 && (objc_msgSend(v20, "isEqualToString:", CFSTR("ethernet")) & 1) == 0)
  {
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("cellular")) & 1) != 0)
    {
      v22 = 3;
LABEL_21:
      objc_msgSend(v9, "setInterfaceTypeMatch:", v22);
      goto LABEL_22;
    }
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("wifi")))
    {
      v22 = 2;
      goto LABEL_21;
    }
  }
LABEL_22:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ssid-match"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v24 = objc_opt_isKindOfClass();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ssid-match"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if ((v24 & 1) != 0)
  {
    v40 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSSIDMatch:", v27);

  }
  else
  {
    objc_msgSend(v9, "setSSIDMatch:", v25);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("probe-url"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByRemovingPercentEncoding");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v29);
    objc_msgSend(v9, "setProbeURL:", v30);

  }
  -[NEUtilConfigurationClient onDemandRules](self, "onDemandRules");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[NEUtilConfigurationClient onDemandRules](self, "onDemandRules");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(v32, "initWithArray:", v33);

  }
  else
  {
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("index"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "count");
  if (v35)
    v36 = objc_msgSend(v35, "integerValue");
  v37 = v36;
  if (v36 >= objc_msgSend(v34, "count"))
    objc_msgSend(v34, "addObject:", v9);
  else
    objc_msgSend(v34, "insertObject:atIndex:", v9, v37);
  v38 = 1;
  -[NEUtilConfigurationClient setOnDemandEnabled:](self, "setOnDemandEnabled:", 1);
  -[NEUtilConfigurationClient setOnDemandRules:](self, "setOnDemandRules:", v34);

LABEL_36:
  return v38;
}

- (BOOL)removeOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  -[NEUtilConfigurationClient onDemandRules](self, "onDemandRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    *a4 = CFSTR("No rule present with given index");
  }
  else
  {
    -[NEUtilConfigurationClient onDemandRules](self, "onDemandRules");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[NEUtilConfigurationClient onDemandRules](self, "onDemandRules");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v11, "initWithArray:", v12);

    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    objc_msgSend(v13, "removeObjectAtIndex:", v7);
    v14 = objc_msgSend(v13, "count");
    if (v14)
      v15 = v13;
    else
      v15 = 0;
    -[NEUtilConfigurationClient setOnDemandEnabled:](self, "setOnDemandEnabled:", v14 != 0);
    -[NEUtilConfigurationClient setOnDemandRules:](self, "setOnDemandRules:", v15);

  }
  return v7 < v9;
}

- (BOOL)setDNSParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __objc2_class *v14;
  __objc2_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient dnsSettingsBundle](self, "dnsSettingsBundle");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (v8 | v7) != 0;
  if (v8 | v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("protocol"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("servers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v10;
    if (v11)
    {
      v12 = v11;
      if (isa_nsstring(v11))
      {
        v33[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("tls")))
      {
        v14 = NEDNSOverTLSSettings;
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("https")))
      {
        v14 = NEDNSOverHTTPSSettings;
      }
      else
      {
        v14 = NEDNSSettings;
      }
      v16 = (id)objc_msgSend([v14 alloc], "initWithServers:", v12);
    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("tls")))
      {
        v15 = NEDNSOverTLSSettings;
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("https")))
      {
        v15 = NEDNSOverHTTPSSettings;
      }
      else
      {
        v15 = NEDNSSettings;
      }
      v16 = objc_alloc_init(v15);
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("search-domains"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if (isa_nsarray(v17))
      {
        objc_msgSend(v16, "setSearchDomains:", v18);
      }
      else if (isa_nsstring(v18))
      {
        v32 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSearchDomains:", v19);

      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("match-domains"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if (isa_nsarray(v20))
      {
        objc_msgSend(v16, "setMatchDomains:", v21);
      }
      else if (isa_nsstring(v21))
      {
        v31 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setMatchDomains:", v22);

      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain-name"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v23))
      objc_msgSend(v16, "setDomainName:", v23);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-name"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v24))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v16, "setServerName:", v24);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url-path"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v24))
    {
      if (isa_nsstring(v25))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@%@"), v24, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "URLWithString:", v29);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setServerURL:", v28);

        }
      }
    }
    if (v8)
    {
      objc_msgSend((id)v8, "setSettings:", v16);
    }
    else if (v7)
    {
      objc_msgSend((id)v7, "setDNSSettings:", v16);
    }

    v9 = (v8 | v7) != 0;
  }
  else
  {
    *a4 = CFSTR("Missing DNS settings or VPN protocol");
  }

  return v9;
}

- (BOOL)unsetDNSParameters:(id)a3 errorStr:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient dnsSettingsBundle](self, "dnsSettingsBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setSettings:", 0);
  }
  else
  {
    if (!v6)
    {
      v9 = 0;
      *a4 = CFSTR("Missing DNS settings or VPN protocol");
      goto LABEL_6;
    }
    objc_msgSend(v6, "setDNSSettings:", 0);
  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)setAppPushParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NEUtilConfigurationClient appPush](self, "appPush");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("match-ssids"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (isa_nsarray(v8))
      {
        objc_msgSend(v7, "setMatchSSIDs:", v9);
      }
      else if (isa_nsstring(v9))
      {
        v17[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setMatchSSIDs:", v11);

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vendor-config"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && isa_nsdictionary(v12))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vendor-config"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setProviderConfiguration:", v14);

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("plugin-type"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v7, "setPluginType:", v15);

        v10 = 1;
      }
      else
      {
        v10 = 0;
        *a4 = CFSTR("Missing app push provider configuration dictionary");
      }

    }
    else
    {
      v10 = 0;
      *a4 = CFSTR("Missing matching SSIDs in the input parameters");
    }

  }
  else
  {
    v10 = 0;
    *a4 = CFSTR("Missing app push provider configuration");
  }

  return v10;
}

- (BOOL)unsetAppPushParameters:(id)a3 errorStr:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NEUtilConfigurationClient appPush](self, "appPush", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEUtilConfigurationClient appPush](self, "appPush");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMatchSSIDs:", 0);

    -[NEUtilConfigurationClient appPush](self, "appPush");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProviderConfiguration:", 0);

    -[NEUtilConfigurationClient appPush](self, "appPush");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPluginType:", 0);

  }
  else
  {
    *a4 = CFSTR("Missing app push provider configuration");
  }
  return v6 != 0;
}

- (BOOL)addRelayWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  NERelay *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_data_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  unint64_t v27;
  const char *v28;
  id v29;
  const char *v30;
  void *v31;
  unint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  id *v45;
  void *v46;
  void *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NEUtilConfigurationClient relayConfiguration](self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v45 = a4;
    v9 = objc_alloc_init(NERelay);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("http3-url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByRemovingPercentEncoding");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setHTTP3RelayURL:](v9, "setHTTP3RelayURL:", v12);

    }
    v47 = (void *)v11;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("http2-url"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByRemovingPercentEncoding");
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setHTTP2RelayURL:](v9, "setHTTP2RelayURL:", v15);

    }
    v46 = (void *)v14;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("doh-url"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByRemovingPercentEncoding");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setDnsOverHTTPSURL:](v9, "setDnsOverHTTPSURL:", v18);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("raw-public-key"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByRemovingPercentEncoding");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = dispatch_data_create((const void *)objc_msgSend(v20, "UTF8String"), objc_msgSend(v20, "length"), 0, 0);
      v22 = (void *)dispatch_data_create_with_transform();

      if (v22)
      {
        v48[0] = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NERelay setRawPublicKeys:](v9, "setRawPublicKeys:", v23);

      }
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identity"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "integerValue");

      if (!self
        || (v29 = objc_getProperty(self, v28, 48, 1)) == 0
        || (v31 = v29, v32 = objc_msgSend(objc_getProperty(self, v30, 48, 1), "count"), v31, v27 >= v32))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@ index, use the \"list-identities\" command to obtain a list of available identities and their indicies"), CFSTR("identity"));
        v24 = 0;
        *v45 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      objc_msgSend(objc_getProperty(self, v33, 48, 1), "objectAtIndexedSubscript:", v27);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("domain"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "integerValue");

      if (v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, an identity in the %s keychain is required"), CFSTR("identity"), "system");
        *v45 = (id)objc_claimAutoreleasedReturnValue();

        v24 = 0;
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("persistent-reference"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setIdentityReference:](v9, "setIdentityReference:", v37);

    }
    v38 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "relays");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithArray:", v39);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("index"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "count");
    if (v41)
      v42 = objc_msgSend(v41, "integerValue");
    v43 = v42;
    if (v42 >= objc_msgSend(v40, "count"))
      objc_msgSend(v40, "addObject:", v9);
    else
      objc_msgSend(v40, "insertObject:atIndex:", v9, v43);
    objc_msgSend(v8, "setRelays:", v40);

    v24 = 1;
    goto LABEL_27;
  }
  v24 = 0;
  *a4 = CFSTR("Missing relay configuration");
LABEL_28:

  return v24;
}

- (BOOL)removeRelayWithParameters:(id)a3 errorStr:(id *)a4
{
  void *v6;
  unint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  __CFString *v17;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  -[NEUtilConfigurationClient relayConfiguration](self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v16 = 0;
    v17 = CFSTR("Missing relay configuration");
LABEL_6:
    *a4 = v17;
    goto LABEL_7;
  }
  objc_msgSend(v9, "relays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v7 >= v12)
  {
    v16 = 0;
    v17 = CFSTR("No relay configuration present with given index");
    goto LABEL_6;
  }
  v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "relays");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

  objc_msgSend(v15, "removeObjectAtIndex:", v7);
  objc_msgSend(v10, "setRelays:", v15);

  v16 = 1;
LABEL_7:

  return v16;
}

- (BOOL)setRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NEUtilConfigurationClient relayConfiguration](self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("match-domains"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v9))
    {
      objc_msgSend(v8, "setMatchDomains:", v9);
    }
    else if (isa_nsstring(v9))
    {
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMatchDomains:", v10);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("excluded-domains"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v11))
    {
      objc_msgSend(v8, "setExcludedDomains:", v11);
    }
    else if (isa_nsstring(v11))
    {
      v14 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setExcludedDomains:", v12);

    }
  }
  else
  {
    *a4 = CFSTR("Missing relay configuration");
  }

  return v8 != 0;
}

- (BOOL)unsetRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[NEUtilConfigurationClient relayConfiguration](self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("match-domains"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v8, "setMatchDomains:", 0);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("excluded-domains"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v8, "setExcludedDomains:", 0);
  }
  else
  {
    *a4 = CFSTR("Missing relay configuration");
  }

  return v8 != 0;
}

- (BOOL)setProxyParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NEProxySettings *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    *a4 = CFSTR("Missing protocol");
    goto LABEL_24;
  }
  objc_msgSend(v7, "proxySettings");
  v9 = (NEProxySettings *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = objc_alloc_init(NEProxySettings);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("auto-proxy-discovery"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("auto-proxy-discovery"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxySettings setAutoProxyDiscovery:](v9, "setAutoProxyDiscovery:", objc_msgSend(v11, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("auto-config-url"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NEProxySettings setAutoProxyConfigurationEnabled:](v9, "setAutoProxyConfigurationEnabled:", 1);
    v13 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("auto-config-url"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxySettings setProxyAutoConfigurationURL:](v9, "setProxyAutoConfigurationURL:", v15);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-simple-hostnames"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-simple-hostnames"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxySettings setExcludeSimpleHostnames:](v9, "setExcludeSimpleHostnames:", objc_msgSend(v17, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exception-list"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exception-list"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = isa_nsstring(v19);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exception-list"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      v31[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxySettings setExceptionList:](v9, "setExceptionList:", v23);

LABEL_16:
      goto LABEL_17;
    }
    v24 = isa_nsarray(v21);

    if (v24)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exception-list"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxySettings setExceptionList:](v9, "setExceptionList:", v22);
      goto LABEL_16;
    }
  }
LABEL_17:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-passive-ftp"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-passive-ftp"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxySettings setUsePassiveFTP:](v9, "setUsePassiveFTP:", objc_msgSend(v26, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("match-domains"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsarray(v27))
  {
    -[NEProxySettings setMatchDomains:](v9, "setMatchDomains:", v27);
  }
  else if (isa_nsstring(v27))
  {
    v30 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxySettings setMatchDomains:](v9, "setMatchDomains:", v28);

  }
  objc_msgSend(v8, "setProxySettings:", v9);

LABEL_24:
  return v8 != 0;
}

- (BOOL)unsetProxyParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "proxySettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("auto-proxy-discovery"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v9, "setAutoProxyDiscovery:", 0);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("auto-config-url"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v9, "setAutoProxyConfigurationEnabled:", 0);
        objc_msgSend(v9, "setProxyAutoConfigURL:", 0);
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exclude-simple-hostnames"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v9, "setExcludeSimpleHostnames:", 0);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("exception-list"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v9, "setExceptionList:", 0);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("use-passive-ftp"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v9, "setUsePassiveFTP:", 0);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("match-domains"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(v9, "setMatchDomains:", 0);
    }
  }
  else
  {
    v9 = 0;
    *a4 = CFSTR("Missing protocol");
  }

  return v8 != 0;
}

- (BOOL)setProxyServer:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NEProxySettings *v10;
  uint64_t v11;
  BOOL v12;
  NEProxyServer *v13;
  void *v14;
  void *v15;
  NEProxyServer *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v12 = 0;
    *a4 = CFSTR("Missing protocol");
    goto LABEL_35;
  }
  objc_msgSend(v8, "proxySettings");
  v10 = (NEProxySettings *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = objc_alloc_init(NEProxySettings);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v11 = 1;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("https")) & 1) != 0)
  {
    v11 = 2;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ftp")) & 1) != 0)
  {
    v11 = 3;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("rtsp")) & 1) != 0)
  {
    v11 = 4;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("gopher")) & 1) != 0)
  {
    v11 = 6;
  }
  else
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("socks")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid proxy type: %@, valid values are \"http\", \"https\", \"ftp\", \"rtsp\", \"gopher\", and \"socks\"), v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
    v11 = 5;
  }
  v13 = [NEProxyServer alloc];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("address"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("port"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NEProxyServer initWithType:address:port:](v13, "initWithType:address:port:", v11, v14, (int)objc_msgSend(v15, "intValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authentication-required"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authentication-required"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxyServer setAuthenticationRequired:](v16, "setAuthenticationRequired:", objc_msgSend(v18, "BOOLValue"));

  }
  if (!-[NEProxyServer authenticationRequired](v16, "authenticationRequired"))
    goto LABEL_23;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v23 = CFSTR("Authentication is required, but username is missing");
LABEL_27:
    *a4 = v23;

LABEL_28:
    v12 = 0;
    goto LABEL_35;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxyServer setUsername:](v16, "setUsername:", v20);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("password"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v23 = CFSTR("Authentication is required, but password is missing");
    goto LABEL_27;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("password"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxyServer setPassword:](v16, "setPassword:", v22);

LABEL_23:
  switch(v11)
  {
    case 1:
      -[NEProxySettings setHTTPServer:](v10, "setHTTPServer:", v16);
      -[NEProxySettings setHTTPEnabled:](v10, "setHTTPEnabled:", 1);
      break;
    case 2:
      -[NEProxySettings setHTTPSServer:](v10, "setHTTPSServer:", v16);
      -[NEProxySettings setHTTPSEnabled:](v10, "setHTTPSEnabled:", 1);
      break;
    case 3:
      -[NEProxySettings setFTPServer:](v10, "setFTPServer:", v16);
      -[NEProxySettings setFTPEnabled:](v10, "setFTPEnabled:", 1);
      break;
    case 4:
      -[NEProxySettings setRTSPServer:](v10, "setRTSPServer:", v16);
      -[NEProxySettings setRTSPEnabled:](v10, "setRTSPEnabled:", 1);
      break;
    case 5:
      -[NEProxySettings setSOCKSServer:](v10, "setSOCKSServer:", v16);
      -[NEProxySettings setSOCKSEnabled:](v10, "setSOCKSEnabled:", 1);
      break;
    case 6:
      -[NEProxySettings setGopherServer:](v10, "setGopherServer:", v16);
      -[NEProxySettings setGopherEnabled:](v10, "setGopherEnabled:", 1);
      break;
    default:
      break;
  }
  objc_msgSend(v9, "setProxySettings:", v10);

  v12 = 1;
LABEL_35:

  return v12;
}

- (BOOL)unsetProxyServer:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "proxySettings");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("http")))
      {
        objc_msgSend(v10, "setHTTPServer:", 0);
        objc_msgSend(v10, "setHTTPEnabled:", 0);
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("https")))
      {
        objc_msgSend(v10, "setHTTPSServer:", 0);
        objc_msgSend(v10, "setHTTPSEnabled:", 0);
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ftp")))
      {
        objc_msgSend(v10, "setFTPServer:", 0);
        objc_msgSend(v10, "setFTPEnabled:", 0);
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("rtsp")))
      {
        objc_msgSend(v10, "setRTSPServer:", 0);
        objc_msgSend(v10, "setRTSPEnabled:", 0);
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("gopher")))
      {
        objc_msgSend(v10, "setGopherServer:", 0);
        objc_msgSend(v10, "setGopherEnabled:", 0);
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("socks")))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid proxy type: %@, valid values are \"http\", \"https\", \"ftp\", \"rtsp\", \"gopher\", and \"socks\"), v7);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v11 = 0;
          goto LABEL_18;
        }
        objc_msgSend(v10, "setSOCKSServer:", 0);
        objc_msgSend(v10, "setSOCKSEnabled:", 0);
      }

    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
    *a4 = CFSTR("Missing protocol");
  }
LABEL_18:

  return v11;
}

- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  const char *v15;
  _QWORD *v16;
  SEL v17;
  id Property;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  NSObject *v46;
  id v47;
  __CFString *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  _QWORD *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void (**v74)(_QWORD, _QWORD);
  id v75;
  id v76;
  id v77;
  _QWORD v78[5];
  id v79;
  id v80;
  void (**v81)(_QWORD, _QWORD);
  int v82;
  _QWORD v83[2];
  void (*v84)(uint64_t, void *, void *, void *, void *);
  void *v85;
  id v86;
  NEUtilConfigurationClient *v87;
  void (**v88)(_QWORD, _QWORD);
  int v89;
  _QWORD v90[5];
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96[3];
  _QWORD v97[2];
  _BYTE buf[24];
  void *v99;
  NEUtilConfigurationClient *v100;
  _QWORD *v101;
  _QWORD *v102;
  uint8_t v103[8];
  id v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v76 = a4;
  v77 = a5;
  v10 = a6;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (a3 == 37)
  {
    v13 = MEMORY[0x1E0C809B0];
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke;
    v90[3] = &unk_1E3CC46A8;
    v90[4] = self;
    v14 = (void (**)(_QWORD, _QWORD))v10;
    v91 = v10;
    v16 = v90;
    if (self)
    {
      objc_setProperty_atomic(self, v15, 0, 48);
      Property = objc_getProperty(self, v17, 24, 1);
      *(_QWORD *)buf = v13;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __69__NEUtilConfigurationClient_reloadIdentityListWithCompletionHandler___block_invoke;
      v99 = &unk_1E3CC3C40;
      v100 = self;
      v101 = v16;
      objc_msgSend(Property, "copyIdentities:fromDomain:withCompletionQueue:handler:", 0, 0, MEMORY[0x1E0C80D38], buf);

    }
    goto LABEL_32;
  }
  if (a3 != 36)
  {
    if ((a3 & 0xFFFFFFFE) == 0x1E)
    {
      v74 = (void (**)(_QWORD, _QWORD))v10;
      objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("configuration-file-path"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v19;
      v20 = v19;
      v11 = v74;
      if (v19)
      {
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("/")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Configuration file path must be an absolute file path."), 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v74)[2](v74, v41);

LABEL_70:
          v11 = v74;
          goto LABEL_33;
        }
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v84 = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2;
        v85 = &unk_1E3CC3C68;
        v89 = a3;
        v86 = v76;
        v87 = self;
        v88 = v74;
        v69 = v20;
        v75 = v86;
        v68 = v83;
        if (!self)
        {
LABEL_69:

          goto LABEL_70;
        }
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
        v71 = v69;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isReadableFileAtPath:", v71);

        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "fileExistsAtPath:", v71);

          if ((v43 & 1) != 0)
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File %@ is unreadable\n"), v71);
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File %@ not found\n"), v71);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          v70 = 0;
          v67 = 0;
          goto LABEL_47;
        }
        v96[0] = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v71, 0, v96);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v96[0];
        if (!v65)
        {
          ne_log_obj();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v71;
            _os_log_error_impl(&dword_19BD16000, v46, OS_LOG_TYPE_ERROR, "%@ Failed to read data from %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read data from %@\n"), v71);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0;

          v45 = 0;
          v70 = 0;
          goto LABEL_47;
        }
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v65, 0);
        objc_msgSend(v23, "setClass:forClassName:", objc_opt_class(), CFSTR("NEVPNAppRule"));
        objc_msgSend(v23, "setClass:forClassName:", objc_opt_class(), CFSTR("NEVPNProtocolPlugin"));
        v63 = objc_msgSend(v23, "decodeInt64ForKey:", CFSTR("Version"));
        v24 = (void *)MEMORY[0x1E0C99E60];
        v25 = objc_opt_class();
        v26 = objc_opt_class();
        v27 = objc_opt_class();
        v28 = objc_opt_class();
        objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, objc_opt_class(), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "decodeObjectOfClasses:forKey:", v29, CFSTR("Index"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v23;

        if (!v70 || v63)
        {
LABEL_46:

          v45 = objc_retainAutorelease(v66);
          v44 = 0;
          v67 = v45;
LABEL_47:
          v47 = objc_retainAutorelease(v44);

          v48 = (__CFString *)v47;
          v49 = v45;
          if (v48)
          {
            v50 = 0;
            v51 = 0;
          }
          else
          {
            if (v70)
            {
              objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("AppGroupMap"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = 0u;
              v95 = 0u;
              v92 = 0u;
              v93 = 0u;
              objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("ConfigurationProperties"));
              v52 = objc_claimAutoreleasedReturnValue();
              v53 = -[NSObject countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v92, buf, 16);
              if (v53)
              {
                v54 = *(_QWORD *)v93;
LABEL_52:
                v55 = 0;
                while (1)
                {
                  if (*(_QWORD *)v93 != v54)
                    objc_enumerationMutation(v52);
                  v56 = *(id *)(*((_QWORD *)&v92 + 1) + 8 * v55);
                  v57 = v49;
                  v58 = objc_opt_class();
                  objc_msgSend(v56, "UUIDString");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "decodeObjectOfClass:forKey:", v58, v59);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v50)
                  {
                    if (!v75
                      || !objc_msgSend(v75, "length")
                      || (objc_msgSend(v50, "name"),
                          v60 = (void *)objc_claimAutoreleasedReturnValue(),
                          v61 = objc_msgSend(v75, "isEqualToString:", v60),
                          v60,
                          v61))
                    {
                      objc_msgSend(v50, "identifier");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v72, "setObject:forKeyedSubscript:", v50, v62);

                      if (objc_msgSend(v75, "length"))
                        break;
                    }
                  }

                  if (v53 == ++v55)
                  {
                    v53 = -[NSObject countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v92, buf, 16);
                    if (v53)
                      goto LABEL_52;
                    goto LABEL_62;
                  }
                }
              }
              else
              {
LABEL_62:
                v50 = 0;
              }
              v48 = 0;
            }
            else
            {
              ne_log_obj();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = self;
                _os_log_impl(&dword_19BD16000, v52, OS_LOG_TYPE_INFO, "%@ empty configurations", buf, 0xCu);
              }
              v50 = 0;
              v51 = 0;
              v48 = CFSTR("Empty configuration");
            }

          }
          v84((uint64_t)v68, v48, v72, v50, v51);

          goto LABEL_69;
        }
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v30 = v70;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v92, buf, 16);
        if (v31)
        {
          v32 = 0;
          v33 = 0;
          v34 = *(_QWORD *)v93;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v93 != v34)
                objc_enumerationMutation(v30);
              v36 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
              if (!v32)
              {
                objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v32, "allKeys");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v33)
                v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, v36);

            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v92, buf, 16);
          }
          while (v31);

          if (!v32 || !v33)
          {
            v70 = v30;
            goto LABEL_45;
          }
          v97[0] = CFSTR("ConfigurationProperties");
          v97[1] = CFSTR("UserMap");
          *(_QWORD *)v103 = v32;
          v104 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v97, 2);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v33 = 0;
          v32 = 0;
          v70 = v30;
        }

LABEL_45:
        goto LABEL_46;
      }
    }
    v38 = MEMORY[0x1E0C809B0];
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3;
    v78[3] = &unk_1E3CC3D38;
    v14 = v11;
    v81 = v11;
    v78[4] = self;
    v82 = a3;
    v79 = v77;
    v80 = v76;
    v39 = v80;
    v40 = v78;
    if (self)
    {
      *(_QWORD *)buf = v38;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __73__NEUtilConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke;
      v99 = &unk_1E3CC3C18;
      v100 = self;
      v101 = v39;
      v102 = v40;
      -[NEUtilConfigurationClient loadConfigurationsForceRefresh:completionHandler:](self, 0, buf);

    }
LABEL_32:
    v11 = v14;
    goto LABEL_33;
  }
  -[NEUtilConfigurationClient clientName](self, "clientName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NEUtilConfigurationClient removeClientWithName:](NEUtilConfigurationClient, "removeClientWithName:", v12);

  v11[2](v11, MEMORY[0x1E0C9AA60]);
LABEL_33:

}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isAlwaysOn
{
  return self->_isAlwaysOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_currentConfigurations, 0);
  objc_storeStrong((id *)&self->_createdConfigurations, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke(uint64_t a1)
{
  const char *v2;
  unint64_t v3;
  const __CFAllocator *v4;
  id Property;
  const char *v6;
  id v7;
  void *v8;
  const __CFData *v9;
  SecCertificateRef v10;
  __SecCertificate *v11;
  int IsValid;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%-5s %-100s %-9s %-6s\n"), "ID", "Subject Summary", "Validity", "Domain");
  v3 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (1)
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v2, 48, 1);
    if (v3 >= objc_msgSend(Property, "count"))
      break;
    v7 = *(id *)(a1 + 32);
    if (v7)
      v7 = objc_getProperty(v7, v6, 48, 1);
    objc_msgSend(v7, "objectAtIndexedSubscript:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("certificate-data"));
    v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = SecCertificateCreateWithData(v4, v9);
      if (v10)
      {
        v11 = v10;
        IsValid = NECertificateDateIsValid((uint64_t)v10);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("domain"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "intValue");

        v15 = (__CFString *)SecCertificateCopySubjectSummary(v11);
        v16 = v15;
        if (v15)
        {
          v17 = -[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
          v18 = "user";
          if (!v14)
            v18 = "system";
          objc_msgSend(v21, "appendFormat:", CFSTR("%-5lu %-100s %-9s %-6s\n"), v3, v17, off_1E3CC3DF8[IsValid - 1], v18);
        }
        CFRelease(v11);

      }
    }

    ++v3;
  }
  v19 = *(_QWORD *)(a1 + 40);
  v22[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  __CFString *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v9)
    goto LABEL_2;
  v14 = *(_DWORD *)(a1 + 56);
  if (v14 != 31)
  {
    if (v14 != 30)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported command"), v38);
      goto LABEL_21;
    }
    v15 = *(void **)(a1 + 32);
    if (v15 && objc_msgSend(v15, "length"))
    {
      if (v11)
      {
        objc_msgSend(v11, "description");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_2:
        objc_msgSend(v13, "addObject:", v9);

        goto LABEL_3;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Configuration '%@' not found"), *(_QWORD *)(a1 + 32));
LABEL_21:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_3;
      goto LABEL_2;
    }
    if (objc_msgSend(v12, "count"))
    {
      if (*(_QWORD *)(a1 + 40))
      {
        v25 = (objc_class *)MEMORY[0x1E0CB37A0];
        v26 = v12;
        v27 = (void *)objc_msgSend([v25 alloc], "initWithCapacity:", 0);
        objc_msgSend(v27, "appendString:", CFSTR("{"));
        objc_msgSend(v27, "appendPrettyObject:withName:andIndent:options:", v26, CFSTR("app-group-map"), 0, 0);

        objc_msgSend(v27, "appendString:", CFSTR("\n}"));
      }
      else
      {
        v27 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v28);

    }
    if (!v10 || !objc_msgSend(v10, "count"))
    {
      v9 = CFSTR("Unreadable or empty file");
      goto LABEL_2;
    }
    v39 = v12;
    v40 = v11;
    v41 = a1;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v29 = v10;
    v30 = v10;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v47 != v33)
            objc_enumerationMutation(v30);
          v35 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@\n"), v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v37);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v32);
    }

    v10 = v29;
LABEL_37:
    v11 = v40;
    a1 = v41;
    v12 = v39;
    goto LABEL_3;
  }
  if (v10 && objc_msgSend(v10, "count"))
  {
    v39 = v12;
    v40 = v11;
    v41 = a1;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v21, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@\n"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v24);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v18);
    }

    goto LABEL_37;
  }
LABEL_3:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  uint64_t v21;
  id *v22;
  void *v23;
  uint64_t v24;
  id *v25;
  void *v26;
  uint64_t v27;
  id *v28;
  void *v29;
  uint64_t v30;
  id *v31;
  void *v32;
  uint64_t v33;
  id *v34;
  void *v35;
  uint64_t v36;
  id *v37;
  void *v38;
  uint64_t v39;
  id *v40;
  void *v41;
  uint64_t v42;
  id *v43;
  void *v44;
  uint64_t v45;
  id *v46;
  void *v47;
  uint64_t v48;
  id *v49;
  void *v50;
  uint64_t v51;
  id *v52;
  void *v53;
  uint64_t v54;
  id *v55;
  void *v56;
  void *v57;
  id *v58;
  void *v59;
  void *v60;
  id *v61;
  void *v62;
  uint64_t v63;
  id *v64;
  void *v65;
  uint64_t v66;
  id *v67;
  void *v68;
  uint64_t v69;
  id *v70;
  void *v71;
  uint64_t v72;
  id *v73;
  void *v74;
  uint64_t v75;
  id *v76;
  void *v77;
  uint64_t v78;
  id *v79;
  void *v80;
  uint64_t v81;
  id *v82;
  void *v83;
  uint64_t v84;
  id *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id *v90;
  void *v91;
  void *v92;
  id *v93;
  void *v94;
  void *v95;
  id *v96;
  void *v97;
  void *v98;
  id *v99;
  void *v100;
  void *v101;
  id *v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  uint64_t v109;
  id v110;
  id v111;
  uint64_t v112;
  id v113;
  id v114;
  uint64_t v115;
  void *v116;
  NSObject *v117;
  NEProfileIngestion *v118;
  void *v119;
  NEProfilePayloadBase *v120;
  void *v121;
  void *v122;
  void *v123;
  id *v124;
  void *v125;
  void *v126;
  id *v127;
  void *v128;
  void *v129;
  void *v130;
  const char *v131;
  void *v132;
  void *v133;
  const char *v134;
  const char *v135;
  id v136;
  void *v137;
  id v138;
  id v139;
  const char *v140;
  void *v141;
  NEConfiguration *v142;
  void *v143;
  void *v144;
  void *v145;
  NEConfiguration *v146;
  NEVPNApp *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  id v160;
  NEConfiguration *v161;
  void *v162;
  uint64_t v163;
  id *v164;
  void *v165;
  uint64_t v166;
  id *v167;
  void *v168;
  uint64_t v169;
  id *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  uint64_t v175;
  id *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  id Property;
  id v181;
  void *v182;
  void *v183;
  const char *v184;
  void *v185;
  id v186;
  const char *v187;
  void *v188;
  id v189;
  id v190;
  BOOL v191;
  id v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t i;
  void *v197;
  void *v198;
  id v199;
  const char *v200;
  void *v201;
  id v202;
  id v203;
  BOOL v204;
  const char *v205;
  id v206;
  id v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t j;
  void *v211;
  void *v212;
  uint64_t v213;
  void *v214;
  id newValue;
  id v216;
  id v217;
  _QWORD v218[4];
  NEConfiguration *v219;
  uint64_t *v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  _QWORD v229[4];
  id v230;
  id v231;
  uint64_t v232;
  id v233;
  id v234;
  _QWORD v235[5];
  id v236;
  id v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  id v246;
  id v247;
  id v248;
  id v249;
  id v250;
  id v251;
  id v252;
  id v253;
  id v254;
  id v255;
  id v256;
  id v257;
  id v258;
  id v259;
  id v260;
  id v261;
  id v262;
  id v263;
  id v264;
  id v265;
  id v266;
  id v267;
  _QWORD v268[4];
  id v269;
  uint64_t v270;
  id v271;
  id v272;
  uint64_t *v273;
  id obj;
  id v275;
  uint64_t v276;
  uint64_t *v277;
  uint64_t v278;
  uint64_t (*v279)(uint64_t, uint64_t);
  void (*v280)(uint64_t);
  id v281;
  uint8_t buf[4];
  void *v283;
  _BYTE v284[128];
  _BYTE v285[128];
  _QWORD v286[3];

  v286[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v276 = 0;
  v277 = &v276;
  v278 = 0x3032000000;
  v279 = __Block_byref_object_copy__21548;
  v280 = __Block_byref_object_dispose__21549;
  v281 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  newValue = v5;
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 56);
    v286[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v286, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    goto LABEL_176;
  }
  v11 = *(void **)(a1 + 32);
  if (v11)
    objc_setProperty_atomic(v11, v7, v5, 56);
  switch(*(_DWORD *)(a1 + 64))
  {
    case 1:
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Configuration with name \"%@\" already exists"), *(_QWORD *)(a1 + 48));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v277[5];
        v277[5] = v12;

      }
      else
      {
        v174 = *(void **)(a1 + 32);
        v175 = *(_QWORD *)(a1 + 40);
        v176 = (id *)(v277 + 5);
        v275 = (id)v277[5];
        objc_msgSend(v174, "createConfigurationWithParameters:errorStr:", v175, &v275);
        objc_storeStrong(v176, v275);
      }
      goto LABEL_173;
    case 2:
      if (!v5)
        goto LABEL_105;
      v29 = *(void **)(a1 + 32);
      v30 = *(_QWORD *)(a1 + 40);
      v31 = (id *)(v277 + 5);
      v267 = (id)v277[5];
      objc_msgSend(v29, "setProtocolWithParameters:errorStr:", v30, &v267);
      objc_storeStrong(v31, v267);
      goto LABEL_173;
    case 3:
      if (!v5)
        goto LABEL_105;
      v32 = *(void **)(a1 + 32);
      v33 = *(_QWORD *)(a1 + 40);
      v34 = (id *)(v277 + 5);
      v266 = (id)v277[5];
      objc_msgSend(v32, "setFilterPluginWithParameters:errorStr:", v33, &v266);
      objc_storeStrong(v34, v266);
      goto LABEL_173;
    case 4:
      if (!v5)
        goto LABEL_105;
      v35 = *(void **)(a1 + 32);
      v36 = *(_QWORD *)(a1 + 40);
      v37 = (id *)(v277 + 5);
      v265 = (id)v277[5];
      objc_msgSend(v35, "unsetFilterPluginParameters:errorStr:", v36, &v265);
      objc_storeStrong(v37, v265);
      goto LABEL_173;
    case 5:
      if (!v5)
        goto LABEL_105;
      v38 = *(void **)(a1 + 32);
      v39 = *(_QWORD *)(a1 + 40);
      v40 = (id *)(v277 + 5);
      v264 = (id)v277[5];
      objc_msgSend(v38, "setDNSProxyWithParameters:errorStr:", v39, &v264);
      objc_storeStrong(v40, v264);
      goto LABEL_173;
    case 6:
      if (!v5)
        goto LABEL_105;
      v41 = *(void **)(a1 + 32);
      v42 = *(_QWORD *)(a1 + 40);
      v43 = (id *)(v277 + 5);
      v263 = (id)v277[5];
      objc_msgSend(v41, "unsetDNSProxyWithParameters:errorStr:", v42, &v263);
      objc_storeStrong(v43, v263);
      goto LABEL_173;
    case 7:
      if (!v5)
        goto LABEL_105;
      v44 = *(void **)(a1 + 32);
      v45 = *(_QWORD *)(a1 + 40);
      v46 = (id *)(v277 + 5);
      v262 = (id)v277[5];
      objc_msgSend(v44, "setCommonParameters:errorStr:", v45, &v262);
      objc_storeStrong(v46, v262);
      goto LABEL_173;
    case 8:
      if (!v5)
        goto LABEL_105;
      v47 = *(void **)(a1 + 32);
      v48 = *(_QWORD *)(a1 + 40);
      v49 = (id *)(v277 + 5);
      v261 = (id)v277[5];
      objc_msgSend(v47, "unsetCommonParameters:errorStr:", v48, &v261);
      objc_storeStrong(v49, v261);
      goto LABEL_173;
    case 9:
      if (!v5)
        goto LABEL_105;
      v50 = *(void **)(a1 + 32);
      v51 = *(_QWORD *)(a1 + 40);
      v52 = (id *)(v277 + 5);
      v260 = (id)v277[5];
      objc_msgSend(v50, "setIPSecParameters:errorStr:", v51, &v260);
      objc_storeStrong(v52, v260);
      goto LABEL_173;
    case 0xA:
      if (!v5)
        goto LABEL_105;
      v53 = *(void **)(a1 + 32);
      v54 = *(_QWORD *)(a1 + 40);
      v55 = (id *)(v277 + 5);
      v259 = (id)v277[5];
      objc_msgSend(v53, "unsetIPSecParameters:errorStr:", v54, &v259);
      objc_storeStrong(v55, v259);
      goto LABEL_173;
    case 0xB:
      if (!v5)
        goto LABEL_105;
      v56 = *(void **)(a1 + 32);
      v57 = *(void **)(a1 + 40);
      v58 = (id *)(v277 + 5);
      v258 = (id)v277[5];
      -[NEUtilConfigurationClient setPPPParameters:errorStr:](v56, v57, &v258);
      objc_storeStrong(v58, v258);
      goto LABEL_173;
    case 0xC:
      if (!v5)
        goto LABEL_105;
      v59 = *(void **)(a1 + 32);
      v60 = *(void **)(a1 + 40);
      v61 = (id *)(v277 + 5);
      v257 = (id)v277[5];
      -[NEUtilConfigurationClient unsetPPPParameters:errorStr:](v59, v60, &v257);
      objc_storeStrong(v61, v257);
      goto LABEL_173;
    case 0xD:
      if (!v5)
        goto LABEL_105;
      v62 = *(void **)(a1 + 32);
      v63 = *(_QWORD *)(a1 + 40);
      v64 = (id *)(v277 + 5);
      v256 = (id)v277[5];
      objc_msgSend(v62, "addOnDemandRuleWithParameters:errorStr:", v63, &v256);
      objc_storeStrong(v64, v256);
      goto LABEL_173;
    case 0xE:
      if (!v5)
        goto LABEL_105;
      v65 = *(void **)(a1 + 32);
      v66 = *(_QWORD *)(a1 + 40);
      v67 = (id *)(v277 + 5);
      v255 = (id)v277[5];
      objc_msgSend(v65, "removeOnDemandRuleWithParameters:errorStr:", v66, &v255);
      objc_storeStrong(v67, v255);
      goto LABEL_173;
    case 0xF:
      if (!v5)
        goto LABEL_105;
      v68 = *(void **)(a1 + 32);
      v69 = *(_QWORD *)(a1 + 40);
      v70 = (id *)(v277 + 5);
      v224 = (id)v277[5];
      objc_msgSend(v68, "setProxyParameters:errorStr:", v69, &v224);
      objc_storeStrong(v70, v224);
      goto LABEL_173;
    case 0x10:
      if (!v5)
        goto LABEL_105;
      v71 = *(void **)(a1 + 32);
      v72 = *(_QWORD *)(a1 + 40);
      v73 = (id *)(v277 + 5);
      v223 = (id)v277[5];
      objc_msgSend(v71, "unsetProxyParameters:errorStr:", v72, &v223);
      objc_storeStrong(v73, v223);
      goto LABEL_173;
    case 0x11:
      if (!v5)
        goto LABEL_105;
      v74 = *(void **)(a1 + 32);
      v75 = *(_QWORD *)(a1 + 40);
      v76 = (id *)(v277 + 5);
      v222 = (id)v277[5];
      objc_msgSend(v74, "setProxyServer:errorStr:", v75, &v222);
      objc_storeStrong(v76, v222);
      goto LABEL_173;
    case 0x12:
      if (!v5)
        goto LABEL_105;
      v77 = *(void **)(a1 + 32);
      v78 = *(_QWORD *)(a1 + 40);
      v79 = (id *)(v277 + 5);
      v221 = (id)v277[5];
      objc_msgSend(v77, "unsetProxyServer:errorStr:", v78, &v221);
      objc_storeStrong(v79, v221);
      goto LABEL_173;
    case 0x13:
      if (!v5)
        goto LABEL_105;
      v80 = *(void **)(a1 + 32);
      v81 = *(_QWORD *)(a1 + 40);
      v82 = (id *)(v277 + 5);
      v226 = (id)v277[5];
      objc_msgSend(v80, "setDNSParameters:errorStr:", v81, &v226);
      objc_storeStrong(v82, v226);
      goto LABEL_173;
    case 0x14:
      if (!v5)
        goto LABEL_105;
      v83 = *(void **)(a1 + 32);
      v84 = *(_QWORD *)(a1 + 40);
      v85 = (id *)(v277 + 5);
      v225 = (id)v277[5];
      objc_msgSend(v83, "unsetDNSParameters:errorStr:", v84, &v225);
      objc_storeStrong(v85, v225);
      goto LABEL_173;
    case 0x19:
      if (!v5)
        goto LABEL_105;
      v88 = *(void **)(a1 + 32);
      v89 = *(void **)(a1 + 40);
      v90 = (id *)(v277 + 5);
      v250 = (id)v277[5];
      -[NEUtilConfigurationClient addAppRuleWithParameters:errorStr:](v88, v89, &v250);
      objc_storeStrong(v90, v250);
      goto LABEL_173;
    case 0x1A:
      if (!v5)
        goto LABEL_105;
      v91 = *(void **)(a1 + 32);
      v92 = *(void **)(a1 + 40);
      v93 = (id *)(v277 + 5);
      v249 = (id)v277[5];
      -[NEUtilConfigurationClient removeAppRuleWithParameters:errorStr:](v91, v92, &v249);
      objc_storeStrong(v93, v249);
      goto LABEL_173;
    case 0x1B:
      if (!v5)
        goto LABEL_105;
      v94 = *(void **)(a1 + 32);
      v95 = *(void **)(a1 + 40);
      v96 = (id *)(v277 + 5);
      v248 = (id)v277[5];
      -[NEUtilConfigurationClient setPathControllerWithParameters:errorStr:](v94, v95, &v248);
      objc_storeStrong(v96, v248);
      goto LABEL_173;
    case 0x1C:
      if (!v5)
        goto LABEL_105;
      v97 = *(void **)(a1 + 32);
      v98 = *(void **)(a1 + 40);
      v99 = (id *)(v277 + 5);
      v247 = (id)v277[5];
      -[NEUtilConfigurationClient addPathRuleWithParameters:errorStr:](v97, v98, (const __CFString **)&v247);
      objc_storeStrong(v99, v247);
      goto LABEL_173;
    case 0x1D:
      if (!v5)
        goto LABEL_105;
      v100 = *(void **)(a1 + 32);
      v101 = *(void **)(a1 + 40);
      v102 = (id *)(v277 + 5);
      v246 = (id)v277[5];
      -[NEUtilConfigurationClient removePathRuleWithParameters:errorStr:](v100, v101, &v246);
      objc_storeStrong(v102, v246);
      goto LABEL_173;
    case 0x1E:
      if (v5)
      {
        objc_msgSend(v5, "description");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v103);

      }
      else
      {
        v179 = (void *)MEMORY[0x1E0CB3940];
        Property = *(id *)(a1 + 32);
        if (Property)
          Property = objc_getProperty(Property, v7, 24, 1);
        v181 = Property;
        objc_msgSend(v181, "debugDescription");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "stringWithFormat:", CFSTR("%@\n"), v182);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v183);

        v185 = *(void **)(a1 + 32);
        if (v185)
        {
          v186 = objc_getProperty(v185, v184, 40, 1);
          if (v186)
          {
            v188 = v186;
            v189 = *(id *)(a1 + 32);
            if (v189)
              v189 = objc_getProperty(v189, v187, 40, 1);
            v190 = v189;
            v191 = objc_msgSend(v190, "count") == 0;

            if (!v191)
            {
              v244 = 0u;
              v245 = 0u;
              v242 = 0u;
              v243 = 0u;
              v192 = *(id *)(a1 + 32);
              if (v192)
                v192 = objc_getProperty(v192, v187, 40, 1);
              v193 = v192;
              v194 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v242, v285, 16);
              if (v194)
              {
                v195 = *(_QWORD *)v243;
                do
                {
                  for (i = 0; i != v194; ++i)
                  {
                    if (*(_QWORD *)v243 != v195)
                      objc_enumerationMutation(v193);
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v242 + 1) + 8 * i));
                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "addObject:", v197);

                  }
                  v194 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v242, v285, 16);
                }
                while (v194);
              }

            }
          }
          v198 = *(void **)(a1 + 32);
          if (v198)
          {
            v199 = objc_getProperty(v198, v187, 32, 1);
            if (v199)
            {
              v201 = v199;
              v202 = *(id *)(a1 + 32);
              if (v202)
                v202 = objc_getProperty(v202, v200, 32, 1);
              v203 = v202;
              v204 = objc_msgSend(v203, "count") == 0;

              if (!v204)
              {
                objc_msgSend(v8, "addObject:", CFSTR("New Configurations:\n"));
                v240 = 0u;
                v241 = 0u;
                v238 = 0u;
                v239 = 0u;
                v206 = *(id *)(a1 + 32);
                if (v206)
                  v206 = objc_getProperty(v206, v205, 32, 1);
                v207 = v206;
                v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v238, v284, 16);
                if (v208)
                {
                  v209 = *(_QWORD *)v239;
                  do
                  {
                    for (j = 0; j != v208; ++j)
                    {
                      if (*(_QWORD *)v239 != v209)
                        objc_enumerationMutation(v207);
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v238 + 1) + 8 * j));
                      v211 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v8, "addObject:", v211);

                    }
                    v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v238, v284, 16);
                  }
                  while (v208);
                }

              }
            }
          }
        }
      }
      goto LABEL_173;
    case 0x1F:
      +[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
      v235[0] = MEMORY[0x1E0C809B0];
      v235[1] = 3221225472;
      v235[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_650;
      v235[3] = &unk_1E3CC3CB8;
      v235[4] = *(_QWORD *)(a1 + 32);
      v236 = v8;
      v237 = *(id *)(a1 + 56);
      objc_msgSend(v14, "loadIndexWithFilter:completionQueue:handler:", 0, v15, v235);

      goto LABEL_176;
    case 0x20:
      if (!v5)
        goto LABEL_105;
      v104 = *(id *)(a1 + 32);
      if (v104)
        v104 = objc_getProperty(v104, v7, 24, 1);
      v105 = v104;
      v106 = MEMORY[0x1E0C80D38];
      v107 = MEMORY[0x1E0C80D38];
      v229[0] = MEMORY[0x1E0C809B0];
      v229[1] = 3221225472;
      v229[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_662;
      v229[3] = &unk_1E3CC3CE0;
      v230 = *(id *)(a1 + 48);
      v108 = v8;
      v109 = *(_QWORD *)(a1 + 32);
      v231 = v108;
      v232 = v109;
      v233 = v5;
      v234 = *(id *)(a1 + 56);
      objc_msgSend(v105, "saveConfiguration:withCompletionQueue:handler:", v233, v106, v229);

      goto LABEL_176;
    case 0x21:
      if (!v5)
        goto LABEL_105;
      v110 = *(id *)(a1 + 32);
      if (v110)
        v110 = objc_getProperty(v110, v7, 24, 1);
      v111 = v110;
      v112 = MEMORY[0x1E0C80D38];
      v113 = MEMORY[0x1E0C80D38];
      v268[0] = MEMORY[0x1E0C809B0];
      v268[1] = 3221225472;
      v268[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_644;
      v268[3] = &unk_1E3CC3C90;
      v273 = &v276;
      v114 = *(id *)(a1 + 48);
      v115 = *(_QWORD *)(a1 + 32);
      v269 = v114;
      v270 = v115;
      v271 = v5;
      v272 = *(id *)(a1 + 56);
      objc_msgSend(v111, "removeConfiguration:withCompletionQueue:handler:", v271, v112, v268);

      goto LABEL_176;
    case 0x22:
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("profile-file-path"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      ne_log_obj();
      v117 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v283 = v116;
        _os_log_debug_impl(&dword_19BD16000, v117, OS_LOG_TYPE_DEBUG, "process ingestion command, path %@", buf, 0xCu);
      }

      v118 = -[NEProfileIngestion initWithName:]([NEProfileIngestion alloc], "initWithName:", CFSTR("neutil"));
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v116);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = -[NEProfilePayloadBase initWithPayload:]([NEProfilePayloadBase alloc], "initWithPayload:", v119);
      -[NEProfileIngestion createConfigurationFromPayload:payloadType:](v118, "createConfigurationFromPayload:payloadType:", v120, CFSTR("com.apple.vpn.managed"));
      -[NEProfileIngestion ingestedConfiguration](v118, "ingestedConfiguration");
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      if (v121)
        -[NEProfileIngestion saveIngestedConfiguration](v118, "saveIngestedConfiguration");

      goto LABEL_173;
    case 0x26:
      if (!v5)
        goto LABEL_105;
      v122 = *(void **)(a1 + 32);
      v123 = *(void **)(a1 + 40);
      v124 = (id *)(v277 + 5);
      v228 = (id)v277[5];
      -[NEUtilConfigurationClient setAlwaysOnParameters:errorStr:](v122, v123, (const __CFString **)&v228);
      objc_storeStrong(v124, v228);
      goto LABEL_173;
    case 0x27:
      if (!v5)
        goto LABEL_105;
      v125 = *(void **)(a1 + 32);
      v126 = *(void **)(a1 + 40);
      v127 = (id *)(v277 + 5);
      v227 = (id)v277[5];
      -[NEUtilConfigurationClient unsetAlwaysOnParameters:errorStr:](v125, v126, (const __CFString **)&v227);
      objc_storeStrong(v127, v227);
      goto LABEL_173;
    case 0x28:
      if (!v5)
        goto LABEL_105;
      v17 = *(void **)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      v19 = (id *)(v277 + 5);
      obj = (id)v277[5];
      -[NEUtilConfigurationClient swapConfigurationTypeWithParameters:errorStr:](v17, v18, &obj);
      objc_storeStrong(v19, obj);
      goto LABEL_173;
    case 0x2A:
      v128 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("profile-file-path"));
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "dictionaryWithContentsOfFile:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      if (!isa_nsdictionary(v130))
      {
        v171 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("profile-file-path"));
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "stringWithFormat:", CFSTR("Failed to read from %@"), v132);
        v172 = objc_claimAutoreleasedReturnValue();
        v173 = (void *)v277[5];
        v277[5] = v172;
LABEL_171:

        goto LABEL_172;
      }
      +[NEConfiguration configurationWithProfilePayload:grade:](NEConfiguration, "configurationWithProfilePayload:grade:", v130, 1);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v132)
      {
        v212 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("profile-file-path"));
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v212, "stringWithFormat:", CFSTR("Failed to create a configuration from profile payload at %@. Make sure that the file only contains the configuration payload."), v173);
        v213 = objc_claimAutoreleasedReturnValue();
        v214 = (void *)v277[5];
        v277[5] = v213;

        v132 = 0;
        goto LABEL_171;
      }
      v133 = *(void **)(a1 + 32);
      if (!v133 || !objc_getProperty(v133, v131, 32, 1))
      {
        v136 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v137 = *(void **)(a1 + 32);
        if (v137)
          objc_setProperty_atomic(v137, v135, v136, 32);

      }
      v138 = *(id *)(a1 + 32);
      if (v138)
        v138 = objc_getProperty(v138, v134, 32, 1);
      v139 = v138;
      objc_msgSend(v139, "addObject:", v132);

      v141 = *(void **)(a1 + 32);
      if (v141)
        objc_setProperty_atomic(v141, v140, v132, 56);
LABEL_172:

LABEL_173:
      if (v277[5])
        objc_msgSend(v8, "addObject:");
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_176:

      _Block_object_dispose(&v276, 8);
      return;
    case 0x2B:
      v142 = [NEConfiguration alloc];
      v143 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "name");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "stringWithFormat:", CFSTR("%@ Per-App"), v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = -[NEConfiguration initWithName:grade:](v142, "initWithName:grade:", v145, objc_msgSend(v5, "grade"));

      v147 = objc_alloc_init(NEVPNApp);
      -[NEConfiguration setAppVPN:](v146, "setAppVPN:", v147);

      objc_msgSend(v5, "VPN");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "protocol");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfiguration appVPN](v146, "appVPN");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "setProtocol:", v149);

      -[NEConfiguration appVPN](v146, "appVPN");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "setOnDemandEnabled:", 1);

      objc_msgSend(v5, "VPN");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "onDemandRules");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = (void *)objc_msgSend(v153, "copy");
      -[NEConfiguration appVPN](v146, "appVPN");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "setOnDemandRules:", v154);

      -[NEConfiguration appVPN](v146, "appVPN");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setEnabled:", 1);

      -[NEConfiguration appVPN](v146, "appVPN");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "setTunnelType:", 1);

      +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = MEMORY[0x1E0C80D38];
      v160 = MEMORY[0x1E0C80D38];
      v218[0] = MEMORY[0x1E0C809B0];
      v218[1] = 3221225472;
      v218[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_671;
      v218[3] = &unk_1E3CC3D10;
      v161 = v146;
      v219 = v161;
      v220 = &v276;
      objc_msgSend(v158, "saveConfiguration:withCompletionQueue:handler:", v161, v159, v218);

      goto LABEL_173;
    case 0x2C:
      if (!v5)
        goto LABEL_105;
      v162 = *(void **)(a1 + 32);
      v163 = *(_QWORD *)(a1 + 40);
      v164 = (id *)(v277 + 5);
      v217 = (id)v277[5];
      objc_msgSend(v162, "setAppPushParameters:errorStr:", v163, &v217);
      objc_storeStrong(v164, v217);
      goto LABEL_173;
    case 0x2D:
      if (!v5)
        goto LABEL_105;
      v20 = *(void **)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      v22 = (id *)(v277 + 5);
      v216 = (id)v277[5];
      objc_msgSend(v20, "unsetAppPushParameters:errorStr:", v21, &v216);
      objc_storeStrong(v22, v216);
      goto LABEL_173;
    case 0x2E:
      if (!v5)
        goto LABEL_105;
      v165 = *(void **)(a1 + 32);
      v166 = *(_QWORD *)(a1 + 40);
      v167 = (id *)(v277 + 5);
      v254 = (id)v277[5];
      objc_msgSend(v165, "addRelayWithParameters:errorStr:", v166, &v254);
      objc_storeStrong(v167, v254);
      goto LABEL_173;
    case 0x2F:
      if (!v5)
        goto LABEL_105;
      v23 = *(void **)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      v25 = (id *)(v277 + 5);
      v253 = (id)v277[5];
      objc_msgSend(v23, "removeRelayWithParameters:errorStr:", v24, &v253);
      objc_storeStrong(v25, v253);
      goto LABEL_173;
    case 0x30:
      if (!v5)
        goto LABEL_105;
      v26 = *(void **)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 40);
      v28 = (id *)(v277 + 5);
      v252 = (id)v277[5];
      objc_msgSend(v26, "setRelayConditionsWithParameters:errorStr:", v27, &v252);
      objc_storeStrong(v28, v252);
      goto LABEL_173;
    case 0x31:
      if (v5)
      {
        v168 = *(void **)(a1 + 32);
        v169 = *(_QWORD *)(a1 + 40);
        v170 = (id *)(v277 + 5);
        v251 = (id)v277[5];
        objc_msgSend(v168, "unsetRelayConditionsWithParameters:errorStr:", v169, &v251);
        objc_storeStrong(v170, v251);
      }
      else
      {
LABEL_105:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Configuration with name \"%@\" does not exist"), *(_QWORD *)(a1 + 48));
        v177 = objc_claimAutoreleasedReturnValue();
        v178 = (void *)v277[5];
        v277[5] = v177;

      }
      goto LABEL_173;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown command"));
      v86 = objc_claimAutoreleasedReturnValue();
      v87 = (void *)v277[5];
      v277[5] = v86;

      goto LABEL_173;
  }
}

void __73__NEUtilConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id Property;
  const char *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 40, 1);
  find_config_by_name(Property, *(void **)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = *(id *)(a1 + 32);
    if (v7)
      v7 = objc_getProperty(v7, v5, 32, 1);
    find_config_by_name(v7, *(void **)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)loadConfigurationsForceRefresh:(void *)a3 completionHandler:
{
  const char *v5;
  id v6;
  const char *v7;
  void *v8;
  id Property;
  _QWORD block[4];
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  if (a1)
  {
    if (!objc_getProperty(a1, v5, 40, 1) || a2)
    {
      Property = objc_getProperty(a1, v7, 24, 1);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke;
      v12[3] = &unk_1E3CC46D0;
      v12[4] = a1;
      v13 = v6;
      objc_msgSend(Property, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v12);
      v8 = v13;
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke_2;
      block[3] = &unk_1E3CC4720;
      v11 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v8 = v11;
    }

  }
}

void __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id Property;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    convert_error_to_string_21542(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed to load the current configurations: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = *(void **)(a1 + 32);
  if (v13)
    objc_setProperty_atomic(v13, v11, v12, 40);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        Property = *(id *)(a1 + 32);
        if (Property)
          Property = objc_getProperty(Property, v16, 40, 1);
        v22 = Property;
        v23 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(v22, "addObject:", v23);

      }
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)swapConfigurationTypeWithParameters:(_QWORD *)a3 errorStr:
{
  const char *v5;
  uint64_t v6;
  void *v7;
  NEVPNApp *v8;
  void *v9;
  void *v10;
  SEL v11;
  SEL v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SEL v17;
  SEL v18;
  uint64_t v19;
  id v20;

  if (a1)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("type"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("vpn")))
    {
      objc_msgSend(objc_getProperty(a1, v5, 56, 1), "appVPN");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_alloc_init(NEVPN);
        -[NEVPN setEnabled:](v8, "setEnabled:", objc_msgSend(v7, "isEnabled"));
        -[NEVPN setOnDemandEnabled:](v8, "setOnDemandEnabled:", objc_msgSend(v7, "isOnDemandEnabled"));
        -[NEVPN setDisconnectOnDemandEnabled:](v8, "setDisconnectOnDemandEnabled:", objc_msgSend(v7, "isDisconnectOnDemandEnabled"));
        objc_msgSend(v7, "onDemandRules");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPN setOnDemandRules:](v8, "setOnDemandRules:", v9);

        objc_msgSend(v7, "protocol");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPN setProtocol:](v8, "setProtocol:", v10);

        objc_msgSend(objc_getProperty(a1, v11, 56, 1), "setAppVPN:", 0);
        objc_msgSend(objc_getProperty(a1, v12, 56, 1), "setVPN:", v8);
LABEL_8:

LABEL_13:
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No configuration found for swapping %@ -> %@"), CFSTR("appvpn"), v20);
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("appvpn")))
    {
      objc_msgSend(objc_getProperty(a1, v13, 56, 1), "VPN");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v7 = (void *)v14;
        v8 = objc_alloc_init(NEVPNApp);
        -[NEVPN setEnabled:](v8, "setEnabled:", objc_msgSend(v7, "isEnabled"));
        -[NEVPN setOnDemandEnabled:](v8, "setOnDemandEnabled:", objc_msgSend(v7, "isOnDemandEnabled"));
        -[NEVPN setDisconnectOnDemandEnabled:](v8, "setDisconnectOnDemandEnabled:", objc_msgSend(v7, "isDisconnectOnDemandEnabled"));
        objc_msgSend(v7, "onDemandRules");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPN setOnDemandRules:](v8, "setOnDemandRules:", v15);

        objc_msgSend(v7, "protocol");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPN setProtocol:](v8, "setProtocol:", v16);

        -[NEVPN setTunnelType:](v8, "setTunnelType:", 1);
        objc_msgSend(objc_getProperty(a1, v17, 56, 1), "setVPN:", 0);
        objc_msgSend(objc_getProperty(a1, v18, 56, 1), "setAppVPN:", v8);
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No configuration found for swapping %@ -> %@"), CFSTR("vpn"), v20);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid configuration type for swapping: %@"), v20, v19);
    }
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_644(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id Property;
  const char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = a1[4];
    convert_error_to_string_21542(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Failed to remove configuration \"%@\": %@"), v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[8] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    Property = (id)a1[5];
    if (Property)
      Property = objc_getProperty(Property, v4, 32, 1);
    objc_msgSend(Property, "removeObjectIdenticalTo:", a1[6]);
    v14 = (id)a1[5];
    if (v14)
      v14 = objc_getProperty(v14, v13, 40, 1);
    objc_msgSend(v14, "removeObjectIdenticalTo:", a1[6]);
  }
  v15 = a1[7];
  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    v17[0] = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v15 + 16))(a1[7], 0);
  }

}

- (void)setPPPParameters:(_QWORD *)a3 errorStr:
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NEIPv4Settings *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  BOOL v39;
  NEIPv4Settings *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NEIPv6Settings *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NEIPv6Settings *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  _QWORD *v79;
  const __CFString *v80;
  void *v81;
  NEKeychainItem *v82;
  const char *v83;
  void *v84;
  uint64_t v85;
  id Property;
  id v87;
  NEKeychainItem *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  SEL v94;
  id v95;
  const char *v96;
  void *v97;
  unint64_t v98;
  const char *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  id self;
  void *v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;

  v5 = a2;
  if (a1)
  {
    v109 = v5;
    objc_msgSend(a1, "protocolForParameters:", v5);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *a3 = CFSTR("Configuration VPN type is not L2TP");
LABEL_109:

      v5 = v109;
      goto LABEL_110;
    }
    v106 = a3;
    objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("authentication-method"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v109;
    if (v7)
    {
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("authentication-method"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("password")) & 1) != 0)
      {
        v10 = 1;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("securID")) & 1) != 0)
      {
        v10 = 2;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("certificate")) & 1) != 0)
      {
        v10 = 3;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("kerberos")) & 1) != 0)
      {
        v10 = 4;
      }
      else
      {
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("cryptocard")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"password\", \"securID\", \"certificate\", \"kerberos\", and \"cryptocard\"), CFSTR("authentication-method"));
          *v106 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_115;
        }
        v10 = 5;
      }
      objc_msgSend(v6, "setAuthenticationMethod:", v10);

      v8 = v109;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("verbose-logging-enabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("verbose-logging-enabled"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setVerboseLoggingEnabled:", objc_msgSend(v18, "BOOLValue"));

    }
    objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv4-config-method"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v109;
    if (!v19)
    {
LABEL_29:
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ipv4-address"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      self = a1;
      if (v27)
      {
        v28 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv4-address"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend(v28, "initWithObjects:", v29, 0);

      }
      else
      {
        v107 = 0;
      }
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv4-subnet-mask"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv4-subnet-mask"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v31, "initWithObjects:", v32, 0);

      }
      else
      {
        v15 = 0;
      }
      v16 = (void *)v107;
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv4-router"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv4-router"));
        v108 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v108 = 0;
      }
      objc_msgSend(v6, "IPv4Settings");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_43;
      v35 = (void *)v34;
      objc_msgSend(v6, "IPv4Settings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v15;
      v38 = objc_msgSend(v36, "configMethod");

      v39 = v38 == 3;
      v15 = v37;
      if (v39)
      {
        v40 = -[NEIPv4Settings initWithAddresses:subnetMasks:]([NEIPv4Settings alloc], "initWithAddresses:subnetMasks:", v107, v37);
        objc_msgSend(v6, "setIPv4Settings:", v40);

        objc_msgSend(v6, "IPv4Settings");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setConfigMethod:", 3);

        v14 = (void *)v108;
        if (v108)
        {
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv4-router"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "IPv4Settings");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setRouter:", v42);

          v15 = v37;
        }
      }
      else
      {
LABEL_43:
        v14 = (void *)v108;
        if (v107 || v15 || v108)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ cannot be specified, %@ is not \"manual\"), CFSTR("ipv4-address"), CFSTR("ipv4-subnet-mask"), CFSTR("ipv4-router"), CFSTR("ipv4-config-method"));
          v57 = (id)objc_claimAutoreleasedReturnValue();
          v11 = 0;
          v12 = 0;
          v13 = 0;
          goto LABEL_88;
        }
      }
      v105 = v15;
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("send-all-traffic"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_msgSend(v6, "IPv4Settings");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be specified, %@ is not \"manual\" or \"ppp\"), CFSTR("send-all-traffic"), CFSTR("ipv4-config-method"));
          v58 = (id)objc_claimAutoreleasedReturnValue();
          v11 = 0;
          v12 = 0;
          v13 = 0;
LABEL_107:
          *v106 = v58;
          goto LABEL_108;
        }
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("send-all-traffic"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "BOOLValue");
        objc_msgSend(v6, "IPv4Settings");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setOverridePrimary:", v47);

      }
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv6-config-method"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = v109;
      if (v49)
      {
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv6-config-method"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "IPv6Settings");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v52)
        {
          v53 = -[NEIPv6Settings initWithConfigMethod:]([NEIPv6Settings alloc], "initWithConfigMethod:", 1);
          objc_msgSend(v6, "setIPv6Settings:", v53);

        }
        if (objc_msgSend(v51, "isEqualToString:", CFSTR("automatic")))
        {
          objc_msgSend(v6, "IPv6Settings");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54;
          v56 = 1;
        }
        else if (objc_msgSend(v51, "isEqualToString:", CFSTR("manual")))
        {
          objc_msgSend(v6, "IPv6Settings");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54;
          v56 = 2;
        }
        else
        {
          if (!objc_msgSend(v51, "isEqualToString:", CFSTR("link-local")))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"automatic\", \"manual\", and \"link-local\"), CFSTR("ipv6-config-method"));
            *v106 = (id)objc_claimAutoreleasedReturnValue();

            v11 = 0;
            v12 = 0;
            v13 = 0;
            goto LABEL_108;
          }
          objc_msgSend(v6, "IPv6Settings");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54;
          v56 = 3;
        }
        objc_msgSend(v54, "setConfigMethod:", v56);

        v50 = v109;
      }
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("ipv6-address"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        v60 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv6-address"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v60, "initWithObjects:", v61, 0);

      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv6-prefix-length"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        v63 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv6-prefix-length"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v63, "initWithObjects:", v64, 0);

      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv6-router"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv6-router"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v6, "IPv6Settings");
      v66 = objc_claimAutoreleasedReturnValue();
      if (v66
        && (v67 = (void *)v66,
            objc_msgSend(v6, "IPv6Settings"),
            v68 = (void *)objc_claimAutoreleasedReturnValue(),
            v69 = objc_msgSend(v68, "configMethod"),
            v68,
            v67,
            v69 == 2))
      {
        v70 = -[NEIPv6Settings initWithAddresses:networkPrefixLengths:]([NEIPv6Settings alloc], "initWithAddresses:networkPrefixLengths:", v13, v12);
        objc_msgSend(v6, "setIPv6Settings:", v70);

        objc_msgSend(v6, "IPv6Settings");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setConfigMethod:", 2);

        objc_msgSend(v6, "IPv6Settings");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv6-router"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "IPv6Settings");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setRouter:", v73);

        }
      }
      else if (v13 || v12 || v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ cannot be specified, %@ is not \"manual\"), CFSTR("ipv6-address"), CFSTR("ipv6-prefix-length"), CFSTR("ipv6-router"), CFSTR("ipv6-config-method"));
        v78 = (id)objc_claimAutoreleasedReturnValue();
        v79 = v106;
        v16 = (void *)v107;
        goto LABEL_84;
      }
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("machine-authentication-method"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)v107;
      v14 = (void *)v108;
      if (!v75)
      {
LABEL_92:
        v80 = CFSTR("shared-secret");
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("shared-secret"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (v81)
        {
          if (objc_msgSend(v6, "type") != 2)
            goto LABEL_106;
          v82 = [NEKeychainItem alloc];
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("shared-secret"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            v85 = v6[10];
            Property = objc_getProperty(v6, v83, 88, 1);
          }
          else
          {
            v85 = 0;
            Property = 0;
          }
          v87 = Property;
          v88 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v82, "initWithPassword:domain:accessGroup:", v84, v85, v87);
          objc_msgSend(v6, "setSharedSecretKeychainItem:", v88);

          v16 = (void *)v107;
          v14 = (void *)v108;
        }
        v80 = CFSTR("local-identifier");
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("local-identifier"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v89)
        {
LABEL_100:
          v80 = CFSTR("machine-identity");
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("machine-identity"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v91)
          {
LABEL_108:
            v15 = v105;
            goto LABEL_109;
          }
          if (objc_msgSend(v6, "type") == 2)
          {
            objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("machine-identity"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = objc_msgSend(v92, "integerValue");

            v95 = objc_getProperty(self, v94, 48, 1);
            if (v95)
            {
              v97 = v95;
              v98 = objc_msgSend(objc_getProperty(self, v96, 48, 1), "count");

              if (v93 < v98)
              {
                objc_msgSend(objc_getProperty(self, v99, 48, 1), "objectAtIndexedSubscript:", v93);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("domain"));
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = objc_msgSend(v101, "integerValue");

                if (v102)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, an identity in the system keychain is required"), CFSTR("machine-identity"));
                  *v106 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("persistent-reference"));
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "setMachineIdentityReference:", v103);

                }
                goto LABEL_85;
              }
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@ index, use the \"list-identities\" command to obtain a list of available identities and their indicies"), CFSTR("machine-identity"));
            v78 = (id)objc_claimAutoreleasedReturnValue();
            v79 = v106;
LABEL_84:
            *v79 = v78;
LABEL_85:
            v15 = v105;
LABEL_86:
            v14 = (void *)v108;
            goto LABEL_109;
          }
          goto LABEL_106;
        }
        if (objc_msgSend(v6, "type") == 2)
        {
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("local-identifier"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setLocalIdentifier:", v90);

          goto LABEL_100;
        }
LABEL_106:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, VPN type is not L2TP"), v80);
        v58 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_107;
      }
      v15 = v105;
      if (objc_msgSend(v6, "type") == 2)
      {
        objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("machine-authentication-method"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v76, "isEqualToString:", CFSTR("shared-secret")) & 1) != 0)
        {
          v77 = 1;
        }
        else
        {
          if ((objc_msgSend(v76, "isEqualToString:", CFSTR("certificate")) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"shared-secret\" and \"certificate\"), CFSTR("machine-authentication-method"));
            *v106 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_86;
          }
          v77 = 2;
        }
        objc_msgSend(v6, "setMachineAuthenticationMethod:", v77);

        v14 = (void *)v108;
        goto LABEL_92;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, VPN type is not L2TP"), CFSTR("machine-authentication-method"));
      v57 = (id)objc_claimAutoreleasedReturnValue();
LABEL_88:
      *v106 = v57;
      goto LABEL_109;
    }
    objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("ipv4-config-method"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "IPv4Settings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v23 = -[NEIPv4Settings initWithConfigMethod:]([NEIPv4Settings alloc], "initWithConfigMethod:", 2);
      objc_msgSend(v6, "setIPv4Settings:", v23);

    }
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("ppp")))
    {
      objc_msgSend(v6, "IPv4Settings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 2;
LABEL_27:
      objc_msgSend(v24, "setConfigMethod:", v26);

LABEL_28:
      v20 = v109;
      goto LABEL_29;
    }
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("manual")))
    {
      objc_msgSend(v6, "IPv4Settings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 3;
      goto LABEL_27;
    }
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("automatic")))
    {
      objc_msgSend(v6, "IPv4Settings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = 1;
      goto LABEL_27;
    }
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("off")))
    {
      objc_msgSend(v6, "setIPv4Settings:", 0);
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, valid values are \"ppp\", \"manual\", \"automatic\", and \"off\"), CFSTR("ipv4-config-method"));
    *v106 = (id)objc_claimAutoreleasedReturnValue();

LABEL_115:
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_109;
  }
LABEL_110:

}

- (void)unsetPPPParameters:(_QWORD *)a3 errorStr:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NEIPv4Settings *v23;
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
  NEIPv6Settings *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v5 = a2;
  if (a1)
  {
    v43 = v5;
    objc_msgSend(a1, "protocolForParameters:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      *a3 = CFSTR("Configuration VPN type is not L2TP");
LABEL_59:

      v5 = v43;
      goto LABEL_60;
    }
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("authentication-method"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v6, "setAuthenticationMethod:", 1);
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("send-all-traffic"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "IPv4Settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "IPv4Settings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setOverridePrimary:", 0);

      }
    }
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("verbose-logging-enabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v6, "setVerboseLoggingEnabled:", 0);
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ipv4-config-method"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "IPv4Settings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "IPv4Settings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setConfigMethod:", 2);

      }
    }
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ipv4-address"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v6, "IPv4Settings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v6, "IPv4Settings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addresses");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ipv4-subnet-mask"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v6, "IPv4Settings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v6, "IPv4Settings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "subnetMasks");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!v15)
      {
LABEL_24:
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ipv4-router"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v6, "IPv4Settings");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v6, "IPv4Settings");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setRouter:", 0);

          }
        }
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ipv6-config-method"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v6, "IPv6Settings");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v6, "IPv6Settings");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setConfigMethod:", 1);

          }
        }
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ipv6-address"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend(v6, "IPv6Settings");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v6, "IPv6Settings");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addresses");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ipv6-prefix-length"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(v6, "IPv6Settings");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v6, "IPv6Settings");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "networkPrefixLengths");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (!v30)
            goto LABEL_40;
        }
        v34 = -[NEIPv6Settings initWithAddresses:networkPrefixLengths:]([NEIPv6Settings alloc], "initWithAddresses:networkPrefixLengths:", v18, v19);
        objc_msgSend(v6, "setIPv6Settings:", v34);

LABEL_40:
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ipv6-router"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v6, "IPv6Settings");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            objc_msgSend(v6, "IPv6Settings");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setRouter:", 0);

          }
        }
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("machine-authentication-method"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          if (objc_msgSend(v6, "type") == 2)
          {
            objc_msgSend(v6, "setMachineAuthenticationMethod:", 1);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, VPN type is not L2TP"), CFSTR("machine-authentication-method"));
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("shared-secret"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          if (objc_msgSend(v6, "type") == 2)
          {
            objc_msgSend(v6, "sharedSecretKeychainItem");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setIdentifier:", 0);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, VPN type is not L2TP"), CFSTR("shared-secret"));
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("local-identifier"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          if (objc_msgSend(v6, "type") == 2)
          {
            objc_msgSend(v6, "setLocalIdentifier:", 0);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, VPN type is not L2TP"), CFSTR("shared-secret"));
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("machine-identity"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          if (objc_msgSend(v6, "type") == 2)
          {
            objc_msgSend(v6, "setMachineIdentityReference:", 0);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@, VPN type is not L2TP"), CFSTR("machine-identity"));
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        goto LABEL_59;
      }
    }
    v23 = -[NEIPv4Settings initWithAddresses:subnetMasks:]([NEIPv4Settings alloc], "initWithAddresses:subnetMasks:", v16, v17);
    objc_msgSend(v6, "setIPv4Settings:", v23);

    goto LABEL_24;
  }
LABEL_60:

}

- (void)addAppRuleWithParameters:(_QWORD *)a3 errorStr:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SEL v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  SEL v14;
  id Property;
  void *v16;
  void *v17;
  const char *v18;
  NEPerApp *v19;
  SEL v20;
  void *v21;
  void *v22;
  void *v23;
  SEL v24;
  id v25;
  void *v26;
  void *v27;
  const char *v28;
  NEPerApp *v29;
  SEL v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  NEPerApp *v37;
  SEL v38;
  void *v39;
  void *v40;
  void *v41;
  NEAppRule *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  SEL v51;
  void *v52;
  const char *v53;
  void *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-signing-identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-domains"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-account-identifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(objc_getProperty(a1, v10, 56, 1), "appVPN");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(objc_getProperty(a1, v12, 56, 1), "appVPN");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(objc_getProperty(a1, v12, 56, 1), "contentFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    Property = objc_getProperty(a1, v14, 56, 1);
    if (v13)
    {
      objc_msgSend(Property, "contentFilter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "perApp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v19 = objc_alloc_init(NEPerApp);
        objc_msgSend(objc_getProperty(a1, v20, 56, 1), "contentFilter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setPerApp:", v19);

      }
      objc_msgSend(objc_getProperty(a1, v18, 56, 1), "contentFilter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(Property, "dnsProxy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_getProperty(a1, v24, 56, 1);
      if (v23)
      {
        objc_msgSend(v25, "dnsProxy");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "perApp");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          v29 = objc_alloc_init(NEPerApp);
          objc_msgSend(objc_getProperty(a1, v30, 56, 1), "dnsProxy");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setPerApp:", v29);

        }
        objc_msgSend(objc_getProperty(a1, v28, 56, 1), "dnsProxy");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v25, "relay");
        v32 = objc_claimAutoreleasedReturnValue();

        if (!v32)
          goto LABEL_17;
        objc_msgSend(objc_getProperty(a1, v33, 56, 1), "relay");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "perApp");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
          v37 = objc_alloc_init(NEPerApp);
          objc_msgSend(objc_getProperty(a1, v38, 56, 1), "relay");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setPerApp:", v37);

        }
        objc_msgSend(objc_getProperty(a1, v36, 56, 1), "relay");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v40 = v22;
    objc_msgSend(v22, "perApp");
    v32 = objc_claimAutoreleasedReturnValue();

LABEL_17:
    if (!(v11 | v32))
    {
      *a3 = CFSTR("No perApp configuration present to apply app rules to");
LABEL_41:

      return;
    }
    if (v11)
      v41 = (void *)v11;
    else
      v41 = (void *)v32;
    v42 = (NEAppRule *)objc_msgSend(v41, "copyAppRuleByID:", v6);
    if (v42)
    {
      if (v11)
      {
LABEL_24:
        v43 = (void *)v11;
LABEL_27:
        objc_msgSend(v43, "removeAppRuleByID:", v6);
        -[NEAppRule setMatchPath:](v42, "setMatchPath:", v7);
        if (isa_nsarray(v8))
        {
          -[NEAppRule setMatchDomains:](v42, "setMatchDomains:", v8);
        }
        else if (isa_nsstring(v8))
        {
          v55[0] = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEAppRule setMatchDomains:](v42, "setMatchDomains:", v44);

        }
        if (isa_nsarray(v9))
        {
          -[NEAppRule setMatchAccountIdentifiers:](v42, "setMatchAccountIdentifiers:", v9);
        }
        else if (isa_nsstring(v9))
        {
          v54 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEAppRule setMatchAccountIdentifiers:](v42, "setMatchAccountIdentifiers:", v45);

        }
        v46 = objc_alloc(MEMORY[0x1E0C99DE8]);
        if (v11)
        {
          objc_msgSend((id)v11, "appRules");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v46, "initWithArray:", v47);

          objc_msgSend(v48, "addObject:", v42);
          v49 = (void *)v11;
        }
        else
        {
          objc_msgSend((id)v32, "appRules");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v46, "initWithArray:", v50);

          objc_msgSend(v48, "addObject:", v42);
          v49 = (void *)v32;
        }
        objc_msgSend(v49, "setAppRules:", v48);
        objc_msgSend(objc_getProperty(a1, v51, 56, 1), "externalIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v52)
          objc_msgSend(objc_getProperty(a1, v53, 56, 1), "setExternalIdentifier:", CFSTR("NEUTIL-PERAPP-UUID"));

        goto LABEL_41;
      }
    }
    else
    {
      v42 = -[NEAppRule initWithSigningIdentifier:]([NEAppRule alloc], "initWithSigningIdentifier:", v6);
      if (v11)
        goto LABEL_24;
    }
    v43 = (void *)v32;
    goto LABEL_27;
  }
}

- (void)removeAppRuleWithParameters:(_QWORD *)a3 errorStr:
{
  id v5;
  void *v6;
  void *v7;
  SEL v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  SEL v12;
  id Property;
  void *v14;
  void *v15;
  SEL v16;
  id v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  SEL v37;
  void *v38;
  int v39;
  const char *v40;
  void *v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-signing-identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(a1, v8, 56, 1), "appVPN");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(objc_getProperty(a1, v10, 56, 1), "appVPN");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(objc_getProperty(a1, v10, 56, 1), "contentFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    Property = objc_getProperty(a1, v12, 56, 1);
    if (v11)
    {
      objc_msgSend(Property, "contentFilter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(Property, "dnsProxy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_getProperty(a1, v16, 56, 1);
      if (v15)
      {
        objc_msgSend(v17, "dnsProxy");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v17, "relay");
        v18 = objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_11;
        objc_msgSend(objc_getProperty(a1, v19, 56, 1), "relay");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v20 = v14;
    objc_msgSend(v14, "perApp");
    v18 = objc_claimAutoreleasedReturnValue();

LABEL_11:
    if (!(v9 | v18))
    {
      *a3 = CFSTR("No perApp configuration present to apply app rules to");
LABEL_39:

      goto LABEL_40;
    }
    v43 = a3;
    v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v44 = v6;
    if (v9)
      v22 = (void *)v9;
    else
      v22 = (void *)v18;
    objc_msgSend(v22, "appRules");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithArray:", v23);

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v26)
    {
      v27 = v26;
      v41 = (void *)v18;
      v42 = (void *)v9;
      v28 = 0;
      v29 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v31, "matchSigningIdentifier", v41, v42);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToString:", v7);

          if (v33)
          {
            v34 = v31;

            v28 = v34;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v27);

      v18 = (uint64_t)v41;
      v9 = (uint64_t)v42;
      if (v28)
      {
        objc_msgSend(v25, "removeObject:", v28);
        v6 = v44;
        if (objc_msgSend(v25, "count"))
        {
          if (v42)
            v35 = v42;
          else
            v35 = v41;
          objc_msgSend(v35, "setAppRules:", v25);
        }
        else
        {
          if (v42)
            v36 = v42;
          else
            v36 = v41;
          objc_msgSend(v36, "setAppRules:", 0);
          objc_msgSend(objc_getProperty(a1, v37, 56, 1), "externalIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("NEUTIL-PERAPP-UUID"));

          if (v39)
            objc_msgSend(objc_getProperty(a1, v40, 56, 1), "setExternalIdentifier:", 0);
        }
        goto LABEL_38;
      }
    }
    else
    {

    }
    v28 = 0;
    v6 = v44;
    *v43 = CFSTR("No matched rule");
LABEL_38:

    goto LABEL_39;
  }
LABEL_40:

}

- (void)setPathControllerWithParameters:(_QWORD *)a3 errorStr:
{
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SEL v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  id v22;

  v5 = a2;
  if (a1)
  {
    v22 = v5;
    objc_msgSend(objc_getProperty(a1, v6, 56, 1), "pathController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      *a3 = CFSTR("No Path Controller configuration present");
LABEL_18:
      v5 = v22;
      goto LABEL_19;
    }
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("enabled"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");
      objc_msgSend(objc_getProperty(a1, v11, 56, 1), "pathController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnabled:", v10);

    }
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("cellular-fallback"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("default")))
    {
      objc_msgSend(objc_getProperty(a1, v14, 56, 1), "pathController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 0;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("none")))
    {
      objc_msgSend(objc_getProperty(a1, v18, 56, 1), "pathController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 1;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("foreground")))
    {
      objc_msgSend(objc_getProperty(a1, v19, 56, 1), "pathController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 3;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("background")))
    {
      objc_msgSend(objc_getProperty(a1, v20, 56, 1), "pathController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 7;
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("all")))
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(objc_getProperty(a1, v21, 56, 1), "pathController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 11;
    }
    objc_msgSend(v15, "setCellularFallbackFlags:", v17);

    goto LABEL_17;
  }
LABEL_19:

}

- (void)addPathRuleWithParameters:(const __CFString *)a3 errorStr:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SEL v12;
  void *v13;
  NEPathRule *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  SEL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SEL v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-signing-identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-domains"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("match-account-identifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellular-behavior"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifi-behavior"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(objc_getProperty(a1, v12, 56, 1), "pathController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NEPathRule *)objc_msgSend(v13, "copyPathRuleBySigningIdentifier:", v6);

    if (!v14)
      v14 = -[NEAppRule initWithSigningIdentifier:]([NEPathRule alloc], "initWithSigningIdentifier:", v6);
    objc_msgSend(objc_getProperty(a1, v15, 56, 1), "pathController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removePathRuleBySigningIdentifier:", v6);

    -[NEAppRule setMatchPath:](v14, "setMatchPath:", v7);
    if (isa_nsarray(v8))
    {
      -[NEAppRule setMatchDomains:](v14, "setMatchDomains:", v8);
    }
    else if (isa_nsstring(v8))
    {
      v38[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEAppRule setMatchDomains:](v14, "setMatchDomains:", v17);

    }
    if (isa_nsarray(v9))
    {
      -[NEAppRule setMatchAccountIdentifiers:](v14, "setMatchAccountIdentifiers:", v9);
    }
    else if (isa_nsstring(v9))
    {
      v37 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEAppRule setMatchAccountIdentifiers:](v14, "setMatchAccountIdentifiers:", v19);

    }
    if (v10)
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("allow")) & 1) != 0)
      {
        v20 = 0;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("deny")) & 1) != 0)
      {
        v20 = 1;
      }
      else
      {
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("allow-while-roaming")) & 1) == 0)
        {
          v35 = CFSTR("Cellular behavior value not recognized");
          goto LABEL_31;
        }
        v20 = 2;
      }
      -[NEPathRule setCellularBehavior:](v14, "setCellularBehavior:", v20);
    }
    if (v11)
    {
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("allow")) & 1) != 0)
      {
        v21 = 0;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("deny")) & 1) != 0)
      {
        v21 = 1;
      }
      else
      {
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("allow-while-roaming")) & 1) == 0)
        {
          v35 = CFSTR("WiFi behavior value not recognized");
          goto LABEL_31;
        }
        v21 = 2;
      }
      -[NEPathRule setWifiBehavior:](v14, "setWifiBehavior:", v21);
    }
    objc_msgSend(objc_getProperty(a1, v18, 56, 1), "pathController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(objc_getProperty(a1, v24, 56, 1), "pathController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pathRules");
      v36 = v9;
      v26 = v10;
      v27 = v11;
      v28 = v8;
      v29 = v6;
      v30 = v7;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v23, "initWithArray:", v31);

      objc_msgSend(v32, "addObject:", v14);
      objc_msgSend(objc_getProperty(a1, v33, 56, 1), "pathController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setPathRules:", v32);

      v7 = v30;
      v6 = v29;
      v8 = v28;
      v11 = v27;
      v10 = v26;
      v9 = v36;

LABEL_32:
      return;
    }
    v35 = CFSTR("No Path Controller configuration present to apply path rules to");
LABEL_31:
    *a3 = v35;
    goto LABEL_32;
  }
}

- (void)removePathRuleWithParameters:(_QWORD *)a3 errorStr:
{
  void *v5;
  SEL v6;
  void *v7;
  id v8;
  SEL v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  SEL v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("match-signing-identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(a1, v6, 56, 1), "pathController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(objc_getProperty(a1, v9, 56, 1), "pathController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathRules");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v8, "initWithArray:", v11);

      if (objc_msgSend(v12, "count"))
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(objc_getProperty(a1, v13, 56, 1), "pathController", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pathRules");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v29 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v20, "matchSigningIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqualToString:", v5);

              if (v22)
                objc_msgSend(v12, "removeObject:", v20);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v17);
        }

        v23 = objc_msgSend(v12, "count");
        objc_msgSend(objc_getProperty(a1, v24, 56, 1), "pathController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v23)
          v27 = v12;
        else
          v27 = 0;
        objc_msgSend(v25, "setPathRules:", v27);

      }
      else
      {
        *a3 = CFSTR("No rules present");
      }

    }
    else
    {
      *a3 = CFSTR("No Path Controller configuration present to apply app rules to");
    }

  }
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_650(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  id Property;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  passwd *v33;
  char *pw_name;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  const char *v41;
  void *v42;
  id v43;
  uint64_t v44;
  const char *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  int id_type[2];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  unsigned __int8 v81[128];
  unsigned __int8 uu[8];
  uint64_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("UserMap"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = objc_getProperty(v4, v3, 40, 1);
    if (v5)
    {
      v7 = v5;
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v6, 40, 1);
      v9 = objc_msgSend(Property, "count");

      if (v9)
      {
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v10 = *(id *)(a1 + 32);
        if (v10)
          v10 = objc_getProperty(v10, v6, 40, 1);
        obj = v10;
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
        if (v61)
        {
          v58 = *(_QWORD *)v78;
          v59 = a1;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v78 != v58)
                objc_enumerationMutation(obj);
              v62 = v11;
              v12 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v11);
              v13 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v12, "name");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (Users:"), v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v73 = 0u;
              v74 = 0u;
              v75 = 0u;
              v76 = 0u;
              v16 = v60;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v74;
                do
                {
                  for (i = 0; i != v18; ++i)
                  {
                    if (*(_QWORD *)v74 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
                    objc_msgSend(v16, "objectForKeyedSubscript:", v21);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "identifier");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v22, "containsObject:", v23);

                    if (v24)
                      objc_msgSend(v63, "addObject:", v21);

                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
                }
                while (v18);
              }

              v25 = v63;
              if (objc_msgSend(v63, "count"))
              {
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                v26 = v63;
                v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
                a1 = v59;
                if (v27)
                {
                  v28 = v27;
                  v29 = *(_QWORD *)v70;
                  do
                  {
                    v30 = 0;
                    v31 = v15;
                    do
                    {
                      if (*(_QWORD *)v70 != v29)
                        objc_enumerationMutation(v26);
                      v32 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v30);
                      *(_QWORD *)id_type = 0;
                      *(_QWORD *)uu = 0;
                      v83 = 0;
                      objc_msgSend(v32, "getUUIDBytes:", uu);
                      mbr_uuid_to_id(uu, (id_t *)id_type, &id_type[1]);
                      if (id_type[0]
                        && (v33 = getpwuid(id_type[0])) != 0
                        && (pw_name = v33->pw_name) != 0
                        && *pw_name)
                      {
                        v35 = id_type[0];
                        objc_msgSend(v32, "UUIDString");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "stringByAppendingFormat:", CFSTR(" %s(%d)[%@]"), pw_name, v35, v36);
                      }
                      else
                      {
                        v37 = id_type[0];
                        objc_msgSend(v32, "UUIDString");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "stringByAppendingFormat:", CFSTR(" %d[%@]"), v37, v36, v56);
                      }
                      v15 = (void *)objc_claimAutoreleasedReturnValue();

                      ++v30;
                      v31 = v15;
                    }
                    while (v28 != v30);
                    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
                  }
                  while (v28);
                }

                objc_msgSend(v15, "stringByAppendingString:", CFSTR(")\n"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v63;
              }
              else
              {
                objc_msgSend(v15, "stringByAppendingString:", CFSTR(" None)\n"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                a1 = v59;
              }

              objc_msgSend(*(id *)(a1 + 40), "addObject:", v38);
              v11 = v62 + 1;
            }
            while (v62 + 1 != v61);
            v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
          }
          while (v61);
        }

      }
    }
    v39 = *(void **)(a1 + 32);
    if (v39)
    {
      v40 = objc_getProperty(v39, v6, 32, 1);
      if (v40)
      {
        v42 = v40;
        v43 = *(id *)(a1 + 32);
        if (v43)
          v43 = objc_getProperty(v43, v41, 32, 1);
        v44 = objc_msgSend(v43, "count");

        if (v44)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", CFSTR("New Configurations:\n"));
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v46 = *(id *)(a1 + 32);
          if (v46)
            v46 = objc_getProperty(v46, v45, 32, 1);
          v47 = v46;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v65;
            do
            {
              for (j = 0; j != v49; ++j)
              {
                if (*(_QWORD *)v65 != v50)
                  objc_enumerationMutation(v47);
                v52 = *(void **)(a1 + 40);
                v53 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "name");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "stringWithFormat:", CFSTR("%@\n"), v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "addObject:", v55);

              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
            }
            while (v49);
          }

        }
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_662(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id Property;
  const char *v10;
  id v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = *(_QWORD *)(a1 + 32);
    convert_error_to_string_21542(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Failed to save configuration \"%@\": %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else
  {
    Property = *(id *)(a1 + 48);
    if (Property)
      Property = objc_getProperty(Property, v4, 32, 1);
    objc_msgSend(Property, "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 56));
    v11 = *(id *)(a1 + 48);
    if (v11)
      v11 = objc_getProperty(v11, v10, 40, 1);
    objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 56));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)setAlwaysOnParameters:(const __CFString *)a3 errorStr:
{
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  NEAOVPNException *v18;
  const __CFString *v19;
  void *v20;
  char v21;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NEAOVPNException *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;

  v42 = a2;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v5, 56, 1), "alwaysOnVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      *a3 = CFSTR("Requires AlwaysOn configuraton");
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ui-toggle-enabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ui-toggle-enabled"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setToggleEnabled:", objc_msgSend(v8, "BOOLValue"));

    }
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v18 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("AirPlay")) & 1) == 0)
    {
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AirPrint")) & 1) == 0)
      {
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("AirDrop")) & 1) == 0)
        {
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VoiceMail")) & 1) == 0)
          {
            objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v14, "isEqualToString:", CFSTR("CellularServices")) & 1) == 0)
            {
              objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("DeviceCommunication"));

              if ((v41 & 1) == 0)
              {
                v9 = 0;
                v18 = 0;
                v19 = CFSTR("Service must be: AirPlay, AirPrint, AirDrop, VoiceMail, CellularServices or DeviceCommunication");
                goto LABEL_40;
              }
              goto LABEL_17;
            }

          }
        }

      }
    }

LABEL_17:
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-action"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v18 = 0;
      v19 = CFSTR("Action is required");
LABEL_40:
      *a3 = v19;
      goto LABEL_41;
    }
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-action"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Allow"));

    if ((v16 & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-action"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("Drop"));

      if ((v21 & 1) == 0)
      {
        v9 = 0;
        v18 = 0;
        v19 = CFSTR("Action must be Allow or Drop");
        goto LABEL_40;
      }
      v17 = 2;
    }
    objc_msgSend(v6, "serviceExceptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v6, "serviceExceptions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v23, "mutableCopy");

    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    }
    v18 = objc_alloc_init(NEAOVPNException);
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAOVPNException setServiceName:](v18, "setServiceName:", v24);

    -[NEAOVPNException setAction:](v18, "setAction:", v17);
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v25);

    objc_msgSend(v6, "setServiceExceptions:", v9);
LABEL_28:
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("allow-all-cn-plugins"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("allow-all-cn-plugins"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowAllCaptiveNetworkPlugins:", objc_msgSend(v27, "BOOLValue"));

    }
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("allow-websheet"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("allow-websheet"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowCaptiveWebSheet:", objc_msgSend(v29, "BOOLValue"));

    }
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("cn-plugin-bundle-id"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_41;
    objc_msgSend(v6, "allowedCaptiveNetworkPlugins");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v6, "allowedCaptiveNetworkPlugins");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("cn-plugin-bundle-id"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v19 = CFSTR("BundleId already exists");
        goto LABEL_40;
      }
      objc_msgSend(v6, "allowedCaptiveNetworkPlugins");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v36, "mutableCopy");

      v9 = v36;
    }
    else
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    }

    v37 = objc_alloc_init(NEAOVPNException);
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("cn-plugin-bundle-id"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAOVPNException setBundleIdentifier:](v37, "setBundleIdentifier:", v38);

    -[NEAOVPNException setAction:](v37, "setAction:", 1);
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("cn-plugin-bundle-id"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, v39);

    objc_msgSend(v6, "setAllowedCaptiveNetworkPlugins:", v35);
    v9 = v35;
    v18 = v37;
LABEL_41:

  }
}

- (void)unsetAlwaysOnParameters:(const __CFString *)a3 errorStr:
{
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  id v28;

  v28 = a2;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v5, 56, 1), "alwaysOnVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      *a3 = CFSTR("Requires AlwaysOn configuraton");
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ui-toggle-enabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v6, "setToggleEnabled:", 0);
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "serviceExceptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v27 = CFSTR("No existing service to be removed");
        goto LABEL_26;
      }
      objc_msgSend(v6, "serviceExceptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v8 = 0;
        v27 = CFSTR("Service does not exist");
        goto LABEL_26;
      }
      objc_msgSend(v6, "serviceExceptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("service-exception-name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v13);

      if (objc_msgSend(v8, "count"))
        v14 = v8;
      else
        v14 = 0;
      objc_msgSend(v6, "setServiceExceptions:", v14);
    }
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("allow-all-cn-plugins"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v6, "setAllowAllCaptiveNetworkPlugins:", 0);
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("allow-websheet"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v6, "setAllowCaptiveWebSheet:", 0);
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("cn-plugin-bundle-id"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_27;
    objc_msgSend(v6, "allowedCaptiveNetworkPlugins");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v6, "allowedCaptiveNetworkPlugins");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("cn-plugin-bundle-id"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v6, "allowedCaptiveNetworkPlugins");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "mutableCopy");

        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("cn-plugin-bundle-id"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "removeObjectForKey:", v24);

        if (objc_msgSend(v23, "count"))
        {
          v25 = v6;
          v26 = v23;
        }
        else
        {
          v25 = v6;
          v26 = 0;
        }
        objc_msgSend(v25, "setAllowedCaptiveNetworkPlugins:", v26);
        v8 = v23;
        goto LABEL_27;
      }
      v27 = CFSTR("BundleId does not exist");
    }
    else
    {
      v27 = CFSTR("No existing CaptoveNetworkPlugin to be removed");
    }
LABEL_26:
    *a3 = v27;
LABEL_27:

  }
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_671(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_large_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_INFO, "Save error: %@ for %@", buf, 0x16u);
    }

    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Save Configuration with name \"%@\" failed with error: %@"), v7, v3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __69__NEUtilConfigurationClient_reloadIdentityListWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  SEL v12;
  const char *v13;
  id v14;
  SEL v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(a1 + 32);
        if (v7)
        {
          v8 = (objc_class *)MEMORY[0x1E0C99E08];
          v9 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v6);
          v10 = (void *)objc_msgSend([v8 alloc], "initWithDictionary:", v9);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("domain"));

          if (!objc_getProperty(v7, v12, 48, 1))
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_setProperty_atomic(v7, v15, v14, 48);

          }
          objc_msgSend(objc_getProperty(v7, v13, 48, 1), "addObject:", v10);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)relayConfiguration
{
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, a2, 56, 1), "relay");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __48__NEUtilConfigurationClient_initWithClientName___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[NEUtilConfigurationClient loadConfigurationsForceRefresh:completionHandler:](WeakRetained, 1, &__block_literal_global_6);

}

+ (id)clientWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  __objc2_class **v7;

  v3 = a3;
  +[NEUtilConfigurationClient allClients]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_msgSend(v3, "hasPrefix:", CFSTR("app:"));
    v7 = off_1E3CBBDD8;
    if (!v6)
      v7 = off_1E3CBBE68;
    v5 = (void *)objc_msgSend(objc_alloc(*v7), "initWithClientName:", v3);
    if (v5)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v3);
  }

  return v5;
}

+ (void)removeClientWithName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[NEUtilConfigurationClient allClients]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

+ (id)allClients
{
  objc_opt_self();
  if (allClients_g_initClients != -1)
    dispatch_once(&allClients_g_initClients, &__block_literal_global_22124);
  return (id)allClients_g_clients;
}

void __39__NEUtilConfigurationClient_allClients__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)allClients_g_clients;
  allClients_g_clients = (uint64_t)v0;

}

@end
