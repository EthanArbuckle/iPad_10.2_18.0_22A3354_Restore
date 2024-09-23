@implementation IDSPushHandler

+ (id)sharedInstanceWithPortName:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  IDSPushHandler *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;

  v3 = a3;
  if (qword_1EE40AC20 != -1)
    dispatch_once(&qword_1EE40AC20, &unk_1E3C1BED0);
  pthread_mutex_lock(&stru_1EE40AC28);
  objc_msgSend_objectForKey_((void *)qword_1EE40AC18, v4, (uint64_t)v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = [IDSPushHandler alloc];
    v10 = (void *)objc_msgSend_initWithPort_(v7, v8, (uint64_t)v3, v9);
    objc_msgSend_setObject_forKey_((void *)qword_1EE40AC18, v11, (uint64_t)v10, v12, v3);
    objc_msgSend_objectForKey_((void *)qword_1EE40AC18, v13, (uint64_t)v3, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  pthread_mutex_unlock(&stru_1EE40AC28);

  return v6;
}

- (void)setWakingTopics:(id)a3 opportunisticTopics:(id)a4 nonWakingTopics:(id)a5 forListener:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  id v53;

  v53 = a3;
  v10 = a4;
  v11 = a5;
  v14 = a6;
  if (!v14)
    goto LABEL_20;
  if (!v10)
  {
    objc_msgSend_set(MEMORY[0x1E0C99E60], v12, v13, v15);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v53)
  {
    objc_msgSend_set(MEMORY[0x1E0C99E60], v12, v13, v15);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_6;
LABEL_17:
    objc_msgSend_set(MEMORY[0x1E0C99E60], v12, v13, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v11)
    goto LABEL_17;
LABEL_6:
  objc_msgSend_lock(self->_recursiveLock, v12, v13, v15);
  objc_msgSend_objectForKey_(self->_handlerMap, v16, (uint64_t)v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18;
  if (v18)
  {
    objc_msgSend_wakingTopics(v18, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_opportunisticTopics(v22, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nonWakingTopics(v22, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToSet_(v23, v32, (uint64_t)v53, v33)
      || !objc_msgSend_isEqualToSet_(v27, v34, (uint64_t)v10, v35)
      || (objc_msgSend_isEqualToSet_(v31, v34, (uint64_t)v11, v35) & 1) == 0)
    {
      objc_msgSend_setWakingTopics_(v22, v34, (uint64_t)v53, v35);
      objc_msgSend_setOpportunisticTopics_(v22, v37, (uint64_t)v10, v38);
      objc_msgSend_setNonWakingTopics_(v22, v39, (uint64_t)v11, v40);
      if (objc_msgSend_isSubsetOfSet_(v23, v41, (uint64_t)v53, v42)
        && objc_msgSend_isSubsetOfSet_(v27, v43, (uint64_t)v10, v45)
        && objc_msgSend_isSubsetOfSet_(v31, v43, (uint64_t)v11, v45))
      {
        objc_msgSend_unionSet_(self->_opportunisticTopicsCache, v43, (uint64_t)v10, v45);
        objc_msgSend_unionSet_(self->_wakingTopicsCache, v46, (uint64_t)v53, v47);
        objc_msgSend_unionSet_(self->_nonWakingTopicsCache, v48, (uint64_t)v11, v49);
        objc_msgSend__updateTopics(self, v50, v51, v52);
      }
      else
      {
        objc_msgSend__recalculateTopicsCache(self, v43, v44, v45);
      }
    }
    objc_msgSend_unlock(self->_recursiveLock, v34, v36, v35);

  }
  else
  {
    objc_msgSend_unlock(self->_recursiveLock, v19, v20, v21);
  }

LABEL_20:
}

- (void)setCommands:(id)a3 forListener:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  char isEqual;
  const char *v27;
  double v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  double v37;
  id v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = a4;
  if (v9)
  {
    if (!v6)
    {
      objc_msgSend_set(MEMORY[0x1E0C99E60], v7, v8, v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_lock(self->_recursiveLock, v7, v8, v10);
    objc_msgSend_objectForKey_(self->_handlerMap, v11, (uint64_t)v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    if (!v13)
    {
      objc_msgSend_unlock(self->_recursiveLock, v14, v15, v16);
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend_commands(v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    if (v18 && v6)
    {
      objc_msgSend_commands(v17, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v23, v24, (uint64_t)v6, v25);

      if ((isEqual & 1) != 0)
      {
LABEL_16:
        objc_msgSend_setCommands_(v17, v27, (uint64_t)v6, v28, v38, v39, v40);
        objc_msgSend_unlock(self->_recursiveLock, v35, v36, v37);
        goto LABEL_17;
      }
    }
    else
    {

    }
    OSLogHandleForIDSCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_commands(v17, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v9;
      v43 = 2112;
      v44 = v33;
      v45 = 2112;
      v46 = v6;
      _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEBUG, "Updating push commands for listener %@ from %@ to %@", buf, 0x20u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_commands(v17, v27, v34, v28);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v6;
      v38 = v9;
      _IDSLogV(1, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Updating push commands for listener %@ from %@ to %@"));

    }
    goto LABEL_16;
  }
LABEL_18:

}

+ (id)sharedInstance
{
  if (qword_1ECDD47B8 != -1)
    dispatch_once(&qword_1ECDD47B8, &unk_1E3C1B710);
  return (id)qword_1ECDD4808;
}

- (IDSPushHandler)init
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  IDSPushHandler *v12;

  objc_msgSend_pushAdapter(IDSDependencyProvider, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_placeholderMachPort(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (IDSPushHandler *)objc_msgSend_initWithPort_(self, v10, (uint64_t)v9, v11);

  return v12;
}

- (IDSPushHandler)initWithPort:(id)a3
{
  id v4;
  IDSPushHandler *v5;
  NSRecursiveLock *v6;
  NSRecursiveLock *recursiveLock;
  const char *v8;
  uint64_t v9;
  double v10;
  NSString *v11;
  void *namedDelegatePort;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  const char *v22;
  double v23;
  uint64_t v24;
  APSConnection *apsConnection;
  const char *v26;
  double v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IDSPushHandler;
  v5 = -[IDSPushHandler init](&v38, sel_init);
  if (v5)
  {
    v6 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    recursiveLock = v5->_recursiveLock;
    v5->_recursiveLock = v6;

    if (_os_feature_enabled_impl())
    {
      v11 = (NSString *)v4;
      namedDelegatePort = v5->_namedDelegatePort;
      v5->_namedDelegatePort = v11;
    }
    else
    {
      objc_msgSend_sharedInstance(IDSServerBag, v8, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apsEnvironmentName(v13, v14, v15, v16);
      namedDelegatePort = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_pushAdapter(IDSDependencyProvider, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      im_primary_queue();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apsConnectionWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_queue_(v20, v22, (uint64_t)namedDelegatePort, v23, v4, 1, v21);
      v24 = objc_claimAutoreleasedReturnValue();
      apsConnection = v5->_apsConnection;
      v5->_apsConnection = (APSConnection *)v24;

      objc_msgSend_setDelegate_(v5->_apsConnection, v26, (uint64_t)v5, v27);
      OSLogHandleForIDSCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_publicToken(v5->_apsConnection, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = v32;
        v41 = 2112;
        v42 = namedDelegatePort;
        _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "Cached push token: %@   Environment: %@", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        objc_msgSend_publicToken(v5->_apsConnection, v33, v34, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Cached push token: %@   Environment: %@"));

      }
    }

  }
  return v5;
}

- (void)dealloc
{
  double v2;
  objc_super v4;

  objc_msgSend_setDelegate_(self->_apsConnection, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)IDSPushHandler;
  -[IDSPushHandler dealloc](&v4, sel_dealloc);
}

- (APSConnection)apsConnection
{
  const char *v3;
  uint64_t v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  NSString *namedDelegatePort;
  void *v19;
  const char *v20;
  double v21;
  APSConnection *v22;
  APSConnection *apsConnection;
  const char *v24;
  double v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend_lock(self->_recursiveLock, v3, v4, v5);
    if (!self->_apsConnection)
    {
      objc_msgSend_sharedInstance(IDSServerBag, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apsEnvironmentName(v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_pushAdapter(IDSDependencyProvider, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      namedDelegatePort = self->_namedDelegatePort;
      im_primary_queue();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apsConnectionWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_queue_(v17, v20, (uint64_t)v13, v21, namedDelegatePort, 1, v19);
      v22 = (APSConnection *)objc_claimAutoreleasedReturnValue();
      apsConnection = self->_apsConnection;
      self->_apsConnection = v22;

      objc_msgSend_setDelegate_(self->_apsConnection, v24, (uint64_t)self, v25);
      OSLogHandleForIDSCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_publicToken(self->_apsConnection, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v30;
        v39 = 2112;
        v40 = v13;
        _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "Cached push token: %@   Environment: %@", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        objc_msgSend_publicToken(self->_apsConnection, v31, v32, v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v13;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Cached push token: %@   Environment: %@"));

      }
    }
    objc_msgSend_unlock(self->_recursiveLock, v6, v7, v8, v35, v36);
  }
  return self->_apsConnection;
}

- (void)_powerLogIncomingMessage:(id)a3 command:(id)a4 topic:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  double v42;
  NSObject *v43;
  const char *v44;
  double v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend_integerValue(v9, v11, v12, v13) == 255)
    goto LABEL_24;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  if (v9)
    objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v9, v19, CFSTR("CommandID"));
  if (v10)
    objc_msgSend_setObject_forKeyedSubscript_(v20, v18, (uint64_t)v10, v19, CFSTR("Topic"));
  v21 = objc_opt_class();
  sub_19BA138EC(v21, v8, CFSTR("i"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend_setObject_forKeyedSubscript_(v20, v22, (uint64_t)v23, v24, CFSTR("MessageIdentifier"));
  objc_msgSend_objectForKey_(v8, v22, (uint64_t)CFSTR("U"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(v8, v26, (uint64_t)CFSTR("U"), v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v28, v30, (uint64_t)v29, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    JWUUIDPushObjectToString();
    v33 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(v8, v26, (uint64_t)CFSTR("U"), v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      JWUUIDPushObjectToString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    objc_msgSend_objectForKey_(v8, v34, (uint64_t)CFSTR("U"), v35);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    JWUUIDPushObjectToString();
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v33;

LABEL_14:
  if (v36)
    objc_msgSend_setObject_forKeyedSubscript_(v20, v37, (uint64_t)v36, v38, CFSTR("MessageGUID"));
  v39 = objc_opt_class();
  sub_19BA138EC(v39, v8, CFSTR("cc"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    objc_msgSend_setObject_forKeyedSubscript_(v20, v40, (uint64_t)v41, v42, CFSTR("CommandContext"));
  OSLogHandleForIDSCategory();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v20;
    _os_log_impl(&dword_19B949000, v43, OS_LOG_TYPE_DEFAULT, "Logging incoming push power event: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v46 = v20;
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Logging incoming push power event: %@"));
  }
  objc_msgSend__powerLogEvent_dictionary_(self, v44, (uint64_t)CFSTR("IDS IncomingPushReceived"), v45, v20, v46);

LABEL_24:
}

- (void)_powerLogEvent:(id)a3 dictionary:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (qword_1EE40AD68 != -1)
    dispatch_once(&qword_1EE40AD68, &unk_1E3C1C010);
  if (off_1EE40AD60)
    off_1EE40AD60(2, v6, v5, 0);

}

- (BOOL)isConnected
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  char isConnected;

  objc_msgSend_apsConnection(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isConnected = objc_msgSend_isConnected(v4, v5, v6, v7);

  return isConnected;
}

- (BOOL)_validateHandler:(id)a3 withSelector:(SEL)a4 topic:(id)a5 command:(id)a6
{
  id v9;
  id v10;
  NSMapTable *handlerMap;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  char v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  char v26;
  char v27;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  double v51;
  const char *v52;
  double v53;
  void *v54;
  const char *v55;
  double v56;
  void *v58;

  v9 = a5;
  v10 = a6;
  handlerMap = self->_handlerMap;
  v12 = a3;
  objc_msgSend_objectForKey_(handlerMap, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_msgSend_wakingTopics(v15, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_containsObject_(v20, v21, (uint64_t)CFSTR("*"), v22) & 1) != 0)
    {
      v26 = 1;
    }
    else
    {
      objc_msgSend_wakingTopics(v15, v23, v24, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsObject_(v28, v29, (uint64_t)v9, v30) & 1) != 0)
      {
        v26 = 1;
      }
      else
      {
        objc_msgSend_opportunisticTopics(v15, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_containsObject_(v34, v35, (uint64_t)CFSTR("*"), v36) & 1) != 0)
        {
          v26 = 1;
        }
        else
        {
          objc_msgSend_opportunisticTopics(v15, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_containsObject_(v40, v41, (uint64_t)v9, v42) & 1) != 0)
          {
            v26 = 1;
          }
          else
          {
            objc_msgSend_nonWakingTopics(v15, v43, v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_containsObject_(v46, v47, (uint64_t)CFSTR("*"), v48) & 1) != 0)
            {
              v26 = 1;
            }
            else
            {
              objc_msgSend_nonWakingTopics(v15, v49, v50, v51);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend_containsObject_(v58, v52, (uint64_t)v9, v53);

            }
          }

        }
      }

    }
    if (v10)
      goto LABEL_20;
  }
  else
  {
    v26 = 1;
    if (v10)
    {
LABEL_20:
      objc_msgSend_commands(v15, v17, v18, v19);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_containsObject_(v54, v55, (uint64_t)v10, v56);

      goto LABEL_21;
    }
  }
  v27 = 1;
LABEL_21:

  return v16 & v26 & v27;
}

- (id)_getValidPushHandlersWithSelector:(SEL)a3 topic:(id)a4 command:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  NSMapTable *v18;
  const char *v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  NSObject *v33;
  void *v34;
  NSMapTable *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend_lock(self->_recursiveLock, v9, v10, v11);
  if (objc_msgSend_count(self->_handlerMap, v12, v13, v14))
  {
    objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v15, v16, v17);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = self->_handlerMap;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v40, v20, v44, 16);
    if (v22)
    {
      v24 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v18);
          v26 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v21, v26, v23, sel_selector, v7, v8))
          {
            objc_msgSend_objectForKey_(self->_handlerMap, v21, v26, v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v39, v28, (uint64_t)v27, v29, v26);

          }
        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v40, v23, v44, 16);
      }
      while (v22);
    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_selector);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = v34;
      v47 = 2112;
      v48 = v7;
      v49 = 2112;
      v50 = v8;
      _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "No incoming push handler for selector: %@    topic: %@   command: %@", buf, 0x20u);

    }
    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
    {
      v39 = 0;
      goto LABEL_18;
    }
    NSStringFromSelector(sel_selector);
    v18 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v37 = v7;
    v38 = v8;
    v36 = v18;
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("No incoming push handler for selector: %@    topic: %@   command: %@"));
    v39 = 0;
  }

LABEL_18:
  objc_msgSend_unlock(self->_recursiveLock, v30, v31, v32, v36, v37, v38);

  return v39;
}

- (void)_updateTopics
{
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  NSMutableSet *wakingTopicsCache;
  NSMutableSet *opportunisticTopicsCache;
  NSMutableSet *nonWakingTopicsCache;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  __int128 v39;
  NSMutableSet *v40;
  uint8_t buf[4];
  NSMutableSet *v42;
  __int16 v43;
  NSMutableSet *v44;
  __int16 v45;
  NSMutableSet *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC8274](self, a2);
  objc_msgSend_lock(self->_recursiveLock, v4, v5, v6);
  if (self->_shouldWaitToSetTopics)
  {
    objc_msgSend_unlock(self->_recursiveLock, v7, v8, v9);
  }
  else
  {
    OSLogHandleForTransportCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      wakingTopicsCache = self->_wakingTopicsCache;
      opportunisticTopicsCache = self->_opportunisticTopicsCache;
      nonWakingTopicsCache = self->_nonWakingTopicsCache;
      *(_DWORD *)buf = 138412802;
      v42 = wakingTopicsCache;
      v43 = 2112;
      v44 = opportunisticTopicsCache;
      v45 = 2112;
      v46 = nonWakingTopicsCache;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "Updating waking topics to: %@ opportunistic topics to: %@ nonWaking topics to: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v40 = self->_nonWakingTopicsCache;
        v39 = *(_OWORD *)&self->_wakingTopicsCache;
        _IDSLogTransport(CFSTR("IDSPushHandler"), CFSTR("IDS"), CFSTR("Updating waking topics to: %@ opportunistic topics to: %@ nonWaking topics to: %@"));
        if (_IDSShouldLog())
        {
          v40 = self->_nonWakingTopicsCache;
          v39 = *(_OWORD *)&self->_wakingTopicsCache;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Updating waking topics to: %@ opportunistic topics to: %@ nonWaking topics to: %@"));
        }
      }
    }
    objc_msgSend_allObjects(self->_wakingTopicsCache, v14, v15, v16, v39, v40);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(self->_opportunisticTopicsCache, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(self->_nonWakingTopicsCache, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99D20], v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(self->_recursiveLock, v30, v31, v32);
    objc_msgSend_apsConnection(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_(v36, v37, (uint64_t)v17, v38, v29, v21, v25);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)_recalculateTopicsCache
{
  uint64_t v2;
  double v3;
  NSMutableSet *v5;
  NSMutableSet *v6;
  NSMutableSet *wakingTopicsCache;
  NSMutableSet *v8;
  NSMutableSet *opportunisticTopicsCache;
  NSMutableSet *v10;
  NSMutableSet *nonWakingTopicsCache;
  NSMapTable *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  NSMutableSet *v45;
  NSMutableSet *v46;
  NSMutableSet *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self->_recursiveLock, a2, v2, v3);
  v5 = self->_wakingTopicsCache;
  v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  wakingTopicsCache = self->_wakingTopicsCache;
  self->_wakingTopicsCache = v6;

  v47 = self->_opportunisticTopicsCache;
  v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  opportunisticTopicsCache = self->_opportunisticTopicsCache;
  self->_opportunisticTopicsCache = v8;

  v46 = self->_nonWakingTopicsCache;
  v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  nonWakingTopicsCache = self->_nonWakingTopicsCache;
  self->_nonWakingTopicsCache = v10;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v12 = self->_handlerMap;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v48, v14, v52, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(v12);
        objc_msgSend_objectForKey_(self->_handlerMap, v16, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v17, v46);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_wakingTopics(v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionSet_(self->_wakingTopicsCache, v26, (uint64_t)v25, v27);
        objc_msgSend_opportunisticTopics(v21, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionSet_(self->_opportunisticTopicsCache, v32, (uint64_t)v31, v33);
        objc_msgSend_nonWakingTopics(v21, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionSet_(self->_nonWakingTopicsCache, v38, (uint64_t)v37, v39);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v48, v17, v52, 16);
    }
    while (v18);
  }

  v45 = v46;
  if (!objc_msgSend_isEqualToSet_(self->_wakingTopicsCache, v40, (uint64_t)v5, v41)
    || !objc_msgSend_isEqualToSet_(self->_opportunisticTopicsCache, v42, (uint64_t)v47, v44)
    || (objc_msgSend_isEqualToSet_(self->_nonWakingTopicsCache, v42, (uint64_t)v46, v44) & 1) == 0)
  {
    objc_msgSend__updateTopics(self, v42, v43, v44, v46);
  }
  objc_msgSend_unlock(self->_recursiveLock, v42, v43, v44, v46);

}

- (void)addListener:(id)a3 topics:(id)a4 commands:(id)a5 queue:(id)a6
{
  ((void (*)(IDSPushHandler *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_addListener_wakingTopics_opportunisticTopics_nonWakingTopics_commands_queue_, a3);
}

- (void)addListener:(id)a3 wakingTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 commands:(id)a7 queue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  id v28;
  const char *v29;
  uint64_t v30;
  double v31;
  id v32;
  const char *v33;
  uint64_t v34;
  double v35;
  id v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  NSMapTable *v60;
  NSMapTable *handlerMap;
  const char *v62;
  uint64_t v63;
  double v64;
  id v65;
  IDSPushHandlerContext *v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  double v71;
  const char *v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  NSMutableSet *wakingTopicsCache;
  NSMutableSet *opportunisticTopicsCache;
  NSMutableSet *v78;
  NSMutableSet *v79;
  const char *v80;
  double v81;
  NSMutableSet *v82;
  NSMutableSet *v83;
  NSMutableSet *v84;
  const char *v85;
  double v86;
  NSMutableSet *nonWakingTopicsCache;
  NSMutableSet *v88;
  NSMutableSet *v89;
  const char *v90;
  uint64_t v91;
  double v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  double v96;
  NSObject *v97;
  const char *v98;
  double v99;
  const char *v100;
  double v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  double v105;
  NSObject *v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  void *v120;
  _QWORD block[4];
  id v122;
  IDSPushHandler *v123;
  id v124;
  uint8_t buf[4];
  id v126;
  __int16 v127;
  id v128;
  __int16 v129;
  id v130;
  __int16 v131;
  id v132;
  __int16 v133;
  id v134;
  __int16 v135;
  id v136;
  __int16 v137;
  id v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  id v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v118 = a4;
  v15 = a5;
  v16 = a6;
  v119 = a7;
  v17 = a8;
  v21 = v17;
  if (!v14 || !v17)
    goto LABEL_42;
  objc_msgSend_lock(self->_recursiveLock, v18, v19, v20);
  objc_msgSend_objectForKey_(self->_handlerMap, v22, (uint64_t)v14, v23);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_wakingTopics(v120, v25, v26, v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_opportunisticTopics(v120, v29, v30, v31);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nonWakingTopics(v120, v33, v34, v35);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_commands(v120, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414338;
    v126 = v14;
    v127 = 2112;
    v128 = v28;
    v129 = 2112;
    v130 = v118;
    v131 = 2112;
    v132 = v32;
    v133 = 2112;
    v134 = v15;
    v135 = 2112;
    v136 = v36;
    v137 = 2112;
    v138 = v16;
    v139 = 2112;
    v140 = v40;
    v141 = 2112;
    v142 = v119;
    _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "Updating push topics for listener %@   | waking topics were %@ becoming %@ opportunistic topics were %@ becoming %@ nonwaking topics were %@ becoming %@ commands were %@ becoming %@", buf, 0x5Cu);

  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_wakingTopics(v120, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_opportunisticTopics(v120, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nonWakingTopics(v120, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_commands(v120, v53, v54, v55);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v119;
    v112 = v52;
    v113 = v16;
    v110 = v48;
    v111 = v15;
    v108 = v44;
    v109 = v118;
    v107 = v14;
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Updating push topics for listener %@   | waking topics were %@ becoming %@ opportunistic topics were %@ becoming %@ nonwaking topics were %@ becoming %@ commands were %@ becoming %@"));

  }
  v56 = v120;
  if (self->_handlerMap)
  {
    if (v15)
    {
LABEL_10:
      v116 = v15;
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v41, v42, v43);
    v60 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    handlerMap = self->_handlerMap;
    self->_handlerMap = v60;

    v56 = v120;
    if (v15)
      goto LABEL_10;
  }
  objc_msgSend_set(MEMORY[0x1E0C99E60], v41, v42, v43, v107, v108, v109, v110, v111, v112, v113, v114, v115);
  v116 = (id)objc_claimAutoreleasedReturnValue();
  v56 = v120;
LABEL_13:
  if (!v118)
  {
    objc_msgSend_set(MEMORY[0x1E0C99E60], v57, v58, v59);
    v117 = (id)objc_claimAutoreleasedReturnValue();
    v56 = v120;
    if (v16)
      goto LABEL_15;
LABEL_17:
    objc_msgSend_set(MEMORY[0x1E0C99E60], v62, v63, v64, v107, v108, v109, v110, v111, v112, v113, v114, v115);
    v65 = (id)objc_claimAutoreleasedReturnValue();
    v56 = v120;
    goto LABEL_18;
  }
  v117 = v118;
  if (!v16)
    goto LABEL_17;
LABEL_15:
  v65 = v16;
LABEL_18:
  v66 = [IDSPushHandlerContext alloc];
  v69 = (void *)objc_msgSend_initWithQueue_wakingTopics_opportunisticTopics_nonWakingTopics_commands_(v66, v67, (uint64_t)v21, v68, v117, v15, v65, v119);
  objc_msgSend_setObject_forKey_(self->_handlerMap, v70, (uint64_t)v69, v71, v14);
  if (v56)
  {
    objc_msgSend__recalculateTopicsCache(self, v72, v73, v74);
  }
  else
  {
    wakingTopicsCache = self->_wakingTopicsCache;
    if (!wakingTopicsCache
      || !self->_opportunisticTopicsCache
      || !self->_nonWakingTopicsCache
      || !objc_msgSend_isSubsetOfSet_(v117, v72, (uint64_t)wakingTopicsCache, v74)
      || !objc_msgSend_isSubsetOfSet_(v116, v72, (uint64_t)self->_opportunisticTopicsCache, v74)
      || (objc_msgSend_isSubsetOfSet_(v65, v72, (uint64_t)self->_nonWakingTopicsCache, v74) & 1) == 0)
    {
      opportunisticTopicsCache = self->_opportunisticTopicsCache;
      if (!opportunisticTopicsCache)
      {
        v78 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v79 = self->_opportunisticTopicsCache;
        self->_opportunisticTopicsCache = v78;

        opportunisticTopicsCache = self->_opportunisticTopicsCache;
      }
      objc_msgSend_unionSet_(opportunisticTopicsCache, v72, (uint64_t)v116, v74, v107, v108, v109, v110, v111, v112, v113, v114, v115);
      v82 = self->_wakingTopicsCache;
      if (!v82)
      {
        v83 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v84 = self->_wakingTopicsCache;
        self->_wakingTopicsCache = v83;

        v82 = self->_wakingTopicsCache;
      }
      objc_msgSend_unionSet_(v82, v80, (uint64_t)v117, v81);
      nonWakingTopicsCache = self->_nonWakingTopicsCache;
      if (!nonWakingTopicsCache)
      {
        v88 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v89 = self->_nonWakingTopicsCache;
        self->_nonWakingTopicsCache = v88;

        nonWakingTopicsCache = self->_nonWakingTopicsCache;
      }
      objc_msgSend_unionSet_(nonWakingTopicsCache, v85, (uint64_t)v65, v86);
      objc_msgSend__updateTopics(self, v90, v91, v92);
    }
  }
  v93 = (void *)objc_msgSend_copy(self->_cachedPushToken, v72, v75, v74, v107, v108, v109, v110, v111, v112, v113, v114, v115);
  objc_msgSend_unlock(self->_recursiveLock, v94, v95, v96);
  if (v93)
  {
    OSLogHandleForIDSCategory();
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v97, OS_LOG_TYPE_DEBUG, "Alerting delegate with our cached token", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV(2, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Alerting delegate with our cached token"));
    if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v98, (uint64_t)v14, v99, sel_handler_pushTokenChanged_, 0, 0))
    {
      objc_msgSend_objectForKey_(self->_handlerMap, v100, (uint64_t)v14, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_queue(v102, v103, v104, v105);
      v106 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19BA14974;
      block[3] = &unk_1E3C1FE50;
      v122 = v14;
      v123 = self;
      v124 = v93;
      dispatch_async(v106, block);

    }
  }

LABEL_42:
}

- (void)removeListener:(id)a3
{
  NSRecursiveLock *recursiveLock;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  NSMapTable *handlerMap;
  const char *v18;
  uint64_t v19;
  double v20;

  if (a3)
  {
    recursiveLock = self->_recursiveLock;
    v5 = a3;
    objc_msgSend_lock(recursiveLock, v6, v7, v8);
    objc_msgSend_removeObjectForKey_(self->_handlerMap, v9, (uint64_t)v5, v10);

    if (!objc_msgSend_count(self->_handlerMap, v11, v12, v13))
    {
      handlerMap = self->_handlerMap;
      self->_handlerMap = 0;

    }
    objc_msgSend__recalculateTopicsCache(self, v14, v15, v16);
    objc_msgSend_unlock(self->_recursiveLock, v18, v19, v20);
  }
}

- (void)setTopics:(id)a3 forListener:(id)a4
{
  ((void (*)(IDSPushHandler *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_setWakingTopics_opportunisticTopics_nonWakingTopics_forListener_, 0);
}

- (void)setUltraConstrainedTopics:(id)a3 forListener:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  id v24;

  v24 = a3;
  v8 = a4;
  if (v8)
  {
    v10 = (uint64_t)v24;
    if (!v24)
    {
      objc_msgSend_set(MEMORY[0x1E0C99E60], v6, v7, v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (id)v10;
    objc_msgSend_lock(self->_recursiveLock, v6, v7, v9);
    objc_msgSend_objectForKey_(self->_handlerMap, v11, (uint64_t)v8, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend_apsConnection(self, v13, v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v24, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUltraConstrainedTopics_(v17, v22, (uint64_t)v21, v23);

    }
    objc_msgSend_unlock(self->_recursiveLock, v13, v14, v16);

  }
}

- (void)setShouldWaitToSetTopics:(BOOL)a3
{
  double v3;
  int v4;
  const char *v6;
  uint64_t v7;
  double v8;
  int shouldWaitToSetTopics;

  v4 = a3;
  objc_msgSend_lock(self->_recursiveLock, a2, a3, v3);
  shouldWaitToSetTopics = self->_shouldWaitToSetTopics;
  self->_shouldWaitToSetTopics = v4;
  if (shouldWaitToSetTopics != v4 && shouldWaitToSetTopics != 0)
    objc_msgSend__updateTopics(self, v6, v7, v8);
  objc_msgSend_unlock(self->_recursiveLock, v6, v7, v8);
}

- (id)_apsConnectionPushToken
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_apsConnection(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicToken(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)pushToken
{
  uint64_t v2;
  uint64_t v4;
  NSData *cachedPushToken;
  _BOOL4 v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NSData *v11;
  NSData *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  NSMapTable *v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  const char *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  NSObject *v41;
  void *v42;
  id v43;
  const char *v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  id v60;
  NSMapTable *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD block[7];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  id *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v75 = 0;
  v76 = (id *)&v75;
  v77 = 0x3032000000;
  v78 = sub_19BA151A8;
  v79 = sub_19BA151B8;
  v80 = 0;
  v4 = objc_msgSend_lock(self->_recursiveLock, a2, v2, COERCE_DOUBLE(0x3032000000));
  cachedPushToken = self->_cachedPushToken;
  if (cachedPushToken)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1A1AC8274](v4);
    objc_msgSend__apsConnectionPushToken(self, v8, v9, v10);
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cachedPushToken;
    self->_cachedPushToken = v11;

    objc_autoreleasePoolPop(v7);
    cachedPushToken = self->_cachedPushToken;
    v6 = cachedPushToken != 0;
  }
  objc_storeStrong(v76 + 5, cachedPushToken);
  objc_msgSend_unlock(self->_recursiveLock, v13, v14, v15);
  if (!v6)
    goto LABEL_30;
  objc_msgSend_lock(self->_recursiveLock, v16, v17, v18);
  if (objc_msgSend_count(self->_handlerMap, v19, v20, v21))
  {
    objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v72 = 0u;
    v71 = 0u;
    v26 = self->_handlerMap;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v71, v28, v82, 16);
    if (v30)
    {
      v32 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v72 != v32)
            objc_enumerationMutation(v26);
          v34 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
          if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v29, v34, v31, sel_handler_pushTokenChanged_, 0, 0))
          {
            objc_msgSend_objectForKey_(self->_handlerMap, v29, v34, v31);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v25, v36, (uint64_t)v35, v37, v34);

          }
        }
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v71, v31, v82, 16);
      }
      while (v30);
    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_handler_pushTokenChanged_);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v84 = v42;
      v85 = 2112;
      v86 = 0;
      v87 = 2112;
      v88 = 0;
      v89 = 2112;
      v90 = 0;
      _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_DEFAULT, "No incoming push handler for selector: %@    topic: %@   command: %@   context: %@", buf, 0x2Au);

    }
    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
    {
      v25 = 0;
      goto LABEL_22;
    }
    NSStringFromSelector(sel_handler_pushTokenChanged_);
    v26 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v65 = 0;
    v62 = v26;
    v63 = 0;
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("No incoming push handler for selector: %@    topic: %@   command: %@   context: %@"));
    v25 = 0;
  }

