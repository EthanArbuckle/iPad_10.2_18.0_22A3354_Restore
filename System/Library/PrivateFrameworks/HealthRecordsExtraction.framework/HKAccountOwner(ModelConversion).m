@implementation HKAccountOwner(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  __CFString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  unint64_t v66;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  const __CFString *v85;
  id v86;
  _QWORD v87[2];
  _QWORD v88[2];
  uint8_t buf[4];
  id v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v79 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v78)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      v90 = (id)objc_opt_class();
      v8 = v90;
      _os_log_impl(&dword_224DAC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v9);

  }
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v78);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v10, "integerValue");

  if (v70 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v90 = v13;
      v91 = 2114;
      v92 = v4;
      v14 = v13;
      _os_log_impl(&dword_224DAC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v15);

  }
  v84 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v84);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v84;
  if (!v74 && v77)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v90 = v18;
      v91 = 2114;
      v92 = CFSTR("locale");
      v93 = 2114;
      v94 = v77;
      v19 = v18;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v79, "addObject:", v77);
  }
  -[__CFString country](v4, "country");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v83);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v83;
  if (!v73 && v76)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v90 = v22;
      v91 = 2114;
      v92 = CFSTR("note");
      v93 = 2114;
      v94 = v76;
      v23 = v22;
      _os_log_impl(&dword_224DAC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v79, "addObject:", v76);
  }
  v82 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v82);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v82;
  if (!v72 && v75)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v90 = v26;
      v91 = 2114;
      v92 = CFSTR("enteredInError");
      v93 = 2114;
      v94 = v75;
      v27 = v26;
      _os_log_impl(&dword_224DAC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v79, "addObject:", v75);
  }
  -[__CFString representedResource](v4, "representedResource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v28, "extractionHints");

  v81 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("name"), objc_opt_class(), 0, &v81);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v81;
  v71 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueName instance to avoid throwing exception"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v87[0] = CFSTR("propertyName");
      v87[1] = v37;
      v88[0] = CFSTR("name");
      v88[1] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v79, "addObject:", v39);
    }
  }
  else
  {
    _HKInitializeLogging();
    v31 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      v33 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v90 = v33;
      v91 = 2114;
      v92 = CFSTR("name");
      v93 = 2114;
      v94 = v71;
      v34 = v33;
      _os_log_impl(&dword_224DAC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v79, "addObject:", v71);
  }
  v40 = v29;
  v80 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("birthDate"), objc_opt_class(), 0, &v80);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v80;
  v43 = v42;
  if (!v41 && v42)
  {
    _HKInitializeLogging();
    v44 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      v46 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v90 = v46;
      v91 = 2114;
      v92 = CFSTR("birthDate");
      v93 = 2114;
      v94 = v43;
      v47 = v46;
      _os_log_impl(&dword_224DAC000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v79, "addObject:", v43);
  }
  v48 = v41;
  if (objc_msgSend(v79, "count"))
  {
    v49 = (void *)MEMORY[0x24BDD1540];
    v85 = CFSTR("conversionErrors");
    v86 = v79;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v51;
    v53 = v52;
    if (v52)
    {
      if (a4)
      {
        v53 = objc_retainAutorelease(v52);
        v54 = 0;
        *a4 = v53;
        v55 = v53;
        goto LABEL_46;
      }
      _HKLogDroppedError();
    }
    v54 = 0;
    v55 = v53;
    goto LABEL_46;
  }
  -[__CFString representedResource](v4, "representedResource");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "receivedDate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57)
  {
    v59 = v57;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  v55 = v59;

  v60 = objc_msgSend(v72, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD38E0], "accountOwnerType");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD38D8], "accountOwnerWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:name:birthDate:", v61, v73, v60, v55, v69, v74, v70, v53, v65, v68, (v66 >> 2) & 1, v40, v48);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "firstSeenDate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "_setCreationDate:", v63);

LABEL_46:
  return v54;
}

@end
