@implementation MTRDeviceControllerDataStore

- (MTRDeviceControllerDataStore)initWithController:(id)a3 storageDelegate:(id)a4 storageDelegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTRDeviceControllerDataStore *v11;
  id *p_isa;
  NSObject *v13;
  id *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  MTRDeviceControllerDataStore *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[4];
  id *v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)MTRDeviceControllerDataStore;
  v11 = -[MTRDeviceControllerDataStore init](&v44, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_controller, v8);
    objc_storeStrong(p_isa + 1, a4);
    objc_storeStrong(p_isa + 2, a5);
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = sub_233FF8C88;
    v42 = sub_233FF8C98;
    v43 = 0;
    v13 = p_isa[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233FF8CA0;
    block[3] = &unk_250500750;
    v37 = &v38;
    v14 = p_isa;
    v35 = v14;
    v36 = v8;
    dispatch_sync(v13, block);
    if (v39[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        sub_234117B80(0, "NotSpecified");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_233BF3000, v27, OS_LOG_TYPE_ERROR, "List of CASE resumption node IDs is not an array", buf, 2u);
        }

        if (sub_234114844(1u))
          sub_2341147D0(0, 1);
LABEL_25:
        v25 = 0;
        goto LABEL_26;
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v15 = (id)v39[5];
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, v47, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v31 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (!sub_233FF8CFC(v20))
            {
              sub_234117B80(0, "NotSpecified");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v20;
                _os_log_impl(&dword_233BF3000, v28, OS_LOG_TYPE_ERROR, "Resumption node ID contains invalid value: %@", buf, 0xCu);
              }

              if (sub_234114844(1u))
                sub_2341147D0(0, 1);

              goto LABEL_25;
            }
          }
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v21, (uint64_t)&v30, v47, 16);
          if (v17)
            continue;
          break;
        }
      }

      v24 = (id)objc_msgSend_mutableCopy((void *)v39[5], v22, v23);
    }
    else
    {
      v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    }
    v26 = v14[4];
    v14[4] = v24;

    v25 = v14;
LABEL_26:

    _Block_object_dispose(&v38, 8);
    goto LABEL_27;
  }
  v25 = 0;
LABEL_27:

  return v25;
}

- (void)fetchAttributeDataForAllDevices:(id)a3
{
  void (**v4)(id, void *);
  id WeakRetained;
  void *v6;
  NSObject *storageDelegateQueue;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = (void (**)(id, void *))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_233FF8C88;
  v19 = sub_233FF8C98;
  v20 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233FF8EC4;
    block[3] = &unk_2504EE898;
    block[4] = self;
    v14 = &v15;
    v13 = WeakRetained;
    dispatch_sync(storageDelegateQueue, block);
    if (objc_msgSend_count((void *)v16[5], v8, v9))
    {
      objc_msgSend__getClusterDataFromSecureLocalValues_(self, v10, v16[5]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11);

    }
  }

  _Block_object_dispose(&v15, 8);
}

