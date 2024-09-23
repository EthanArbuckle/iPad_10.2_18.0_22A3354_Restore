@implementation _CNDonationAgentLogger

- (_CNDonationAgentLogger)init
{
  _CNDonationAgentLogger *v2;
  os_log_t v3;
  OS_os_log *log_t;
  _CNDonationAgentLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNDonationAgentLogger;
  v2 = -[_CNDonationAgentLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts.donation", "agent");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)agentWillStart
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "will start agent", v3, 2u);
  }

}

- (void)agentDidStart
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "did start agent", v3, 2u);
  }

}

- (void)agentWillStop
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "will stop agent", v3, 2u);
  }

}

- (void)donationServiceWillStart
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "will start donation service", v3, 2u);
  }

}

- (void)donationServiceDidStart
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "did start donation service", v3, 2u);
  }

}

- (void)donationServiceWillStop
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "will stop donation service", v3, 2u);
  }

}

- (void)maintenanceServiceWillStart
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "will start maintenance service", v3, 2u);
  }

}

- (void)maintenanceServiceDidStart
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "did start maintenance service", v3, 2u);
  }

}

- (void)maintenanceServiceWillStop
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "maintenance service stopping", v3, 2u);
  }

}

- (void)beginRestorePersistedState
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "will restore persisted state", v3, 2u);
  }

}

- (void)endRestorePersistedState
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "did restore persisted state", v3, 2u);
  }

}

- (void)acceptingConnectionFromProcess:(int)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_DEFAULT, "Accepting connection from process %d", (uint8_t *)v5, 8u);
  }

}

- (void)denyingRequestFromProcess:(int)a3
{
  NSObject *v4;

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger denyingRequestFromProcess:].cold.1(a3, v4);

}

- (void)acceptingDonations:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    *(_QWORD *)&v6 = 138543362;
    v12 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[_CNDonationAgentLogger log_t](self, "log_t", v12);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          v18 = v10;
          _os_log_impl(&dword_209C22000, v11, OS_LOG_TYPE_DEFAULT, "Accepting donation: %{public}@", buf, 0xCu);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

}

- (void)preExpiredDonations:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    *(_QWORD *)&v6 = 138412290;
    v12 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[_CNDonationAgentLogger log_t](self, "log_t", v12);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v12;
          v18 = v10;
          _os_log_error_impl(&dword_209C22000, v11, OS_LOG_TYPE_ERROR, "Donation (%@) already expired. Asking the extension to renew. In the future, this value will not be persisted and you will not be asked to renew it.", buf, 0xCu);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

}

- (void)agentWillHandleRequest:(SEL)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_DEFAULT, "Will handle request: %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)agentDidHandleRequest:(SEL)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_DEFAULT, "Did handle request: %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)featureNotEnabled:(SEL)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_DEFAULT, "Could not handle request because feature not enabled: %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)featureWillDisable
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Will disable feature", v3, 2u);
  }

}

- (void)featureDidDisable
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Did disable feature", v3, 2u);
  }

}

- (void)featureWillEnable
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Will enable feature", v3, 2u);
  }

}

- (void)featureDidEnable
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Did enable feature", v3, 2u);
  }

}

- (void)contactsChangedNotificationFoundName:(BOOL)a3 nameChanged:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a4;
  v5 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109376;
    v7[1] = v5;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_209C22000, v6, OS_LOG_TYPE_INFO, "Notified of contacts change. Found name: %u. Changed name: %u.", (uint8_t *)v7, 0xEu);
  }

}

- (void)contactsChangedNotificationEmailAddressesChanged:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_INFO, "Notified of contacts change. Email addresses changed: %u.", (uint8_t *)v5, 8u);
  }

}

- (void)willDiscoverExtensions
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Will discover extensions", v3, 2u);
  }

}

- (void)didDiscoverExtension:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_INFO, "Did discover extension: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)didDiscoverUnexpectedExtensionType:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger didDiscoverUnexpectedExtensionType:].cold.1();

}

- (void)didDiscoverExtensions
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Did discover extensions", v3, 2u);
  }

}

- (void)didFailToDiscoverExtensions:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger didFailToDiscoverExtensions:].cold.1();

}

