@implementation SPCarrierBundleAdapter

- (SPCarrierBundleAdapter)init
{
  SPCarrierBundleAdapter *v2;
  CTBundle *v3;
  CTBundle *carrierBundleType;
  CTBundle *v5;
  CTBundle *operatorBundleType;
  CoreTelephonyClient *v7;
  CoreTelephonyClient *client;
  NSMutableDictionary *v9;
  NSMutableDictionary *validSubscriptions;
  NSMutableDictionary *v11;
  NSMutableDictionary *slicingConfiguration;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SPCarrierBundleAdapter;
  v2 = -[SPCarrierBundleAdapter init](&v14, "init");
  if (v2)
  {
    +[SPLog bootstrap](SPLog, "bootstrap");
    v3 = (CTBundle *)objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
    carrierBundleType = v2->_carrierBundleType;
    v2->_carrierBundleType = v3;

    v5 = (CTBundle *)objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 2);
    operatorBundleType = v2->_operatorBundleType;
    v2->_operatorBundleType = v5;

    v7 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", -[SPCarrierBundleAdapter get_queue](v2, "get_queue"));
    client = v2->_client;
    v2->_client = v7;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
    v9 = objc_opt_new(NSMutableDictionary);
    validSubscriptions = v2->_validSubscriptions;
    v2->_validSubscriptions = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    slicingConfiguration = v2->_slicingConfiguration;
    v2->_slicingConfiguration = v11;

    -[SPCarrierBundleAdapter _loadSubscriptionInfo](v2, "_loadSubscriptionInfo");
  }
  return v2;
}

- (void)_loadSubscriptionInfo
{
  CoreTelephonyClient *client;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  _BYTE v16[128];

  client = self->_client;
  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSubscriptionInfoWithError:](client, "getSubscriptionInfoWithError:", &v15));
  v5 = v15;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionsValid", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SPCarrierBundleAdapter _loadSubscriptionInfoForContext:](self, "_loadSubscriptionInfoForContext:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (void)_loadSubscriptionInfoForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter validSubscriptions](self, "validSubscriptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter validSubscriptions](self, "validSubscriptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

  if (v10)
  {
    v11 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = objc_msgSend(v4, "slotID");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating context previously found associated to slotID=%ld", (uint8_t *)&v14, 0xCu);
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter validSubscriptions](self, "validSubscriptions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID")));
  objc_msgSend(v12, "setObject:forKey:", v4, v13);

  -[SPCarrierBundleAdapter _loadSlicingConfigForContext:](self, "_loadSlicingConfigForContext:", v4);
}

- (void)_loadSlicingConfigForContext:(id)a3
{
  __CFString *v4;
  CoreTelephonyClient *client;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v4 = (__CFString *)a3;
  client = self->_client;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter carrierBundleType](self, "carrierBundleType"));
  v19 = 0;
  v7 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](client, "copyCarrierBundleValue:key:bundleType:error:", v4, CFSTR("NRSlicing"), v6, &v19);
  v8 = v19;

  if (v8)
  {
    v10 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
      sub_1001E412C((uint64_t)v4, (uint64_t)v8, v10);
  }
  else if (v7)
  {
    v11 = objc_opt_class(NSDictionary, v9);
    if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter slicingConfiguration](self, "slicingConfiguration"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[__CFString slotID](v4, "slotID")));
      objc_msgSend(v12, "setObject:forKey:", v7, v13);

    }
    else
    {
      v15 = qword_1002BEFA0;
      if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend((id)objc_opt_class(v7, v16), "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        *(_DWORD *)buf = 138412802;
        v21 = CFSTR("NRSlicing");
        v22 = 2112;
        v23 = v18;
        v24 = 2112;
        v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "key %@ expected NSDictionary type but found %@ <%@>", buf, 0x20u);

      }
    }
  }
  else
  {
    v14 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "no NRSlicing definitions in ctxt=%@", buf, 0xCu);
    }
  }

}

- (BOOL)isDualSimON
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter client](self, "client"));
  v8 = 0;
  v4 = objc_msgSend(v3, "getDualSimCapability:", &v8);

  if (v4 != (id)2)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter validSubscriptions](self, "validSubscriptions"));
  v6 = (unint64_t)objc_msgSend(v5, "count") > 1;

  return v6;
}

