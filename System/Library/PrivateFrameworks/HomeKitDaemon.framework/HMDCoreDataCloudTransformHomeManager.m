@implementation HMDCoreDataCloudTransformHomeManager

+ (id)fixUpPrimaryHomeCounterForPrimaryHome:(id)a3 primaryHomeModelID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__218898;
  v24 = __Block_byref_object_dispose__218899;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __97__HMDCoreDataCloudTransformHomeManager_fixUpPrimaryHomeCounterForPrimaryHome_primaryHomeModelID___block_invoke;
  v12[3] = &unk_24E7942F0;
  v7 = v6;
  v13 = v7;
  v14 = &v20;
  v15 = &v16;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);
  v8 = (void *)v21[5];
  if (v8)
  {
    v9 = v17[3];
    if (v9 != objc_msgSend(v8, "primaryHomeCounter"))
      objc_msgSend((id)v21[5], "setPrimaryHomeCounter:", v17[3]);
    v10 = (id)v21[5];
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return +[HMDCoreDataCloudTransformHomeManager _exportUpdateWithObjectID:updateApplicationData:context:]((uint64_t)a1, a3, 1, a5);
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  char v15;
  _QWORD v17[4];
  __CFString *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (objc_msgSend(v11, "count"))
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __109__HMDCoreDataCloudTransformHomeManager_exportUpdateWithObjectID_updatedProperties_additionalUpdates_context___block_invoke;
    v17[3] = &unk_24E798868;
    v18 = CFSTR("appDataDictionary");
    v19 = &v20;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

    v14 = *((_BYTE *)v21 + 24) != 0;
  }
  else
  {
    v14 = 1;
    *((_BYTE *)v21 + 24) = 1;
  }
  v15 = +[HMDCoreDataCloudTransformHomeManager _exportUpdateWithObjectID:updateApplicationData:context:]((uint64_t)a1, v10, v14, v13);
  _Block_object_dispose(&v20, 8);

  return v15;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDBCE88];
  v15 = *MEMORY[0x24BDBCAB0];
  v16 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ is unavailable"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v18, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v19);
}

void __109__HMDCoreDataCloudTransformHomeManager_exportUpdateWithObjectID_updatedProperties_additionalUpdates_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (uint64_t)_exportUpdateWithObjectID:(int)a3 updateApplicationData:(void *)a4 context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _BYTE *v54;
  uint64_t *v55;
  void *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  id v61;
  _QWORD v62[4];
  id v63;
  uint8_t v64[4];
  void *v65;
  __int16 v66;
  id v67;
  const __CFString *v68;
  _BYTE buf[24];
  char v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a4;
  v7 = (void *)objc_opt_self();
  v48 = v5;
  objc_msgSend(v6, "objectWithID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "homes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "homes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __96__HMDCoreDataCloudTransformHomeManager__exportUpdateWithObjectID_updateApplicationData_context___block_invoke;
  v62[3] = &unk_24E794318;
  v49 = v11;
  v63 = v49;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v62);

  +[MKFCKHome fetchRequest](MKFCKHome, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchBatchSize:", 2);
  v61 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v14, &v61);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v61;
  if (v15)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v70 = 1;
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    v51[0] = v13;
    v51[1] = 3221225472;
    v51[2] = __96__HMDCoreDataCloudTransformHomeManager__exportUpdateWithObjectID_updateApplicationData_context___block_invoke_3;
    v51[3] = &unk_24E794340;
    v52 = v49;
    v56 = v7;
    v17 = v6;
    v53 = v17;
    v54 = buf;
    v55 = &v57;
    objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v51);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      if (*((_BYTE *)v58 + 24))
      {
        +[MKFCKModel defaultPreloadedProperties](MKFCKHome, "defaultPreloadedProperties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = CFSTR("primaryHomeCounter");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPropertiesToFetch:", v20);

        v50 = v16;
        objc_msgSend(v17, "executeFetchRequest:error:", v14, &v50);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v50;

        if (!v21)
        {
          v42 = (void *)MEMORY[0x227676638]();
          v43 = v7;
          HMFGetOSLogHandle();
          v44 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v64 = 138543618;
            v65 = v45;
            v66 = 2114;
            v67 = v22;
            _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", v64, 0x16u);

          }
          objc_autoreleasePoolPop(v42);
          v15 = 0;
          v37 = 0;
          v16 = v22;
          goto LABEL_21;
        }
        v15 = (void *)v21;
        v16 = v22;
      }
      v23 = (void *)objc_opt_class();
      objc_msgSend(v8, "primaryHome");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "homeUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fixUpPrimaryHomeCounterForPrimaryHome:primaryHomeModelID:", v15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        if (a3)
        {
          objc_msgSend(v8, "appDataDictionary");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "homeManagerApplicationData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = isEqualDeepCompare(v28, v29);

          if ((v30 & 1) == 0)
          {
            objc_msgSend(v8, "appDataDictionary");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v31, "copy");
            objc_msgSend(v27, "setHomeManagerApplicationData:", v32);

          }
        }
      }
      else
      {
        v38 = (void *)MEMORY[0x227676638]();
        v39 = v7;
        HMFGetOSLogHandle();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v64 = 138543362;
          v65 = v41;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@No primary home", v64, 0xCu);

        }
        objc_autoreleasePoolPop(v38);
      }

      v37 = 1;
    }
    else
    {
      v37 = 0;
    }