LABEL_22:
  objc_msgSend_unlock(self->_recursiveLock, v38, v39, v40, v62, v63, v64, v65);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v43 = v25;
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v67, v45, v81, 16);
  if (v47)
  {
    v49 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v68 != v49)
          objc_enumerationMutation(v43);
        v51 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
        objc_msgSend_objectForKey_(self->_handlerMap, v46, v51, v48);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_queue(v52, v53, v54, v55);
        v56 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_19BA151C0;
        block[3] = &unk_1E3C1FC00;
        block[4] = v51;
        block[5] = self;
        block[6] = &v75;
        dispatch_async(v56, block);

      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v67, v48, v81, 16);
    }
    while (v47);
  }

  objc_msgSend_count(v43, v57, v58, v59);
LABEL_30:
  v60 = v76[5];
  _Block_object_dispose(&v75, 8);

  return (NSData *)v60;
}

- (__SecIdentity)copyPushIdentity
{
  void *v2;
  const char *v3;
  uint64_t v4;
  double v5;

  v2 = (void *)CUTWeakLinkClass();
  return (__SecIdentity *)objc_msgSend_copyIdentity(v2, v3, v4, v5);
}

- (void)subscribeToChannel:(id)a3 forTopic:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  id v17;
  const char *v18;
  double v19;
  _QWORD v20[4];
  id v21;
  IDSPushHandler *v22;
  id v23;

  v6 = a4;
  v7 = v6;
  if (a3 && v6)
  {
    v8 = a3;
    v9 = objc_alloc((Class)CUTWeakLinkClass());
    v12 = (void *)objc_msgSend_initWithChannelID_(v9, v10, (uint64_t)v8, v11);

    objc_msgSend_apsConnection(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_19BA154AC;
    v20[3] = &unk_1E3C20530;
    v21 = v12;
    v22 = self;
    v23 = v7;
    v17 = v12;
    objc_msgSend_getRegisteredChannelsForTopic_withCompletion_(v16, v18, (uint64_t)v23, v19, v20);

  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  NSData *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  id *p_cachedPushToken;
  NSData *cachedPushToken;
  const char *v15;
  uint64_t v16;
  double v17;
  id v18;
  NSObject *v19;
  NSData *v20;
  BOOL v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  char v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  NSMapTable *v37;
  const char *v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  void *v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  double v51;
  NSObject *v52;
  IDSPushHandler *v53;
  const char *v54;
  double v55;
  const char *v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  double v70;
  IDSPushHandler *v71;
  NSMapTable *v72;
  NSData *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  NSData *v79;
  id obj;
  void *v81;
  _QWORD block[6];
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint8_t v93[128];
  uint8_t buf[4];
  IDSPushHandler *v95;
  __int16 v96;
  NSData *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v6 = (NSData *)a4;
  objc_msgSend_lock(self->_recursiveLock, v7, v8, v9);
  p_cachedPushToken = (id *)&self->_cachedPushToken;
  cachedPushToken = self->_cachedPushToken;
  v79 = v6;
  if (cachedPushToken == v6)
  {
    v78 = 0;
  }
  else
  {
    *p_cachedPushToken = 0;

    if (objc_msgSend_length(v6, v15, v16, v17))
    {
      objc_storeStrong((id *)&self->_cachedPushToken, a4);
      v18 = *p_cachedPushToken;
    }
    else
    {
      v18 = 0;
    }
    v78 = v18;
    OSLogHandleForIDSCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_cachedPushToken;
      *(_DWORD *)buf = 138412546;
      v95 = self;
      v96 = 2112;
      v97 = v20;
      _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "%@ Received push token: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v71 = self;
      v73 = self->_cachedPushToken;
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("%@ Received push token: %@"));
    }
    v6 = v79;
  }
  v21 = cachedPushToken == v6;
  objc_msgSend_unlock(self->_recursiveLock, v10, v11, v12, v71, v73);
  v25 = v78;
  if (v78)
    v26 = v21;
  else
    v26 = 1;
  if ((v26 & 1) == 0)
  {
    v81 = (void *)objc_msgSend_copy(v78, v22, v23, v24);
    objc_msgSend_lock(self->_recursiveLock, v27, v28, v29);
    if (objc_msgSend_count(self->_handlerMap, v30, v31, v32))
    {
      objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0u;
      v91 = 0u;
      v89 = 0u;
      v88 = 0u;
      v37 = self->_handlerMap;
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v88, v39, v93, 16);
      if (v41)
      {
        v43 = *(_QWORD *)v89;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v89 != v43)
              objc_enumerationMutation(v37);
            v45 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
            if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v40, v45, v42, sel_handler_pushTokenChanged_, 0, 0))
            {
              objc_msgSend_objectForKey_(self->_handlerMap, v40, v45, v42);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v36, v47, (uint64_t)v46, v48, v45);

            }
          }
          v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v88, v42, v93, 16);
        }
        while (v41);
      }
    }
    else
    {
      OSLogHandleForIDSCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(sel_handler_pushTokenChanged_);
        v53 = (IDSPushHandler *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v95 = v53;
        v96 = 2112;
        v97 = 0;
        v98 = 2112;
        v99 = 0;
        v100 = 2112;
        v101 = 0;
        _os_log_impl(&dword_19B949000, v52, OS_LOG_TYPE_DEFAULT, "No incoming push handler for selector: %@    topic: %@   command: %@   context: %@", buf, 0x2Au);

      }
      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
      {
        v36 = 0;
        goto LABEL_33;
      }
      NSStringFromSelector(sel_handler_pushTokenChanged_);
      v37 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v75 = 0;
      v76 = 0;
      v72 = v37;
      v74 = 0;
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("No incoming push handler for selector: %@    topic: %@   command: %@   context: %@"));
      v36 = 0;
    }

