@implementation MTRDevice

- (MTRDevice)initWithNodeID:(id)a3 controller:(id)a4
{
  id v6;
  id v7;
  MTRDevice *v8;
  const char *v9;
  uint64_t v10;
  MTRDevice *v11;
  MTRDevice *v12;
  uint64_t v13;
  NSNumber *nodeID;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *expectedValueCache;
  MTRAsyncWorkQueue *v24;
  const char *v25;
  uint64_t v26;
  MTRAsyncWorkQueue *asyncWorkQueue;
  const char *v28;
  uint64_t v29;
  void *v30;
  NSCache *v31;
  NSCache *persistedClusterData;
  NSMutableDictionary *clusterDataToPersist;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableSet *persistedClusters;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  id systemTimeChangeObserverToken;
  uint64_t v46;
  NSMutableSet *delegates;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  _QWORD v55[4];
  id v56;
  objc_super v57;
  _BYTE location[12];
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v57.receiver = self;
  v57.super_class = (Class)MTRDevice;
  v8 = -[MTRDevice init](&v57, sel_init);
  v11 = v8;
  v12 = v8;
  if (v8)
  {
    *(_QWORD *)&v8->_lock._os_unfair_lock_opaque = 0;
    v13 = objc_msgSend_copy(v6, v9, v10);
    nodeID = v12->_nodeID;
    v12->_nodeID = (NSNumber *)v13;

    v12->_fabricIndex = objc_msgSend_fabricIndex(v7, v15, v16);
    objc_storeStrong((id *)&v11->_deviceController, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("org.csa-iot.matter.framework.device.workqueue", (dispatch_queue_attr_t)v17);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v18;

    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    expectedValueCache = v12->_expectedValueCache;
    v12->_expectedValueCache = (NSMutableDictionary *)v22;

    v24 = [MTRAsyncWorkQueue alloc];
    v26 = objc_msgSend_initWithContext_(v24, v25, (uint64_t)v12);
    asyncWorkQueue = v12->_asyncWorkQueue;
    v12->_asyncWorkQueue = (MTRAsyncWorkQueue *)v26;

    v12->_state = 0;
    v12->_internalDeviceState = 0;
    objc_msgSend_controllerDataStore(v7, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v30 == 0;

    if ((v17 & 1) != 0)
    {
      persistedClusterData = v12->_persistedClusterData;
      v12->_persistedClusterData = 0;
    }
    else
    {
      v31 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
      persistedClusterData = v12->_persistedClusterData;
      v12->_persistedClusterData = v31;
    }

    clusterDataToPersist = v12->_clusterDataToPersist;
    v12->_clusterDataToPersist = 0;

    objc_msgSend_set(MEMORY[0x24BDBCEF0], v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    persistedClusters = v12->_persistedClusters;
    v12->_persistedClusters = (NSMutableSet *)v36;

    if (v12->_persistedClusterData)
    {
      objc_initWeak((id *)location, v12);
      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = sub_2340DF398;
      v55[3] = &unk_2505022F0;
      objc_copyWeak(&v56, (id *)location);
      objc_msgSend_addObserverForName_object_queue_usingBlock_(v42, v43, *MEMORY[0x24BDBCBB8], 0, 0, v55);
      v44 = objc_claimAutoreleasedReturnValue();
      systemTimeChangeObserverToken = v12->_systemTimeChangeObserverToken;
      v12->_systemTimeChangeObserverToken = (id)v44;

      objc_destroyWeak(&v56);
      objc_destroyWeak((id *)location);
    }
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v38, v39);
    v46 = objc_claimAutoreleasedReturnValue();
    delegates = v12->_delegates;
    v12->_delegates = (NSMutableSet *)v46;

    sub_234117B80(0, "NotSpecified");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v51 = objc_msgSend_unsignedLongLongValue(v12->_nodeID, v49, v50);
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v12;
      v59 = 2048;
      v60 = v51;
      _os_log_impl(&dword_233BF3000, v48, OS_LOG_TYPE_INFO, "%@ init with hex nodeID 0x%016llX", location, 0x16u);
    }

    if (sub_234114844(3u))
    {
      objc_msgSend_unsignedLongLongValue(v12->_nodeID, v52, v53);
      sub_2341147D0(0, 3);
    }
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  NSObject *v6;
  MTRDevice *v7;
  objc_super v8;
  uint8_t buf[4];
  MTRDevice *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self->_systemTimeChangeObserverToken);

  sub_234117B80(0, "NotSpecified");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = self;
    _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_DEFAULT, "MTRDevice dealloc: %p", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v7 = self;
    sub_2341147D0(0, 2);
  }
  v8.receiver = self;
  v8.super_class = (Class)MTRDevice;
  -[MTRDevice dealloc](&v8, sel_dealloc, v7);
}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t fabricIndex;
  uint64_t v6;
  const char *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  fabricIndex = self->_fabricIndex;
  v6 = objc_msgSend_unsignedLongLongValue(self->_nodeID, a2, v2);
  return (id)objc_msgSend_stringWithFormat_(v4, v7, (uint64_t)CFSTR("<MTRDevice: %p>[fabric: %u, nodeID: 0x%016llX]"), self, fabricIndex, v6);
}

+ (MTRDevice)deviceWithNodeID:(NSNumber *)nodeID controller:(MTRDeviceController *)controller
{
  objc_msgSend_deviceForNodeID_(controller, a2, (uint64_t)nodeID);
  return (MTRDevice *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setTimeOnDevice
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  MTRAttributeReport *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  unsigned int v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  NSObject *v49;
  MTRDevice *v50;
  uint64_t v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint8_t v61[128];
  uint8_t buf[4];
  MTRDevice *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_date(MEMORY[0x24BDBCE60], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v4;
  if (v4)
  {
    v58 = 0;
    if (sub_234006764(v4, (char *)&v58, v5))
    {
      objc_msgSend__endpointsWithTimeSyncClusterServer(self, v6, v7);
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v54, v61, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v55 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            sub_234117B80(0, "NotSpecified");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v63 = self;
              v64 = 2112;
              v65 = v12;
              _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_INFO, "%@ Setting Time on Endpoint %@", buf, 0x16u);
            }

            if (sub_234114844(3u))
            {
              v50 = self;
              v51 = v12;
              sub_2341147D0(0, 3);
            }
            objc_msgSend__setUTCTime_withGranularity_forEndpoint_(self, v14, v58, 4, v12, v50, v51);
            objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v15, v12, &unk_250596D80, &unk_250596D98);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_endpoint(v16, v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_cluster(v16, v20, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attribute(v16, v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(self, v26, (uint64_t)v19, v22, v25, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v28 = [MTRAttributeReport alloc];
              v59[0] = CFSTR("attributePath");
              v59[1] = CFSTR("data");
              v60[0] = v16;
              v60[1] = v27;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v60, v59, 2);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)objc_msgSend_initWithResponseValue_error_(v28, v31, (uint64_t)v30, 0);

              if (v32)
              {
                objc_msgSend_value(v32, v33, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend_unsignedCharValue(v35, v36, v37);
                if (!v38)
                {
                  sub_234117B80(0, "NotSpecified");
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v63 = self;
                    v64 = 2112;
                    v65 = v12;
                    _os_log_impl(&dword_233BF3000, v39, OS_LOG_TYPE_ERROR, "%@ DSTOffsetListMaxSize value on endpoint %@ is 0, which is not allowed. Defaulting to 1.", buf, 0x16u);
                  }

                  v38 = 1;
                  if (sub_234114844(1u))
                  {
                    v50 = self;
                    v51 = v12;
                    sub_2341147D0(0, 1);
                  }
                }

              }
              else
              {
                sub_234117B80(0, "NotSpecified");
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v63 = self;
                  v64 = 2112;
                  v65 = v12;
                  _os_log_impl(&dword_233BF3000, v43, OS_LOG_TYPE_ERROR, "%@ DSTOffsetListMaxSize value on endpoint %@ is invalid. Defaulting to 1.", buf, 0x16u);
                }

                v38 = 1;
                if (sub_234114844(1u))
                {
                  v50 = self;
                  v51 = v12;
                  sub_2341147D0(0, 1);
                }
              }
              sub_2340DE248(v38, v40, v41);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (v45)
              {
                objc_msgSend__setDSTOffsets_forEndpoint_(self, v44, (uint64_t)v45, v12);
              }
              else
              {
                sub_234117B80(0, "NotSpecified");
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v63 = self;
                  v64 = 2112;
                  v65 = v12;
                  _os_log_impl(&dword_233BF3000, v46, OS_LOG_TYPE_ERROR, "%@ Could not retrieve DST offset information. Unable to setDSTOffset on endpoint %@.", buf, 0x16u);
                }

                if (sub_234114844(1u))
                {
                  v50 = self;
                  v51 = v12;
                  sub_2341147D0(0, 1);
                }
              }

            }
            else
            {
              sub_234117B80(0, "NotSpecified");
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v63 = self;
                v64 = 2112;
                v65 = v12;
                _os_log_impl(&dword_233BF3000, v42, OS_LOG_TYPE_DEFAULT, "%@ Unable to SetDSTOffset on endpoint %@, since it does not support the TZ feature", buf, 0x16u);
              }

              if (sub_234114844(2u))
              {
                v50 = self;
                v51 = v12;
                sub_2341147D0(0, 2);
              }
            }

          }
          v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v54, v61, 16);
        }
        while (v9);
      }

    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v63 = self;
        v64 = 2112;
        v65 = (uint64_t)v52;
        _os_log_impl(&dword_233BF3000, v49, OS_LOG_TYPE_ERROR, "%@ Could not convert NSDate (%@) to Matter Epoch Time. Unable to setUTCTime on endpoints.", buf, 0x16u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
    }
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = self;
      _os_log_impl(&dword_233BF3000, v48, OS_LOG_TYPE_ERROR, "%@ Could not retrieve current date. Unable to setUTCTime on endpoints.", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }

}

- (void)_scheduleNextUpdate:(unint64_t)a3
{
  dispatch_time_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id location;
  uint8_t buf[4];
  MTRDevice *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, 1000000000 * a3);
  objc_msgSend_queue(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2340DFF1C;
  block[3] = &unk_250502318;
  block[4] = self;
  objc_copyWeak(&v12, &location);
  dispatch_after(v5, v8, block);

  objc_msgSend_setTimeUpdateScheduled_(self, v9, 1);
  sub_234117B80(0, "NotSpecified");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_INFO, "%@ Timer Scheduled for next Device Time Update, in %llu seconds", buf, 0x16u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_updateDeviceTimeAndScheduleNextUpdate
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t buf[4];
  MTRDevice *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_timeSyncLock);
  if (objc_msgSend_timeUpdateScheduled(self, v3, v4))
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_INFO, "%@ Device Time Update already scheduled", buf, 0xCu);
    }

    if (sub_234114844(3u))
      sub_2341147D0(0, 3);
  }
  else
  {
    objc_msgSend__setTimeOnDevice(self, v5, v6);
    objc_msgSend__scheduleNextUpdate_(self, v8, 86400);
  }
}

- (void)_performScheduledTimeUpdate
{
  os_unfair_lock_s *p_timeSyncLock;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  MTRDevice *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_timeSyncLock = &self->_timeSyncLock;
  os_unfair_lock_lock(&self->_timeSyncLock);
  if (objc_msgSend_state(self, v4, v5) == 1)
  {
    if ((objc_msgSend_timeUpdateScheduled(self, v6, v7) & 1) != 0)
    {
      objc_msgSend_setTimeUpdateScheduled_(self, v8, 0);
      objc_msgSend__updateDeviceTimeAndScheduleNextUpdate(self, v9, v10);
      goto LABEL_12;
    }
    sub_234117B80(0, "NotSpecified");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_INFO, "%@ Device Time Update is no longer scheduled, MTRDevice may have been invalidated.", buf, 0xCu);
    }

    if (sub_234114844(3u))
LABEL_11:
      sub_2341147D0(0, 3);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_INFO, "%@ Device is not reachable, canceling Device Time Updates.", buf, 0xCu);
    }

    if (sub_234114844(3u))
      goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_unlock(p_timeSyncLock);
}

- (id)_endpointsWithTimeSyncClusterServer
{
  const char *v3;
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  void *v20;
  id v21;
  id obja;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  MTRDevice *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(self, a2, (uint64_t)&unk_250596DB0, &unk_250596DC8, &unk_250596DE0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v3, (uint64_t)v20);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  obja = v4;
  objc_msgSend_addObject_(v4, v5, (uint64_t)&unk_250596DB0);
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = obja;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v24, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(self, v7, v11, &unk_250596DC8, &unk_250596DF8, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v13, (uint64_t)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14;
        if (v14 && objc_msgSend_containsObject_(v14, v15, (uint64_t)&unk_250596D80))
          objc_msgSend_addObject_(v21, v17, v11);

      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v24, v32, 16);
    }
    while (v8);
  }

  sub_234117B80(0, "NotSpecified");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = self;
    v30 = 2112;
    v31 = v21;
    _os_log_impl(&dword_233BF3000, v18, OS_LOG_TYPE_INFO, "%@ Device has following endpoints with Time Sync Cluster Server: %@", buf, 0x16u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);

  return v21;
}

- (void)_setUTCTime:(unint64_t)a3 withGranularity:(unsigned __int8)a4 forEndpoint:(id)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  MTRTimeSynchronizationClusterSetUTCTimeParams *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  MTRTimeSynchronizationClusterSetUTCTimeParams *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *, void *, void *);
  void *v30;
  MTRDevice *v31;
  id v32;
  MTRTimeSynchronizationClusterSetUTCTimeParams *v33;
  uint8_t buf[4];
  MTRDevice *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  sub_234117B80(0, "NotSpecified");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v35 = self;
    v36 = 2048;
    v37 = a3;
    v38 = 2112;
    v39 = v8;
    _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_INFO, " %@ _setUTCTime with matterEpochTime: %llu, endpoint %@", buf, 0x20u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v10 = objc_alloc_init(MTRTimeSynchronizationClusterSetUTCTimeParams);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUtcTime_(v10, v13, (uint64_t)v12);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGranularity_(v10, v16, (uint64_t)v15);

  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = sub_2340E0934;
  v30 = &unk_250502340;
  v31 = self;
  v17 = v8;
  v32 = v17;
  v18 = v10;
  v33 = v18;
  v19 = (void *)MEMORY[0x23493EEA8](&v27);
  objc_msgSend_serverSideProcessingTimeout(v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queue(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(self, v26, (uint64_t)v17, &unk_250596D80, &unk_250596E10, v18, 0, 0, 0, v22, 0, v25, v19, v27, v28, v29, v30, v31);

}

- (void)_setDSTOffsets:(id)a3 forEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MTRTimeSynchronizationClusterSetDSTOffsetParams *v9;
  const char *v10;
  id v11;
  MTRTimeSynchronizationClusterSetDSTOffsetParams *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *, void *, void *);
  void *v24;
  MTRDevice *v25;
  id v26;
  MTRTimeSynchronizationClusterSetDSTOffsetParams *v27;
  uint8_t buf[4];
  MTRDevice *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_234117B80(0, "NotSpecified");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v29 = self;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_INFO, "%@ _setDSTOffsets with offsets: %@, endpoint %@", buf, 0x20u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v9 = objc_alloc_init(MTRTimeSynchronizationClusterSetDSTOffsetParams);
  objc_msgSend_setDstOffset_(v9, v10, (uint64_t)v6);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = sub_2340E0CE4;
  v24 = &unk_250502340;
  v25 = self;
  v11 = v7;
  v26 = v11;
  v12 = v9;
  v27 = v12;
  v13 = (void *)MEMORY[0x23493EEA8](&v21);
  objc_msgSend_serverSideProcessingTimeout(v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queue(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(self, v20, (uint64_t)v11, &unk_250596D80, &unk_250596E28, v12, 0, 0, 0, v16, 0, v19, v13, v21, v22, v23, v24, v25);

}

- (id)arrayOfNumbersFromAttributeValue:(id)a3
{
  const char *v3;
  void *v4;
  const char *v5;
  char isEqual;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  id v31;
  id v33;
  void *v34;
  id obj;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  objc_msgSend_objectForKeyedSubscript_(v37, v3, (uint64_t)CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(CFSTR("Array"), v5, (uint64_t)v4);

  if ((isEqual & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v37, v7, (uint64_t)CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = (void *)MEMORY[0x24BDBCEB8];
      v13 = objc_msgSend_count(v9, v11, v12);
      objc_msgSend_arrayWithCapacity_(v10, v14, v13);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      obj = v9;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v38, v42, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v39;
        v33 = v9;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_19;
            v20 = v19;
            objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)CFSTR("data"), v33, v34);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_18;
            v23 = v22;
            objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)CFSTR("type"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v23, v26, (uint64_t)CFSTR("value"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {

LABEL_18:
LABEL_19:

              v31 = 0;
              v30 = v36;
              goto LABEL_20;
            }
            objc_msgSend_addObject_(v36, v28, (uint64_t)v27);

          }
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v38, v42, 16);
          if (v16)
            continue;
          break;
        }
      }

      v30 = v36;
      v31 = v36;
LABEL_20:

    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)_subscriptionsAllowed
{
  os_unfair_lock_assert_owner(&self->_lock);
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  MTRDevice *v10;
  id v11;
  uint8_t buf[4];
  MTRDevice *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = delegate;
  v7 = queue;
  sub_234117B80(0, "NotSpecified");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_DEFAULT, "%@ setDelegate %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    v10 = self;
    v11 = v6;
    sub_2341147D0(0, 2);
  }
  objc_msgSend__addDelegate_queue_interestedPathsForAttributes_interestedPathsForEvents_(self, v9, (uint64_t)v6, v7, 0, 0, v10, v11);

}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  MTRDevice *v10;
  id v11;
  uint8_t buf[4];
  MTRDevice *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_234117B80(0, "NotSpecified");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_DEFAULT, "%@ addDelegate %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    v10 = self;
    v11 = v6;
    sub_2341147D0(0, 2);
  }
  objc_msgSend__addDelegate_queue_interestedPathsForAttributes_interestedPathsForEvents_(self, v9, (uint64_t)v6, v7, 0, 0, v10, v11);

}

- (void)addDelegate:(id)a3 queue:(id)a4 interestedPathsForAttributes:(id)a5 interestedPathsForEvents:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  MTRDevice *v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  MTRDevice *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  sub_234117B80(0, "NotSpecified");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v21 = self;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_DEFAULT, "%@ addDelegate %@ with interested attribute paths %@ event paths %@", buf, 0x2Au);
  }

  if (sub_234114844(2u))
  {
    v18 = v12;
    v19 = v13;
    v16 = self;
    v17 = v10;
    sub_2341147D0(0, 2);
  }
  objc_msgSend__addDelegate_queue_interestedPathsForAttributes_interestedPathsForEvents_(self, v15, (uint64_t)v10, v11, v12, v13, v16, v17, v18, v19);

}

