@implementation PFCloudKitOptionsValidator

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitOptionsValidator;
  -[PFCloudKitOptionsValidator dealloc](&v3, sel_dealloc);
}

- (BOOL)validateOptions:(void *)a3 andStoreOptions:(uint64_t *)a4 error:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t *v34;
  void *v35;
  objc_class *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  objc_class *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  objc_class *v77;
  void *v78;
  uint64_t *v79;
  uint64_t *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  objc_class *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint8_t buf[4];
  const char *v106;
  __int16 v107;
  int v108;
  uint64_t v109;
  const __CFString *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD v114[2];

  v114[1] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v7 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v8 = 9;
  else
    v8 = __ckLoggingOverride;
  v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Validating options: %@\nstoreOptions: %@"));
  v103 = a2;
  v104 = a3;
  _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[PFCloudKitOptionsValidator validateOptions:andStoreOptions:error:]");
  objc_autoreleasePoolPop(v7);
  v16 = (void *)objc_msgSend(a2, "containerIdentifier");
  if (!v16)
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB28A8];
    v109 = *MEMORY[0x1E0CB2D68];
    v110 = CFSTR("A container identifier is required for the CloudKit integration.");
    v32 = (void *)MEMORY[0x1E0C99D80];
    v33 = (uint64_t *)&v110;
    v34 = &v109;
    goto LABEL_21;
  }
  v17 = v16;
  if (!objc_msgSend(v16, "isNSString"))
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB28A8];
    v111 = *MEMORY[0x1E0CB2D68];
    v35 = (void *)MEMORY[0x1E0CB3940];
    v36 = (objc_class *)objc_opt_class();
    v112 = objc_msgSend(v35, "stringWithFormat:", CFSTR("NSCloudKitMirroringDelegateOptions.containerIdentifier only accepts values of type '%@'. The following is not a valid value:\n%@"), NSStringFromClass(v36), v17, v103, v104);
    v32 = (void *)MEMORY[0x1E0C99D80];
    v33 = &v112;
    v34 = &v111;
    goto LABEL_21;
  }
  if (!objc_msgSend(v17, "length"))
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB28A8];
    v113 = *MEMORY[0x1E0CB2D68];
    v114[0] = CFSTR("NSCloudKitMirroringDelegateOptions.containerIdentifier requires a value with a length greather than 0");
    v32 = (void *)MEMORY[0x1E0C99D80];
    v33 = v114;
    v34 = &v113;
LABEL_21:
    v37 = objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 134060, objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, 1));
    if (v37)
      goto LABEL_23;
    v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    v107 = 1024;
    v108 = 87;
    goto LABEL_38;
  }
  if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")))
  {
    v54 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB28A8];
    v113 = *MEMORY[0x1E0CB2D68];
    v114[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is required for the CloudKit integration."), CFSTR("NSPersistentHistoryTrackingKey"), 36, v103, v104);
    v37 = objc_msgSend(v54, "errorWithDomain:code:userInfo:", v55, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1));
    if (v37)
      goto LABEL_23;
    v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    v107 = 1024;
    v108 = 105;
    goto LABEL_38;
  }
  v18 = objc_msgSend(a2, "containerOptions");
  if (v18)
  {
    v19 = v18;
    getCloudKitCKContainerOptionsClass[0]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v63 = (void *)MEMORY[0x1E0CB35C8];
      v64 = *MEMORY[0x1E0CB28A8];
      v113 = *MEMORY[0x1E0CB2D68];
      v65 = (void *)MEMORY[0x1E0CB3940];
      getCloudKitCKContainerOptionsClass[0]();
      v66 = (objc_class *)objc_opt_class();
      v114[0] = objc_msgSend(v65, "stringWithFormat:", CFSTR("NSCloudKitMirroringDelegateOptions.containerOptions only accepts values of type '%@'. The following is not a valid value:\n%@"), NSStringFromClass(v66), v19, v103, v104);
      v37 = objc_msgSend(v63, "errorWithDomain:code:userInfo:", v64, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1));
      if (v37)
        goto LABEL_23;
      v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v67, v68, v69, v70, v71, v72, v73, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
      v45 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 136315394;
      v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
      v107 = 1024;
      v108 = 132;
      goto LABEL_38;
    }
  }
  v20 = (void *)objc_msgSend(a2, "ckAssetThresholdBytes");
  if (v20)
  {
    v21 = v20;
    if (objc_msgSend(v20, "isNSNumber"))
    {
      if (objc_msgSend(v21, "integerValue") > 99)
        goto LABEL_14;
      v74 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB28A8];
      v113 = *MEMORY[0x1E0CB2D68];
      v114[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The value for 'NSCloudKitMirroringDelegateOptions.ckAssetThresholdBytes' must be at least %@ bytes. The following value is invalid: %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 100), v21, v103, v104);
      v78 = (void *)MEMORY[0x1E0C99D80];
      v79 = v114;
      v80 = &v113;
    }
    else
    {
      v74 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB28A8];
      v111 = *MEMORY[0x1E0CB2D68];
      v76 = (void *)MEMORY[0x1E0CB3940];
      v77 = (objc_class *)objc_opt_class();
      v112 = objc_msgSend(v76, "stringWithFormat:", CFSTR("The value for 'NSCloudKitMirroringDelegateOptions.ckAssetThresholdBytes' must be an instance of '%@'. The following value is invalid: %@"), NSStringFromClass(v77), v21, v103, v104);
      v78 = (void *)MEMORY[0x1E0C99D80];
      v79 = &v112;
      v80 = &v111;
    }
    v37 = objc_msgSend(v74, "errorWithDomain:code:userInfo:", v75, 134060, objc_msgSend(v78, "dictionaryWithObjects:forKeys:count:", v79, v80, 1));
    if (v37)
      goto LABEL_23;
    v85 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v85, v86, v87, v88, v89, v90, v91, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    v107 = 1024;
    v108 = 162;
    goto LABEL_38;
  }
