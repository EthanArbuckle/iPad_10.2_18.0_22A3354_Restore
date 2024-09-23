@implementation MTRDeviceController

- (MTRDeviceController)initWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  _BYTE *v10;
  MTRDeviceController *v11;
  NSObject *v12;
  __int128 v14;
  int v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend_sharedInstance(MTRDeviceControllerFactory, v8, v9);
    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    sub_233C0AFBC(v10, self, v7, a4);
    v11 = (MTRDeviceController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_ERROR, "Unsupported type of MTRDeviceControllerAbstractParameters: %@", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    if (a4)
    {
      LODWORD(v14) = 47;
      *((_QWORD *)&v14 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController.mm";
      v15 = 140;
      sub_2340017F0((uint64_t)MTRError, &v14);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (MTRDeviceController)initWithFactory:(id)a3 queue:(id)a4 storageDelegate:(id)a5 storageDelegateQueue:(id)a6 otaProviderDelegate:(id)a7 otaProviderDelegateQueue:(id)a8 uniqueIdentifier:(id)a9 concurrentSubscriptionPoolSize:(unint64_t)a10 storageBehaviorConfiguration:(id)a11
{
  MTRDeviceController *v18;
  MTRDeviceController *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  MTRDeviceControllerLocalTestStorage *v26;
  const char *v27;
  uint64_t v28;
  MTRDeviceControllerDataStore *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  dispatch_queue_t v35;
  MTRDeviceControllerLocalTestStorage *v36;
  const char *v37;
  void *v38;
  MTRDeviceControllerDataStore *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  BOOL v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  MTRDeviceController *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  _QWORD *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t i;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  void *v67;
  BOOL v68;
  const char *v69;
  int64_t v70;
  NSObject *v71;
  NSObject *v72;
  MTRAsyncWorkQueue *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  objc_super v91;
  uint8_t buf[4];
  unint64_t v93;
  __int16 v94;
  unint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v83 = a3;
  v84 = a4;
  v90 = a5;
  v88 = a6;
  v89 = a7;
  v87 = a8;
  v85 = a9;
  v86 = a11;
  v91.receiver = self;
  v91.super_class = (Class)MTRDeviceController;
  v18 = -[MTRDeviceController init](&v91, sel_init);
  v19 = v18;
  v20 = (uint64_t)v18;
  if (!v18)
    goto LABEL_58;
  objc_storeStrong((id *)&v18->_uniqueIdentifier, a9);
  if (v90)
  {
    if (!v88)
    {
      sub_234117B80(0, "NotSpecified");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v46, OS_LOG_TYPE_ERROR, "storageDelegate provided without storageDelegateQueue", buf, 2u);
      }

      if (!sub_234114844(1u))
        goto LABEL_26;
      goto LABEL_25;
    }
    v23 = v90;
    if (objc_msgSend_localTestStorageEnabled(MTRDeviceControllerLocalTestStorage, v24, v25))
    {
      v26 = [MTRDeviceControllerLocalTestStorage alloc];
      v28 = objc_msgSend_initWithPassThroughStorage_(v26, v27, (uint64_t)v23);

      v23 = (id)v28;
    }
    v29 = [MTRDeviceControllerDataStore alloc];
    v31 = objc_msgSend_initWithController_storageDelegate_storageDelegateQueue_(v29, v30, v20, v23, v88);
    v32 = *(void **)(v20 + 1528);
    *(_QWORD *)(v20 + 1528) = v31;

    v33 = v19->_controllerDataStore == 0;
    if (v33)
      goto LABEL_26;
  }
  else if (objc_msgSend_localTestStorageEnabled(MTRDeviceControllerLocalTestStorage, v21, v22))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_queue_create("org.csa-iot.matter.framework.devicecontroller.localteststorage", v34);

    v36 = [MTRDeviceControllerLocalTestStorage alloc];
    v38 = (void *)objc_msgSend_initWithPassThroughStorage_(v36, v37, 0);
    v39 = [MTRDeviceControllerDataStore alloc];
    v41 = objc_msgSend_initWithController_storageDelegate_storageDelegateQueue_(v39, v40, v20, v38, v35);
    v42 = *(void **)(v20 + 1528);
    *(_QWORD *)(v20 + 1528) = v41;

    v43 = v19->_controllerDataStore == 0;
    if (v43)
      goto LABEL_26;
  }
  if (!v89 && v87)
  {
    sub_234117B80(0, "NotSpecified");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v44, OS_LOG_TYPE_ERROR, "Must have otaProviderDelegate when we have otaProviderDelegateQueue", buf, 2u);
    }

    if (!sub_234114844(1u))
      goto LABEL_26;
    goto LABEL_25;
  }
  if (v89 && !v87)
  {
    sub_234117B80(0, "NotSpecified");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v45, OS_LOG_TYPE_ERROR, "Must have otaProviderDelegateQueue when we have otaProviderDelegate", buf, 2u);
    }

    if (!sub_234114844(1u))
      goto LABEL_26;
    goto LABEL_25;
  }
  if (!v89)
    goto LABEL_38;
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
          {
LABEL_38:
            objc_storeStrong((id *)&v19->_otaProviderDelegate, a7);
            objc_storeStrong((id *)&v19->_otaProviderDelegateQueue, a8);
            objc_storeStrong((id *)&v19->_chipWorkQueue, a4);
            objc_storeStrong((id *)&v19->_factory, a3);
            *(_DWORD *)(v20 + 1480) = 0;
            objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x24BDD1650], v48, v49);
            v50 = objc_claimAutoreleasedReturnValue();
            v51 = *(void **)(v20 + 1472);
            *(_QWORD *)(v20 + 1472) = v50;

            v52 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v53 = *(void **)(v20 + 1504);
            *(_QWORD *)(v20 + 1504) = v52;

            v54 = *(void **)(v20 + 1488);
            *(_QWORD *)(v20 + 1488) = 0;

            v55 = (_QWORD *)operator new();
            sub_233BF5370(v55);
            *(_QWORD *)(v20 + 48) = v55;
            if ((objc_msgSend_checkForInitError_logMsg_((void *)v20, v56, 1, CFSTR("Init failure while creating a pairing delegate")) & 1) != 0)goto LABEL_26;
            v57 = operator new();
            *(_BYTE *)(v57 + 8) = 1;
            *(_QWORD *)(v57 + 16) = &off_25051C1E0;
            for (i = 64; i != 664; i += 120)
              *(_QWORD *)(v57 + i) = &off_250505A50;
            *(_QWORD *)(v57 + 624) = 0;
            *(_QWORD *)v57 = &unk_25051C118;
            *(_QWORD *)(v20 + 32) = v57;
            if ((objc_msgSend_checkForInitError_logMsg_((void *)v20, v58, 1, CFSTR("Init failure while creating a partial DAC verifier")) & 1) != 0)goto LABEL_26;
            v61 = operator new();
            sub_234036454(v61, (void *)v20);
            *(_QWORD *)(v20 + 56) = v61;
            if ((objc_msgSend_checkForInitError_logMsg_((void *)v20, v62, 1, CFSTR("Init failure while creating operational credentials delegate")) & 1) != 0)goto LABEL_26;
            objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v63, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v65, v66, (uint64_t)CFSTR("subscriptionPoolSizeOverride"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v67 == 0;

            if (!v68)
            {
              v70 = objc_msgSend_integerForKey_(v65, v69, (uint64_t)CFSTR("subscriptionPoolSizeOverride"));
              if (v70 <= 1)
                a10 = 1;
              else
                a10 = v70;
              sub_234117B80(0, "NotSpecified");
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v93 = a10;
                _os_log_impl(&dword_233BF3000, v71, OS_LOG_TYPE_DEFAULT, " *** Overriding pool size of MTRDeviceController with: %lu", buf, 0xCu);
              }

              if (sub_234114844(2u))
                sub_2341147D0(0, 2);
            }
            if (a10 <= 1)
              a10 = 1;
            sub_234117B80(0, "NotSpecified");
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v93 = v20;
              v94 = 2048;
              v95 = a10;
              _os_log_impl(&dword_233BF3000, v72, OS_LOG_TYPE_DEFAULT, "%@ Setting up pool size of MTRDeviceController with: %lu", buf, 0x16u);
            }

            if (sub_234114844(2u))
              sub_2341147D0(0, 2);
            v73 = [MTRAsyncWorkQueue alloc];
            v75 = objc_msgSend_initWithContext_width_(v73, v74, v20, a10);
            v76 = *(void **)(v20 + 1552);
            *(_QWORD *)(v20 + 1552) = v75;

            atomic_store(0, &v19->_storedFabricIndex.__a_.__a_value);
            objc_storeStrong((id *)&v19->_storageBehaviorConfiguration, a11);

LABEL_58:
            v47 = (MTRDeviceController *)(id)v20;
            goto LABEL_59;
          }
          sub_234117B80(0, "NotSpecified");
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_233BF3000, v82, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleBDXQueryForNodeID", buf, 2u);
          }

          if (!sub_234114844(1u))
            goto LABEL_26;
        }
        else
        {
          sub_234117B80(0, "NotSpecified");
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_233BF3000, v81, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleBDXTransferSessionBeginForNodeID", buf, 2u);
          }

          if (!sub_234114844(1u))
            goto LABEL_26;
        }
      }
      else
      {
        sub_234117B80(0, "NotSpecified");
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_233BF3000, v80, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleNotifyUpdateAppliedForNodeID", buf, 2u);
        }

        if (!sub_234114844(1u))
          goto LABEL_26;
      }
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v79, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleApplyUpdateRequestForNodeID", buf, 2u);
      }

      if (!sub_234114844(1u))
        goto LABEL_26;
    }
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v78, OS_LOG_TYPE_ERROR, "Error: MTROTAProviderDelegate does not support handleQueryImageForNodeID", buf, 2u);
    }

    if (!sub_234114844(1u))
      goto LABEL_26;
  }
LABEL_25:
  sub_2341147D0(0, 1);
LABEL_26:
  v47 = 0;
LABEL_59:

  return v47;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("<MTRDeviceController: %p uuid %@>"), self, self->_uniqueIdentifier);
}

- (BOOL)isRunning
{
  return self->_cppCommissioner != 0;
}

