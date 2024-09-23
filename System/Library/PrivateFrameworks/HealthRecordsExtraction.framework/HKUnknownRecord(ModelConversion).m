@implementation HKUnknownRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  __CFString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  unint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  const __CFString *v72;
  id v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v67 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v66)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      v75 = (id)objc_opt_class();
      v8 = v75;
      _os_log_impl(&dword_224DAC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v9);

  }
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v66);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 <= 0)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v75 = v14;
      v76 = 2114;
      v77 = v4;
      v15 = v14;
      _os_log_impl(&dword_224DAC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v16);

  }
  v71 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v71);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v71;
  if (!v62 && v65)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v75 = v19;
      v76 = 2114;
      v77 = CFSTR("locale");
      v78 = 2114;
      v79 = v65;
      v20 = v19;
      _os_log_impl(&dword_224DAC000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v67, "addObject:", v65);
  }
  -[__CFString country](v4, "country");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v70);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v70;
  if (!v61 && v64)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v75 = v23;
      v76 = 2114;
      v77 = CFSTR("note");
      v78 = 2114;
      v79 = v64;
      v24 = v23;
      _os_log_impl(&dword_224DAC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v67, "addObject:", v64);
  }
  v69 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v69);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v69;
  if (!v60 && v63)
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v75 = v27;
      v76 = 2114;
      v77 = CFSTR("enteredInError");
      v78 = 2114;
      v79 = v63;
      v28 = v27;
      _os_log_impl(&dword_224DAC000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v67, "addObject:", v63);
  }
  -[__CFString representedResource](v4, "representedResource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "extractionHints");

  v68 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("displayName"), objc_opt_class(), 0, &v68);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v68;
  v33 = v32;
  if (!v31 && v32)
  {
    _HKInitializeLogging();
    v34 = v11;
    v35 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      v37 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v75 = v37;
      v76 = 2114;
      v77 = CFSTR("displayName");
      v78 = 2114;
      v79 = v33;
      v38 = v37;
      _os_log_impl(&dword_224DAC000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v67, "addObject:", v33);
    v11 = v34;
  }
  v39 = v31;
  if (objc_msgSend(v67, "count"))
  {
    v40 = (void *)MEMORY[0x24BDD1540];
    v72 = CFSTR("conversionErrors");
    v73 = v67;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v42;
    v44 = v43;
    if (v43)
    {
      if (a4)
      {
        v44 = objc_retainAutorelease(v43);
        v45 = 0;
        *a4 = v44;
        v46 = v44;
        goto LABEL_39;
      }
      _HKLogDroppedError();
    }
    v45 = 0;
    v46 = v44;
    goto LABEL_39;
  }
  -[__CFString representedResource](v4, "representedResource");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "receivedDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    v50 = v48;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  v46 = v50;

  v51 = objc_msgSend(v60, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4060], "unknownRecordType");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4058], "unknownRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:displayName:", v53, v61, v51, v46, v59, v62, v11, v44, v52, v58, (v30 >> 2) & 1, v39);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "firstSeenDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "_setCreationDate:", v55);

LABEL_39:
  return v45;
}

@end