- (id)findResumptionInfoByNodeID:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;

  sub_233FF8F84(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__findResumptionInfoWithKey_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)findResumptionInfoByResumptionID:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;

  sub_233FF9044(a3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__findResumptionInfoWithKey_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)storeResumptionInfo:(id)a3
{
  const char *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *storageDelegateQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  MTRDeviceControllerDataStore *v15;
  id v16;
  id v17;

  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
  {
    objc_msgSend_nodeID(v12, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_findResumptionInfoByNodeID_(self, v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233FF91C8;
    block[3] = &unk_250500778;
    v14 = v9;
    v15 = self;
    v16 = WeakRetained;
    v17 = v12;
    v11 = v9;
    dispatch_sync(storageDelegateQueue, block);

  }
}

- (void)clearAllResumptionInfo
{
  id WeakRetained;
  NSMutableArray *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *storageDelegateQueue;
  const char *v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = self->_nodesWithResumptionInfo;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend_findResumptionInfoByNodeID_(self, v6, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            storageDelegateQueue = self->_storageDelegateQueue;
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = sub_233FF9580;
            block[3] = &unk_2504F47E8;
            block[4] = self;
            v15 = WeakRetained;
            v16 = v10;
            dispatch_sync(storageDelegateQueue, block);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend_removeAllObjects(self->_nodesWithResumptionInfo, v12, v13);
  }

}

- (ChipError)storeLastLocallyUsedNOC:(SEL)a3
{
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *storageDelegateQueue;
  unsigned int v10;
  ChipError *result;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    storageDelegateQueue = self->_storageDelegateQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_233FF978C;
    v12[3] = &unk_2505007A0;
    v15 = &v16;
    v12[4] = self;
    v13 = WeakRetained;
    v14 = v6;
    dispatch_sync(storageDelegateQueue, v12);
    if (*((_BYTE *)v17 + 24))
      v10 = 0;
    else
      v10 = 159;
    retstr->mError = v10;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceControllerDataStore.mm";
    retstr->mLine = 262;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    retstr->mError = 159;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceControllerDataStore.mm";
    retstr->mLine = 252;
  }

  return result;
}

- (id)fetchLastLocallyUsedNOC
{
  id WeakRetained;
  void *v4;
  NSObject *storageDelegateQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_233FF8C88;
    v15 = sub_233FF8C98;
    v16 = 0;
    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233FF9924;
    block[3] = &unk_250500750;
    v10 = &v11;
    block[4] = self;
    v9 = WeakRetained;
    dispatch_sync(storageDelegateQueue, block);
    if (v12[5] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v6 = (id)v12[5];
    else
      v6 = 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_findResumptionInfoWithKey:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  NSObject *storageDelegateQueue;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v6 = WeakRetained;
  v7 = 0;
  if (v4 && WeakRetained)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_233FF8C88;
    v18 = sub_233FF8C98;
    v19 = 0;
    storageDelegateQueue = self->_storageDelegateQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_233FF9B04;
    v10[3] = &unk_2505007A0;
    v13 = &v14;
    v10[4] = self;
    v11 = WeakRetained;
    v12 = v4;
    dispatch_sync(storageDelegateQueue, v10);
    if (v15[5] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = (id)v15[5];
    else
      v7 = 0;

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (id)_fetchAttributeCacheValueForKey:(id)a3 expectedClass:(Class)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  const char *v8;
  void *v9;
  id v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x23493ECEC]();
    objc_msgSend_controller_valueForKey_securityLevel_sharingType_(self->_storageDelegate, v8, (uint64_t)WeakRetained, v5, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v7);
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_storeAttributeCacheValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id WeakRetained;
  char v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
    v10 = objc_msgSend_controller_storeValue_forKey_securityLevel_sharingType_(self->_storageDelegate, v8, (uint64_t)WeakRetained, v6, v7, 0, 0);
  else
    v10 = 0;

  return v10;
}

- (BOOL)_bulkStoreAttributeCacheValues:(id)a3
{
  id v4;
  const char *v5;
  id WeakRetained;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
    v7 = objc_msgSend_controller_storeValues_securityLevel_sharingType_(self->_storageDelegate, v5, (uint64_t)WeakRetained, v4, 0, 0);
  else
    v7 = 0;

  return v7;
}

- (BOOL)_removeAttributeCacheValueForKey:(id)a3
{
  id v4;
  const char *v5;
  id WeakRetained;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
    v7 = objc_msgSend_controller_removeValueForKey_securityLevel_sharingType_(self->_storageDelegate, v5, (uint64_t)WeakRetained, v4, 0, 0);
  else
    v7 = 0;

  return v7;
}

- (id)_fetchNodeIndex
{
  uint64_t v3;
  const char *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  v3 = objc_opt_class();
  return (id)objc_msgSend__fetchAttributeCacheValueForKey_expectedClass_(self, v4, (uint64_t)CFSTR("attrCacheNodeIndex"), v3);
}

- (BOOL)_storeNodeIndex:(id)a3
{
  id v4;
  const char *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  LOBYTE(self) = objc_msgSend__storeAttributeCacheValue_forKey_(self, v5, (uint64_t)v4, CFSTR("attrCacheNodeIndex"));

  return (char)self;
}

- (BOOL)_deleteNodeIndex
{
  const char *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  return objc_msgSend__removeAttributeCacheValueForKey_(self, v3, (uint64_t)CFSTR("attrCacheNodeIndex"));
}

- (id)_endpointIndexKeyForNodeID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;

  v3 = a3;
  v6 = objc_msgSend_unsignedLongLongValue(v3, v4, v5);
  objc_msgSend_stringByAppendingFormat_(CFSTR("attrCacheEndpointIndex"), v7, (uint64_t)CFSTR(":0x%016llX"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_fetchEndpointIndexForNodeID:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v4)
  {
    objc_msgSend__endpointIndexKeyForNodeID_(self, v5, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    objc_msgSend__fetchAttributeCacheValueForKey_expectedClass_(self, v8, (uint64_t)v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[MTRDeviceControllerDataStore _fetchEndpointIndexForNodeID:]";
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v9 = 0;
  }

  return v9;
}

- (BOOL)_storeEndpointIndex:(id)a3 forNodeID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  char v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v7)
  {
    objc_msgSend__endpointIndexKeyForNodeID_(self, v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend__storeAttributeCacheValue_forKey_(self, v10, (uint64_t)v6, v9);

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[MTRDeviceControllerDataStore _storeEndpointIndex:forNodeID:]";
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v11 = 0;
  }

  return v11;
}

- (BOOL)_removeEndpointFromEndpointIndex:(id)a3 forNodeID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  char v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v6 && v7)
  {
    objc_msgSend__fetchEndpointIndexForNodeID_(self, v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend_mutableCopy(v9, v10, v11);

    if (v12)
    {
      objc_msgSend_removeObject_(v12, v13, (uint64_t)v6);
      v15 = objc_msgSend__storeEndpointIndex_forNodeID_(self, v14, (uint64_t)v12, v7);
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[MTRDeviceControllerDataStore _removeEndpointFromEndpointIndex:forNodeID:]";
      _os_log_impl(&dword_233BF3000, v16, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v15 = 0;
  }

  return v15;
}

- (BOOL)_deleteEndpointIndexForNodeID:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  char v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v4)
  {
    objc_msgSend__endpointIndexKeyForNodeID_(self, v5, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend__removeAttributeCacheValueForKey_(self, v7, (uint64_t)v6);

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[MTRDeviceControllerDataStore _deleteEndpointIndexForNodeID:]";
      _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v8 = 0;
  }

  return v8;
}

- (id)_clusterIndexKeyForNodeID:(id)a3 endpointID:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v9 = objc_msgSend_unsignedLongLongValue(v5, v7, v8);
  v12 = objc_msgSend_unsignedShortValue(v6, v10, v11);
  objc_msgSend_stringByAppendingFormat_(CFSTR("attrCacheClusterIndex"), v13, (uint64_t)CFSTR(":0x%016llX:0x%04X"), v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_fetchClusterIndexForNodeID:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v6 && v7)
  {
    objc_msgSend__clusterIndexKeyForNodeID_endpointID_(self, v8, (uint64_t)v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend__fetchAttributeCacheValueForKey_expectedClass_(self, v11, (uint64_t)v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[MTRDeviceControllerDataStore _fetchClusterIndexForNodeID:endpointID:]";
      _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v12 = 0;
  }

  return v12;
}

- (BOOL)_storeClusterIndex:(id)a3 forNodeID:(id)a4 endpointID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  char v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v9 && v10)
  {
    objc_msgSend__clusterIndexKeyForNodeID_endpointID_(self, v11, (uint64_t)v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend__storeAttributeCacheValue_forKey_(self, v13, (uint64_t)v8, v12);

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[MTRDeviceControllerDataStore _storeClusterIndex:forNodeID:endpointID:]";
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v14 = 0;
  }

  return v14;
}

- (BOOL)_deleteClusterIndexForNodeID:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  char v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v6 && v7)
  {
    objc_msgSend__clusterIndexKeyForNodeID_endpointID_(self, v8, (uint64_t)v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend__removeAttributeCacheValueForKey_(self, v10, (uint64_t)v9);

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[MTRDeviceControllerDataStore _deleteClusterIndexForNodeID:endpointID:]";
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v11 = 0;
  }

  return v11;
}

- (id)_clusterDataKeyForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unsigned int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v12 = objc_msgSend_unsignedLongLongValue(v7, v10, v11);
  v15 = objc_msgSend_unsignedShortValue(v8, v13, v14);
  v18 = objc_msgSend_unsignedLongValue(v9, v16, v17);
  objc_msgSend_stringByAppendingFormat_(CFSTR("attrCacheClusterData"), v19, (uint64_t)CFSTR(":0x%016llX:0x%04X:0x%08lX"), v12, v15, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_fetchClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v8 && v9 && v10)
  {
    objc_msgSend__clusterDataKeyForNodeID_endpointID_clusterID_(self, v11, (uint64_t)v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    objc_msgSend__fetchAttributeCacheValueForKey_expectedClass_(self, v14, (uint64_t)v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[MTRDeviceControllerDataStore _fetchClusterDataForNodeID:endpointID:clusterID:]";
      _os_log_impl(&dword_233BF3000, v16, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v15 = 0;
  }

  return v15;
}

- (BOOL)_storeClusterData:(id)a3 forNodeID:(id)a4 endpointID:(id)a5 clusterID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  char v17;
  NSObject *v18;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v10 && v11 && v12 && v13)
  {
    objc_msgSend__clusterDataKeyForNodeID_endpointID_clusterID_(self, v14, (uint64_t)v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend__storeAttributeCacheValue_forKey_(self, v16, (uint64_t)v10, v15);

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[MTRDeviceControllerDataStore _storeClusterData:forNodeID:endpointID:clusterID:]";
      _os_log_impl(&dword_233BF3000, v18, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v17 = 0;
  }

  return v17;
}

- (BOOL)_deleteClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  char v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  if (v8 && v9 && v10)
  {
    objc_msgSend__clusterDataKeyForNodeID_endpointID_clusterID_(self, v11, (uint64_t)v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend__removeAttributeCacheValueForKey_(self, v13, (uint64_t)v12);

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[MTRDeviceControllerDataStore _deleteClusterDataForNodeID:endpointID:clusterID:]";
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v14 = 0;
  }

  return v14;
}

- (void)_pruneEmptyStoredClusterDataBranches
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  char v36;
  const char *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  char v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  char v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id obj;
  uint64_t i;
  void *v102;
  uint64_t v103;
  id v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t j;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint8_t buf[4];
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  int v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  objc_msgSend__fetchNodeIndex(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (void *)objc_msgSend_mutableCopy(v5, v6, v7);
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v5;
  v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v117, v129, 16);
  if (v97)
  {
    v103 = 0;
    v98 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v97; ++i)
      {
        if (*(_QWORD *)v118 != v98)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend__fetchEndpointIndexForNodeID_(self, v9, (uint64_t)v10, v93);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = (void *)objc_msgSend_mutableCopy(v96, v11, v12);
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v104 = v96;
        v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v13, (uint64_t)&v113, v128, 16);
        if (v107)
        {
          v106 = *(_QWORD *)v114;
          do
          {
            for (j = 0; j != v107; ++j)
            {
              if (*(_QWORD *)v114 != v106)
                objc_enumerationMutation(v104);
              v15 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
              objc_msgSend__fetchClusterIndexForNodeID_endpointID_(self, v14, (uint64_t)v10, v15, v93, v94, v95);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)objc_msgSend_mutableCopy(v105, v16, v17);
              v111 = 0u;
              v112 = 0u;
              v109 = 0u;
              v110 = 0u;
              v19 = v105;
              v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v109, v127, 16);
              if (v22)
              {
                v23 = *(_QWORD *)v110;
                do
                {
                  for (k = 0; k != v22; ++k)
                  {
                    if (*(_QWORD *)v110 != v23)
                      objc_enumerationMutation(v19);
                    v25 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * k);
                    objc_msgSend__fetchClusterDataForNodeID_endpointID_clusterID_(self, v21, (uint64_t)v10, v15, v25);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v27)
                      objc_msgSend_removeObject_(v18, v26, v25);

                  }
                  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v109, v127, 16);
                }
                while (v22);
              }

              v30 = objc_msgSend_count(v19, v28, v29);
              if (v30 != objc_msgSend_count(v18, v31, v32))
              {
                if (objc_msgSend_count(v18, v33, v34))
                {
                  v36 = objc_msgSend__storeClusterIndex_forNodeID_endpointID_(self, v35, (uint64_t)v18, v10, v15);
                }
                else
                {
                  objc_msgSend_removeObject_(v102, v35, (uint64_t)v15);
                  v36 = objc_msgSend__deleteClusterIndexForNodeID_endpointID_(self, v37, (uint64_t)v10, v15);
                }
                if ((v36 & 1) == 0)
                {
                  sub_234117B80(0, "NotSpecified");
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    v41 = objc_msgSend_count(v18, v39, v40);
                    v44 = objc_msgSend_unsignedLongLongValue(v10, v42, v43);
                    v47 = objc_msgSend_unsignedShortValue(v15, v45, v46);
                    *(_DWORD *)buf = 134218496;
                    v122 = v41;
                    v123 = 2048;
                    v124 = v44;
                    v125 = 1024;
                    v126 = v47;
                    _os_log_impl(&dword_233BF3000, v38, OS_LOG_TYPE_ERROR, "Store failed in _pruneEmptyStoredClusterDataBranches for clusterIndex (%lu) @ node 0x%016llX endpoint %u", buf, 0x1Cu);
                  }

                  ++v103;
                  if (sub_234114844(1u))
                  {
                    v50 = objc_msgSend_count(v18, v48, v49);
                    v94 = objc_msgSend_unsignedLongLongValue(v10, v51, v52);
                    v95 = objc_msgSend_unsignedShortValue(v15, v53, v54);
                    v93 = v50;
                    sub_2341147D0(0, 1);
                  }
                }
              }

            }
            v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v14, (uint64_t)&v113, v128, 16);
          }
          while (v107);
        }

        v57 = objc_msgSend_count(v104, v55, v56);
        if (v57 != objc_msgSend_count(v102, v58, v59))
        {
          if (objc_msgSend_count(v102, v60, v61))
          {
            v63 = objc_msgSend__storeEndpointIndex_forNodeID_(self, v62, (uint64_t)v102, v10);
          }
          else
          {
            objc_msgSend_removeObject_(v99, v62, (uint64_t)v10);
            v63 = objc_msgSend__deleteEndpointIndexForNodeID_(self, v64, (uint64_t)v10);
          }
          if ((v63 & 1) == 0)
          {
            sub_234117B80(0, "NotSpecified");
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              v68 = objc_msgSend_count(v102, v66, v67);
              v71 = objc_msgSend_unsignedLongLongValue(v10, v69, v70);
              *(_DWORD *)buf = 134218240;
              v122 = v68;
              v123 = 2048;
              v124 = v71;
              _os_log_impl(&dword_233BF3000, v65, OS_LOG_TYPE_ERROR, "Store failed in _pruneEmptyStoredClusterDataBranches for endpointIndex (%lu) @ node 0x%016llX", buf, 0x16u);
            }

            ++v103;
            if (sub_234114844(1u))
            {
              v93 = objc_msgSend_count(v102, v72, v73);
              v94 = objc_msgSend_unsignedLongLongValue(v10, v74, v75);
              sub_2341147D0(0, 1);
            }
          }
        }

      }
      v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v117, v129, 16);
    }
    while (v97);
  }
  else
  {
    v103 = 0;
  }

  v78 = objc_msgSend_count(obj, v76, v77);
  if (v78 != objc_msgSend_count(v99, v79, v80))
  {
    v85 = objc_msgSend_count(v99, v81, v82)
        ? objc_msgSend__storeNodeIndex_(self, v83, (uint64_t)v99)
        : objc_msgSend__deleteNodeIndex(self, v83, v84);
    if ((v85 & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v89 = objc_msgSend_count(v99, v87, v88);
        *(_DWORD *)buf = 134217984;
        v122 = v89;
        _os_log_impl(&dword_233BF3000, v86, OS_LOG_TYPE_ERROR, "Store failed in _pruneEmptyStoredClusterDataBranches for nodeIndex (%lu)", buf, 0xCu);
      }

      ++v103;
      if (sub_234114844(1u))
      {
        objc_msgSend_count(v99, v90, v91);
        sub_2341147D0(0, 1);
      }
    }
  }
  if (v103)
  {
    sub_234117B80(0, "NotSpecified");
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v122 = v103;
      _os_log_impl(&dword_233BF3000, v92, OS_LOG_TYPE_ERROR, "Store failed in _pruneEmptyStoredClusterDataBranches: failure count %lu", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }

}