- (void)shutdown
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  MTRDeviceController *v7;
  uint8_t buf[4];
  MTRDeviceController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0, "NotSpecified");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "%@ shutdown called", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v7 = self;
    sub_2341147D0(0, 2);
  }
  if (self->_cppCommissioner)
  {
    sub_234117B80(0, "NotSpecified");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_233BF3000, v4, OS_LOG_TYPE_DEFAULT, "Shutting down MTRDeviceController: %@", buf, 0xCu);
    }

    if (sub_234114844(2u))
    {
      v7 = self;
      sub_2341147D0(0, 2);
    }
    objc_msgSend_cleanupAfterStartup(self, v5, v6, v7);
  }
}

- (void)cleanupAfterStartup
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  MTRDeviceController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  MTRDeviceController *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0, "NotSpecified");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = self;
    _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "cleanupAfterStartup MTRDeviceController: %@", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v18 = self;
    sub_2341147D0(0, 2);
  }
  os_unfair_lock_lock(&self->_deviceMapLock);
  objc_msgSend_objectEnumerator(self->_nodeIDToDeviceMap, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(self->_nodeIDToDeviceMap, v7, v8);
  os_unfair_lock_unlock(&self->_deviceMapLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_invalidate(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v15++), v11, v12, v18);
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend_stopBrowseForCommissionables(self, v16, v17);
  sub_233C08840((uint64_t)self->_factory, self);

}

- (void)shutDownCppController
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *cppCommissioner;
  _QWORD *operationalCredentialsDelegate;
  MTRDeviceController *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  MTRDeviceController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0, "NotSpecified");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = self;
    _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "shutDownCppController MTRDeviceController: %p", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v14 = self;
    sub_2341147D0(0, 2);
  }
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController.mm", 335);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_msgSend_copy(self->_serverEndpoints, v4, v5);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend_removeServerEndpointOnMatterQueue_(self, v8, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11++), v14);
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v15, v19, 16);
    }
    while (v9);
  }

  cppCommissioner = self->_cppCommissioner;
  if (cppCommissioner)
  {
    self->_cppCommissioner = 0;
    (*(void (**)(void *))(*(_QWORD *)cppCommissioner + 32))(cppCommissioner);
    atomic_store(0, &self->_storedFabricIndex.__a_.__a_value);
    (*(void (**)(void *))(*(_QWORD *)cppCommissioner + 8))(cppCommissioner);
    operationalCredentialsDelegate = self->_operationalCredentialsDelegate;
    if (operationalCredentialsDelegate)
      operationalCredentialsDelegate[11] = 0;
  }
}

- (void)cleanup
{
  uint64_t v2;
  void *defaultDACVerifier;
  MTRAttestationTrustStoreBridge *attestationTrustStoreBridge;
  void *operationalCredentialsDelegate;
  void *partialDACVerifier;
  MTRDeviceControllerDelegateBridge *deviceControllerDelegateBridge;

  if (self->_cppCommissioner)
    sub_2342564E0();
  defaultDACVerifier = self->_defaultDACVerifier;
  if (defaultDACVerifier)
  {
    (*(void (**)(void *, SEL))(*(_QWORD *)defaultDACVerifier + 8))(defaultDACVerifier, a2);
    self->_defaultDACVerifier = 0;
  }
  attestationTrustStoreBridge = self->_attestationTrustStoreBridge;
  if (attestationTrustStoreBridge)
  {
    (*((void (**)(MTRAttestationTrustStoreBridge *, SEL))attestationTrustStoreBridge->var0 + 1))(attestationTrustStoreBridge, a2);
    self->_attestationTrustStoreBridge = 0;
  }
  objc_msgSend_clearDeviceAttestationDelegateBridge(self, a2, v2);
  operationalCredentialsDelegate = self->_operationalCredentialsDelegate;
  if (operationalCredentialsDelegate)
  {
    (*(void (**)(void *))(*(_QWORD *)operationalCredentialsDelegate + 8))(operationalCredentialsDelegate);
    self->_operationalCredentialsDelegate = 0;
  }
  partialDACVerifier = self->_partialDACVerifier;
  if (partialDACVerifier)
  {
    (*(void (**)(void *))(*(_QWORD *)partialDACVerifier + 8))(partialDACVerifier);
    self->_partialDACVerifier = 0;
  }
  deviceControllerDelegateBridge = self->_deviceControllerDelegateBridge;
  if (deviceControllerDelegateBridge)
  {
    (*((void (**)(MTRDeviceControllerDelegateBridge *))deviceControllerDelegateBridge->var0 + 1))(deviceControllerDelegateBridge);
    self->_deviceControllerDelegateBridge = 0;
  }
}

- (BOOL)startup:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  NSObject *chipWorkQueue;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  char v19;
  const char *v20;
  MTRDeviceControllerDataStore *controllerDataStore;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  MTRDeviceController *v28;
  _QWORD v29[5];
  _QWORD block[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  MTRDeviceController *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  if (!objc_msgSend_isRunning(self, v5, v6))
  {
    v9 = MEMORY[0x24BDAC760];
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233D4A4C4;
    block[3] = &unk_2504F4600;
    block[4] = self;
    v11 = v4;
    v31 = v11;
    v32 = &v33;
    dispatch_sync(chipWorkQueue, block);
    if (*((_BYTE *)v34 + 24))
    {
      objc_msgSend_operationalCertificateIssuer(v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationalCertificateIssuerQueue(v11, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend_setOperationalCertificateIssuer_queue_(self, v18, (uint64_t)v14, v17);

      if ((v19 & 1) != 0)
      {
        controllerDataStore = self->_controllerDataStore;
        if (controllerDataStore)
        {
          v29[0] = v9;
          v29[1] = 3221225472;
          v29[2] = sub_233D4B5E4;
          v29[3] = &unk_2504F4628;
          v29[4] = self;
          objc_msgSend_fetchAttributeDataForAllDevices_(controllerDataStore, v20, (uint64_t)v29);
        }
        sub_234117B80(0, "NotSpecified");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = self;
          _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_DEFAULT, "MTRDeviceController startup: %@", buf, 0xCu);
        }

        if (sub_234114844(2u))
          sub_2341147D0(0, 2);
        v8 = 1;
        goto LABEL_26;
      }
      sub_234117B80(0, "NotSpecified");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = self;
        _os_log_impl(&dword_233BF3000, v26, OS_LOG_TYPE_ERROR, "%@ operationalCertificateIssuer and operationalCertificateIssuerQueue must both be nil or both be non-nil", buf, 0xCu);
      }

      if (!sub_234114844(1u))
      {
LABEL_25:
        objc_msgSend_cleanupAfterStartup(self, v24, v25, v28);
        v8 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = self;
        _os_log_impl(&dword_233BF3000, v23, OS_LOG_TYPE_ERROR, "%@ startup failed", buf, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_25;
    }
    v28 = self;
    sub_2341147D0(0, 1);
    goto LABEL_25;
  }
  sub_234117B80(0, "NotSpecified");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v38 = self;
    _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "%@ Unexpected duplicate call to startup", buf, 0xCu);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  v8 = 0;
LABEL_27:
  _Block_object_dispose(&v33, 8);

  return v8;
}

- (NSNumber)controllerNodeID
{
  void *v3;
  const char *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  MTRDeviceController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_233D4BC48;
  v8[3] = &unk_2504F4650;
  v8[4] = self;
  v3 = (void *)MEMORY[0x23493EEA8](v8, a2);
  objc_msgSend_syncRunOnWorkQueueWithReturnValue_error_(self, v4, (uint64_t)v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    sub_234117B80(0, "NotSpecified");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "%@ A controller has no node id if it has not been started", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }

  return (NSNumber *)v5;
}

- (BOOL)setupCommissioningSessionWithPayload:(MTRSetupPayload *)payload newNodeID:(NSNumber *)newNodeID error:(NSError *)error
{
  MTRSetupPayload *v8;
  NSNumber *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  MTRSetupPayload *v18;
  NSNumber *v19;
  void *v20;
  const char *v21;
  char v22;
  uint64_t v24;
  MTRSetupPayload *v25;
  int v26;
  const char *v27;
  int v28;
  char v29;
  _QWORD v30[4];
  MTRSetupPayload *v31;
  NSNumber *v32;
  MTRDeviceController *v33;
  _BYTE *v34;
  NSError **v35;
  _BYTE buf[24];
  __n128 (*v37)(__n128 *, __n128 *);
  uint64_t (*v38)();
  const char *v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = payload;
  v9 = newNodeID;
  sub_234117B80(0, "NotSpecified");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend_unsignedLongLongValue(v9, v11, v12);
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_DEFAULT, "Setting up commissioning session for device ID 0x%016llX with setup payload %@", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    v24 = objc_msgSend_unsignedLongLongValue(v9, v13, v14);
    v25 = v8;
    sub_2341147D0(0, 2);
  }
  objc_msgSend_sharedInstance(MTRMetricsCollector, v13, v14, v24, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetMetrics(v15, v16, v17);

  *(_DWORD *)buf = 0;
  *(_QWORD *)&buf[8] = "dwnfw_device_commissioning";
  buf[20] = 0;
  sub_2341C4BEC((uint64_t)buf);
  sub_233D4BF64(v8);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x4812000000;
  v37 = sub_233D4C02C;
  v38 = nullsub_53;
  v39 = "";
  v40 = xmmword_2504F4670;
  v41 = 676;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_233D4C044;
  v30[3] = &unk_2504F4690;
  v34 = buf;
  v18 = v8;
  v31 = v18;
  v35 = error;
  v19 = v9;
  v32 = v19;
  v33 = self;
  v20 = (void *)MEMORY[0x23493EEA8](v30);
  v22 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v21, (uint64_t)v20, error);
  if ((v22 & 1) == 0)
  {
    v26 = 1;
    v27 = "dwnfw_device_commissioning";
    v28 = *(_DWORD *)(*(_QWORD *)&buf[8] + 48);
    v29 = 3;
    sub_2341C4BEC((uint64_t)&v26);
  }

  _Block_object_dispose(buf, 8);
  return v22;
}

