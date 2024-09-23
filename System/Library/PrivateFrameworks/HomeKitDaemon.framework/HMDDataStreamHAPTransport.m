@implementation HMDDataStreamHAPTransport

- (HMDDataStreamHAPTransport)initWithAccessory:(id)a3 sessionIdentifier:(int64_t)a4 maxControllerTransportMTU:(unint64_t)a5 workQueue:(id)a6 logIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  HMDDataStreamHAPTransport *v15;
  HMDDataStreamHAPTransport *v16;
  uint64_t v17;
  NSNumber *sessionIdentifier;
  uint64_t v19;
  HMDDataStreamFrameReader *byteReader;
  uint64_t v21;
  NSString *logIdentifier;
  uint64_t v23;
  NSMutableArray *pendingWrites;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *notificationClientIdentifier;
  objc_super v31;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v31.receiver = self;
  v31.super_class = (Class)HMDDataStreamHAPTransport;
  v15 = -[HMDDataStreamHAPTransport init](&v31, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a6);
    objc_storeWeak((id *)&v16->_accessory, v12);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v17 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v16->_sessionIdentifier;
    v16->_sessionIdentifier = (NSNumber *)v17;

    v16->_maxControllerTransportMTU = a5;
    v19 = objc_opt_new();
    byteReader = v16->_byteReader;
    v16->_byteReader = (HMDDataStreamFrameReader *)v19;

    v21 = objc_msgSend(v14, "copy");
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    pendingWrites = v16->_pendingWrites;
    v16->_pendingWrites = (NSMutableArray *)v23;

    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@.HMDDataStreamHAPTransport.%@"), CFSTR("com.apple.HomeKitDaemon"), v27);
    v28 = objc_claimAutoreleasedReturnValue();
    notificationClientIdentifier = v16->_notificationClientIdentifier;
    v16->_notificationClientIdentifier = (NSString *)v28;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HMDDataStreamHAPTransport;
  -[HMDDataStreamHAPTransport dealloc](&v2, sel_dealloc);
}

- (BOOL)_isRunning
{
  void *v2;
  BOOL v3;

  -[HMDDataStreamHAPTransport transportCharacteristic](self, "transportCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)connect
{
  void *v3;
  HMDDataStreamHAPTransport *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDDataStreamHAPTransport *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDDataStreamHAPTransport *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDDataStreamHAPTransport *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (-[HMDDataStreamHAPTransport _isRunning](self, "_isRunning"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Connect called on an already-running transport", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    -[HMDDataStreamHAPTransport accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "findCharacteristicType:forServiceType:", CFSTR("00000138-0000-1000-8000-0026BB765291"), CFSTR("00000129-0000-1000-8000-0026BB765291"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "findCharacteristicType:forServiceType:", CFSTR("00000139-0000-1000-8000-0026BB765291"), CFSTR("00000129-0000-1000-8000-0026BB765291"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x227676638]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v10)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 138543362;
            v27 = v15;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Connect] All good; connected!",
              (uint8_t *)&v26,
              0xCu);

          }
          objc_autoreleasePoolPop(v11);
          -[HMDDataStreamHAPTransport setTransportCharacteristic:](v12, "setTransportCharacteristic:", v9);
          -[HMDDataStreamHAPTransport setInterruptCharacteristic:](v12, "setInterruptCharacteristic:", v10);
          -[HMDDataStreamHAPTransport _registerForMessages](v12, "_registerForMessages");
          -[HMDDataStreamHAPTransport _notifyDelegateDidOpen](v12, "_notifyDelegateDidOpen");
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 138543362;
            v27 = v24;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Connect] Missing characteristics to create transport for HDS over HAP (Interrupt Characteristic does not exist)", (uint8_t *)&v26, 0xCu);

          }
          objc_autoreleasePoolPop(v11);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamHAPTransport _teardownSessionWithError:](v12, "_teardownSessionWithError:", v25);

          v10 = 0;
        }
      }
      else
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543362;
          v27 = v23;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Connect] Missing characteristics to create transport for HDS over HAP (Transport Characteristic does not exist)", (uint8_t *)&v26, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamHAPTransport _teardownSessionWithError:](v21, "_teardownSessionWithError:", v10);
      }

    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Connect called but accessory is no longer valid", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1011);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamHAPTransport _teardownSessionWithError:](v17, "_teardownSessionWithError:", v9);
    }

  }
}

