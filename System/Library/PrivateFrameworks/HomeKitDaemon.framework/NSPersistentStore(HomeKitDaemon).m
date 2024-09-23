@implementation NSPersistentStore(HomeKitDaemon)

- (BOOL)hmd_modelWasDeletedWithID:()HomeKitDaemon modelIDKey:entity:duration:context:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  _BOOL8 v23;
  void *v25;
  void *context;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v16 = (void *)MEMORY[0x227676638]();
  v31 = 0;
  -[NSPersistentStore _deleteChangesWithDuration:entity:context:error:]((uint64_t)a1, v14, v15, (uint64_t)&v31, a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v31;
  if (v17)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __97__NSPersistentStore_HomeKitDaemon__hmd_modelWasDeletedWithID_modelIDKey_entity_duration_context___block_invoke;
    v27[3] = &unk_24E77D330;
    v28 = v13;
    v29 = v12;
    v30 = &v32;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);

  }
  else
  {
    context = (void *)MEMORY[0x227676638]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v25 = v16;
      HMFGetLogIdentifier();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v37 = v21;
      v38 = 2112;
      v39 = v22;
      v40 = 2112;
      v41 = v12;
      v42 = 2112;
      v43 = v18;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Couldn't determine if <%@: %@> was previously deleted: %@", buf, 0x2Au);

      v16 = v25;
    }

    objc_autoreleasePoolPop(context);
  }

  objc_autoreleasePoolPop(v16);
  if (v17)
    v23 = *((_BYTE *)v33 + 24) != 0;
  else
    v23 = 0;
  _Block_object_dispose(&v32, 8);

  return v23;
}

- (id)hmd_deletedModelIDsForEntity:()HomeKitDaemon modelIDKey:duration:context:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x227676638]();
  v27 = 0;
  -[NSPersistentStore _deleteChangesWithDuration:entity:context:error:]((uint64_t)a1, v10, v12, (uint64_t)&v27, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v14, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __93__NSPersistentStore_HomeKitDaemon__hmd_deletedModelIDsForEntity_modelIDKey_duration_context___block_invoke;
    v24[3] = &unk_24E791FE8;
    v25 = v11;
    v17 = v16;
    v26 = v17;
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);

    objc_autoreleasePoolPop(v13);
    v18 = (void *)objc_msgSend(v17, "copy");

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Deletion history request failed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);

    objc_autoreleasePoolPop(v13);
    v18 = 0;
  }

  return v18;
}

- (id)hmd_tombstonesForEntity:()HomeKitDaemon duration:context:error:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x227676638]();
  v24 = 0;
  -[NSPersistentStore _deleteChangesWithDuration:entity:context:error:](a1, v10, v11, (uint64_t)&v24, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v24;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __83__NSPersistentStore_HomeKitDaemon__hmd_tombstonesForEntity_duration_context_error___block_invoke;
    v22 = &unk_24E77D358;
    v16 = v15;
    v23 = v16;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v19);

  }
  else
  {
    v16 = 0;
  }

  objc_autoreleasePoolPop(v12);
  if (a6)
    *a6 = objc_retainAutorelease(v14);
  v17 = (void *)objc_msgSend(v16, "copy", v19, v20, v21, v22);

  return v17;
}

@end
