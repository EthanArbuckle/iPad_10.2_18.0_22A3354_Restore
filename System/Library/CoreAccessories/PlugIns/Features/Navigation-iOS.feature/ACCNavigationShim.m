@implementation ACCNavigationShim

- (ACCNavigationShim)initWithDelegate:(id)a3
{
  id v4;
  ACCNavigationShim *v5;
  void *v6;
  uint64_t v7;
  NSString *uid;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCNavigationShim;
  v5 = -[ACCNavigationShim init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    uid = v5->_uid;
    v5->_uid = (NSString *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  NSString *uid;
  objc_super v4;

  uid = self->_uid;
  self->_uid = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)ACCNavigationShim;
  -[ACCNavigationShim dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v2;
  NSString *uid;
  id WeakRetained;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  uid = self->_uid;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<ACCNavigationShim>[_uid=%@ _delegate=%@]"), uid, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)accessoryAttached:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_215D92000, v7, OS_LOG_TYPE_INFO, "[#Navigation] accessoryAttached: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "notifyNavigationAccessoryClientsOfStateChange");

}

- (void)accessoryDetached:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_215D92000, v7, OS_LOG_TYPE_INFO, "[#Navigation] accessoryDetached: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "notifyNavigationAccessoryClientsOfStateChange");

}

- (void)accessoryStartRouteGuidance:(id)a3 componentList:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_215D92000, v10, OS_LOG_TYPE_INFO, "[#Navigation] accessoryStartRouteGuidance: %@ componentList: %@", (uint8_t *)&v12, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "notifyNavigationAccessoryClientsOfStateChange");

}

- (void)accessoryStopRouteGuidance:(id)a3 componentList:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_215D92000, v10, OS_LOG_TYPE_INFO, "[#Navigation] accessoryStopRouteGuidance: %@ componentList: %@", (uint8_t *)&v12, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "notifyNavigationAccessoryClientsOfStateChange");

}

- (void)accessoryNavigation:(id)a3 updateRouteGuidanceInfo:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_215D92000, v10, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigation: %@ updateRouteGuidanceInfo: %@", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v13, "addObject:", v12);
  }
  else
  {
    v13 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[ACCNavigationShim convertIAP2ACCRouteGuidanceInfo:forAccessory:](self, "convertIAP2ACCRouteGuidanceInfo:forAccessory:", v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateRouteGuidanceInfo:componentIdList:accessory:", v15, v13, v6);

}

- (void)accessoryNavigation:(id)a3 updateManeuverInfo:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_215D92000, v10, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigation: %@ updateManeuverInfo: %@", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v13, "addObject:", v12);
  }
  else
  {
    v13 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[ACCNavigationShim convertIAP2ACCManeuverInfo:forAccessory:](self, "convertIAP2ACCManeuverInfo:forAccessory:", v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateManeuverInfo:componentIdList:accessory:", v15, v13, v6);

}

- (id)convertIAP2ACCRouteGuidanceInfo:(id)a3 forAccessory:(id)a4
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned __int16 v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE00BD8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "integerValue");
        objc_msgSend(v4, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setInfo:data:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)convertIAP2ACCManeuverInfo:(id)a3 forAccessory:(id)a4
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned __int16 v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE00BC8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "integerValue");
        objc_msgSend(v4, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setInfo:data:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)getUID
{
  return self->_uid;
}

- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5
{
  id v7;
  _xpc_connection_s *v8;
  const char *string;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  char v18;
  xpc_object_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  xpc_object_t v28;
  void *v29;
  uint64_t v30;
  const void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *reply;
  uint64_t uint64;
  const void *data;
  id WeakRetained;
  NSObject *v42;
  const char *v43;
  BOOL v44;
  NSObject *v45;
  int v46;
  id v47;
  int v48;
  id v49;
  id v50;
  id *v51;
  NSObject *v52;
  id v53;
  size_t v55[2];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  _QWORD v61[4];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v7, MEMORY[0x24BE00DF8]);
  v10 = 0x253E64000uLL;
  v11 = 0x253E64000uLL;
  if (!string)
  {
    if (gLogObjects)
      v12 = gNumLogObjects < 1;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v14 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    else
    {
      v14 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v55[0]) = 0;
      _os_log_impl(&dword_215D92000, v14, OS_LOG_TYPE_DEFAULT, "[#Navigation] RequestType not specified in xpc message!", (uint8_t *)v55, 2u);
    }

    string = "<nil>";
  }
  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[ACCNavigationShim tryProcessXPCMessage:connection:server:].cold.9((uint64_t)string, v17);

  if (strcmp(string, "nav_requestConnectedAccessories"))
  {
    if (strcmp(string, "nav_sendGuidanceUpdate"))
    {
      if (strcmp(string, "nav_sendManeuverUpdate"))
      {
        v18 = 0;
        goto LABEL_73;
      }
      uint64 = xpc_dictionary_get_uint64(v7, "nav_accessoryIdentifier");
      v55[0] = 0xAAAAAAAAAAAAAAAALL;
      data = xpc_dictionary_get_data(v7, "nav_payload", v55);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", data, v55[0]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = NSClassFromString(CFSTR("NSDictionary"));
      v60[1] = NSClassFromString(CFSTR("NSArray"));
      v60[2] = NSClassFromString(CFSTR("NSString"));
      v60[3] = NSClassFromString(CFSTR("NSNumber"));
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v33);
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v34, v32, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "navigationShimAccessoryForConnectionID:", uint64);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        -[ACCNavigationShim accessoryNavigation:updateManeuverInfo:](self, "accessoryNavigation:updateManeuverInfo:", v37, v35);
        reply = xpc_dictionary_create_reply(v7);
        v11 = 0x253E64000uLL;
        if (reply)
          goto LABEL_41;