- (BOOL)setupCommissioningSessionWithDiscoveredDevice:(MTRCommissionableBrowserResult *)discoveredDevice payload:(MTRSetupPayload *)payload newNodeID:(NSNumber *)newNodeID error:(NSError *)error
{
  MTRCommissionableBrowserResult *v10;
  MTRSetupPayload *v11;
  NSNumber *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSNumber *v21;
  MTRCommissionableBrowserResult *v22;
  MTRSetupPayload *v23;
  void *v24;
  const char *v25;
  char v26;
  MTRDeviceController *v28;
  MTRCommissionableBrowserResult *v29;
  uint64_t v30;
  MTRSetupPayload *v31;
  int v32;
  const char *v33;
  int v34;
  char v35;
  _QWORD v36[4];
  NSNumber *v37;
  MTRDeviceController *v38;
  MTRCommissionableBrowserResult *v39;
  MTRSetupPayload *v40;
  _BYTE *v41;
  NSError **v42;
  _BYTE buf[24];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v10 = discoveredDevice;
  v11 = payload;
  v12 = newNodeID;
  sub_234117B80(0, "NotSpecified");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    v44 = objc_msgSend_unsignedLongLongValue(v12, v14, v15);
    LOWORD(v45) = 2112;
    *(_QWORD *)((char *)&v45 + 2) = v11;
    _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_DEFAULT, "%@ Setting up commissioning session for already-discovered device %@ and device ID 0x%016llX with setup payload %@", buf, 0x2Au);
  }

  if (sub_234114844(2u))
  {
    v30 = objc_msgSend_unsignedLongLongValue(v12, v16, v17);
    v31 = v11;
    v28 = self;
    v29 = v10;
    sub_2341147D0(0, 2);
  }
  objc_msgSend_sharedInstance(MTRMetricsCollector, v16, v17, v28, v29, v30, v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetMetrics(v18, v19, v20);

  *(_DWORD *)buf = 0;
  *(_QWORD *)&buf[8] = "dwnfw_device_commissioning";
  buf[20] = 0;
  sub_2341C4BEC((uint64_t)buf);
  sub_233D4BF64(v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x4812000000;
  v44 = (uint64_t)sub_233D4C02C;
  *(_QWORD *)&v45 = nullsub_53;
  v46 = xmmword_2504F46B0;
  *((_QWORD *)&v45 + 1) = "";
  v47 = 729;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = sub_233D4C5EC;
  v36[3] = &unk_2504F46D0;
  v41 = buf;
  v21 = v12;
  v37 = v21;
  v38 = self;
  v22 = v10;
  v39 = v22;
  v23 = v11;
  v40 = v23;
  v42 = error;
  v24 = (void *)MEMORY[0x23493EEA8](v36);
  v26 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v25, (uint64_t)v24, error);
  if ((v26 & 1) == 0)
  {
    v32 = 1;
    v33 = "dwnfw_device_commissioning";
    v34 = *(_DWORD *)(*(_QWORD *)&buf[8] + 48);
    v35 = 3;
    sub_2341C4BEC((uint64_t)&v32);
  }

  _Block_object_dispose(buf, 8);
  return v26;
}

- (BOOL)commissionNodeWithID:(NSNumber *)nodeID commissioningParams:(MTRCommissioningParameters *)commissioningParams error:(NSError *)error
{
  NSNumber *v8;
  MTRCommissioningParameters *v9;
  NSNumber *v10;
  MTRCommissioningParameters *v11;
  void *v12;
  const char *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, const char *, uint64_t);
  void *v18;
  MTRCommissioningParameters *v19;
  MTRDeviceController *v20;
  NSNumber *v21;
  NSError **v22;

  v8 = nodeID;
  v9 = commissioningParams;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = sub_233D4CC48;
  v18 = &unk_2504F46F8;
  v19 = v9;
  v20 = self;
  v21 = v8;
  v22 = error;
  v10 = v8;
  v11 = v9;
  v12 = (void *)MEMORY[0x23493EEA8](&v15);
  LOBYTE(error) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v13, (uint64_t)v12, error, v15, v16, v17, v18);

  return (char)error;
}

- (BOOL)continueCommissioningDevice:(void *)opaqueDeviceHandle ignoreAttestationFailure:(BOOL)ignoreAttestationFailure error:(NSError *)error
{
  NSError **v5;
  void *v7;
  const char *v8;
  _QWORD v10[7];
  BOOL v11;

  v5 = error;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_233D4D678;
  v10[3] = &unk_2504F4720;
  v10[4] = self;
  v10[5] = opaqueDeviceHandle;
  v11 = ignoreAttestationFailure;
  v10[6] = error;
  v7 = (void *)MEMORY[0x23493EEA8](v10, a2);
  LOBYTE(v5) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v8, (uint64_t)v7, v5);

  return (char)v5;
}

- (BOOL)cancelCommissioningForNodeID:(NSNumber *)nodeID error:(NSError *)error
{
  NSNumber *v6;
  NSNumber *v7;
  void *v8;
  const char *v9;
  _QWORD v11[5];
  NSNumber *v12;
  NSError **v13;

  v6 = nodeID;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_233D4D7EC;
  v11[3] = &unk_2504F4748;
  v11[4] = self;
  v12 = v6;
  v13 = error;
  v7 = v6;
  v8 = (void *)MEMORY[0x23493EEA8](v11);
  LOBYTE(error) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v9, (uint64_t)v8, error);

  return (char)error;
}

- (BOOL)startBrowseForCommissionables:(id)delegate queue:(dispatch_queue_t)queue
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  const char *v11;
  _QWORD v13[5];
  id v14;
  NSObject *v15;

  v6 = delegate;
  v7 = queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_233D4D984;
  v13[3] = &unk_2504F4770;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x23493EEA8](v13);
  LOBYTE(self) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v11, (uint64_t)v10, 0);

  return (char)self;
}

- (BOOL)stopBrowseForCommissionables
{
  MTRDeviceController *v2;
  void *v3;
  const char *v4;
  _QWORD v6[5];

  v2 = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_233D4DAF8;
  v6[3] = &unk_2504F4798;
  v6[4] = self;
  v3 = (void *)MEMORY[0x23493EEA8](v6, a2);
  LOBYTE(v2) = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(v2, v4, (uint64_t)v3, 0);

  return (char)v2;
}

- (void)preWarmCommissioningSession
{
  ((void (*)(MTRDeviceControllerFactory *, char *))MEMORY[0x24BEDD108])(self->_factory, sel_preWarmCommissioningSession);
}

- (MTRBaseDevice)deviceBeingCommissionedWithNodeID:(NSNumber *)nodeID error:(NSError *)error
{
  NSNumber *v6;
  NSNumber *v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSError *v15;
  const char *v16;
  uint64_t v17;
  _QWORD v19[5];
  NSNumber *v20;
  NSError **v21;
  uint8_t buf[4];
  MTRDeviceController *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSError *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = nodeID;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_233D4DDC4;
  v19[3] = &unk_2504F47C0;
  v19[4] = self;
  v7 = v6;
  v20 = v7;
  v21 = error;
  v8 = (void *)MEMORY[0x23493EEA8](v19);
  objc_msgSend_syncRunOnWorkQueueWithReturnValue_error_(self, v9, (uint64_t)v8, error);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_234117B80(0, "NotSpecified");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend_unsignedLongLongValue(v7, v12, v13);
    if (error)
      v15 = *error;
    else
      v15 = 0;
    *(_DWORD *)buf = 138413058;
    v23 = self;
    v24 = 2048;
    v25 = v14;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_DEFAULT, "%@ Getting device being commissioned with node ID 0x%016llX: %@ (error: %@)", buf, 0x2Au);
  }

  if (sub_234114844(2u))
  {
    objc_msgSend_unsignedLongLongValue(v7, v16, v17);
    sub_2341147D0(0, 2);
  }

  return (MTRBaseDevice *)v10;
}

- (id)baseDeviceForNodeID:(id)a3
{
  id v4;
  MTRBaseDevice *v5;
  const char *v6;
  void *v7;

  v4 = a3;
  v5 = [MTRBaseDevice alloc];
  v7 = (void *)objc_msgSend_initWithNodeID_controller_(v5, v6, (uint64_t)v4, self);

  return v7;
}

- (id)_setupDeviceForNodeID:(id)a3 prefetchedClusterData:(id)a4
{
  id v6;
  id v7;
  MTRDevice *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  MTRDeviceControllerDataStore *controllerDataStore;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  MTRDeviceControllerDataStore *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  MTRDeviceController *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  MTRDeviceController *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_deviceMapLock);
  v8 = [MTRDevice alloc];
  v10 = (void *)objc_msgSend_initWithNodeID_controller_(v8, v9, (uint64_t)v6, self);
  if (objc_msgSend_isRunning(self, v11, v12))
    objc_msgSend_setObject_forKey_(self->_nodeIDToDeviceMap, v13, (uint64_t)v10, v6);
  if (v7)
  {
    if (objc_msgSend_count(v7, v13, v14))
      objc_msgSend_setPersistedClusterData_(v10, v13, (uint64_t)v7);
  }
  else
  {
    controllerDataStore = self->_controllerDataStore;
    if (controllerDataStore)
    {
      objc_msgSend_getStoredClusterDataForNodeID_(controllerDataStore, v13, (uint64_t)v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_234117B80(0, "NotSpecified");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v33 = self;
        v34 = 2048;
        v35 = objc_msgSend_count(v16, v18, v19);
        v36 = 2112;
        v37 = v10;
        _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_DEFAULT, "%@ Loaded %lu cluster data from storage for %@", buf, 0x20u);
      }

      if (sub_234114844(2u))
      {
        v30 = objc_msgSend_count(v16, v20, v21);
        v31 = v10;
        v29 = self;
        sub_2341147D0(0, 2);
      }
      if (objc_msgSend_count(v16, v20, v21, v29, v30, v31))
        objc_msgSend_setPersistedClusterData_(v10, v22, (uint64_t)v16);

    }
  }
  v23 = self->_controllerDataStore;
  if (v23)
  {
    objc_msgSend_getStoredDeviceDataForNodeID_(v23, v13, (uint64_t)v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v24, v25, v26))
      objc_msgSend_setPersistedDeviceData_(v10, v27, (uint64_t)v24);

  }
  objc_msgSend_setStorageBehaviorConfiguration_(v10, v13, (uint64_t)self->_storageBehaviorConfiguration);

  return v10;
}

