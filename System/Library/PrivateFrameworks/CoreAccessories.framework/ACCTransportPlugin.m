@implementation ACCTransportPlugin

- (ACCTransportPlugin)initWithDelegate:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  ACCTransportPlugin *v8;
  ACCTransportPlugin *v9;
  uint64_t v10;
  NSMutableSet *activeConnectionUUIDs;
  NSMutableDictionary *v12;
  NSMutableDictionary *connectionPropertyChangeHandlers;
  NSMutableDictionary *v14;
  NSMutableDictionary *endpointPropertyChangeHandlers;
  objc_super v17;

  v4 = a3;
  init_logging();
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportPlugin initWithDelegate:].cold.1(self);

  v17.receiver = self;
  v17.super_class = (Class)ACCTransportPlugin;
  v8 = -[ACCTransportPlugin init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    activeConnectionUUIDs = v9->_activeConnectionUUIDs;
    v9->_activeConnectionUUIDs = (NSMutableSet *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    connectionPropertyChangeHandlers = v9->_connectionPropertyChangeHandlers;
    v9->_connectionPropertyChangeHandlers = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointPropertyChangeHandlers = v9->_endpointPropertyChangeHandlers;
    v9->_endpointPropertyChangeHandlers = v14;

  }
  return v9;
}