LABEL_33:
    objc_msgSend_unlock(self->_recursiveLock, v49, v50, v51, v72, v74, v75, v76, v77);
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v36;
    v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v84, v55, v92, 16);
    if (v57)
    {
      v59 = *(_QWORD *)v85;
      v60 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v85 != v59)
            objc_enumerationMutation(obj);
          v62 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
          objc_msgSend_objectForKey_(self->_handlerMap, v56, v62, v58);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_queue(v63, v64, v65, v66);
          v67 = objc_claimAutoreleasedReturnValue();
          block[0] = v60;
          block[1] = 3221225472;
          block[2] = sub_19BA15A34;
          block[3] = &unk_1E3C1FE50;
          block[4] = v62;
          block[5] = self;
          v83 = v81;
          dispatch_async(v67, block);

        }
        v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v84, v58, v92, 16);
      }
      while (v57);
    }

    objc_msgSend_count(obj, v68, v69, v70);
    v25 = v78;
  }

}

- (void)writePushPayloadToDiskIfEnabled:(id)a3 topic:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  double v53;
  id v54;
  NSObject *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  id v63;
  const char *v64;
  double v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  __CFString *v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[2];
  _QWORD v74[2];
  uint8_t buf[4];
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (CUTIsInternalInstall()
    && objc_msgSend_isWritePushPayloadsToDiskEnabled(MEMORY[0x1E0D36AF8], v7, v8, v9))
  {
    objc_msgSend_writePushPayloadsToDiskPath(MEMORY[0x1E0D36AF8], v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend_writePushPayloadsToDiskPath(MEMORY[0x1E0D36AF8], v14, v15, v16);
      v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v69 = CFSTR("/var/mobile/Library/IdentityServices/");
    }
    v17 = objc_opt_class();
    sub_19BA138EC(v17, v5, CFSTR("c"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v28, (uint64_t)CFSTR("%@-push-%@.data"), v29, v18, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend_stringByAppendingPathComponent_(v69, v32, (uint64_t)v30, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(v31, v35, (uint64_t)v34, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    OSLogHandleForIDSCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_absoluteString(v37, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v76 = v42;
      _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "Writing payload to disk: {%@}", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_absoluteString(v37, v43, v45, v44);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Writing payload to disk: {%@}"));

    }
    v73[0] = CFSTR("t");
    v73[1] = CFSTR("p");
    v74[0] = v6;
    v74[1] = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v43, (uint64_t)v74, v44, v73, 2, v68);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v47, (uint64_t)v46, v48, 100, 0, &v72);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v72;
    if (v50)
    {
      v54 = v50;
      OSLogHandleForIDSCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v76 = v54;
        _os_log_impl(&dword_19B949000, v55, OS_LOG_TYPE_DEFAULT, "Error while serializing payload %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Error while serializing payload %@"));
    }
    else
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v51, v52, v53);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByDeletingLastPathComponent(v37, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0;
      objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v56, v61, (uint64_t)v60, v62, 1, 0, &v71);
      v63 = v71;

      v70 = v63;
      LODWORD(v60) = objc_msgSend_writeToURL_options_error_(v49, v64, (uint64_t)v37, v65, 1, &v70);
      v54 = v70;

      if ((_DWORD)v60)
      {
        OSLogHandleForIDSCategory();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v66, OS_LOG_TYPE_DEFAULT, "Write to disk: Successful", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Write to disk: Successful"));
      }
      else
      {
        OSLogHandleForIDSCategory();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v76 = v54;
          _os_log_impl(&dword_19B949000, v67, OS_LOG_TYPE_DEFAULT, "Write to disk: Unsuccessful with error: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Write to disk: Unsuccessful with error: %@"));
      }
    }

  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  void *v19;
  double v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  double v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  v6 = a4;
  objc_msgSend_getBlastDoorSharedConnection(IDSBlastDoorConnectionHelper, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topic(v6, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userInfo(v6, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend_writePushPayloadToDiskIfEnabled_topic_(self, v18, (uint64_t)v19, v20, v14);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_19BA16274;
  v26[3] = &unk_1E3C205D0;
  v26[4] = self;
  v27 = v14;
  v28 = v6;
  v29 = v19;
  v21 = v19;
  v22 = v6;
  v23 = v14;
  objc_msgSend_diffuseAPSUserPayload_topic_withCompletionBlock_(v10, v24, (uint64_t)v21, v25, v23, v26);

}

- (void)connectionDidReconnect:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "APS Connection did reconnect: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("APS Connection did reconnect: %@"));

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const __CFString *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  NSMapTable *v18;
  const char *v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  NSObject *v33;
  __CFString *v34;
  const char *v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  const __CFString *v52;
  NSMapTable *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id obj;
  _BOOL4 v59;
  _QWORD block[6];
  BOOL v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  const __CFString *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v59 = a4;
  v80 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v59)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v73 = v6;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "APS Connection status did change to connected: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v10 = CFSTR("NO");
    if (v59)
      v10 = CFSTR("YES");
    v52 = v10;
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("APS Connection status did change to connected: %@"));
  }
  objc_msgSend_lock(self->_recursiveLock, v7, v8, v9, v52);
  if (objc_msgSend_count(self->_handlerMap, v11, v12, v13))
  {
    objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v67 = 0u;
    v66 = 0u;
    v18 = self->_handlerMap;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v66, v20, v71, 16);
    if (v22)
    {
      v24 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v67 != v24)
            objc_enumerationMutation(v18);
          v26 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v21, v26, v23, sel_handler_isConnectedChanged_, 0, 0))
          {
            objc_msgSend_objectForKey_(self->_handlerMap, v21, v26, v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v17, v28, (uint64_t)v27, v29, v26);

          }
        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v66, v23, v71, 16);
      }
      while (v22);
    }
    goto LABEL_20;
  }
  OSLogHandleForIDSCategory();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(sel_handler_isConnectedChanged_);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v73 = v34;
    v74 = 2112;
    v75 = 0;
    v76 = 2112;
    v77 = 0;
    v78 = 2112;
    v79 = 0;
    _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "No incoming push handler for selector: %@    topic: %@   command: %@   context: %@", buf, 0x2Au);

  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    NSStringFromSelector(sel_handler_isConnectedChanged_);
    v18 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v56 = 0;
    v53 = v18;
    v54 = 0;
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("No incoming push handler for selector: %@    topic: %@   command: %@   context: %@"));
    v17 = 0;