- (void)_addDelegate:(id)a3 queue:(id)a4 interestedPathsForAttributes:(id)a5 interestedPathsForEvents:(id)a6
{
  id *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSMutableSet *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id *WeakRetained;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  id *v25;
  id *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  id *v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  NSDate *v48;
  NSDate *initialSubscribeStart;
  const char *v50;
  NSObject *v51;
  const char *v52;
  MTRDevice *v53;
  MTRDevice *v54;
  MTRDevice *v55;
  id *v56;
  os_unfair_lock_t lock;
  id v58;
  id v59;
  id v60;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  MTRDevice *v67;
  __int16 v68;
  id *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v10 = (id *)a3;
  v58 = a4;
  v59 = a5;
  v60 = a6;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v14 = self->_delegates;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v62, v70, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v63;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v63 != v18)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v19);
        if (v20 && (WeakRetained = (id *)objc_loadWeakRetained((id *)(v20 + 16))) != 0)
        {
          if (WeakRetained == v10)
          {
            objc_msgSend_addObject_(v13, v16, v20);
            sub_234117B80(0, "NotSpecified");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v67 = self;
              v68 = 2048;
              v69 = v10;
              _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_DEFAULT, "%@ replacing delegate info for %p", buf, 0x16u);
            }

            v23 = sub_234114844(2u);
            WeakRetained = v10;
            if (v23)
            {
              v53 = self;
              v56 = v10;
              sub_2341147D0(0, 2);
              WeakRetained = v10;
            }
          }
        }
        else
        {
          objc_msgSend_addObject_(v13, v16, v20, v53, v56, lock, v58, v59, v60);
          sub_234117B80(0, "NotSpecified");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            if (v20)
              v25 = *(id **)(v20 + 8);
            else
              v25 = 0;
            *(_DWORD *)buf = 138412546;
            v67 = self;
            v68 = 2048;
            v69 = v25;
            _os_log_impl(&dword_233BF3000, v24, OS_LOG_TYPE_DEFAULT, "%@ removing delegate info for nil delegate %p", buf, 0x16u);
          }

          if (sub_234114844(2u))
          {
            if (v20)
              v26 = *(id **)(v20 + 8);
            else
              v26 = 0;
            v53 = self;
            v56 = v26;
            sub_2341147D0(0, 2);
            WeakRetained = 0;
          }
          else
          {
            WeakRetained = 0;
          }
        }

        ++v19;
      }
      while (v17 != v19);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v62, v70, 16);
      v17 = v27;
    }
    while (v27);
  }

  if (objc_msgSend_count(v13, v28, v29))
  {
    v32 = objc_msgSend_count(self->_delegates, v30, v31);
    objc_msgSend_minusSet_(self->_delegates, v33, (uint64_t)v13);
    sub_234117B80(0, "NotSpecified");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend_count(self->_delegates, v35, v36);
      *(_DWORD *)buf = 138412546;
      v67 = self;
      v68 = 2048;
      v69 = (id *)(v37 - v32);
      _os_log_impl(&dword_233BF3000, v34, OS_LOG_TYPE_DEFAULT, "%@ addDelegate: removed %lu", buf, 0x16u);
    }

    if (sub_234114844(2u))
    {
      v53 = self;
      v56 = (id *)(objc_msgSend_count(self->_delegates, v38, v39) - v32);
      sub_2341147D0(0, 2);
    }
  }
  v40 = sub_2340DE5D0((id *)[MTRDeviceDelegateInfo alloc], v10, v58, v59, v60);
  objc_msgSend_addObject_(self->_delegates, v41, (uint64_t)v40);
  sub_234117B80(0, "NotSpecified");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v67 = self;
    v68 = 2112;
    v69 = v40;
    _os_log_impl(&dword_233BF3000, v42, OS_LOG_TYPE_DEFAULT, "%@ added delegate info %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    v53 = self;
    v56 = v40;
    sub_2341147D0(0, 2);
  }
  if (objc_msgSend__subscriptionsAllowed(self, v43, v44, v53, v56))
  {
    sub_234117B80(0, "NotSpecified");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = self;
      _os_log_impl(&dword_233BF3000, v45, OS_LOG_TYPE_DEFAULT, "%@ - starting subscription setup", buf, 0xCu);
    }

    if (sub_234114844(2u))
    {
      v54 = self;
      sub_2341147D0(0, 2);
    }
    if (!self->_initialSubscribeStart)
    {
      objc_msgSend_now(MEMORY[0x24BDBCE60], v46, v47);
      v48 = (NSDate *)objc_claimAutoreleasedReturnValue();
      initialSubscribeStart = self->_initialSubscribeStart;
      self->_initialSubscribeStart = v48;

    }
    if (objc_msgSend__deviceUsesThread(self, v46, v47, v54))
    {
      sub_234117B80(0, "NotSpecified");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = self;
        _os_log_impl(&dword_233BF3000, v51, OS_LOG_TYPE_DEFAULT, " => %@ - device is a thread device, scheduling in pool", buf, 0xCu);
      }

      if (sub_234114844(2u))
      {
        v55 = self;
        sub_2341147D0(0, 2);
      }
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = sub_2340E1CD8;
      v61[3] = &unk_2504EE8C0;
      v61[4] = self;
      objc_msgSend__scheduleSubscriptionPoolWork_inNanoseconds_description_(self, v52, (uint64_t)v61, 0, CFSTR("MTRDevice setDelegate first subscription"), v55);
    }
    else
    {
      objc_msgSend__setupSubscriptionWithReason_(self, v50, (uint64_t)CFSTR("delegate is set and subscription is needed"));
    }
  }

  os_unfair_lock_unlock(lock);
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  MTRDevice *v27;
  uint8_t buf[4];
  MTRDevice *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = self;
    v30 = 2112;
    v31 = (uint64_t)v4;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_DEFAULT, "%@ removeDelegate %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_2340E1FE0;
  v24[3] = &unk_250502368;
  v9 = v4;
  v25 = v9;
  v10 = v8;
  v26 = v10;
  v27 = self;
  objc_msgSend__iterateDelegatesWithBlock_(self, v11, (uint64_t)v24);
  if (objc_msgSend_count(v10, v12, v13))
  {
    v16 = objc_msgSend_count(self->_delegates, v14, v15);
    objc_msgSend_minusSet_(self->_delegates, v17, (uint64_t)v10);
    sub_234117B80(0, "NotSpecified");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend_count(self->_delegates, v19, v20);
      *(_DWORD *)buf = 138412546;
      v29 = self;
      v30 = 2048;
      v31 = v21 - v16;
      _os_log_impl(&dword_233BF3000, v18, OS_LOG_TYPE_DEFAULT, "%@ removeDelegate: removed %lu", buf, 0x16u);
    }

    if (sub_234114844(2u))
    {
      objc_msgSend_count(self->_delegates, v22, v23);
      sub_2341147D0(0, 2);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidate
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  MTRDeviceController *deviceController;
  const char *v9;
  const char *v10;
  uint64_t v11;
  MTRDevice *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  MTRDevice *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0, "NotSpecified");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "%@ invalidate", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v12 = self;
    sub_2341147D0(0, 2);
  }
  objc_msgSend_invalidate(self->_asyncWorkQueue, v4, v5, v12);
  os_unfair_lock_lock(&self->_timeSyncLock);
  self->_timeUpdateScheduled = 0;
  os_unfair_lock_unlock(&self->_timeSyncLock);
  os_unfair_lock_lock(&self->_lock);
  self->_state = 0;
  objc_msgSend_removeAllObjects(self->_delegates, v6, v7);
  self->_reattemptingSubscription = 0;
  deviceController = self->_deviceController;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2340E22AC;
  v13[3] = &unk_2504EE8C0;
  v13[4] = self;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v9, (uint64_t)v13, 0);
  objc_msgSend__stopConnectivityMonitoring(self, v10, v11);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)nodeMayBeAdvertisingOperational
{
  NSObject *v3;
  const char *v4;
  MTRDevice *v5;
  uint8_t buf[4];
  MTRDevice *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice.mm", 935);
  sub_234117B80(0, "NotSpecified");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "%@ saw new operational advertisement", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v5 = self;
    sub_2341147D0(0, 2);
  }
  objc_msgSend__triggerResubscribeWithReason_nodeLikelyReachable_(self, v4, (uint64_t)CFSTR("operational advertisement seen"), 1, v5);
}

- (void)_triggerResubscribeWithReason:(id)a3 nodeLikelyReachable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  os_unfair_lock_s *p_lock;
  const char *v9;
  uint64_t v10;
  const char *v11;
  _DWORD *currentSubscriptionCallback;
  void *currentReadClient;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  MTRDevice *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_234117B80(0, "NotSpecified");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_DEFAULT, "%@ _triggerResubscribeWithReason called with reason %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice.mm", 949);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (objc_msgSend_reattemptingSubscription(self, v9, v10))
  {
    objc_msgSend__reattemptSubscriptionNowIfNeededWithReason_(self, v11, (uint64_t)v6);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    currentReadClient = self->_currentReadClient;
    currentSubscriptionCallback = self->_currentSubscriptionCallback;
    os_unfair_lock_unlock(p_lock);
    if (currentReadClient)
    {
      if (v4)
        currentSubscriptionCallback[48] = 0;
      v14 = objc_retainAutorelease(v6);
      v17 = objc_msgSend_UTF8String(v14, v15, v16);
      sub_234211568((uint64_t)currentReadClient, v17);
    }
  }

}

- (BOOL)_subscriptionAbleToReport
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  char v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((objc_msgSend__delegateExists(self, v4, v5) & 1) != 0)
    v8 = objc_msgSend__subscriptionsAllowed(self, v6, v7);
  else
    v8 = 0;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_readThroughSkipped
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  const char *v10;
  NSObject *v11;
  NSDate *lastSubscriptionFailureTime;
  MTRDeviceController *deviceController;
  _QWORD v14[5];
  uint8_t buf[4];
  MTRDevice *v16;
  __int16 v17;
  NSDate *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state != 1 && self->_lastSubscriptionFailureTime)
  {
    objc_msgSend_now(MEMORY[0x24BDBCE60], v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v6, v7, (uint64_t)self->_lastSubscriptionFailureTime);
    v9 = v8;

    if (v9 >= 600.0)
    {
      deviceController = self->_deviceController;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_2340E28A8;
      v14[3] = &unk_2504EE8C0;
      v14[4] = self;
      objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v10, (uint64_t)v14, 0);
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        lastSubscriptionFailureTime = self->_lastSubscriptionFailureTime;
        *(_DWORD *)buf = 138412546;
        v16 = self;
        v17 = 2112;
        v18 = lastSubscriptionFailureTime;
        _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_INFO, "%@ skipping resubscribe from skipped read-through: not enough time has passed since %@", buf, 0x16u);
      }

      if (sub_234114844(3u))
        sub_2341147D0(0, 3);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_delegateExists
{
  const char *v3;

  os_unfair_lock_assert_owner(&self->_lock);
  return objc_msgSend__iterateDelegatesWithBlock_(self, v3, 0);
}

- (BOOL)_iterateDelegatesWithBlock:(id)a3
{
  void (**v4)(id, uint64_t);
  const char *v5;
  uint64_t v6;
  NSMutableSet *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id WeakRetained;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  BOOL v31;
  NSObject *v32;
  MTRDevice *v34;
  uint64_t v35;
  uint64_t v36;
  MTRDevice *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  MTRDevice *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v37 = self;
  if (objc_msgSend_count(self->_delegates, v5, v6))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = self->_delegates;
    v9 = 0;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v38, v48, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v7);
          v15 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (v15 && (WeakRetained = objc_loadWeakRetained((id *)(v15 + 16))) != 0)
          {
            if (v4)
            {
              v17 = (void *)MEMORY[0x23493ECEC]();
              v4[2](v4, v15);
              objc_autoreleasePoolPop(v17);
            }
          }
          else
          {
            if (!v9)
            {
              objc_msgSend_set(MEMORY[0x24BDBCEF0], v10, v11);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
            WeakRetained = 0;
            objc_msgSend_addObject_(v9, v10, v15);
          }

        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v38, v48, 16);
      }
      while (v12);
    }

    if (objc_msgSend_count(v9, v18, v19))
    {
      objc_msgSend_minusSet_(v37->_delegates, v20, (uint64_t)v9);
      sub_234117B80(0, "NotSpecified");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_msgSend_count(v9, v23, v24);
        v28 = objc_msgSend_count(v37->_delegates, v26, v27);
        *(_DWORD *)buf = 138412802;
        v43 = v37;
        v44 = 2048;
        v45 = v25;
        v46 = 2048;
        v47 = v28;
        _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_DEFAULT, "%@ _iterateDelegatesWithBlock: removed %lu remaining %lu", buf, 0x20u);
      }

      if (sub_234114844(2u))
      {
        v35 = objc_msgSend_count(v9, v20, v21);
        v36 = objc_msgSend_count(v37->_delegates, v29, v30);
        v34 = v37;
        sub_2341147D0(0, 2);
      }
    }
    v31 = objc_msgSend_count(v37->_delegates, v20, v21, v34, v35, v36) != 0;

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = self;
      _os_log_impl(&dword_233BF3000, v32, OS_LOG_TYPE_INFO, "%@ no delegates to iterate", buf, 0xCu);
    }

    if (sub_234114844(3u))
      sub_2341147D0(0, 3);
    v31 = 0;
  }

  return v31;
}

- (BOOL)_callDelegatesWithBlock:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2340E2D50;
  v8[3] = &unk_250502390;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  objc_msgSend__iterateDelegatesWithBlock_(self, v6, (uint64_t)v8);
  LOBYTE(self) = v12[3] != 0;

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (void)_callDelegateDeviceCachePrimed
{
  const char *v3;
  _QWORD v4[5];

  os_unfair_lock_assert_owner(&self->_lock);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_2340E2E00;
  v4[3] = &unk_2505023B8;
  v4[4] = self;
  objc_msgSend__callDelegatesWithBlock_(self, v3, (uint64_t)v4);
}

- (void)_changeState:(unint64_t)a3
{
  unint64_t state;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSDate *estimatedStartTime;
  NSDate *estimatedStartTimeFromGeneralDiagnosticsUpTime;
  MTRDevice *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD v15[6];
  uint8_t buf[4];
  MTRDevice *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  state = self->_state;
  self->_state = a3;
  if (state == a3)
  {
    sub_234117B80(0, "NotSpecified");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2048;
      v19 = a3;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_DEFAULT, "%@ Not reporting reachability state change, since no change in state %lu => %lu", buf, 0x20u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a3 == 1)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412802;
        v17 = self;
        v18 = 2048;
        v19 = state;
        v20 = 2048;
        v21 = 1;
        _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_DEFAULT, "%@ reachability state change %lu => %lu", buf, 0x20u);
      }

      if (sub_234114844(2u))
      {
        v13 = state;
        v14 = 1;
        v12 = self;
        sub_2341147D0(0, 2);
      }
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412802;
        v17 = self;
        v18 = 2048;
        v19 = state;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_DEFAULT, "%@ reachability state change %lu => %lu, set estimated start time to nil", buf, 0x20u);
      }

      if (sub_234114844(2u))
      {
        v13 = state;
        v14 = a3;
        v12 = self;
        sub_2341147D0(0, 2);
      }
      estimatedStartTime = self->_estimatedStartTime;
      self->_estimatedStartTime = 0;

      estimatedStartTimeFromGeneralDiagnosticsUpTime = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
      self->_estimatedStartTimeFromGeneralDiagnosticsUpTime = 0;

    }
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_2340E30FC;
    v15[3] = &unk_2505023E0;
    v15[4] = self;
    v15[5] = a3;
    objc_msgSend__callDelegatesWithBlock_(self, v9, (uint64_t)v15, v12, v13, v14);
  }
}

- (void)_changeInternalState:(unint64_t)a3
{
  unint64_t internalDeviceState;
  NSObject *v6;
  const char *v7;
  MTRDevice *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  MTRDevice *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  internalDeviceState = self->_internalDeviceState;
  self->_internalDeviceState = a3;
  if (internalDeviceState != a3)
  {
    sub_234117B80(0, "NotSpecified");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v13 = self;
      v14 = 2048;
      v15 = internalDeviceState;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_DEFAULT, "%@ internal state change %lu => %lu", buf, 0x20u);
    }

    if (sub_234114844(2u))
    {
      v9 = internalDeviceState;
      v10 = a3;
      v8 = self;
      sub_2341147D0(0, 2);
    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_2340E3258;
    v11[3] = &unk_250502408;
    v11[4] = self;
    objc_msgSend__callDelegatesWithBlock_(self, v7, (uint64_t)v11, v8, v9, v10);
  }
}

- (void)_handleSubscriptionEstablished
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  NSDate *v11;
  NSDate *initialSubscribeStart;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  NSNumber *estimatedSubscriptionLatency;
  double v20;
  const char *v21;
  uint64_t v22;
  NSNumber *v23;
  NSNumber *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  int v30;
  const char *v31;
  int v32;
  char v33;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend__clearSubscriptionPoolWork(self, v4, v5);
  self->_lastSubscriptionAttemptWait = 0;
  if (self->_internalDeviceState < 2)
  {
    v30 = 1;
    v31 = "dwnpm_dev_initial_subscription_setup";
    v32 = 0;
    v33 = 3;
    sub_2341C4BEC((uint64_t)&v30);
    objc_msgSend__changeInternalState_(self, v8, 2);
  }
  else
  {
    objc_msgSend__changeInternalState_(self, v6, 4);
  }
  objc_msgSend__changeState_(self, v7, 1);
  objc_msgSend__stopConnectivityMonitoring(self, v9, v10);
  v11 = self->_initialSubscribeStart;
  initialSubscribeStart = self->_initialSubscribeStart;
  self->_initialSubscribeStart = 0;

  if (v11)
  {
    objc_msgSend_timeIntervalSinceNow(v11, v13, v14);
    v18 = -v17;
    estimatedSubscriptionLatency = self->_estimatedSubscriptionLatency;
    if (estimatedSubscriptionLatency)
    {
      objc_msgSend_doubleValue(estimatedSubscriptionLatency, v15, v16);
      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v21, v22, v20 * 0.666666667 + v18 * 0.333333333);
    }
    else
    {
      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v15, v16, -v17);
    }
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v24 = self->_estimatedSubscriptionLatency;
    self->_estimatedSubscriptionLatency = v23;

    objc_msgSend__storePersistedDeviceData(self, v25, v26);
  }
  os_unfair_lock_unlock(p_lock);
  os_unfair_lock_lock(&self->_timeSyncLock);
  if ((objc_msgSend_timeUpdateScheduled(self, v27, v28) & 1) == 0)
    objc_msgSend__scheduleNextUpdate_(self, v29, 120);
  os_unfair_lock_unlock(&self->_timeSyncLock);

}

