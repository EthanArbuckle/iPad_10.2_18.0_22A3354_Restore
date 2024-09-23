@implementation HMDUnassociatedAirPlayAccessory

- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7;
  id v8;
  HMDAirPlayAccessoryModel *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDAirPlayAccessoryModel alloc], "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v7);

  return v9;
}

- (id)addTransactionForHome:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDUnassociatedAirPlayAccessory *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDUnassociatedAirPlayAccessory *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)HMDUnassociatedAirPlayAccessory;
  -[HMDUnassociatedMediaAccessory addTransactionForHome:](&v33, sel_addTransactionForHome_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_25;
  -[HMDUnassociatedMediaAccessory advertisement](self, "advertisement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "outputDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "av_OutputDevice");
  v11 = (HMDUnassociatedAirPlayAccessory *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDUnassociatedAirPlayAccessory modelID](v11, "modelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HMDUnassociatedAirPlayAccessory modelID](v11, "modelID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setModel:", v13);

      -[HMDUnassociatedAirPlayAccessory modelID](v11, "modelID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInitialModel:", v14);

    }
    -[HMDUnassociatedAccessory serialNumber](v11, "serialNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HMDUnassociatedAccessory serialNumber](v11, "serialNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSerialNumber:", v16);

    }
    -[HMDUnassociatedAirPlayAccessory firmwareVersion](v11, "firmwareVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HMDUnassociatedAirPlayAccessory firmwareVersion](v11, "firmwareVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFirmwareVersion:", v18);

    }
    -[HMDUnassociatedAirPlayAccessory manufacturer](v11, "manufacturer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_22;
    -[HMDUnassociatedAirPlayAccessory manufacturer](v11, "manufacturer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setManufacturer:", v20);

    v21 = v11;
  }
  else
  {
    -[HMDUnassociatedAirPlayAccessory model](self, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[HMDUnassociatedAirPlayAccessory model](self, "model");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setModel:", v23);

      -[HMDUnassociatedAirPlayAccessory model](self, "model");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInitialModel:", v24);

    }
    -[HMDUnassociatedAirPlayAccessory manufacturer](self, "manufacturer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_22;
    -[HMDUnassociatedAirPlayAccessory manufacturer](self, "manufacturer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setManufacturer:", v26);

    v21 = self;
  }
  -[HMDUnassociatedAirPlayAccessory manufacturer](v21, "manufacturer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInitialManufacturer:", v27);

LABEL_22:
  v28 = (void *)MEMORY[0x1E0CBA1D8];
  -[HMDUnassociatedAccessory category](self, "category");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "categoryIdentifierForCategory:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInitialCategoryIdentifier:", v30);

  -[HMDUnassociatedAirPlayAccessory pairingIdentity](self, "pairingIdentity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v6, "setPairingIdentity:", v31);

LABEL_25:
  return v4;
}

- (HMDUnassociatedAirPlayAccessory)initWithCoder:(id)a3
{
  id v4;
  HMDUnassociatedAirPlayAccessory *v5;
  uint64_t v6;
  HMFPairingIdentity *pairingIdentity;
  uint64_t v8;
  NSString *model;
  uint64_t v10;
  NSString *manufacturer;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDUnassociatedAirPlayAccessory;
  v5 = -[HMDUnassociatedAccessory initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7D60]);
    v6 = objc_claimAutoreleasedReturnValue();
    pairingIdentity = v5->_pairingIdentity;
    v5->_pairingIdentity = (HMFPairingIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.model"));
    v8 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.manufacturer"));
    v10 = objc_claimAutoreleasedReturnValue();
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  char v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  v6 = objc_msgSend(v4, "hmd_isForLocalStore");
  v19.receiver = self;
  v19.super_class = (Class)HMDUnassociatedAirPlayAccessory;
  -[HMDUnassociatedAccessory encodeWithCoder:](&v19, sel_encodeWithCoder_, v4);
  -[HMDUnassociatedAirPlayAccessory pairingIdentity](self, "pairingIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB7D60]);
    }
    else if (v7)
    {
      objc_msgSend(v7, "publicPairingIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v9, *MEMORY[0x1E0CB7D60]);

    }
  }
  -[HMDUnassociatedMediaAccessory advertisement](self, "advertisement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "outputDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "av_OutputDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "modelID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v14, "modelID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("HM.model"));

    }
    objc_msgSend(v14, "manufacturer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v14, "manufacturer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("HM.manufacturer"));

    }
  }

}