- (void)willLoadExtensionVersions
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_INFO, "Will load extension versions", v3, 2u);
  }

}

- (void)willSaveExtensionVersions
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_INFO, "Will save extension versions", v3, 2u);
  }

}

- (void)willRejectDonationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_INFO, "Will reject donation with identifier '%{public}@'", (uint8_t *)&v6, 0xCu);
  }

}

- (void)didRejectDonationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_INFO, "Did reject donation with identifier '%{public}@'", (uint8_t *)&v6, 0xCu);
  }

}

- (void)couldNotRejectUnknownDonationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger couldNotRejectUnknownDonationIdentifier:].cold.1();

}

- (void)couldNotRejectDonationIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger couldNotRejectDonationIdentifier:error:].cold.1();

}

- (void)willRejectClusterIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_INFO, "Will reject donations with cluster identifier '%@'", (uint8_t *)&v6, 0xCu);
  }

}

- (void)didRejectClusterIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_INFO, "Will reject donations with cluster identifier '%@'", (uint8_t *)&v6, 0xCu);
  }

}

- (void)couldNotRejectUnknownClusterIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_INFO, "Could not reject cluster with unknown identifier '%@'", (uint8_t *)&v6, 0xCu);
  }

}

- (void)couldNotRejectClusterIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger couldNotRejectClusterIdentifier:error:].cold.1();

}

- (void)willListRejections
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_INFO, "Will list rejections", v3, 2u);
  }

}

- (void)didListRejections
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_INFO, "Did list rejections", v3, 2u);
  }

}

- (void)willRemoveAllRejections
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_INFO, "Will remove all rejections", v3, 2u);
  }

}

- (void)didRemoveAllRejections
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAgentLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_INFO, "Did remove all rejections", v3, 2u);
  }

}

- (void)foundUnhashableValue:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger foundUnhashableValue:].cold.1();

}

- (void)couldNotRenewBecauseDonorError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger couldNotRenewBecauseDonorError:].cold.1();

}

- (void)couldNotRenewBecauseLoadingError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger couldNotRenewBecauseLoadingError:].cold.1();

}

- (void)couldNotRenewBecauseNotADonorExtension:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAgentLogger couldNotRenewBecauseNotADonorExtension:].cold.1();

}

- (void)didRenewValue:(id)a3 untilDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_CNDonationAgentLogger log_t](self, "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "origin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "donationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_209C22000, v8, OS_LOG_TYPE_DEFAULT, "Donation %{public}@ has been renewed until %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)willRenewValues:(id)a3 withDonor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v19;
    *(_QWORD *)&v9 = 138543618;
    v17 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        -[_CNDonationAgentLogger log_t](self, "log_t", v17);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "origin");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "donationIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v17;
          v23 = v16;
          v24 = 2114;
          v25 = v7;
          _os_log_impl(&dword_209C22000, v14, OS_LOG_TYPE_DEFAULT, "Will renew donation %{public}@ with donor %{public}@", buf, 0x16u);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v10);
  }

}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log_t, 0);
}

- (void)denyingRequestFromProcess:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_209C22000, a2, OS_LOG_TYPE_ERROR, "Denying request lacking authorization from process %d", (uint8_t *)v2, 8u);
}

- (void)didDiscoverUnexpectedExtensionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_209C22000, v0, v1, "Did discover extension: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didFailToDiscoverExtensions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_209C22000, v0, v1, "Failed to discover extensions: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)couldNotRejectUnknownDonationIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_209C22000, v0, v1, "Could not reject donation with unknown identifier '%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)couldNotRejectDonationIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_209C22000, v0, v1, "Could not reject donation identifier '%{public}@': %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)couldNotRejectClusterIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_209C22000, v0, v1, "Could not reject cluster identifier '%{public}@': %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)foundUnhashableValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_209C22000, v0, v1, "Blacklisting an unhashable value: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)couldNotRenewBecauseDonorError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_209C22000, v0, v1, "Could not renew donation because the donor extension returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)couldNotRenewBecauseLoadingError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_209C22000, v0, v1, "Could not renew donation because there was an error loading the donor extension: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)couldNotRenewBecauseNotADonorExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_209C22000, v0, v1, "Could not renew donation because this isn’t a donor extension: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