- (void)_handleSubscriptionError:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend__doHandleSubscriptionError_(self, v6, (uint64_t)v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_doHandleSubscriptionError:(id)a3
{
  const char *v4;
  NSMutableArray *unreportedEvents;
  const char *v6;

  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend__changeInternalState_(self, v4, 0);
  unreportedEvents = self->_unreportedEvents;
  self->_unreportedEvents = 0;

  objc_msgSend__changeState_(self, v6, 2);
}

- (BOOL)deviceUsesThread
{
  MTRDevice *v2;
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = objc_msgSend__deviceUsesThread(v2, v4, v5);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_deviceUsesThread
{
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  uint8_t buf[4];
  MTRDevice *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v3, (uint64_t)&unk_250596E40, &unk_250596E58);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__clusterDataForPath_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attributes(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)&unk_250596E70);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_234117B80(0, "NotSpecified");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_ERROR, "%@ Unexpected NetworkCommissioning FeatureMap value %@", buf, 0x16u);
    }

    if (sub_234114844(1u))
    {
      sub_2341147D0(0, 1);
      LOBYTE(v16) = 0;
      goto LABEL_9;
    }
LABEL_8:
    LOBYTE(v16) = 0;
    goto LABEL_9;
  }
  v16 = ((unint64_t)objc_msgSend_unsignedLongValue(v13, v14, v15) >> 1) & 1;
LABEL_9:

  return v16;
}

- (void)_clearSubscriptionPoolWork
{
  id subscriptionPoolWorkCompletionBlock;
  void (**v4)(id, _QWORD);

  os_unfair_lock_assert_owner(&self->_lock);
  v4 = (void (**)(id, _QWORD))MEMORY[0x23493EEA8](self->_subscriptionPoolWorkCompletionBlock);
  if (v4)
  {
    subscriptionPoolWorkCompletionBlock = self->_subscriptionPoolWorkCompletionBlock;
    self->_subscriptionPoolWorkCompletionBlock = 0;

    v4[2](v4, 0);
  }

}

- (void)_scheduleSubscriptionPoolWork:(id)a3 inNanoseconds:(int64_t)a4 description:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  MTRDevice *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_subscriptionPoolWorkCompletionBlock)
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_DEFAULT, "%@ already scheduled in subscription pool for this device - ignoring: %@", buf, 0x16u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
  }
  else
  {
    v11 = dispatch_time(0, a4);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2340E396C;
    block[3] = &unk_250500850;
    block[4] = self;
    v13 = v9;
    v14 = v8;
    dispatch_after(v11, MEMORY[0x24BDAC9B8], block);

  }
}

- (void)_handleResubscriptionNeededWithDelay:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  NSDate *v9;
  NSDate *lastSubscriptionFailureTime;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  dispatch_time_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[5];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend__changeState_(self, v5, 0);
  objc_msgSend__changeInternalState_(self, v6, 3);
  objc_msgSend_now(MEMORY[0x24BDBCE60], v7, v8);
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastSubscriptionFailureTime = self->_lastSubscriptionFailureTime;
  self->_lastSubscriptionFailureTime = v9;

  v13 = objc_msgSend__deviceUsesThread(self, v11, v12);
  objc_msgSend__clearSubscriptionPoolWork(self, v14, v15);
  os_unfair_lock_unlock(&self->_lock);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_2340E3EE8;
  v27[3] = &unk_2504EE8C0;
  v27[4] = self;
  v16 = (void *)MEMORY[0x23493EEA8](v27);
  v19 = 1000000 * objc_msgSend_unsignedIntValue(v4, v17, v18);
  if (v13)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend__scheduleSubscriptionPoolWork_inNanoseconds_description_(self, v20, (uint64_t)v16, v19, CFSTR("ReadClient resubscription"));
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v23 = dispatch_time(0, v19);
    objc_msgSend_queue(self, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v23, v26, v16);

  }
  objc_msgSend__setupConnectivityMonitoring(self, v21, v22);

}

- (void)_handleSubscriptionReset:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend__doHandleSubscriptionReset_(self, v6, (uint64_t)v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_doHandleSubscriptionReset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSDate *v7;
  NSDate *lastSubscriptionFailureTime;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  unsigned int lastSubscriptionAttemptWait;
  double v17;
  double v18;
  NSObject *v19;
  unsigned int v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  dispatch_time_t v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  MTRDevice *v33;
  double v34;
  _QWORD v35[5];
  uint8_t buf[4];
  MTRDevice *v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_now(MEMORY[0x24BDBCE60], v5, v6);
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastSubscriptionFailureTime = self->_lastSubscriptionFailureTime;
  self->_lastSubscriptionFailureTime = v7;

  if ((objc_msgSend__delegateExists(self, v9, v10) & 1) != 0
    && (objc_msgSend_reattemptingSubscription(self, v11, v12) & 1) == 0)
  {
    objc_msgSend_setReattemptingSubscription_(self, v13, 1);
    lastSubscriptionAttemptWait = self->_lastSubscriptionAttemptWait;
    if (lastSubscriptionAttemptWait)
    {
      if (v4)
      {
        self->_lastSubscriptionAttemptWait = 0;
        objc_msgSend_doubleValue(v4, v14, v15);
        v18 = v17;
        sub_234117B80(0, "NotSpecified");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v37 = self;
          v38 = 2048;
          v39 = v18;
          _os_log_impl(&dword_233BF3000, v19, OS_LOG_TYPE_DEFAULT, "%@ resetting resubscribe attempt counter, and delaying by the server-provided delay: %f", buf, 0x16u);
        }

        if (sub_234114844(2u))
        {
          v34 = v18;
          v33 = self;
          sub_2341147D0(0, 2);
        }
      }
      else
      {
        v20 = 2 * lastSubscriptionAttemptWait;
        if (v20 >= 0xE10)
          v20 = 3600;
        self->_lastSubscriptionAttemptWait = v20;
        v18 = (double)v20;
      }
    }
    else
    {
      self->_lastSubscriptionAttemptWait = 1;
      v18 = 1.0;
    }
    sub_234117B80(0, "NotSpecified");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = self;
      v38 = 2048;
      v39 = v18;
      _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_DEFAULT, "%@ scheduling to reattempt subscription in %f seconds", buf, 0x16u);
    }

    if (sub_234114844(2u))
    {
      v34 = v18;
      v33 = self;
      sub_2341147D0(0, 2);
    }
    objc_msgSend__clearSubscriptionPoolWork(self, v22, v23, v33, *(_QWORD *)&v34);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_2340E441C;
    v35[3] = &unk_2504EE8C0;
    v35[4] = self;
    v24 = (void *)MEMORY[0x23493EEA8](v35);
    v27 = objc_msgSend__deviceUsesThread(self, v25, v26);
    v28 = (const char *)(uint64_t)(v18 * 1000000000.0);
    if (v27)
    {
      objc_msgSend__scheduleSubscriptionPoolWork_inNanoseconds_description_(self, v28, (uint64_t)v24, (uint64_t)(v18 * 1000000000.0), CFSTR("MTRDevice resubscription"));
    }
    else
    {
      v29 = dispatch_time(0, (int64_t)v28);
      objc_msgSend_queue(self, v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      dispatch_after(v29, v32, v24);

    }
  }

}

- (void)_reattemptSubscriptionNowIfNeededWithReason:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  MTRDevice *v10;
  id v11;
  uint8_t buf[4];
  MTRDevice *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((objc_msgSend_reattemptingSubscription(self, v5, v6) & 1) != 0)
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_DEFAULT, "%@ reattempting subscription with reason %@", buf, 0x16u);
    }

    if (sub_234114844(2u))
    {
      v10 = self;
      v11 = v4;
      sub_2341147D0(0, 2);
    }
    objc_msgSend_setReattemptingSubscription_(self, v8, 0, v10, v11);
    objc_msgSend__setupSubscriptionWithReason_(self, v9, (uint64_t)v4);
  }

}

- (void)_handleUnsolicitedMessageFromPublisher
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  const char *v5;
  const char *v6;
  _QWORD v7[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend__changeState_(self, v4, 1);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2340E4654;
  v7[3] = &unk_2505023B8;
  v7[4] = self;
  objc_msgSend__callDelegatesWithBlock_(self, v5, (uint64_t)v7);
  objc_msgSend__reattemptSubscriptionNowIfNeededWithReason_(self, v6, (uint64_t)CFSTR("got unsolicited message from publisher"));
  os_unfair_lock_unlock(p_lock);
}

- (void)_markDeviceAsUnreachableIfNeverSubscribed
{
  NSObject *v3;
  const char *v4;
  MTRDevice *v5;
  uint8_t buf[4];
  MTRDevice *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_internalDeviceState <= 1)
  {
    sub_234117B80(0, "NotSpecified");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = self;
      _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "%@ still not subscribed, marking the device as unreachable", buf, 0xCu);
    }

    if (sub_234114844(2u))
    {
      v5 = self;
      sub_2341147D0(0, 2);
    }
    objc_msgSend__changeState_(self, v4, 2, v5);
  }
}

- (void)_handleReportBegin
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  unint64_t internalDeviceState;
  BOOL v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_receivingReport = 1;
  if (self->_state != 1)
    objc_msgSend__changeState_(self, v4, 1);
  internalDeviceState = self->_internalDeviceState;
  v7 = internalDeviceState != 2 && internalDeviceState != 4;
  self->_receivingPrimingReport = v7;
  os_unfair_lock_unlock(p_lock);
}

- (id)_clusterDataToPersistSnapshot
{
  const char *v3;
  uint64_t v4;
  void *v5;
  NSMutableDictionary *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_clusterDataToPersist;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self->_clusterDataToPersist, v8, v12, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend_copy(v13, v14, v15);
        objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v16, v12);

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v19, v23, 16);
    }
    while (v9);
  }

  return v5;
}

- (double)_reportToPersistenceDelayTimeAfterMutiplier
{
  uint64_t v2;
  double v4;

  objc_msgSend_reportToPersistenceDelayTime(self->_storageBehaviorConfiguration, a2, v2);
  return v4 * self->_reportToPersistenceDelayCurrentMultiplier;
}

- (double)_reportToPersistenceDelayTimeMaxAfterMutiplier
{
  uint64_t v2;
  double v4;

  objc_msgSend_reportToPersistenceDelayTimeMax(self->_storageBehaviorConfiguration, a2, v2);
  return v4 * self->_reportToPersistenceDelayCurrentMultiplier;
}

- (BOOL)_dataStoreExists
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_persistedClusterData != 0;
}

- (void)_persistClusterData
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSMutableDictionary *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSCache *persistedClusterData;
  void *v26;
  const char *v27;
  const char *v28;
  NSMutableDictionary *clusterDataToPersist;
  NSObject *v30;
  MTRDevice *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  MTRDevice *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  if ((objc_msgSend__dataStoreExists(self, v3, v4) & 1) != 0)
  {
    if (objc_msgSend_count(self->_clusterDataToPersist, v5, v6))
    {
      sub_234117B80(0, "NotSpecified");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend_count(self->_clusterDataToPersist, v8, v9);
        *(_DWORD *)buf = 138412546;
        v39 = self;
        v40 = 2048;
        v41 = v10;
        _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_DEFAULT, "%@ Storing cluster information (data version and attributes) count: %lu", buf, 0x16u);
      }

      if (sub_234114844(2u))
      {
        v31 = self;
        v32 = objc_msgSend_count(self->_clusterDataToPersist, v11, v12);
        sub_2341147D0(0, 2);
      }
      objc_msgSend__clusterDataToPersistSnapshot(self, v11, v12, v31, v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_controllerDataStore(self->_deviceController, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_storeClusterData_forNodeID_(v16, v17, (uint64_t)v13, self->_nodeID);

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v18 = self->_clusterDataToPersist;
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, v37, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v18);
            v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            persistedClusterData = self->_persistedClusterData;
            objc_msgSend_objectForKeyedSubscript_(self->_clusterDataToPersist, v20, v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(persistedClusterData, v27, (uint64_t)v26, v24);

            objc_msgSend_addObject_(self->_persistedClusters, v28, v24);
          }
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v33, v37, 16);
        }
        while (v21);
      }

      clusterDataToPersist = self->_clusterDataToPersist;
      self->_clusterDataToPersist = 0;

    }
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_impl(&dword_233BF3000, v30, OS_LOG_TYPE_ERROR, "%@ storage behavior: no data store in _persistClusterData!", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }
}

- (BOOL)_deviceIsReportingExcessively
{
  const char *v3;
  uint64_t v4;
  NSDate *deviceReportingExcessivelyStartTime;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  uint8_t buf[4];
  MTRDevice *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  deviceReportingExcessivelyStartTime = self->_deviceReportingExcessivelyStartTime;
  if (deviceReportingExcessivelyStartTime)
  {
    objc_msgSend_timeIntervalSinceNow(deviceReportingExcessivelyStartTime, v3, v4);
    v7 = -v6;
    objc_msgSend_deviceReportingExcessivelyIntervalThreshold(self->_storageBehaviorConfiguration, v8, v9);
    if (v10 >= v7)
    {
      LOBYTE(deviceReportingExcessivelyStartTime) = 0;
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = self;
        v15 = 2048;
        v16 = v7;
        _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: device has been reporting excessively for %.3lf seconds", buf, 0x16u);
      }

      if (sub_234114844(2u))
        sub_2341147D0(0, 2);
      LOBYTE(deviceReportingExcessivelyStartTime) = 1;
    }
  }
  return (char)deviceReportingExcessivelyStartTime;
}