- (id)getCarrierBundleVersion
{
  id v3;
  CoreTelephonyClient *client;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  client = self->_client;
  v24 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSubscriptionInfoWithError:](client, "getSubscriptionInfoWithError:", &v24));
  v6 = v24;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v18 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscriptionsValid"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      v12 = v6;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter client](self, "client"));
        v19 = v12;
        v15 = objc_msgSend(v14, "copyCarrierBundleVersion:error:", v13, &v19);
        v6 = v19;

        objc_msgSend(v3, "addObject:", v15);
        v11 = (char *)v11 + 1;
        v12 = v6;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

  if (v6)
  {
    NSLog(CFSTR("Unable to determine current subscription context"));
    v16 = 0;
  }
  else
  {
    v16 = v3;
  }

  return v16;
}

- (id)getCarrierBundleIdentifier
{
  id v3;
  CoreTelephonyClient *client;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  client = self->_client;
  v25 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSubscriptionInfoWithError:](client, "getSubscriptionInfoWithError:", &v25));
  v6 = v25;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscriptionsValid"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      v11 = v6;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter client](self, "client"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter carrierBundleType](self, "carrierBundleType"));
        v20 = v11;
        v15 = objc_msgSend(v13, "copyBundleIdentifier:bundleType:error:", v12, v14, &v20);
        v6 = v20;

        objc_msgSend(v3, "addObject:", v15);
        v10 = (char *)v10 + 1;
        v11 = v6;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  if (v6)
  {
    NSLog(CFSTR("Unable to determine current subscription context"));
    v16 = 0;
  }
  else
  {
    v16 = v3;
  }

  return v16;
}

- (id)getPhoneNumber
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter client](self, "client"));
  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getCurrentDataSubscriptionContextSync:", &v15));
  v4 = v15;

  if (v4)
  {
    v5 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
      sub_1001E41C0(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumber"));
  }

  return v13;
}

- (id)getNRSlicingCBConfigCurrentDataContext
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter client](self, "client"));
  v21 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getCurrentDataSubscriptionContextSync:", &v21));
  v5 = v21;

  if (v5)
  {
    v6 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
      sub_1001E41C0(v6, v7, v8, v9, v10, v11, v12, v13);
    v14 = 0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter slicingConfiguration](self, "slicingConfiguration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID")));
    if (objc_msgSend(v16, "containsObject:", v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter slicingConfiguration](self, "slicingConfiguration"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v19));

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (BOOL)isSlicingSetup
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter getNRSlicingCBConfigCurrentDataContext](self, "getNRSlicingCBConfigCurrentDataContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSlicingTestApplicationEnabled
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  const __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  _BYTE v44[128];

  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter slicingConfiguration](self, "slicingConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v35;
    *(_QWORD *)&v6 = 138412290;
    v33 = v6;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v4);
        v10 = *(const __CFString **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter slicingConfiguration](self, "slicingConfiguration", v33));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("__SlicingTestModule__")));
        if (v13)
        {
          v18 = (void *)v13;
          v19 = objc_opt_class(NSDictionary, v14);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("Enabled")));
            v21 = qword_1002BEFA0;
            if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
            {
              v22 = objc_msgSend(v20, "BOOLValue");
              v23 = CFSTR("Disabled");
              *(_DWORD *)buf = 134218498;
              v39 = v10;
              if (v22)
                v23 = CFSTR("Enabled");
              v40 = 2112;
              v41 = CFSTR("Enabled");
              v42 = 2112;
              v43 = v23;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Slicing Test Application for slot=%ld %@=%@", buf, 0x20u);
            }
            v17 = objc_msgSend(v20, "BOOLValue");

          }
          else
          {
            v24 = qword_1002BEFA0;
            if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
              sub_1001E41F0(v24, v25, v26, v27, v28, v29, v30, v31);
            v17 = 0;
          }

          return v17;
        }
        v15 = qword_1002BEFA0;
        if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v33;
          v39 = CFSTR("__SlicingTestModule__");
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Missing key %@. Defaulting to disabled", buf, 0xCu);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v7)
        continue;
      break;
    }
  }

  v16 = qword_1002BEFA0;
  v17 = 0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Slicing Test Application enabled=NO", buf, 2u);
    return 0;
  }
  return v17;
}