- (void)_clearStoredClusterDataForNodeID:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id obj;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  _BYTE v82[18];
  __int16 v83;
  uint64_t v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageDelegateQueue);
  objc_msgSend__fetchEndpointIndexForNodeID_(self, v5, (uint64_t)v4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_count(v59, v6, v7);
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v59;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v75, v86, 16);
  if (v9)
  {
    v70 = 0;
    v67 = 0;
    v63 = *(_QWORD *)v76;
    v64 = 0;
    do
    {
      v68 = 0;
      v65 = v9;
      do
      {
        if (*(_QWORD *)v76 != v63)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v68);
        objc_msgSend__fetchClusterIndexForNodeID_endpointID_(self, v10, (uint64_t)v4, v11, v56, v57, v58);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend_count(v62, v12, v13);
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = v62;
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v14, (uint64_t)&v71, v85, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v72 != v17)
                objc_enumerationMutation(v69);
              v19 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              if ((objc_msgSend__deleteClusterDataForNodeID_endpointID_clusterID_(self, v15, (uint64_t)v4, v11, v19, v56) & 1) != 0)
              {
                ++v70;
              }
              else
              {
                sub_234117B80(0, "NotSpecified");
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  v23 = objc_msgSend_unsignedLongLongValue(v4, v21, v22);
                  v26 = objc_msgSend_unsignedShortValue(v11, v24, v25);
                  v29 = objc_msgSend_unsignedLongValue(v19, v27, v28);
                  *(_DWORD *)buf = 134218496;
                  v80 = v23;
                  v81 = 1024;
                  *(_DWORD *)v82 = v26;
                  *(_WORD *)&v82[4] = 2048;
                  *(_QWORD *)&v82[6] = v29;
                  _os_log_impl(&dword_233BF3000, v20, OS_LOG_TYPE_ERROR, "Delete failed for clusterData @ node 0x%016llX endpoint %u cluster 0x%08lX", buf, 0x1Cu);
                }

                if (sub_234114844(1u))
                {
                  v31 = objc_msgSend_unsignedLongLongValue(v4, v15, v30);
                  v57 = objc_msgSend_unsignedShortValue(v11, v32, v33);
                  v58 = objc_msgSend_unsignedLongValue(v19, v34, v35);
                  v56 = v31;
                  sub_2341147D0(0, 1);
                }
              }
            }
            v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v15, (uint64_t)&v71, v85, 16);
          }
          while (v16);
        }

        if ((objc_msgSend__deleteClusterIndexForNodeID_endpointID_(self, v36, (uint64_t)v4, v11) & 1) != 0)
        {
          ++v64;
        }
        else
        {
          sub_234117B80(0, "NotSpecified");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v40 = objc_msgSend_unsignedLongLongValue(v4, v38, v39);
            v43 = objc_msgSend_unsignedShortValue(v11, v41, v42);
            *(_DWORD *)buf = 134218240;
            v80 = v40;
            v81 = 1024;
            *(_DWORD *)v82 = v43;
            _os_log_impl(&dword_233BF3000, v37, OS_LOG_TYPE_ERROR, "Delete failed for clusterIndex @ node 0x%016llX endpoint %u", buf, 0x12u);
          }

          if (sub_234114844(1u))
          {
            v56 = objc_msgSend_unsignedLongLongValue(v4, v44, v45);
            v57 = objc_msgSend_unsignedShortValue(v11, v46, v47);
            sub_2341147D0(0, 1);
          }
        }

        v67 += v66;
        ++v68;
      }
      while (v68 != v65);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v75, v86, 16);
    }
    while (v9);
  }
  else
  {
    v70 = 0;
    v64 = 0;
    v67 = 0;
  }

  if ((objc_msgSend__deleteEndpointIndexForNodeID_(self, v48, (uint64_t)v4) & 1) == 0)
  {
    sub_234117B80(0, "NotSpecified");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v52 = objc_msgSend_unsignedLongLongValue(v4, v50, v51);
      *(_DWORD *)buf = 134217984;
      v80 = v52;
      _os_log_impl(&dword_233BF3000, v49, OS_LOG_TYPE_ERROR, "Delete failed for endpointIndex @ node 0x%016llX", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      objc_msgSend_unsignedLongLongValue(v4, v53, v54);
      sub_2341147D0(0, 1);
    }
  }
  sub_234117B80(0, "NotSpecified");
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v80 = v64;
    v81 = 2048;
    *(_QWORD *)v82 = v60;
    *(_WORD *)&v82[8] = 2048;
    *(_QWORD *)&v82[10] = v70;
    v83 = 2048;
    v84 = v67;
    _os_log_impl(&dword_233BF3000, v55, OS_LOG_TYPE_DEFAULT, "clearStoredClusterDataForNodeID: deleted endpoints %lu/%lu clusters %lu/%lu", buf, 0x2Au);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);

}

