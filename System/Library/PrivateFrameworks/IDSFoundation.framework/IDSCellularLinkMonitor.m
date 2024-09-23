@implementation IDSCellularLinkMonitor

+ (id)sharedInstance
{
  if (qword_1ECDD47B0 != -1)
    dispatch_once(&qword_1ECDD47B0, &unk_1E3C1B6B0);
  return (id)qword_1ECDD4800;
}

- (IDSCellularLinkMonitor)init
{
  IDSCellularLinkMonitor *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint8_t v19[16];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)IDSCellularLinkMonitor;
  v2 = -[IDSCellularLinkMonitor init](&v20, sel_init);
  if (v2)
  {
    OSLogHandleForTransportCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "IDSCellularLinkMonitor init", v19, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("IDSCellularLinkMonitor init"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("IDSCellularLinkMonitor init"));
      }
    }
    objc_msgSend__setupCTServerConnection(v2, v4, v5, v6);
    objc_msgSend__updateCellularDataInterface_(v2, v7, 0, v8);
    objc_msgSend__updateRadioAccessTechnology(v2, v9, v10, v11);
    objc_msgSend__updateCellularMTU(v2, v12, v13, v14);
    objc_msgSend__updateDataStatus(v2, v15, v16, v17);
  }
  return v2;
}

- (void)dealloc
{
  double v2;
  __CTServerConnection *ctServerConnection;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    CFRelease(ctServerConnection);
    self->_ctServerConnection = 0;
  }
  objc_msgSend_setDelegate_(self->_ctClient, a2, 0, v2);
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "IDSCellularLinkMonitor dealloc", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("IDSCellularLinkMonitor dealloc"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("IDSCellularLinkMonitor dealloc"));
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)IDSCellularLinkMonitor;
  -[IDSCellularLinkMonitor dealloc](&v6, sel_dealloc);
}

- (void)addCellularLinkDelegate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_19B9AA80C;
    v6[3] = &unk_1E3C1FA08;
    v6[4] = self;
    v7 = v4;
    IDSTransportThreadAddBlock(v6);

  }
}

- (void)removeCellularLinkDelegate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  IDSCellularLinkMonitor *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_19B9AAA04;
    v6[3] = &unk_1E3C1FA08;
    v7 = v4;
    v8 = self;
    IDSTransportThreadAddBlock(v6);

  }
}

- (void)_setupCTServerConnection
{
  void *v3;
  NSObject *v4;
  __CTServerConnection *ctServerConnection;
  id v6;
  void *v7;
  const char *v8;
  double v9;
  CoreTelephonyClient *v10;
  CoreTelephonyClient *ctClient;
  uint8_t buf[4];
  __CTServerConnection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_ctServerConnection)
  {
    im_primary_queue();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    OSLogHandleForTransportCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      ctServerConnection = self->_ctServerConnection;
      *(_DWORD *)buf = 138412290;
      v13 = ctServerConnection;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "created CT server connection %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("created CT server connection %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("created CT server connection %@."));
    }
    v6 = objc_alloc(MEMORY[0x1E0CA6E38]);
    im_primary_queue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CoreTelephonyClient *)objc_msgSend_initWithQueue_(v6, v8, (uint64_t)v7, v9);
    ctClient = self->_ctClient;
    self->_ctClient = v10;

  }
}

- (id)_getCurrentDataSimContext:(id)a3 inContextArray:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  const char *v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  _BOOL4 v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  OSLogHandleForTransportCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v5;
    _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "currentDataSimContext: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v25 = v5;
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("currentDataSimContext: %@"));
      if (_IDSShouldLog())
      {
        v25 = v5;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("currentDataSimContext: %@"));
      }
    }
  }
  if (!v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v6;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, v11, v30, 16);
    if (v14)
    {
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v9);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend_userDataPreferred(v18, v12, v13, v15, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend_intValue(v19, v20, v21, v22) == 0;

          if (!v23)
          {
            v8 = v18;

            goto LABEL_19;
          }
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, v15, v30, 16);
        if (v14)
          continue;
        break;
      }
    }

  }
  v8 = v5;
LABEL_19:

  return v8;
}

- (id)_getCTXPCServiceSubscriptionContext
{
  double v2;
  CoreTelephonyClient *ctClient;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  double v13;
  CoreTelephonyClient *v14;
  void *v15;
  id v16;
  const char *v17;
  double v18;
  void *v19;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  ctClient = self->_ctClient;
  v23 = 0;
  objc_msgSend_getSubscriptionInfoWithError_(ctClient, a2, (uint64_t)&v23, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v23;
  objc_msgSend_subscriptions(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  OSLogHandleForTransportCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "getCTXPCServiceSubscriptionContext: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v21 = v10;
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("getCTXPCServiceSubscriptionContext: %@"));
      if (_IDSShouldLog())
      {
        v21 = v10;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("getCTXPCServiceSubscriptionContext: %@"));
      }
    }
  }
  v14 = self->_ctClient;
  v22 = v6;
  objc_msgSend_getCurrentDataSubscriptionContextSync_(v14, v12, (uint64_t)&v22, v13, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;

  objc_msgSend__getCurrentDataSimContext_inContextArray_(self, v17, (uint64_t)v15, v18, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)_updateCellularDataInterfaceNameByConnectionState:(int)a3 isStateActiveRequired:(BOOL)a4 interfaceName:(id)a5
{
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  double v13;
  id *p_cellularDataInterfaceName;
  NSString *cellularDataInterfaceName;
  BOOL v16;
  NSObject *v17;
  id v18;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (!a3 && v6)
  {
    OSLogHandleForTransportCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "_updateCellularDataInterfaceNameByConnectionState: connectionStatus state is inactive, return", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateCellularDataInterfaceNameByConnectionState: connectionStatus state is inactive, return"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateCellularDataInterfaceNameByConnectionState: connectionStatus state is inactive, return"));
      }
    }
