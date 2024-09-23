@implementation HMDHomePeriodicReader

- (void)configure:(id)a3
{
  HMDHome **p_home;
  id v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *workQueue;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *timerID;
  void *v13;

  p_home = &self->_home;
  v5 = a3;
  objc_storeWeak((id *)p_home, v5);
  objc_msgSend(v5, "workQueue");
  v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  self->_workQueue = v6;

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("periodic.read/%@"), v10);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  timerID = self->_timerID;
  self->_timerID = v11;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_handleCharacteristicBasedEventAdded_, CFSTR("HMDEventTriggerCharacteristicBasedEventAddedNotification"), v5);

  -[HMDHomePeriodicReader startReadTimer](self, "startReadTimer");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDHomePeriodicReader;
  -[HMDHomePeriodicReader dealloc](&v4, sel_dealloc);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDHomePeriodicReader home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)handleCharacteristicBasedEventAdded:(id)a3
{
  id v4;
  void *v5;
  HMDHomePeriodicReader *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received characteristic event added notification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomePeriodicReader startReadTimer](v6, "startReadTimer");

}

- (void)handleTimerFiredNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDHomePeriodicReader *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("HMD.BGTM.NK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomePeriodicReader timerID](self, "timerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Issuing read for fired timer with ID: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDHomePeriodicReader checkToIssueRead](v10, "checkToIssueRead");
  }

}

- (void)residentUpdated
{
  void *v3;
  HMDHomePeriodicReader *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resident updated, issuing a read", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHomePeriodicReader checkToIssueRead](v4, "checkToIssueRead");
}

- (id)_characteristicsToRead
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  HMDHomePeriodicReader *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id obj;
  char *obja;
  uint64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  -[HMDHomePeriodicReader home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResident");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentDevice");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v44 = v3;
    objc_msgSend(v3, "triggers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v9)
    {
      v10 = v9;
      v51 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v66 != v51)
            objc_enumerationMutation(obj);
          v12 = *(id *)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
          v14 = v13;

          if (v14)
          {
            objc_msgSend(v14, "characteristicBaseEvents");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = 0u;
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v62;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v62 != v18)
                    objc_enumerationMutation(v15);
                  objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "characteristic");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "accessory");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v21, "hasIPLink"))
                    objc_msgSend(v6, "addObject:", v21);

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
              }
              while (v17);
            }

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v22 = v6;
    v47 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v47)
    {
      v52 = 0;
      v45 = v22;
      v46 = *(_QWORD *)v58;
      v23 = *MEMORY[0x24BE1B780];
      v24 = *MEMORY[0x24BE1B578];
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v58 != v46)
            objc_enumerationMutation(v45);
          v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v25);
          objc_msgSend(v48, "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setObject:forKey:", v27, v26);
          }
          obja = v25;
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          objc_msgSend(v26, "services");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v54;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v54 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
                objc_msgSend(v33, "type");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "isEqualToString:", v23);

                if (v35)
                {
                  objc_msgSend(v33, "findCharacteristicWithType:", v24);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {
                    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v36);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "addObject:", v37);

                    v52 = 1;
                  }

                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
            }
            while (v30);
          }

          v25 = obja + 1;
        }
        while (obja + 1 != (char *)v47);
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v47);
      v22 = v45;

      if ((v52 & 1) != 0)
      {
        v38 = v48;
LABEL_50:
        v3 = v44;

        goto LABEL_51;
      }
    }
    else
    {

    }
    v38 = 0;
    goto LABEL_50;
  }
  v39 = (void *)MEMORY[0x227676638]();
  v40 = self;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v74 = v42;
    _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@This device is not the resident, not issuing the periodic read", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v39);
  v38 = 0;
LABEL_51:

  return v38;
}

- (void)startReadTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDHomePeriodicReader *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDHomePeriodicReader workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDHomePeriodicReader workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__HMDHomePeriodicReader_startReadTimer__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v4, block);

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Object not configured yet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)checkToIssueRead
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDHomePeriodicReader *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDHomePeriodicReader workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDHomePeriodicReader workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__HMDHomePeriodicReader_checkToIssueRead__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v4, block);

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Object not configured yet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)_checkToIssueRead
{
  void *v3;
  HMDHomePeriodicReader *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePeriodicReader timerID](v4, "timerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping the timer with ID: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePeriodicReader timerID](v4, "timerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelTaskWithIdentifier:onObserver:", v9, v4);

  -[HMDHomePeriodicReader _characteristicsToRead](v4, "_characteristicsToRead");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HMDHomePeriodicReader _issueCharacteristicRequests:](v4, "_issueCharacteristicRequests:", v10);
    -[HMDHomePeriodicReader _startTimer](v4, "_startTimer");
  }

}

- (void)_issueCharacteristicRequests:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  HMDHomePeriodicReader *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  HMDHomePeriodicReader *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 138543618;
    v20 = v6;
    v21 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = v7;
          v16 = v8;
          v17 = self;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v20;
          v27 = v18;
          v28 = 2112;
          v29 = v10;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Issuing a periodic read for %@", buf, 0x16u);

          self = v17;
          v8 = v16;
          v7 = v15;
          v4 = v21;
        }

        objc_autoreleasePoolPop(v12);
        -[HMDHomePeriodicReader workQueue](v13, "workQueue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "readCharacteristicValues:source:queue:completionHandler:", v11, 7, v19, &__block_literal_global_16_116563);

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v7);
  }

}

- (void)_startTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHomePeriodicReader *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  HMDHomePeriodicReader *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  HMDHomePeriodicReader *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[HMDHomePeriodicReader timerID](self, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelTaskWithIdentifier:onObserver:", v3, self);

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceForKey:", CFSTR("periodicReaderInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 20.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Preference for reader interval is missing, using default value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v12, "dateByAddingTimeInterval:", v13 * 60.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_localTimeDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v18;
    v30 = 2112;
    v31 = v3;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting the next timer (%@) to fire at %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v21 = objc_msgSend(v20, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v3, v14, v16, sel_handleTimerFiredNotification_, &v27);
  v22 = v27;

  if ((v21 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v16;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v26;
      v30 = 2112;
      v31 = v3;
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

- (NSString)timerID
{
  return self->_timerID;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_timerID, 0);
}

uint64_t __41__HMDHomePeriodicReader_checkToIssueRead__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkToIssueRead");
}

void __39__HMDHomePeriodicReader_startReadTimer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_characteristicsToRead");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting periodic read timer", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_startTimer");
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_116588 != -1)
    dispatch_once(&logCategory__hmf_once_t0_116588, &__block_literal_global_116589);
  return (id)logCategory__hmf_once_v1_116590;
}

void __36__HMDHomePeriodicReader_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_116590;
  logCategory__hmf_once_v1_116590 = v0;

}

@end
