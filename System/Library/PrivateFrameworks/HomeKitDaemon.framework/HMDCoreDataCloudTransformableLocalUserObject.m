@implementation HMDCoreDataCloudTransformableLocalUserObject

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  +[HMDCoreDataCloudTransformableLocalUserObject _addUserForObjectWithID:additionalUpdates:context:]((uint64_t)a1, a3, a4, a5);
  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  +[HMDCoreDataCloudTransformableLocalUserObject _addUserForObjectWithID:additionalUpdates:context:]((uint64_t)a1, a3, a5, a6);
  return 1;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  +[HMDCoreDataCloudTransformableLocalUserObject _addUserForObjectWithID:additionalUpdates:context:]((uint64_t)a1, a3, a5, a6);
  return 1;
}

+ (void)_addUserForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  char v20;
  __int128 v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint32_t v35;
  __CFString *v36;
  __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  id v44;
  char isKindOfClass;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  int v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  __int128 v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  __CFString *v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  __CFString *v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  objc_msgSend(v6, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFUserAccessCode entity](_MKFUserAccessCode, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isKindOfEntity:", v11);

  v93 = v10;
  v94 = v7;
  if (v12)
  {
    +[_MKFUser entity](_MKFUser, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertiesByName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("accessCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v99, 1);
    v92 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v92 = MEMORY[0x24BDBD1A8];
  }
  v16 = v6;
  v96 = v8;
  v91 = (void *)v9;
  v95 = (void *)objc_opt_self();
  v17 = (__CFString *)v16;
  -[__CFString entity](v17, "entity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFUser entity](_MKFUser, "entity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isKindOfEntity:", v19);

  v22 = v17;
  if ((v20 & 1) != 0)
  {
LABEL_5:
    v23 = v22;
    v24 = v23;
    goto LABEL_56;
  }
  *(_QWORD *)&v21 = 138543618;
  v90 = v21;
  v22 = v17;
  while (1)
  {
    v23 = v22;
    v25 = v96;
    v26 = (void *)objc_opt_self();
    v98 = 0;
    objc_msgSend(v25, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v23, MEMORY[0x24BDBD1A8], &v98);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v98;
    if (v28)
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = v26;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        objc_autoreleasePoolPop(v29);
LABEL_12:
        v36 = 0;
        goto LABEL_13;
      }
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v102 = v32;
      v103 = 2114;
      v104 = v23;
      v105 = 2114;
      v106 = v28;
      v33 = v31;
      v34 = "%{public}@Failed to fetch object with objectID %{public}@: %{public}@";
      v35 = 32;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, v34, buf, v35);

      goto LABEL_11;
    }
    if (!v27)
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = v26;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v90;
      v102 = v32;
      v103 = 2114;
      v104 = v23;
      v33 = v31;
      v34 = "%{public}@Couldn't find object with objectID %{public}@";
      v35 = 22;
      goto LABEL_10;
    }
    objc_msgSend(v27, "entity");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFUserAccessCode entity](_MKFUserAccessCode, "entity");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isKindOfEntity:", v42);

    if (!v43)
      goto LABEL_12;
    v44 = v27;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v46 = v44;
    else
      v46 = 0;
    v47 = v46;

    if ((isKindOfClass & 1) == 0)
      goto LABEL_41;
    objc_msgSend(v44, "user");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = CFSTR("user");
    if (!v48)
    {
      objc_msgSend(v44, "guest");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = CFSTR("guest");
      if (!v49)
      {
LABEL_41:

        goto LABEL_12;
      }
    }

LABEL_13:
    v37 = v36;
    if (!v37)
    {
      -[__CFString entity](v23, "entity");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v39 = (void *)v38;
        do
        {
          objc_msgSend(v39, "userInfo", v90);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("parent"));
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v37)
            break;
          objc_msgSend(v39, "superentity");
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v39 = v37;
        }
        while (v37);

      }
      else
      {
        v37 = 0;
      }
    }
    v100 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v100, 1, v90);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0;
    objc_msgSend(v25, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v23, v50, &v97);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v97;

    if (v52)
    {
      v64 = (void *)MEMORY[0x227676638]();
      v65 = v95;
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v102 = v67;
        v103 = 2114;
        v104 = v23;
        v105 = 2114;
        v106 = v52;
        _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v64);

      v69 = v93;
      v68 = v94;
      v70 = (void *)v92;
      goto LABEL_48;
    }
    if (!v51)
    {
      v71 = (void *)MEMORY[0x227676638]();
      v72 = v95;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      v69 = v93;
      v68 = v94;
      v70 = (void *)v92;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v90;
        v102 = v74;
        v103 = 2114;
        v104 = v23;
        _os_log_impl(&dword_2218F0000, v73, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v71);
      v52 = 0;
LABEL_48:

      v24 = 0;
      goto LABEL_57;
    }
    objc_msgSend(v51, "valueForKey:", v37);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v53)
      break;
    v54 = v53;
    objc_opt_class();
    v55 = objc_opt_isKindOfClass() & 1;
    if (v55)
      v56 = v54;
    else
      v56 = 0;
    v57 = v56;

    if (!v55)
    {
      v79 = (void *)MEMORY[0x227676638]();
      v80 = v95;
      HMFGetOSLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v102 = v82;
        v103 = 2114;
        v104 = v37;
        v105 = 2112;
        v106 = v51;
        _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_ERROR, "%{public}@Object value for '%{public}@' is not an object: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v79);

      goto LABEL_55;
    }
    objc_msgSend(v54, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[__CFString entity](v17, "entity");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFUserAccessCode entity](_MKFUserAccessCode, "entity");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isKindOfEntity:", v59);

    if ((v60 & 1) == 0)
    {
      objc_msgSend(v22, "entity");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MKFUser entity](_MKFUser, "entity");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isKindOfEntity:", v62);

      if (!v63)
        continue;
    }
    goto LABEL_5;
  }
  v75 = (void *)MEMORY[0x227676638]();
  v76 = v95;
  HMFGetOSLogHandle();
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v102 = v78;
    v103 = 2114;
    v104 = v37;
    v105 = 2112;
    v106 = v51;
    _os_log_impl(&dword_2218F0000, v77, OS_LOG_TYPE_ERROR, "%{public}@Object has no value for '%{public}@': %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v75);
LABEL_55:

  v24 = 0;
LABEL_56:
  v69 = v93;
  v68 = v94;
  v70 = (void *)v92;
LABEL_57:

  if (v24)
  {
    objc_msgSend(v68, "objectForKeyedSubscript:", v24);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v83;
    if (v83)
    {
      if (objc_msgSend(v83, "count"))
        objc_msgSend(v84, "addObjectsFromArray:", v70);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v70);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v89, v24);

    }
  }
  else
  {
    v85 = (void *)MEMORY[0x227676638]();
    v86 = v91;
    HMFGetOSLogHandle();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v102 = v88;
      v103 = 2114;
      v104 = v17;
      _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find user for model with objectID %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v85);
  }

}

@end
