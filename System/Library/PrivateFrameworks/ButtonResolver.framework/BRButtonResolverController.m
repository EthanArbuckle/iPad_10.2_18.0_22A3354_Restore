@implementation BRButtonResolverController

+ (id)sharedInstance
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[5];

  v3 = _BRLog_log;
  if (!_BRLog_log)
  {
    v3 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v3;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[BRButtonResolverController sharedInstance].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__BRButtonResolverController_sharedInstance__block_invoke;
  block[3] = &unk_24D4A3E38;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_inst;
}

id __44__BRButtonResolverController_sharedInstance__block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedInstance_inst = (uint64_t)result;
  return result;
}

- (BRButtonResolverController)init
{
  BRButtonResolverController *v2;
  NSSet *v3;
  NSSet *v4;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRButtonResolverController;
  v2 = -[BRButtonResolverController init](&v7, sel_init);
  if (v2)
  {
    v3 = +[BRInterface interfaces](BRInterface, "interfaces");
    v2->_interfaces = v3;
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      v6 = _BRLog_log;
      if (!_BRLog_log)
      {
        v6 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log = (uint64_t)v6;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BRButtonResolverController init].cold.1(v6);

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRButtonResolverController;
  -[BRButtonResolverController dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRButtonResolverController;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", -[BRButtonResolverController description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("Interfaces: %@;\n"), self->_interfaces);
  return v3;
}

- (id)propertyList
{
  void *v3;
  NSSet *interfaces;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  interfaces = self->_interfaces;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(interfaces);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "propertyList"), objc_msgSend((id)objc_opt_class(), "description"));
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v9 = _BRLog_log;
  if (!_BRLog_log)
  {
    v9 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRButtonResolverController propertyList].cold.1((uint64_t)v3, v9, v10);
  return v3;
}

- (BOOL)isReady
{
  NSSet *interfaces;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  interfaces = self->_interfaces;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(interfaces);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "isReady");
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (unint64_t)maxAssetSlots
{
  NSSet *interfaces;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  interfaces = self->_interfaces;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return -1;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  v6 = -1;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(interfaces);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend(v8, "maxAssetSlots") < v6)
        v6 = objc_msgSend(v8, "maxAssetSlots");
    }
    v4 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v6;
}

- (unint64_t)unusedAssetSlots
{
  NSSet *interfaces;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  interfaces = self->_interfaces;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return -1;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  v6 = -1;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(interfaces);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend(v8, "maxAssetSlots") < v6)
        v6 = objc_msgSend(v8, "unusedAssetSlots");
    }
    v4 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v6;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSSet *interfaces;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v7 = _BRLog_log;
  if (!_BRLog_log)
  {
    v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRButtonResolverController setGlobalConfigs:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  if (-[BRButtonResolverController isReady](self, "isReady"))
  {
    if (a3)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      interfaces = self->_interfaces;
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (!v16)
      {
        v20 = 0;
        return v20 == 0;
      }
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(interfaces);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "setGlobalConfigs:error:", a3, &v30);
        }
        v17 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v17);
      v20 = v30;
      if (!v30)
        return v20 == 0;
      goto LABEL_15;
    }
    v23 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD1100];
    v25 = -536870206;
  }
  else
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD1100];
    v25 = -536870184;
  }
  v20 = (void *)objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, 0);
  v30 = v20;
  if (!v20)
    return v20 == 0;
