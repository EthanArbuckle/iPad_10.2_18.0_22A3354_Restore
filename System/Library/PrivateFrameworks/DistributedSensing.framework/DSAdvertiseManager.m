@implementation DSAdvertiseManager

- (void)startAdvertising
{
  NSObject *v3;
  CBAdvertiser *v4;
  CBAdvertiser *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  CBAdvertiser *v13;
  DSAdvertiseManager *v14;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSAdvertiseManager != -1)
    dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
  v3 = logObjDSAdvertiseManager;
  if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Start Advertising", buf, 2u);
  }
  v4 = self->_bleAdvertiser;
  if (v4)
    goto LABEL_12;
  v4 = (CBAdvertiser *)objc_alloc_init(MEMORY[0x24BDBB218]);
  -[CBAdvertiser setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
  if (-[DSAdvertiseManager _getAdvertisementFields](self, "_getAdvertisementFields"))
  {
    -[DSAdvertiseManager _setDSInfoFieldsInAdvertiser:](self, "_setDSInfoFieldsInAdvertiser:", v4);
    -[DSAdvertiseManager _setDSActionFieldsInAdvertiser:](self, "_setDSActionFieldsInAdvertiser:", v4);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __38__DSAdvertiseManager_startAdvertising__block_invoke;
    v12 = &unk_24D910C68;
    v5 = v4;
    v13 = v5;
    v14 = self;
    -[CBAdvertiser activateWithCompletion:](v5, "activateWithCompletion:", &v9);
    objc_storeStrong((id *)&self->_bleAdvertiser, v4);
    if (onceTokenDSAdvertiseManager != -1)
      dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
    v6 = logObjDSAdvertiseManager;
    if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "Starting Advertiser", buf, 2u);
    }

    v4 = v5;
LABEL_12:
    if (-[DSAdvertiseManager _getAdvertisementFields](self, "_getAdvertisementFields", v9, v10, v11, v12))
    {
      -[DSAdvertiseManager _setDSInfoFieldsInAdvertiser:](self, "_setDSInfoFieldsInAdvertiser:", v4);
      -[DSAdvertiseManager _setDSActionFieldsInAdvertiser:](self, "_setDSActionFieldsInAdvertiser:", v4);
    }
    else
    {
      if (onceTokenDSAdvertiseManager != -1)
        dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
      v7 = logObjDSAdvertiseManager;
      if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "Advertisement fields not set", buf, 2u);
      }
      -[DSAdvertiseManager stopAdvertising](self, "stopAdvertising");
    }
    goto LABEL_19;
  }
  if (onceTokenDSAdvertiseManager != -1)
    dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
  v8 = logObjDSAdvertiseManager;
  if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_DEFAULT, "Advertisement fields not set", buf, 2u);
  }
LABEL_19:

}

void __38__DSAdvertiseManager_startAdvertising__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
  {
    if (v3)
    {
      if (onceTokenDSAdvertiseManager != -1)
        dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
      v5 = logObjDSAdvertiseManager;
      if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E3C000, v5, OS_LOG_TYPE_ERROR, "Failed to activate CBAdvertiser", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
    }
    else
    {
      if (onceTokenDSAdvertiseManager != -1)
        dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
      v6 = logObjDSAdvertiseManager;
      if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, "CBAdvertiser Activated", v7, 2u);
      }
    }
  }

}

- (BOOL)_getAdvertisementFields
{
  void *v3;
  void *v4;
  unsigned int v5;
  unint64_t v6;
  int v7;
  unsigned __int8 v8;
  int v9;
  unsigned __int8 v10;
  char v11;

  -[DSXPCServer myDeviceContext](self->_xpcDaemonServer, "myDeviceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "coordinationStatus");
    v6 = 0x100802040100uLL >> (8 * v5);
    if (v5 >= 6)
      LOBYTE(v6) = 0;
    self->_cbDSActionFlags = v6;
    self->_cbTieBreaker = objc_msgSend(v4, "tiebreaker");
    v7 = objc_msgSend(v4, "vehicleState");
    if (v7 == 2)
      v8 = 2;
    else
      v8 = v7 == 1;
    self->_cbVehicleState = v8;
    v9 = objc_msgSend(v4, "vehicleConfidence");
    if (v9 == 15)
      v10 = 15;
    else
      v10 = 0;
    if (v9 == 11)
      v10 = 11;
    if (v9 == 7)
      v11 = 7;
    else
      v11 = 0;
    if (v9 == 4)
      v11 = 4;
    if (v9 <= 10)
      v10 = v11;
    self->_cbVehicleConfidence = v10;
  }

  return v4 != 0;
}

- (void)_setDSActionFieldsInAdvertiser:(id)a3
{
  uint64_t cbTieBreaker;
  uint64_t v4;

  if ((self->_dsAdvertiseFlags & 4) != 0)
  {
    objc_msgSend(a3, "setDsActionFlags:", self->_cbDSActionFlags);
    cbTieBreaker = self->_cbTieBreaker;
    v4 = 54;
  }
  else
  {
    objc_msgSend(a3, "setDsActionFlags:", 0);
    cbTieBreaker = 0;
    v4 = 0;
  }
  objc_msgSend(a3, "setDsActionTieBreaker:", cbTieBreaker);
  objc_msgSend(a3, "setNearbyActionType:", v4);

}

- (void)_setDSInfoFieldsInAdvertiser:(id)a3
{
  uint64_t cbVehicleConfidence;

  if ((self->_dsAdvertiseFlags & 2) != 0)
  {
    objc_msgSend(a3, "setDsInfoVehicleState:", self->_cbVehicleState);
    cbVehicleConfidence = self->_cbVehicleConfidence;
  }
  else
  {
    objc_msgSend(a3, "setDsInfoVehicleState:", 0);
    cbVehicleConfidence = 0;
  }
  objc_msgSend(a3, "setDsInfoVehicleConfidence:", cbVehicleConfidence);

}

- (void)stopAdvertising
{
  NSObject *v3;
  CBAdvertiser *bleAdvertiser;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSAdvertiseManager != -1)
    dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
  v3 = logObjDSAdvertiseManager;
  if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Stop Advertising", v5, 2u);
  }
  -[CBAdvertiser invalidate](self->_bleAdvertiser, "invalidate");
  bleAdvertiser = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (DSXPCServer)xpcDaemonServer
{
  return self->_xpcDaemonServer;
}

- (void)setXpcDaemonServer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcDaemonServer, a3);
}

- (unint64_t)dsAdvertiseFlags
{
  return self->_dsAdvertiseFlags;
}

- (void)setDsAdvertiseFlags:(unint64_t)a3
{
  self->_dsAdvertiseFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcDaemonServer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

@end