LABEL_21:

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_22;
  }
  v33 = (void *)MEMORY[0x227676638]();
  v34 = v7;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v33);
  v37 = 0;
LABEL_22:

  return v37;
}

void __96__HMDCoreDataCloudTransformHomeManager__exportUpdateWithObjectID_updateApplicationData_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "handle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __96__HMDCoreDataCloudTransformHomeManager__exportUpdateWithObjectID_updateApplicationData_context___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if ((objc_msgSend(v6, "isFake") & 1) == 0 && (objc_msgSend(v6, "isDeleted") & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "modelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "containsObject:", v8);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v6, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "entity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[HMDCoreDataCloudTransform importTransformableClassFromEntity:](HMDCoreDataCloudTransform, "importTransformableClassFromEntity:", v10);

      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[objc_class importInsertWithObjectID:additionalUpdates:context:](v11, "importInsertWithObjectID:additionalUpdates:context:", v9, v12, *(_QWORD *)(a1 + 40)) & 1) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          *a4 = 1;
        }

      }
      else
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = *(id *)(a1 + 64);
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "hmd_debugIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v16;
          v20 = 2112;
          v21 = v17;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_FAULT, "%{public}@No transformable for object: <%@>", (uint8_t *)&v18, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
      }

    }
  }

}

void __97__HMDCoreDataCloudTransformHomeManager_fixUpPrimaryHomeCounterForPrimaryHome_primaryHomeModelID___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", a1[4]);

  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    if (objc_msgSend(v13, "primaryHomeCounter"))
    {
      v6 = objc_msgSend(v13, "primaryHomeCounter");
      v7 = *(_QWORD *)(a1[6] + 8);
      v8 = *(_QWORD *)(v7 + 24);
      if (v6 > v8)
      {
        v9 = objc_msgSend(v13, "primaryHomeCounter");
        goto LABEL_8;
      }
    }
    else
    {
      v7 = *(_QWORD *)(a1[6] + 8);
      v8 = *(_QWORD *)(v7 + 24);
    }
    v11 = v13;
    *(_QWORD *)(v7 + 24) = v8 + 1;
    goto LABEL_12;
  }
  v10 = objc_msgSend(v13, "primaryHomeCounter") < *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v11 = v13;
  if (!v10)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    v9 = objc_msgSend(v13, "primaryHomeCounter");
    if (v12)
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v9 + 1;
LABEL_9:
      v11 = v13;
      goto LABEL_12;
    }
LABEL_8:
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
    goto LABEL_9;
  }
LABEL_12:

}

@end