LABEL_16:
    v16 = 0;
    goto LABEL_24;
  }
  OSLogHandleForTransportCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "newCelularDataInterfaceName: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v20 = v9;
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("newCelularDataInterfaceName: %@"));
      if (_IDSShouldLog())
      {
        v20 = v9;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("newCelularDataInterfaceName: %@"));
      }
    }
  }
  cellularDataInterfaceName = self->_cellularDataInterfaceName;
  p_cellularDataInterfaceName = (id *)&self->_cellularDataInterfaceName;
  if ((objc_msgSend_isEqualToIgnoringCase_(cellularDataInterfaceName, v12, (uint64_t)v9, v13, v20) & 1) != 0)
    goto LABEL_16;
  OSLogHandleForTransportCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *p_cellularDataInterfaceName;
    *(_DWORD *)buf = 138412546;
    v22 = v18;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "update cellular data interface name [%@->%@].", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update cellular data interface name [%@->%@]."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update cellular data interface name [%@->%@]."));
    }
  }
  objc_storeStrong(p_cellularDataInterfaceName, a5);
  v16 = 1;
LABEL_24:

  return v16;
}

- (BOOL)_updateCellularDataInterface:(BOOL)a3
{
  double v3;
  _BOOL8 v4;
  const char *v6;
  void *v7;
  double v8;
  CoreTelephonyClient *ctClient;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  char isStateActiveRequired_interfaceName;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    v4 = a3;
    objc_msgSend__getCTXPCServiceSubscriptionContext(self, a2, a3, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      ctClient = self->_ctClient;
      v28 = 0;
      objc_msgSend_getConnectionState_connectionType_error_(ctClient, v6, (uint64_t)v7, v8, 0, &v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v28;
      OSLogHandleForTransportCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v10;
        _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "_updateCellularDataInterface: connectionStatus: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateCellularDataInterface: connectionStatus: %@"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateCellularDataInterface: connectionStatus: %@"));
        }
      }
      if (v10)
      {
        v16 = objc_msgSend_state(v10, v13, v14, v15);
        objc_msgSend_interfaceName(v10, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isStateActiveRequired_interfaceName = objc_msgSend__updateCellularDataInterfaceNameByConnectionState_isStateActiveRequired_interfaceName_(self, v21, v16, v22, v4, v20);

      }
      else
      {
        OSLogHandleForTransportCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v11;
          v31 = 2112;
          v32 = v7;
          _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "getConnectionState failed: %@ %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("getConnectionState failed: %@ %@"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("getConnectionState failed: %@ %@"));
          }
        }
        isStateActiveRequired_interfaceName = 0;
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v25, OS_LOG_TYPE_DEFAULT, "_updateCellularDataInterface: failed to get context", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateCellularDataInterface: failed to get context"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateCellularDataInterface: failed to get context"));
        }
      }
      v11 = 0;
      isStateActiveRequired_interfaceName = 0;
    }

  }
  else
  {
    OSLogHandleForTransportCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "failed to get cellular data interface name due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get cellular data interface name due to invalid CT server connection."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get cellular data interface name due to invalid CT server connection."));
      }
    }
    return 0;
  }
  return isStateActiveRequired_interfaceName;
}

- (id)_getDataStatus
{
  uint64_t v2;
  double v3;
  const char *v5;
  void *v6;
  double v7;
  CoreTelephonyClient *ctClient;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    objc_msgSend__getCTXPCServiceSubscriptionContext(self, a2, v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      ctClient = self->_ctClient;
      v16 = 0;
      objc_msgSend_getDataStatus_error_(ctClient, v5, (uint64_t)v6, v7, &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        OSLogHandleForTransportCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v10;
          v19 = 2112;
          v20 = v6;
          _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "getDataStatus failed: %@ %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("getDataStatus failed: %@ %@"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("getDataStatus failed: %@ %@"));
        }
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "_getDataStatus: failed to get context", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_getDataStatus: failed to get context"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_getDataStatus: failed to get context"));
        }
      }
      v9 = 0;
    }

    return v9;
  }
  else
  {
    OSLogHandleForTransportCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "failed to get data status due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get data status due to invalid CT server connection."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get data status due to invalid CT server connection."));
      }
    }
    return 0;
  }
}

- (BOOL)_updateRadioAccessTechnology
{
  uint64_t v2;
  double v3;
  const char *v5;
  void *v6;
  double v7;
  char updated;
  NSObject *v9;
  uint8_t v11[16];

  objc_msgSend__getDataStatus(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "_updateRadioAccessTechnology failed to get data status", v11, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateRadioAccessTechnology failed to get data status"));
      updated = 0;
      if (!_IDSShouldLog())
        goto LABEL_10;
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateRadioAccessTechnology failed to get data status"));
    }
    updated = 0;
    goto LABEL_10;
  }
  updated = objc_msgSend__updateRadioAccessTechnologyWithCTDataStatus_(self, v5, (uint64_t)v6, v7);
LABEL_10:

  return updated;
}

- (BOOL)_updateRadioAccessTechnologyWithCTDataStatus:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  int v8;
  const char *v9;
  uint64_t v10;
  double v11;
  int v12;
  NSObject *v13;
  unsigned int remoteDeviceVersion;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  unsigned int radioAccessTechnology;
  NSObject *v19;
  const char *v20;
  const char *v21;
  uint8_t buf[4];
  _BYTE v24[10];
  _BYTE v25[10];
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_indicator(v4, v5, v6, v7);
  v12 = objc_msgSend_radioTechnology(v4, v9, v10, v11);
  OSLogHandleForTransportCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    remoteDeviceVersion = self->_remoteDeviceVersion;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v24 = v12;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = v8;
    *(_WORD *)v25 = 2112;
    *(_QWORD *)&v25[2] = v4;
    v26 = 1024;
    v27 = remoteDeviceVersion;
    _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "_updateRadioAccessTechnology: radioAccessTech: %d, data indicator: %d, data status: %@, _remoteDeviceVersion: %u", buf, 0x1Eu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateRadioAccessTechnology: radioAccessTech: %d, data indicator: %d, data status: %@, _remoteDeviceVersion: %u"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateRadioAccessTechnology: radioAccessTech: %d, data indicator: %d, data status: %@, _remoteDeviceVersion: %u"));
    }
  }
  v15 = 2;
  switch(v12)
  {
    case 0:
      break;
    case 2:
      if ((v8 - 3) >= 3)
        v15 = 1;
      else
        v15 = 6;
      break;
    case 3:
      v15 = 4;
      break;
    case 4:
    case 5:
      v15 = 3;
      break;
    case 7:
    case 8:
      goto LABEL_18;
    case 9:
      v15 = 7;
      break;
    case 10:
      if (self->_remoteDeviceVersion == 1)
      {
        OSLogHandleForTransportCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "remote is preAzul that doesn't support NR, change NR to LTE", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("remote is preAzul that doesn't support NR, change NR to LTE"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("remote is preAzul that doesn't support NR, change NR to LTE"));
          }
        }