- (void)close
{
  _BOOL4 v3;
  void *v4;
  HMDDataStreamHAPTransport *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDDataStreamHAPTransport _isRunning](self, "_isRunning");
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@DataStream transport closing.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDDataStreamHAPTransport _teardownSessionWithError:](v5, "_teardownSessionWithError:", 0);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket invoked closed but nothing to clean up.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)_stopWithError:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (-[HMDDataStreamHAPTransport _isRunning](self, "_isRunning"))
    -[HMDDataStreamHAPTransport _deregisterForMessages](self, "_deregisterForMessages");
  -[HMDDataStreamHAPTransport setTransportCharacteristic:](self, "setTransportCharacteristic:", 0);
  -[HMDDataStreamHAPTransport setInterruptCharacteristic:](self, "setInterruptCharacteristic:", 0);
  v5 = v4;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1061);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HMDDataStreamHAPTransport _cancelAllPendingWritesWithError:](self, "_cancelAllPendingWritesWithError:", v5);
  -[HMDDataStreamHAPTransport setIsWriteInProgress:](self, "setIsWriteInProgress:", 0);
  if (v6)
    -[HMDDataStreamHAPTransport _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", v6);
  else
    -[HMDDataStreamHAPTransport _notifyDelegateDidClose](self, "_notifyDelegateDidClose");

}

- (void)_teardownSessionWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HMDDataStreamHAPTransport *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  void *v16;
  _BYTE location[12];
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDDataStreamHAPTransport _isRunning](self, "_isRunning"))
  {
    v15 = 0;
    -[HMDDataStreamHAPTransport _buildWriteRequestWithError:shouldForceClose:](self, "_buildWriteRequestWithError:shouldForceClose:", &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    if (v5)
    {
      objc_initWeak((id *)location, self);
      v16 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __55__HMDDataStreamHAPTransport__teardownSessionWithError___block_invoke;
      v12[3] = &unk_24E79AE08;
      objc_copyWeak(&v14, (id *)location);
      v13 = v4;
      -[HMDDataStreamHAPTransport _writeCharacteristicRequests:completion:](self, "_writeCharacteristicRequests:completion:", v7, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v11;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: Closing after session force close failed; error=%@",
          location,
          0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDDataStreamHAPTransport _stopWithError:](v9, "_stopWithError:", v4);

    }
  }
  else
  {
    -[HMDDataStreamHAPTransport _stopWithError:](self, "_stopWithError:", v4);
  }

}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[HMDDataStreamHAPTransport accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleCharacteristicsValueUpdated_, CFSTR("HMDNotificationCharacteristicValueUpdated"), v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleCharacteristicsValueUpdated_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v3);

  -[HMDDataStreamHAPTransport interruptCharacteristic](self, "interruptCharacteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamHAPTransport notificationClientIdentifier](self, "notificationClientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v7, v8);

}

- (void)_deregisterForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDDataStreamHAPTransport *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HMDDataStreamHAPTransport accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDDataStreamHAPTransport interruptCharacteristic](self, "interruptCharacteristic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamHAPTransport notificationClientIdentifier](self, "notificationClientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v6, v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error: unable to deregister from event notifications on accessory (its weak pointer went to nil)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_notifyDelegateDidOpen
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDDataStreamHAPTransport workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDDataStreamHAPTransport__notifyDelegateDidOpen__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_notifyDelegateDidClose
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDDataStreamHAPTransport workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDDataStreamHAPTransport__notifyDelegateDidClose__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_notifyDelegateDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDDataStreamHAPTransport workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDDataStreamHAPTransport__notifyDelegateDidFailWithError___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_notifyDelegateDidReceiveFrame:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDDataStreamHAPTransport workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__HMDDataStreamHAPTransport__notifyDelegateDidReceiveFrame___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sendRawFrame:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDataStreamHAPPendingWrite *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[HMDDataStreamHAPPendingWrite initWithData:completion:]([HMDDataStreamHAPPendingWrite alloc], "initWithData:completion:", v7, v6);

  -[HMDDataStreamHAPTransport pendingWrites](self, "pendingWrites");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  -[HMDDataStreamHAPTransport _doNextWriteOperation](self, "_doNextWriteOperation");
}

