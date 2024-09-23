@implementation HMDAccessorySettingTransform

+ (id)modelsForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelForGroup:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(a1, "modelsForSetting:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "groups", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(a1, "modelsForGroup:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  return v5;
}

+ (id)modelsForGroupDiff:(id)a3 fromGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id obj;
  id obja;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(a1, "modelsForGroup:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v28 = v7;
  objc_msgSend(v7, "groups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (!v9)
    goto LABEL_14;
  v10 = v9;
  v11 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v38 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_msgSend(v6, "groups");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __61__HMDAccessorySettingTransform_modelsForGroupDiff_fromGroup___block_invoke;
      v36[3] = &unk_24E793C18;
      v36[4] = v13;
      objc_msgSend(v14, "na_firstObjectPassingTest:", v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if ((objc_msgSend(v15, "compareSettingsTree:", v13) & 1) != 0)
          goto LABEL_12;
        +[HMDAccessorySettingTransform modelsForGroupDiff:fromGroup:](HMDAccessorySettingTransform, "modelsForGroupDiff:fromGroup:", v15, v13);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(a1, "modelsForGroup:", v13);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v16;
      objc_msgSend(v8, "addObjectsFromArray:", v16);

LABEL_12:
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  }
  while (v10);
LABEL_14:

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v7, "settings");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(obja);
        v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v6, "settings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __61__HMDAccessorySettingTransform_modelsForGroupDiff_fromGroup___block_invoke_2;
        v31[3] = &unk_24E793BF0;
        v31[4] = v22;
        objc_msgSend(v23, "na_firstObjectPassingTest:", v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          +[HMDAccessorySettingTransform modelsForSettingDiff:fromSetting:](HMDAccessorySettingTransform, "modelsForSettingDiff:fromSetting:", v24, v22);
        else
          objc_msgSend(a1, "modelsForSetting:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v25);

      }
      v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v19);
  }

  v26 = (void *)objc_msgSend(v8, "copy");
  v7 = v28;
LABEL_26:

  return v26;
}

