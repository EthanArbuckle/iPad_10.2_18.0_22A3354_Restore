@implementation HKProcedureRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  __CFString *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  NSObject *v53;
  id v54;
  void *v55;
  NSObject *v56;
  id v57;
  void *v58;
  NSObject *v59;
  id v60;
  void *v61;
  NSObject *v62;
  id v63;
  void *v64;
  NSObject *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  NSObject *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v89;
  char v90;
  unint64_t v91;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  id v101;
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
  id v120;
  id v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  const __CFString *v144;
  id v145;
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[2];
  uint8_t buf[4];
  id v151;
  __int16 v152;
  const __CFString *v153;
  __int16 v154;
  id v155;
  uint64_t v156;

  v156 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v127 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v125)
  {
    _HKInitializeLogging();
    v6 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v151 = v7;
      _os_log_impl(&dword_224DAC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "addObject:", v8);

  }
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v125);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v9, "integerValue");

  if (v95 <= 0)
  {
    _HKInitializeLogging();
    v10 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v151 = v11;
      v152 = 2114;
      v153 = v4;
      _os_log_impl(&dword_224DAC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "addObject:", v12);

  }
  v143 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v143);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v143;
  if (!v110 && v123)
  {
    _HKInitializeLogging();
    v13 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v14;
      v152 = 2114;
      v153 = CFSTR("locale");
      v154 = 2114;
      v155 = v123;
      _os_log_impl(&dword_224DAC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v123);
  }
  -[__CFString country](v4, "country");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v142);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v142;
  if (!v109 && v122)
  {
    _HKInitializeLogging();
    v15 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v16;
      v152 = 2114;
      v153 = CFSTR("note");
      v154 = 2114;
      v155 = v122;
      _os_log_impl(&dword_224DAC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v122);
  }
  v141 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v141);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v141;
  if (!v108 && v121)
  {
    _HKInitializeLogging();
    v17 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v18;
      v152 = 2114;
      v153 = CFSTR("enteredInError");
      v154 = 2114;
      v155 = v121;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v121);
  }
  -[__CFString representedResource](v4, "representedResource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v19, "extractionHints");

  v140 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("procedureCodingCollection"), objc_opt_class(), 0, &v140);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v140;
  v97 = v21;
  if (v20 || !v21)
  {
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueProcedureCodingCollection instance to avoid throwing exception"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FC8];
      v148[0] = CFSTR("propertyName");
      v148[1] = v26;
      v149[0] = CFSTR("procedureCodingCollection");
      v149[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v127, "addObject:", v28);
    }
  }
  else
  {
    _HKInitializeLogging();
    v22 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v23;
      v152 = 2114;
      v153 = CFSTR("procedureCodingCollection");
      v154 = 2114;
      v155 = v97;
      _os_log_impl(&dword_224DAC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v97);
  }
  v98 = v20;
  v139 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("performers"), objc_opt_class(), 1, &v139);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v139;
  if (!v29 && v120)
  {
    _HKInitializeLogging();
    v30 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v31;
      v152 = 2114;
      v153 = CFSTR("performers");
      v154 = 2114;
      v155 = v120;
      _os_log_impl(&dword_224DAC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v120);
  }
  v99 = v29;
  v138 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("executionStartDate"), objc_opt_class(), 0, &v138);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v138;
  if (!v32 && v119)
  {
    _HKInitializeLogging();
    v33 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v34;
      v152 = 2114;
      v153 = CFSTR("executionStartDate");
      v154 = 2114;
      v155 = v119;
      _os_log_impl(&dword_224DAC000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v119);
  }
  v100 = v32;
  v137 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("executionEndDate"), objc_opt_class(), 0, &v137);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v137;
  if (!v35 && v118)
  {
    _HKInitializeLogging();
    v36 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v37;
      v152 = 2114;
      v153 = CFSTR("executionEndDate");
      v154 = 2114;
      v155 = v118;
      _os_log_impl(&dword_224DAC000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v118);
  }
  v102 = v35;
  v136 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("notPerformed"), objc_opt_class(), 0, &v136);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v136;
  if (!v124 && v117)
  {
    _HKInitializeLogging();
    v38 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v39;
      v152 = 2114;
      v153 = CFSTR("notPerformed");
      v154 = 2114;
      v155 = v117;
      _os_log_impl(&dword_224DAC000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v117);
  }
  v90 = objc_msgSend(v124, "BOOLValue");
  v135 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v135);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v135;
  v96 = v41;
  if (v40 || !v41)
  {
    if (!v40)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD0FC8];
      v146[0] = CFSTR("propertyName");
      v146[1] = v46;
      v147[0] = CFSTR("statusCoding");
      v147[1] = v44;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v147, v146, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v127, "addObject:", v48);
    }
  }
  else
  {
    _HKInitializeLogging();
    v42 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v43;
      v152 = 2114;
      v153 = CFSTR("statusCoding");
      v154 = 2114;
      v155 = v96;
      _os_log_impl(&dword_224DAC000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v96);
  }
  v101 = v40;
  v134 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("categoryCodingCollection"), objc_opt_class(), 0, &v134);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v134;
  if (!v49 && v116)
  {
    _HKInitializeLogging();
    v50 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v51;
      v152 = 2114;
      v153 = CFSTR("categoryCodingCollection");
      v154 = 2114;
      v155 = v116;
      _os_log_impl(&dword_224DAC000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v116);
  }
  v103 = v49;
  v133 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reasonCodingCollections"), objc_opt_class(), 1, &v133);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v133;
  if (!v52 && v115)
  {
    _HKInitializeLogging();
    v53 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v54;
      v152 = 2114;
      v153 = CFSTR("reasonCodingCollections");
      v154 = 2114;
      v155 = v115;
      _os_log_impl(&dword_224DAC000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v115);
  }
  v104 = v52;
  v132 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reasonsNotPerformedCodingCollections"), objc_opt_class(), 1, &v132);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v132;
  if (!v55 && v114)
  {
    _HKInitializeLogging();
    v56 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v57;
      v152 = 2114;
      v153 = CFSTR("reasonsNotPerformedCodingCollections");
      v154 = 2114;
      v155 = v114;
      _os_log_impl(&dword_224DAC000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v114);
  }
  v105 = v55;
  v131 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("outcomeCodingCollection"), objc_opt_class(), 0, &v131);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v131;
  if (!v58 && v113)
  {
    _HKInitializeLogging();
    v59 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v60;
      v152 = 2114;
      v153 = CFSTR("outcomeCodingCollection");
      v154 = 2114;
      v155 = v113;
      _os_log_impl(&dword_224DAC000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v113);
  }
  v106 = v58;
  v130 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("complicationsCodingCollections"), objc_opt_class(), 1, &v130);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v130;
  if (!v61 && v112)
  {
    _HKInitializeLogging();
    v62 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v63;
      v152 = 2114;
      v153 = CFSTR("complicationsCodingCollections");
      v154 = 2114;
      v155 = v112;
      _os_log_impl(&dword_224DAC000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v112);
  }
  v107 = v61;
  v129 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("followUpsCodingCollections"), objc_opt_class(), 1, &v129);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v129;
  if (!v64 && v111)
  {
    _HKInitializeLogging();
    v65 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v66;
      v152 = 2114;
      v153 = CFSTR("followUpsCodingCollections");
      v154 = 2114;
      v155 = v111;
      _os_log_impl(&dword_224DAC000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v111);
  }
  v67 = v64;
  v128 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("bodySitesCodingCollections"), objc_opt_class(), 1, &v128);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v128;
  v70 = v69;
  if (!v68 && v69)
  {
    _HKInitializeLogging();
    v71 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v151 = v72;
      v152 = 2114;
      v153 = CFSTR("bodySitesCodingCollections");
      v154 = 2114;
      v155 = v70;
      _os_log_impl(&dword_224DAC000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v127, "addObject:", v70);
  }
  v73 = v68;
  if (objc_msgSend(v127, "count"))
  {
    v74 = (void *)MEMORY[0x24BDD1540];
    v144 = CFSTR("conversionErrors");
    v145 = v127;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = v76;
    v78 = v77;
    if (v77)
    {
      if (a4)
      {
        v78 = objc_retainAutorelease(v77);
        v126 = 0;
        *a4 = v78;
        v79 = v78;
        goto LABEL_103;
      }
      _HKLogDroppedError();
    }
    v126 = 0;
    v79 = v78;
    goto LABEL_103;
  }
  -[__CFString representedResource](v4, "representedResource");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "receivedDate");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (v81)
  {
    v79 = v81;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v79 = (id)objc_claimAutoreleasedReturnValue();

  }
  v83 = objc_msgSend(v108, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v78 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E30], "procedureRecordType");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v89) = v90;
  objc_msgSend(MEMORY[0x24BDD3E28], "procedureRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:procedureCodingCollection:performers:executionStartDate:executionEndDate:notPerformed:statusCoding:categoryCodingCollection:reasonCodingCollections:reasonsNotPerformedCodingCollections:outcomeCodingCollection:complicationsCodingCollections:followUpsCodingCollections:bodySitesCodingCollections:", v85, v109, v83, v79, v94, v110, v95, v78, v84, v93, (v91 >> 2) & 1, v98, v99, v100,
    v102,
    v89,
    v101,
    v103,
    v104,
    v105,
    v106,
    v107,
    v67,
    v73);
  v126 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "firstSeenDate");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "_setCreationDate:", v87);

LABEL_103:
  return v126;
}

@end
