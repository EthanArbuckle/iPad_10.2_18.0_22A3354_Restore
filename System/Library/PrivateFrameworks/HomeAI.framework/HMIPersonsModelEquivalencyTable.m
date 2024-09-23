@implementation HMIPersonsModelEquivalencyTable

- (HMIPersonsModelEquivalencyTable)initWithPersonsModels:(id)a3 userDefinedPersonLinks:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  HMIPersonsModelEquivalencyTable *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMIPersonsModelEquivalencyTable *v16;
  id v17;
  HMIPersonsModelEquivalencyTable *v18;
  HMIPersonsModelEquivalencyTable *v19;
  uint64_t v20;
  NSDictionary *personToEquivalencyCell;
  _QWORD v23[4];
  HMIPersonsModelEquivalencyTable *v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  HMIPersonsModelEquivalencyTable *v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[4];
  HMIPersonsModelEquivalencyTable *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v9 = a4;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__10;
  v47 = __Block_byref_object_dispose__10;
  v10 = MEMORY[0x24BDAC760];
  v48 = 0;
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke;
  v40[3] = &unk_24DBEE1A0;
  v42 = &v43;
  v11 = self;
  v41 = v11;
  objc_msgSend(v8, "na_dictionaryByMappingValues:", v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)v44[5];
  if (v13)
  {
    v14 = v13;
    v15 = v14;
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    HMIErrorLog(v11, v15);

    v16 = 0;
  }
  else
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__10;
    v38[4] = __Block_byref_object_dispose__10;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__10;
    v36 = __Block_byref_object_dispose__10;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_27;
    v27[3] = &unk_24DBEE218;
    v17 = v12;
    v28 = v17;
    v18 = v11;
    v29 = v18;
    v30 = v38;
    v31 = &v32;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_3;
    v23[3] = &unk_24DBEE2B8;
    v25 = &v32;
    v19 = v18;
    v24 = v19;
    v26 = v38;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v23);
    v20 = objc_msgSend((id)v33[5], "copy");
    personToEquivalencyCell = v19->_personToEquivalencyCell;
    v19->_personToEquivalencyCell = (NSDictionary *)v20;

    v16 = v19;
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(v38, 8);
  }

  _Block_object_dispose(&v43, 8);
  return v16;
}

id __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "visionPersonsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personUniqueIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_2;
  v17 = &unk_24DBEE178;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v18 = v4;
  v21 = v8;
  v19 = v9;
  v20 = v7;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v14);
  v12 = (void *)objc_msgSend(v10, "copy", v14, v15, v16, v17);

  return v12;
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id obj;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "visionPersonsModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v8, "faceObservationsForPersonWithUniqueIdentifier:error:", v6, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    v11 = (void *)MEMORY[0x220735570]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2048;
      v21 = v15;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Number of all face observations: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v16, v7);

  }
  else
  {
    *a4 = 1;
  }

}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "sourceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "sourceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = MEMORY[0x24BDAC760];
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_28;
      v42[3] = &unk_24DBEDA78;
      v43 = *(id *)(a1 + 32);
      v44 = *(id *)(a1 + 40);
      objc_msgSend(v6, "na_filter:", v42);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 32);
        objc_msgSend(v5, "sourceUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "personUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "unionSet:", v23);

        v39[0] = v16;
        v39[1] = 3221225472;
        v39[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_31;
        v39[3] = &unk_24DBEE1C8;
        v40 = v18;
        v41 = *(id *)(a1 + 32);
        v24 = v18;
        objc_msgSend(v6, "na_each:", v39);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v24, v5);
        objc_msgSend(v6, "setByAddingObject:", v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v16;
        v36[1] = 3221225472;
        v36[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_2_33;
        v36[3] = &unk_24DBEE1F0;
        v26 = *(_QWORD *)(a1 + 56);
        v37 = v25;
        v38 = v26;
        v27 = v25;
        objc_msgSend(v27, "na_each:", v36);

      }
      else
      {
        v32 = (void *)MEMORY[0x220735570]();
        v33 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v35;
          v47 = 2112;
          v48 = v5;
          _os_log_impl(&dword_219D45000, v34, OS_LOG_TYPE_ERROR, "%{public}@All links for %@ in userDefinedPersonLinks are invalid", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
      }

      goto LABEL_13;
    }
  }
  else
  {

  }
  v28 = (void *)MEMORY[0x220735570]();
  v29 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v31;
    v47 = 2112;
    v48 = v5;
    _os_log_impl(&dword_219D45000, v30, OS_LOG_TYPE_ERROR, "%{public}@Invalid entry in userDefinedPersonLinks: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
LABEL_13:

}

uint64_t __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "sourceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "personUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v14 = (void *)MEMORY[0x220735570]();
  v15 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v17;
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid entry in userDefinedPersonLinks: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v13 = 0;
LABEL_8:

  return v13;
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "sourceUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v7);

}

