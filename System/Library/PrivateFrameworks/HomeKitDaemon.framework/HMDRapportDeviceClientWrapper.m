@implementation HMDRapportDeviceClientWrapper

- (HMDRapportDeviceClientWrapper)initWithClient:(id)a3
{
  id v5;
  HMDRapportDeviceClientWrapper *v6;
  HMDRapportDeviceClientWrapper *v7;
  NSMutableArray *v8;
  NSMutableArray *requestQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDRapportDeviceClientWrapper;
  v6 = -[HMDRapportDeviceClientWrapper init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = v8;

  }
  return v7;
}

- (void)activateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  HMDRapportDeviceClientWrapper *v6;
  NSObject *v7;
  void *v8;
  RPCompanionLinkClient *client;
  RPCompanionLinkClient *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDRapportDeviceClientWrapper *v14;
  NSObject *v15;
  void *v16;
  HMDAssertionLogEvent *v17;
  void *v18;
  _QWORD v19[5];
  void (**v20)(id, void *);
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (self)
  {
    if (self->_activateState)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Activate called more than once.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v17 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Activate called more than once."));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "submitLogEvent:", v17);

      if (self->_activateState)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Unexpected error."), CFSTR("Activate called more than once."), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v12);
        goto LABEL_11;
      }
    }
    self->_activateState = 1;
  }
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      client = v6->_client;
    else
      client = 0;
    v10 = client;
    -[RPCompanionLinkClient destinationDevice](v10, "destinationDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Activating client for destination: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (self)
    self = (HMDRapportDeviceClientWrapper *)v6->_client;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__HMDRapportDeviceClientWrapper_activateWithCompletion___block_invoke;
  v19[3] = &unk_24E79B3A0;
  v19[4] = v6;
  v20 = v4;
  -[HMDRapportDeviceClientWrapper activateWithCompletion:](self, "activateWithCompletion:", v19);
  v12 = v20;
LABEL_11:

}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  RPCompanionLinkClient *client;
  void *v7;
  void *v8;
  void *v9;

  if (self)
  {
    self->_activateState = 3;
    v3 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3203);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure."), CFSTR("The client was invalidated."), 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRapportDeviceClientWrapper _completeQueuedRequestsWithError:](self, "_completeQueuedRequestsWithError:", v5);

    client = self->_client;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3203);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure."), CFSTR("The client was invalidated."), 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "_completeQueuedRequestsWithError:", v9);

    client = 0;
  }
  -[RPCompanionLinkClient invalidate](client, "invalidate");
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t activateState;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDRapportDeviceClientWrapper *v19;
  NSObject *v20;
  void *v21;
  HMDAssertionLogEvent *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self && (activateState = self->_activateState, activateState >= 2))
  {
    if (activateState == 3)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3203);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure."), CFSTR("Cannot send request on client that failed to activate."), 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v17);

    }
    else
    {
      if (activateState != 2)
      {
        v18 = (void *)MEMORY[0x227676638]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v21;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: State is not activated.", (uint8_t *)&v24, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        v22 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("State is not activated."));
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "submitLogEvent:", v22);

      }
      -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](self->_client, "sendRequestID:request:options:responseHandler:", v10, v11, v12, v13);
    }
  }
  else
  {
    -[HMDRapportDeviceClientWrapper _queueRequestID:request:options:responseHandler:](self, "_queueRequestID:request:options:responseHandler:", v10, v11, v12, v13);
  }

}

- (void)_queueRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDRapportDeviceClientWrapper *v15;
  NSObject *v16;
  void *v17;
  RPCompanionLinkClient *client;
  RPCompanionLinkClient *v19;
  void *v20;
  NSMutableArray *requestQueue;
  NSMutableArray *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      client = v15->_client;
    else
      client = 0;
    v19 = client;
    -[RPCompanionLinkClient destinationDevice](v19, "destinationDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v17;
    v36 = 2112;
    v37 = v20;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Queuing request to device: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  objc_initWeak((id *)buf, v15);
  if (v15)
    requestQueue = v15->_requestQueue;
  else
    requestQueue = 0;
  v22 = requestQueue;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__HMDRapportDeviceClientWrapper__queueRequestID_request_options_responseHandler___block_invoke;
  aBlock[3] = &unk_24E77A5E8;
  objc_copyWeak(&v33, (id *)buf);
  v23 = v13;
  v32 = v23;
  v24 = v10;
  v29 = v24;
  v25 = v11;
  v30 = v25;
  v26 = v12;
  v31 = v26;
  v27 = _Block_copy(aBlock);
  -[NSMutableArray addObject:](v22, "addObject:", v27);

  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);

}

- (void)_completeQueuedRequestsWithError:(id)a3
{
  id v4;
  NSMutableArray *requestQueue;
  void *v6;
  HMDRapportDeviceClientWrapper *v7;
  NSObject *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  RPCompanionLinkClient *client;
  RPCompanionLinkClient *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSMutableArray *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
    requestQueue = self->_requestQueue;
  else
    requestQueue = 0;
  if ((-[NSMutableArray hmf_isEmpty](requestQueue, "hmf_isEmpty") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        v10 = v7->_requestQueue;
      else
        v10 = 0;
      v11 = v10;
      v12 = -[NSMutableArray count](v11, "count");
      if (self)
        client = v7->_client;
      else
        client = 0;
      v14 = client;
      -[RPCompanionLinkClient destinationDevice](v14, "destinationDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v9;
      v30 = 2048;
      v31 = v12;
      v32 = 2112;
      v33 = v15;
      v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Completing %lu queued request(s) to device: %@, with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v6);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    if (self)
      v16 = v7->_requestQueue;
    else
      v16 = 0;
    v17 = v16;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i) + 16))();
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

    if (self)
      v22 = v7->_requestQueue;
    else
      v22 = 0;
    -[NSMutableArray removeAllObjects](v22, "removeAllObjects");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __81__HMDRapportDeviceClientWrapper__queueRequestID_request_options_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (WeakRetained)
      v5 = (void *)*((_QWORD *)WeakRetained + 1);
    else
      v5 = 0;
    objc_msgSend(v5, "sendRequestID:request:options:responseHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

void __56__HMDRapportDeviceClientWrapper_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 3203, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure."), CFSTR("Failed to activate Rapport client."), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = *(_QWORD *)(a1 + 32);
  if (v7 && *(_QWORD *)(v7 + 16) == 1)
  {
    v8 = 2;
    if (v6)
      v8 = 3;
    *(_QWORD *)(v7 + 16) = v8;
    objc_msgSend(*(id *)(a1 + 32), "_completeQueuedRequestsWithError:", v6);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_37005 != -1)
    dispatch_once(&logCategory__hmf_once_t5_37005, &__block_literal_global_37006);
  return (id)logCategory__hmf_once_v6_37007;
}

void __44__HMDRapportDeviceClientWrapper_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_37007;
  logCategory__hmf_once_v6_37007 = v0;

}

@end