- (HMFPairingIdentity)pairingIdentity
{
  HMFPairingIdentity *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_pairingIdentity;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setPairingIdentity:(id)a3
{
  HMFPairingIdentity *v4;
  HMFPairingIdentity *pairingIdentity;

  v4 = (HMFPairingIdentity *)objc_msgSend(a3, "copy");
  os_unfair_recursive_lock_lock_with_options();
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_recursive_lock_unlock();
}

- (BOOL)supportsAssociation
{
  return 1;
}

- (void)associateToHome:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDUnassociatedAirPlayAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  HMDUnassociatedAirPlayAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDUnassociatedAirPlayAccessory *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDUnassociatedAirPlayAccessory *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDUnassociatedAirPlayAccessory *v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  void (**v47)(id, void *);
  id v48;
  id v49;
  char v50;
  id from;
  _QWORD aBlock[4];
  id v53;
  id v54;
  id v55;
  id v56;
  char v57;
  id location;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting association", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDUnassociatedMediaAccessory advertisement](v9, "advertisement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "outputDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "av_OutputDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "owner");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isCurrentUser") & 1) == 0)
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = v9;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v32;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Only the owner of the home can perform association", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 17);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v43);

        }
        goto LABEL_33;
      }
      objc_msgSend(v17, "av_authorizedPeer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v18 = objc_msgSend(MEMORY[0x1E0C8B2B8], "shouldRestrictConnectionWithUserPrivilege:", objc_msgSend(v6, "minimumMediaUserPrivilege"));
        objc_msgSend(v6, "mediaPassword");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v6, "mediaPassword");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        objc_initWeak((id *)buf, v9);
        objc_initWeak(&location, v6);
        v38 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __69__HMDUnassociatedAirPlayAccessory_associateToHome_completionHandler___block_invoke;
        aBlock[3] = &unk_1E89A91D8;
        objc_copyWeak(&v55, (id *)buf);
        objc_copyWeak(&v56, &location);
        v57 = v18;
        v39 = v42;
        v53 = v39;
        v40 = v20;
        v54 = v40;
        v41 = _Block_copy(aBlock);
        objc_initWeak(&from, v14);
        v44[0] = v38;
        v44[1] = 3221225472;
        v44[2] = __69__HMDUnassociatedAirPlayAccessory_associateToHome_completionHandler___block_invoke_13;
        v44[3] = &unk_1E89A9200;
        objc_copyWeak(&v48, (id *)buf);
        v50 = v18;
        v45 = v39;
        v37 = v40;
        v46 = v37;
        objc_copyWeak(&v49, &from);
        v47 = v7;
        objc_msgSend(v16, "configureUsingBlock:options:completionHandler:", v41, 0, v44);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v48);
        objc_destroyWeak(&from);

        objc_destroyWeak(&v56);
        objc_destroyWeak(&v55);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
        goto LABEL_31;
      }
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v9;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v36;
        v61 = 2112;
        v62 = v17;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Missing authorized peer for user: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v37);
LABEL_31:

        goto LABEL_33;
      }

LABEL_33:
      goto LABEL_34;
    }
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v9;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Missing output device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v17);
      goto LABEL_33;
    }
    v16 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = v9;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v24;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Missing advertisement", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
    goto LABEL_34;
  }
LABEL_35:

}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

void __69__HMDUnassociatedAirPlayAccessory_associateToHome_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v3, "startAutomaticallyAllowingConnectionsFromPeersInHomeGroupAndRejectOtherConnections:", *(unsigned __int8 *)(a1 + 64));
    objc_msgSend(v3, "addPeerToHomeGroup:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
      v7 = *(const __CFString **)(a1 + 40);
    else
      v7 = &stru_1E89C3E38;
    v5 = (id)objc_msgSend(v3, "setDevicePassword:", v7);
  }
  v8 = (void *)MEMORY[0x1D17BA0A0](v5);
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring with configuration: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