uint64_t __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_2_33(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), a2);
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7[2];
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint64_t v11;

  v5 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_4;
  v8[3] = &unk_24DBEE290;
  v9 = v5;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v11 = *(_QWORD *)(a1 + 48);
  v7[0] = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HMIPersonSourceUUIDPair *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMIPersonSourceUUIDPair *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  HMIPersonSourceUUIDPair *v29;
  id v30;
  uint64_t v31;
  _BYTE *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:]([HMIPersonSourceUUIDPair alloc], "initWithPersonUUID:sourceUUID:", v5, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x220735570]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Skipping person who belongs to user defined equivalency cell: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__10;
    v35 = __Block_byref_object_dispose__10;
    v36 = 0;
    v13 = MEMORY[0x24BDAC760];
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_36;
    v27[3] = &unk_24DBEE268;
    v28 = *(id *)(a1 + 40);
    v15 = v7;
    v29 = v15;
    v16 = v6;
    v17 = *(_QWORD *)(a1 + 48);
    v30 = v16;
    v31 = v17;
    v32 = buf;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v27);
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v18, "objectForKeyedSubscript:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setByAddingObjectsFromSet:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v20, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setByAddingObject:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v24[0] = v13;
      v24[1] = 3221225472;
      v24[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_38;
      v24[3] = &unk_24DBEE1F0;
      v26 = *(_QWORD *)(a1 + 48);
      v23 = v22;
      v25 = v23;
      objc_msgSend(v23, "na_each:", v24);

    }
    else
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v15);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v19, v15);
    }

    _Block_object_dispose(buf, 8);
  }

}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_36(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = (void *)MEMORY[0x220735570]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v29 = v13;
    v30 = 2112;
    v31 = v14;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Comparing persons (%@, %@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  if (objc_msgSend(*(id *)(a1 + 32), "facesAreSamePersonFromSet:andSet:", *(_QWORD *)(a1 + 48), v9))
  {
    v15 = (void *)MEMORY[0x220735570]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Equivalency determined between pair: (%@, %@)!", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_37;
    v26[3] = &unk_24DBEE240;
    v27 = *(id *)(a1 + 40);
    objc_msgSend(v20, "na_firstObjectPassingTest:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)MEMORY[0x220735570]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v25;
        v30 = 2112;
        v31 = v21;
        _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Cannot add to matching equivalency cell because it already has entry from this source: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      *a4 = 1;
    }

  }
}

uint64_t __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_37(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sourceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_38(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), a2);
}

- (BOOL)facesAreSamePersonFromSet:(id)a3 andSet:(id)a4
{
  return -[HMIPersonsModelEquivalencyTable facesAreSamePersonFromSet:andSet:distanceThreshold:percentMatchingThreshold:](self, "facesAreSamePersonFromSet:andSet:distanceThreshold:percentMatchingThreshold:", a3, a4, 0.2, 0.1);
}

- (BOOL)facesAreSamePersonFromSet:(id)a3 andSet:(id)a4 distanceThreshold:(double)a5 percentMatchingThreshold:(double)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _QWORD *v21;
  double v22;
  uint64_t v23;
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "count");
  v12 = objc_msgSend(v10, "count");
  v13 = v12 * v11;
  v25 = 0;
  v26 = &v25;
  if ((uint64_t)((double)(v12 * v11) * a6) <= 2)
    v14 = 2;
  else
    v14 = (uint64_t)((double)(v12 * v11) * a6);
  v27 = 0x2020000000;
  v28 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = v13;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __111__HMIPersonsModelEquivalencyTable_facesAreSamePersonFromSet_andSet_distanceThreshold_percentMatchingThreshold___block_invoke;
  v18[3] = &unk_24DBEE308;
  v15 = v10;
  v22 = a5;
  v19 = v15;
  v20 = &v25;
  v23 = v14;
  v21 = v24;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v18);
  v16 = v26[3] >= v14;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __111__HMIPersonsModelEquivalencyTable_facesAreSamePersonFromSet_andSet_distanceThreshold_percentMatchingThreshold___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __111__HMIPersonsModelEquivalencyTable_facesAreSamePersonFromSet_andSet_distanceThreshold_percentMatchingThreshold___block_invoke_2;
  v8[3] = &unk_24DBEE2E0;
  v9 = v5;
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = a3;
  v10 = *(_OWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __111__HMIPersonsModelEquivalencyTable_facesAreSamePersonFromSet_andSet_distanceThreshold_percentMatchingThreshold___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "faceprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptorData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "descriptorData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v8, v10);
  v12 = v11;

  if (*(double *)(a1 + 56) > v12
    && (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24),
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= *(_QWORD *)(a1 + 64))
    || (--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24),
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < *(_QWORD *)(a1 + 64)))
  {
    *a3 = 1;
    **(_BYTE **)(a1 + 72) = 1;
  }
}

- (id)equivalencyCellForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMIPersonsModelEquivalencyTable personToEquivalencyCell](self, "personToEquivalencyCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMIPersonsModelEquivalencyTable)initWith
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMIPersonsModelEquivalencyTable;
  return -[HMIPersonsModelEquivalencyTable init](&v3, sel_init);
}

- (NSDictionary)personToEquivalencyCell
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personToEquivalencyCell, 0);
}

@end