LABEL_59:
        v48 = *(_DWORD *)(v11 + 320);
        if (gLogObjects && v48 >= 1)
        {
          v42 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
          v42 = MEMORY[0x24BDACB70];
          v50 = MEMORY[0x24BDACB70];
        }
        v11 = 0x253E64000uLL;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[ACCNavigationShim tryProcessXPCMessage:connection:server:].cold.7();
        goto LABEL_72;
      }
      reply = xpc_dictionary_create_reply(v7);
      v11 = 0x253E64000;
      if (!reply)
        goto LABEL_59;
LABEL_57:
      v42 = reply;
      v43 = (const char *)MEMORY[0x24BE00E00];
      v44 = 0;
      goto LABEL_58;
    }
    v30 = xpc_dictionary_get_uint64(v7, "nav_accessoryIdentifier");
    v55[0] = 0xAAAAAAAAAAAAAAAALL;
    v31 = xpc_dictionary_get_data(v7, "nav_payload", v55);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v31, v55[0]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = NSClassFromString(CFSTR("NSDictionary"));
    v61[1] = NSClassFromString(CFSTR("NSArray"));
    v61[2] = NSClassFromString(CFSTR("NSString"));
    v61[3] = NSClassFromString(CFSTR("NSNumber"));
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v33);
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v34, v32, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v36, "navigationShimAccessoryForConnectionID:", v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[ACCNavigationShim accessoryNavigation:updateRouteGuidanceInfo:](self, "accessoryNavigation:updateRouteGuidanceInfo:", v37, v35);
      reply = xpc_dictionary_create_reply(v7);
      v11 = 0x253E64000;
      if (reply)
      {
LABEL_41:
        v42 = reply;
        v43 = (const char *)MEMORY[0x24BE00E00];
        v44 = 1;
LABEL_58:
        xpc_dictionary_set_BOOL(reply, v43, v44);
        xpc_connection_send_message(v8, v42);
LABEL_72:

        v18 = 1;
        v10 = 0x253E64000uLL;
        goto LABEL_73;
      }
    }
    else
    {
      reply = xpc_dictionary_create_reply(v7);
      v11 = 0x253E64000uLL;
      if (reply)
        goto LABEL_57;
    }
    v46 = *(_DWORD *)(v11 + 320);
    if (gLogObjects && v46 >= 1)
    {
      v42 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v42 = MEMORY[0x24BDACB70];
      v49 = MEMORY[0x24BDACB70];
    }
    v11 = 0x253E64000;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[ACCNavigationShim tryProcessXPCMessage:connection:server:].cold.5();
    goto LABEL_72;
  }
  v19 = xpc_array_create(0, 0);
  v20 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v20, "navigationShimAccessoryList");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v57 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "create_xpc_representation");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_array_append_value(v19, v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v24);
  }

  v28 = xpc_dictionary_create_reply(v7);
  v29 = v28;
  if (v28)
  {
    xpc_dictionary_set_BOOL(v28, MEMORY[0x24BE00E00], 1);
    xpc_dictionary_set_value(v29, "nav_accessoriesConnected", v19);
    xpc_connection_send_message(v8, v29);
    v10 = 0x253E64000;
  }
  else
  {
    v10 = 0x253E64000uLL;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v45 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v45 = MEMORY[0x24BDACB70];
      v47 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      -[ACCNavigationShim tryProcessXPCMessage:connection:server:].cold.3();

  }
  v18 = 1;
LABEL_73:
  v51 = *(id **)(v10 + 312);
  if (v51 && *(int *)(v11 + 320) >= 1)
  {
    v52 = *v51;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v52 = MEMORY[0x24BDACB70];
    v53 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    -[ACCNavigationShim tryProcessXPCMessage:connection:server:].cold.1((uint64_t)string, v18, v52);

  return v18;
}

- (ACCNavigationShimProtocol)delegate
{
  return (ACCNavigationShimProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)uid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(char)a2 server:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_215D92000, log, OS_LOG_TYPE_DEBUG, "[#Navigation] tryProcessXPCMessage: messagetype=%s processed=%d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)tryProcessXPCMessage:connection:server:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_215D92000, v0, v1, "[#Navigation] ERROR: Client sent kXPCIAPNavigationRequestConnectedAccessoriesStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:connection:server:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_215D92000, v0, v1, "[#Navigation] ERROR: Client sent kXPCIAPNavigationSendGuidanceUpdateStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:connection:server:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_215D92000, v0, v1, "[#Navigation] ERROR: Client sent kXPCIAPNavigationSendManeuverUpdateStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(NSObject *)a2 server:.cold.9(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_215D92000, a2, OS_LOG_TYPE_DEBUG, "[#Navigation] tryProcessXPCMessage: messagetype=%s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