- (void)_persistClusterDataAsNeeded
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  NSDate *clusterDataPersistenceFirstScheduledTime;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  NSDate *v28;
  NSObject *v29;
  NSObject *v30;
  uint8_t buf[4];
  MTRDevice *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (objc_msgSend_count(self->_clusterDataToPersist, v4, v5)
    && (objc_msgSend__deviceIsReportingExcessively(self, v6, v7) & 1) == 0)
  {
    objc_msgSend_lastObject(self->_mostRecentReportTimes, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceNow(v10, v11, v12);
    v14 = v13;
    objc_msgSend__reportToPersistenceDelayTimeAfterMutiplier(self, v15, v16);
    v19 = -v14;
    if (v20 <= -v14)
      goto LABEL_6;
    clusterDataPersistenceFirstScheduledTime = self->_clusterDataPersistenceFirstScheduledTime;
    if (!clusterDataPersistenceFirstScheduledTime)
    {
      sub_234117B80(0, "NotSpecified");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = self;
        _os_log_impl(&dword_233BF3000, v29, OS_LOG_TYPE_ERROR, "%@ storage behavior: expects _clusterDataPersistenceFirstScheduledTime if _clusterDataToPersist exists", buf, 0xCu);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      goto LABEL_7;
    }
    objc_msgSend_timeIntervalSinceNow(clusterDataPersistenceFirstScheduledTime, v17, v18);
    v23 = v22;
    objc_msgSend__reportToPersistenceDelayTimeMaxAfterMutiplier(self, v24, v25);
    v26 = -v23;
    if (v27 > v26)
    {
      sub_234117B80(0, "NotSpecified");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v32 = self;
        v33 = 2048;
        v34 = v19;
        v35 = 2048;
        v36 = v26;
        _os_log_impl(&dword_233BF3000, v30, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: not persisting: intervalSinceLastReport %lf intervalSinceFirstScheduledPersistence %lf", buf, 0x20u);
      }

      if (sub_234114844(2u))
        sub_2341147D0(0, 2);
    }
    else
    {
LABEL_6:
      objc_msgSend__persistClusterData(self, v17, v18);
      v28 = self->_clusterDataPersistenceFirstScheduledTime;
      self->_clusterDataPersistenceFirstScheduledTime = 0;

    }
LABEL_7:

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_scheduleClusterDataPersistence
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  MTRDeviceStorageBehaviorConfiguration *storageBehaviorConfiguration;
  MTRDeviceStorageBehaviorConfiguration *v10;
  MTRDeviceStorageBehaviorConfiguration *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSMutableArray *v16;
  NSMutableArray *mostRecentReportTimes;
  NSDate *v18;
  NSDate *clusterDataPersistenceFirstScheduledTime;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSMutableArray *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  double v34;
  unint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  double v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  NSObject *v63;
  double reportToPersistenceDelayCurrentMultiplier;
  NSObject *v65;
  NSObject *v66;
  NSDate *deviceReportingExcessivelyStartTime;
  double v68;
  NSDate *v69;
  NSDate *v70;
  NSObject *v71;
  NSDate *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  dispatch_time_t v76;
  const char *v77;
  uint64_t v78;
  NSObject *v79;
  MTRDevice *v80;
  double v81;
  _QWORD block[5];
  uint8_t buf[4];
  MTRDevice *v84;
  __int16 v85;
  double v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  if ((objc_msgSend__dataStoreExists(self, v3, v4) & 1) != 0)
  {
    if (objc_msgSend_count(self->_clusterDataToPersist, v5, v6))
    {
      storageBehaviorConfiguration = self->_storageBehaviorConfiguration;
      if (!storageBehaviorConfiguration)
      {
        v10 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
        v11 = self->_storageBehaviorConfiguration;
        self->_storageBehaviorConfiguration = v10;

        objc_msgSend_checkValuesAndResetToDefaultIfNecessary(self->_storageBehaviorConfiguration, v12, v13);
        storageBehaviorConfiguration = self->_storageBehaviorConfiguration;
      }
      if (objc_msgSend_disableStorageBehaviorOptimization(storageBehaviorConfiguration, v7, v8)
        || !self->_deviceCachePrimed)
      {
        objc_msgSend__persistClusterData(self, v14, v15);
      }
      else
      {
        if (!self->_mostRecentReportTimes)
        {
          objc_msgSend_array(MEMORY[0x24BDBCEB8], v14, v15);
          v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          mostRecentReportTimes = self->_mostRecentReportTimes;
          self->_mostRecentReportTimes = v16;

        }
        if (!self->_clusterDataPersistenceFirstScheduledTime)
        {
          objc_msgSend_now(MEMORY[0x24BDBCE60], v14, v15);
          v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
          clusterDataPersistenceFirstScheduledTime = self->_clusterDataPersistenceFirstScheduledTime;
          self->_clusterDataPersistenceFirstScheduledTime = v18;

        }
        while (1)
        {
          v20 = objc_msgSend_count(self->_mostRecentReportTimes, v14, v15);
          if (v20 < objc_msgSend_recentReportTimesMaxCount(self->_storageBehaviorConfiguration, v21, v22))
            break;
          objc_msgSend_removeObjectAtIndex_(self->_mostRecentReportTimes, v23, 0);
        }
        v25 = self->_mostRecentReportTimes;
        objc_msgSend_now(MEMORY[0x24BDBCE60], v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v25, v27, (uint64_t)v26);

        if ((unint64_t)objc_msgSend_count(self->_mostRecentReportTimes, v28, v29) >= 3)
        {
          v34 = 0.0;
          if ((unint64_t)objc_msgSend_count(self->_mostRecentReportTimes, v30, v31) >= 2)
          {
            v35 = 1;
            do
            {
              objc_msgSend_objectAtIndex_(self->_mostRecentReportTimes, v32, v35 - 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndex_(self->_mostRecentReportTimes, v37, v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_timeIntervalSinceDate_(v38, v39, (uint64_t)v36);
              if (v40 <= 0.0)
                v40 = -0.0;
              v34 = v34 + v40;

              ++v35;
            }
            while (objc_msgSend_count(self->_mostRecentReportTimes, v41, v42) > v35);
          }
          v43 = v34 / (double)(unint64_t)(objc_msgSend_count(self->_mostRecentReportTimes, v32, v33) - 1);
          objc_msgSend_timeBetweenReportsTooShortThreshold(self->_storageBehaviorConfiguration, v44, v45);
          if (v43 >= v48)
          {
            self->_reportToPersistenceDelayCurrentMultiplier = 1.0;
          }
          else
          {
            objc_msgSend_timeBetweenReportsTooShortThreshold(self->_storageBehaviorConfiguration, v46, v47);
            v50 = v49 - v43;
            objc_msgSend_timeBetweenReportsTooShortThreshold(self->_storageBehaviorConfiguration, v51, v52);
            v54 = v53;
            objc_msgSend_timeBetweenReportsTooShortMinThreshold(self->_storageBehaviorConfiguration, v55, v56);
            v60 = v50 / (v54 - v59);
            if (v60 <= 1.0)
              v61 = v60;
            else
              v61 = 1.0;
            objc_msgSend_reportToPersistenceDelayMaxMultiplier(self->_storageBehaviorConfiguration, v57, v58);
            self->_reportToPersistenceDelayCurrentMultiplier = v61 * (v62 + -1.0) + 1.0;
            sub_234117B80(0, "NotSpecified");
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              reportToPersistenceDelayCurrentMultiplier = self->_reportToPersistenceDelayCurrentMultiplier;
              *(_DWORD *)buf = 138412546;
              v84 = self;
              v85 = 2048;
              v86 = reportToPersistenceDelayCurrentMultiplier;
              _os_log_impl(&dword_233BF3000, v63, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: device reporting frequently - setting delay multiplier to %lf", buf, 0x16u);
            }

            if (sub_234114844(2u))
            {
              v81 = self->_reportToPersistenceDelayCurrentMultiplier;
              v80 = self;
              sub_2341147D0(0, 2);
            }
          }
          objc_msgSend_timeBetweenReportsTooShortMinThreshold(self->_storageBehaviorConfiguration, v46, v47, v80, *(_QWORD *)&v81);
          deviceReportingExcessivelyStartTime = self->_deviceReportingExcessivelyStartTime;
          if (v43 >= v68)
          {
            self->_deviceReportingExcessivelyStartTime = 0;

          }
          else if (!deviceReportingExcessivelyStartTime)
          {
            objc_msgSend_now(MEMORY[0x24BDBCE60], v30, v31);
            v69 = (NSDate *)objc_claimAutoreleasedReturnValue();
            v70 = self->_deviceReportingExcessivelyStartTime;
            self->_deviceReportingExcessivelyStartTime = v69;

            sub_234117B80(0, "NotSpecified");
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              v72 = self->_deviceReportingExcessivelyStartTime;
              *(_DWORD *)buf = 138412546;
              v84 = self;
              v85 = 2112;
              v86 = *(double *)&v72;
              _os_log_impl(&dword_233BF3000, v71, OS_LOG_TYPE_INFO, "%@ storage behavior: device is reporting excessively @%@", buf, 0x16u);
            }

            if (sub_234114844(3u))
            {
              v80 = self;
              v81 = *(double *)&self->_deviceReportingExcessivelyStartTime;
              sub_2341147D0(0, 3);
            }
          }
        }
        if ((objc_msgSend__deviceIsReportingExcessively(self, v30, v31, v80, *(_QWORD *)&v81) & 1) == 0)
        {
          objc_msgSend__reportToPersistenceDelayTimeAfterMutiplier(self, v73, v74);
          v76 = dispatch_time(0, (uint64_t)(v75 * 1000000000.0));
          objc_msgSend_queue(self, v77, v78);
          v79 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = sub_2340E564C;
          block[3] = &unk_2504EE8C0;
          block[4] = self;
          dispatch_after(v76, v79, block);

        }
      }
      return;
    }
    sub_234117B80(0, "NotSpecified");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v84 = self;
      _os_log_impl(&dword_233BF3000, v66, OS_LOG_TYPE_INFO, "%@ storage behavior: nothing to persist", buf, 0xCu);
    }

    if (sub_234114844(3u))
LABEL_30:
      sub_2341147D0(0, 3);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v84 = self;
      _os_log_impl(&dword_233BF3000, v65, OS_LOG_TYPE_INFO, "%@ storage behavior: no data store", buf, 0xCu);
    }

    if (sub_234114844(3u))
      goto LABEL_30;
  }
}

- (void)_resetStorageBehaviorState
{
  NSDate *clusterDataPersistenceFirstScheduledTime;
  NSMutableArray *mostRecentReportTimes;
  NSDate *deviceReportingExcessivelyStartTime;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  os_unfair_lock_assert_owner(&self->_lock);
  clusterDataPersistenceFirstScheduledTime = self->_clusterDataPersistenceFirstScheduledTime;
  self->_clusterDataPersistenceFirstScheduledTime = 0;

  mostRecentReportTimes = self->_mostRecentReportTimes;
  self->_mostRecentReportTimes = 0;

  deviceReportingExcessivelyStartTime = self->_deviceReportingExcessivelyStartTime;
  self->_deviceReportingExcessivelyStartTime = 0;

  self->_reportToPersistenceDelayCurrentMultiplier = 1.0;
  if (objc_msgSend__dataStoreExists(self, v6, v7))
    objc_msgSend__persistClusterData(self, v8, v9);
}

- (void)setStorageBehaviorConfiguration:(id)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint8_t buf[4];
  MTRDevice *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sub_234117B80(0, "NotSpecified");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: setStorageBehaviorConfiguration %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, a3);
  objc_msgSend_checkValuesAndResetToDefaultIfNecessary(self->_storageBehaviorConfiguration, v7, v8);
  objc_msgSend__resetStorageBehaviorState(self, v9, v10);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_handleReportEnd
{
  os_unfair_lock_s *p_lock;
  NSDate *estimatedStartTimeFromGeneralDiagnosticsUpTime;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _QWORD v9[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_receivingReport = 0;
  estimatedStartTimeFromGeneralDiagnosticsUpTime = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
  self->_estimatedStartTimeFromGeneralDiagnosticsUpTime = 0;

  objc_msgSend__scheduleClusterDataPersistence(self, v5, v6);
  if (self->_deviceConfigurationChanged)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_2340E58E4;
    v9[3] = &unk_2505023B8;
    v9[4] = self;
    objc_msgSend__callDelegatesWithBlock_(self, v7, (uint64_t)v9);
    self->_deviceConfigurationChanged = 0;
  }
  if (!self->_deviceCachePrimed)
  {
    self->_deviceCachePrimed = 1;
    objc_msgSend__callDelegateDeviceCachePrimed(self, v7, v8);
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_interestedPaths:(id)a3 includesAttributePath:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char isEqualToNumber;
  const char *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  char v42;
  uint64_t v43;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v46, v50, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v47;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend_endpoint(v6, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToNumber = objc_msgSend_isEqualToNumber_(v12, v16, (uint64_t)v15);

          goto LABEL_10;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v11;
          objc_msgSend_cluster(v19, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cluster(v6, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToNumber = objc_msgSend_isEqualToNumber_(v22, v26, (uint64_t)v25);

LABEL_10:
          if ((isEqualToNumber & 1) != 0)
            goto LABEL_20;
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v11;
          objc_msgSend_cluster(v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cluster(v6, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToNumber_(v30, v34, (uint64_t)v33) & 1) != 0)
          {
            objc_msgSend_attribute(v27, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_attribute(v6, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend_isEqualToNumber_(v37, v41, (uint64_t)v40);

            if ((v42 & 1) != 0)
            {
LABEL_20:
              LOBYTE(v8) = 1;
              goto LABEL_21;
            }
          }
          else
          {

          }
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v46, v50, 16);
      v8 = v43;
    }
    while (v43);
  }
LABEL_21:

  return v8;
}

- (id)_filteredAttributes:(id)a3 forInterestedPaths:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  MTRDevice *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v10 = v7;
  v42 = v6;
  if (v7)
  {
    if (objc_msgSend_count(v7, v8, v9))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v11 = v6;
      v13 = 0;
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v43, v53, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v44 != v16)
              objc_enumerationMutation(v11);
            v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v18, v14, (uint64_t)CFSTR("attributePath"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend__interestedPaths_includesAttributePath_(self, v20, (uint64_t)v10, v19))
            {
              if (!v13)
              {
                objc_msgSend_array(MEMORY[0x24BDBCEB8], v21, v22);
                v13 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend_addObject_(v13, v21, (uint64_t)v18);
            }

          }
          v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v43, v53, 16);
        }
        while (v15);
      }

      if (objc_msgSend_count(v13, v23, v24))
      {
        v27 = objc_msgSend_count(v13, v25, v26);
        if (v27 != objc_msgSend_count(v11, v28, v29))
        {
          sub_234117B80(0, "NotSpecified");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v33 = objc_msgSend_count(v11, v31, v32);
            v36 = objc_msgSend_count(v13, v34, v35);
            *(_DWORD *)buf = 138412802;
            v48 = self;
            v49 = 2048;
            v50 = v33;
            v51 = 2048;
            v52 = v36;
            _os_log_impl(&dword_233BF3000, v30, OS_LOG_TYPE_DEFAULT, "%@ filtered attribute report %lu => %lu", buf, 0x20u);
          }

          if (sub_234114844(2u))
          {
            objc_msgSend_count(v11, v37, v38);
            objc_msgSend_count(v13, v39, v40);
            sub_2341147D0(0, 2);
          }
        }
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (void)_reportAttributes:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend_count(v7, v4, v5))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_2340E6018;
    v8[3] = &unk_2505024A8;
    v8[4] = self;
    v9 = v7;
    objc_msgSend__iterateDelegatesWithBlock_(self, v6, (uint64_t)v8);

  }
}

- (void)_handleAttributeReport:(id)a3 fromSubscription:(BOOL)a4
{
  _BOOL8 v4;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend__getAttributesToReportWithReportedValues_fromSubscription_(self, v6, (uint64_t)v9, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__reportAttributes_(self, v8, (uint64_t)v7);

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_interestedPaths:(id)a3 includesEventPath:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char isEqualToNumber;
  const char *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  char v42;
  uint64_t v43;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v46, v50, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v47;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend_endpoint(v6, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToNumber = objc_msgSend_isEqualToNumber_(v12, v16, (uint64_t)v15);

          goto LABEL_10;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v11;
          objc_msgSend_cluster(v19, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cluster(v6, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToNumber = objc_msgSend_isEqualToNumber_(v22, v26, (uint64_t)v25);

LABEL_10:
          if ((isEqualToNumber & 1) != 0)
            goto LABEL_20;
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v11;
          objc_msgSend_cluster(v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cluster(v6, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToNumber_(v30, v34, (uint64_t)v33) & 1) != 0)
          {
            objc_msgSend_event(v27, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_event(v6, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend_isEqualToNumber_(v37, v41, (uint64_t)v40);

            if ((v42 & 1) != 0)
            {
LABEL_20:
              LOBYTE(v8) = 1;
              goto LABEL_21;
            }
          }
          else
          {

          }
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v46, v50, 16);
      v8 = v43;
    }
    while (v43);
  }
LABEL_21:

  return v8;
}

- (id)_filteredEvents:(id)a3 forInterestedPaths:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  MTRDevice *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v10 = v7;
  v42 = v6;
  if (v7)
  {
    if (objc_msgSend_count(v7, v8, v9))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v11 = v6;
      v13 = 0;
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v43, v53, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v44 != v16)
              objc_enumerationMutation(v11);
            v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v18, v14, (uint64_t)CFSTR("eventPath"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend__interestedPaths_includesEventPath_(self, v20, (uint64_t)v10, v19))
            {
              if (!v13)
              {
                objc_msgSend_array(MEMORY[0x24BDBCEB8], v21, v22);
                v13 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend_addObject_(v13, v21, (uint64_t)v18);
            }

          }
          v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v43, v53, 16);
        }
        while (v15);
      }

      if (objc_msgSend_count(v13, v23, v24))
      {
        v27 = objc_msgSend_count(v13, v25, v26);
        if (v27 != objc_msgSend_count(v11, v28, v29))
        {
          sub_234117B80(0, "NotSpecified");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v33 = objc_msgSend_count(v11, v31, v32);
            v36 = objc_msgSend_count(v13, v34, v35);
            *(_DWORD *)buf = 138412802;
            v48 = self;
            v49 = 2048;
            v50 = v33;
            v51 = 2048;
            v52 = v36;
            _os_log_impl(&dword_233BF3000, v30, OS_LOG_TYPE_DEFAULT, "%@ filtered event report %lu => %lu", buf, 0x20u);
          }

          if (sub_234114844(2u))
          {
            objc_msgSend_count(v11, v37, v38);
            objc_msgSend_count(v13, v39, v40);
            sub_2341147D0(0, 2);
          }
        }
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (void)_handleEventReport:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSMutableArray *unreportedEvents;
  NSMutableArray *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSDate *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  _BOOL4 v24;
  const char *v25;
  NSObject *v26;
  NSDate *estimatedStartTimeFromGeneralDiagnosticsUpTime;
  NSDate *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  NSDate *estimatedStartTime;
  const char *v55;
  NSMutableArray *v56;
  NSMutableArray *v57;
  MTRDevice *v58;
  MTRDevice *v59;
  NSDate *v60;
  id v61;
  NSDate *v62;
  id *location;
  id obj;
  NSMutableArray *v65;
  NSMutableArray *v66;
  uint64_t v67;
  _QWORD v68[5];
  NSMutableArray *v69;
  _BYTE *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE buf[24];
  char v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  os_unfair_lock_lock(&self->_lock);
  v62 = self->_estimatedStartTime;
  location = (id *)&self->_estimatedStartTime;
  unreportedEvents = self->_unreportedEvents;
  if (unreportedEvents)
  {
    v7 = unreportedEvents;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5);
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  v65 = v7;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v61;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v71, v77, 16);
  if (v10)
  {
    v67 = *(_QWORD *)v72;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v72 != v67)
          objc_enumerationMutation(obj);
        v12 = *(NSDate **)(*((_QWORD *)&v71 + 1) + 8 * v11);
        objc_msgSend_objectForKeyedSubscript_(v12, v9, (uint64_t)CFSTR("eventPath"), v58, v60);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cluster(v13, v14, v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_unsignedLongValue(v16, v17, v18) == 40)
        {
          objc_msgSend_event(v13, v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend_unsignedLongValue(v21, v22, v23) == 0;

          if (!v24)
            goto LABEL_24;
          if (self->_estimatedStartTimeFromGeneralDiagnosticsUpTime)
          {
            sub_234117B80(0, "NotSpecified");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              estimatedStartTimeFromGeneralDiagnosticsUpTime = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = estimatedStartTimeFromGeneralDiagnosticsUpTime;
              _os_log_impl(&dword_233BF3000, v26, OS_LOG_TYPE_DEFAULT, "%@ StartUp event: set estimated start time forward to %@", buf, 0x16u);
            }

            if (sub_234114844(2u))
            {
              v59 = self;
              v60 = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
              sub_2341147D0(0, 2);
            }
            v28 = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
          }
          else
          {
            sub_234117B80(0, "NotSpecified");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = self;
              _os_log_impl(&dword_233BF3000, v29, OS_LOG_TYPE_DEFAULT, "%@ StartUp event: set estimated start time to nil", buf, 0xCu);
            }

            if (sub_234114844(2u))
            {
              v59 = self;
              sub_2341147D0(0, 2);
            }
            v28 = 0;
          }
          v16 = *location;
          *location = v28;
        }

LABEL_24:
        objc_msgSend_objectForKeyedSubscript_(v12, v25, (uint64_t)CFSTR("eventTimeType"), v59);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v30;
        if (v30)
        {
          if (objc_msgSend_unsignedIntegerValue(v30, v31, v32))
            goto LABEL_31;
          objc_msgSend_objectForKeyedSubscript_(v12, v34, (uint64_t)CFSTR("eventSystemUpTime"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v36;
          if (v36)
          {
            objc_msgSend_doubleValue(v36, v37, v38);
            objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v41, v42, -v40);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v43;
            if (!*location || objc_msgSend_compare_(v43, v44, (uint64_t)*location) == -1)
              objc_storeStrong(location, v45);

LABEL_31:
            v46 = (void *)objc_msgSend_mutableCopy(v12, v34, v35);
            v48 = v46;
            if (self->_receivingPrimingReport)
              objc_msgSend_setObject_forKeyedSubscript_(v46, v47, MEMORY[0x24BDBD1C8], CFSTR("eventIsHistorical"));
            else
              objc_msgSend_setObject_forKeyedSubscript_(v46, v47, MEMORY[0x24BDBD1C0], CFSTR("eventIsHistorical"));
            objc_msgSend_addObject_(v65, v49, (uint64_t)v48);

            goto LABEL_39;
          }
          sub_234117B80(0, "NotSpecified");
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v12;
            _os_log_impl(&dword_233BF3000, v51, OS_LOG_TYPE_ERROR, "%@ Event %@ missing event time value", buf, 0x16u);
          }

          if (sub_234114844(1u))
            goto LABEL_38;
        }
        else
        {
          sub_234117B80(0, "NotSpecified");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v12;
            _os_log_impl(&dword_233BF3000, v50, OS_LOG_TYPE_ERROR, "%@ Event %@ missing event time type", buf, 0x16u);
          }

          if (sub_234114844(1u))
          {
LABEL_38:
            v58 = self;
            v60 = v12;
            sub_2341147D0(0, 1);
          }
        }
