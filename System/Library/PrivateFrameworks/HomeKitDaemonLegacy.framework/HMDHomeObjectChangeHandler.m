@implementation HMDHomeObjectChangeHandler

- (HMDHomeObjectChangeHandler)initWithHome:(id)a3
{
  id v4;
  HMDHomeObjectChangeHandler *v5;
  HMDHomeObjectChangeHandler *v6;
  uint64_t v7;
  OS_dispatch_queue *workQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDHomeObjectChangeHandler;
  v5 = -[HMDHomeObjectChangeHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_home, v4);
    objc_msgSend(v4, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v7;

  }
  return v6;
}

- (void)handleObjectAdd:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;

  v6 = a3;
  v7 = a4;
  -[HMDHomeObjectChangeHandler home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v43;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v8, "_handleAddRoomModel:message:", v10, v7);
LABEL_56:

    goto LABEL_57;
  }
  v11 = v43;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v8, "_handleAddZoneModel:message:", v13, v7);
    goto LABEL_56;
  }
  v14 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    objc_msgSend(v8, "_handleAddServiceGroupModel:message:", v16, v7);
    goto LABEL_56;
  }
  v17 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    objc_msgSend(v8, "_handleAddActionSetModel:message:", v19, v7);
    goto LABEL_56;
  }
  v20 = v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_msgSend(v8, "_handleAddTimerTriggerModel:message:", v22, v7);
    goto LABEL_56;
  }
  v23 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    objc_msgSend(v8, "_handleAddEventTriggerModel:message:", v25, v7);
    goto LABEL_56;
  }
  v26 = v23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  if (v28)
  {
    objc_msgSend(v8, "_handleAddAccessoryModel:message:", v28, v7);
    goto LABEL_56;
  }
  v29 = v26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = v30;

  if (v31)
  {
    objc_msgSend(v8, "_handleAddUserModel:message:", v31, v7);
    goto LABEL_56;
  }
  v32 = v29;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v33 = v32;
  else
    v33 = 0;
  v34 = v33;

  if (v34)
  {
    objc_msgSend(v8, "_handleAddOutgoingHomeInvitationModel:message:", v34, v7);
    goto LABEL_56;
  }
  v35 = v32;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;
  v37 = v36;

  if (v37)
  {
    objc_msgSend(v8, "mediaSystemController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_handleAddMediaSystemModel:message:", v37, v7);

    goto LABEL_56;
  }
  v39 = v35;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v40 = v39;
  else
    v40 = 0;
  v41 = v40;

  if (v41)
  {
    objc_msgSend(v8, "networkProtectionGroupRegistry");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleAddOrUpdateAccessoryNetworkProtectionGroupModel:message:", v41, v7);

    goto LABEL_56;
  }
LABEL_57:

}

