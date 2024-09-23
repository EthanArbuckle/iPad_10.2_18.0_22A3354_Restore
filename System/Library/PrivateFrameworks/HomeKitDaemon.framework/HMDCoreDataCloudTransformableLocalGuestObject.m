@implementation HMDCoreDataCloudTransformableLocalGuestObject

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  +[HMDCoreDataCloudTransformableLocalGuestObject _addGuestForObjectWithID:additionalUpdates:context:]((uint64_t)a1, a3, a4, a5);
  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  +[HMDCoreDataCloudTransformableLocalGuestObject _addGuestForObjectWithID:additionalUpdates:context:]((uint64_t)a1, a3, a5, a6);
  return 1;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (void)_addGuestForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  char v19;
  __int128 v20;
  __CFString *v21;
  __CFString *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  int v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  __CFString *v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id v90;
  NSObject *v91;
  void *v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  __int128 v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  __CFString *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  __CFString *v117;
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  __CFString *v121;
  __int16 v122;
  id v123;
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v10, "isRestrictedGuestEnabled");

  if (!(_DWORD)a3)
    goto LABEL_81;
  v107 = v7;
  +[_MKFGuest entity](_MKFGuest, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "propertiesByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("accessCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v116, 1);
  v110 = objc_claimAutoreleasedReturnValue();

  v108 = v6;
  v14 = v6;
  v109 = v8;
  v112 = v8;
  v106 = (void *)v9;
  v15 = (void *)objc_opt_self();
  v16 = (__CFString *)v14;
  -[__CFString entity](v16, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFGuest entity](_MKFGuest, "entity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isKindOfEntity:", v18);

  v111 = v16;
  if ((v19 & 1) != 0)
  {
LABEL_3:
    v21 = v16;
    v22 = v21;
    goto LABEL_70;
  }
  *(_QWORD *)&v20 = 138543618;
  v105 = v20;
  while (1)
  {
    v21 = v16;
    v23 = v112;
    v24 = (void *)objc_opt_self();
    v115 = 0;
    objc_msgSend(v23, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v21, MEMORY[0x24BDBD1A8], &v115);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v115;
    if (v26)
    {
      v27 = v26;
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v24;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v119 = v31;
        v120 = 2114;
        v121 = v21;
        v122 = 2114;
        v123 = v27;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
LABEL_9:
      v32 = 0;
      goto LABEL_10;
    }
    if (v25)
    {
      v27 = 0;
    }
    else
    {
      v49 = (void *)MEMORY[0x227676638]();
      v50 = v24;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v105;
        v119 = v52;
        v120 = 2114;
        v121 = v21;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@ while searching for its parent", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v49);
      v114 = 0;
      objc_msgSend(v23, "existingObjectWithID:error:", v21, &v114);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v27 = v114;
      if (!v25)
      {
        v72 = (void *)MEMORY[0x227676638]();
        v73 = v50;
        HMFGetOSLogHandle();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v105;
          v119 = v75;
          v120 = 2114;
          v121 = v21;
          _os_log_impl(&dword_2218F0000, v74, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@ using existingObjectWithID API", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v72);
        v25 = 0;
        goto LABEL_9;
      }
    }
    objc_msgSend(v25, "entity", v105);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFWeekDayScheduleRule entity](_MKFWeekDayScheduleRule, "entity");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isKindOfEntity:", v54);

    if (v55)
    {
      v56 = v25;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v57 = v56;
      else
        v57 = 0;
      v58 = v57;

      if (v58)
      {
        objc_msgSend(v58, "invitation");
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = CFSTR("invitation");
        if (v59
          || (objc_msgSend(v58, "guest"),
              v60 = (void *)objc_claimAutoreleasedReturnValue(),
              v60,
              v32 = CFSTR("guest"),
              v60))
        {
LABEL_41:

          v25 = v56;
          goto LABEL_10;
        }
      }

    }
    objc_msgSend(v25, "entity");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFYearDayScheduleRule entity](_MKFYearDayScheduleRule, "entity");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isKindOfEntity:", v62);

    if (v63)
    {
      v56 = v25;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v64 = v56;
      else
        v64 = 0;
      v58 = v64;

      if (v58)
      {
        objc_msgSend(v58, "invitation");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = CFSTR("invitation");
        if (v65)
          goto LABEL_41;
        objc_msgSend(v58, "guest");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = CFSTR("guest");
        if (v66)
          goto LABEL_41;
      }

    }
    objc_msgSend(v25, "entity");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFOutgoingInvitation entity](_MKFOutgoingInvitation, "entity");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v67, "isKindOfEntity:", v68);

    if (!v69)
      goto LABEL_9;
    v25 = v25;
    objc_opt_class();
    v70 = (objc_opt_isKindOfClass() & 1) != 0 ? v25 : 0;
    v71 = v70;

    if (!v71)
      goto LABEL_9;

    v32 = CFSTR("home");