void __69__HMDUnassociatedAirPlayAccessory_associateToHome_completionHandler___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  id v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  unint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  char v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v8)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = WeakRetained;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v68 = v22;
      v69 = 2112;
      v70 = v10;
      v71 = 2112;
      v72 = v9;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to update configuration while associating to home with error: %@, %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure"), CFSTR("Failed to set administration password."), 0, v10);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((objc_msgSend(v8, "automaticallyAllowsConnectionsFromPeersInHomeGroup") & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = WeakRetained;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v27;
      v28 = "%{public}@Failed to enable home connections";
LABEL_14:
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);

    }
LABEL_15:

    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v29 = (id)v23;
    goto LABEL_17;
  }
  if (*(unsigned __int8 *)(a1 + 72) != objc_msgSend(v8, "onlyAllowsConnectionsFromPeersInHomeGroup"))
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = WeakRetained;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v27;
      v28 = "%{public}@Failed to disable guest access";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v12 = v8;
  objc_msgSend(v12, "deviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "devicePublicKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0D28650]);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v14);
    v17 = (void *)objc_msgSend(v15, "initWithIdentifier:publicKey:privateKey:", v13, v16, 0);

    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Not supported."), CFSTR("Accessory missing pairing identity"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }

  v29 = v18;
  if (v17)
  {
    objc_msgSend(WeakRetained, "setPairingIdentity:", v17);
    objc_msgSend(v12, "peersInHomeGroup");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsObject:", *(_QWORD *)(a1 + 32));

    if ((v32 & 1) != 0)
    {
      v65 = v17;
      objc_msgSend(v12, "peersInHomeGroup");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34 < 2)
      {
        objc_msgSend(v12, "devicePassword");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = HMFEqualObjects();

        if ((v54 & 1) != 0)
        {
          v52 = objc_loadWeakRetained((id *)(a1 + 64));
          v55 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v52, "setAssociated:", 1));
          v56 = WeakRetained;
          HMFGetOSLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v64 = v55;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v68 = v58;
            _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_INFO, "%{public}@Successfully associated", buf, 0xCu);

            v55 = v64;
          }

          objc_autoreleasePoolPop(v55);
          goto LABEL_42;
        }
        v59 = (void *)MEMORY[0x1D17BA0A0]();
        v60 = WeakRetained;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v68 = v62;
          _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to set media password", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v59);
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v41 = 54;
      }
      else
      {
        v35 = (void *)MEMORY[0x1D17BA0A0]();
        v36 = WeakRetained;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v63 = v35;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "peersInHomeGroup");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v38;
          v69 = 2112;
          v70 = v39;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Unexpected peers found: %@", buf, 0x16u);

          v35 = v63;
        }

        objc_autoreleasePoolPop(v35);
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v41 = 41;
      }
      objc_msgSend(v40, "hmErrorWithCode:", v41);
      v52 = v29;
      v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
      v17 = v65;
      goto LABEL_43;
    }
    v48 = (void *)MEMORY[0x1D17BA0A0]();
    v49 = WeakRetained;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v66 = v17;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v51;
      _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add ourselves as a peer", buf, 0xCu);

      v17 = v66;
    }

    objc_autoreleasePoolPop(v48);
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v47 = 2;
  }
  else
  {
    v42 = (void *)MEMORY[0x1D17BA0A0]();
    v43 = WeakRetained;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v45;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid or missing pairing identity", buf, 0xCu);

      v17 = 0;
    }

    objc_autoreleasePoolPop(v42);
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v47 = 21;
  }
  objc_msgSend(v46, "hmErrorWithCode:", v47);
  v52 = v29;
  v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:

LABEL_17:
  v30 = *(_QWORD *)(a1 + 48);
  if (v30)
    (*(void (**)(uint64_t, id))(v30 + 16))(v30, v29);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_35893 != -1)
    dispatch_once(&logCategory__hmf_once_t20_35893, &__block_literal_global_35894);
  return (id)logCategory__hmf_once_v21_35895;
}

void __46__HMDUnassociatedAirPlayAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21_35895;
  logCategory__hmf_once_v21_35895 = v0;

}

@end