- (id)_getPendingWritesUpToLength:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDDataStreamHAPTransport pendingWrites](self, "pendingWrites", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "popNextFrameUpToMaxLength:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "length"))
          goto LABEL_13;
        if (v7)
        {
          v12 = v7;
LABEL_11:
          objc_msgSend(v12, "appendData:", v11);
          goto LABEL_12;
        }
        if (v8)
        {
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v12;
          goto LABEL_11;
        }
        v8 = v11;
        v7 = 0;
LABEL_12:
        a3 -= objc_msgSend(v11, "length");
        if (!a3)
        {

          goto LABEL_20;
        }
LABEL_13:

        ++v10;
      }
      while (v6 != v10);
      v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v13;
      if (!v13)
        goto LABEL_20;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_20:

  if (v7)
    v14 = v7;
  else
    v14 = v8;
  v15 = v14;

  return v15;
}

- (id)_buildWriteRequestWithError:(id *)a3 shouldForceClose:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDDataStreamHAPTransport *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  HMDDataStreamHAPTransport *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v7 = 0;
    goto LABEL_5;
  }
  -[HMDDataStreamHAPTransport _getPendingWritesUpToLength:](self, "_getPendingWritesUpToLength:", -[HMDDataStreamHAPTransport maxControllerTransportMTU](self, "maxControllerTransportMTU"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length")
    || -[HMDDataStreamHAPTransport lastAccessoryRequestToSendFlag](self, "lastAccessoryRequestToSendFlag"))
  {
LABEL_5:
    v8 = objc_alloc(MEMORY[0x24BE1BC28]);
    -[HMDDataStreamHAPTransport sessionIdentifier](self, "sessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithValue:", v9);

    if (v4)
    {
      v11 = objc_alloc(MEMORY[0x24BE1BC28]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithValue:", v12);

    }
    else
    {
      v13 = 0;
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BA90]), "initWithPayload:sessionIdentifier:forceClose:", v7, v10, v13);
    objc_msgSend(v14, "serializeWithError:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *a3;
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Error: failed to serialize Controller Payload; should not happen!",
          (uint8_t *)&v30,
          0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v22 = 0;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v23;
        v32 = 1024;
        v33 = objc_msgSend(v7, "length");
        v34 = 1024;
        v35 = -[HMDDataStreamHAPTransport lastAccessoryRequestToSendFlag](v18, "lastAccessoryRequestToSendFlag");
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Writing: %u bytes (rts=%d)", (uint8_t *)&v30, 0x18u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDDataStreamHAPTransport transportCharacteristic](v18, "transportCharacteristic");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v24, v15, 0, 0, 0, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_16;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543362;
    v31 = v29;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Writing: nothing to write", (uint8_t *)&v30, 0xCu);

  }
  objc_autoreleasePoolPop(v26);
  v22 = 0;
LABEL_16:

  return v22;
}

- (void)_writeCharacteristicRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HMDDataStreamHAPTransport accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__HMDDataStreamHAPTransport__writeCharacteristicRequests_completion___block_invoke;
  v13[3] = &unk_24E796990;
  v14 = v6;
  v15 = v7;
  v13[4] = self;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "writeCharacteristicValues:source:identifier:qualityOfService:withCompletionHandler:", v11, 7, v10, -1, v13);

}

