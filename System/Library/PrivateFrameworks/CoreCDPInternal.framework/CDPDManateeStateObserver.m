@implementation CDPDManateeStateObserver

- (CDPDManateeStateObserver)init
{
  CDPBroadcaster *v3;
  CDPDManateeStateObserver *v4;

  v3 = objc_alloc_init(CDPBroadcaster);
  v4 = -[CDPDManateeStateObserver initWithBroadcaster:](self, "initWithBroadcaster:", v3);

  return v4;
}

- (CDPDManateeStateObserver)initWithBroadcaster:(id)a3
{
  id v6;
  CDPDManateeStateObserver *v7;
  id *p_isa;
  id v9;
  void *v10;
  CDPDManateeStateObserver *v11;
  NSObject *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDPDManateeStateObserver;
  v7 = -[CDPDManateeStateObserver init](&v14, sel_init);
  p_isa = (id *)&v7->super.isa;
  if (!v7)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPBroadcaster init].cold.1(a2);
    goto LABEL_8;
  }

  v9 = v6;
  if (!v9)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPBroadcaster init].cold.2((uint64_t)p_isa, a2);
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  v10 = v9;
  objc_storeStrong(p_isa + 1, a3);

  v11 = p_isa;
LABEL_9:

  return v11;
}

- (void)_sendNotification:(const char *)a3 withUserInfo:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(v6, "stringWithCString:encoding:", a3, 4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CDPDManateeStateObserver broadcaster](self, "broadcaster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendNotification:userInfo:", v9, v7);

}

- (void)_reportPrimaryAccountManateeAvailability:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)v11 = 0;
      v7 = "\"All systems go!!! Manatee available for primary account\";
LABEL_6:
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, v7, v11, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)v11 = 0;
    v7 = "\"All systems are not go... Manatee not available for primary account\";
    goto LABEL_6;
  }

  v8 = *MEMORY[0x24BE1A358];
  v12 = *MEMORY[0x24BE1A360];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDManateeStateObserver _sendNotification:withUserInfo:](self, "_sendNotification:withUserInfo:", v8, v10);

}

- (void)_checkManateeStatusAndSendAvailabilityNotificationForContext:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD *v9;
  uint64_t v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  CDPDManateeStateObserver *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isSharediPad");
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CDPDManateeStateObserver _checkManateeStatusAndSendAvailabilityNotificationForContext:].cold.1(v7);
    goto LABEL_20;
  }
  v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  v9 = (_QWORD *)MEMORY[0x24BE1A350];
  if (v8)
  {
    v10 = *MEMORY[0x24BE1A350];
    *(_DWORD *)buf = 136446210;
    v25 = v10;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Sending %{public}s to notify clients of potential manatee changes\", buf, 0xCu);
  }

  -[CDPDManateeStateObserver _sendNotification:withUserInfo:](self, "_sendNotification:withUserInfo:", *v9, 0);
  +[CDPBroadcaster broadcastWalrusStateChangeNotification](CDPBroadcaster, "broadcastWalrusStateChangeNotification");
  v11 = objc_msgSend(v4, "isPrimaryAccount");
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) != 0)
  {
    if (v12)
    {
      objc_msgSend(v4, "altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558274;
      v25 = 1752392040;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Checking manatee status for primary account with altDSID %{mask.hash}@\", buf, 0x16u);

    }
    -[CDPDManateeStateObserver _proxyForContext:](self, "_proxyForContext:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A460]), "initWithContext:circleProxy:", v4, v7);
    v23 = 0;
    v15 = objc_msgSend(v14, "isManateeAvailable:", &v23);
    v16 = v23;
    v17 = v16;
    if (v15)
    {
      v18 = self;
      v19 = 1;
    }
    else
    {
      if (objc_msgSend(v16, "cdp_isCDPErrorWithCode:", -5403))
      {
        _CDPLogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "altDSID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 141558274;
          v25 = 1752392040;
          v26 = 2112;
          v27 = v22;
          _os_log_impl(&dword_20DB2C000, v21, OS_LOG_TYPE_DEFAULT, "\"We are iCDP eligible for %{mask.hash}@, but Security is not ready, waiting for Security state resolution..\", buf, 0x16u);

        }
        goto LABEL_19;
      }
      v18 = self;
      v19 = 0;
    }
    -[CDPDManateeStateObserver _reportPrimaryAccountManateeAvailability:](v18, "_reportPrimaryAccountManateeAvailability:", v19);
LABEL_19:

    goto LABEL_20;
  }
  if (v12)
  {
    objc_msgSend(v4, "altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558274;
    v25 = 1752392040;
    v26 = 2112;
    v27 = v20;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Account for altDSID %{mask.hash}@ is not primary, skipping additonal manatee status check.\", buf, 0x16u);

  }
LABEL_20:

}

- (void)securityLevelChangedForAccountContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Processing auth status change to calculate manatee availability\", buf, 2u);
  }

  -[CDPDManateeStateObserver _checkManateeStatusAndSendAvailabilityNotificationForContext:](self, "_checkManateeStatusAndSendAvailabilityNotificationForContext:", v4);
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Processed auth status change event\", v7, 2u);
  }

}

- (void)circleStatusChangedForAccountContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Processing circle status change to calculate manatee availability\", buf, 2u);
  }

  -[CDPDManateeStateObserver _checkManateeStatusAndSendAvailabilityNotificationForContext:](self, "_checkManateeStatusAndSendAvailabilityNotificationForContext:", v4);
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Processed circle state change event\", v7, 2u);
  }

}

- (void)circleViewStatusChangedForAccountContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Processing circle view change event\", buf, 2u);
  }

  -[CDPDManateeStateObserver _checkManateeStatusAndSendAvailabilityNotificationForContext:](self, "_checkManateeStatusAndSendAvailabilityNotificationForContext:", v4);
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Processed circle view change event\", v7, 2u);
  }

}

- (id)_proxyForContext:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE1A3E8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithContext:", v4);

  return v5;
}

- (CDPBroadcaster)broadcaster
{
  return self->_broadcaster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcaster, 0);
}

- (void)_checkManateeStatusAndSendAvailabilityNotificationForContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"CDPDManateeStateObserver: Manatee is not supported on MAID accounts on shared iPad\", v1, 2u);
}

@end