- (id)deviceForNodeID:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  void *v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_deviceMapLock);
  objc_msgSend_objectForKey_(self->_nodeIDToDeviceMap, v5, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend__setupDeviceForNodeID_prefetchedClusterData_(self, v6, (uint64_t)v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(&self->_deviceMapLock);

  return v7;
}

- (void)removeDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint8_t buf[4];
  MTRDeviceController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_deviceMapLock);
  objc_msgSend_nodeID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_nodeIDToDeviceMap, v8, (uint64_t)v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v4)
  {
    objc_msgSend_invalidate(v4, v9, v10);
    objc_msgSend_removeObjectForKey_(self->_nodeIDToDeviceMap, v17, (uint64_t)v7);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = self;
      v20 = 2048;
      v21 = v4;
      v22 = 2048;
      v23 = objc_msgSend_unsignedLongLongValue(v7, v13, v14);
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_ERROR, "%@ Error: Cannot remove device %p with nodeID %llu", buf, 0x20u);
    }

    if (sub_234114844(1u))
    {
      objc_msgSend_unsignedLongLongValue(v7, v15, v16);
      sub_2341147D0(0, 1);
    }
  }

  os_unfair_lock_unlock(&self->_deviceMapLock);
}

- (void)setDeviceControllerDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  _QWORD v11[5];
  id v12;
  NSObject *v13;

  v6 = delegate;
  v7 = queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_233D4E458;
  v11[3] = &unk_2504F47E8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(self, v10, (uint64_t)v11, 0);

}

- (BOOL)setOperationalCertificateIssuer:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  const char *v11;
  _QWORD v13[4];
  id v14;
  MTRDeviceController *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if ((!v6 || v7) && (v6 || !v7))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_233D4E578;
    v13[3] = &unk_2504F4770;
    v14 = v6;
    v15 = self;
    v16 = v8;
    v10 = (void *)MEMORY[0x23493EEA8](v13);
    v9 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v11, (uint64_t)v10, 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (NSData)computePASEVerifierForSetupPasscode:(NSNumber *)setupPasscode iterations:(NSNumber *)iterations salt:(NSData *)salt error:(NSError *)error
{
  NSNumber *v9;
  NSNumber *v10;
  NSData *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSData *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v30[2];
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 *v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39[2];
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  char v43;
  _BYTE v44[97];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v9 = setupPasscode;
  v10 = iterations;
  v11 = salt;
  v40 = 0uLL;
  v41 = 0;
  v14 = objc_msgSend_unsignedIntValue(v10, v12, v13);
  v15 = objc_retainAutorelease(v11);
  v18 = objc_msgSend_bytes(v15, v16, v17);
  v21 = objc_msgSend_length(v15, v19, v20);
  sub_233BF7114(&v42, v18, v21);

  v33 = v42;
  v24 = objc_msgSend_unsignedIntValue(v9, v22, v23);
  sub_234133AF4((uint64_t)v44, v14, (uint64_t *)&v33, v24, &v40);
  v39[0] = (uint64_t)"dwnfw_pase_verifier_for_code";
  v39[1] = (uint64_t)&v40;
  LODWORD(v42) = 0;
  *((_QWORD *)&v42 + 1) = "dwnfw_pase_verifier_for_code";
  v43 = 0;
  sub_2341C4BEC((uint64_t)&v42);
  v37 = v40;
  v38 = v41;
  if ((objc_msgSend_checkForError_logMsg_error_(MTRDeviceController, v25, (uint64_t)&v37, CFSTR("PASE verifier generation failed"), error) & 1) != 0|| (v35 = &v42, v36 = 97, sub_234133A00((uint64_t)v44, &v35, (uint64_t)&v33), v40 = v33, v41 = v34, v31 = v33, v32 = v34, (objc_msgSend_checkForError_logMsg_error_(MTRDeviceController, v26, (uint64_t)&v31, CFSTR("PASE verifier serialization failed"), error) & 1) != 0))
  {
    v27 = 0;
  }
  else
  {
    sub_233BF7114(v30, (uint64_t)v35, v36);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v28, v30[0], v30[1]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_233D53F40(v39);

  return (NSData *)v27;
}

- (NSData)attestationChallengeForDeviceID:(NSNumber *)deviceID
{
  NSNumber *v4;
  NSNumber *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  MTRDeviceController *v14;
  NSNumber *v15;

  v4 = deviceID;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = sub_233D4E920;
  v13 = &unk_2504F4828;
  v14 = self;
  v15 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x23493EEA8](&v10);
  objc_msgSend_syncRunOnWorkQueueWithReturnValue_error_(self, v7, (uint64_t)v6, 0, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (BOOL)addServerEndpoint:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  BOOL v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  MTRDeviceController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend_checkIsRunning(self, v5, v6) & 1) == 0 || !sub_233C09E8C((uint64_t)self->_factory, v4))
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend_associateWithController_(v4, v7, (uint64_t)self) & 1) == 0)
  {
    sub_234117B80(0, "NotSpecified");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to associate MTRServerEndpoint with MTRDeviceController", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    sub_233C0A510((uint64_t)self->_factory, v4);
    goto LABEL_10;
  }
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_233D4EC9C;
  v15[3] = &unk_2504EE768;
  v15[4] = self;
  v16 = v4;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = sub_233D4EE1C;
  v13[3] = &unk_2504F4850;
  v13[4] = self;
  v14 = v16;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(self, v9, (uint64_t)v15, v13);

  v10 = 1;
LABEL_11:

  return v10;
}

- (void)removeServerEndpoint:(id)a3 queue:(id)a4 completion:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_removeServerEndpointInternal_queue_completion_, a3);
}

- (void)removeServerEndpoint:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_removeServerEndpointInternal_queue_completion_, a3);
}

- (void)removeServerEndpointInternal:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend_checkIsRunning(self, v11, v12) & 1) != 0)
  {
    v13 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_233D4F110;
    v19[3] = &unk_2504F4878;
    v19[4] = self;
    v20 = v8;
    v21 = v9;
    v22 = v10;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = sub_233D4F29C;
    v15[3] = &unk_2504F0830;
    v15[4] = self;
    v16 = v20;
    v17 = v21;
    v18 = v22;
    objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(self, v14, (uint64_t)v19, v15);

  }
}

- (void)removeServerEndpointOnMatterQueue:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController.mm", 1208);
  objc_msgSend_unregisterMatterEndpoint(v9, v4, v5);
  objc_msgSend_removeObject_(self->_serverEndpoints, v6, (uint64_t)v9);
  objc_msgSend_invalidate(v9, v7, v8);
  sub_233C0A510((uint64_t)self->_factory, v9);

}

- (BOOL)checkForInitError:(BOOL)a3 logMsg:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  MTRDeviceController *v11;
  id v12;
  uint8_t buf[4];
  MTRDeviceController *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!a3)
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "%@ Error: %@", buf, 0x16u);
    }

    if (sub_234114844(1u))
    {
      v11 = self;
      v12 = v6;
      sub_2341147D0(0, 1);
    }
    objc_msgSend_cleanup(self, v8, v9, v11, v12);
  }

  return !a3;
}

- (void)clearDeviceAttestationDelegateBridge
{
  void *deviceAttestationDelegateBridge;

  deviceAttestationDelegateBridge = self->_deviceAttestationDelegateBridge;
  if (deviceAttestationDelegateBridge)
  {
    (*(void (**)(void *, SEL))(*(_QWORD *)deviceAttestationDelegateBridge + 8))(deviceAttestationDelegateBridge, a2);
    self->_deviceAttestationDelegateBridge = 0;
  }
}

- (BOOL)checkForStartError:(ChipError *)a3 logMsg:(id)a4
{
  id v6;
  unsigned int mError;
  NSObject *v8;
  char *v9;
  __int128 v11;
  uint64_t v12;
  _BYTE buf[24];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  mError = a3->mError;
  if (a3->mError)
  {
    sub_234117B80(0, "NotSpecified");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_OWORD *)&a3->mError;
      v12 = *(_QWORD *)&a3->mLine;
      v9 = sub_2341083CC((const char **)&v11, 1);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      v14 = v6;
      _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_ERROR, "Error(%s): %@ %@", buf, 0x20u);
    }

    if (sub_234114844(1u))
    {
      *(_OWORD *)buf = *(_OWORD *)&a3->mError;
      *(_QWORD *)&buf[16] = *(_QWORD *)&a3->mLine;
      sub_2341083CC((const char **)buf, 1);
      sub_2341147D0(0, 1);
    }
  }

  return mError != 0;
}