LABEL_39:

        ++v11;
      }
      while (v10 != v11);
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v71, v77, 16);
      v10 = v52;
    }
    while (v52);
  }

  if (v62 != *location)
  {
    sub_234117B80(0, "NotSpecified");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      estimatedStartTime = self->_estimatedStartTime;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = estimatedStartTime;
      _os_log_impl(&dword_233BF3000, v53, OS_LOG_TYPE_DEFAULT, "%@ updated estimated start time to %@", buf, 0x16u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v76 = 0;
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = sub_2340E6F60;
  v68[3] = &unk_2505024D0;
  v68[4] = self;
  v66 = v65;
  v69 = v66;
  v70 = buf;
  objc_msgSend__iterateDelegatesWithBlock_(self, v55, (uint64_t)v68);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    v56 = 0;
  else
    v56 = v66;
  v57 = self->_unreportedEvents;
  self->_unreportedEvents = v56;

  _Block_object_dispose(buf, 8);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_reconcilePersistedClustersWithStorage
{
  const char *v3;
  uint64_t v4;
  NSMutableSet *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSNumber *nodeID;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  MTRDevice *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  MTRDevice *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v3, v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_persistedClusters;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v39, v49, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v40;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
        objc_msgSend_controllerDataStore(self->_deviceController, v7, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        nodeID = self->_nodeID;
        objc_msgSend_endpoint(v12, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cluster(v12, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_getStoredClusterDataForNodeID_endpointID_clusterID_(v13, v21, (uint64_t)nodeID, v17, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          objc_msgSend_addObject_(v38, v23, (uint64_t)v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v39, v49, 16);
    }
    while (v9);
  }

  sub_234117B80(0, "NotSpecified");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v27 = objc_msgSend_count(v38, v25, v26);
    v30 = objc_msgSend_count(self->_persistedClusters, v28, v29);
    *(_DWORD *)buf = 138412802;
    v44 = self;
    v45 = 2048;
    v46 = v27;
    v47 = 2048;
    v48 = v30;
    _os_log_impl(&dword_233BF3000, v24, OS_LOG_TYPE_ERROR, "%@ Storage missing %lu / %lu clusters - reconciling in-memory records", buf, 0x20u);
  }

  if (sub_234114844(1u))
  {
    v36 = objc_msgSend_count(v38, v31, v32);
    v37 = objc_msgSend_count(self->_persistedClusters, v33, v34);
    v35 = self;
    sub_2341147D0(0, 1);
  }
  objc_msgSend_minusSet_(self->_persistedClusters, v31, (uint64_t)v38, v35, v36, v37);

}

- (id)_clusterDataForPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSMutableDictionary *clusterDataToPersist;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSNumber *nodeID;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  const __CFString *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint8_t buf[4];
  MTRDevice *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  clusterDataToPersist = self->_clusterDataToPersist;
  if (!clusterDataToPersist
    || (objc_msgSend_objectForKeyedSubscript_(clusterDataToPersist, v5, (uint64_t)v4),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!objc_msgSend__dataStoreExists(self, v5, v6)
      || (objc_msgSend_objectForKey_(self->_persistedClusterData, v9, (uint64_t)v4),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_msgSend_containsObject_(self->_persistedClusters, v9, (uint64_t)v4))
      {
        objc_msgSend_controllerDataStore(self->_deviceController, v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        nodeID = self->_nodeID;
        objc_msgSend_endpoint(v4, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cluster(v4, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_getStoredClusterDataForNodeID_endpointID_clusterID_(v12, v20, (uint64_t)nodeID, v16, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        sub_234117B80(0, "NotSpecified");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = CFSTR("YES");
          *(_DWORD *)buf = 138412802;
          v30 = self;
          v31 = 2112;
          if (!v8)
            v22 = CFSTR("NO");
          v32 = v4;
          v33 = 2112;
          v34 = v22;
          _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_DEFAULT, "%@ cluster path %@ cache miss - load from storage success %@", buf, 0x20u);
        }

        if (sub_234114844(2u))
          sub_2341147D0(0, 2);
        if (v8)
        {
          objc_msgSend_setObject_forKey_(self->_persistedClusterData, v23, (uint64_t)v8, v4);
        }
        else
        {
          objc_msgSend__reconcilePersistedClustersWithStorage(self, v23, v24);
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, (uint64_t)CFSTR("Data store has no data for cluster %@"), v4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__resetSubscriptionWithReasonString_(self, v27, (uint64_t)v26);

        }
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v8;
}

- (id)_knownClusters
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *clusterDataToPersist;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;

  os_unfair_lock_assert_owner(&self->_lock);
  v7 = (void *)objc_msgSend_mutableCopy(self->_persistedClusters, v3, v4);
  clusterDataToPersist = self->_clusterDataToPersist;
  if (clusterDataToPersist)
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend_allKeys(clusterDataToPersist, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v9, v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v7, v13, (uint64_t)v12);

  }
  return v7;
}

- (id)_getCachedDataVersions
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  MTRDevice *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend__knownClusters(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend__clusterDataForPath_(self, v9, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dataVersion(v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v4, v18, (uint64_t)v17, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v26, v34, 16);
    }
    while (v10);
  }

  sub_234117B80(0, "NotSpecified");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend_count(v4, v20, v21);
    *(_DWORD *)buf = 138412546;
    v31 = self;
    v32 = 2048;
    v33 = v22;
    _os_log_impl(&dword_233BF3000, v19, OS_LOG_TYPE_INFO, "%@ _getCachedDataVersions dataVersions count: %lu", buf, 0x16u);
  }

  if (sub_234114844(3u))
  {
    objc_msgSend_count(v4, v23, v24);
    sub_2341147D0(0, 3);
  }
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

- (id)_cachedAttributeValueForPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_endpoint(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cluster(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v11, (uint64_t)v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__clusterDataForPath_(self, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  if (v14)
  {
    objc_msgSend_attributes(v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_attribute(v4, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v22, (uint64_t)v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_setCachedAttributeValue:(id)a3 forPath:(id)a4 fromSubscription:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  MTRDeviceClusterData *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSMutableDictionary *clusterDataToPersist;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  int v31;
  const char *v32;
  char v33;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_endpoint(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cluster(v9, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v16, (uint64_t)v12, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__clusterDataForPath_(self, v18, (uint64_t)v17);
  v21 = (MTRDeviceClusterData *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    if (!v8)
    {
      v21 = 0;
      goto LABEL_12;
    }
    v21 = objc_alloc_init(MTRDeviceClusterData);
  }
  objc_msgSend_attribute(v9, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_storeValue_forAttribute_(v21, v23, (uint64_t)v8, v22);

  if (v8 && v5 && !self->_receivingPrimingReport && sub_2340E7C20(v9))
  {
    v31 = 0;
    v32 = "dwnpm_bad_c_attr_update";
    v33 = 0;
    sub_2341C4BEC((uint64_t)&v31);
    objc_msgSend__addInformationalAttributesToCurrentMetricScope(self, v26, v27);
    v31 = 1;
    v32 = "dwnpm_bad_c_attr_update";
    v33 = 0;
    sub_2341C4BEC((uint64_t)&v31);
  }
  else
  {
    clusterDataToPersist = self->_clusterDataToPersist;
    if (!clusterDataToPersist)
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v24, v25);
      v29 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v30 = self->_clusterDataToPersist;
      self->_clusterDataToPersist = v29;

      clusterDataToPersist = self->_clusterDataToPersist;
    }
    objc_msgSend_setObject_forKeyedSubscript_(clusterDataToPersist, v24, (uint64_t)v21, v17);
  }
LABEL_12:

}

- (void)_removeCachedAttribute:(id)a3 fromCluster:(id)a4
{
  id v6;
  const char *v7;
  NSMutableDictionary *clusterDataToPersist;
  void *v9;
  const char *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  clusterDataToPersist = self->_clusterDataToPersist;
  if (clusterDataToPersist)
  {
    objc_msgSend_objectForKeyedSubscript_(clusterDataToPersist, v7, (uint64_t)v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeValueForAttribute_(v9, v10, (uint64_t)v11);

  }
}

- (void)_createDataVersionFilterListFromDictionary:(id)a3 dataVersionFilterList:(DataVersionFilter *)a4 count:(unint64_t *)a5 sizeReduction:(unint64_t)a6
{
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  int v38;
  char *v39;
  id v42;
  DataVersionFilter *v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v9 = objc_msgSend_count(v42, v7, v8);
  if (objc_msgSend_count(v42, v10, v11) && (v12 = v9 - a6, v9 > a6))
  {
    v13 = (_QWORD *)operator new[]();
    *v13 = 16;
    v13[1] = v12;
    v43 = (DataVersionFilter *)(v13 + 2);
    if (v9 != a6)
    {
      v14 = v13 + 2;
      do
      {
        *(_DWORD *)v14 = -1;
        *((_BYTE *)v14 + 4) = 0;
        *((_WORD *)v14 + 6) = -1;
        v14 += 2;
      }
      while (v14 != (_QWORD *)((char *)v43 + 16 * v12));
    }
    v44 = v9 - a6;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = v42;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v45, v49, 16);
    if (v18)
    {
      v19 = 0;
      v20 = *(_QWORD *)v46;
LABEL_8:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v21);
        objc_msgSend_objectForKeyedSubscript_(v15, v17, (uint64_t)v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend_endpoint(v22, v23, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend_unsignedShortValue(v26, v27, v28);
          objc_msgSend_cluster(v22, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_unsignedLongValue(v32, v33, v34);
          v38 = objc_msgSend_unsignedLongValue(v25, v36, v37);
          v39 = (char *)v43 + 16 * v19;
          *(_DWORD *)v39 = v35;
          v39[4] = 1;
          *((_DWORD *)v39 + 2) = v38;
          *((_WORD *)v39 + 6) = v29;

          ++v19;
        }

        if (v19 == v44)
          break;
        if (v18 == ++v21)
        {
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v45, v49, 16);
          if (v18)
            goto LABEL_8;
          break;
        }
      }
    }

    *a4 = v43;
    *a5 = v44;
  }
  else
  {
    *a5 = 0;
    *a4 = 0;
  }

}

- (void)_stopConnectivityMonitoring
{
  const char *v3;
  uint64_t v4;
  MTRDeviceConnectivityMonitor *connectivityMonitor;
  MTRDeviceConnectivityMonitor *v6;

  os_unfair_lock_assert_owner(&self->_lock);
  connectivityMonitor = self->_connectivityMonitor;
  if (connectivityMonitor)
  {
    objc_msgSend_stopMonitoring(connectivityMonitor, v3, v4);
    v6 = self->_connectivityMonitor;
    self->_connectivityMonitor = 0;

  }
}

- (void)_resetSubscriptionWithReasonString:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  MTRDeviceController *deviceController;
  MTRDevice *v8;
  id v9;
  _QWORD v10[5];
  uint8_t buf[4];
  MTRDevice *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_ERROR, "%@ %@ - resetting subscription", buf, 0x16u);
  }

  if (sub_234114844(1u))
  {
    v8 = self;
    v9 = v4;
    sub_2341147D0(0, 1);
  }
  deviceController = self->_deviceController;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2340E82F8;
  v10[3] = &unk_2504EE8C0;
  v10[4] = self;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v6, (uint64_t)v10, 0, v8, v9);

}

- (void)_setupSubscriptionWithReason:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  unint64_t internalDeviceState;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  MTRDeviceController *deviceController;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD block[4];
  id v26;
  uint8_t buf[4];
  _BYTE v28[18];
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((objc_msgSend__subscriptionsAllowed(self, v5, v6) & 1) != 0)
  {
    if (self->_internalDeviceState)
    {
      sub_234117B80(0, "NotSpecified");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        internalDeviceState = self->_internalDeviceState;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v28 = self;
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = internalDeviceState;
        v29 = 2112;
        v30 = v4;
        _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_DEFAULT, "%@ setupSubscription: no need to subscribe due to internal state %lu (reason: %@)", buf, 0x20u);
      }

      if (sub_234114844(2u))
LABEL_6:
        sub_2341147D0(0, 2);
    }
    else
    {
      objc_msgSend__changeInternalState_(self, v7, 1);
      sub_234117B80(0, "NotSpecified");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v28 = self;
        *(_WORD *)&v28[8] = 2112;
        *(_QWORD *)&v28[10] = v4;
        _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_DEFAULT, "%@ setting up subscription with reason: %@", buf, 0x16u);
      }

      if (sub_234114844(2u))
        sub_2341147D0(0, 2);
      objc_initWeak((id *)buf, self);
      v12 = dispatch_time(0, 10000000000);
      objc_msgSend_queue(self, v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_2340E87E8;
      block[3] = &unk_2504F03D8;
      objc_copyWeak(&v26, (id *)buf);
      dispatch_after(v12, v15, block);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
      *(_DWORD *)buf = 0;
      *(_QWORD *)&v28[4] = "dwnpm_dev_initial_subscription_setup";
      v28[16] = 0;
      sub_2341C4BEC((uint64_t)buf);
      deviceController = self->_deviceController;
      v20 = objc_msgSend_unsignedLongLongValue(self->_nodeID, v18, v19);
      v24[0] = v16;
      v24[1] = 3221225472;
      v24[2] = sub_2340E8854;
      v24[3] = &unk_250502548;
      v24[4] = self;
      objc_msgSend_directlyGetSessionForNode_completion_(deviceController, v21, v20, v24);
      objc_msgSend__setupConnectivityMonitoring(self, v22, v23);
    }
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v28 = self;
      *(_WORD *)&v28[8] = 2112;
      *(_QWORD *)&v28[10] = v4;
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_DEFAULT, "%@ _setupSubscription: Subscriptions not allowed. Do not set up subscription (reason: %@)", buf, 0x16u);
    }

    if (sub_234114844(2u))
      goto LABEL_6;
  }

}

- (NSDictionary)readAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRReadParams *)params
{
  NSNumber *v10;
  NSNumber *v11;
  NSNumber *v12;
  MTRReadParams *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  unsigned int v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  void *v33;
  MTRAsyncWorkItem *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  NSNumber *v47;
  NSNumber *v48;
  NSNumber *v49;
  const char *v50;
  id v51;
  id v52;
  NSNumber *v53;
  NSNumber *v54;
  NSNumber *v55;
  const char *v56;
  id v57;
  id v58;
  NSNumber *v59;
  NSNumber *v60;
  NSNumber *v61;
  const char *v62;
  MTRAsyncWorkQueue *asyncWorkQueue;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  void *v72;
  MTRReadParams *v73;
  NSNumber *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  NSNumber *v82;
  NSNumber *v83;
  NSNumber *v84;
  uint64_t v85;
  _QWORD v86[4];
  id v87;
  id v88;
  NSNumber *v89;
  NSNumber *v90;
  NSNumber *v91;
  uint64_t v92;
  _QWORD v93[4];
  id v94;
  NSNumber *v95;
  NSNumber *v96;
  NSNumber *v97;
  uint64_t v98;
  _QWORD v99[4];

  v99[2] = *MEMORY[0x24BDAC8D0];
  v10 = endpointID;
  v11 = clusterID;
  v12 = attributeID;
  v13 = params;
  objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v14, (uint64_t)v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(params) = objc_msgSend_unsignedIntValue(v11, v16, v17);
  v20 = objc_msgSend_unsignedIntValue(v12, v18, v19);
  if (sub_233CB2848((int)params, v20))
  {
    v23 = sub_2340E7C20(v15);
  }
  else if (v13)
  {
    v23 = objc_msgSend_shouldAssumeUnknownAttributesReportable(v13, v21, v22) ^ 1;
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend__attributeValueDictionaryForAttributePath_(self, v21, (uint64_t)v15);
  v78 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__subscriptionAbleToReport(self, v24, v25) ^ 1 | v23) == 1)
  {
    objc_msgSend_requestPathWithEndpointID_clusterID_attributeID_(MTRAttributeRequestPath, v26, (uint64_t)v10, v11, v12);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v76;
    v30 = v13;
    if (!v13)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v99[1] = v30;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v28, (uint64_t)v99, 2);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)

    if ((objc_msgSend_hasDuplicateForTypeID_workItemData_(self->_asyncWorkQueue, v31, 1, v77) & 1) == 0)
    {
      objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCEB8], v32, (uint64_t)v77);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = [MTRAsyncWorkItem alloc];
      objc_msgSend_queue(self, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = (void *)objc_msgSend_initWithQueue_(v34, v38, (uint64_t)v37);

      v73 = v13;
      v74 = v10;
      v72 = v15;
      v41 = objc_msgSend_uniqueID(v75, v39, v40);
      objc_msgSend_nodeID(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = MEMORY[0x24BDAC760];
      v93[0] = MEMORY[0x24BDAC760];
      v93[1] = 3221225472;
      v93[2] = sub_2340EA5F0;
      v93[3] = &unk_250502570;
      v98 = v41;
      v46 = v44;
      v94 = v46;
      v47 = v10;
      v95 = v47;
      v48 = v11;
      v96 = v48;
      v49 = v12;
      v97 = v49;
      objc_msgSend_setBatchingID_data_handler_(v75, v50, 1, v33, v93);
      v86[0] = v45;
      v86[1] = 3221225472;
      v86[2] = sub_2340EAB00;
      v86[3] = &unk_250502598;
      v51 = v33;
      v87 = v51;
      v92 = v41;
      v52 = v46;
      v88 = v52;
      v53 = v47;
      v89 = v53;
      v54 = v48;
      v90 = v54;
      v55 = v49;
      v91 = v55;
      objc_msgSend_setDuplicateTypeID_handler_(v75, v56, 1, v86);
      v79[0] = MEMORY[0x24BDAC760];
      v79[1] = 3221225472;
      v79[2] = sub_2340EAD78;
      v79[3] = &unk_2505025E8;
      v57 = v51;
      v80 = v57;
      v85 = v41;
      v58 = v52;
      v81 = v58;
      v59 = v53;
      v82 = v59;
      v60 = v54;
      v83 = v60;
      v61 = v55;
      v84 = v61;
      objc_msgSend_setReadyHandler_(v75, v62, (uint64_t)v79);
      asyncWorkQueue = self->_asyncWorkQueue;
      v66 = objc_msgSend_unsignedLongLongValue(v60, v64, v65);
      v69 = objc_msgSend_unsignedLongLongValue(v61, v67, v68);
      objc_msgSend_enqueueWorkItem_descriptionWithFormat_(asyncWorkQueue, v70, (uint64_t)v75, CFSTR("read %@ 0x%llx 0x%llx"), v59, v66, v69);

      v13 = v73;
      v10 = v74;
      v15 = v72;

    }
  }
  else
  {
    objc_msgSend__readThroughSkipped(self, v26, v27);
  }

  return (NSDictionary *)v78;
}

