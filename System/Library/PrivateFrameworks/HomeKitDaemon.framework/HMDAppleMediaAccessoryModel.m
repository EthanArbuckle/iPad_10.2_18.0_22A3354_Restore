@implementation HMDAppleMediaAccessoryModel

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDDeviceAddress *v16;
  void *v17;
  void *v18;
  HMDDeviceAddress *v19;
  void *v21;
  HMDDeviceAddress *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqual:", CFSTR("deviceUUID")))
  {
    objc_msgSend(v8, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = (void *)*MEMORY[0x24BDBD430];
    if (v13)
      v15 = (void *)v13;
    v16 = v15;
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("device")))
  {
    objc_msgSend(v8, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceForIdentifier:", v14);
      v16 = (HMDDeviceAddress *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v19 = v16;

LABEL_9:
      goto LABEL_10;
    }
LABEL_16:
    v19 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v9, "isEqual:", CFSTR("deviceAddress")))
  {
    v23.receiver = self;
    v23.super_class = (Class)HMDAppleMediaAccessoryModel;
    -[HMDAccessoryTransaction cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v23, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
    v19 = (HMDDeviceAddress *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v8, "idsIdentifier");
  v19 = (HMDDeviceAddress *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v8, "idsDestination");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = [HMDDeviceAddress alloc];
      objc_msgSend(v8, "idsIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "idsDestination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:](v22, "initWithIDSIdentifier:idsDestination:", v11, v12);
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_10:

  return v19;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDAppleMediaAccessoryModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_128934 != -1)
    dispatch_once(&properties_onceToken_128934, block);
  return (id)properties__properties_128935;
}

void __41__HMDAppleMediaAccessoryModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  _QWORD v85[2];

  v85[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCED8];
  v53.receiver = *(id *)(a1 + 32);
  v53.super_class = (Class)&OBJC_METACLASS___HMDAppleMediaAccessoryModel;
  objc_msgSendSuper2(&v53, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_128935;
  properties__properties_128935 = v3;

  v5 = (void *)properties__properties_128935;
  v84 = CFSTR("deviceUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  v8 = (void *)properties__properties_128935;
  v82 = CFSTR("device");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v10);

  v11 = (void *)properties__properties_128935;
  v80 = CFSTR("pairingIdentity");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v13);

  v14 = (void *)properties__properties_128935;
  v78 = CFSTR("loggedInAccount");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v16);

  v17 = (void *)properties__properties_128935;
  v76 = CFSTR("softwareVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v19);

  v20 = (void *)properties__properties_128935;
  v74 = CFSTR("variant");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addEntriesFromDictionary:", v22);

  v23 = (void *)properties__properties_128935;
  v72 = CFSTR("accessoryCapabilities");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addEntriesFromDictionary:", v25);

  v26 = (void *)properties__properties_128935;
  v70 = CFSTR("deviceAddress");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addEntriesFromDictionary:", v28);

  v29 = (void *)properties__properties_128935;
  v68 = CFSTR("deviceIRKData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addEntriesFromDictionary:", v31);

  v32 = (void *)properties__properties_128935;
  v66 = CFSTR("wifiNetworkInfo");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addEntriesFromDictionary:", v34);

  v35 = (void *)properties__properties_128935;
  v64 = CFSTR("appleMediaAccessoryChangeTag");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addEntriesFromDictionary:", v37);

  v38 = (void *)properties__properties_128935;
  v62 = CFSTR("supportedStereoPairVersions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v39;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addEntriesFromDictionary:", v40);

  v41 = (void *)properties__properties_128935;
  v60 = CFSTR("preferredMediaUserUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addEntriesFromDictionary:", v43);

  v44 = (void *)properties__properties_128935;
  v58 = CFSTR("preferredUserSelectionType");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v45;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addEntriesFromDictionary:", v46);

  v47 = (void *)properties__properties_128935;
  v56 = CFSTR("productColor");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addEntriesFromDictionary:", v49);

  v50 = (void *)properties__properties_128935;
  v54 = CFSTR("idsIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v51;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addEntriesFromDictionary:", v52);

}

@end