+ (BOOL)checkForError:(ChipError *)a3 logMsg:(id)a4 error:(id *)a5
{
  id v8;
  unsigned int mError;
  NSObject *v10;
  char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  _BYTE buf[24];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  mError = a3->mError;
  if (a3->mError)
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_OWORD *)&a3->mError;
      v23 = *(_QWORD *)&a3->mLine;
      v11 = sub_2341083CC((const char **)&v22, 1);
      v12 = objc_retainAutorelease(v8);
      v15 = objc_msgSend_UTF8String(v12, v13, v14);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2080;
      v25 = v15;
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "Error(%s): %@ %s", buf, 0x20u);
    }

    if (sub_234114844(1u))
    {
      *(_OWORD *)buf = *(_OWORD *)&a3->mError;
      *(_QWORD *)&buf[16] = *(_QWORD *)&a3->mLine;
      sub_2341083CC((const char **)buf, 1);
      v16 = objc_retainAutorelease(v8);
      objc_msgSend_UTF8String(v16, v17, v18);
      sub_2341147D0(0, 1);
    }
    if (a5)
    {
      v20 = *(_OWORD *)&a3->mError;
      v21 = *(_QWORD *)&a3->mLine;
      sub_2340017F0((uint64_t)MTRError, &v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return mError != 0;
}

- (BOOL)checkIsRunning
{
  return objc_msgSend_checkIsRunning_(self, a2, 0);
}

- (BOOL)checkIsRunning:(id *)a3
{
  char isRunning;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __int128 v12;
  int v13;
  uint8_t buf[4];
  MTRDeviceController *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  isRunning = objc_msgSend_isRunning(self, a2, (uint64_t)a3);
  if ((isRunning & 1) == 0)
  {
    sub_234117B80(0, "NotSpecified");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2080;
      v17 = objc_msgSend_UTF8String(CFSTR("Controller is not running. Call startup first."), v7, v8);
      _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "MTRDeviceController: %@ Error: %s", buf, 0x16u);
    }

    if (sub_234114844(1u))
    {
      objc_msgSend_UTF8String(CFSTR("Controller is not running. Call startup first."), v9, v10);
      sub_2341147D0(0, 1);
    }
    if (a3)
    {
      LODWORD(v12) = 3;
      *((_QWORD *)&v12 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController.mm";
      v13 = 1276;
      sub_2340017F0((uint64_t)MTRError, &v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return isRunning;
}

- (void)getSessionForNode:(unint64_t)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  MTRAsyncWorkItem *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, void *);
  void *v23;
  MTRDeviceController *v24;
  id v25;
  unint64_t v26;

  v6 = a4;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceForNodeID_(self, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_deviceUsesThread(v10, v11, v12))
  {
    v14 = [MTRAsyncWorkItem alloc];
    dispatch_get_global_queue(21, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend_initWithQueue_(v14, v16, (uint64_t)v15);

    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = sub_233D4FC18;
    v23 = &unk_2504F48C8;
    v24 = self;
    v25 = v6;
    v26 = a3;
    objc_msgSend_setReadyHandler_(v17, v18, (uint64_t)&v20);
    objc_msgSend_enqueueWorkItem_descriptionWithFormat_(self->_concurrentSubscriptionPool, v19, (uint64_t)v17, CFSTR("device controller getSessionForNode nodeID: 0x%016llX"), a3, v20, v21, v22, v23);

  }
  else
  {
    objc_msgSend_directlyGetSessionForNode_completion_(self, v13, a3, v6);
  }

}

- (void)directlyGetSessionForNode:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_233D4FE58;
  v12[3] = &unk_2504F48F0;
  v13 = v6;
  v14 = a3;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = sub_233D4FEF8;
  v10[3] = &unk_2504F4918;
  v11 = v13;
  v8 = v13;
  objc_msgSend_asyncGetCommissionerOnMatterQueue_errorHandler_(self, v9, (uint64_t)v12, v10);

}

- (void)getSessionForCommissioneeDevice:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_233D50070;
  v12[3] = &unk_2504F48F0;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = sub_233D502B0;
  v10[3] = &unk_2504F4918;
  v11 = v13;
  v8 = v13;
  objc_msgSend_asyncGetCommissionerOnMatterQueue_errorHandler_(self, v9, (uint64_t)v12, v10);

}

- (unsigned)sessionTransportTypeForDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *chipWorkQueue;
  unsigned __int8 v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  if ((objc_msgSend_checkIsRunning(self, v5, v6) & 1) != 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233D50424;
    block[3] = &unk_2504F4600;
    block[4] = self;
    v11 = v4;
    v12 = &v13;
    dispatch_sync(chipWorkQueue, block);
    v8 = *((_BYTE *)v14 + 24);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)asyncGetCommissionerOnMatterQueue:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *chipWorkQueue;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v9 = objc_msgSend_checkIsRunning_(self, v8, (uint64_t)&v16);
  v10 = v16;
  v11 = v10;
  if ((v9 & 1) != 0)
  {

    chipWorkQueue = self->_chipWorkQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_233D50664;
    v13[3] = &unk_2504F4940;
    v13[4] = self;
    v14 = v7;
    v15 = v6;
    dispatch_async(chipWorkQueue, v13);

  }
  else
  {
    if (v7)
      (*((void (**)(id, id))v7 + 2))(v7, v10);

  }
}

- (void)asyncDispatchToMatterQueue:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_233D507B4;
  v11[3] = &unk_2504F4968;
  v12 = v6;
  v7 = v6;
  v8 = a4;
  v9 = (void *)MEMORY[0x23493EEA8](v11);
  objc_msgSend_asyncGetCommissionerOnMatterQueue_errorHandler_(self, v10, (uint64_t)v9, v8);

}

- (void)syncRunOnWorkQueue:(id)a3 error:(id *)a4
{
  const char *v6;
  NSObject *chipWorkQueue;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (qword_254253100 != -1)
    dispatch_once_f(&qword_254253100, &byte_2542530C0, (dispatch_function_t)sub_233C0BA78);
  if (sub_2341BE748(&byte_2542530C0))
  {
    sub_234117B80(0x1Bu, "Support");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController.mm";
      v15 = 1024;
      v16 = 1403;
      v17 = 2080;
      v18 = "!chip::DeviceLayer::PlatformMgrImpl().IsWorkQueueCurrentQueue()";
      _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0x1Bu, 1);
    abort();
  }
  if (objc_msgSend_checkIsRunning_(self, v6, (uint64_t)a4))
  {
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233D509B4;
    block[3] = &unk_2504F4990;
    block[4] = self;
    v12 = a4;
    v11 = v9;
    dispatch_sync(chipWorkQueue, block);

  }
}

- (id)syncRunOnWorkQueueWithReturnValue:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_233D50B10;
  v22 = sub_233D50B20;
  v23 = 0;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = sub_233D50B28;
  v15 = &unk_2504F49B8;
  v16 = v6;
  v17 = &v18;
  v7 = v6;
  v8 = (void *)MEMORY[0x23493EEA8](&v12);
  objc_msgSend_syncRunOnWorkQueue_error_(self, v9, (uint64_t)v8, a4, v12, v13, v14, v15);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (BOOL)syncRunOnWorkQueueWithBoolReturnValue:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = sub_233D50C54;
  v14 = &unk_2504F49B8;
  v15 = v6;
  v16 = &v17;
  v7 = v6;
  v8 = (void *)MEMORY[0x23493EEA8](&v11);
  objc_msgSend_syncRunOnWorkQueue_error_(self, v9, (uint64_t)v8, a4, v11, v12, v13, v14);
  LOBYTE(a4) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)a4;
}

- (unsigned)fabricIndex
{
  return atomic_load(&self->_storedFabricIndex.__a_.__a_value);
}

- (NSNumber)compressedFabricID
{
  void *cppCommissioner;
  void *v4;
  uint64_t v5;
  const char *v6;

  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController.mm", 1442);
  cppCommissioner = self->_cppCommissioner;
  if (cppCommissioner)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = sub_233D53F10((uint64_t)cppCommissioner);
    if (v5)
      objc_msgSend_numberWithUnsignedLongLong_(v4, v6, *(_QWORD *)(v5 + 16));
    else
      objc_msgSend_numberWithUnsignedLongLong_(v4, v6, 0);
    cppCommissioner = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)cppCommissioner;
}

- (id)syncGetCompressedFabricID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_233D50D4C;
  v3[3] = &unk_2504F4650;
  v3[4] = self;
  objc_msgSend_syncRunOnWorkQueueWithReturnValue_error_(self, a2, (uint64_t)v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ChipError)isRunningOnFabric:(SEL)a3 fabricIndex:(void *)a4 isRunning:(unsigned __int8)a5
{
  int v7;
  const char *v11;
  uint64_t v12;
  ChipError *result;
  ChipError *v14;
  char *mFile;
  unsigned int v16;
  _QWORD v17[10];
  _QWORD v18[11];

  v7 = a5;
  v18[10] = *MEMORY[0x24BDAC8D0];
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController.mm", 1462);
  result = (ChipError *)objc_msgSend_isRunning(self, v11, v12);
  if ((result & 1) == 0)
  {
    *a6 = 0;
    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceController.mm";
    v16 = 1466;
LABEL_13:
    retstr->mLine = v16;
    return result;
  }
  result = (ChipError *)sub_2341E2E70((uint64_t)a4, v7);
  if (!result)
  {
    retstr->mError = 3;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceController.mm";
    v16 = 1472;
    goto LABEL_13;
  }
  v14 = result;
  result = (ChipError *)sub_233D53F10((uint64_t)self->_cppCommissioner);
  if (result)
    mFile = result->mFile;
  else
    mFile = 0;
  if (mFile != v14->mFile)
  {
    *a6 = 0;
    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDev"
                    "iceController.mm";
    v16 = 1477;
    goto LABEL_13;
  }
  v18[0] = &off_250505A50;
  v17[0] = &off_250505A50;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  *(_QWORD *)&retstr->mError = 0;
  sub_23423EB00((uint64_t)self->_cppCommissioner, (uint64_t)v18, (uint64_t)retstr);
  if (!retstr->mError)
  {
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_2341E34CC((uint64_t)a4, BYTE1(v14[5].mLine), (uint64_t)v17, (uint64_t)retstr);
    if (!retstr->mError)
    {
      result = (ChipError *)sub_233D50ED4((uint64_t)v18, (uint64_t)v17);
      *a6 = (char)result;
      retstr->mError = 0;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRD"
                      "eviceController.mm";
      v16 = 1485;
      goto LABEL_13;
    }
  }
  return result;
}

- (void)invalidateCASESessionForNode:(unint64_t)a3
{
  void *v4;
  const char *v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_233D51000;
  v6[3] = &unk_2504F49E0;
  v6[4] = self;
  v6[5] = a3;
  v4 = (void *)MEMORY[0x23493EEA8](v6, a2);
  objc_msgSend_syncRunOnWorkQueue_error_(self, v5, (uint64_t)v4, 0);

}

- (void)operationalInstanceAdded:(unint64_t)a3
{
  os_unfair_lock_s *p_deviceMapLock;
  NSMapTable *nodeIDToDeviceMap;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_deviceMapLock = &self->_deviceMapLock;
  os_unfair_lock_lock(&self->_deviceMapLock);
  nodeIDToDeviceMap = self->_nodeIDToDeviceMap;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(nodeIDToDeviceMap, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_deviceMapLock);
  if (v10)
  {
    sub_234117B80(9u, "Controller");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v17 = HIDWORD(a3);
      v18 = 1024;
      v19 = a3;
      _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_DEFAULT, "Notifying device about node 0x%08X%08X advertising", buf, 0xEu);
    }

    if (sub_234114844(2u))
    {
      v14 = HIDWORD(a3);
      v15 = a3;
      sub_2341147D0(9u, 2);
    }
    objc_msgSend_nodeMayBeAdvertisingOperational(v10, v12, v13, v14, v15);
  }

}