- (void)handleObjectRemove:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  HMDHomeObjectChangeHandler *v39;
  NSObject *v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeObjectChangeHandler home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v8, "_handleRemoveRoomModel:message:", v11, v7);
    v12 = v9;
    goto LABEL_62;
  }
  v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v8, "_handleRemoveZoneModel:message:", v14, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v12;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    objc_msgSend(v8, "_handleRemoveServiceGroupModel:message:", v16, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v12;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    objc_msgSend(v8, "_handleRemoveActionSetModel:message:", v18, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v12;
  else
    v19 = 0;
  v20 = v19;

  if (v20)
  {
    objc_msgSend(v8, "_handleRemoveAccessoryModel:message:", v20, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v12;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_msgSend(v22, "parentUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryWithUUID:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "transactionObjectRemoved:message:", v22, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v12;
  else
    v25 = 0;
  v26 = v25;

  if (v26)
  {
    objc_msgSend(v8, "_handleRemoveUserModel:message:", v26, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v12;
  else
    v27 = 0;
  v28 = v27;

  if (v28)
  {
    objc_msgSend(v8, "_handleRemoveTriggerModel:message:", v28, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v12;
  else
    v29 = 0;
  v30 = v29;

  if (v30)
  {
    objc_msgSend(v8, "_handleRemoveOutgoingHomeInvitationModel:message:", v30, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v31 = v12;
  else
    v31 = 0;
  v32 = v31;

  if (v32)
  {
    objc_msgSend(v8, "_handleRemoveAppDataModel:message:", v32, v7);
    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v33 = v12;
  else
    v33 = 0;
  v34 = v33;

  if (v34)
  {
    objc_msgSend(v8, "mediaSystemController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "_handleRemoveMediaSystemModel:message:", v34, v7);
LABEL_61:

    goto LABEL_62;
  }
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v12;
  else
    v36 = 0;
  v37 = v36;

  if (v37)
  {
    objc_msgSend(v8, "networkProtectionGroupRegistry");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleRemoveAccessoryNetworkProtectionGroupModel:message:", v37, v7);
    goto LABEL_61;
  }
  v38 = (void *)MEMORY[0x1D17BA0A0]();
  v39 = self;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543618;
    v43 = v41;
    v44 = 2112;
    v45 = v12;
    _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [HMDHome transactionObjectRemoved]", (uint8_t *)&v42, 0x16u);

  }
  objc_autoreleasePoolPop(v38);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v12);
LABEL_62:

}

- (void)handleObjectUpdate:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHomeObjectChangeHandler *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  HMDHomeObjectChangeHandler *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  char isKindOfClass;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  HMDHomeObjectChangeHandler *v91;
  NSObject *v92;
  void *v93;
  id v94;
  id v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  char v100;
  void *v101;
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t v108[128];
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  id v112;
  __int16 v113;
  id v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeObjectChangeHandler home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "roomWithUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v110 = v20;
      v111 = 2112;
      v112 = v16;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Received room transaction, applying it to room: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    if (v16)
      objc_msgSend(v16, "transactionObjectUpdated:newValues:message:", v8, v12, v10);
    else
      -[HMDHomeObjectChangeHandler handleObjectAdd:message:](v18, "handleObjectAdd:message:", v14, v10);

    v21 = v12;
    goto LABEL_37;
  }
  v21 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  if (v23)
  {
    objc_msgSend(v23, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneWithUUID:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v102 = v12;
      v29 = v21;
      v30 = v11;
      v31 = v10;
      v32 = v8;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v110 = v33;
      v111 = 2112;
      v112 = v25;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Received zone transaction, applying it to zone: %@", buf, 0x16u);

      v8 = v32;
      v10 = v31;
      v11 = v30;
      v21 = v29;
      v12 = v102;
    }

    objc_autoreleasePoolPop(v26);
    if (!v25)
    {
      -[HMDHomeObjectChangeHandler handleObjectAdd:message:](v27, "handleObjectAdd:message:", v23, v10);
      goto LABEL_36;
    }
    v34 = v25;
LABEL_27:
    objc_msgSend(v34, "transactionObjectUpdated:newValues:message:", v8, v21, v10);
LABEL_36:

    goto LABEL_37;
  }
  v103 = v8;
  v21 = v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = v21;
  else
    v35 = 0;
  v36 = v35;

  if (v36)
  {
    objc_msgSend(v36, "uuid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceGroupWithUUID:", v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1D17BA0A0]();
    self = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v110 = v40;
      v111 = 2112;
      v112 = v25;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Received serviceGroup transaction, applying it to serviceGroup: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    if (v25)
      goto LABEL_26;
    goto LABEL_35;
  }
  v21 = v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v41 = v21;
  else
    v41 = 0;
  v36 = v41;

  if (v36)
  {
    objc_msgSend(v36, "uuid");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionSetWithUUID:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v21 = v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v44 = v21;
  else
    v44 = 0;
  v45 = v44;

  if (v45
    || ((v21 = v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) ? (v46 = 0) : (v46 = v21),
        v45 = v46,
        v21,
        v45))
  {
    objc_msgSend(v45, "uuid");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "triggerWithUUID:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v48;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v51 = v49;
    else
      v51 = 0;
    v52 = v51;

    if (v49)
    {
      if ((isKindOfClass & 1) != 0)
      {
        v8 = v103;
        objc_msgSend(v49, "transactionObjectUpdated:newValues:message:", v103, v21, v10);
LABEL_55:

        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v53);

    }
    else
    {
      -[HMDHomeObjectChangeHandler handleObjectAdd:message:](self, "handleObjectAdd:message:", v45, v10);
    }
    v8 = v103;
    goto LABEL_55;
  }
  v21 = v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v54 = v21;
  else
    v54 = 0;
  v36 = v54;

  if (v36)
  {
    objc_msgSend(v36, "uuid");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryWithUUID:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
LABEL_34:
    v25 = (void *)v43;

    if (v25)
    {
LABEL_26:
      v34 = v25;
      v8 = v103;
      goto LABEL_27;
    }
LABEL_35:
    -[HMDHomeObjectChangeHandler handleObjectAdd:message:](self, "handleObjectAdd:message:", v36, v10);
    v8 = v103;
    goto LABEL_36;
  }
  v21 = v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v55 = v21;
  else
    v55 = 0;
  v56 = v55;

  if (v56)
  {
    v57 = v56;
    objc_msgSend(v57, "parentUUID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryWithUUID:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      v8 = v103;
      objc_msgSend(v59, "transactionObjectUpdated:newValues:message:", v103, v21, v10);
    }
    else
    {
      v69 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v101 = v69;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "parentUUID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "instanceID");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v110 = v71;
        v111 = 2112;
        v112 = v72;
        v113 = 2112;
        v114 = v73;
        _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory %@ to add/update service %@", buf, 0x20u);

        v69 = v101;
      }

      objc_autoreleasePoolPop(v69);
      v8 = v103;
    }

  }
  else
  {
    v60 = v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v61 = v60;
    else
      v61 = 0;
    v21 = v61;

    if (v21)
    {
      v95 = v60;
      objc_msgSend(v11, "users");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pairingIdentity");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("HAP.identifier"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      obj = v62;
      v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
      if (v98)
      {
        v97 = *(_QWORD *)v105;
LABEL_73:
        v64 = 0;
        while (1)
        {
          if (*(_QWORD *)v105 != v97)
            objc_enumerationMutation(obj);
          v65 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v64);
          objc_msgSend(v65, "uuid");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v66, "isEqual:", v67))
            break;
          objc_msgSend(v65, "pairingUsername");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v68, "isEqualToString:", v99);

          if ((v100 & 1) != 0)
            goto LABEL_92;
          if (v98 == ++v64)
          {
            v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
            if (v98)
              goto LABEL_73;
            goto LABEL_80;
          }
        }

LABEL_92:
        v78 = v65;

        v8 = v103;
        if (!v78)
          goto LABEL_94;
        objc_msgSend(v78, "transactionObjectUpdated:newValues:message:", v103, v95, v10);

      }
      else
      {
LABEL_80:

        v8 = v103;
LABEL_94:
        -[HMDHomeObjectChangeHandler handleObjectAdd:message:](self, "handleObjectAdd:message:", v21, v10);
      }

    }
    else
    {
      v21 = v60;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v74 = v21;
      else
        v74 = 0;
      v75 = v74;

      if (v75)
      {
        objc_msgSend(v75, "uuid");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "outgoingInvitationWithUUID:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77)
        {
          v8 = v103;
          objc_msgSend(v77, "transactionObjectUpdated:newValues:message:", v103, v21, v10);
        }
        else
        {
          -[HMDHomeObjectChangeHandler handleObjectAdd:message:](self, "handleObjectAdd:message:", v75, v10);
          v8 = v103;
        }

      }
      else
      {
        v21 = v21;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v79 = v21;
        else
          v79 = 0;
        v80 = v79;

        if (!v80)
        {
          v81 = v21;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v82 = v81;
          else
            v82 = 0;
          v83 = v82;
          v21 = v81;

          if (v83)
          {
            objc_msgSend(v83, "uuid");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "mediaSystemWithUUID:", v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            if (v85)
            {
              objc_msgSend(v85, "transactionObjectUpdated:newValues:message:", v103, v81, v10);
            }
            else
            {
              objc_msgSend(v11, "mediaSystemController");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "_handleAddMediaSystemModel:message:", v83, v10);

            }
          }
          else
          {
            v21 = v81;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v86 = v21;
            else
              v86 = 0;
            v87 = v86;

            if (v87)
            {
              objc_msgSend(v11, "networkProtectionGroupRegistry");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "handleAddOrUpdateAccessoryNetworkProtectionGroupModel:message:", v87, v10);

              v8 = v103;
              goto LABEL_37;
            }
            v90 = (void *)MEMORY[0x1D17BA0A0]();
            v91 = self;
            HMFGetOSLogHandle();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v110 = v93;
              v111 = 2112;
              v112 = v21;
              v113 = 2112;
              v114 = (id)objc_opt_class();
              v94 = v114;
              _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v90);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "respondWithError:", v21);
          }
          v8 = v103;
          goto LABEL_37;
        }
        objc_msgSend(v11, "_handleUpdateAppDataModel:message:", v80, v10);
      }
    }
  }
LABEL_37:

}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
}

@end