- (void)clearStoredClusterDataForNodeID:(id)a3
{
  id v4;
  NSObject *storageDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  storageDelegateQueue = self->_storageDelegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233FFBEC4;
  v7[3] = &unk_2504EE768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(storageDelegateQueue, v7);

}

- (void)clearStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *storageDelegateQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  storageDelegateQueue = self->_storageDelegateQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_233FFC124;
  v15[3] = &unk_250500778;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(storageDelegateQueue, v15);

}

- (void)clearStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4
{
  id v6;
  id v7;
  NSObject *storageDelegateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233FFC568;
  block[3] = &unk_2504F47E8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(storageDelegateQueue, block);

}

- (void)removeAttributes:(id)a3 fromCluster:(id)a4 forNodeID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *storageDelegateQueue;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_endpoint(v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cluster(v9, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getStoredClusterDataForNodeID_endpointID_clusterID_(self, v17, (uint64_t)v10, v13, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v8;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v31, v35, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v32;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v19);
          objc_msgSend_removeValueForAttribute_(v18, v21, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v24++));
        }
        while (v22 != v24);
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v31, v35, 16);
      }
      while (v22);
    }

    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233FFCC70;
    block[3] = &unk_2504EE978;
    block[4] = self;
    v27 = v18;
    v28 = v10;
    v29 = v9;
    v30 = v19;
    dispatch_async(storageDelegateQueue, block);

  }
}