+ (id)modelsForSettingDiff:(id)a3 fromSetting:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  HMDAccessorySettingConstraintModel *v22;
  void *v23;
  void *v24;
  HMDAccessorySettingConstraintModel *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDAccessorySettingConstraintModel *v30;
  void *v31;
  void *v32;
  HMDAccessorySettingConstraintModel *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  HMDAccessorySettingConstraintModel *v45;
  void *v46;
  void *v47;
  HMDAccessorySettingConstraintModel *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDAccessorySettingConstraintModel *v53;
  void *v54;
  void *v55;
  HMDAccessorySettingConstraintModel *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  HMDAccessorySettingConstraintModel *v68;
  void *v69;
  void *v70;
  HMDAccessorySettingConstraintModel *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  HMDAccessorySettingConstraintModel *v76;
  void *v77;
  void *v78;
  HMDAccessorySettingConstraintModel *v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t v110[128];
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  id v114;
  __int16 v115;
  id v116;
  __int16 v117;
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "type");
  if (v9 == objc_msgSend(v7, "type"))
  {
    v10 = objc_msgSend(v6, "type");
    if (v10 == 4)
    {
      v87 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v7, "constraints");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setWithArray:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v6, "constraints");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setWithArray:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "na_setByRemovingObjectsFromSet:", v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v85 = v93;
      v94 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
      if (v94)
      {
        v95 = v94;
        v96 = *(_QWORD *)v107;
        do
        {
          v97 = 0;
          do
          {
            if (*(_QWORD *)v107 != v96)
              objc_enumerationMutation(v85);
            v98 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v97);
            objc_msgSend(v6, "identifier", (_QWORD)v106);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "modelWithParentIdentifier:", v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v100, "setObjectChangeType:", 1);
            objc_msgSend(v8, "addObject:", v100);

            ++v97;
          }
          while (v95 != v97);
          v95 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
        }
        while (v95);
      }

      v101 = (void *)MEMORY[0x227676638]();
      v102 = a1;
      HMFGetOSLogHandle();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v112 = v104;
        v113 = 2112;
        v114 = v85;
        v115 = 2112;
        v116 = v6;
        _os_log_impl(&dword_2218F0000, v103, OS_LOG_TYPE_INFO, "%{public}@Adding missing selection constraints %@ to setting %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v101);
    }
    else
    {
      if (v10 != 2)
        goto LABEL_36;
      objc_msgSend(v6, "constraints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _findConstraintForType(v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "constraints");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _findConstraintForType(v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if ((v17 & 1) == 0)
      {
        v18 = (void *)MEMORY[0x227676638]();
        v19 = a1;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v112 = v21;
          v113 = 2112;
          v114 = v14;
          v115 = 2112;
          v116 = v12;
          v117 = 2112;
          v118 = v6;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Min constraint %@ does not match %@ for %@ changing", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v18);
        v22 = [HMDAccessorySettingConstraintModel alloc];
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v22, "initWithObjectChangeType:uuid:parentUUID:", 1, v23, v24);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "type"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingConstraintModel setType:](v25, "setType:", v26);

        objc_msgSend(v14, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        encodeRootObject();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingConstraintModel setValue:](v25, "setValue:", v28);

        objc_msgSend(v8, "addObject:", v25);
        objc_msgSend(v12, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v30 = [HMDAccessorySettingConstraintModel alloc];
          objc_msgSend(v12, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v30, "initWithObjectChangeType:uuid:parentUUID:", 3, v31, v32);

          objc_msgSend(v8, "addObject:", v33);
        }

      }
      objc_msgSend(v6, "constraints");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      _findConstraintForType(v34, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "constraints");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      _findConstraintForType(v36, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "value");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "value");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqual:", v39);

      if ((v40 & 1) == 0)
      {
        v41 = (void *)MEMORY[0x227676638]();
        v42 = a1;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v112 = v44;
          v113 = 2112;
          v114 = v37;
          v115 = 2112;
          v116 = v35;
          v117 = 2112;
          v118 = v6;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Max constraint %@ does not match %@ for %@ changing", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v41);
        v45 = [HMDAccessorySettingConstraintModel alloc];
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v45, "initWithObjectChangeType:uuid:parentUUID:", 1, v46, v47);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v37, "type"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingConstraintModel setType:](v48, "setType:", v49);

        objc_msgSend(v37, "value");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        encodeRootObject();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingConstraintModel setValue:](v48, "setValue:", v51);

        objc_msgSend(v8, "addObject:", v48);
        objc_msgSend(v35, "identifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          v53 = [HMDAccessorySettingConstraintModel alloc];
          objc_msgSend(v35, "identifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v53, "initWithObjectChangeType:uuid:parentUUID:", 3, v54, v55);

          objc_msgSend(v8, "addObject:", v56);
        }

      }
      objc_msgSend(v6, "constraints");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      _findConstraintForType(v57, 3);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "constraints");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      _findConstraintForType(v59, 3);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "value");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "value");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isEqual:", v62);

      if ((v63 & 1) == 0)
      {
        v64 = (void *)MEMORY[0x227676638]();
        v65 = a1;
        HMFGetOSLogHandle();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v112 = v67;
          v113 = 2112;
          v114 = v60;
          v115 = 2112;
          v116 = v58;
          v117 = 2112;
          v118 = v6;
          _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_INFO, "%{public}@Step constraint %@ does not match %@ for %@ changing", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v64);
        v68 = [HMDAccessorySettingConstraintModel alloc];
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v68, "initWithObjectChangeType:uuid:parentUUID:", 1, v69, v70);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v60, "type"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingConstraintModel setType:](v71, "setType:", v72);

        objc_msgSend(v60, "value");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        encodeRootObject();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingConstraintModel setValue:](v71, "setValue:", v74);

        objc_msgSend(v8, "addObject:", v71);
        objc_msgSend(v58, "identifier");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          v76 = [HMDAccessorySettingConstraintModel alloc];
          objc_msgSend(v58, "identifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v76, "initWithObjectChangeType:uuid:parentUUID:", 3, v77, v78);

          objc_msgSend(v8, "addObject:", v79);
        }

      }
      objc_msgSend(v6, "value");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = HMFEqualObjects();

      if ((v82 & 1) != 0)
        goto LABEL_36;
      objc_msgSend(v6, "identifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "modelForSetting:identifier:parentIdentifier:", v7, v83, v84);
      v85 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v85, "setObjectChangeType:", 2);
      objc_msgSend(v8, "addObject:", v85);
    }

LABEL_36:
    v86 = v8;
    goto LABEL_37;
  }
  v86 = (id)MEMORY[0x24BDBD1A8];
LABEL_37:

  return v86;
}

+ (id)modelForGroup:(id)a3
{
  id v3;
  HMDAccessorySettingGroupModel *v4;
  void *v5;
  void *v6;
  HMDAccessorySettingGroupModel *v7;
  void *v8;

  v3 = a3;
  v4 = [HMDAccessorySettingGroupModel alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v4, "initWithObjectChangeType:uuid:parentUUID:", 1, v5, v6);

  objc_msgSend(v3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySettingGroupModel setName:](v7, "setName:", v8);
  return v7;
}

+ (id)modelsForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelForSetting:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObjectChangeType:", 1);
  objc_msgSend(v6, "addObject:", v7);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_msgSend(v4, "identifier", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "modelWithParentIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setObjectChangeType:", 1);
        objc_msgSend(v6, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v6, "copy");
  return v16;
}

+ (id)modelForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelForSetting:identifier:parentIdentifier:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)modelForSetting:(id)a3 identifier:(id)a4 parentIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDAccessorySettingModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDAccessorySettingModel alloc], "initWithObjectChangeType:uuid:parentUUID:", 0, v8, v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "properties"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setProperties:](v10, "setProperties:", v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setType:](v10, "setType:", v12);

  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setName:](v10, "setName:", v13);

  objc_msgSend(v9, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setValue:](v10, "setValue:", v15);

  v16 = (void *)MEMORY[0x24BDD16E0];
  v17 = objc_msgSend(v9, "configurationVersion");

  objc_msgSend(v16, "numberWithUnsignedInteger:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setConfigurationVersion:](v10, "setConfigurationVersion:", v18);

  return v10;
}