LABEL_18:
        v15 = 5;
      }
      else
      {
        v15 = 8;
      }
      break;
    default:
      OSLogHandleForTransportCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v24 = v12;
        _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "receive unknown RAT: %d.", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive unknown RAT: %d."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive unknown RAT: %d."));
        }
      }
      v15 = 10;
      break;
  }
  radioAccessTechnology = self->_radioAccessTechnology;
  if (radioAccessTechnology != v15)
  {
    OSLogHandleForTransportCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
      v21 = IDSRadioAccessTechnologyToString(v15);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v24 = v20;
      *(_WORD *)&v24[8] = 2080;
      *(_QWORD *)v25 = v21;
      _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "update cellular RAT [%s->%s].", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
        IDSRadioAccessTechnologyToString(v15);
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update cellular RAT [%s->%s]."));
        if (_IDSShouldLog())
        {
          IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
          IDSRadioAccessTechnologyToString(v15);
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update cellular RAT [%s->%s]."));
        }
      }
    }
    self->_radioAccessTechnology = v15;
  }

  return radioAccessTechnology != v15;
}

- (BOOL)_updateDataBearerSoMask
{
  uint64_t v2;
  double v3;
  const char *v5;
  void *v6;
  double v7;
  char updated;
  NSObject *v9;
  uint8_t v11[16];

  objc_msgSend__getDataStatus(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "_updateDataBearerSoMask failed  to get data status", v11, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateDataBearerSoMask failed  to get data status"));
      updated = 0;
      if (!_IDSShouldLog())
        goto LABEL_10;
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateDataBearerSoMask failed  to get data status"));
    }
    updated = 0;
    goto LABEL_10;
  }
  updated = objc_msgSend__updateDataBearerSoMaskWithCTDataStatus_(self, v5, (uint64_t)v6, v7);
LABEL_10:

  return updated;
}

- (BOOL)_updateDataBearerSoMaskWithCTDataStatus:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;
  double v12;
  int v13;
  const char *v14;
  uint64_t v15;
  double v16;
  unsigned int v17;
  NSObject *v18;
  unsigned int dataSoMaskBits;
  BOOL v20;
  NSObject *v21;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = v4;
  if (!v4)
  {
    OSLogHandleForTransportCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "_updateDataBearerSoMask: No CTDataStatus", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateDataBearerSoMask: No CTDataStatus"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateDataBearerSoMask: No CTDataStatus"));
      }
    }
    goto LABEL_16;
  }
  v9 = objc_msgSend_indicator(v4, v5, v6, v7);
  v13 = objc_msgSend_radioTechnology(v8, v10, v11, v12);
  v17 = objc_msgSend_dataBearerSoMask(v8, v14, v15, v16);
  OSLogHandleForTransportCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    dataSoMaskBits = self->_dataSoMaskBits;
    *(_DWORD *)buf = 67110146;
    v24 = v13;
    v25 = 1024;
    v26 = v9;
    v27 = 1024;
    v28 = v17;
    v29 = 1024;
    v30 = dataSoMaskBits;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "_updateDataBearerSoMask: radioAccessTech: %d, data indicator: %d, soMask: %u, _dataSoMaskBits: %u, data status: %@", buf, 0x24u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateDataBearerSoMask: radioAccessTech: %d, data indicator: %d, soMask: %u, _dataSoMaskBits: %u, data status: %@"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateDataBearerSoMask: radioAccessTech: %d, data indicator: %d, soMask: %u, _dataSoMaskBits: %u, data status: %@"));
    }
  }
  if (v17 == self->_dataSoMaskBits)
  {
LABEL_16:
    v20 = 0;
    goto LABEL_17;
  }
  self->_dataSoMaskBits = v17;
  v20 = 1;
LABEL_17:

  return v20;
}

- (BOOL)_updateCellularMTU
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    v2 = _CTServerConnectionCopyCurrentMTU();
    v3 = v2;
    if (!(_DWORD)v2)
    {
LABEL_15:
      LOBYTE(v6) = 0;
      return v6;
    }
    v4 = HIDWORD(v2);
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v10 = v3;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "failed to get cellular MTU (error:%d.%d)", buf, 0xEu);
    }

    v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get cellular MTU (error:%d.%d)"));
        v6 = _IDSShouldLog();
        if (v6)
        {
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get cellular MTU (error:%d.%d)"));
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "failed to get cellular MTU due to invalid CT server connection.", buf, 2u);
    }

    v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get cellular MTU due to invalid CT server connection."));
        v6 = _IDSShouldLog();
        if (v6)
        {
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get cellular MTU due to invalid CT server connection."));
          goto LABEL_15;
        }
      }
    }
  }
  return v6;
}

- (BOOL)_dataContextUsable:(id)a3 dataStatus:(id)a4
{
  BOOL result;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  char v11;
  const char *v12;
  uint64_t v13;
  double v14;
  int v15;
  const char *v16;
  uint64_t v17;
  double v18;
  BOOL v19;

  result = 0;
  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    v11 = objc_msgSend_cellularDataPossible(v6, v8, v9, v10);
    v15 = objc_msgSend_state(v7, v12, v13, v14);

    LODWORD(v7) = objc_msgSend_indicator(v6, v16, v17, v18);
    if ((_DWORD)v7)
      v19 = v15 == 2;
    else
      v19 = 0;
    if (v19)
      return v11;
    else
      return 0;
  }
  return result;
}