- (BOOL)isLLPHSApplicationEnabled
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  const __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  _BYTE v44[128];

  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter slicingConfiguration](self, "slicingConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v35;
    *(_QWORD *)&v6 = 138412290;
    v33 = v6;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v4);
        v10 = *(const __CFString **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter slicingConfiguration](self, "slicingConfiguration", v33));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("__SlicingTestModule__")));
        if (v13)
        {
          v18 = (void *)v13;
          v19 = objc_opt_class(NSDictionary, v14);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("SupportsLLPHS")));
            v21 = qword_1002BEFA0;
            if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
            {
              v22 = objc_msgSend(v20, "BOOLValue");
              v23 = CFSTR("Disabled");
              *(_DWORD *)buf = 134218498;
              v39 = v10;
              v40 = 2112;
              if (v22)
                v23 = CFSTR("Enabled");
              v41 = CFSTR("SupportsLLPHS");
              v42 = 2112;
              v43 = v23;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "LLPHS for slot=%ld %@=%@", buf, 0x20u);
            }
            v17 = objc_msgSend(v20, "BOOLValue");

          }
          else
          {
            v24 = qword_1002BEFA0;
            if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
              sub_1001E4264(v24, v25, v26, v27, v28, v29, v30, v31);
            v17 = 0;
          }

          return v17;
        }
        v15 = qword_1002BEFA0;
        if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v33;
          v39 = CFSTR("SupportsLLPHS");
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Missing key %@. Defaulting to disabled", buf, 0xCu);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v7)
        continue;
      break;
    }
  }

  v16 = qword_1002BEFA0;
  v17 = 0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "LLPHS not enabled", buf, 2u);
    return 0;
  }
  return v17;
}

- (int64_t)getInteger:(id)a3 defaultValue:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter _getCarrierBundleKeyForDataContext:](self, "_getCarrierBundleKeyForDataContext:", a3));
  if (v6)
  {
    v7 = objc_opt_class(NSNumber, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      a4 = (int64_t)objc_msgSend(v6, "integerValue");
  }

  return a4;
}

- (id)getString:(id)a3 defaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter _getCarrierBundleKeyForDataContext:](self, "_getCarrierBundleKeyForDataContext:", a3));
  if (!v8
    || (v9 = objc_opt_class(NSString, v7),
        isKindOfClass = objc_opt_isKindOfClass(v8, v9),
        v11 = v8,
        (isKindOfClass & 1) == 0))
  {
    v11 = v6;
  }
  v12 = v11;

  return v12;
}

- (id)getData:(id)a3 defaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter _getCarrierBundleKeyForDataContext:](self, "_getCarrierBundleKeyForDataContext:", a3));
  if (!v8
    || (v9 = objc_opt_class(NSData, v7),
        isKindOfClass = objc_opt_isKindOfClass(v8, v9),
        v11 = v8,
        (isKindOfClass & 1) == 0))
  {
    v11 = v6;
  }
  v12 = v11;

  return v12;
}

- (id)getArray:(id)a3 defaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter _getCarrierBundleKeyForDataContext:](self, "_getCarrierBundleKeyForDataContext:", a3));
  if (!v8
    || (v9 = objc_opt_class(NSArray, v7),
        isKindOfClass = objc_opt_isKindOfClass(v8, v9),
        v11 = v8,
        (isKindOfClass & 1) == 0))
  {
    v11 = v6;
  }
  v12 = v11;

  return v12;
}

- (BOOL)getBoolean:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter _getCarrierBundleKeyForDataContext:](self, "_getCarrierBundleKeyForDataContext:", a3));
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)getDict:(id)a3 defaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter _getCarrierBundleKeyForDataContext:](self, "_getCarrierBundleKeyForDataContext:", a3));
  if (!v8
    || (v9 = objc_opt_class(NSDictionary, v7),
        isKindOfClass = objc_opt_isKindOfClass(v8, v9),
        v11 = v8,
        (isKindOfClass & 1) == 0))
  {
    v11 = v6;
  }
  v12 = v11;

  return v12;
}

- (id)_getCarrierBundleKeyForDataContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter client](self, "client"));
  v18 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getCurrentDataSubscriptionContextSync:", &v18));
  v7 = v18;

  if (v7)
  {
    v8 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
      sub_1001E42D8(v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter _getCarrierBundleKeyValue:forContext:](self, "_getCarrierBundleKeyValue:forContext:", v4, v6));
  }

  return v16;
}

- (id)_getCarrierBundleKeyValue:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter client](self, "client"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter carrierBundleType](self, "carrierBundleType"));
  v15 = 0;
  v10 = objc_msgSend(v8, "copyCarrierBundleValue:key:bundleType:error:", v7, v6, v9, &v15);
  v11 = v15;

  if (v11)
  {
    v12 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to read key %@ from context=%@ with error=%@", buf, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

- (void)_handleSubscriptionAndBundleChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id buf[2];

  v4 = a3;
  if (v4)
    -[SPCarrierBundleAdapter _loadSubscriptionInfoForContext:](self, "_loadSubscriptionInfoForContext:", v4);
  else
    -[SPCarrierBundleAdapter _loadSubscriptionInfo](self, "_loadSubscriptionInfo");
  v5 = objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter delegate](self, "delegate"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SPCarrierBundleAdapter delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "carrierBundleDidUpdate");

    if ((v8 & 1) != 0)
    {
      v9 = qword_1002BEFA0;
      if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notifying carrier bundle update to delegate", (uint8_t *)buf, 2u);
      }
      objc_initWeak(buf, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000201F4;
      block[3] = &unk_10025E8F8;
      objc_copyWeak(&v11, buf);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }

}

- (dispatch_queue_s)get_queue
{
  if (qword_1002B8220 != -1)
    dispatch_once(&qword_1002B8220, &stru_10025E938);
  return (dispatch_queue_s *)qword_1002B8228;
}

- (void)subscriptionInfoDidChange
{
  -[SPCarrierBundleAdapter _handleSubscriptionAndBundleChange:](self, "_handleSubscriptionAndBundleChange:", 0);
}

- (void)defaultBundleChange
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_1002BEFA0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "default bundle changed. reloading configuration", v4, 2u);
  }
  -[SPCarrierBundleAdapter _handleSubscriptionAndBundleChange:](self, "_handleSubscriptionAndBundleChange:", 0);
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = qword_1002BEFA0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "carrier bundle changed for ctxt=%@. reloading configuration", (uint8_t *)&v6, 0xCu);
  }
  -[SPCarrierBundleAdapter _handleSubscriptionAndBundleChange:](self, "_handleSubscriptionAndBundleChange:", v4);

}

- (void)operatorBundleChange:(id)a3
{
  NSObject *v4;
  int v5;
  id v6;

  v4 = qword_1002BEFA0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "operator bundle changed for ctxt=%@. Ignoring update", (uint8_t *)&v5, 0xCu);
  }
}

- (SPCarrierBundleAdapterDelegate)delegate
{
  return (SPCarrierBundleAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSMutableDictionary)validSubscriptions
{
  return self->_validSubscriptions;
}

- (void)setValidSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_validSubscriptions, a3);
}

- (NSMutableDictionary)slicingConfiguration
{
  return self->_slicingConfiguration;
}

- (void)setSlicingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_slicingConfiguration, a3);
}

- (CTBundle)carrierBundleType
{
  return self->_carrierBundleType;
}

- (void)setCarrierBundleType:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleType, a3);
}

- (CTBundle)operatorBundleType
{
  return self->_operatorBundleType;
}

- (void)setOperatorBundleType:(id)a3
{
  objc_storeStrong((id *)&self->_operatorBundleType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatorBundleType, 0);
  objc_storeStrong((id *)&self->_carrierBundleType, 0);
  objc_storeStrong((id *)&self->_slicingConfiguration, 0);
  objc_storeStrong((id *)&self->_validSubscriptions, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
