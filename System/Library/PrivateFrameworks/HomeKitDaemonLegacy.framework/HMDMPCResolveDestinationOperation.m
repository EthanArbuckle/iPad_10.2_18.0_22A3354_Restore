@implementation HMDMPCResolveDestinationOperation

- (HMDMPCResolveDestinationOperation)initWithHashedRouteIDs:(id)a3 mediaApplicationDestination:(int64_t)a4 mediaApplicationIdentifier:(id)a5 forceSingleGroup:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  HMDMPCAssistantRemoteControlDestinationFactory *v15;
  HMDMPCResolveDestinationOperation *v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = objc_alloc_init(HMDMPCAssistantRemoteControlDestinationFactory);
  v16 = -[HMDMPCResolveDestinationOperation initWithHashedRouteIDs:mediaApplicationDestination:mediaApplicationIdentifier:forceSingleGroup:completion:remoteControlDestinationFactory:](self, "initWithHashedRouteIDs:mediaApplicationDestination:mediaApplicationIdentifier:forceSingleGroup:completion:remoteControlDestinationFactory:", v14, a4, v13, v7, v12, v15);

  return v16;
}

- (HMDMPCResolveDestinationOperation)initWithHashedRouteIDs:(id)a3 mediaApplicationDestination:(int64_t)a4 mediaApplicationIdentifier:(id)a5 forceSingleGroup:(BOOL)a6 completion:(id)a7 remoteControlDestinationFactory:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDMPCResolveDestinationOperation *v19;
  HMDMPCResolveDestinationOperation *v20;
  void *v21;
  id resolveDestinationCompletionBlock;
  objc_super v24;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDMPCResolveDestinationOperation;
  v19 = -[HMFOperation initWithTimeout:](&v24, sel_initWithTimeout_, 0.0);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_hashedRouteIDs, a3);
    v21 = _Block_copy(v17);
    resolveDestinationCompletionBlock = v20->_resolveDestinationCompletionBlock;
    v20->_resolveDestinationCompletionBlock = v21;

    v20->_mediaApplicationDestination = a4;
    objc_storeStrong((id *)&v20->_mediaApplicationIdentifier, a5);
    v20->_forceSingleGroup = a6;
    objc_storeStrong((id *)&v20->_remoteControlDestinationFactory, a8);
    -[HMDMPCResolveDestinationOperation setCompletionBlock:](v20, "setCompletionBlock:", 0);
  }

  return v20;
}

- (void)main
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  HMDMPCResolveDestinationOperation *v6;
  void *v7;
  HMDMPCResolveDestinationOperation *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMDMPCResolveDestinationOperation *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = -[HMDMPCResolveDestinationOperation mediaApplicationDestination](self, "mediaApplicationDestination");
  if (!self)
  {
    v14 = 0;
    goto LABEL_15;
  }
  if (!v3)
  {
    v6 = self;
    goto LABEL_13;
  }
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      -[HMDMPCResolveDestinationOperation remoteControlDestinationFactory](self, "remoteControlDestinationFactory");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nowPlayingApplicationDestination");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v14 = (void *)v5;

      goto LABEL_15;
    }
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDMPCResolveDestinationOperation mediaApplicationDestination](v16, "mediaApplicationDestination"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unknown destination %@ for resolve destination operation, using system media destination", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v6 = v16;
LABEL_13:
    -[HMDMPCResolveDestinationOperation remoteControlDestinationFactory](v6, "remoteControlDestinationFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemMediaApplicationDestination");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMPCResolveDestinationOperation mediaApplicationIdentifier](v8, "mediaApplicationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Using custom media application destination for bundle identifier %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = objc_alloc(MEMORY[0x1E0D4B338]);
  -[HMDMPCResolveDestinationOperation mediaApplicationIdentifier](v8, "mediaApplicationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithAppBundleID:", v13);

LABEL_15:
  -[HMDMPCResolveDestinationOperation remoteControlDestinationFactory](self, "remoteControlDestinationFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMPCResolveDestinationOperation hashedRouteIDs](self, "hashedRouteIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __41__HMDMPCResolveDestinationOperation_main__block_invoke;
  v22[3] = &unk_1E89B22A8;
  v22[4] = self;
  objc_msgSend(v20, "resolveMPCDestination:withHashedRouteIdentifiers:audioRoutingInfo:completion:", v14, v21, 0, v22);

}

- (void)setCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HMDMPCResolveDestinationOperation_setCompletionBlock___block_invoke;
  aBlock[3] = &unk_1E89BD190;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = _Block_copy(aBlock);
  v7.receiver = self;
  v7.super_class = (Class)HMDMPCResolveDestinationOperation;
  -[HMDMPCResolveDestinationOperation setCompletionBlock:](&v7, sel_setCompletionBlock_, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMPCResolveDestinationOperation hashedRouteIDs](self, "hashedRouteIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ route IDs: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMPCResolveDestinationOperation hashedRouteIDs](self, "hashedRouteIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Hashed Route IDs"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (MPCAssistantMutableRemoteControlDestination)resolvedDestination
{
  return (MPCAssistantMutableRemoteControlDestination *)objc_getProperty(self, a2, 320, 1);
}

- (void)setResolvedDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSArray)hashedRouteIDs
{
  return self->_hashedRouteIDs;
}

- (NSString)mediaApplicationIdentifier
{
  return self->_mediaApplicationIdentifier;
}

- (id)resolveDestinationCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setResolveDestinationCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (HMDMPCAssistantRemoteControlDestinationFactory)remoteControlDestinationFactory
{
  return (HMDMPCAssistantRemoteControlDestinationFactory *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRemoteControlDestinationFactory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (int64_t)mediaApplicationDestination
{
  return self->_mediaApplicationDestination;
}

- (BOOL)forceSingleGroup
{
  return self->_forceSingleGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteControlDestinationFactory, 0);
  objc_storeStrong(&self->_resolveDestinationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_mediaApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_hashedRouteIDs, 0);
  objc_storeStrong((id *)&self->_resolvedDestination, 0);
}

void __56__HMDMPCResolveDestinationOperation_setCompletionBlock___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "resolveDestinationCompletionBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v2[2](v2, 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "resolvedDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v2)[2](v2, v4);

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __41__HMDMPCResolveDestinationOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = v3;
  if (v2)
  {
    if (v3
      && (objc_msgSend(v3, "outputDeviceUIDs"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "count"),
          v5,
          v6))
    {
      objc_msgSend(v2, "remoteControlDestinationFactory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopyForMPCDestination:", v4);

      objc_msgSend(v8, "setSingleGroup:", objc_msgSend(v2, "forceSingleGroup"));
      objc_msgSend(v2, "setResolvedDestination:", v8);
      objc_msgSend(v2, "finish");
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = v2;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "hashedRouteIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "outputDeviceUIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v12;
        v29 = 2112;
        v30 = v15;
        v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to resolve hashed media profiles given %@ hashedRouteIDs, resolved to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "hashedRouteIDs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "outputDeviceUIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Resolved destination failed, given %@ hashedRouteIDs, resolved to %@"), v22, v25);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cancelWithError:", v26);

    }
  }

}

+ (id)shortDescription
{
  return CFSTR("HMDMPCResolveDestinationOperation");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_98492 != -1)
    dispatch_once(&logCategory__hmf_once_t3_98492, &__block_literal_global_98493);
  return (id)logCategory__hmf_once_v4_98494;
}

void __48__HMDMPCResolveDestinationOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_98494;
  logCategory__hmf_once_v4_98494 = v0;

}

@end