- (void)_updateDataStatus
{
  uint64_t v2;
  double v3;
  const char *v5;
  void *v6;
  double v7;
  CoreTelephonyClient *ctClient;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  double v13;
  const char *v14;
  void *v15;
  double v16;
  int v17;
  NSObject *v18;
  _BOOL4 dataUsable;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  _BYTE v27[10];
  _BYTE v28[10];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend__getCTXPCServiceSubscriptionContext(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    ctClient = self->_ctClient;
    v25 = 0;
    objc_msgSend_getConnectionState_connectionType_error_(ctClient, v5, (uint64_t)v6, v7, 0, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v25;
    if (v9)
    {
      objc_msgSend__getDataStatus(self, v10, v11, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v17 = objc_msgSend__dataContextUsable_dataStatus_(self, v14, (uint64_t)v9, v16, v15);
        OSLogHandleForTransportCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          dataUsable = self->_dataUsable;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v27 = v17;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&v27[6] = dataUsable;
          *(_WORD *)v28 = 2112;
          *(_QWORD *)&v28[2] = v9;
          v29 = 2112;
          v30 = v15;
          _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "_updateDataStatus: %d %d, connection status: %@, data status: %@", buf, 0x22u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateDataStatus: %d %d, connection status: %@, data status: %@"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateDataStatus: %d %d, connection status: %@, data status: %@"));
          }
        }
        if (self->_dataUsable != v17)
        {
          self->_dataUsable = v17;
          OSLogHandleForTransportCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = CFSTR("NO");
            if (v17)
              v21 = CFSTR("YES");
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v27 = v21;
            _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "cellular data usable: %@.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("cellular data usable: %@."));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("cellular data usable: %@."));
            }
          }
        }
      }
      else
      {
        OSLogHandleForTransportCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "_updateDataStatus failed to get data status", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateDataStatus failed to get data status"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateDataStatus failed to get data status"));
          }
        }
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v27 = v12;
        *(_WORD *)&v27[8] = 2112;
        *(_QWORD *)v28 = v6;
        _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "getConnectionState failed: %@ %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("getConnectionState failed: %@ %@"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("getConnectionState failed: %@ %@"));
        }
      }
    }

  }
  else
  {
    OSLogHandleForTransportCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_DEFAULT, "_updateDataStatus: failed to get context", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateDataStatus: failed to get context"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateDataStatus: failed to get context"));
      }
    }
    v12 = 0;
  }

}

- (void)processCTConnectionStateChangeNotification:(id)a3 connectionStatus:(id)a4
{
  id v6;
  __CFString *v7;
  CoreTelephonyClient *ctClient;
  const char *v9;
  double v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  uint64_t v22;
  int dataUsable;
  _BOOL4 v24;
  int updated;
  const char *v26;
  uint64_t v27;
  double v28;
  int v29;
  const char *v30;
  double v31;
  NSObject *v32;
  NSString *cellularDataInterfaceName;
  unsigned int cellularMTU;
  const char *v35;
  const __CFString *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  __CFString *v40;
  NSString *v41;
  NSString *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  id v48;
  const char *v49;
  double v50;
  const char *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t i;
  NSObject *v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  uint64_t v60;
  NSString *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  uint8_t v70[128];
  uint8_t buf[4];
  const __CFString *v72;
  __int16 v73;
  _BYTE v74[14];
  __int16 v75;
  unsigned int v76;
  __int16 v77;
  const char *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  ctClient = self->_ctClient;
  v69 = 0;
  objc_msgSend_getDataStatus_error_(ctClient, v9, (uint64_t)v6, v10, &v69);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (__CFString *)v69;
  if (v11)
  {
    OSLogHandleForTransportCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v72 = v7;
      v73 = 2112;
      *(_QWORD *)v74 = v11;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "processCTConnectionStateChangeNotification: %@ %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v57 = v7;
        v59 = v11;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processCTConnectionStateChangeNotification: %@ %@"));
        if (_IDSShouldLog())
        {
          v57 = v7;
          v59 = v11;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processCTConnectionStateChangeNotification: %@ %@"));
        }
      }
    }
    v64 = objc_msgSend_indicator(v11, v14, v15, v16, v57, v59);
    v19 = objc_msgSend__dataContextUsable_dataStatus_(self, v17, (uint64_t)v7, v18, v11);
    v22 = v19;
    dataUsable = self->_dataUsable;
    if (dataUsable != (_DWORD)v19)
      self->_dataUsable = v19;
    v24 = dataUsable != v19;
    updated = objc_msgSend__updateCellularDataInterface_(self, v20, 0, v21);
    v29 = objc_msgSend__updateCellularMTU(self, v26, v27, v28);
    if ((objc_msgSend__updateRadioAccessTechnologyWithCTDataStatus_(self, v30, (uint64_t)v11, v31) | v29 | v24 | updated) == 1)
    {
      OSLogHandleForTransportCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        cellularDataInterfaceName = self->_cellularDataInterfaceName;
        cellularMTU = self->_cellularMTU;
        v35 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
        v36 = CFSTR("NO");
        *(_DWORD *)buf = 138413314;
        if ((_DWORD)v22)
          v36 = CFSTR("YES");
        v72 = v36;
        v73 = 1024;
        *(_DWORD *)v74 = v64;
        *(_WORD *)&v74[4] = 2112;
        *(_QWORD *)&v74[6] = cellularDataInterfaceName;
        v75 = 1024;
        v76 = cellularMTU;
        v77 = 2080;
        v78 = v35;
        _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "cellular data usable: %@ (indicator:%d, if:[%@], mtu:%u, RAT:[%s]).", buf, 0x2Cu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v40 = (_DWORD)v22 ? CFSTR("YES") : CFSTR("NO");
        v41 = self->_cellularDataInterfaceName;
        v62 = self->_cellularMTU;
        v63 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
        v60 = v64;
        v61 = v41;
        v58 = v40;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("cellular data usable: %@ (indicator:%d, if:[%@], mtu:%u, RAT:[%s])."));
        if (_IDSShouldLog())
        {
          v42 = self->_cellularDataInterfaceName;
          v62 = self->_cellularMTU;
          v63 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
          v60 = v64;
          v61 = v42;
          v58 = v40;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("cellular data usable: %@ (indicator:%d, if:[%@], mtu:%u, RAT:[%s])."));
        }
      }
      objc_msgSend_allObjects(self->_cellularLinkDelegates, v37, v38, v39, v58, v60, v61, v62, v63);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend_copy(v43, v44, v45, v46);

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v48 = v47;
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v65, v50, v70, 16);
      if (v52)
      {
        v54 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v66 != v54)
              objc_enumerationMutation(v48);
            objc_msgSend_cellularRadioAccessTechnologyDidChange_(*(void **)(*((_QWORD *)&v65 + 1) + 8 * i), v51, v22, v53);
          }
          v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v65, v53, v70, 16);
        }
        while (v52);
      }

    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v72 = v12;
      v73 = 2112;
      *(_QWORD *)v74 = v6;
      _os_log_impl(&dword_19B949000, v56, OS_LOG_TYPE_DEFAULT, "getDataStatus failed: %@ %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("getDataStatus failed: %@ %@"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("getDataStatus failed: %@ %@"));
      }
    }
  }

}

