@implementation MXClientUtil

- (BOOL)hasClientForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MXClientUtil clientDictionary](self, "clientDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)_isClientAvailableFromPersistence
{
  void *v2;
  char v3;

  -[MXClientUtil _retrieveClientAvailablity](self, "_retrieveClientAvailablity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)_retrieveClientAvailablity
{
  return (id)(id)CFPreferencesCopyValue(CFSTR("MXClientsAvailable"), CFSTR("com.apple.metrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
}

- (BOOL)isClientAvailableForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MXClientUtil clientDictionary](self, "clientDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

- (NSDictionary)clientDictionary
{
  return self->_clientDictionary;
}

- (void)_updateClientAsAvailableFromPersistence
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E837000, log, OS_LOG_TYPE_ERROR, "Clients available was in a bad state.\n", v1, 2u);
}

- (void)_persistClientDictionary
{
  void *v2;
  const __CFString *v3;

  -[MXClientUtil clientDictionary](self, "clientDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSetValue(CFSTR("MXClientDataRetrieved"), v2, CFSTR("com.apple.metrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);

  CFPreferencesSynchronize(CFSTR("com.apple.metrickitd"), CFSTR("mobile"), v3);
  _CFPreferencesFlushCachesForIdentifier();
  _CFPreferencesFlushCachesForIdentifier();
}

- (MXClientUtil)init
{
  MXClientUtil *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  os_log_t v5;
  OS_os_log *logHandle;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MXClientUtil;
  v2 = -[MXClientUtil init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    v5 = os_log_create("com.apple.metrickit", "client.utility");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v5;

    if (!v2->_logHandle)
      objc_storeStrong((id *)&v2->_logHandle, MEMORY[0x24BDACB70]);
    -[MXClientUtil _initClientCollection](v2, "_initClientCollection");
    -[MXClientUtil _initTeamCollection](v2, "_initTeamCollection");
    -[MXClientUtil _persistClientAvailability](v2, "_persistClientAvailability");
  }
  return v2;
}

- (void)_initClientCollection
{
  OUTLINED_FUNCTION_0_1(&dword_21E837000, a2, a3, "Client Dict: %@", a5, a6, a7, a8, 2u);
}

- (void)registerClientForBundleID:(id)a3
{
  id v4;

  v4 = a3;
  -[MXClientUtil _randomReportClientRegistrationForBundleID:](self, "_randomReportClientRegistrationForBundleID:", v4);
  -[MXClientUtil _updateClientDictionaryWithBundleID:](self, "_updateClientDictionaryWithBundleID:", v4);

}

- (id)allClients
{
  void *v2;
  void *v3;

  -[MXClientUtil clientDictionary](self, "clientDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)teamIDForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MXClientUtil clientTeamIDs](self, "clientTeamIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeClientFromPersistenceForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *logHandle;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[MXClientUtil clientDictionary](self, "clientDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectForKey:", v4);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXClientUtil setClientDictionary:](self, "setClientDictionary:", v7);

  -[MXClientUtil _persistClientDictionary](self, "_persistClientDictionary");
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    -[MXClientUtil removeClientFromPersistenceForBundleID:].cold.1((uint64_t)v4, logHandle, v9, v10, v11, v12, v13, v14);

}

- (void)reportMetricKitUsageForBundleID:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __48__MXClientUtil_reportMetricKitUsageForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("scheduledClient");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportPayloadDeliveriesSuccessWithSuccessCount:(unint64_t)a3
{
  AnalyticsSendEventLazy();
}

id __63__MXClientUtil_reportPayloadDeliveriesSuccessWithSuccessCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("clientDictionaryOverallCount");
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "clientDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("clientDictionarySuccessCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("clientDictionaryFailureCount");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "clientDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "count") - *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_retrieveClientDictionary
{
  return (id)(id)CFPreferencesCopyValue(CFSTR("MXClientDataRetrieved"), CFSTR("com.apple.metrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
}

- (id)_retrieveTeamIDsDictionary
{
  void *v2;
  void *v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("MXClientTeamID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (void)_persistClientAvailability
{
  NSObject *logHandle;
  uint8_t v4[16];

  if (-[MXClientUtil _hasClientInClientDictionary](self, "_hasClientInClientDictionary"))
  {
    -[MXClientUtil _updateClientAsAvailableFromPersistence](self, "_updateClientAsAvailableFromPersistence");
  }
  else
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_INFO, "No clients found. Resetting client availability key\n", v4, 2u);
    }
    -[MXClientUtil _updateClientAsNotAvailableFromPersistence](self, "_updateClientAsNotAvailableFromPersistence");
  }
}

- (BOOL)_hasClientInClientDictionary
{
  void *v3;
  uint64_t v4;
  NSObject *logHandle;

  -[MXClientUtil clientDictionary](self, "clientDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      -[MXClientUtil _hasClientInClientDictionary].cold.1(logHandle);
  }
  return v4 != 0;
}

- (void)_updateClientDictionaryWithBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MXClientUtil clientDictionary](self, "clientDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v6, v4);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXClientUtil setClientDictionary:](self, "setClientDictionary:", v7);

  -[MXClientUtil _persistClientDictionary](self, "_persistClientDictionary");
}

- (void)_updateTeamIDsDictionaryWithTeamID:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MXClientUtil clientTeamIDs](self, "clientTeamIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v10, "setValue:forKey:", v7, v6);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXClientUtil setClientTeamIDs:](self, "setClientTeamIDs:", v9);

  -[MXClientUtil _persistTeamIDsDictionary](self, "_persistTeamIDsDictionary");
}

- (void)_updateClientAsNotAvailableFromPersistence
{
  -[MXClientUtil _persistClientAvailabilityWithAvailability:](self, "_persistClientAvailabilityWithAvailability:", 0);
}

- (void)_persistClientAvailabilityWithAvailability:(BOOL)a3
{
  const void *v3;
  const __CFString *v4;

  v3 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSetValue(CFSTR("MXClientsAvailable"), v3, CFSTR("com.apple.metrickitd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD588]);
  CFPreferencesSynchronize(CFSTR("com.apple.metrickitd"), CFSTR("mobile"), v4);
  _CFPreferencesFlushCachesForIdentifier();
  _CFPreferencesFlushCachesForIdentifier();
}

- (void)_persistTeamIDsDictionary
{
  NSUserDefaults *userDefaults;
  id v3;

  userDefaults = self->_userDefaults;
  -[MXClientUtil clientTeamIDs](self, "clientTeamIDs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v3, CFSTR("MXClientTeamID"));

}

- (void)_randomReportClientRegistrationForBundleID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((int)arc4random_uniform(0x64u) <= 9)
  {
    v4 = v3;
    AnalyticsSendEventLazy();

  }
}

id __59__MXClientUtil__randomReportClientRegistrationForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("bundleID");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setClientDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_clientDictionary, a3);
}

- (NSDictionary)clientTeamIDs
{
  return self->_clientTeamIDs;
}

- (void)setClientTeamIDs:(id)a3
{
  objc_storeStrong((id *)&self->_clientTeamIDs, a3);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_clientTeamIDs, 0);
  objc_storeStrong((id *)&self->_clientDictionary, 0);
}

- (void)removeClientFromPersistenceForBundleID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21E837000, a2, a3, "removing Application: %@ from clients", a5, a6, a7, a8, 2u);
}

- (void)_hasClientInClientDictionary
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E837000, log, OS_LOG_TYPE_DEBUG, "Client Dictionary count > 0", v1, 2u);
}

@end