LABEL_20:

    goto LABEL_27;
  }
  v17 = 0;
LABEL_27:
  objc_msgSend_unlock(self->_recursiveLock, v30, v31, v32, v53, v54, v55, v56);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v17;
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v62, v36, v70, 16);
  if (v38)
  {
    v40 = *(_QWORD *)v63;
    v41 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v63 != v40)
          objc_enumerationMutation(obj);
        v43 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend_objectForKey_(self->_handlerMap, v37, v43, v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_queue(v44, v45, v46, v47);
        v48 = objc_claimAutoreleasedReturnValue();
        block[0] = v41;
        block[1] = 3221225472;
        block[2] = sub_19BA1881C;
        block[3] = &unk_1E3C205F8;
        block[4] = v43;
        block[5] = self;
        v61 = v59;
        dispatch_async(v48, block);

      }
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v62, v39, v70, 16);
    }
    while (v38);
  }

  objc_msgSend_count(obj, v49, v50, v51);
}

- (BOOL)shouldWaitToSetTopics
{
  return self->_shouldWaitToSetTopics;
}

- (void)setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (NSString)namedDelegatePort
{
  return self->_namedDelegatePort;
}

- (void)setNamedDelegatePort:(id)a3
{
  objc_storeStrong((id *)&self->_namedDelegatePort, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedDelegatePort, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_recursiveLock, 0);
  objc_storeStrong((id *)&self->_nonWakingTopicsCache, 0);
  objc_storeStrong((id *)&self->_opportunisticTopicsCache, 0);
  objc_storeStrong((id *)&self->_wakingTopicsCache, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_cachedPushToken, 0);
}

@end