- (void)_doNextWriteOperation
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDDataStreamHAPTransport *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDDataStreamHAPTransport *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDDataStreamHAPTransport *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!-[HMDDataStreamHAPTransport isWriteInProgress](self, "isWriteInProgress"))
  {
    -[HMDDataStreamHAPTransport pendingWrites](self, "pendingWrites");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hmf_isEmpty"))
    {
      v4 = -[HMDDataStreamHAPTransport lastAccessoryRequestToSendFlag](self, "lastAccessoryRequestToSendFlag");

      if (!v4)
        return;
    }
    else
    {

    }
    if (-[HMDDataStreamHAPTransport _isRunning](self, "_isRunning"))
    {
      -[HMDDataStreamHAPTransport accessory](self, "accessory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[HMDDataStreamHAPTransport setIsWriteInProgress:](self, "setIsWriteInProgress:", 1);
        v24 = 0;
        -[HMDDataStreamHAPTransport _buildWriteRequestWithError:shouldForceClose:](self, "_buildWriteRequestWithError:shouldForceClose:", &v24, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v24;
        if (v7)
        {
          v8 = (void *)MEMORY[0x227676638]();
          v9 = self;
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v27 = v11;
            _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: building next payload failed and should not do that; closing.",
              buf,
              0xCu);

          }
          objc_autoreleasePoolPop(v8);
          objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 1052, v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamHAPTransport _stopTransportForWriteFailureError:](v9, "_stopTransportForWriteFailureError:", v12);

        }
        else if (v6)
        {
          objc_initWeak((id *)buf, self);
          v25 = v6;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __50__HMDDataStreamHAPTransport__doNextWriteOperation__block_invoke;
          v22[3] = &unk_24E79ADC0;
          objc_copyWeak(&v23, (id *)buf);
          -[HMDDataStreamHAPTransport _writeCharacteristicRequests:completion:](self, "_writeCharacteristicRequests:completion:", v21, v22);

          objc_destroyWeak(&v23);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          -[HMDDataStreamHAPTransport _removeAndMarkCompleteAllCompletedWrites](self, "_removeAndMarkCompleteAllCompletedWrites");
          -[HMDDataStreamHAPTransport _doNextWriteOperation](self, "_doNextWriteOperation");
        }

      }
      else
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v20;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: HAPAccessory is no longer active; closing.",
            buf,
            0xCu);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2100);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamHAPTransport _stopTransportForWriteFailureError:](v18, "_stopTransportForWriteFailureError:", v7);
      }

    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: transport already closed.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1061);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamHAPTransport _cancelAllPendingWritesWithError:](v14, "_cancelAllPendingWritesWithError:", v5);
    }

  }
}

- (void)_handleCompletionWithResponseTuples:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMDDataStreamHAPTransport *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMDDataStreamHAPTransport *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDDataStreamHAPTransport *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDDataStreamHAPTransport *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  HMDDataStreamHAPTransport *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDDataStreamHAPTransport isWriteInProgress](self, "isWriteInProgress");
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v10;
      v58 = 2112;
      v59 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[Transport] Handling responses: %@", buf, 0x16u);

    }
    v49 = v7;

    objc_autoreleasePoolPop(v6);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v48 = v4;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v52;
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v15);
        objc_msgSend(v16, "request");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "characteristic");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("00000138-0000-1000-8000-0026BB765291"));

        if ((v20 & 1) != 0)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          if (v13)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v22 = v16;

      if (!v22)
        goto LABEL_21;
      objc_msgSend(v22, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = v49;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "error");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v27;
          v58 = 2112;
          v59 = v28;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write response errored out: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(v22, "error");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamHAPTransport _stopTransportForWriteFailureError:](v25, "_stopTransportForWriteFailureError:", v29);

        goto LABEL_24;
      }
      v34 = (void *)MEMORY[0x24BE1BA88];
      objc_msgSend(v22, "value");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      objc_msgSend(v34, "parsedFromData:error:", v35, &v50);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v50;

      if (v37 || !v36)
      {
        v41 = (void *)MEMORY[0x227676638]();
        v42 = v49;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        v4 = v48;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v44;
          v58 = 2112;
          v59 = v37;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply could not be parsed (error=%@)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v41);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 50);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamHAPTransport _stopTransportForWriteFailureError:](v42, "_stopTransportForWriteFailureError:", v45);

      }
      else
      {
        objc_msgSend(v36, "accessoryRequestToSend");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v48;
        if (v38)
        {
          objc_msgSend(v36, "accessoryRequestToSend");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "value");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamHAPTransport setLastAccessoryRequestToSendFlag:](v49, "setLastAccessoryRequestToSendFlag:", objc_msgSend(v40, "BOOLValue"));

        }
        else
        {
          -[HMDDataStreamHAPTransport setLastAccessoryRequestToSendFlag:](v49, "setLastAccessoryRequestToSendFlag:", 0);
        }
        -[HMDDataStreamHAPTransport _removeAndMarkCompleteAllCompletedWrites](v49, "_removeAndMarkCompleteAllCompletedWrites");
        objc_msgSend(v36, "payload");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(v36, "payload");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamHAPTransport _handleReceivedData:](v49, "_handleReceivedData:", v47);

        }
        -[HMDDataStreamHAPTransport _doNextWriteOperation](v49, "_doNextWriteOperation");
      }

    }
    else
    {
LABEL_12:

LABEL_21:
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v49;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v33;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write-response contained no response; weird. Erroring out.",
          buf,
          0xCu);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamHAPTransport _stopTransportForWriteFailureError:](v31, "_stopTransportForWriteFailureError:", v22);
