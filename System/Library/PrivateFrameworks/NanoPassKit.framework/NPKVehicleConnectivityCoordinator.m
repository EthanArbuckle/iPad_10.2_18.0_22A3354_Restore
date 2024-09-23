@implementation NPKVehicleConnectivityCoordinator

- (NPKVehicleConnectivityCoordinator)init
{
  void *v3;
  NPKVehicleConnectivityCoordinator *v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NPKVehicleConnectivityCoordinator initWithDistributedNotificationCenter:](self, "initWithDistributedNotificationCenter:", v3);

  return v4;
}

- (NPKVehicleConnectivityCoordinator)initWithDistributedNotificationCenter:(id)a3
{
  id v5;
  NPKVehicleConnectivityCoordinator *v6;
  NPKVehicleConnectivityCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKVehicleConnectivityCoordinator;
  v6 = -[NPKVehicleConnectivityCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_distributedNotificationCenter, a3);
    -[NPKVehicleConnectivityCoordinator _registerObservers](v7, "_registerObservers");
  }

  return v7;
}

- (BOOL)isVehicleConnectedForPass:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  char *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  char *v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!objc_msgSend(v3, "isCarKeyPass") || (objc_msgSend(v3, "npkSupportsBluetooth") & 1) == 0)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v20 = "-[NPKVehicleConnectivityCoordinator isVehicleConnectedForPass:]";
        v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKVehicleConnectivityCoordinator.m";
        v23 = 2048;
        v24 = 43;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to check vehicle connected state for any pass other than UWB capable car keys!)", buf, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v18 = 0;
  objc_msgSend((id)PKGetClassNFDigitalCarKeySession(), "getVehicleReports:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (char *)v18;
  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "_subcredentialIdentifierForPass:", v3);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = v12 != 0;
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "uniqueID");
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Vehicle report for pass %@ is %@", buf, 0x16u);

      }
    }

    goto LABEL_18;
  }
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: NPKVehicleConnectivityCoordinator: Unable to fetch vehicle report! %@", buf, 0xCu);
    }
    LOBYTE(v10) = 0;
LABEL_18:

  }
  return v10;
}

- (void)_registerObservers
{
  -[NSDistributedNotificationCenter addObserver:selector:name:object:](self->_distributedNotificationCenter, "addObserver:selector:name:object:", self, sel__handleCarKeyVehicleConnectedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.connect"), 0);
  -[NSDistributedNotificationCenter addObserver:selector:name:object:](self->_distributedNotificationCenter, "addObserver:selector:name:object:", self, sel__handleCarKeyVehicleDisconnectedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.disconnect"), 0);
}

- (void)_handleCarKeyVehicleConnectedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  -[NPKVehicleConnectivityCoordinator _parseVehicleConnectivityChangeNotificationObject:outApplicationIdentifier:outSubcredentialIdentifier:](self, "_parseVehicleConnectivityChangeNotificationObject:outApplicationIdentifier:outSubcredentialIdentifier:", v5, &v16, &v15);
  v6 = v16;
  v7 = v15;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v4;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Received car key vehicle connected notification: %@ for AID: %@ subcredential ID: %@", buf, 0x20u);
    }

  }
  objc_msgSend((id)objc_opt_class(), "_secureElementPassMatchingAID:subcredentialIdentifier:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NPKVehicleConnectivityCoordinator delegate](self, "delegate");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject vehicleConnectivityCoordinator:didBecomeConnectedToVehicleCorrespondingToPass:](v12, "vehicleConnectivityCoordinator:didBecomeConnectedToVehicleCorrespondingToPass:", self, v11);
  }
  else
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (!v14)
      goto LABEL_8;
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Unable to identify pass for subcredential: %@", buf, 0xCu);
    }
  }

LABEL_8:
}

- (void)_handleCarKeyVehicleDisconnectedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  -[NPKVehicleConnectivityCoordinator _parseVehicleConnectivityChangeNotificationObject:outApplicationIdentifier:outSubcredentialIdentifier:](self, "_parseVehicleConnectivityChangeNotificationObject:outApplicationIdentifier:outSubcredentialIdentifier:", v5, &v16, &v15);
  v6 = v16;
  v7 = v15;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v4;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Received car key vehicle disconnected notification: %@ for AID: %@ subcredential ID: %@", buf, 0x20u);
    }

  }
  objc_msgSend((id)objc_opt_class(), "_secureElementPassMatchingAID:subcredentialIdentifier:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NPKVehicleConnectivityCoordinator delegate](self, "delegate");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject vehicleConnectivityCoordinator:didBecomeDisconnectedFromVehicleCorrespondingToPass:](v12, "vehicleConnectivityCoordinator:didBecomeDisconnectedFromVehicleCorrespondingToPass:", self, v11);
  }
  else
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (!v14)
      goto LABEL_8;
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKVehicleConnectivityCoordinator: Unable to identify pass for subcredential: %@", buf, 0xCu);
    }
  }

LABEL_8:
}

- (void)_parseVehicleConnectivityChangeNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outSubcredentialIdentifier:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint8_t v13[16];

  v7 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 2)
    {
      objc_msgSend(v8, "lastObject");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v9;

    }
    else
    {
      *a5 = 0;
    }

  }
  else
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Expected to be provided a notification object, but instead found nil!", v13, 2u);
      }

    }
  }

}

+ (id)_secureElementPassMatchingAID:(id)a3 subcredentialIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  id v18;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passesOfType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __91__NPKVehicleConnectivityCoordinator__secureElementPassMatchingAID_subcredentialIdentifier___block_invoke;
  v16 = &unk_24CFE78A8;
  v17 = v5;
  v18 = a1;
  v8 = v5;
  objc_msgSend(v7, "pk_objectsPassingTest:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secureElementPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __91__NPKVehicleConnectivityCoordinator__secureElementPassMatchingAID_subcredentialIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = *(void **)(a1 + 40);
  objc_msgSend(a2, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_subcredentialIdentifierForPass:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));
  *a4 = v9;

  return v9;
}

+ (id)_subcredentialIdentifierForPass:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "secureElementPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devicePrimaryContactlessPaymentApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "subcredentials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NPKVehicleConnectivityCoordinatorDelegate)delegate
{
  return (NPKVehicleConnectivityCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
}

@end