- (void)writeAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID value:(id)value expectedValueInterval:(NSNumber *)expectedValueInterval timedWriteTimeout:(NSNumber *)timeout
{
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  MTRAsyncWorkItem *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  NSNumber *v49;
  const char *v50;
  const char *v51;
  id v52;
  id v53;
  const char *v54;
  MTRAsyncWorkQueue *asyncWorkQueue;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  NSNumber *v63;
  NSNumber *v64;
  NSNumber *v65;
  NSNumber *v66;
  void *v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD *v72;
  uint64_t v73;
  _QWORD v74[4];
  NSNumber *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[3];
  char v79;
  _QWORD v80[4];
  void *v81;
  _QWORD v82[2];
  _QWORD v83[4];

  v83[2] = *MEMORY[0x24BDAC8D0];
  v14 = endpointID;
  v15 = clusterID;
  v16 = attributeID;
  v68 = value;
  v17 = expectedValueInterval;
  v18 = timeout;
  v19 = v18;
  v65 = v16;
  v66 = v15;
  v64 = v14;
  if (v18)
  {
    sub_2340DE8AC(v18, &unk_250596E88, &unk_250596EA0);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  sub_2340DE8AC(v17, &unk_250596E88, &unk_250596EB8);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v21, (uint64_t)v14, v15, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v79 = 1;
  v77 = 0;
  v82[0] = CFSTR("attributePath");
  v82[1] = CFSTR("data");
  v83[0] = v22;
  v83[1] = v68;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v83, v82, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v25, (uint64_t)&v81, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpectedValues_expectedValueInterval_expectedValueID_(self, v27, (uint64_t)v26, v67, &v77);

  v28 = [MTRAsyncWorkItem alloc];
  objc_msgSend_queue(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend_initWithQueue_(v28, v32, (uint64_t)v31);

  v36 = objc_msgSend_uniqueID(v33, v34, v35);
  v63 = self->_nodeID;
  v80[0] = v22;
  v41 = (void *)objc_msgSend_copy(v68, v37, v38);
  v80[1] = v41;
  v42 = v19;
  if (!v19)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v80[2] = v42;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v39, v77);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v43;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v44, (uint64_t)v80, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCEB8], v46, (uint64_t)v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = MEMORY[0x24BDAC760];
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = sub_2340EBAC4;
  v74[3] = &unk_250502610;
  v76 = v36;
  v49 = v63;
  v75 = v49;
  objc_msgSend_setBatchingID_data_handler_(v33, v50, 2, v47, v74);
  objc_msgSend_setDuplicateTypeID_handler_(v33, v51, 1, &unk_250502650);
  v69[0] = v48;
  v69[1] = 3221225472;
  v69[2] = sub_2340EBEC4;
  v69[3] = &unk_2505026A0;
  v52 = v47;
  v70 = v52;
  v72 = v78;
  v73 = v36;
  v53 = v22;
  v71 = v53;
  objc_msgSend_setReadyHandler_(v33, v54, (uint64_t)v69);
  asyncWorkQueue = self->_asyncWorkQueue;
  v58 = objc_msgSend_unsignedLongLongValue(v66, v56, v57);
  v61 = objc_msgSend_unsignedLongLongValue(v65, v59, v60);
  objc_msgSend_enqueueWorkItem_descriptionWithFormat_(asyncWorkQueue, v62, (uint64_t)v33, CFSTR("write %@ 0x%llx 0x%llx"), v64, v58, v61);

  _Block_object_dispose(v78, 8);
}

- (void)invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 queue:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v24 = a10;
  if (!v19)
  {
    v25[0] = CFSTR("type");
    v25[1] = CFSTR("value");
    v26[0] = CFSTR("Structure");
    v26[1] = MEMORY[0x24BDBD1A8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v26, v25, 2);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_queue_completion_(self, v23, (uint64_t)v16, v17, v18, v19, v20, v21, 0, v22, v24);

}

- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields expectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueInterval timedInvokeTimeout:(NSNumber *)timeout queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  objc_msgSend__invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_queue_completion_(self, a2, (uint64_t)endpointID, clusterID, commandID, commandFields, expectedValues, expectedValueInterval, timeout, 0, queue, completion);
}

- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 queue:(id)a11 completion:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  id v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  const char *v48;
  MTRAsyncWorkItem *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  const char *v65;
  MTRAsyncWorkQueue *asyncWorkQueue;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v85 = a4;
  v86 = a5;
  v80 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v82 = a11;
  v83 = a12;
  if (!v19 || objc_msgSend_compare_(v19, v22, (uint64_t)&unk_250596DB0) == -1)
  {
    v24 = v18;
    v18 = 0;
  }
  else
  {
    sub_2340DE8AC(v19, &unk_250596E88, &unk_250596EB8);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v19;
    v19 = (id)v23;
  }

  v27 = objc_msgSend_copy(v21, v25, v26);
  v30 = objc_msgSend_copy(v20, v28, v29);
  v87 = (void *)v27;

  v33 = (void *)v30;
  v79 = v19;
  v88 = v18;
  if (v30)
    goto LABEL_8;
  if (sub_234042388(v85, v86))
  {
    v33 = &unk_250596ED0;
LABEL_8:
    v34 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend_doubleValue(v33, v31, v32);
    objc_msgSend_dateWithTimeIntervalSinceNow_(v34, v36, v37, v35 / 1000.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v33 = 0;
  v84 = 0;
LABEL_9:
  v81 = v33;
  v108 = 0;
  if (v18)
  {
    objc_msgSend_setExpectedValues_expectedValueInterval_expectedValueID_(self, v31, (uint64_t)v18, v19, &v108);
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v41 = v18;
    v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v104, v109, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v105 != v45)
            objc_enumerationMutation(v41);
          objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v104 + 1) + 8 * i), v43, (uint64_t)CFSTR("attributePath"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v40, v48, (uint64_t)v47);

        }
        v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v43, (uint64_t)&v104, v109, 16);
      }
      while (v44);
    }

  }
  else
  {
    v40 = 0;
  }
  v49 = [MTRAsyncWorkItem alloc];
  objc_msgSend_queue(self, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend_initWithQueue_(v49, v53, (uint64_t)v52);

  v57 = objc_msgSend_uniqueID(v54, v55, v56);
  objc_msgSend_setDuplicateTypeID_handler_(v54, v58, 1, &unk_2505026C0);
  v90[0] = MEMORY[0x24BDAC760];
  v90[1] = 3221225472;
  v90[2] = sub_2340ECBA4;
  v90[3] = &unk_250502738;
  v77 = v82;
  v91 = v77;
  v78 = v83;
  v101 = v78;
  v75 = v88;
  v92 = v75;
  v59 = v40;
  v93 = v59;
  v102 = v108;
  v76 = v81;
  v94 = v76;
  v60 = v84;
  v95 = v60;
  v61 = v17;
  v96 = v61;
  v62 = v85;
  v97 = v62;
  v63 = v86;
  v98 = v63;
  v74 = v80;
  v99 = v74;
  v64 = v87;
  v100 = v64;
  v103 = v57;
  objc_msgSend_setReadyHandler_(v54, v65, (uint64_t)v90);
  asyncWorkQueue = self->_asyncWorkQueue;
  v69 = objc_msgSend_unsignedLongLongValue(v62, v67, v68);
  v72 = objc_msgSend_unsignedLongLongValue(v63, v70, v71);
  objc_msgSend_enqueueWorkItem_descriptionWithFormat_(asyncWorkQueue, v73, (uint64_t)v54, CFSTR("invoke %@ 0x%llx 0x%llx"), v61, v69, v72);

}

- (void)_invokeKnownCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandPayload:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 responseClass:(Class)a11 queue:(id)a12 completion:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  const char *v27;
  void *v28;
  id v29;
  void *v30;
  const char *v31;
  id *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  _QWORD v38[2];
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;

  v36 = a3;
  v35 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a12;
  v26 = a13;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v33 = v21;
    v34 = v19;
    v42 = 0;
    objc_msgSend__encodeAsDataValue_(v20, v27, (uint64_t)&v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v42;
    if (v28)
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = sub_2340ED508;
      v37[3] = &unk_2504F05D0;
      v38[1] = a11;
      v38[0] = v26;
      v30 = (void *)MEMORY[0x23493EEA8](v37);
      objc_msgSend__invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_queue_completion_(self, v31, (uint64_t)v36, v35, v34, v28, v33, v22, v23, v24, v25, v30);
      v32 = (id *)v38;
    }
    else
    {
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = sub_2340ED4F4;
      v39[3] = &unk_2504F03B0;
      v32 = &v41;
      v41 = v26;
      v40 = v29;
      dispatch_async(v25, v39);
      v30 = v40;
    }

    v21 = v33;
    v19 = v34;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2340ED474;
    block[3] = &unk_2504F0208;
    v44 = v26;
    dispatch_async(v25, block);
    v29 = v44;
  }

}

- (void)openCommissioningWindowWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion
{
  NSNumber *v12;
  NSNumber *v13;
  NSObject *v14;
  MTRDeviceOpenCommissioningWindowHandler v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSNumber *v20;

  v20 = setupPasscode;
  v12 = discriminator;
  v13 = duration;
  v14 = queue;
  v15 = completion;
  v18 = (void *)objc_msgSend_newBaseDevice(self, v16, v17);
  objc_msgSend_openCommissioningWindowWithSetupPasscode_discriminator_duration_queue_completion_(v18, v19, (uint64_t)v20, v12, v13, v14, v15);

}

- (void)openCommissioningWindowWithDiscriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion
{
  NSNumber *v10;
  NSObject *v11;
  MTRDeviceOpenCommissioningWindowHandler v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSNumber *v17;

  v17 = discriminator;
  v10 = duration;
  v11 = queue;
  v12 = completion;
  v15 = (void *)objc_msgSend_newBaseDevice(self, v13, v14);
  objc_msgSend_openCommissioningWindowWithDiscriminator_duration_queue_completion_(v15, v16, (uint64_t)v17, v10, v11, v12);

}

- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  v15 = a5;
  v10 = a6;
  v13 = (void *)objc_msgSend_newBaseDevice(self, v11, v12);
  objc_msgSend_downloadLogOfType_timeout_queue_completion_(v13, v14, a3, v15, v10, a4);

}

- (void)_checkExpiredExpectedValues
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  double v49;
  double v50;
  _BOOL4 v51;
  double v52;
  dispatch_time_t v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  MTRDevice *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  void *v63;
  id v64;
  _QWORD block[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  MTRDevice *v76;
  __int16 v77;
  void *v78;
  _QWORD v79[3];
  _QWORD v80[3];
  _BYTE v81[128];
  _QWORD v82[2];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_date(MEMORY[0x24BDBCE60], v3, v4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v5, v6);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v7 = self->_expectedValueCache;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v71, v83, 16);
  if (!v10)
  {
    v64 = 0;
    goto LABEL_17;
  }
  v64 = 0;
  v11 = *(_QWORD *)v72;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v72 != v11)
        objc_enumerationMutation(v7);
      v13 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
      objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v9, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (objc_msgSend_compare_(v63, v16, (uint64_t)v17) == 1)
        {
          v82[0] = v13;
          objc_msgSend_objectAtIndexedSubscript_(v14, v18, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v82[1] = v19;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v20, (uint64_t)v82, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v61, v22, (uint64_t)v21);

LABEL_12:
          goto LABEL_13;
        }
        v19 = v64;
        if (!v64 || (v19 = v64, objc_msgSend_compare_(v64, v18, (uint64_t)v17) == 1))
        {
          v64 = v17;
          goto LABEL_12;
        }
      }
LABEL_13:

    }
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v71, v83, 16);
  }
  while (v10);
LABEL_17:

  objc_msgSend_array(MEMORY[0x24BDBCEB8], v23, v24);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v25, v26);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v61;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v67, v81, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v68 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
        objc_msgSend_objectAtIndexedSubscript_(v32, v28, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v32, v34, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__cachedAttributeValueForPath_(self, v36, (uint64_t)v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38 && (objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v37, (uint64_t)v35, v38) & 1) == 0)
        {
          v79[0] = CFSTR("attributePath");
          v79[1] = CFSTR("data");
          v80[0] = v33;
          v80[1] = v38;
          v79[2] = CFSTR("previousData");
          v80[2] = v35;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v37, (uint64_t)v80, v79, 3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v60, v40, (uint64_t)v39);

          objc_msgSend_addObject_(v59, v41, (uint64_t)v33);
        }
        objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v37, 0, v33);

      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v67, v81, 16);
    }
    while (v29);
  }

  sub_234117B80(0, "NotSpecified");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v76 = self;
    v77 = 2112;
    v78 = v59;
    _os_log_impl(&dword_233BF3000, v42, OS_LOG_TYPE_DEFAULT, "%@ report from expired expected values %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    v57 = self;
    v58 = v59;
    sub_2341147D0(0, 2);
  }
  objc_msgSend__reportAttributes_(self, v43, (uint64_t)v60, v57, v58);
  if (v64
    && objc_msgSend_count(self->_expectedValueCache, v44, v45)
    && (objc_msgSend_expirationCheckScheduled(self, v46, v47) & 1) == 0)
  {
    objc_msgSend_timeIntervalSinceDate_(v64, v48, (uint64_t)v63);
    v50 = v49;
    v51 = v49 < 0.1;
    objc_initWeak((id *)buf, self);
    v52 = v50 * 1000000000.0;
    if (v51)
      v52 = 100000000.0;
    v53 = dispatch_time(0, (uint64_t)v52);
    objc_msgSend_queue(self, v54, v55);
    v56 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2340EDEC8;
    block[3] = &unk_2504F03D8;
    objc_copyWeak(&v66, (id *)buf);
    dispatch_after(v53, v56, block);

    objc_destroyWeak(&v66);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_performScheduledExpirationCheck
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  const char *v5;
  uint64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_setExpirationCheckScheduled_(self, v4, 0);
  objc_msgSend__checkExpiredExpectedValues(self, v5, v6);
  os_unfair_lock_unlock(p_lock);
}

- (id)_attributeValueDictionaryForAttributePath:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  MTRDevice *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v5, (uint64_t)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_date(MEMORY[0x24BDBCE60], v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v8, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_compare_(v9, v12, (uint64_t)v11);

    if (v13 != 1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v14, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v14, 0, v4);

  }
  objc_msgSend__cachedAttributeValueForPath_(self, v6, (uint64_t)v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_233BF3000, v18, OS_LOG_TYPE_DEFAULT, "%@ _attributeValueDictionaryForAttributePath: could not find cached attribute values for attribute %@", buf, 0x16u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
  }

LABEL_12:
  os_unfair_lock_unlock(&self->_lock);

  return v16;
}