LABEL_24:
      v4 = v48;
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v21;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write-response returned but nothing in progress; stale reply? Ignoring",
        buf,
        0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_stopTransportForWriteFailureError:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 1061, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamHAPTransport _teardownSessionWithError:](self, "_teardownSessionWithError:", v4);

}

- (void)_removeAndMarkCompleteAllCompletedWrites
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDDataStreamHAPTransport pendingWrites](self, "pendingWrites", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    goto LABEL_13;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  while (2)
  {
    v8 = 0;
    v9 = v6 + v5;
    do
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if (!objc_msgSend(v10, "isComplete"))
      {
        v9 = v6 + v8;
        goto LABEL_11;
      }
      -[HMDDataStreamHAPTransport _notifyWriteOperation:didCompleteWithError:](self, "_notifyWriteOperation:didCompleteWithError:", v10, 0);
      ++v8;
    }
    while (v5 != v8);
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    v6 = v9;
    if (v5)
      continue;
    break;
  }
LABEL_11:

  if (v9)
  {
    -[HMDDataStreamHAPTransport pendingWrites](self, "pendingWrites");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectsInRange:", 0, v9);
LABEL_13:

  }
  -[HMDDataStreamHAPTransport setIsWriteInProgress:](self, "setIsWriteInProgress:", 0);
}

- (void)_cancelAllPendingWritesWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDDataStreamHAPTransport pendingWrites](self, "pendingWrites", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[HMDDataStreamHAPTransport _notifyWriteOperation:didCompleteWithError:](self, "_notifyWriteOperation:didCompleteWithError:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[HMDDataStreamHAPTransport pendingWrites](self, "pendingWrites");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)_notifyWriteOperation:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "completion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamHAPTransport workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__HMDDataStreamHAPTransport__notifyWriteOperation_didCompleteWithError___block_invoke;
  v11[3] = &unk_24E79C2B8;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

}

- (void)_handleReceivedData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_data_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDDataStreamHAPTransport *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = objc_retainAutorelease(v4);
  v7 = dispatch_data_create((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 0, 0);
  -[HMDDataStreamHAPTransport byteReader](self, "byteReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushFrameData:", v7);

  -[HMDDataStreamHAPTransport byteReader](self, "byteReader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasFailed");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@DataStream has encountered irrecoverable framing issue. Closing stream.", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1052);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamHAPTransport _teardownSessionWithError:](v12, "_teardownSessionWithError:", v15);

  }
  else
  {
    -[HMDDataStreamHAPTransport byteReader](self, "byteReader");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasCompleteFrame");

    if (v17)
    {
      do
      {
        -[HMDDataStreamHAPTransport byteReader](self, "byteReader");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "popRawFrame");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          -[HMDDataStreamHAPTransport _notifyDelegateDidReceiveFrame:](self, "_notifyDelegateDidReceiveFrame:", v19);

        -[HMDDataStreamHAPTransport byteReader](self, "byteReader");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "hasCompleteFrame");

      }
      while ((v21 & 1) != 0);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_handleCharacteristicsValueUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDDataStreamHAPTransport *v9;

  v4 = a3;
  -[HMDDataStreamHAPTransport workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDDataStreamHAPTransport__handleCharacteristicsValueUpdated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleInterruptCharacteristicValue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  size_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  HMDDataStreamHAPTransport *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDDataStreamHAPTransport *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDDataStreamHAPTransport workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v29 = 0;
    objc_msgSend(MEMORY[0x24BE1BAA0], "parsedFromData:error:", v8, &v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v29;
    if (v10 || !v9)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v27;
        v32 = 2112;
        v33 = v10;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Interrupt] The interrupt value could not be parsed (error=%@)", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v9, "requestToSendIdentifiers");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (void *)objc_msgSend(v11, "bytes");

      objc_msgSend(v9, "requestToSendIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      -[HMDDataStreamHAPTransport sessionIdentifier](self, "sessionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");

      v17 = memchr(v12, v16, v14);
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v22;
          v32 = 1024;
          LODWORD(v33) = v16;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[Interrupt] The interrupt value contains valid accessory Request To Send (0x%x)", buf, 0x12u);

        }
        objc_autoreleasePoolPop(v18);
        -[HMDDataStreamHAPTransport setLastAccessoryRequestToSendFlag:](v19, "setLastAccessoryRequestToSendFlag:", 1);
        -[HMDDataStreamHAPTransport _doNextWriteOperation](v19, "_doNextWriteOperation");
        goto LABEL_19;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v28;
        v32 = 1024;
        LODWORD(v33) = v16;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@[Interrupt] The interrupt value does not contain any Request To Send (0x%x)", buf, 0x12u);

      }
    }

    objc_autoreleasePoolPop(v18);