LABEL_14:
  v22 = (void *)objc_msgSend(a2, "operationMemoryThresholdBytes");
  if (!v22)
    return 1;
  v23 = v22;
  if (objc_msgSend(v22, "isNSNumber"))
  {
    v24 = objc_msgSend(&unk_1E1F4B708, "longLongValue");
    if (objc_msgSend(v23, "longLongValue") < v24)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB28A8];
      v111 = *MEMORY[0x1E0CB2D68];
      v112 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The value for 'NSCloudKitMirroringDelegateOptions.operationMemoryThresholdBytes' must be at least %@ bytes. The following value is invalid: %@"), &unk_1E1F4B708, v23, v103, v104);
      v27 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
      v28 = v25;
      v29 = v26;
      goto LABEL_47;
    }
    v92 = objc_msgSend(v23, "longLongValue");
    if (v92 > objc_msgSend((id)objc_msgSend(a2, "ckAssetThresholdBytes"), "longLongValue"))
      return 1;
    v93 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The value for 'NSCloudKitMirroringDelegateOptions.operationMemoryThresholdBytes', %@, must be larger than the value of 'NSCloudKitMirroringDelegateOptions.ckAssetThresholdBytes', %@."), v23, objc_msgSend(a2, "ckAssetThresholdBytes"), a2, v104);
    v94 = (void *)MEMORY[0x1E0CB35C8];
    v95 = *MEMORY[0x1E0CB28A8];
    v113 = *MEMORY[0x1E0CB2D68];
    v114[0] = v93;
    v27 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1);
    v28 = v94;
    v29 = v95;
  }
  else
  {
    v81 = (void *)MEMORY[0x1E0CB35C8];
    v82 = *MEMORY[0x1E0CB28A8];
    v109 = *MEMORY[0x1E0CB2D68];
    v83 = (void *)MEMORY[0x1E0CB3940];
    v84 = (objc_class *)objc_opt_class();
    v110 = (const __CFString *)objc_msgSend(v83, "stringWithFormat:", CFSTR("The value for 'NSCloudKitMirroringDelegateOptions.operationMemoryThresholdBytes' must be an instance of '%@'. The following value is invalid: %@"), NSStringFromClass(v84), v23, v103, v104);
    v27 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
    v28 = v81;
    v29 = v82;
  }
LABEL_47:
  v37 = objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 134060, v27);
  if (v37)
    goto LABEL_23;
  v96 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
  _NSCoreDataLog(17, v96, v97, v98, v99, v100, v101, v102, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
  v45 = __pflogFaultLog;
  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    goto LABEL_23;
  *(_DWORD *)buf = 136315394;
  v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
  v107 = 1024;
  v108 = 200;
LABEL_38:
  _os_log_fault_impl(&dword_18A253000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_23:
  if (v37)
  {
    if (a4)
    {
      result = 0;
      *a4 = v37;
      return result;
    }
  }
  else
  {
    v46 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v46, v47, v48, v49, v50, v51, v52, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v53 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    v107 = 1024;
    v108 = 56;
    _os_log_fault_impl(&dword_18A253000, v53, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

@end