- (void)reset
{
  NSObject *v3;
  NSString *cellularDataInterfaceName;
  uint8_t buf[4];
  IDSCellularLinkMonitor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "reset cellular link monitor %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("reset cellular link monitor %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("reset cellular link monitor %@."));
    }
  }
  cellularDataInterfaceName = self->_cellularDataInterfaceName;
  self->_cellularDataInterfaceName = 0;

  *(_QWORD *)&self->_radioAccessTechnology = 10;
  self->_dataUsable = 0;
  *(_QWORD *)&self->_dataSoMaskBits = 0;
}

- (NSString)cellularDataInterfaceName
{
  double v2;
  NSString *cellularDataInterfaceName;

  cellularDataInterfaceName = self->_cellularDataInterfaceName;
  if (!cellularDataInterfaceName)
  {
    objc_msgSend__updateCellularDataInterface_(self, a2, 1, v2);
    cellularDataInterfaceName = self->_cellularDataInterfaceName;
  }
  return cellularDataInterfaceName;
}

- (unsigned)radioAccessTechnology
{
  uint64_t v2;
  double v3;
  unsigned int result;

  result = self->_radioAccessTechnology;
  if (result == 10)
  {
    objc_msgSend__updateRadioAccessTechnology(self, a2, v2, v3);
    return self->_radioAccessTechnology;
  }
  else if (result == 8 && self->_remoteDeviceVersion == 1)
  {
    result = 5;
    self->_radioAccessTechnology = 5;
  }
  return result;
}

- (unsigned)cellularMTU
{
  uint64_t v2;
  double v3;
  unsigned int result;

  result = self->_cellularMTU;
  if (!result)
  {
    objc_msgSend__updateCellularMTU(self, a2, v2, v3);
    return self->_cellularMTU;
  }
  return result;
}

- (BOOL)dataUsable
{
  uint64_t v2;
  double v3;

  if (self->_dataUsable)
    return 1;
  objc_msgSend__updateDataStatus(self, a2, v2, v3);
  return self->_dataUsable;
}

- (unsigned)dataSoMaskBits
{
  uint64_t v2;
  double v3;
  unsigned int result;

  result = self->_dataSoMaskBits;
  if (!result)
  {
    objc_msgSend__updateDataBearerSoMask(self, a2, v2, v3);
    return self->_dataSoMaskBits;
  }
  return result;
}

- (void)removePacketNotificationFilter
{
  NSObject *v3;
  NSMutableDictionary *notificationRegInfo;
  NSMutableDictionary *v5;
  uint8_t buf[4];
  NSMutableDictionary *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection && self->_notificationRegInfo)
  {
    _CTServerConnectionSetPacketNotificationFilter();
    OSLogHandleForTransportCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      notificationRegInfo = self->_notificationRegInfo;
      *(_DWORD *)buf = 138412290;
      v7 = notificationRegInfo;
      _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "removed packet notification filter for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("removed packet notification filter for %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("removed packet notification filter for %@."));
    }
    v5 = self->_notificationRegInfo;
    self->_notificationRegInfo = 0;

  }
}

- (BOOL)setPacketNotificationFilter:(const sockaddr *)a3 remote:(const sockaddr *)a4 uniqueTag:(unsigned int)a5 callType:(unsigned __int8)a6
{
  double v6;
  uint64_t v9;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *notificationRegInfo;
  __CFDictionary *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  const char *v26;
  void *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const void **v33;
  NSObject *v34;
  NSObject *v35;
  BOOL v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  void *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  unint64_t v46;
  int v47;
  unint64_t v48;
  NSObject *v49;
  NSObject *v50;
  NSMutableDictionary *v51;
  uint8_t buf[4];
  _DWORD v54[7];

  *(_QWORD *)&v54[5] = *MEMORY[0x1E0C80C00];
  if (!self->_ctServerConnection)
  {
    OSLogHandleForTransportCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "failed to set packet notification filter due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to set packet notification filter due to invalid CT server connection."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to set packet notification filter due to invalid CT server connection."));
      }
    }
    return 0;
  }
  if (a3->sa_family != a4->sa_family)
  {
    OSLogHandleForTransportCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "failed to set packet notification filter due to address family mismatch.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to set packet notification filter due to address family mismatch."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to set packet notification filter due to address family mismatch."));
      }
    }
    return 0;
  }
  v9 = a6;
  objc_msgSend_removePacketNotificationFilter(self, a2, (uint64_t)a3, v6);
  if (!self->_notificationRegInfo)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    notificationRegInfo = self->_notificationRegInfo;
    self->_notificationRegInfo = Mutable;

  }
  v14 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v15, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7500], v17);

  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v18, bswap32(a5), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7578], v20);

  if (a3->sa_family == 2)
  {
    objc_msgSend_numberWithShort_(MEMORY[0x1E0CB37E8], v21, *(__int16 *)a3->sa_data, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7510], v23);

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v24, (uint64_t)&a3->sa_data[2], v25, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7508], v27);
    objc_msgSend_numberWithShort_(MEMORY[0x1E0CB37E8], v26, *(__int16 *)a4->sa_data, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7560], v29);

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v30, (uint64_t)&a4->sa_data[2], v31, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7558], v32);
    if (!v14)
      goto LABEL_44;
    v33 = (const void **)MEMORY[0x1E0CA7528];
  }
  else
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v21, *(unsigned __int16 *)a3->sa_data, v22);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7510], v37);

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v38, (uint64_t)&a3->sa_data[6], v39, 16);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7508], v41);
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v40, *(unsigned __int16 *)a4->sa_data, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
      CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7560], v43);

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v44, (uint64_t)&a4->sa_data[6], v45, 16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      CFDictionarySetValue(v14, (const void *)*MEMORY[0x1E0CA7558], v32);
    if (!v14)
      goto LABEL_44;
    v33 = (const void **)MEMORY[0x1E0CA7530];
  }
  CFDictionarySetValue((CFMutableDictionaryRef)self->_notificationRegInfo, *v33, v14);
