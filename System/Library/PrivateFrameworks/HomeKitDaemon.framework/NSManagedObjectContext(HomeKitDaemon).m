@implementation NSManagedObjectContext(HomeKitDaemon)

- (id)hmd_homeUUID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HMDHomeUUIDFromWorkingContextName(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hmd_transactionAuthor
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "transactionAuthor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreDataContextTransactionAuthor contextAuthorWithString:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "type");
  return v3;
}

- (uint64_t)hmd_saveWithTransactionAuthor:()HomeKitDaemon error:
{
  return objc_msgSend(a1, "hmd_saveWithTransactionAuthor:clientIdentifier:allowQoSEscalation:error:", a3, 0, 0, a4);
}

- (uint64_t)hmd_saveWithTransactionAuthor:()HomeKitDaemon clientIdentifier:allowQoSEscalation:error:
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  HMDLogEventCoreDataSignificantEvent *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _QWORD *v39;
  void *v40;
  void *v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = v10;
  if (a5)
  {
    v12 = v10;
    if (v12)
    {
      v13 = v12;
      v14 = a6;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple"), *MEMORY[0x24BDD5C08]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", v15) & 1) != 0)
      {
LABEL_8:

LABEL_9:
        v17 = (void *)MEMORY[0x227676638]();
        v18 = a1;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v20;
          v52 = 2112;
          v53 = v13;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Bumping sync QoS because changes were performed on behalf of owner from client: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:clientIdentifier:qualityOfService:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:clientIdentifier:qualityOfService:", a3, v13, 25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple"), *MEMORY[0x24BDD69E8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", v16) & 1) != 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple"), *MEMORY[0x24BDD6F78]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:") & 1) != 0)
      {
LABEL_6:

        goto LABEL_7;
      }
      if (isInternalBuild())
      {
        v45 = *MEMORY[0x24BDD5C00];
        if ((objc_msgSend(v13, "isEqualToString:") & 1) != 0)
          goto LABEL_6;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple"), v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:") & 1) != 0
          || (v44 = *MEMORY[0x24BDD6F80], (objc_msgSend(v13, "isEqualToString:") & 1) != 0))
        {

          goto LABEL_6;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple"), v44);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v13, "isEqualToString:", v42);

        a6 = v14;
        if ((v43 & 1) != 0)
          goto LABEL_9;
      }
      else
      {

      }
    }
  }
  v22 = (void *)MEMORY[0x227676638]();
  v23 = a1;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v25;
    v52 = 2112;
    v53 = v26;
    v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Not escalating QoS due to allowQoSEscalation=%@, clientIdentifier=%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v22);
  +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:clientIdentifier:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:clientIdentifier:", a3, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
  v27 = v21;
  objc_msgSend(v21, "string");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!a3 || (v29 = (void *)v28) == 0)
    _HMFPreconditionFailure();
  objc_msgSend(a1, "transactionAuthor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTransactionAuthor:", v29);
  v49 = 0;
  v31 = objc_msgSend(a1, "save:", &v49);
  v32 = v49;
  objc_msgSend(a1, "setTransactionAuthor:", v30);
  if ((v31 & 1) == 0)
  {
    if (a3 != 2)
    {
      v33 = -[HMDLogEventCoreDataSignificantEvent initWithReason:author:]([HMDLogEventCoreDataSignificantEvent alloc], "initWithReason:author:", 2, a3);
      objc_msgSend(v32, "description");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLogEventCoreDataSignificantEvent setExtraContext:](v33, "setExtraContext:", v34);

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "submitLogEvent:", v33);

    }
    v36 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = v11;
      v39 = a6;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v40;
      v52 = 2112;
      v53 = v32;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to save changes: %@", buf, 0x16u);

      a6 = v39;
      v11 = v48;
    }

    objc_autoreleasePoolPop(v36);
    if (a6)
    {
      HMDSanitizeCoreDataError(v32);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v31;
}

- (id)hmd_fetchExistingObjectWithID:()HomeKitDaemon propertiesToFetch:error:
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = (objc_class *)MEMORY[0x24BDBB678];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(v10, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithEntityName:", v13);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self == %@"), v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPredicate:", v15);
  objc_msgSend(v14, "setPropertiesToFetch:", v9);

  objc_msgSend(a1, "executeFetchRequest:error:", v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)hmd_fetchExistingObjectWithID:()HomeKitDaemon propertiesToFetch:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  objc_msgSend(a1, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v6, v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

  return v8;
}

- (void)hmd_logPendingChangesWithReason:()HomeKitDaemon
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = v5;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "transactionAuthor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v26 = v10;
    v27 = 2114;
    v28 = a1;
    v29 = 2114;
    v30 = v11;
    v31 = 2114;
    v32 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@%{public}@ (%{public}@) - %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(a1, "insertedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke;
  v23[3] = &unk_24E78AB28;
  v14 = v8;
  v24 = v14;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);

  objc_msgSend(a1, "updatedObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke_24;
  v21[3] = &unk_24E78AB28;
  v16 = v14;
  v22 = v16;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);

  objc_msgSend(a1, "deletedObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke_27;
  v19[3] = &unk_24E78AB28;
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);

  objc_autoreleasePoolPop(v6);
}

@end