- (BOOL)_attributeDataValue:(id)a3 isEqualToDataValue:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  const char *v8;
  void *v9;
  char isEqual;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint8_t buf[4];
  MTRDevice *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v9 = (void *)v7;
  if (v6 | v7)
  {
    isEqual = 0;
    if (v6 && v7)
    {
      objc_msgSend_objectForKeyedSubscript_((void *)v6, v8, (uint64_t)CFSTR("type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v9, v12, (uint64_t)CFSTR("type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v11, v14, (uint64_t)v13))
      {
        objc_msgSend_objectForKeyedSubscript_((void *)v6, v15, (uint64_t)CFSTR("value"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v9, v17, (uint64_t)CFSTR("value"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 == v19)
        {
          isEqual = 1;
        }
        else
        {
          objc_msgSend_objectForKeyedSubscript_((void *)v6, v18, (uint64_t)CFSTR("value"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v9, v21, (uint64_t)CFSTR("value"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v20, v23, (uint64_t)v22);

        }
      }
      else
      {
        isEqual = 0;
      }

    }
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl(&dword_233BF3000, v24, OS_LOG_TYPE_ERROR, "%@ attribute data-value comparison does not expect comparing two nil dictionaries", buf, 0xCu);
    }

    isEqual = 1;
    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }

  return isEqual;
}

- (id)_dataValueWithoutDataVersion:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;
  void *v16;
  const char *v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v5 = v3;
  if (v3
    && (objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("type")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v7, (uint64_t)CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v20[0] = CFSTR("type");
      objc_msgSend_objectForKeyedSubscript_(v5, v9, (uint64_t)CFSTR("type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = CFSTR("value");
      v21[0] = v10;
      objc_msgSend_objectForKeyedSubscript_(v5, v11, (uint64_t)CFSTR("value"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v12;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v21, v20, 2);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = CFSTR("type");
      objc_msgSend_objectForKeyedSubscript_(v5, v9, (uint64_t)CFSTR("type"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v16;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)&v19, &v18, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = v5;
  }

  return v14;
}

- (void)_noteDataVersion:(id)a3 forClusterPath:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  char isEqualToNumber;
  const char *v15;
  const char *v16;
  uint64_t v17;
  MTRDeviceClusterData *v18;
  const char *v19;
  NSMutableDictionary *clusterDataToPersist;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend__clusterDataForPath_(self, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (v8)
  {
    objc_msgSend_dataVersion(v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToNumber = objc_msgSend_isEqualToNumber_(v12, v13, (uint64_t)v23);

    if ((isEqualToNumber & 1) != 0)
      goto LABEL_8;
    objc_msgSend_setDataVersion_(v11, v15, (uint64_t)v23);
  }
  else
  {
    v18 = [MTRDeviceClusterData alloc];
    v11 = (void *)objc_msgSend_initWithDataVersion_attributes_(v18, v19, (uint64_t)v23, 0);
  }
  clusterDataToPersist = self->_clusterDataToPersist;
  if (!clusterDataToPersist)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v16, v17);
    v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v22 = self->_clusterDataToPersist;
    self->_clusterDataToPersist = v21;

    clusterDataToPersist = self->_clusterDataToPersist;
  }
  objc_msgSend_setObject_forKeyedSubscript_(clusterDataToPersist, v16, (uint64_t)v11, v6);
LABEL_8:

}

- (BOOL)_attributeAffectsDeviceConfiguration:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  objc_msgSend_cluster(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedLongValue(v6, v7, v8);

  if (v9 != 29
    || (objc_msgSend_attribute(v3, v10, v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend_unsignedLongValue(v12, v13, v14),
        v12,
        v15 > 3)
    || v15 == 2)
  {
    objc_msgSend_attribute(v3, v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_unsignedLongValue(v17, v18, v19);

    if ((unint64_t)(v20 - 65529) >= 5)
      LOBYTE(v16) = 0;
    else
      v16 = (0x1Du >> (v20 + 7)) & 1;
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void)_removeClusters:(id)a3 doRemoveFromDataStore:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_minusSet_(self->_persistedClusters, v7, (uint64_t)v6, v6);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend_removeObjectForKey_(self->_persistedClusterData, v9, (uint64_t)v13);
        objc_msgSend_removeObjectForKey_(self->_clusterDataToPersist, v14, (uint64_t)v13);
        if (v4)
        {
          objc_msgSend_deviceController(self, v9, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_controllerDataStore(v16, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_nodeID(self, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_endpoint(v13, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cluster(v13, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clearStoredClusterDataForNodeID_endpointID_clusterID_(v19, v29, (uint64_t)v22, v25, v28);

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v31, v35, 16);
    }
    while (v10);
  }

}

- (void)_removeAttributes:(id)a3 fromCluster:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend__removeCachedAttribute_fromCluster_(self, v10, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13++), v7, (_QWORD)v25);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v25, v29, 16);
    }
    while (v11);
  }

  objc_msgSend_removeObjectForKey_(self->_persistedClusterData, v14, (uint64_t)v7);
  objc_msgSend_deviceController(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_controllerDataStore(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nodeID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAttributes_fromCluster_forNodeID_(v20, v24, (uint64_t)v8, v7, v23);

}

- (void)_pruneEndpointsIn:(id)a3 missingFrom:(id)a4
{
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  NSMutableSet *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  const char *v30;
  int isEqualToNumber;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  MTRDeviceController *deviceController;
  const char *v44;
  const char *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  MTRDevice *v52;
  _QWORD v53[6];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v48 = a4;
  v6 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v7, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v11, (uint64_t)v48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);
  v14 = objc_claimAutoreleasedReturnValue();

  v46 = (void *)v14;
  objc_msgSend_minusSet_(v47, v15, v14);
  v52 = self;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v47;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v58, v63, 16);
  if (v17)
  {
    v50 = *(_QWORD *)v59;
    do
    {
      v51 = v17;
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v59 != v50)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        v20 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v21 = v52->_persistedClusters;
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v54, v62, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v55 != v26)
                objc_enumerationMutation(v21);
              v28 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              objc_msgSend_endpoint(v28, v23, v24);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToNumber = objc_msgSend_isEqualToNumber_(v29, v30, v19);

              if (isEqualToNumber)
                objc_msgSend_addObject_(v20, v23, (uint64_t)v28);
            }
            v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v54, v62, 16);
          }
          while (v25);
        }

        objc_msgSend__removeClusters_doRemoveFromDataStore_(v52, v32, (uint64_t)v20, 0);
        objc_msgSend_deviceController(v52, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_controllerDataStore(v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nodeID(v52, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clearStoredClusterDataForNodeID_endpointID_(v38, v42, (uint64_t)v41, v19);

        deviceController = v52->_deviceController;
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = sub_2340EEF74;
        v53[3] = &unk_2504EE768;
        v53[4] = v52;
        v53[5] = v19;
        objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v44, (uint64_t)v53, 0);

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v58, v63, 16);
    }
    while (v17);
  }

}

- (void)_pruneClustersIn:(id)a3 missingFrom:(id)a4 forEndpoint:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  NSMutableSet *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int v35;
  const char *v36;
  MTRDeviceController *deviceController;
  id v38;
  id v39;
  const char *v40;
  void *v41;
  void *v42;
  id v43;
  MTRDevice *v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v43 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCEF0];
  v44 = self;
  v41 = v8;
  objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v11, (uint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v16, (uint64_t)v43);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v15, v18, (uint64_t)v17);
  v19 = objc_claimAutoreleasedReturnValue();

  v42 = (void *)v19;
  objc_msgSend_minusSet_(v14, v20, v19);
  v45 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v21 = self->_persistedClusters;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v49, v53, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v50 != v26)
          objc_enumerationMutation(v21);
        v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend_endpoint(v28, v23, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToNumber_(v29, v30, (uint64_t)v9) & 1) != 0)
        {
          objc_msgSend_cluster(v28, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_containsObject_(v14, v34, (uint64_t)v33);

          if (v35)
            objc_msgSend_addObject_(v45, v23, (uint64_t)v28);
        }
        else
        {

        }
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v49, v53, 16);
    }
    while (v25);
  }

  objc_msgSend__removeClusters_doRemoveFromDataStore_(v44, v36, (uint64_t)v45, 1);
  deviceController = v44->_deviceController;
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = sub_2340EF338;
  v46[3] = &unk_2504F47E8;
  v46[4] = v44;
  v38 = v14;
  v47 = v38;
  v39 = v9;
  v48 = v39;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v40, (uint64_t)v46, 0);

}

- (void)_pruneAttributesIn:(id)a3 missingFrom:(id)a4 forCluster:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  MTRDeviceController *deviceController;
  id v24;
  id v25;
  const char *v26;
  _QWORD v27[5];
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v12, (uint64_t)v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v11, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend_arrayOfNumbersFromAttributeValue_(self, v17, (uint64_t)v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v16, v19, (uint64_t)v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_minusSet_(v15, v21, (uint64_t)v20);
  objc_msgSend__removeAttributes_fromCluster_(self, v22, (uint64_t)v15, v10);
  deviceController = self->_deviceController;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_2340EF66C;
  v27[3] = &unk_2504F47E8;
  v27[4] = self;
  v24 = v15;
  v28 = v24;
  v25 = v10;
  v29 = v25;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v26, (uint64_t)v27, 0);

}

- (void)_pruneStoredDataForPath:(id)a3 missingFrom:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int isEqualToNumber;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  uint8_t buf[4];
  MTRDevice *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((objc_msgSend__dataStoreExists(self, v8, v9) & 1) != 0
    || objc_msgSend_count(self->_clusterDataToPersist, v10, v11))
  {
    objc_msgSend_cluster(v6, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_unsignedLongValue(v12, v13, v14);

    if (v15 == 29)
    {
      objc_msgSend_attribute(v6, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_unsignedLongValue(v18, v19, v20) == 3)
      {
        objc_msgSend_endpoint(v6, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToNumber = objc_msgSend_isEqualToNumber_(v23, v24, (uint64_t)&unk_250596E40);

        if (isEqualToNumber)
        {
          objc_msgSend__cachedAttributeValueForPath_(self, v26, (uint64_t)v6);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__pruneEndpointsIn_missingFrom_(self, v29, (uint64_t)v28, v7);
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {

      }
      objc_msgSend_attribute(v6, v26, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_unsignedLongValue(v30, v31, v32);

      if (v33 == 1)
      {
        objc_msgSend__cachedAttributeValueForPath_(self, v16, (uint64_t)v6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_endpoint(v6, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__pruneClustersIn_missingFrom_forEndpoint_(self, v37, (uint64_t)v28, v7, v36);
LABEL_12:

        goto LABEL_13;
      }
    }
    objc_msgSend_attribute(v6, v16, v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_unsignedLongValue(v38, v39, v40);

    if (v41 == 65531)
    {
      objc_msgSend__cachedAttributeValueForPath_(self, v42, (uint64_t)v6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_endpoint(v6, v43, v44);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cluster(v6, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v48, (uint64_t)v36, v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__pruneAttributesIn_missingFrom_forCluster_(self, v50, (uint64_t)v28, v7, v49);

      goto LABEL_12;
    }
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = self;
      _os_log_impl(&dword_233BF3000, v51, OS_LOG_TYPE_INFO, "%@ No data store to prune from", buf, 0xCu);
    }

    if (sub_234114844(3u))
      sub_2341147D0(0, 3);
  }
LABEL_14:

}

- (id)_getAttributesToReportWithReportedValues:(id)a3 fromSubscription:(BOOL)a4
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t i;
  void *v13;
  MTRDevice *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSDate *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  char isEqualToDataValue;
  const char *v42;
  int v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  char v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  _BOOL4 v58;
  const char *v59;
  void *v60;
  const char *v61;
  int isEqual;
  const char *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  NSObject *v70;
  NSDate *estimatedStartTimeFromGeneralDiagnosticsUpTime;
  NSDate *v72;
  void *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  NSObject *v79;
  MTRDevice *v81;
  double v82;
  id v83;
  void *v84;
  uint64_t v85;
  id v86;
  id *location;
  id v88;
  NSDate *v89;
  char v90;
  _BOOL4 v91;
  id v92;
  void *v93;
  void *v94;
  id obj;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  MTRDevice *v105;
  __int16 v106;
  double v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  NSDate *v111;
  __int16 v112;
  uint64_t v113;
  _BYTE v114[128];
  uint64_t v115;

  v91 = a4;
  v115 = *MEMORY[0x24BDAC8D0];
  v86 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v7, v8);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v86;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v100, v114, 16);
  if (v10)
  {
    v98 = *(_QWORD *)v101;
    location = (id *)&self->_estimatedStartTime;
    do
    {
      v99 = v10;
      for (i = 0; i != v99; ++i)
      {
        if (*(_QWORD *)v101 != v98)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v13, v11, (uint64_t)CFSTR("attributePath"), v81);
        v14 = (MTRDevice *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v13, v15, (uint64_t)CFSTR("data"));
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v13, v17, (uint64_t)CFSTR("error"));
        v19 = objc_claimAutoreleasedReturnValue();
        if (v16 | v19)
        {
          if (self->_receivingReport && sub_2340E7C20(v14))
            self->_receivingPrimingReport = 1;
          if (v19)
          {
            objc_msgSend__cachedAttributeValueForPath_(self, v18, (uint64_t)v14);
            v20 = objc_claimAutoreleasedReturnValue();
            sub_234117B80(0, "NotSpecified");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v22, (uint64_t)v14);
              v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v105 = self;
              v106 = 2112;
              v107 = *(double *)&v14;
              v108 = 2112;
              v109 = v19;
              v110 = 2112;
              v111 = v23;
              v112 = 2112;
              v113 = v20;
              _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_ERROR, "%@ report %@ error %@ purge expected value %@ read cache %@", buf, 0x34u);

            }
            if (sub_234114844(1u))
            {
              objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v24, (uint64_t)v14);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = v20;
              v82 = *(double *)&v14;
              v83 = (id)v19;
              v81 = self;
              sub_2341147D0(0, 1);

            }
            objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v24, 0, v14, v81, *(_QWORD *)&v82, v83, v84, v85);
            objc_msgSend__setCachedAttributeValue_forPath_fromSubscription_(self, v25, 0, v14, v91);
            v28 = (void *)v20;
LABEL_59:
            if (v28)
            {
              v73 = (void *)objc_msgSend_mutableCopy(v13, v26, v27);
              objc_msgSend_setObject_forKeyedSubscript_(v73, v74, (uint64_t)v28, CFSTR("previousData"));
              objc_msgSend_addObject_(v92, v75, (uint64_t)v73);

            }
            else
            {
              objc_msgSend_addObject_(v92, v26, (uint64_t)v13);
            }
            objc_msgSend_addObject_(v93, v76, (uint64_t)v14, v81);
            goto LABEL_63;
          }
          objc_msgSend_objectForKeyedSubscript_((void *)v16, v18, (uint64_t)CFSTR("dataVersion"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_endpoint(v14, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cluster(v14, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v36, (uint64_t)v32, v35);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          if (v96)
          {
            objc_msgSend__dataValueWithoutDataVersion_(self, v37, v16);
            v38 = objc_claimAutoreleasedReturnValue();

            v16 = v38;
          }
          objc_msgSend__cachedAttributeValueForPath_(self, v37, (uint64_t)v14);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToDataValue = objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v39, v16, v28);
          if ((isEqualToDataValue & 1) == 0)
          {
            if (v96)
              objc_msgSend__noteDataVersion_forClusterPath_(self, v40, (uint64_t)v96, v94);
            objc_msgSend__pruneStoredDataForPath_missingFrom_(self, v40, (uint64_t)v14, v16);
            if (!self->_deviceConfigurationChanged)
            {
              v43 = objc_msgSend__attributeAffectsDeviceConfiguration_(self, v42, (uint64_t)v14);
              self->_deviceConfigurationChanged = v43;
              if (v43)
              {
                sub_234117B80(0, "NotSpecified");
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v105 = v14;
                  _os_log_impl(&dword_233BF3000, v44, OS_LOG_TYPE_DEFAULT, "Device configuration changed due to changes in attribute %@", buf, 0xCu);
                }

                if (sub_234114844(2u))
                {
                  v81 = v14;
                  sub_2341147D0(0, 2);
                }
              }
            }
            objc_msgSend__setCachedAttributeValue_forPath_fromSubscription_(self, v42, v16, v14, v91, v81);
          }
          objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v40, (uint64_t)v14);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          if (v97)
            v47 = 1;
          else
            v47 = isEqualToDataValue;
          v90 = v47;
          if ((v47 & 1) != 0)
          {
            if (v97)
            {
              sub_234117B80(0, "NotSpecified");
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v105 = self;
                v106 = 2112;
                v107 = *(double *)&v14;
                _os_log_impl(&dword_233BF3000, v48, OS_LOG_TYPE_DEFAULT, "%@ report %@ value filtered - expected value still present", buf, 0x16u);
              }

              if (sub_234114844(2u))
                goto LABEL_45;
            }
            else
            {
              sub_234117B80(0, "NotSpecified");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v105 = self;
                v106 = 2112;
                v107 = *(double *)&v14;
                _os_log_impl(&dword_233BF3000, v49, OS_LOG_TYPE_DEFAULT, "%@ report %@ value filtered - same as read cache", buf, 0x16u);
              }

              if (sub_234114844(2u))
              {
LABEL_45:
                v81 = self;
                v82 = *(double *)&v14;
                sub_2341147D0(0, 2);
              }
            }
          }
          objc_msgSend_cluster(v14, v45, v46, v81);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_unsignedLongValue(v50, v51, v52) == 51)
          {
            objc_msgSend_attribute(v14, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend_unsignedLongValue(v55, v56, v57) == 2;

            if (v58)
            {
              objc_msgSend_objectForKeyedSubscript_((void *)v16, v59, (uint64_t)CFSTR("type"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v60, v61, (uint64_t)CFSTR("UnsignedInteger"));

              if (isEqual)
              {
                objc_msgSend_objectForKeyedSubscript_((void *)v16, v63, (uint64_t)CFSTR("value"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = (double)(unint64_t)objc_msgSend_unsignedLongLongValue(v50, v64, v65);
                objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v67, v68, -v66);
                v89 = (NSDate *)objc_claimAutoreleasedReturnValue();
                v88 = *location;
                if (!*location || objc_msgSend_compare_(v89, v69, (uint64_t)*location) == -1)
                {
                  sub_234117B80(0, "NotSpecified");
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138413058;
                    v105 = self;
                    v106 = 2048;
                    v107 = v66;
                    v108 = 2112;
                    v109 = (uint64_t)v88;
                    v110 = 2112;
                    v111 = v89;
                    _os_log_impl(&dword_233BF3000, v70, OS_LOG_TYPE_DEFAULT, "%@ General Diagnostics UpTime %.3lf: estimated start time %@ => %@", buf, 0x2Au);
                  }

                  if (sub_234114844(2u))
                  {
                    v83 = v88;
                    v84 = v89;
                    v82 = v66;
                    v81 = self;
                    sub_2341147D0(0, 2);
                  }
                  objc_storeStrong(location, v89);
                }
                estimatedStartTimeFromGeneralDiagnosticsUpTime = self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
                self->_estimatedStartTimeFromGeneralDiagnosticsUpTime = v89;
                v72 = v89;

                goto LABEL_57;
              }
            }
          }
          else
          {
LABEL_57:

          }
          if ((v90 & 1) != 0)
            goto LABEL_63;
          goto LABEL_59;
        }
        sub_234117B80(0, "NotSpecified");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v105 = self;
          v106 = 2112;
          v107 = *(double *)&v14;
          v108 = 2112;
          v109 = (uint64_t)v13;
          _os_log_impl(&dword_233BF3000, v29, OS_LOG_TYPE_DEFAULT, "%@ report %@ no data value or error: %@", buf, 0x20u);
        }

        if (sub_234114844(2u))
        {
          v16 = 0;
          v82 = *(double *)&v14;
          v83 = v13;
          v81 = self;
          sub_2341147D0(0, 2);
          v28 = 0;
        }
        else
        {
          v28 = 0;
          v16 = 0;
        }
LABEL_63:

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v100, v114, 16);
    }
    while (v10);
  }

  if (objc_msgSend_count(v93, v77, v78))
  {
    sub_234117B80(0, "NotSpecified");
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v105 = self;
      v106 = 2112;
      v107 = *(double *)&v93;
      _os_log_impl(&dword_233BF3000, v79, OS_LOG_TYPE_DEFAULT, "%@ report from reported values %@", buf, 0x16u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
  }

  return v92;
}

- (void)setPersistedClusterData:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSCache *persistedClusterData;
  const char *v18;
  void *v19;
  const char *v20;
  MTRDevice *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  MTRDevice *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = self;
    v30 = 2048;
    v31 = objc_msgSend_count(v4, v6, v7);
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_DEFAULT, "%@ setPersistedClusterData count: %lu", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    v21 = self;
    v22 = objc_msgSend_count(v4, v8, v9);
    sub_2341147D0(0, 2);
  }
  if (objc_msgSend_count(v4, v8, v9, v21, v22))
  {
    os_unfair_lock_lock(&self->_lock);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v4;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v23, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend_addObject_(self->_persistedClusters, v12, v16);
          persistedClusterData = self->_persistedClusterData;
          objc_msgSend_objectForKeyedSubscript_(v10, v18, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(persistedClusterData, v20, (uint64_t)v19, v16);

        }
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v23, v27, 16);
      }
      while (v13);
    }

    self->_deviceCachePrimed = 1;
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_setLastInitialSubscribeLatency:(id)a3
{
  id v5;

  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_estimatedSubscriptionLatency, a3);

}

