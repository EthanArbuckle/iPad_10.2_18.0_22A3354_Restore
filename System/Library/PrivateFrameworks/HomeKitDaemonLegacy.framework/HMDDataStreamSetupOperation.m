@implementation HMDDataStreamSetupOperation

- (HMDDataStreamSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDDataStreamSetupOperation *v15;
  HMDDataStreamSetupOperation *v16;
  uint64_t v17;
  NSMutableSet *pendingBulkSendListeners;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDDataStreamSetupOperation;
  v15 = -[HMDDataStreamSetupOperation init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessory, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    objc_storeStrong((id *)&v16->_logIdentifier, a5);
    objc_storeStrong((id *)&v16->_transferManagementService, a6);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    pendingBulkSendListeners = v16->_pendingBulkSendListeners;
    v16->_pendingBulkSendListeners = (NSMutableSet *)v17;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[HMDDataStreamSetupOperation _clearPendingBulkSendListeners](self, "_clearPendingBulkSendListeners");
  v3.receiver = self;
  v3.super_class = (Class)HMDDataStreamSetupOperation;
  -[HMDDataStreamSetupOperation dealloc](&v3, sel_dealloc);
}

- (void)postDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDDataStreamSetupOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDDataStreamSetupOperation_postDidFailWithError___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)postDidSucceedWithTransport:(id)a3 sessionEncryption:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDDataStreamSetupOperation queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HMDDataStreamSetupOperation_postDidSucceedWithTransport_sessionEncryption___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)continueStreamSetupWithResponse:(id)a3
{
  id v4;
  void *v5;
  HMDDataStreamSetupOperation *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  HMDDataStreamSetupOperation *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDDataStreamSetupOperation *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  HMDDataStreamSetupOperation *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDDataStreamSetupOperation *v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDDataStreamSetupOperation *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v62 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] Parsing accessory response", buf, 0xCu);

  }
  v55 = v6;

  objc_autoreleasePoolPop(v5);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v58;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v58 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v13);
      objc_msgSend(v14, "request", v55);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "characteristic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("00000131-0000-1000-8000-0026BB765291"));

      if ((v18 & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v11)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v19 = v14;

    if (!v19)
      goto LABEL_17;
    objc_msgSend(v19, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v55;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v24;
        v63 = 2112;
        v64 = v25;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply errored out: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v19, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamSetupOperation postDidFailWithError:](v22, "postDidFailWithError:", v26);

      goto LABEL_20;
    }
    v31 = (void *)MEMORY[0x1E0D164C0];
    objc_msgSend(v19, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    objc_msgSend(v31, "parsedFromData:error:", v32, &v56);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v56;

    if (v34 || !v33)
    {
      v39 = (void *)MEMORY[0x1D17BA0A0]();
      v40 = v55;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v42;
        v63 = 2112;
        v64 = v34;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply could not be parsed (error=%@)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamSetupOperation postDidFailWithError:](v40, "postDidFailWithError:", v43);

      goto LABEL_45;
    }
    objc_msgSend(v33, "status");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      v44 = (void *)MEMORY[0x1D17BA0A0]();
      v45 = v55;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_43:

        objc_autoreleasePoolPop(v44);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
        v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
        -[HMDDataStreamSetupOperation postDidFailWithError:](v45, "postDidFailWithError:", v34);
LABEL_45:

        goto LABEL_46;
      }
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v47;
      v48 = "%{public}@[Start Stream] The setup transfer write reply did not have status";
LABEL_42:
      _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);

      goto LABEL_43;
    }
    objc_msgSend(v33, "status");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "value");
    if (v37 == 1)
    {
      v38 = 52;
    }
    else
    {
      if (v37 != 2)
      {

LABEL_38:
        objc_msgSend(v33, "parameters");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          -[HMDDataStreamSetupOperation processTransportSetupResponse:](v55, "processTransportSetupResponse:", v33);
LABEL_46:

          goto LABEL_20;
        }
        v44 = (void *)MEMORY[0x1D17BA0A0]();
        v45 = v55;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v47;
        v48 = "%{public}@[Start Stream] The setup transfer write reply did not contain setup parameters";
        goto LABEL_42;
      }
      v38 = 16;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v38);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v49 = (void *)MEMORY[0x1D17BA0A0]();
      v45 = v55;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "status");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "value");
        HAPDataStreamTransportCommandStatusAsString();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v51;
        v63 = 2112;
        v64 = v53;
        _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write failed with status %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v49);
      goto LABEL_44;
    }
    goto LABEL_38;
  }
LABEL_11:

LABEL_17:
  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = v55;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v62 = v30;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply does not contain a response", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamSetupOperation postDidFailWithError:](v28, "postDidFailWithError:", v19);
LABEL_20:

}

- (void)_clearPendingBulkSendListeners
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDDataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "listener");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HMDDataStreamSetupOperation accessory](self, "accessory");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "accessory:didCloseDataStreamWithError:", v9, 0);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[HMDDataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)startSetup
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[HMDDataStreamSetupOperation startSetup]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)processTransportSetupResponse:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[HMDDataStreamSetupOperation processTransportSetupResponse:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)addBulkSendListener:(id)a3 fileType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDPendingBulkSendListener *v10;

  v6 = a4;
  v7 = a3;
  -[HMDDataStreamSetupOperation queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v10 = -[HMDPendingBulkSendListener initWithListener:fileType:]([HMDPendingBulkSendListener alloc], "initWithListener:fileType:", v7, v6);
  -[HMDDataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (BOOL)removeBulkSendListener:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDataStreamSetupOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDDataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "listener");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          -[HMDDataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:", v11);

          v13 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)movePendingBulkSendListenersToBulkSendProtocol:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDataStreamSetupOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDDataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "listener");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "fileType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addListener:fileType:", v12, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[HMDDataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

}

- (HMDDataStreamSetupOperationDelegate)delegate
{
  return (HMDDataStreamSetupOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDHAPAccessory)accessory
{
  return self->_accessory;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (HMDService)transferManagementService
{
  return self->_transferManagementService;
}

- (NSMutableSet)pendingBulkSendListeners
{
  return self->_pendingBulkSendListeners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBulkSendListeners, 0);
  objc_storeStrong((id *)&self->_transferManagementService, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __77__HMDDataStreamSetupOperation_postDidSucceedWithTransport_sessionEncryption___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataStreamSetupOperation:didSucceedWithTransport:sessionEncryption:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __52__HMDDataStreamSetupOperation_postDidFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataStreamSetupOperation:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)tcpSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDDataStreamTCPSetupOperation *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[HMDDataStreamTCPSetupOperation initWithAccessory:queue:logIdentifier:transferManagementService:]([HMDDataStreamTCPSetupOperation alloc], "initWithAccessory:queue:logIdentifier:transferManagementService:", v12, v11, v10, v9);

  return v13;
}

+ (id)hapSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDDataStreamHAPSetupOperation *v17;

  v8 = a8;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[HMDDataStreamHAPSetupOperation initWithAccessory:queue:logIdentifier:transferManagementService:maxControllerTransportMTU:setupOperationReadRequired:]([HMDDataStreamHAPSetupOperation alloc], "initWithAccessory:queue:logIdentifier:transferManagementService:maxControllerTransportMTU:setupOperationReadRequired:", v16, v15, v14, v13, a7, v8);

  return v17;
}

@end
