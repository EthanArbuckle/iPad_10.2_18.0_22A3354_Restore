@implementation HMDCoreDataCloudTransformableLocalHomeObject

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  +[HMDCoreDataCloudTransformableLocalHomeObject _addHomeForObjectWithID:additionalUpdates:context:]((uint64_t)a1, a3, a4, a5);
  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  +[HMDCoreDataCloudTransformableLocalHomeObject _addHomeForObjectWithID:additionalUpdates:context:]((uint64_t)a1, a3, a5, a6);
  return 1;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  +[HMDCoreDataCloudTransformableLocalHomeObject _addHomeForObjectWithID:additionalUpdates:context:]((uint64_t)a1, a3, a5, a6);
  return 1;
}

+ (void)_addHomeForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void **p_vtable;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  int v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  _QWORD v84[3];

  v84[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  objc_msgSend(v6, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFHomeSetting entity](_MKFHomeSetting, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isKindOfEntity:", v11);

  p_vtable = _MKFDurationEvent.vtable;
  v68 = v7;
  v71 = v10;
  if (v12)
  {
    +[_MKFHome entity](_MKFHome, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "propertiesByName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("settings_"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v16;
    v17 = &v77;
  }
  else
  {
    +[_MKFGuestAccessCode entity](_MKFGuestAccessCode, "entity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v10, "isKindOfEntity:", v18);

    if (v19)
    {
      +[_MKFHome entity](_MKFHome, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "propertiesByName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("guestAccessCodes_"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v16;
      v17 = &v76;
    }
    else
    {
      +[_MKFRemovedUserAccessCode entity](_MKFRemovedUserAccessCode, "entity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v10, "isKindOfEntity:", v20);

      if (!v21)
      {
        v70 = MEMORY[0x24BDBD1A8];
        goto LABEL_8;
      }
      +[_MKFHome entity](_MKFHome, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "propertiesByName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("removedAccessCodes_"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v16;
      v17 = &v75;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v70 = objc_claimAutoreleasedReturnValue();

LABEL_8:
  v22 = v6;
  v73 = v8;
  v67 = (void *)v9;
  v72 = (void *)objc_opt_self();
  v23 = v22;
  v69 = v23;
  while (1)
  {
    objc_msgSend(v23, "entity", v66);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_vtable + 22, "entity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isKindOfEntity:", v25);

    if ((v26 & 1) != 0)
      break;
    objc_msgSend(v23, "entity");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      do
      {
        objc_msgSend(v28, "userInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("parent"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          break;
        objc_msgSend(v28, "superentity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v30;
      }
      while (v30);

    }
    else
    {
      v30 = 0;
    }
    v84[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0;
    objc_msgSend(v73, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v23, v31, &v74);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v74;

    if (v33)
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = v72;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v79 = v37;
        v80 = 2114;
        v81 = v23;
        v82 = 2114;
        v83 = v33;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      if (v32)
      {
        objc_msgSend(v32, "valueForKey:", v30);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
        {
          v41 = v39;
          objc_opt_class();
          v42 = objc_opt_isKindOfClass() & 1;
          if (v42)
            v43 = v41;
          else
            v43 = 0;
          v44 = v43;

          if (v42)
          {
            objc_msgSend(v41, "objectID");
            v45 = objc_claimAutoreleasedReturnValue();

            v38 = 0;
            v23 = (id)v45;
          }
          else
          {
            v53 = (void *)MEMORY[0x227676638]();
            v54 = v72;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v66 = v53;
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v79 = v56;
              v80 = 2114;
              v81 = v30;
              v82 = 2112;
              v83 = v32;
              _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Object value for '%{public}@' is not an object: %@", buf, 0x20u);

              v53 = v66;
            }

            objc_autoreleasePoolPop(v53);
            v38 = 1;
          }

        }
        else
        {
          v49 = (void *)MEMORY[0x227676638]();
          v50 = v72;
          HMFGetOSLogHandle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v79 = v52;
            v80 = 2114;
            v81 = v30;
            v82 = 2112;
            v83 = v32;
            _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Object has no value for '%{public}@': %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v49);
          v38 = 1;
        }

        p_vtable = (void **)(_MKFDurationEvent + 24);
        goto LABEL_39;
      }
      v34 = (void *)MEMORY[0x227676638]();
      v46 = v72;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v48;
        v80 = 2114;
        v81 = v23;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@", buf, 0x16u);

      }
    }
    objc_autoreleasePoolPop(v34);
    v38 = 1;
LABEL_39:

    if (v38)
    {
      v57 = 0;
      goto LABEL_42;
    }
  }
  v23 = v23;
  v57 = v23;
LABEL_42:

  if (v57)
  {
    objc_msgSend(v68, "objectForKeyedSubscript:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    v60 = (void *)v70;
    if (v58)
    {
      if (objc_msgSend(v58, "count"))
        objc_msgSend(v59, "addObjectsFromArray:", v70);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v70);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v65, v57);

    }
  }
  else
  {
    v61 = (void *)MEMORY[0x227676638]();
    v62 = v67;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v70;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v64;
      v80 = 2114;
      v81 = v69;
      _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find home for model with objectID %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v61);
  }

}

@end