LABEL_10:

    v33 = v32;
    if (!v33)
    {
      v76 = (void *)MEMORY[0x227676638]();
      v77 = v15;
      HMFGetOSLogHandle();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v105;
        v119 = v79;
        v120 = 2114;
        v121 = v21;
        _os_log_impl(&dword_2218F0000, v78, OS_LOG_TYPE_ERROR, "%{public}@No parent pointer found for the objectID: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v76);
      goto LABEL_69;
    }
    v34 = v33;
    v117 = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v117, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0;
    objc_msgSend(v23, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v21, v35, &v113);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v113;

    if (v37)
    {
      v80 = (void *)MEMORY[0x227676638]();
      v81 = v15;
      HMFGetOSLogHandle();
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = v111;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v119 = v84;
        v120 = 2114;
        v121 = v21;
        v122 = 2114;
        v123 = v37;
        _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v80);

      goto LABEL_61;
    }
    if (!v36)
    {
      v85 = (void *)MEMORY[0x227676638]();
      v86 = v15;
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      v83 = v111;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v105;
        v119 = v88;
        v120 = 2114;
        v121 = v21;
        _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v85);
      v37 = 0;
LABEL_61:
      v7 = v107;
      v6 = v108;

      v22 = 0;
      v8 = v109;
      goto LABEL_71;
    }
    objc_msgSend(v36, "valueForKey:", v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
      break;
    v39 = v38;
    objc_opt_class();
    v40 = objc_opt_isKindOfClass() & 1;
    if (v40)
      v41 = v39;
    else
      v41 = 0;
    v42 = v41;

    if (!v40)
    {
      v93 = (void *)MEMORY[0x227676638]();
      v94 = v15;
      HMFGetOSLogHandle();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v119 = v96;
        v120 = 2114;
        v121 = v34;
        v122 = 2112;
        v123 = v36;
        _os_log_impl(&dword_2218F0000, v95, OS_LOG_TYPE_ERROR, "%{public}@Object value for '%{public}@' is not an object: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v93);

      goto LABEL_68;
    }
    objc_msgSend(v39, "objectID");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[__CFString entity](v16, "entity");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFOutgoingInvitation entity](_MKFOutgoingInvitation, "entity");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isKindOfEntity:", v44);

    if ((v45 & 1) == 0)
    {
      -[__CFString entity](v16, "entity");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MKFGuest entity](_MKFGuest, "entity");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isKindOfEntity:", v47);

      if (!v48)
        continue;
    }
    goto LABEL_3;
  }
  v89 = (void *)MEMORY[0x227676638]();
  v90 = v15;
  HMFGetOSLogHandle();
  v91 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v119 = v92;
    v120 = 2114;
    v121 = v34;
    v122 = 2112;
    v123 = v36;
    _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_ERROR, "%{public}@Object has no value for '%{public}@': %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v89);
LABEL_68:

LABEL_69:
  v22 = 0;
LABEL_70:
  v7 = v107;
  v6 = v108;
  v8 = v109;
  v83 = v111;
LABEL_71:

  if (v22)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v22);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v97;
    v99 = (void *)v110;
    if (v97)
    {
      if (objc_msgSend(v97, "count"))
        objc_msgSend(v98, "addObjectsFromArray:", v110);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v110);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v104, v22);

    }
  }
  else
  {
    v100 = (void *)MEMORY[0x227676638]();
    v101 = v106;
    HMFGetOSLogHandle();
    v102 = objc_claimAutoreleasedReturnValue();
    v99 = (void *)v110;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v119 = v103;
      v120 = 2114;
      v121 = v83;
      _os_log_impl(&dword_2218F0000, v102, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find guest for model with objectID %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v100);
  }

LABEL_81:
}

@end