- (void)clearAllStoredClusterData
{
  NSObject *storageDelegateQueue;
  _QWORD block[5];

  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233FFCFF4;
  block[3] = &unk_2504EE8C0;
  block[4] = self;
  dispatch_async(storageDelegateQueue, block);
}

- (id)getStoredClusterDataForNodeID:(id)a3
{
  id v4;
  void *v5;
  NSObject *storageDelegateQueue;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v14 = 0x3032000000;
    v15 = sub_233FF8C88;
    v16 = sub_233FF8C98;
    v17 = 0;
    storageDelegateQueue = self->_storageDelegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233FFD344;
    block[3] = &unk_2504F4600;
    block[4] = self;
    v11 = v4;
    p_buf = &buf;
    dispatch_sync(storageDelegateQueue, block);
    v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[MTRDeviceControllerDataStore getStoredClusterDataForNodeID:]";
      _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v7 = 0;
  }

  return v7;
}

- (id)getStoredClusterDataForNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *storageDelegateQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_233FF8C88;
  v26 = sub_233FF8C98;
  v27 = 0;
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233FFD9F0;
  block[3] = &unk_2505007C8;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(storageDelegateQueue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)_getClusterDataFromSecureLocalValues:(id)a3
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v37;
  id obj;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t i;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t j;
  id v50;
  __int128 v51;
  __int128 v52;
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
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v50, v3, (uint64_t)CFSTR("attrCacheNodeIndex"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v39;
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v59, v65, 16);
      if (v41)
      {
        v37 = 0;
        v40 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v60 != v40)
              objc_enumerationMutation(obj);
            v5 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend__endpointIndexKeyForNodeID_(self, v6, v5);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v50, v8, (uint64_t)v7);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                v44 = v42;
                v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v9, (uint64_t)&v55, v64, 16);
                if (v10)
                {
                  v11 = 0;
                  v45 = *(_QWORD *)v56;
                  v46 = v10;
                  do
                  {
                    for (j = 0; j != v46; ++j)
                    {
                      if (*(_QWORD *)v56 != v45)
                        objc_enumerationMutation(v44);
                      v12 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend__clusterIndexKeyForNodeID_endpointID_(self, v13, v5, v12);
                        v14 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_objectForKeyedSubscript_(v50, v15, (uint64_t)v14);
                        v47 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v53 = 0u;
                          v54 = 0u;
                          v51 = 0u;
                          v52 = 0u;
                          v16 = v47;
                          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v51, v63, 16);
                          if (v18)
                          {
                            v19 = *(_QWORD *)v52;
                            do
                            {
                              for (k = 0; k != v18; ++k)
                              {
                                if (*(_QWORD *)v52 != v19)
                                  objc_enumerationMutation(v16);
                                v21 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k);
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  objc_msgSend__clusterDataKeyForNodeID_endpointID_clusterID_(self, v22, v5, v12, v21);
                                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend_objectForKeyedSubscript_(v50, v24, (uint64_t)v23);
                                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (v25)
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      objc_msgSend_clusterPathWithEndpointID_clusterID_(MTRClusterPath, v26, v12, v21);
                                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (!v11)
                                      {
                                        objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v27, v28);
                                        v11 = (void *)objc_claimAutoreleasedReturnValue();
                                      }
                                      objc_msgSend_setObject_forKeyedSubscript_(v11, v27, (uint64_t)v25, v29, v37);

                                    }
                                  }

                                }
                              }
                              v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v22, (uint64_t)&v51, v63, 16);
                            }
                            while (v18);
                          }

                        }
                      }
                    }
                    v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v13, (uint64_t)&v55, v64, 16);
                  }
                  while (v46);
                }
                else
                {
                  v11 = 0;
                }

                if (objc_msgSend_count(v11, v30, v31))
                {
                  v34 = v37;
                  if (!v37)
                  {
                    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v32, v33, 0);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  objc_msgSend_setObject_forKeyedSubscript_(v34, v32, (uint64_t)v11, v5, v34);
                }
              }
              else
              {
                v11 = 0;
              }

            }
          }
          v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v59, v65, 16);
        }
        while (v41);
      }
      else
      {
        v37 = 0;
      }

      v35 = v37;
    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)storeClusterData:(id)a3 forNodeID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  NSObject *storageDelegateQueue;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = a4;
  if (v9)
  {
    if (objc_msgSend_count(v6, v7, v8))
    {
      storageDelegateQueue = self->_storageDelegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_233FFE218;
      block[3] = &unk_2504F47E8;
      block[4] = self;
      v14 = v6;
      v15 = v9;
      dispatch_async(storageDelegateQueue, block);

      goto LABEL_12;
    }
    sub_234117B80(0, "NotSpecified");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[MTRDeviceControllerDataStore storeClusterData:forNodeID:]";
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_ERROR, "%s: nothing to store", buf, 0xCu);
    }

    if (sub_234114844(1u))
LABEL_11:
      sub_2341147D0(0, 1);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[MTRDeviceControllerDataStore storeClusterData:forNodeID:]";
      _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_ERROR, "%s: unexpected nil input", buf, 0xCu);
    }

    if (sub_234114844(1u))
      goto LABEL_11;
  }
LABEL_12:

}

- (id)_deviceDataKeyForNodeID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;

  v3 = a3;
  v6 = objc_msgSend_unsignedLongLongValue(v3, v4, v5);
  objc_msgSend_stringByAppendingFormat_(CFSTR("deviceData"), v7, (uint64_t)CFSTR(":0x%016llX"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getStoredDeviceDataForNodeID:(id)a3
{
  id v4;
  NSObject *storageDelegateQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_233FF8C88;
  v16 = sub_233FF8C98;
  v17 = 0;
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233FFF2C4;
  block[3] = &unk_2504F4600;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(storageDelegateQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)storeDeviceData:(id)a3 forNodeID:(id)a4
{
  id v6;
  id v7;
  NSObject *storageDelegateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  storageDelegateQueue = self->_storageDelegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233FFF56C;
  block[3] = &unk_2504F47E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(storageDelegateQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesWithResumptionInfo, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_storageDelegateQueue, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
}

@end