- (void)dealloc
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "pluginClassAndName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1AF649000, v2, v3, "Dealloc %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (NSString)pluginClassAndName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCTransportPlugin pluginName](self, "pluginName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)initPlugin
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "pluginClassAndName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1AF649000, v2, v3, "initPlugin for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)startPlugin
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "pluginClassAndName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1AF649000, v2, v3, "startPlugin for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)stopPlugin
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "pluginClassAndName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1AF649000, v2, v3, "stopPlugin for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)authStatusDidChangeHandler:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportPlugin authStatusDidChangeHandler:].cold.1(self);

  if (-[ACCTransportPlugin conformsToProtocol:](self, "conformsToProtocol:", &unk_1EEE4BF10)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCTransportPlugin_AuthStatusDidChangeNotification_ConnectionUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("ACCTransportPlugin_AuthStatusDidChangeNotification_AuthStatusOld"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    objc_msgSend(v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("ACCTransportPlugin_AuthStatusDidChangeNotification_AuthStatusNew"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    objc_msgSend(v4, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("ACCTransportPlugin_AuthStatusDidChangeNotification_AuthType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");

    objc_msgSend(v4, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("ACCTransportPlugin_AuthStatusDidChangeNotification_ConnectionIsAuthenticated"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "userInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("ACCTransportPlugin_AuthStatusDidChangeNotification_ConnectionWasAuthenticated"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    -[ACCTransportPlugin authStatusDidChange:forConnectionWithUUID:previousAuthStatus:authType:connectionIsAuthenticated:connectionWasAuthenticated:](self, "authStatusDidChange:forConnectionWithUUID:previousAuthStatus:authType:connectionIsAuthenticated:connectionWasAuthenticated:", v15, v9, v12, v18, v21, v24);
  }

}

- (void)connectionPropertiesDidChangeHandler:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v34;
  uint64_t v35;
  void *v36;
  ACCTransportPlugin *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportPlugin authStatusDidChangeHandler:].cold.1(self);

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("ACCTransportPlugin_PropertiesDidChangeNotification_ConnectionUUID"));
  v9 = objc_claimAutoreleasedReturnValue();

  -[ACCTransportPlugin activeConnectionUUIDs](self, "activeConnectionUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v9;
  LODWORD(v9) = objc_msgSend(v10, "containsObject:", v9);

  if ((_DWORD)v9)
  {
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesOld"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v4;
    objc_msgSend(v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesNew"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ACCTransportPlugin conformsToProtocol:](self, "conformsToProtocol:", &unk_1EEE4BF10)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[ACCTransportPlugin propertiesDidChange:forConnectionWithUUID:previousProperties:](self, "propertiesDidChange:forConnectionWithUUID:previousProperties:", v14, v36, v12);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = self;
    -[ACCTransportPlugin connectionPropertyChangeHandlers](self, "connectionPropertyChangeHandlers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v16;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v40;
      do
      {
        v20 = 0;
        v35 = v18;
        do
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v20);
          objc_msgSend(v14, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((isNSObjectEqual((unint64_t)v22, (uint64_t)v23) & 1) == 0)
          {
            v24 = gLogObjects;
            v25 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v26 = *(id *)(gLogObjects + 8);
            }
            else
            {
              v27 = v19;
              v28 = v14;
              v29 = v12;
              v30 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v44 = v24;
                v45 = 1024;
                LODWORD(v46) = v25;
                _os_log_error_impl(&dword_1AF649000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v31 = v30;
              v26 = v30;
              v12 = v29;
              v14 = v28;
              v19 = v27;
              v18 = v35;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v44 = v21;
              v45 = 2112;
              v46 = v22;
              v47 = 2112;
              v48 = v23;
              _os_log_debug_impl(&dword_1AF649000, v26, OS_LOG_TYPE_DEBUG, "Calling connection property did change handler for property: %@ (newValue: %@, oldValue: %@)", buf, 0x20u);
            }

            -[ACCTransportPlugin connectionPropertyChangeHandlers](v37, "connectionPropertyChangeHandlers");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKey:", v21);
            v33 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

            if (v33)
              ((void (**)(_QWORD, void *, uint64_t, void *, void *))v33)[2](v33, v36, v21, v22, v23);

          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v18);
    }

    v4 = v34;
  }

}

- (void)endpointPropertiesDidChangeHandler:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  ACCTransportPlugin *v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportPlugin authStatusDidChangeHandler:].cold.1(self);

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("ACCTransportPlugin_PropertiesDidChangeNotification_ConnectionUUID"));
  v9 = objc_claimAutoreleasedReturnValue();

  -[ACCTransportPlugin activeConnectionUUIDs](self, "activeConnectionUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v9;
  LODWORD(v9) = objc_msgSend(v10, "containsObject:", v9);

  if ((_DWORD)v9)
  {
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("ACCTransportPlugin_EndpointPropertiesDidChangeNotification_EndpointUUID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesOld"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v4;
    objc_msgSend(v4, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesNew"));
    v33 = objc_claimAutoreleasedReturnValue();

    if (-[ACCTransportPlugin conformsToProtocol:](self, "conformsToProtocol:", &unk_1EEE4BF10)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[ACCTransportPlugin propertiesDidChange:forEndpointWithUUID:previousProperties:connectionUUID:](self, "propertiesDidChange:forEndpointWithUUID:previousProperties:connectionUUID:", v33, v34, v13, v35);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v36 = self;
    -[ACCTransportPlugin endpointPropertyChangeHandlers](self, "endpointPropertyChangeHandlers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v16;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    v18 = (void *)v33;
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v40;
      v21 = MEMORY[0x1E0C81028];
      do
      {
        v22 = 0;
        v37 = v19;
        do
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v22);
          objc_msgSend(v18, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((isNSObjectEqual((unint64_t)v24, (uint64_t)v25) & 1) == 0)
          {
            v26 = gLogObjects;
            v27 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v28 = *(id *)(gLogObjects + 8);
            }
            else
            {
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v44 = v26;
                v45 = 1024;
                LODWORD(v46) = v27;
                _os_log_error_impl(&dword_1AF649000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v29 = v21;
              v28 = v21;
              v18 = (void *)v33;
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v44 = v23;
              v45 = 2112;
              v46 = v24;
              v47 = 2112;
              v48 = v25;
              _os_log_debug_impl(&dword_1AF649000, v28, OS_LOG_TYPE_DEBUG, "Calling endpoint property did change handler for property: %@ (newValue: %@, oldValue: %@)", buf, 0x20u);
            }

            -[ACCTransportPlugin endpointPropertyChangeHandlers](v36, "endpointPropertyChangeHandlers");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", v23);
            v31 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

            if (v31)
              ((void (**)(_QWORD, void *, uint64_t, void *, void *, void *))v31)[2](v31, v34, v23, v24, v25, v35);

            v19 = v37;
          }

          ++v22;
        }
        while (v19 != v22);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v19);
    }

    v4 = v32;
  }

}

- (id)createConnectionWithType:(int)a3 andIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[ACCTransportPlugin delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createConnectionWithType:andIdentifier:", v4, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ACCTransportPlugin activeConnectionUUIDs](self, "activeConnectionUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v12);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)setSupervisedTransportsRestricted:(BOOL)a3 forConnectionWithUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  v4 = a3;
  v6 = a4;
  -[ACCTransportPlugin delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "setSupervisedTransportsRestricted:forConnectionWithUUID:", v4, v6);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)setProperties:(id)a3 forConnectionWithUUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  -[ACCTransportPlugin delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "setProperties:forConnectionWithUUID:", v6, v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)setAuthenticationStatus:(int)a3 andCertificateData:(id)a4 authCTA:(BOOL)a5 forConnectionWithUUID:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;

  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a6;
  -[ACCTransportPlugin delegate](self, "delegate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_opt_respondsToSelector(),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "setAuthenticationStatus:andCertificateData:authCTA:forConnectionWithUUID:", v8, v10, v7, v11);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 forConnectionWithUUID:(id)a6 publishConnection:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  _QWORD v21[5];

  v7 = a7;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  v13 = a6;
  -[ACCTransportPlugin delegate](self, "delegate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14
    && (v15 = (void *)v14,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_opt_respondsToSelector(),
        v16,
        v15,
        (v17 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __120__ACCTransportPlugin_createEndpointWithTransportType_andProtocol_andIdentifier_forConnectionWithUUID_publishConnection___block_invoke;
    v21[3] = &unk_1E5FB2658;
    v21[4] = self;
    objc_msgSend(v18, "createEndpointWithTransportType:andProtocol:andIdentifier:dataOutHandler:forConnectionWithUUID:", v10, v9, v12, v21, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && v7)
      -[ACCTransportPlugin publishConnectionWithUUID:](self, "publishConnectionWithUUID:", v13);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __120__ACCTransportPlugin_createEndpointWithTransportType_andProtocol_andIdentifier_forConnectionWithUUID_publishConnection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "routeOutgoingData:forEndpointWithUUID:connectionUUID:", a4, a3, a2);
}

- (BOOL)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  -[ACCTransportPlugin delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "setAccessoryInfo:forEndpointWithUUID:", v6, v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)setProperties:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  -[ACCTransportPlugin delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "setProperties:forEndpointWithUUID:", v6, v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)publishConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "publishConnectionWithUUID:", v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)destroyEndpointWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "destroyEndpointWithUUID:", v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)destroyConnectionWithUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v4 = a3;
  if (v4)
  {
    -[ACCTransportPlugin activeConnectionUUIDs](self, "activeConnectionUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
  -[ACCTransportPlugin delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "destroyConnectionWithUUID:", v4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)startSafeConnectionTransaction
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[ACCTransportPlugin delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ACCTransportPlugin delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[ACCTransportPlugin delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startSafeConnectionTransaction");

    }
  }
}

- (void)stopSafeConnectionTransaction
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[ACCTransportPlugin delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ACCTransportPlugin delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[ACCTransportPlugin delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopSafeConnectionTransaction");

    }
  }
}

- (id)allConnectionUUIDs
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[ACCTransportPlugin delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allConnectionUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)allEndpointsUUIDs
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[ACCTransportPlugin delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allEndpointsUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)connectionUUIDForEndpointWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectionUUIDForEndpointWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)endpointUUIDsForConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpointUUIDsForConnectionWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "authStatusForConnectionWithUUID:authType:", v6, v4);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int)connectionTypeForConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "connectionTypeForConnectionWithUUID:", v4);

  }
  else
  {
    v10 = 11;
  }

  return v10;
}