LABEL_19:

    goto LABEL_20;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Interrupt] Received interrupt value but it was not of the expected type; IGNORING.",
      buf,
      0xCu);

  }
  objc_autoreleasePoolPop(v23);
LABEL_20:

}

- (HMDDataStreamTransportDelegate)delegate
{
  return (HMDDataStreamTransportDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDCharacteristic)transportCharacteristic
{
  return (HMDCharacteristic *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransportCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMDCharacteristic)interruptCharacteristic
{
  return (HMDCharacteristic *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInterruptCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)sessionIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (HMDDataStreamFrameReader)byteReader
{
  return (HMDDataStreamFrameReader *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)notificationClientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableArray)pendingWrites
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isWriteInProgress
{
  return self->_isWriteInProgress;
}

- (void)setIsWriteInProgress:(BOOL)a3
{
  self->_isWriteInProgress = a3;
}

- (BOOL)lastAccessoryRequestToSendFlag
{
  return self->_lastAccessoryRequestToSendFlag;
}

- (void)setLastAccessoryRequestToSendFlag:(BOOL)a3
{
  self->_lastAccessoryRequestToSendFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_notificationClientIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_byteReader, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_interruptCharacteristic, 0);
  objc_storeStrong((id *)&self->_transportCharacteristic, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

void __64__HMDDataStreamHAPTransport__handleCharacteristicsValueUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  __CFString **v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("HMDAccessoryCharacteristicsChangedNotification"));

  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    v5 = &kModifiedCharacteristicsKey;
LABEL_5:
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_arrayForKey:", *v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("HMDNotificationCharacteristicValueUpdated"));

  if (v7)
  {
    v4 = *(void **)(a1 + 32);
    v5 = &HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey;
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:
  objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_141352);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v18 = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling characteristics value updated notification: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v16 = *(void **)(a1 + 40);
    objc_msgSend(v10, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_handleInterruptCharacteristicValue:", v17);

  }
}

uint64_t __64__HMDDataStreamHAPTransport__handleCharacteristicsValueUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("00000139-0000-1000-8000-0026BB765291"));

  return v3;
}

uint64_t __72__HMDDataStreamHAPTransport__notifyWriteOperation_didCompleteWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __50__HMDDataStreamHAPTransport__doNextWriteOperation__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    objc_msgSend(v4, "_handleCompletionWithResponseTuples:", v6);
  }

}

void __69__HMDDataStreamHAPTransport__writeCharacteristicRequests_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__HMDDataStreamHAPTransport__writeCharacteristicRequests_completion___block_invoke_2;
  v10[3] = &unk_24E79B3F0;
  v11 = v5;
  v14 = a1[6];
  v12 = a1[5];
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __69__HMDDataStreamHAPTransport__writeCharacteristicRequests_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = a1[7];
  v2 = a1[5];
  if (a1[4])
    +[HMDCharacteristicResponse responsesWithRequests:error:](HMDCharacteristicResponse, "responsesWithRequests:error:", v2);
  else
    +[HMDCharacteristicResponse responsesWithRequests:characteristicUpdateDictionary:](HMDCharacteristicResponse, "responsesWithRequests:characteristicUpdateDictionary:", v2, a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __60__HMDDataStreamHAPTransport__notifyDelegateDidReceiveFrame___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transport:didReceiveRawFrame:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __61__HMDDataStreamHAPTransport__notifyDelegateDidFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transport:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__HMDDataStreamHAPTransport__notifyDelegateDidClose__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportDidClose:", *(_QWORD *)(a1 + 32));

}

void __51__HMDDataStreamHAPTransport__notifyDelegateDidOpen__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportDidOpen:", *(_QWORD *)(a1 + 32));

}

void __55__HMDDataStreamHAPTransport__teardownSessionWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    objc_msgSend(v4, "_stopWithError:", *(_QWORD *)(a1 + 32));
    WeakRetained = v4;
  }

}

@end