LABEL_15:
  v21 = _BRLog_log;
  if (!_BRLog_log)
  {
    v21 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v21;
    v20 = v30;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[BRButtonResolverController setGlobalConfigs:error:]";
    v33 = 2112;
    v34 = v20;
    _os_log_error_impl(&dword_215E56000, v21, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    v20 = v30;
    if (!a4)
      return v20 == 0;
    goto LABEL_19;
  }
  if (a4)
LABEL_19:
    *a4 = v20;
  return v20 == 0;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSSet *interfaces;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v36 = 0;
  v11 = _BRLog_log;
  if (!_BRLog_log)
  {
    v11 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BRButtonResolverController setConfigs:withAssets:forStates:error:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  if (-[BRButtonResolverController isReady](self, "isReady"))
  {
    if (a5)
    {
      if (objc_msgSend(a5, "count"))
      {
        if (!a3 || (v19 = objc_msgSend(a3, "count"), v19 == objc_msgSend(a5, "count")))
        {
          if (!a4 || (v20 = objc_msgSend(a4, "count"), v20 == objc_msgSend(a5, "count")))
          {
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            interfaces = self->_interfaces;
            v22 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            if (!v22)
            {
              v26 = 0;
              return v26 == 0;
            }
            v23 = v22;
            v24 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v33 != v24)
                  objc_enumerationMutation(interfaces);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "setConfigs:withAssets:forStates:error:", a3, a4, a5, &v36);
              }
              v23 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            }
            while (v23);
            v26 = v36;
            if (!v36)
              return v26 == 0;
            goto LABEL_20;
          }
        }
      }
    }
    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD1100];
    v31 = -536870206;
  }
  else
  {
    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD1100];
    v31 = -536870184;
  }
  v26 = (void *)objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v31, 0);
  v36 = v26;
  if (!v26)
    return v26 == 0;
LABEL_20:
  v27 = _BRLog_log;
  if (!_BRLog_log)
  {
    v27 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v27;
    v26 = v36;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[BRButtonResolverController setConfigs:withAssets:forStates:error:]";
    v39 = 2112;
    v40 = v26;
    _os_log_error_impl(&dword_215E56000, v27, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    v26 = v36;
    if (!a6)
      return v26 == 0;
    goto LABEL_24;
  }
  if (a6)
LABEL_24:
    *a6 = v26;
  return v26 == 0;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSSet *interfaces;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v7 = _BRLog_log;
  if (!_BRLog_log)
  {
    v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRButtonResolverController enableStates:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  if (-[BRButtonResolverController isReady](self, "isReady"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    interfaces = self->_interfaces;
    v16 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (!v16)
    {
      v20 = 0;
      return v20 == 0;
    }
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(interfaces);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "enableStates:error:", a3, &v27);
      }
      v17 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v17);
    v20 = v27;
    if (!v27)
      return v20 == 0;
  }
  else
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870184, 0);
    v27 = v20;
    if (!v20)
      return v20 == 0;
  }
  v21 = _BRLog_log;
  if (!_BRLog_log)
  {
    v21 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v21;
    v20 = v27;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[BRButtonResolverController enableStates:error:]";
    v30 = 2112;
    v31 = v20;
    _os_log_error_impl(&dword_215E56000, v21, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    v20 = v27;
    if (!a4)
      return v20 == 0;
    goto LABEL_18;
  }
  if (a4)
LABEL_18:
    *a4 = v20;
  return v20 == 0;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *interfaces;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v9 = _BRLog_log;
  if (!_BRLog_log)
  {
    v9 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRButtonResolverController disableStates:clearAsset:error:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  if (-[BRButtonResolverController isReady](self, "isReady"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    interfaces = self->_interfaces;
    v18 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (!v18)
    {
      v22 = 0;
      return v22 == 0;
    }
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(interfaces);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "disableStates:clearAsset:error:", a3, v6, &v29);
      }
      v19 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v19);
    v22 = v29;
    if (!v29)
      return v22 == 0;
  }
  else
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870184, 0);
    v29 = v22;
    if (!v22)
      return v22 == 0;
  }
  v23 = _BRLog_log;
  if (!_BRLog_log)
  {
    v23 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v23;
    v22 = v29;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[BRButtonResolverController disableStates:clearAsset:error:]";
    v32 = 2112;
    v33 = v22;
    _os_log_error_impl(&dword_215E56000, v23, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    v22 = v29;
    if (!a5)
      return v22 == 0;
    goto LABEL_18;
  }
  if (a5)
LABEL_18:
    *a5 = v22;
  return v22 == 0;
}

- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5
{
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *interfaces;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v9 = _BRLog_log;
  if (!_BRLog_log)
  {
    v9 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRButtonResolverController playState:forSpeed:error:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  if (-[BRButtonResolverController isReady](self, "isReady"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    interfaces = self->_interfaces;
    v18 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (!v18)
    {
      v22 = 0;
      return v22 == 0;
    }
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(interfaces);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "playState:forSpeed:error:", a3, a4, &v29);
      }
      v19 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v19);
    v22 = v29;
    if (!v29)
      return v22 == 0;
  }
  else
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870184, 0);
    v29 = v22;
    if (!v22)
      return v22 == 0;
  }
  v23 = _BRLog_log;
  if (!_BRLog_log)
  {
    v23 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v23;
    v22 = v29;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[BRButtonResolverController playState:forSpeed:error:]";
    v32 = 2112;
    v33 = v22;
    _os_log_error_impl(&dword_215E56000, v23, OS_LOG_TYPE_ERROR, "%s error: %@", buf, 0x16u);
    v22 = v29;
    if (!a5)
      return v22 == 0;
    goto LABEL_18;
  }
  if (a5)
LABEL_18:
    *a5 = v22;
  return v22 == 0;
}

- (void)scheduleReadyNotificationOnDispatchQueue:(id)a3 withBlock:(id)a4
{
  NSObject *v7;
  NSSet *interfaces;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[8];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[3];
  NSUInteger v20;
  _BYTE v21[128];
  _BYTE v22[32];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v20 = -[NSSet count](self->_interfaces, "count");
  v7 = _BRLog_log;
  if (!_BRLog_log)
  {
    v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRButtonResolverController scheduleReadyNotificationOnDispatchQueue:withBlock:].cold.1((uint64_t)v22, -[NSSet count](self->_interfaces, "count"), v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  interfaces = self->_interfaces;
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(interfaces);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __81__BRButtonResolverController_scheduleReadyNotificationOnDispatchQueue_withBlock___block_invoke;
        v14[3] = &unk_24D4A3E60;
        v14[6] = a4;
        v14[7] = v19;
        v14[4] = a3;
        v14[5] = v13;
        objc_msgSend(v13, "scheduleReadyNotificationWithBlock:", v14);
        ++v12;
      }
      while (v9 != v12);
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](interfaces, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v9);
  }
  _Block_object_dispose(v19, 8);
}

void __81__BRButtonResolverController_scheduleReadyNotificationOnDispatchQueue_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a1 + 56;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(_QWORD *)(v3 + 24) - 1;
  *(_QWORD *)(v3 + 24) = v4;
  if (!v4)
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 48));
  v5 = _BRLog_log;
  if (!_BRLog_log)
  {
    v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __81__BRButtonResolverController_scheduleReadyNotificationOnDispatchQueue_withBlock___block_invoke_cold_1(a1, v2, v5);
}

+ (void)sharedInstance
{
  OUTLINED_FUNCTION_0(&dword_215E56000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)init
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[BRButtonResolverController init]";
  _os_log_error_impl(&dword_215E56000, log, OS_LOG_TYPE_ERROR, "%s failed!", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)propertyList
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[BRButtonResolverController propertyList]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_2(&dword_215E56000, a2, a3, "%s %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)setGlobalConfigs:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E56000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setConfigs:(uint64_t)a3 withAssets:(uint64_t)a4 forStates:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E56000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)enableStates:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E56000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)disableStates:(uint64_t)a3 clearAsset:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E56000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)playState:(uint64_t)a3 forSpeed:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E56000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)scheduleReadyNotificationOnDispatchQueue:(NSObject *)a3 withBlock:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315394;
  *(_QWORD *)(a1 + 4) = "-[BRButtonResolverController scheduleReadyNotificationOnDispatchQueue:withBlock:]";
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a2;
  OUTLINED_FUNCTION_2(&dword_215E56000, a3, (uint64_t)a3, "%s interface count: %lu", (uint8_t *)a1);
}

void __81__BRButtonResolverController_scheduleReadyNotificationOnDispatchQueue_withBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = objc_opt_class();
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 24);
  v7 = 136315650;
  v8 = "-[BRButtonResolverController scheduleReadyNotificationOnDispatchQueue:withBlock:]_block_invoke";
  v9 = 2112;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  _os_log_debug_impl(&dword_215E56000, a3, OS_LOG_TYPE_DEBUG, "%s interface is ready: %@, unready interfaces: %lu", (uint8_t *)&v7, 0x20u);
}

@end