LABEL_44:
  v46 = _CTServerConnectionSetPacketNotificationFilter();
  v47 = v46;
  v36 = (_DWORD)v46 == 0;
  if ((_DWORD)v46)
  {
    v48 = HIDWORD(v46);
    OSLogHandleForTransportCategory();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v54[0] = v47;
      LOWORD(v54[1]) = 1024;
      *(_DWORD *)((char *)&v54[1] + 2) = v48;
      _os_log_impl(&dword_19B949000, v49, OS_LOG_TYPE_DEFAULT, "failed to set packet notification filter (error: %d.%d).", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to set packet notification filter (error: %d.%d)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to set packet notification filter (error: %d.%d)."));
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = self->_notificationRegInfo;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v54 = v51;
      _os_log_impl(&dword_19B949000, v50, OS_LOG_TYPE_DEFAULT, "set packet notification filter for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("set packet notification filter for %@."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("set packet notification filter for %@."));
      }
    }
  }

  return v36;
}

- (void)setRemoteDeviceVersion:(unsigned int)a3
{
  NSObject *v5;
  uint8_t buf[4];
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v7 = a3;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "CellularLinkMonitor: set remote device version: %u", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("CellularLinkMonitor: set remote device version: %u"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("CellularLinkMonitor: set remote device version: %u"));
    }
  }
  self->_remoteDeviceVersion = a3;
}

- (BOOL)dropIPPackets:(id)a3 localAddress:(sockaddr *)a4 remoteAddress:(sockaddr *)a5 isRelay:(BOOL)a6 channelNumberMSB:(unsigned __int8)a7
{
  uint64_t v7;
  _BOOL4 v8;
  id v12;
  void *v13;
  int v14;
  char v15;
  const char *v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  __CFArray *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t i;
  const __CFDictionary *v25;
  char v26;
  BOOL v27;
  void *Value;
  const char *v29;
  uint64_t v30;
  double v31;
  char v32;
  __CFDictionary *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  void *v54;
  unsigned int v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  double v61;
  void *v62;
  unsigned int v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  unsigned int v71;
  const char *v72;
  double v73;
  void *v74;
  const char *v75;
  NSObject *v76;
  NSObject *v77;
  BOOL v78;
  NSObject *v79;
  unint64_t v80;
  int v81;
  unint64_t v82;
  NSObject *v83;
  NSObject *v84;
  id v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  char v100;
  id obj;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  _BYTE v107[10];
  const char *v108;
  _BYTE v109[128];
  uint64_t v110;

  v7 = a7;
  v8 = a6;
  v110 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = v12;
  if (!self->_ctServerConnection)
  {
    OSLogHandleForTransportCategory();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v76, OS_LOG_TYPE_DEFAULT, "failed to drop IP packets due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to drop IP packets due to invalid CT server connection."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to drop IP packets due to invalid CT server connection."));
      }
    }
    goto LABEL_94;
  }
  if (!a4 || !a5)
  {
    OSLogHandleForTransportCategory();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v77, OS_LOG_TYPE_DEFAULT, "failed to drop IP packets due to invalid address.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to drop IP packets due to invalid address."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to drop IP packets due to invalid address."));
      }
    }
LABEL_94:
    v78 = 0;
    goto LABEL_119;
  }
  if (a4->sa_family == 2)
    v14 = 1;
  else
    v14 = 2;
  if (a4->sa_family == 2)
    v15 = 28;
  else
    v15 = 48;
  v99 = v14;
  v100 = v15;
  v97 = *(unsigned __int16 *)a5->sa_data;
  v98 = *(unsigned __int16 *)a4->sa_data;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v86 = v12;
  obj = v12;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v102, v17, v109, 16);
  if (!v19)
  {

    goto LABEL_110;
  }
  v20 = 0;
  v21 = 0;
  if (v8)
    v22 = 4;
  else
    v22 = 0;
  v87 = v22 + v100;
  v95 = (void *)*MEMORY[0x1E0CA7520];
  v93 = (void *)*MEMORY[0x1E0CA7510];
  v94 = (void *)*MEMORY[0x1E0CA7560];
  v92 = (void *)*MEMORY[0x1E0CA7548];
  v88 = (void *)*MEMORY[0x1E0CA7550];
  v91 = (void *)*MEMORY[0x1E0CA7570];
  v90 = (void *)*MEMORY[0x1E0CA7568];
  v23 = 138412546;
  v89 = (void *)*MEMORY[0x1E0CA7518];
  v96 = *(_QWORD *)v103;
  for (i = *(_QWORD *)v103; ; i = *(_QWORD *)v103)
  {
    if (i != v96)
      objc_enumerationMutation(obj);
    v25 = *(const __CFDictionary **)(*((_QWORD *)&v102 + 1) + 8 * v21);
    v26 = v100;
    if (!(_DWORD)v7)
    {
      if (v25)
        v27 = CFSTR("qos-family-offset-bytes") == 0;
      else
        v27 = 1;
      if (v27)
      {
        v32 = objc_msgSend_intValue(0, CFSTR("qos-family-offset-bytes"), v18, *(double *)&v23);
      }
      else
      {
        Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((_QWORD *)&v102 + 1) + 8 * v21), CFSTR("qos-family-offset-bytes"));
        v32 = objc_msgSend_intValue(Value, v29, v30, v31);
      }
      v26 = v87 + v32;
    }
    v33 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], v34, v99, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CFDictionarySetValue(v33, v95, v36);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v95;
      *(_WORD *)&v107[8] = 2080;
      v108 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v37, v98, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      CFDictionarySetValue(v33, v94, v39);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v94;
      *(_WORD *)&v107[8] = 2080;
      v108 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v40, v97, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      CFDictionarySetValue(v33, v93, v42);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v93;
      *(_WORD *)&v107[8] = 2080;
      v108 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], v43, v26, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      CFDictionarySetValue(v33, v92, v45);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v92;
      *(_WORD *)&v107[8] = 2080;
      v108 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    if ((_DWORD)v7)
    {
      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v46, v7, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        CFDictionarySetValue(v33, v88, v48);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v107 = v88;
        *(_WORD *)&v107[8] = 2080;
        v108 = "newPayloadDictionary";
        _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
      }

    }
    else if (v25
           && CFSTR("qos-family-payload-type")
           && (v49 = (id)CFDictionaryGetValue(v25, CFSTR("qos-family-payload-type"))) != 0)
    {
      v50 = v49;
      CFDictionarySetValue(v33, v88, v49);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v88;
      *(_WORD *)&v107[8] = 2080;
      v108 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }
    v54 = 0;
    if (v25 && CFSTR("qos-family-transaction-id"))
      v54 = (void *)CFDictionaryGetValue(v25, CFSTR("qos-family-transaction-id"));
    v55 = objc_msgSend_unsignedShortValue(v54, v51, v52, v53);
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v56, __rev16(v55), v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      CFDictionarySetValue(v33, v91, v58);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v91;
      *(_WORD *)&v107[8] = 2080;
      v108 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    v62 = v25 != 0 && CFSTR("qos-family-timestamp-value") != 0
        ? (void *)CFDictionaryGetValue(v25, CFSTR("qos-family-timestamp-value"))
        : 0;
    v63 = objc_msgSend_unsignedIntValue(v62, v59, v60, v61);
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v64, bswap32(v63), v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      CFDictionarySetValue(v33, v90, v66);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v90;
      *(_WORD *)&v107[8] = 2080;
      v108 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    v70 = v25 != 0 && CFSTR("qos-family-drop-operation") != 0
        ? (void *)CFDictionaryGetValue(v25, CFSTR("qos-family-drop-operation"))
        : 0;
    v71 = objc_msgSend_unsignedShortValue(v70, v67, v68, v69);
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v72, __rev16(v71), v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      CFDictionarySetValue(v33, v89, v74);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v89;
      *(_WORD *)&v107[8] = 2080;
      v108 = "newPayloadDictionary";
      _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
    }

    if (v20 || (v20 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8])) != 0)
    {
      if (v33)
        CFArrayAppendValue(v20, v33);
    }

    if (++v21 >= v19)
      break;