+ (id)modelsForChangedConstraints:(id)a3 fromSetting:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToSet:", v11))
  {
    v12 = objc_msgSend(v7, "isConstraintMergeStrategyReflection");

    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_8;
    }
  }
  else
  {

  }
  v14 = (void *)MEMORY[0x227676638]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v17;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Constraints are not matching with media system", (uint8_t *)&v19, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v7, "modelsForConstraintsUpdate:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v13;
}

+ (id)mergeWithGroupMetadata:(id)a3 group:(id)a4
{
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  HMDAccessorySettingModel *v34;
  void *v35;
  HMDAccessorySettingModel *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t n;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  HMDAccessorySettingGroupModel *v76;
  void *v77;
  HMDAccessorySettingGroupModel *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t ii;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
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
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint8_t v125[128];
  uint8_t buf[4];
  void *v127;
  __int16 v128;
  void *v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v93 = a3;
  v95 = a4;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v127 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Merging with metadata", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v93, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  objc_msgSend(v93, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v119 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
        objc_msgSend(v18, "name", v93);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
    }
    while (v15);
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  objc_msgSend(v95, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
  v96 = v7;
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v115;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v115 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
        objc_msgSend(v12, "allKeys", v93);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "containsObject:", v27);

        if ((v28 & 1) != 0)
        {
          objc_msgSend(v25, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObjectForKey:", v29);
        }
        else
        {
          v30 = (void *)MEMORY[0x227676638]();
          v31 = v96;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v127 = v33;
            v128 = 2112;
            v129 = v25;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Removing setting: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
          v34 = [HMDAccessorySettingModel alloc];
          objc_msgSend(v25, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "parentIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v34, "initWithObjectChangeType:uuid:parentUUID:", 3, v29, v35);
          objc_msgSend(v97, "addObject:", v36);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
      v7 = v96;
    }
    while (v22);
  }

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  objc_msgSend(v12, "allValues");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v111;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v111 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
        v43 = (void *)MEMORY[0x227676638]();
        v44 = v7;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v127 = v46;
          v128 = 2112;
          v129 = v42;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Adding setting: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
        objc_msgSend(v95, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "modelsWithParentIdentifier:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "addObjectsFromArray:", v48);

        v7 = v96;
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
    }
    while (v39);
  }

  v49 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v93, "groups");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "dictionaryWithCapacity:", objc_msgSend(v50, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend(v93, "groups");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v107;
    do
    {
      for (m = 0; m != v54; ++m)
      {
        if (*(_QWORD *)v107 != v55)
          objc_enumerationMutation(v52);
        v57 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * m);
        objc_msgSend(v57, "name", v93);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKey:", v57, v58);

      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
    }
    while (v54);
  }

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  objc_msgSend(v95, "groups");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v102, v123, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v103;
    v94 = v51;
    do
    {
      for (n = 0; n != v61; ++n)
      {
        if (*(_QWORD *)v103 != v62)
          objc_enumerationMutation(v59);
        v64 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * n);
        objc_msgSend(v64, "name", v93);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKey:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          objc_msgSend(v64, "name");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "removeObjectForKey:", v67);

          objc_msgSend(v7, "mergeWithGroupMetadata:group:", v66, v64);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "addObjectsFromArray:", v68);
        }
        else
        {
          v69 = (void *)MEMORY[0x227676638]();
          v70 = v7;
          HMFGetOSLogHandle();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v72 = v61;
            v73 = v62;
            v74 = v59;
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v127 = v75;
            v128 = 2112;
            v129 = v64;
            _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@Removing group: %@", buf, 0x16u);

            v59 = v74;
            v62 = v73;
            v61 = v72;
            v51 = v94;
          }

          objc_autoreleasePoolPop(v69);
          v76 = [HMDAccessorySettingGroupModel alloc];
          objc_msgSend(v64, "identifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "parentIdentifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v76, "initWithObjectChangeType:uuid:parentUUID:", 3, v68, v77);
          objc_msgSend(v97, "addObject:", v78);

          v7 = v96;
        }

      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v102, v123, 16);
    }
    while (v61);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  objc_msgSend(v51, "allValues");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v99;
    do
    {
      for (ii = 0; ii != v81; ++ii)
      {
        if (*(_QWORD *)v99 != v82)
          objc_enumerationMutation(v79);
        v84 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * ii);
        v85 = (void *)MEMORY[0x227676638]();
        v86 = v7;
        HMFGetOSLogHandle();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v127 = v88;
          v128 = 2112;
          v129 = v84;
          _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@Adding group: %@", buf, 0x16u);

          v7 = v96;
        }

        objc_autoreleasePoolPop(v85);
        objc_msgSend(v95, "identifier");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "modelsWithParentIdentifier:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "addObjectsFromArray:", v90);

      }
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
    }
    while (v81);
  }

  v91 = (void *)objc_msgSend(v97, "copy");
  return v91;
}

uint64_t __61__HMDAccessorySettingTransform_modelsForGroupDiff_fromGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __61__HMDAccessorySettingTransform_modelsForGroupDiff_fromGroup___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

@end