- (id)certificateDataForConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "certificateDataForConnectionWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)certificateSerialForConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "certificateSerialForConnectionWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)certificateSerialStringForConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "certificateSerialStringForConnectionWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)certificateCapabilitiesForConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "certificateCapabilitiesForConnectionWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int)transportTypeForEndpointWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "transportTypeForEndpointWithUUID:", v4);

  }
  else
  {
    v10 = 17;
  }

  return v10;
}

- (int)protocolForEndpointWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "protocolForEndpointWithUUID:", v4);

  }
  else
  {
    v10 = 18;
  }

  return v10;
}

- (id)identifierForConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifierForConnectionWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)identifierForEndpointWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifierForEndpointWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)propertiesForConnectionWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertiesForConnectionWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)propertiesForEndpointWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertiesForEndpointWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setHandler:(id)a3 forConnectionProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id aBlock;

  aBlock = a3;
  v6 = a4;
  if (v6)
  {
    -[ACCTransportPlugin connectionPropertyChangeHandlers](self, "connectionPropertyChangeHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (aBlock)
    {
      v8 = _Block_copy(aBlock);
      objc_msgSend(v7, "setObject:forKey:", v8, v6);

    }
    else
    {
      objc_msgSend(v7, "removeObjectForKey:", v6);
    }

  }
}