LABEL_81:
    ;
  }
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v75, (uint64_t)&v102, *(double *)&v23, v109, 16);
  if (v19)
  {
    v21 = 0;
    goto LABEL_81;
  }

  if (!v20)
  {
LABEL_110:
    OSLogHandleForTransportCategory();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v84, OS_LOG_TYPE_DEFAULT, "dropIPPackets failed due to invalid payloadArray.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("dropIPPackets failed due to invalid payloadArray."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("dropIPPackets failed due to invalid payloadArray."));
      }
    }
    v20 = 0;
LABEL_117:
    v78 = 0;
    goto LABEL_118;
  }
  OSLogHandleForTransportCategory();
  v79 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v107 = v20;
    _os_log_impl(&dword_19B949000, v79, OS_LOG_TYPE_DEFAULT, "drop IP packets for payload array %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("drop IP packets for payload array %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("drop IP packets for payload array %@."));
    }
  }
  v80 = _CTServerConnectionDropIPPackets();
  v81 = v80;
  if ((_DWORD)v80)
  {
    v82 = HIDWORD(v80);
    OSLogHandleForTransportCategory();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v107 = v81;
      *(_WORD *)&v107[4] = 1024;
      *(_DWORD *)&v107[6] = v82;
      _os_log_impl(&dword_19B949000, v83, OS_LOG_TYPE_DEFAULT, "CTServerConnectionDropIPPackets failed (error: %d.%d).", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("CTServerConnectionDropIPPackets failed (error: %d.%d)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("CTServerConnectionDropIPPackets failed (error: %d.%d)."));
      }
    }
    goto LABEL_117;
  }
  v78 = 1;
LABEL_118:

  v13 = v86;
LABEL_119:

  return v78;
}

- (void)updateProtocolQualityOfService:(BOOL)a3 localAddress:(sockaddr *)a4
{
  _BOOL4 v4;
  int v5;
  unint64_t updated;
  int v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  uint8_t buf[4];
  _BYTE v15[10];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    if (a4)
    {
      v4 = a3;
      if (a4->sa_family == 30)
        v5 = 2;
      else
        v5 = 1;
      updated = _CTServerConnectionUpdateProtocolQualityOfService();
      v7 = updated;
      if ((_DWORD)updated)
      {
        v8 = HIDWORD(updated);
        OSLogHandleForTransportCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v15 = v7;
          *(_WORD *)&v15[4] = 1024;
          *(_DWORD *)&v15[6] = v8;
          _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "failed to update protocol QoS (error: %d.%d)", buf, 0xEu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to update protocol QoS (error: %d.%d)"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to update protocol QoS (error: %d.%d)"));
        }
      }
      else
      {
        OSLogHandleForTransportCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = CFSTR("NO");
          if (v4)
            v13 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v15 = v13;
          *(_WORD *)&v15[8] = 1024;
          v16 = v5;
          _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "update procotol QoS (isGood:%@, addressFamily:%d).", buf, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update procotol QoS (isGood:%@, addressFamily:%d)."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update procotol QoS (isGood:%@, addressFamily:%d)."));
          }
        }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "updateProtocolQualityOfService failed due to invalid address.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("updateProtocolQualityOfService failed due to invalid address."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("updateProtocolQualityOfService failed due to invalid address."));
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "failed to update protocol QoS due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to update protocol QoS due to invalid CT server connection."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to update protocol QoS due to invalid CT server connection."));
      }
    }
  }
}