- (void)setPersistedDeviceData:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  void *v8;
  uint8_t buf[4];
  MTRDevice *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_INFO, "%@ setPersistedDeviceData: %@", buf, 0x16u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKeyedSubscript_(v4, v6, (uint64_t)CFSTR("lastInitialSubscribeLatency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend__setLastInitialSubscribeLatency_(self, v7, (uint64_t)v8);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_storePersistedDeviceData
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSNumber *estimatedSubscriptionLatency;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_controllerDataStore(self->_deviceController, v3, v4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    estimatedSubscriptionLatency = self->_estimatedSubscriptionLatency;
    if (estimatedSubscriptionLatency)
      objc_msgSend_setObject_forKeyedSubscript_(v7, v8, (uint64_t)estimatedSubscriptionLatency, CFSTR("lastInitialSubscribeLatency"));
    v11 = (void *)objc_msgSend_copy(v9, v8, (uint64_t)estimatedSubscriptionLatency);
    objc_msgSend_nodeID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_storeDeviceData_forNodeID_(v16, v15, (uint64_t)v11, v14);

  }
}

- (BOOL)deviceCachePrimed
{
  MTRDevice *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_deviceCachePrimed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_setExpectedValue:(id)a3 attributePath:(id)a4 expirationTime:(id)a5 shouldReportValue:(BOOL *)a6 attributeValueToReport:(id *)a7 expectedValueID:(unint64_t)a8 previousValue:(id *)a9
{
  id v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  char isEqualToDataValue;
  const char *v24;
  const char *v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  void *v33;
  const char *v34;
  char v35;
  const char *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  id v42;
  id v43;
  _QWORD v44[4];

  v44[3] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v43 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  *a6 = 0;
  objc_msgSend_objectForKeyedSubscript_(self->_expectedValueCache, v17, (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  if (v18)
  {
    if (v15)
    {
      objc_msgSend_objectAtIndexedSubscript_(v18, v19, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDataValue = objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v22, (uint64_t)v15, v21);

      if ((isEqualToDataValue & 1) == 0)
      {
        *a6 = 1;
        *a7 = objc_retainAutorelease(v15);
        objc_msgSend_objectAtIndexedSubscript_(v20, v25, 1);
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_16:
      v44[0] = v43;
      v44[1] = v15;
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v24, a8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v38;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v39, (uint64_t)v44, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v41, (uint64_t)v40, v16);

      goto LABEL_17;
    }
    objc_msgSend_objectAtIndexedSubscript_(v18, v19, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_unsignedLongLongValue(v27, v29, v30) == a8)
    {
      objc_msgSend__cachedAttributeValueForPath_(self, v31, (uint64_t)v16);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v20, v32, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v34, (uint64_t)v33, v42);

      if ((v35 & 1) == 0)
      {
        *a6 = 1;
        *a7 = objc_retainAutorelease(v42);
        objc_msgSend_objectAtIndexedSubscript_(v20, v36, 1);
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(self->_expectedValueCache, v37, 0, v16);
      }

    }
  }
  else
  {
    objc_msgSend__cachedAttributeValueForPath_(self, v19, (uint64_t)v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if ((objc_msgSend__attributeDataValue_isEqualToDataValue_(self, v26, (uint64_t)v15, v27) & 1) != 0)
      {
        v28 = 0;
      }
      else
      {
        *a6 = 1;
        *a7 = objc_retainAutorelease(v15);
        v28 = objc_retainAutorelease(v27);
      }
      *a9 = v28;

      goto LABEL_16;
    }
    *a9 = 0;
  }

LABEL_17:
}

- (id)_getAttributesToReportWithNewExpectedValues:(id)a3 expirationTime:(id)a4 expectedValueID:(unint64_t *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  id v21;
  id v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  id obj;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t expectedValueNextID;
  MTRDevice *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  MTRDevice *v45;
  __int16 v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[3];
  _QWORD v51[3];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v37 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  expectedValueNextID = self->_expectedValueNextID;
  v36 = self;
  self->_expectedValueNextID = expectedValueNextID + 1;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v8, v9);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v10, v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v7;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v40, v52, 16);
  if (v14)
  {
    v34 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v16, v13, (uint64_t)CFSTR("attributePath"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v16, v18, (uint64_t)CFSTR("data"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        buf[0] = 0;
        v38 = 0;
        v39 = 0;
        objc_msgSend__setExpectedValue_attributePath_expirationTime_shouldReportValue_attributeValueToReport_expectedValueID_previousValue_(v36, v20, (uint64_t)v19, v17, v37, buf, &v39, expectedValueNextID, &v38);
        v21 = v39;
        v22 = v38;
        v24 = v22;
        if (buf[0])
        {
          if (v22)
          {
            v50[0] = CFSTR("attributePath");
            v50[1] = CFSTR("data");
            v51[0] = v17;
            v51[1] = v21;
            v50[2] = CFSTR("previousData");
            v51[2] = v22;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v51, v50, 3);
          }
          else
          {
            v48[0] = CFSTR("attributePath");
            v48[1] = CFSTR("data");
            v49[0] = v17;
            v49[1] = v21;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v49, v48, 2);
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v32, v26, (uint64_t)v25);

          objc_msgSend_addObject_(v33, v27, (uint64_t)v17);
        }

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v40, v52, 16);
    }
    while (v14);
  }

  if (a5)
    *a5 = expectedValueNextID;
  sub_234117B80(0, "NotSpecified");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v45 = v36;
    v46 = 2112;
    v47 = v33;
    _os_log_impl(&dword_233BF3000, v28, OS_LOG_TYPE_DEFAULT, "%@ report from new expected values %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);

  return v32;
}

- (void)setExpectedValues:(id)a3 expectedValueInterval:(id)a4
{
  objc_msgSend_setExpectedValues_expectedValueInterval_expectedValueID_(self, a2, (uint64_t)a3, a4, 0);
}

- (void)setExpectedValues:(id)a3 expectedValueInterval:(id)a4 expectedValueID:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint8_t buf[4];
  MTRDevice *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend_doubleValue(v9, v11, v12);
  objc_msgSend_dateWithTimeIntervalSinceNow_(v10, v14, v15, v13 / 1000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_234117B80(0, "NotSpecified");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_timeIntervalSinceNow(v16, v18, v19);
    *(_DWORD *)buf = 138412802;
    v29 = self;
    v30 = 2112;
    v31 = v8;
    v32 = 2048;
    v33 = v20;
    _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_DEFAULT, "%@ Setting expected values %@ with expiration time %f seconds from now", buf, 0x20u);
  }

  if (sub_234114844(2u))
  {
    objc_msgSend_timeIntervalSinceNow(v16, v21, v22);
    sub_2341147D0(0, 2);
  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend__getAttributesToReportWithNewExpectedValues_expirationTime_expectedValueID_(self, v23, (uint64_t)v8, v16, a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__reportAttributes_(self, v25, (uint64_t)v24);
  objc_msgSend__checkExpiredExpectedValues(self, v26, v27);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeExpectedValuesForAttributePaths:(id)a3 expectedValueID:(unint64_t)a4
{
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend__removeExpectedValueForAttributePath_expectedValueID_(self, v9, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), a4, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeExpectedValueForAttributePath:(id)a3 expectedValueID:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  const char *v8;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend__removeExpectedValueForAttributePath_expectedValueID_(self, v8, (uint64_t)v7, a4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeExpectedValueForAttributePath:(id)a3 expectedValueID:(unint64_t)a4
{
  id v6;
  const char *v7;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  const char *v12;
  const __CFString *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  MTRDevice *v19;
  id v20;
  const __CFString *v21;
  id v22;
  id v23;
  char v24;
  void *v25;
  uint8_t buf[4];
  MTRDevice *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v24 = 0;
  v22 = 0;
  v23 = 0;
  objc_msgSend__setExpectedValue_attributePath_expirationTime_shouldReportValue_attributeValueToReport_expectedValueID_previousValue_(self, v7, 0, v6, 0, &v24, &v23, a4, &v22);
  v8 = v23;
  v9 = v22;
  sub_234117B80(0, "NotSpecified");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    if (v24)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v27 = self;
    v28 = 2112;
    v29 = v6;
    v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_DEFAULT, "%@ remove expected value for path %@ should report %@", buf, 0x20u);
  }

  if (sub_234114844(2u))
  {
    if (v24)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v20 = v6;
    v21 = v13;
    v19 = self;
    sub_2341147D0(0, 2);
  }
  if (v24)
  {
    objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x24BDBCED8], v12, (uint64_t)v6, CFSTR("attributePath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    if (v8)
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v8, CFSTR("data"));
    if (v9)
      objc_msgSend_setObject_forKeyedSubscript_(v16, v15, (uint64_t)v9, CFSTR("previousData"));
    v25 = v16;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v15, (uint64_t)&v25, 1, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__reportAttributes_(self, v18, (uint64_t)v17);

  }
}

- (id)newBaseDevice
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  objc_msgSend_nodeID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceController(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceWithNodeID_controller_(MTRBaseDevice, v8, (uint64_t)v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)supportedClientDataClasses
{
  const char *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v2, (uint64_t)v4, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clientDataKeys
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_temporaryMetaDataCache(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)clientDataForKey:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_temporaryMetaDataCache(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("%@:-1"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v7, v10, (uint64_t)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setClientDataForKey:(id)a3 value:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  char *v17;

  v17 = (char *)a3;
  v8 = a4;
  if (v17 && v8)
  {
    objc_msgSend_temporaryMetaDataCache(self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTemporaryMetaDataCache_(self, v13, (uint64_t)v12);

    }
    objc_msgSend_temporaryMetaDataCache(self, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("%@:-1"), v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v14, v16, (uint64_t)v8, v15);

  }
}

- (void)removeClientDataForKey:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  char *v9;

  v9 = (char *)a3;
  if (v9)
  {
    objc_msgSend_temporaryMetaDataCache(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("%@:-1"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v6, v8, (uint64_t)v7);

  }
}

- (id)clientDataKeysForEndpointID:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    objc_msgSend_temporaryMetaDataCache(self, a2, (uint64_t)a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)clientDataForKey:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  v11 = 0;
  if (v6 && v7)
  {
    objc_msgSend_temporaryMetaDataCache(self, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("%@:%@"), v6, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v12, v15, (uint64_t)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)setClientDataForKey:(id)a3 endpointID:(id)a4 value:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  char *v20;

  v20 = (char *)a3;
  v8 = a4;
  v11 = a5;
  if (v8 && v20 && v11)
  {
    objc_msgSend_temporaryMetaDataCache(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTemporaryMetaDataCache_(self, v16, (uint64_t)v15);

    }
    objc_msgSend_temporaryMetaDataCache(self, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, (uint64_t)CFSTR("%@:%@"), v20, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v17, v19, (uint64_t)v11, v18);

  }
}

- (void)removeClientDataForKey:(id)a3 endpointID:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  char *v12;

  v12 = (char *)a3;
  v8 = a4;
  if (v12 && v8)
  {
    objc_msgSend_temporaryMetaDataCache(self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("%@:%@"), v12, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v9, v11, (uint64_t)v10);

  }
}

- (id)_informationalNumberAtAttributePath:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  MTRAttributeReport *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend__cachedAttributeValueForPath_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [MTRAttributeReport alloc];
  v16[0] = CFSTR("attributePath");
  v16[1] = CFSTR("data");
  v17[0] = v4;
  v17[1] = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithResponseValue_error_(v7, v10, (uint64_t)v9, 0);

  objc_msgSend_value(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_informationalVendorID
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, a2, (uint64_t)&unk_250596E40, &unk_250596EE8, &unk_250596F00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__informationalNumberAtAttributePath_(self, v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_informationalProductID
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, a2, (uint64_t)&unk_250596E40, &unk_250596EE8, &unk_250596E28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__informationalNumberAtAttributePath_(self, v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_addInformationalAttributesToCurrentMetricScope
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int v16;
  const char *v17;
  int v18;
  char v19;

  objc_msgSend__informationalVendorID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 2;
  v17 = "dwnfw_device_vendor_id";
  v18 = objc_msgSend_unsignedShortValue(v4, v5, v6);
  v19 = 2;

  sub_2341C4BEC((uint64_t)&v16);
  objc_msgSend__informationalProductID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_unsignedShortValue(v9, v10, v11);
  v16 = 2;
  v17 = "dwnfw_device_product_id";
  v18 = v12;
  v19 = 2;

  sub_2341C4BEC((uint64_t)&v16);
  v15 = objc_msgSend__deviceUsesThread(self, v13, v14);
  v16 = 2;
  v17 = "dwnfw_device_uses_thread_BOOL";
  v18 = v15;
  v19 = 1;
  sub_2341C4BEC((uint64_t)&v16);
}

- (MTRDeviceState)state
{
  return self->_state;
}

- (NSDate)estimatedStartTime
{
  return self->_estimatedStartTime;
}

- (MTRDeviceController)deviceController
{
  return self->_deviceController;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (NSNumber)estimatedSubscriptionLatency
{
  return self->_estimatedSubscriptionLatency;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (os_unfair_lock_s)timeSyncLock
{
  return self->_timeSyncLock;
}

- (unsigned)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(unsigned __int8)a3
{
  self->_fabricIndex = a3;
}

- (NSMutableArray)unreportedEvents
{
  return self->_unreportedEvents;
}

- (void)setUnreportedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_unreportedEvents, a3);
}

- (BOOL)receivingReport
{
  return self->_receivingReport;
}

- (void)setReceivingReport:(BOOL)a3
{
  self->_receivingReport = a3;
}

- (BOOL)receivingPrimingReport
{
  return self->_receivingPrimingReport;
}

- (void)setReceivingPrimingReport:(BOOL)a3
{
  self->_receivingPrimingReport = a3;
}

- (unint64_t)internalDeviceState
{
  return self->_internalDeviceState;
}

- (void)setInternalDeviceState:(unint64_t)a3
{
  self->_internalDeviceState = a3;
}

- (unsigned)lastSubscriptionAttemptWait
{
  return self->_lastSubscriptionAttemptWait;
}

- (void)setLastSubscriptionAttemptWait:(unsigned int)a3
{
  self->_lastSubscriptionAttemptWait = a3;
}

- (BOOL)reattemptingSubscription
{
  return self->_reattemptingSubscription;
}

- (void)setReattemptingSubscription:(BOOL)a3
{
  self->_reattemptingSubscription = a3;
}

- (NSMutableDictionary)expectedValueCache
{
  return self->_expectedValueCache;
}

- (void)setExpectedValueCache:(id)a3
{
  objc_storeStrong((id *)&self->_expectedValueCache, a3);
}

- (unint64_t)expectedValueNextID
{
  return self->_expectedValueNextID;
}

- (void)setExpectedValueNextID:(unint64_t)a3
{
  self->_expectedValueNextID = a3;
}

- (BOOL)expirationCheckScheduled
{
  return self->_expirationCheckScheduled;
}

- (void)setExpirationCheckScheduled:(BOOL)a3
{
  self->_expirationCheckScheduled = a3;
}

- (BOOL)timeUpdateScheduled
{
  return self->_timeUpdateScheduled;
}

- (void)setTimeUpdateScheduled:(BOOL)a3
{
  self->_timeUpdateScheduled = a3;
}

- (NSDate)estimatedStartTimeFromGeneralDiagnosticsUpTime
{
  return self->_estimatedStartTimeFromGeneralDiagnosticsUpTime;
}

- (void)setEstimatedStartTimeFromGeneralDiagnosticsUpTime:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedStartTimeFromGeneralDiagnosticsUpTime, a3);
}

- (NSMutableDictionary)temporaryMetaDataCache
{
  return self->_temporaryMetaDataCache;
}

- (void)setTemporaryMetaDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryMetaDataCache, a3);
}

- (void)currentReadClient
{
  return self->_currentReadClient;
}

- (void)setCurrentReadClient:(void *)a3
{
  self->_currentReadClient = a3;
}

- (void)currentSubscriptionCallback
{
  return self->_currentSubscriptionCallback;
}

- (void)setCurrentSubscriptionCallback:(void *)a3
{
  self->_currentSubscriptionCallback = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MTRAsyncWorkQueue)asyncWorkQueue
{
  return self->_asyncWorkQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncWorkQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_temporaryMetaDataCache, 0);
  objc_storeStrong((id *)&self->_estimatedStartTimeFromGeneralDiagnosticsUpTime, 0);
  objc_storeStrong((id *)&self->_expectedValueCache, 0);
  objc_storeStrong((id *)&self->_unreportedEvents, 0);
  objc_storeStrong((id *)&self->_estimatedSubscriptionLatency, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_estimatedStartTime, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong(&self->_systemTimeChangeObserverToken, 0);
  objc_storeStrong((id *)&self->_deviceReportingExcessivelyStartTime, 0);
  objc_storeStrong((id *)&self->_mostRecentReportTimes, 0);
  objc_storeStrong((id *)&self->_clusterDataPersistenceFirstScheduledTime, 0);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_initialSubscribeStart, 0);
  objc_storeStrong(&self->_subscriptionPoolWorkCompletionBlock, 0);
  objc_storeStrong((id *)&self->_connectivityMonitor, 0);
  objc_storeStrong((id *)&self->_lastSubscriptionFailureTime, 0);
  objc_storeStrong((id *)&self->_persistedClusters, 0);
  objc_storeStrong((id *)&self->_clusterDataToPersist, 0);
  objc_storeStrong((id *)&self->_persistedClusterData, 0);
}

- (BOOL)_deviceHasActiveSubscription
{
  os_unfair_lock_s *p_lock;
  unint64_t internalDeviceState;
  BOOL v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  internalDeviceState = self->_internalDeviceState;
  v6 = internalDeviceState == 2 || internalDeviceState == 4;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_deviceMayBeReachable
{
  NSObject *v3;
  const char *v4;
  MTRDeviceController *deviceController;
  MTRDevice *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  MTRDevice *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0, "NotSpecified");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "%@ _deviceMayBeReachable called", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v6 = self;
    sub_2341147D0(0, 2);
  }
  deviceController = self->_deviceController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2340F2828;
  v7[3] = &unk_2504EE8C0;
  v7[4] = self;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(deviceController, v4, (uint64_t)v7, 0, v6);
}

+ (MTRDevice)deviceWithNodeID:(uint64_t)nodeID deviceController:(MTRDeviceController *)deviceController
{
  MTRDeviceController *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = deviceController;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v7, nodeID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceWithNodeID_controller_(a1, v9, (uint64_t)v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRDevice *)v10;
}

- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields expectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueInterval timedInvokeTimeout:(NSNumber *)timeout clientQueue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  objc_msgSend_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_queue_completion_(self, a2, (uint64_t)endpointID, clusterID, commandID, commandFields, expectedValues, expectedValueInterval);
}

@end
