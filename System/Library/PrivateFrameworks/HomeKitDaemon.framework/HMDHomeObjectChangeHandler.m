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
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;

  v6 = a3;
  v7 = a4;
  -[HMDHomeObjectChangeHandler home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v47;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v8, "_handleAddRoomModel:message:", v10, v7);
LABEL_57:

    goto LABEL_58;
  }
  v11 = v47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v8, "_handleAddZoneModel:message:", v13, v7);
    goto LABEL_57;
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
    goto LABEL_57;
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
    goto LABEL_57;
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
    goto LABEL_57;
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
    goto LABEL_57;
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
    goto LABEL_57;
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
    goto LABEL_57;
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
    goto LABEL_57;
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
LABEL_56:

    goto LABEL_57;
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
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleAddOrUpdateAccessoryNetworkProtectionGroupModel:message:", v41, v7);
    goto LABEL_56;
  }
  v42 = v39;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v43 = v42;
  else
    v43 = 0;
  v44 = v43;

  if (v44)
  {
    objc_msgSend(v44, "parentUUID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryWithUUID:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "transactionObjectUpdated:newValues:message:", 0, v44, v7);
    goto LABEL_57;
  }
LABEL_58:

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
  void *v39;
  HMDHomeObjectChangeHandler *v40;
  NSObject *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
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
LABEL_30:
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
  v12 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v38 = v12;
  else
    v38 = 0;
  v22 = v38;

  if (v22)
    goto LABEL_30;
  v39 = (void *)MEMORY[0x227676638]();
  v40 = self;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138543618;
    v44 = v42;
    v45 = 2112;
    v46 = v12;
    _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [HMDHome transactionObjectRemoved]", (uint8_t *)&v43, 0x16u);

  }
  objc_autoreleasePoolPop(v39);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
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
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  HMDHomeObjectChangeHandler *v89;
  NSObject *v90;
  void *v91;
  id v92;
  id v93;
  id obj;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t v104[128];
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  id v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
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

    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v106 = v20;
      v107 = 2112;
      v108 = v16;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Received room transaction, applying it to room: %@", buf, 0x16u);

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

    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v98 = v12;
      v29 = v21;
      v30 = v11;
      v31 = v10;
      v32 = v8;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v106 = v33;
      v107 = 2112;
      v108 = v25;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Received zone transaction, applying it to zone: %@", buf, 0x16u);

      v8 = v32;
      v10 = v31;
      v11 = v30;
      v21 = v29;
      v12 = v98;
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
  v99 = v8;
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

    v38 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v106 = v40;
      v107 = 2112;
      v108 = v25;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Received serviceGroup transaction, applying it to serviceGroup: %@", buf, 0x16u);

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
        v8 = v99;
        objc_msgSend(v49, "transactionObjectUpdated:newValues:message:", v99, v21, v10);
LABEL_55:

        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v53);

    }
    else
    {
      -[HMDHomeObjectChangeHandler handleObjectAdd:message:](self, "handleObjectAdd:message:", v45, v10);
    }
    v8 = v99;
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
      v8 = v99;
      goto LABEL_27;
    }
LABEL_35:
    -[HMDHomeObjectChangeHandler handleObjectAdd:message:](self, "handleObjectAdd:message:", v36, v10);
    v8 = v99;
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
      v8 = v99;
      objc_msgSend(v59, "transactionObjectUpdated:newValues:message:", v99, v21, v10);
    }
    else
    {
      v67 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v97 = v67;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "parentUUID");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "instanceID");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v106 = v69;
        v107 = 2112;
        v108 = v70;
        v109 = 2112;
        v110 = v71;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory %@ to add/update service %@", buf, 0x20u);

        v67 = v97;
      }

      objc_autoreleasePoolPop(v67);
      v8 = v99;
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
      v93 = v60;
      objc_msgSend(v11, "usersIncludingPendingUsers:", 1);
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
      if (v96)
      {
        v95 = *(_QWORD *)v101;
LABEL_73:
        v62 = 0;
        while (1)
        {
          if (*(_QWORD *)v101 != v95)
            objc_enumerationMutation(obj);
          v63 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v62);
          objc_msgSend(v63, "uuid");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v64, "isEqual:", v65);

          if ((v66 & 1) != 0)
            break;
          if (v96 == ++v62)
          {
            v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
            if (v96)
              goto LABEL_73;
            goto LABEL_79;
          }
        }
        v72 = v63;

        v8 = v99;
        if (!v72)
          goto LABEL_86;
        objc_msgSend(v72, "transactionObjectUpdated:newValues:message:", v99, v93, v10);

      }
      else
      {
LABEL_79:

        v8 = v99;
LABEL_86:
        -[HMDHomeObjectChangeHandler handleObjectAdd:message:](self, "handleObjectAdd:message:", v21, v10);
      }

    }
    else
    {
      v21 = v60;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v73 = v21;
      else
        v73 = 0;
      v74 = v73;

      if (v74)
      {
        objc_msgSend(v74, "uuid");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "outgoingInvitationWithUUID:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          v8 = v99;
          objc_msgSend(v76, "transactionObjectUpdated:newValues:message:", v99, v21, v10);
        }
        else
        {
          -[HMDHomeObjectChangeHandler handleObjectAdd:message:](self, "handleObjectAdd:message:", v74, v10);
          v8 = v99;
        }

      }
      else
      {
        v21 = v21;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v77 = v21;
        else
          v77 = 0;
        v78 = v77;

        if (!v78)
        {
          v79 = v21;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v80 = v79;
          else
            v80 = 0;
          v81 = v80;
          v21 = v79;

          if (v81)
          {
            objc_msgSend(v81, "uuid");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "mediaSystemWithUUID:", v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();

            if (v83)
            {
              objc_msgSend(v83, "transactionObjectUpdated:newValues:message:", v99, v79, v10);
            }
            else
            {
              objc_msgSend(v11, "mediaSystemController");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "_handleAddMediaSystemModel:message:", v81, v10);

            }
          }
          else
          {
            v21 = v79;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v84 = v21;
            else
              v84 = 0;
            v85 = v84;

            if (v85)
            {
              objc_msgSend(v11, "networkProtectionGroupRegistry");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "handleAddOrUpdateAccessoryNetworkProtectionGroupModel:message:", v85, v10);

              v8 = v99;
              goto LABEL_37;
            }
            v88 = (void *)MEMORY[0x227676638]();
            v89 = self;
            HMFGetOSLogHandle();
            v90 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v106 = v91;
              v107 = 2112;
              v108 = v21;
              v109 = 2112;
              v110 = (id)objc_opt_class();
              v92 = v110;
              _os_log_impl(&dword_2218F0000, v90, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v88);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "respondWithError:", v21);
          }
          v8 = v99;
          goto LABEL_37;
        }
        objc_msgSend(v11, "_handleUpdateAppDataModel:message:", v78, v10);
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