- (void)downloadLogFromNodeWithID:(id)a3 type:(int64_t)a4 timeout:(double)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  int64_t v26;
  double v27;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_233D51318;
  v22[3] = &unk_2504F4A08;
  v22[4] = self;
  v23 = v12;
  v27 = a5;
  v26 = a4;
  v24 = v13;
  v25 = v14;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = sub_233D51334;
  v20[3] = &unk_2504F4918;
  v21 = v25;
  v16 = v25;
  v17 = v13;
  v18 = v12;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(self, v19, (uint64_t)v22, v20);

}

- (id)accessGrantsForClusterPath:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int isEqual;
  void *v20;
  const char *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController.mm", 1538);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_serverEndpoints;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    v11 = (void *)MEMORY[0x24BDBD1A8];
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend_endpoint(v4, v7, v8, (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_endpointID(v13, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v14, v18, (uint64_t)v17);

        if (isEqual)
        {
          objc_msgSend_cluster(v4, v7, v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_matterAccessGrantsForCluster_(v13, v21, (uint64_t)v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }
LABEL_12:

  return v11;
}

- (id)neededReadPrivilegeForClusterID:(id)a3 attributeID:(id)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  const char *v18;
  char isEqual;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  const char *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t Privilege;
  const char *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  NSMutableArray *obj;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v6 = a4;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceController.mm", 1552);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_serverEndpoints;
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v51, v57, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v52 != v37)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend_serverClusters(v10, v8, v9);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v11, (uint64_t)&v47, v56, 16);
        if (v14)
        {
          v40 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v48 != v40)
                objc_enumerationMutation(v41);
              v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
              objc_msgSend_clusterID(v16, v12, v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v17, v18, (uint64_t)v42);

              if ((isEqual & 1) != 0)
              {
                v45 = 0u;
                v46 = 0u;
                v43 = 0u;
                v44 = 0u;
                objc_msgSend_attributes(v16, v12, v13);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v43, v55, 16);
                if (v24)
                {
                  v25 = *(_QWORD *)v44;
                  while (2)
                  {
                    for (k = 0; k != v24; ++k)
                    {
                      if (*(_QWORD *)v44 != v25)
                        objc_enumerationMutation(v20);
                      v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
                      objc_msgSend_attributeID(v27, v22, v23);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = objc_msgSend_isEqual_(v28, v29, (uint64_t)v6);

                      if ((v30 & 1) != 0)
                      {
                        v32 = (void *)MEMORY[0x24BDD16E0];
                        Privilege = objc_msgSend_requiredReadPrivilege(v27, v22, v23);
                        objc_msgSend_numberWithUnsignedChar_(v32, v34, Privilege);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();

                        goto LABEL_28;
                      }
                    }
                    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v43, v55, 16);
                    if (v24)
                      continue;
                    break;
                  }
                }

              }
            }
            v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v12, (uint64_t)&v47, v56, 16);
          }
          while (v14);
        }

      }
      v31 = 0;
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v51, v57, 16);
    }
    while (v36);
  }
  else
  {
    v31 = 0;
  }
LABEL_28:

  return v31;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (MTRDeviceControllerDataStore)controllerDataStore
{
  return self->_controllerDataStore;
}

- (MTROTAProviderDelegate)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (OS_dispatch_queue)otaProviderDelegateQueue
{
  return self->_otaProviderDelegateQueue;
}

- (MTRAsyncWorkQueue)concurrentSubscriptionPool
{
  return self->_concurrentSubscriptionPool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentSubscriptionPool, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_controllerDataStore, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_serverEndpoints, 0);
  objc_storeStrong((id *)&self->_commissionableBrowser, 0);
  objc_storeStrong((id *)&self->_nodeIDToDeviceMap, 0);
  objc_storeStrong((id *)&self->_factory, 0);

  sub_23413AE04((uint64_t)&self->_operationalKeypairBridge);
  sub_23413AE04((uint64_t)&self->_signingKeypairBridge);
  objc_storeStrong((id *)&self->_chipWorkQueue, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 664) = 0;
  *((_QWORD *)self + 8) = &unk_2504EE700;
  *((_QWORD *)self + 9) = &off_250505A50;
  *((_QWORD *)self + 84) = 0;
  *((_QWORD *)self + 85) = &off_250505A50;
  *((_QWORD *)self + 96) = &off_250505A50;
  *((_BYTE *)self + 1360) = 0;
  *((_QWORD *)self + 95) = &unk_2504EE700;
  *((_QWORD *)self + 171) = 0;
  *((_QWORD *)self + 172) = &off_250505A50;
  return self;
}

- (NSNumber)controllerNodeId
{
  return (NSNumber *)((uint64_t (*)(MTRDeviceController *, char *))MEMORY[0x24BEDD108])(self, sel_controllerNodeID);
}

- (NSData)fetchAttestationChallengeForDeviceId:(uint64_t)deviceId
{
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], a2, deviceId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attestationChallengeForDeviceID_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v6;
}

- (BOOL)getBaseDevice:(uint64_t)deviceID queue:(dispatch_queue_t)queue completionHandler:(MTRDeviceConnectionCallback)completionHandler
{
  NSObject *v8;
  MTRDeviceConnectionCallback v9;
  const char *v10;
  char v11;
  id v12;
  const char *v13;
  id *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[2];
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;

  v8 = queue;
  v9 = completionHandler;
  v24 = 0;
  v11 = objc_msgSend_checkIsRunning_(self, v10, (uint64_t)&v24);
  v12 = v24;
  if ((v11 & 1) != 0)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_233D5238C;
    v17[3] = &unk_2504F4A80;
    v20 = deviceID;
    v18[0] = v8;
    v18[1] = self;
    v19 = v9;
    objc_msgSend_getSessionForNode_completion_(self, v13, deviceID, v17);
    v14 = (id *)v18;
    v15 = v19;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233D52378;
    block[3] = &unk_2504F03B0;
    v14 = &v23;
    v23 = v9;
    v22 = v12;
    dispatch_async(v8, block);
    v15 = v22;
  }

  return v11;
}

- (BOOL)pairDevice:(uint64_t)deviceID discriminator:(uint16_t)discriminator setupPINCode:(uint32_t)setupPINCode error:(NSError *)error
{
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  char v16;
  int v18;
  const char *v19;
  int v20;
  char v21;
  _QWORD v22[8];
  uint32_t v23;
  uint16_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  __n128 (*v28)(__n128 *, __n128 *);
  uint64_t (*v29)();
  const char *v30;
  __int128 v31;
  uint64_t v32;

  objc_msgSend_sharedInstance(MTRMetricsCollector, a2, deviceID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetMetrics(v11, v12, v13);

  LODWORD(v25) = 0;
  v26 = "dwnfw_device_commissioning";
  BYTE4(v27) = 0;
  sub_2341C4BEC((uint64_t)&v25);
  v25 = 0;
  v26 = (const char *)&v25;
  v27 = 0x4812000000;
  v28 = sub_233D4C02C;
  v29 = nullsub_53;
  v30 = "";
  v31 = xmmword_2504F4AA0;
  v32 = 1758;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_233D52680;
  v22[3] = &unk_2504F4AC0;
  v24 = discriminator;
  v23 = setupPINCode;
  v22[4] = self;
  v22[5] = &v25;
  v22[6] = error;
  v22[7] = deviceID;
  v14 = (void *)MEMORY[0x23493EEA8](v22);
  v16 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v15, (uint64_t)v14, error);
  if ((v16 & 1) == 0)
  {
    v18 = 1;
    v19 = "dwnfw_device_commissioning";
    v20 = *((_DWORD *)v26 + 12);
    v21 = 3;
    sub_2341C4BEC((uint64_t)&v18);
  }

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (BOOL)pairDevice:(uint64_t)deviceID address:(NSString *)address port:(uint16_t)port setupPINCode:(uint32_t)setupPINCode error:(NSError *)error
{
  NSString *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  const char *v20;
  char v21;
  int v23;
  const char *v24;
  int v25;
  char v26;
  _QWORD v27[4];
  NSString *v28;
  MTRDeviceController *v29;
  uint64_t *v30;
  uint64_t v31;
  NSError **v32;
  uint32_t v33;
  uint16_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  __n128 (*v38)(__n128 *, __n128 *);
  uint64_t (*v39)();
  const char *v40;
  __int128 v41;
  uint64_t v42;

  v12 = address;
  objc_msgSend_sharedInstance(MTRMetricsCollector, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetMetrics(v15, v16, v17);

  LODWORD(v35) = 0;
  v36 = "dwnfw_device_commissioning";
  BYTE4(v37) = 0;
  sub_2341C4BEC((uint64_t)&v35);
  v35 = 0;
  v36 = (const char *)&v35;
  v37 = 0x4812000000;
  v38 = sub_233D4C02C;
  v39 = nullsub_53;
  v40 = "";
  v41 = xmmword_2504F4AE0;
  v42 = 1805;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_233D52B5C;
  v27[3] = &unk_2504F4B00;
  v30 = &v35;
  v18 = v12;
  v34 = port;
  v28 = v18;
  v29 = self;
  v33 = setupPINCode;
  v31 = deviceID;
  v32 = error;
  v19 = (void *)MEMORY[0x23493EEA8](v27);
  v21 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v20, (uint64_t)v19, error);
  if ((v21 & 1) == 0)
  {
    v23 = 1;
    v24 = "dwnfw_device_commissioning";
    v25 = *((_DWORD *)v36 + 12);
    v26 = 3;
    sub_2341C4BEC((uint64_t)&v23);
  }

  _Block_object_dispose(&v35, 8);
  return v21;
}

- (BOOL)pairDevice:(uint64_t)deviceID onboardingPayload:(NSString *)onboardingPayload error:(NSError *)error
{
  NSString *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  NSString *v16;
  void *v17;
  const char *v18;
  char v19;
  int v21;
  const char *v22;
  int v23;
  char v24;
  _QWORD v25[5];
  NSString *v26;
  uint64_t *v27;
  uint64_t v28;
  NSError **v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  __n128 (*v33)(__n128 *, __n128 *);
  uint64_t (*v34)();
  const char *v35;
  __int128 v36;
  uint64_t v37;

  v8 = onboardingPayload;
  objc_msgSend_sharedInstance(MTRMetricsCollector, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetMetrics(v11, v12, v13);

  LODWORD(v30) = 0;
  v31 = "dwnfw_device_commissioning";
  BYTE4(v32) = 0;
  sub_2341C4BEC((uint64_t)&v30);
  objc_msgSend_setupPayloadWithOnboardingPayload_error_(MTRSetupPayload, v14, (uint64_t)v8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_233D4BF64(v15);

  v30 = 0;
  v31 = (const char *)&v30;
  v32 = 0x4812000000;
  v33 = sub_233D4C02C;
  v34 = nullsub_53;
  v35 = "";
  v36 = xmmword_2504F4B20;
  v37 = 1847;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_233D52F3C;
  v25[3] = &unk_2504F4B40;
  v27 = &v30;
  v28 = deviceID;
  v25[4] = self;
  v16 = v8;
  v26 = v16;
  v29 = error;
  v17 = (void *)MEMORY[0x23493EEA8](v25);
  v19 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v18, (uint64_t)v17, error);
  if ((v19 & 1) == 0)
  {
    v21 = 1;
    v22 = "dwnfw_device_commissioning";
    v23 = *((_DWORD *)v31 + 12);
    v24 = 3;
    sub_2341C4BEC((uint64_t)&v21);
  }

  _Block_object_dispose(&v30, 8);
  return v19;
}

- (BOOL)commissionDevice:(uint64_t)deviceId commissioningParams:(MTRCommissioningParameters *)commissioningParams error:(NSError *)error
{
  MTRCommissioningParameters *v8;
  const char *v9;
  void *v10;
  const char *v11;

  v8 = commissioningParams;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v9, deviceId);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = objc_msgSend_commissionNodeWithID_commissioningParams_error_(self, v11, (uint64_t)v10, v8, error);

  return (char)error;
}

- (BOOL)stopDevicePairing:(uint64_t)deviceID error:(NSError *)error
{
  void *v6;
  const char *v7;

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], a2, deviceID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = objc_msgSend_cancelCommissioningForNodeID_error_(self, v7, (uint64_t)v6, error);

  return (char)error;
}