- (void)currentCellularSignalStrength:(int *)a3 signalStrength:(int *)a4 signalGrade:(int *)a5
{
  double v5;
  const char *v10;
  void *v11;
  double v12;
  CoreTelephonyClient *ctClient;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  _BYTE v32[10];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    *a3 = 0;
    *a4 = 100;
    *a5 = 0;
    objc_msgSend__getCTXPCServiceSubscriptionContext(self, a2, (uint64_t)a3, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      ctClient = self->_ctClient;
      v30 = 0;
      objc_msgSend_getSignalStrengthInfo_error_(ctClient, v10, (uint64_t)v11, v12, &v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v30;
      if (v14)
      {
        objc_msgSend_bars(v14, v15, v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *a5 = objc_msgSend_intValue(v19, v20, v21, v22);

        OSLogHandleForTransportCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *a3;
          v25 = *a4;
          v26 = *a5;
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v32 = v24;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v25;
          LOWORD(v33) = 1024;
          *(_DWORD *)((char *)&v33 + 2) = v26;
          _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "current cellular signal strength  [Raw: %d Strength: %d  Grade: %d]", buf, 0x14u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("current cellular signal strength  [Raw: %d Strength: %d  Grade: %d]"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("current cellular signal strength  [Raw: %d Strength: %d  Grade: %d]"));
        }
      }
      else
      {
        OSLogHandleForTransportCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v32 = v17;
          *(_WORD *)&v32[8] = 2112;
          v33 = v11;
          _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "getSignalStrengthInfo failed: %@ %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("getSignalStrengthInfo failed: %@ %@"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("getSignalStrengthInfo failed: %@ %@"));
          }
        }
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "currentCellularSignalStrength: failed to get context", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("currentCellularSignalStrength: failed to get context"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("currentCellularSignalStrength: failed to get context"));
        }
      }
    }

  }
  else
  {
    OSLogHandleForTransportCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v27, OS_LOG_TYPE_DEFAULT, "failed to get cellular signal strength due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get cellular signal strength due to invalid CT server connection."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get cellular signal strength due to invalid CT server connection."));
      }
    }
  }
}

- (void)registerCellularDataStatusNotification:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  double v8;
  CoreTelephonyClient *ctClient;
  NSObject *v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    v3 = a3;
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "registerCellularDataStatusNotification: %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("registerCellularDataStatusNotification: %@."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("registerCellularDataStatusNotification: %@."));
      }
    }
    ctClient = self->_ctClient;
    if (v3)
      objc_msgSend_setDelegate_(ctClient, v7, (uint64_t)self, v8);
    else
      objc_msgSend_setDelegate_(ctClient, v7, 0, v8);
  }
  else
  {
    OSLogHandleForTransportCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "registerCellularDataStatusNotification failed due to invalid CT server connection.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("registerCellularDataStatusNotification failed due to invalid CT server connection."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("registerCellularDataStatusNotification failed due to invalid CT server connection."));
      }
    }
  }
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  OSLogHandleForTransportCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = a4;
    _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "connectionStateChanged, connection type: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("connectionStateChanged, connection type: %d"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("connectionStateChanged, connection type: %d"));
    }
  }
  if (!a4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_19B9AFA98;
    v10[3] = &unk_1E3C1FA08;
    v11 = v7;
    v12 = v8;
    IDSTransportThreadAddBlock(v10);

  }
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6;
  id v7;
  CoreTelephonyClient *ctClient;
  const char *v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  double v14;
  int isEqual;
  NSObject *v16;
  const __CFString *v17;
  const char *v18;
  double v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ctClient = self->_ctClient;
  v20 = 0;
  objc_msgSend_getPreferredDataSubscriptionContextSync_(ctClient, v9, (uint64_t)&v20, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  isEqual = objc_msgSend_isEqual_(v11, v13, (uint64_t)v6, v14);

  OSLogHandleForTransportCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v22 = v6;
    v23 = 2112;
    if (isEqual)
      v17 = CFSTR("YES");
    v24 = v17;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "Received CT data status changed callback { context: %@, isRelevant: %@, dataStatus: %@ }", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Received CT data status changed callback { context: %@, isRelevant: %@, dataStatus: %@ }"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Received CT data status changed callback { context: %@, isRelevant: %@, dataStatus: %@ }"));
    }
  }
  if (isEqual)
    objc_msgSend__notifyClientDataBearerSoMask_(self, v18, (uint64_t)v7, v19);

}

- (void)_notifyClientDataBearerSoMask:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  NSObject *v7;
  unsigned int dataSoMaskBits;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  unsigned int v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  id v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  unsigned int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend__updateDataBearerSoMaskWithCTDataStatus_(self, v5, (uint64_t)v4, v6))
  {
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dataSoMaskBits = self->_dataSoMaskBits;
      *(_DWORD *)buf = 67109120;
      v44 = dataSoMaskBits;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "_updateClientDataBearerSoMask: update AVC cellular so Mask: %u", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v36 = self->_dataSoMaskBits;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_updateClientDataBearerSoMask: update AVC cellular so Mask: %u"));
        if (_IDSShouldLog())
        {
          v36 = self->_dataSoMaskBits;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_updateClientDataBearerSoMask: update AVC cellular so Mask: %u"));
        }
      }
    }
    objc_msgSend_allObjects(self->_cellularLinkDelegates, v9, v10, v11, v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_copy(v12, v13, v14, v15);

    OSLogHandleForTransportCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend_count(v16, v18, v19, v20);
      *(_DWORD *)buf = 67109120;
      v44 = v21;
      _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "[delegates count]: %u", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v37 = objc_msgSend_count(v16, v22, v23, v24);
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("[delegates count]: %u"));
        if (_IDSShouldLog())
        {
          v37 = objc_msgSend_count(v16, v25, v26, v27, v37);
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("[delegates count]: %u"));
        }
      }
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = v16;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v38, v30, v42, 16);
    if (v32)
    {
      v34 = *(_QWORD *)v39;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v39 != v34)
            objc_enumerationMutation(v28);
          objc_msgSend_cellularSoMaskDidChange_(*(void **)(*((_QWORD *)&v38 + 1) + 8 * v35++), v31, self->_dataSoMaskBits, v33, v37);
        }
        while (v32 != v35);
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v38, v33, v42, 16);
      }
      while (v32);
    }

  }
}

- (void)preferredDataSimChanged:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  OSLogHandleForTransportCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "preferredDataSimChanged %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("preferredDataSimChanged %@"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("preferredDataSimChanged %@"));
    }
  }

}

- (__CTServerConnection)_ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)set_ctServerConnection:(__CTServerConnection *)a3
{
  self->_ctServerConnection = a3;
}

- (CoreTelephonyClient)_ctClient
{
  return self->_ctClient;
}

- (void)set_ctClient:(id)a3
{
  objc_storeStrong((id *)&self->_ctClient, a3);
}

- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContextSync
{
  return self->_currentDataSubscriptionContextSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSubscriptionContextSync, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_notificationRegInfo, 0);
  objc_storeStrong((id *)&self->_cellularLinkDelegates, 0);
  objc_storeStrong((id *)&self->_cellularDataInterfaceName, 0);
  objc_storeStrong((id *)&self->_dataIndicator, 0);
  objc_storeStrong((id *)&self->_ctClientDataDelegate, 0);
}

@end