- (void)setHandler:(id)a3 forEndpointProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id aBlock;

  aBlock = a3;
  v6 = a4;
  if (v6)
  {
    -[ACCTransportPlugin endpointPropertyChangeHandlers](self, "endpointPropertyChangeHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (aBlock)
    {
      v8 = _Block_copy(aBlock);
      objc_msgSend(v7, "setObject:forKey:", v8, v6);

    }
    else
    {
      objc_msgSend(v7, "removeObjectForKey:", v6);
    }

  }
}

- (BOOL)connectedThroughAdapter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v4 = a3;
  -[ACCTransportPlugin delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportPlugin delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "connectedThroughAdapter:", v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_5;
  -[ACCTransportPlugin delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  v9 = (void *)v8;
  -[ACCTransportPlugin delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[ACCTransportPlugin delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "processIncomingData:forEndpointWithUUID:", v6, v7);

  }
  else
  {
LABEL_5:
    v13 = 0;
  }

  return v13;
}

- (BOOL)routeOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ACCTransportPlugin conformsToProtocol:](self, "conformsToProtocol:", &unk_1EEE4BF10)
     && (objc_opt_respondsToSelector() & 1) != 0
     && -[ACCTransportPlugin sendOutgoingData:forEndpointWithUUID:connectionUUID:](self, "sendOutgoingData:forEndpointWithUUID:connectionUUID:", v8, v9, v10);

  return v11;
}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 2;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v13 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[ACCTransportPlugin sendOutgoingData:forEndpointWithUUID:connectionUUID:].cold.1((uint64_t)self, v13);

  return 0;
}

- (ACCTransportPluginManagerProtocol)delegate
{
  return (ACCTransportPluginManagerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)activeConnectionUUIDs
{
  return self->_activeConnectionUUIDs;
}

- (void)setActiveConnectionUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnectionUUIDs, a3);
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (NSMutableDictionary)connectionPropertyChangeHandlers
{
  return self->_connectionPropertyChangeHandlers;
}

- (void)setConnectionPropertyChangeHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_connectionPropertyChangeHandlers, a3);
}

- (NSMutableDictionary)endpointPropertyChangeHandlers
{
  return self->_endpointPropertyChangeHandlers;
}

- (void)setEndpointPropertyChangeHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_endpointPropertyChangeHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointPropertyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_connectionPropertyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_pluginName, 0);
  objc_storeStrong((id *)&self->_activeConnectionUUIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "pluginClassAndName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1AF649000, v2, v3, "Init %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)initWithDelegate:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AF649000, MEMORY[0x1E0C81028], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)authStatusDidChangeHandler:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "pluginClassAndName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1AF649000, v2, v3, "Notification received for %@:\n%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)sendOutgoingData:(uint64_t)a1 forEndpointWithUUID:(NSObject *)a2 connectionUUID:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1AF649000, a2, OS_LOG_TYPE_ERROR, "Class '%@' is missing implementation for the sendOutgoingData:forConnectionWithUUID: method!", v5, 0xCu);

  OUTLINED_FUNCTION_4();
}

@end
