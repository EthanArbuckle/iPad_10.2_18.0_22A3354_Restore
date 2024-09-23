@implementation HKMedicationDispenseRecord(ModelConversion)

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
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v96;
  unint64_t v97;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  void *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  const __CFString *v133;
  id v134;
  _QWORD v135[2];
  _QWORD v136[2];
  uint8_t buf[4];
  id v138;
  __int16 v139;
  const __CFString *v140;
  __int16 v141;
  id v142;
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v121 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v120)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      v138 = (id)objc_opt_class();
      v8 = v138;
      _os_log_impl(&dword_224DAC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v9);

  }
  v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v120);
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
      v138 = v14;
      v139 = 2114;
      v140 = v4;
      v15 = v14;
      _os_log_impl(&dword_224DAC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v16);

  }
  v132 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v132);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v132;
  if (!v110 && v119)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v19;
      v139 = 2114;
      v140 = CFSTR("locale");
      v141 = 2114;
      v142 = v119;
      v20 = v19;
      _os_log_impl(&dword_224DAC000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v119);
  }
  -[__CFString country](v4, "country");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v131);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v131;
  if (!v109 && v118)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v23;
      v139 = 2114;
      v140 = CFSTR("note");
      v141 = 2114;
      v142 = v118;
      v24 = v23;
      _os_log_impl(&dword_224DAC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v118);
  }
  v130 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v130);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v130;
  if (!v108 && v117)
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v27;
      v139 = 2114;
      v140 = CFSTR("enteredInError");
      v141 = 2114;
      v142 = v117;
      v28 = v27;
      _os_log_impl(&dword_224DAC000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v117);
  }
  -[__CFString representedResource](v4, "representedResource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v29, "extractionHints");

  v129 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("medicationCodings"), objc_opt_class(), 1, &v129);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v129;
  v101 = v31;
  if (v30 || !v31)
  {
    if (!v30)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueMedicationCodings instance to avoid throwing exception"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BDD0FC8];
      v135[0] = CFSTR("propertyName");
      v135[1] = v38;
      v136[0] = CFSTR("medicationCodings");
      v136[1] = v36;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v136, v135, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v121, "addObject:", v40);
    }
  }
  else
  {
    _HKInitializeLogging();
    v32 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v34;
      v139 = 2114;
      v140 = CFSTR("medicationCodings");
      v141 = 2114;
      v142 = v101;
      v35 = v34;
      _os_log_impl(&dword_224DAC000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v101);
  }
  v102 = v30;
  v128 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("quantityDispensed"), objc_opt_class(), 0, &v128);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v128;
  if (!v41 && v116)
  {
    _HKInitializeLogging();
    v42 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v44;
      v139 = 2114;
      v140 = CFSTR("quantityDispensed");
      v141 = 2114;
      v142 = v116;
      v45 = v44;
      _os_log_impl(&dword_224DAC000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v116);
  }
  v103 = v41;
  v127 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("preparationDate"), objc_opt_class(), 0, &v127);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v127;
  if (!v46 && v115)
  {
    _HKInitializeLogging();
    v47 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v49;
      v139 = 2114;
      v140 = CFSTR("preparationDate");
      v141 = 2114;
      v142 = v115;
      v50 = v49;
      _os_log_impl(&dword_224DAC000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v115);
  }
  v104 = v46;
  v126 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("handOverDate"), objc_opt_class(), 0, &v126);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v126;
  if (!v51 && v114)
  {
    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v54;
      v139 = 2114;
      v140 = CFSTR("handOverDate");
      v141 = 2114;
      v142 = v114;
      v55 = v54;
      _os_log_impl(&dword_224DAC000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v114);
  }
  v105 = v51;
  v125 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("dosages"), objc_opt_class(), 1, &v125);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v125;
  if (!v56 && v113)
  {
    _HKInitializeLogging();
    v57 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      v59 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v59;
      v139 = 2114;
      v140 = CFSTR("dosages");
      v141 = 2114;
      v142 = v113;
      v60 = v59;
      _os_log_impl(&dword_224DAC000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v113);
  }
  v106 = v56;
  v124 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("earliestDosageDate"), objc_opt_class(), 0, &v124);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v124;
  if (!v61 && v112)
  {
    _HKInitializeLogging();
    v62 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v63 = v62;
      v64 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v64;
      v139 = 2114;
      v140 = CFSTR("earliestDosageDate");
      v141 = 2114;
      v142 = v112;
      v65 = v64;
      _os_log_impl(&dword_224DAC000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v112);
  }
  v107 = v61;
  v123 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v123);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v123;
  if (!v66 && v111)
  {
    _HKInitializeLogging();
    v67 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v68 = v67;
      v69 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v69;
      v139 = 2114;
      v140 = CFSTR("statusCoding");
      v141 = 2114;
      v142 = v111;
      v70 = v69;
      _os_log_impl(&dword_224DAC000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v111);
  }
  v71 = v66;
  v122 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("daysSupplyQuantity"), objc_opt_class(), 0, &v122);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v122;
  v74 = v73;
  if (!v72 && v73)
  {
    _HKInitializeLogging();
    v75 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v76 = v75;
      v77 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v138 = v77;
      v139 = 2114;
      v140 = CFSTR("daysSupplyQuantity");
      v141 = 2114;
      v142 = v74;
      v78 = v77;
      _os_log_impl(&dword_224DAC000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v121, "addObject:", v74);
  }
  v79 = v72;
  if (objc_msgSend(v121, "count"))
  {
    v80 = (void *)MEMORY[0x24BDD1540];
    v133 = CFSTR("conversionErrors");
    v134 = v121;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = v82;
    v84 = v83;
    if (v83)
    {
      if (a4)
      {
        v84 = objc_retainAutorelease(v83);
        v85 = 0;
        *a4 = v84;
        v86 = v84;
        goto LABEL_76;
      }
      _HKLogDroppedError();
    }
    v85 = 0;
    v86 = v84;
    goto LABEL_76;
  }
  -[__CFString representedResource](v4, "representedResource");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "receivedDate");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88;
  if (v88)
  {
    v90 = v88;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v90 = (id)objc_claimAutoreleasedReturnValue();
  }
  v86 = v90;

  v91 = objc_msgSend(v108, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v84 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3D20], "medicationDispenseRecordType");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3D18], "medicationDispenseRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:medicationCodings:quantityDispensed:preparationDate:handOverDate:dosages:earliestDosageDate:statusCoding:daysSupplyQuantity:", v92, v109, v91, v86, v100, v110, v11, v84, v96, v99, (v97 >> 2) & 1, v102, v103, v104, v105,
    v106,
    v107,
    v71,
    v79);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "firstSeenDate");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "_setCreationDate:", v94);

LABEL_76:
  return v85;
}

@end