- (MTRBaseDevice)getDeviceBeingCommissioned:(uint64_t)deviceId error:(NSError *)error
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], a2, deviceId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceBeingCommissionedWithNodeID_error_(self, v7, (uint64_t)v6, error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRBaseDevice *)v8;
}

- (BOOL)openPairingWindow:(uint64_t)deviceID duration:(NSUInteger)duration error:(NSError *)error
{
  NSObject *v8;
  char v9;
  void *v10;
  const char *v11;
  _QWORD v13[8];
  __int128 v14;
  int v15;
  uint8_t buf[4];
  MTRDeviceController *v17;
  __int16 v18;
  NSUInteger v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (duration < 0x10000)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_233D53420;
    v13[3] = &unk_2504F4B80;
    v13[4] = self;
    v13[5] = deviceID;
    v13[6] = duration;
    v13[7] = error;
    v10 = (void *)MEMORY[0x23493EEA8](v13, a2);
    v9 = objc_msgSend_syncRunOnWorkQueueWithBoolReturnValue_error_(self, v11, (uint64_t)v10, error);

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2048;
      v19 = duration;
      v20 = 1024;
      v21 = 0xFFFF;
      _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_ERROR, "%@ Error: Duration %lu is too large. Max value %d", buf, 0x1Cu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    if (error)
    {
      LODWORD(v14) = 143;
      *((_QWORD *)&v14 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController.mm";
      v15 = 1895;
      sub_2340017F0((uint64_t)MTRError, &v14);
      v9 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (NSString)openPairingWindowWithPIN:(uint64_t)deviceID duration:(NSUInteger)duration discriminator:(NSUInteger)discriminator setupPIN:(NSUInteger)setupPIN error:(NSError *)error
{
  NSObject *v10;
  NSError *v11;
  NSObject *v13;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[11];
  __int128 v24;
  uint64_t v25;
  uint64_t v26[2];
  __int128 v27;
  int v28;
  __int128 v29;
  int v30;
  _BYTE buf[24];
  __n128 (*v32)(__n128 *, __n128 *);
  uint64_t (*v33)();
  const char *v34;
  __int128 v35;
  uint64_t v36;
  uint8_t v37[4];
  _BYTE v38[18];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (duration >= 0x10000)
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = duration;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v32) = 0xFFFF;
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "%@ Error: Duration %lu is too large. Max value %d", buf, 0x1Cu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    if (error)
    {
      LODWORD(v29) = 143;
      *((_QWORD *)&v29 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController.mm";
      v30 = 1921;
      sub_2340017F0((uint64_t)MTRError, &v29);
      v11 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      *error = v11;
      return (NSString *)0;
    }
    return (NSString *)0;
  }
  if (discriminator >= 0x1000)
  {
    sub_234117B80(0, "NotSpecified");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = discriminator;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v32) = 4095;
      _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_ERROR, "%@ Error: Discriminator %lu is too large. Max value %d", buf, 0x1Cu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    if (error)
    {
      LODWORD(v27) = 143;
      *((_QWORD *)&v27 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDeviceController.mm";
      v28 = 1929;
      sub_2340017F0((uint64_t)MTRError, &v27);
      v11 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    return (NSString *)0;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x4812000000;
  v32 = sub_233D4C02C;
  v33 = nullsub_53;
  v34 = "";
  v36 = 1934;
  v35 = xmmword_2504F4BA0;
  v26[0] = (uint64_t)"dwnfw_open_pairing_window";
  v26[1] = (uint64_t)&v35;
  *(_DWORD *)v37 = 0;
  *(_QWORD *)&v38[4] = "dwnfw_open_pairing_window";
  v38[16] = 0;
  sub_2341C4BEC((uint64_t)v37);
  if (HIDWORD(setupPIN) || !sub_2341C8690(setupPIN))
  {
    sub_234117B80(0, "NotSpecified");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v37 = 138412546;
      *(_QWORD *)v38 = self;
      *(_WORD *)&v38[8] = 2048;
      *(_QWORD *)&v38[10] = setupPIN;
      _os_log_impl(&dword_233BF3000, v20, OS_LOG_TYPE_ERROR, "%@ Error: Setup pin %lu is not valid", v37, 0x16u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v21 = *(_QWORD *)&buf[8];
    *(_DWORD *)(*(_QWORD *)&buf[8] + 48) = 143;
    v22 = v21 + 48;
    *(_QWORD *)(v22 + 8) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP"
                           "/MTRDeviceController.mm";
    *(_DWORD *)(v22 + 16) = 1939;
    if (error)
    {
      v24 = *(_OWORD *)v22;
      v25 = *(_QWORD *)(v22 + 16);
      sub_2340017F0((uint64_t)MTRError, &v24);
      v19 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_233D53980;
    v23[3] = &unk_2504F4BC0;
    v23[4] = self;
    v23[5] = buf;
    v23[6] = deviceID;
    v23[7] = duration;
    v23[8] = discriminator;
    v23[9] = setupPIN;
    v23[10] = error;
    v17 = (void *)MEMORY[0x23493EEA8](v23);
    objc_msgSend_syncRunOnWorkQueueWithReturnValue_error_(self, v18, (uint64_t)v17, error);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  sub_233D53F40(v26);
  _Block_object_dispose(buf, 8);
  return (NSString *)v19;
}

- (NSData)computePaseVerifier:(uint32_t)setupPincode iterations:(uint32_t)iterations salt:(NSData *)salt
{
  uint64_t v5;
  uint64_t v6;
  NSData *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v5 = *(_QWORD *)&iterations;
  v6 = *(_QWORD *)&setupPincode;
  v7 = salt;
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_computePASEVerifierForSetupPasscode_iterations_salt_error_(MTRDeviceController, v12, (uint64_t)v9, v11, v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v13;
}

- (void)setPairingDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  NSObject *v6;
  MTRDevicePairingDelegateShim *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = delegate;
  v6 = queue;
  v7 = [MTRDevicePairingDelegateShim alloc];
  v9 = (void *)objc_msgSend_initWithDelegate_(v7, v8, (uint64_t)v11);
  objc_msgSend_setDeviceControllerDelegate_queue_(self, v10, (uint64_t)v9, v6);

}

- (void)setNocChainIssuer:(id)nocChainIssuer queue:(dispatch_queue_t)queue
{
  NSObject *v6;
  MTROperationalCertificateChainIssuerShim *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = nocChainIssuer;
  v6 = queue;
  v7 = [MTROperationalCertificateChainIssuerShim alloc];
  v9 = (void *)objc_msgSend_initWithIssuer_(v7, v8, (uint64_t)v11);
  objc_msgSend_setOperationalCertificateIssuer_queue_(self, v10, (uint64_t)v9, v6);

}

+ (MTRDeviceController)sharedControllerWithID:(id)controllerID xpcConnectBlock:(MTRXPCConnectBlock)xpcConnectBlock
{
  objc_msgSend_sharedControllerWithID_xpcConnectBlock_(MTRDeviceControllerOverXPC, a2, (uint64_t)controllerID, xpcConnectBlock);
  return (MTRDeviceController *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSArray)encodeXPCResponseValues:(NSArray *)values
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t i;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  BOOL v38;
  const char *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  NSArray *v55;
  NSArray *obj;
  uint64_t v57;
  id v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v55 = values;
  if (!v55)
  {
    v58 = 0;
    goto LABEL_27;
  }
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v3, v4);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v55;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v60, v64, 16);
  if (!v6)
    goto LABEL_25;
  v57 = *(_QWORD *)v61;
  do
  {
    v59 = v6;
    for (i = 0; i != v59; ++i)
    {
      if (*(_QWORD *)v61 != v57)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
      if (!v9)
      {
LABEL_14:
        objc_msgSend_addObject_(v58, v7, (uint64_t)v9);
        continue;
      }
      objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v60 + 1) + 8 * i), v7, (uint64_t)CFSTR("attributePath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

      }
      else
      {
        objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)CFSTR("commandPath"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
          goto LABEL_14;
      }
      v15 = (void *)MEMORY[0x24BDBCED8];
      v16 = objc_msgSend_count(v9, v7, v12);
      objc_msgSend_dictionaryWithCapacity_(v15, v17, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addEntriesFromDictionary_(v18, v19, (uint64_t)v9);
      objc_msgSend_objectForKeyedSubscript_(v9, v20, (uint64_t)CFSTR("attributePath"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = v21 == 0;

      if ((v15 & 1) == 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v9, v22, (uint64_t)CFSTR("attributePath"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v26 = v23;
        if (v23)
        {
          objc_msgSend_endpoint(v23, v24, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v27;
          objc_msgSend_cluster(v26, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v30;
          objc_msgSend_attribute(v26, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v33;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v34, (uint64_t)&v65, 3);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v35 = 0;
        }

        objc_msgSend_setObject_forKeyedSubscript_(v18, v36, (uint64_t)v35, CFSTR("attributePath"));
      }
      objc_msgSend_objectForKeyedSubscript_(v9, v22, (uint64_t)CFSTR("commandPath"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 == 0;

      if (!v38)
      {
        objc_msgSend_objectForKeyedSubscript_(v9, v39, (uint64_t)CFSTR("commandPath"));
        v40 = (id)objc_claimAutoreleasedReturnValue();
        v43 = v40;
        if (v40)
        {
          objc_msgSend_endpoint(v40, v41, v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v44;
          objc_msgSend_cluster(v43, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v47;
          objc_msgSend_command(v43, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v50;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v51, (uint64_t)&v65, 3);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v52 = 0;
        }

        objc_msgSend_setObject_forKeyedSubscript_(v18, v53, (uint64_t)v52, CFSTR("commandPath"));
      }
      objc_msgSend_addObject_(v58, v39, (uint64_t)v18);

    }
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v60, v64, 16);
  }
  while (v6);
LABEL_25:

LABEL_27:
  return (NSArray *)v58;
}

+ (NSArray)decodeXPCResponseValues:(NSArray *)values
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t i;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  BOOL v37;
  const char *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  NSArray *v53;
  NSArray *obj;
  uint64_t v55;
  uint64_t v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v53 = values;
  if (!v53)
  {
    v57 = 0;
    goto LABEL_28;
  }
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v3, v4);
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v53;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v58, v62, 16);
  if (!v6)
    goto LABEL_26;
  v55 = *(_QWORD *)v59;
  do
  {
    v56 = v6;
    for (i = 0; i != v56; ++i)
    {
      if (*(_QWORD *)v59 != v55)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      if (!v9)
        goto LABEL_11;
      objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v58 + 1) + 8 * i), v7, (uint64_t)CFSTR("attributePath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

        goto LABEL_12;
      }
      objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)CFSTR("commandPath"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (v14)
LABEL_11:
        objc_msgSend_addObject_(v57, v7, (uint64_t)v9);
LABEL_12:
      v15 = (void *)MEMORY[0x24BDBCED8];
      v16 = objc_msgSend_count(v9, v7, v12);
      objc_msgSend_dictionaryWithCapacity_(v15, v17, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addEntriesFromDictionary_(v18, v19, (uint64_t)v9);
      objc_msgSend_objectForKeyedSubscript_(v9, v20, (uint64_t)CFSTR("attributePath"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = v21 == 0;

      if ((v15 & 1) == 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v9, v22, (uint64_t)CFSTR("attributePath"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v26 = v23;
        if (v23 && objc_msgSend_count(v23, v24, v25) == 3)
        {
          objc_msgSend_objectAtIndexedSubscript_(v26, v27, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v26, v29, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v26, v31, 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v33, (uint64_t)v28, v30, v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v34 = 0;
        }

        objc_msgSend_setObject_forKeyedSubscript_(v18, v35, (uint64_t)v34, CFSTR("attributePath"));
      }
      objc_msgSend_objectForKeyedSubscript_(v9, v22, (uint64_t)CFSTR("commandPath"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36 == 0;

      if (!v37)
      {
        objc_msgSend_objectForKeyedSubscript_(v9, v38, (uint64_t)CFSTR("commandPath"));
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v42 = v39;
        if (v39 && objc_msgSend_count(v39, v40, v41) == 3)
        {
          objc_msgSend_objectAtIndexedSubscript_(v42, v43, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v42, v45, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v42, v47, 2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_commandPathWithEndpointID_clusterID_commandID_(MTRCommandPath, v49, (uint64_t)v44, v46, v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v50 = 0;
        }

        objc_msgSend_setObject_forKeyedSubscript_(v18, v51, (uint64_t)v50, CFSTR("commandPath"));
      }
      objc_msgSend_addObject_(v57, v38, (uint64_t)v18);

    }
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v58, v62, 16);
  }
  while (v6);
LABEL_26:

LABEL_28:
  return (NSArray *)v57;
}

+ (NSDictionary)encodeXPCReadParams:(MTRReadParams *)params
{
  const char *v3;
  uint64_t v4;
  MTRReadParams *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t shouldFilterByFabric;
  const char *v11;
  void *v12;
  const char *v13;

  v5 = params;
  if (v5)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(v5, v8, v9);
    objc_msgSend_numberWithBool_(v7, v11, shouldFilterByFabric);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v13, (uint64_t)v12, CFSTR("fabricFiltered"));

  }
  else
  {
    v6 = 0;
  }

  return (NSDictionary *)v6;
}

+ (MTRReadParams)decodeXPCReadParams:(NSDictionary *)params
{
  NSDictionary *v3;
  MTRReadParams *v4;

  v3 = params;
  if (v3)
  {
    v4 = objc_alloc_init(MTRReadParams);
    sub_234033C3C(v3, v4);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (NSDictionary)encodeXPCSubscribeParams:(MTRSubscribeParams *)params
{
  const char *v3;
  MTRSubscribeParams *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int shouldReplaceExistingSubscriptions;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t shouldResubscribeAutomatically;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;

  v4 = params;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend_encodeXPCReadParams_(MTRDeviceController, v3, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithDictionary_(v5, v7, (uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD16E0];
    shouldReplaceExistingSubscriptions = objc_msgSend_shouldReplaceExistingSubscriptions(v4, v10, v11);
    objc_msgSend_numberWithBool_(v9, v13, shouldReplaceExistingSubscriptions ^ 1u);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v15, (uint64_t)v14, CFSTR("keepPreviousSubscriptions"));

    v16 = (void *)MEMORY[0x24BDD16E0];
    shouldResubscribeAutomatically = objc_msgSend_shouldResubscribeAutomatically(v4, v17, v18);
    objc_msgSend_numberWithBool_(v16, v20, shouldResubscribeAutomatically);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v22, (uint64_t)v21, CFSTR("autoResubscribe"));

    objc_msgSend_minInterval(v4, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v26, (uint64_t)v25, CFSTR("minInterval"));

    objc_msgSend_maxInterval(v4, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v30, (uint64_t)v29, CFSTR("maxInterval"));

  }
  else
  {
    v8 = 0;
  }

  return (NSDictionary *)v8;
}

+ (MTRSubscribeParams)decodeXPCSubscribeParams:(NSDictionary *)params
{
  NSDictionary *v3;
  MTRSubscribeParams *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;

  v3 = params;
  if (v3)
  {
    v4 = [MTRSubscribeParams alloc];
    objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)CFSTR("minInterval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v7, (uint64_t)CFSTR("maxInterval"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v4, v9, (uint64_t)v6, v8);

    sub_234033C3C(v3, v10);
    objc_msgSend_objectForKeyedSubscript_(v3, v11, (uint64_t)CFSTR("keepPreviousSubscriptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    if (v12)
    {
      v16 = objc_msgSend_BOOLValue(v12, v13, v14) ^ 1;
      objc_msgSend_setReplaceExistingSubscriptions_(v10, v17, v16);
    }
    else
    {
      objc_msgSend_setReplaceExistingSubscriptions_(v10, v13, 1);
    }
    objc_msgSend_objectForKeyedSubscript_(v3, v18, (uint64_t)CFSTR("autoResubscribe"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    if (v19)
    {
      v23 = objc_msgSend_BOOLValue(v19, v20, v21);
      objc_msgSend_setResubscribeAutomatically_(v10, v24, v23);
    }
    else
    {
      objc_msgSend_setResubscribeAutomatically_(v10, v20, 1);
    }

  }
  else
  {
    v10 = 0;
  }

  return (MTRSubscribeParams *)v10;
}

+ (NSXPCInterface)xpcInterfaceForServerProtocol
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], a2, (uint64_t)&unk_2562170D0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_234034104();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v4, (uint64_t)v3, sel_readAttributeWithController_nodeId_endpointId_clusterId_attributeId_params_completion_, 0, 1);

  sub_234034104();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v6, (uint64_t)v5, sel_writeAttributeWithController_nodeId_endpointId_clusterId_attributeId_value_timedWriteTimeout_completion_, 0, 1);

  sub_234034104();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v8, (uint64_t)v7, sel_invokeCommandWithController_nodeId_endpointId_clusterId_commandId_fields_timedInvokeTimeout_completion_, 0, 1);

  sub_234034104();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v10, (uint64_t)v9, sel_readAttributeCacheWithController_nodeId_endpointId_clusterId_attributeId_completion_, 0, 1);

  sub_234034104();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v12, (uint64_t)v11, sel_downloadLogWithController_nodeId_type_timeout_completion_, 0, 1);

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)xpcInterfaceForClientProtocol
{
  void *v2;
  void *v3;
  const char *v4;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], a2, (uint64_t)&unk_2562171A0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_234034104();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v2, v4, (uint64_t)v3, sel_handleReportWithController_nodeId_values_error_, 2, 0);

  return (NSXPCInterface *)v2;
}

+ (MTRDeviceController)sharedControllerWithId:(id)controllerID xpcConnectBlock:(MTRXPCConnectBlock)xpcConnectBlock
{
  objc_msgSend_sharedControllerWithID_xpcConnectBlock_(MTRDeviceController, a2, (uint64_t)controllerID, xpcConnectBlock);
  return (MTRDeviceController *)(id)objc_claimAutoreleasedReturnValue();
}

@end
