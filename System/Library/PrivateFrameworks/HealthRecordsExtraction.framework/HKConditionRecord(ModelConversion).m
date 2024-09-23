@implementation HKConditionRecord(ModelConversion)

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
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
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
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  unint64_t v111;
  void *v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
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
  void *v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  const __CFString *v155;
  id v156;
  _QWORD v157[2];
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[2];
  uint8_t buf[4];
  id v162;
  __int16 v163;
  const __CFString *v164;
  __int16 v165;
  id v166;
  uint64_t v167;

  v167 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v141 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v140)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      v162 = (id)objc_opt_class();
      v8 = v162;
      _os_log_impl(&dword_224DAC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "addObject:", v9);

  }
  v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v140);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (id)objc_msgSend(v10, "integerValue");

  if ((uint64_t)v115 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v162 = v13;
      v163 = 2114;
      v164 = v4;
      v14 = v13;
      _os_log_impl(&dword_224DAC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "addObject:", v15);

  }
  v154 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v154);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v154;
  if (!v129 && v139)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v18;
      v163 = 2114;
      v164 = CFSTR("locale");
      v165 = 2114;
      v166 = v139;
      v19 = v18;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v139);
  }
  -[__CFString country](v4, "country");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v153);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v153;
  if (!v128 && v138)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v22;
      v163 = 2114;
      v164 = CFSTR("note");
      v165 = 2114;
      v166 = v138;
      v23 = v22;
      _os_log_impl(&dword_224DAC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v138);
  }
  v152 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v152);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v152;
  if (!v127 && v137)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v26;
      v163 = 2114;
      v164 = CFSTR("enteredInError");
      v165 = 2114;
      v166 = v137;
      v27 = v26;
      _os_log_impl(&dword_224DAC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v137);
  }
  -[__CFString representedResource](v4, "representedResource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v28, "extractionHints");

  v151 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("conditionCodingCollection"), objc_opt_class(), 0, &v151);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v151;
  v118 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueConditionCodingCollection instance to avoid throwing exception"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v159[0] = CFSTR("propertyName");
      v159[1] = v37;
      v160[0] = CFSTR("conditionCodingCollection");
      v160[1] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v160, v159, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v141, "addObject:", v39);
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
      v162 = v33;
      v163 = 2114;
      v164 = CFSTR("conditionCodingCollection");
      v165 = 2114;
      v166 = v118;
      v34 = v33;
      _os_log_impl(&dword_224DAC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v118);
  }
  v119 = v29;
  v150 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("categoriesCodingCollections"), objc_opt_class(), 1, &v150);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v150;
  v117 = v41;
  if (v40 || !v41)
  {
    if (!v40)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueCategoriesCodingCollections instance to avoid throwing exception"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)MEMORY[0x24BDD1540];
      v48 = *MEMORY[0x24BDD0FC8];
      v157[0] = CFSTR("propertyName");
      v157[1] = v48;
      v158[0] = CFSTR("categoriesCodingCollections");
      v158[1] = v46;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v158, v157, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v141, "addObject:", v50);
    }
  }
  else
  {
    _HKInitializeLogging();
    v42 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v44;
      v163 = 2114;
      v164 = CFSTR("categoriesCodingCollections");
      v165 = 2114;
      v166 = v117;
      v45 = v44;
      _os_log_impl(&dword_224DAC000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v117);
  }
  v120 = v40;
  v149 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("asserter"), objc_opt_class(), 0, &v149);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v149;
  if (!v51 && v136)
  {
    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v54;
      v163 = 2114;
      v164 = CFSTR("asserter");
      v165 = 2114;
      v166 = v136;
      v55 = v54;
      _os_log_impl(&dword_224DAC000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v136);
  }
  v121 = v51;
  v148 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("abatement"), objc_opt_class(), 0, &v148);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v148;
  if (!v56 && v135)
  {
    _HKInitializeLogging();
    v57 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      v59 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v59;
      v163 = 2114;
      v164 = CFSTR("abatement");
      v165 = 2114;
      v166 = v135;
      v60 = v59;
      _os_log_impl(&dword_224DAC000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v135);
  }
  v122 = v56;
  v147 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("onset"), objc_opt_class(), 0, &v147);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v147;
  if (!v61 && v134)
  {
    _HKInitializeLogging();
    v62 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v63 = v62;
      v64 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v64;
      v163 = 2114;
      v164 = CFSTR("onset");
      v165 = 2114;
      v166 = v134;
      v65 = v64;
      _os_log_impl(&dword_224DAC000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v134);
  }
  v123 = v61;
  v146 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("recordedDate"), objc_opt_class(), 0, &v146);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v146;
  if (!v66 && v133)
  {
    _HKInitializeLogging();
    v67 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v68 = v67;
      v69 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v69;
      v163 = 2114;
      v164 = CFSTR("recordedDate");
      v165 = 2114;
      v166 = v133;
      v70 = v69;
      _os_log_impl(&dword_224DAC000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v133);
  }
  v124 = v66;
  v145 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("clinicalStatusCoding"), objc_opt_class(), 0, &v145);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v145;
  if (!v71 && v132)
  {
    _HKInitializeLogging();
    v72 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v73 = v72;
      v74 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v74;
      v163 = 2114;
      v164 = CFSTR("clinicalStatusCoding");
      v165 = 2114;
      v166 = v132;
      v75 = v74;
      _os_log_impl(&dword_224DAC000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v132);
  }
  v125 = v71;
  v144 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("verificationStatusCoding"), objc_opt_class(), 0, &v144);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v144;
  if (!v76 && v131)
  {
    _HKInitializeLogging();
    v77 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v78 = v77;
      v79 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v79;
      v163 = 2114;
      v164 = CFSTR("verificationStatusCoding");
      v165 = 2114;
      v166 = v131;
      v80 = v79;
      _os_log_impl(&dword_224DAC000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v131);
  }
  v126 = v76;
  v143 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("severityCodingCollection"), objc_opt_class(), 0, &v143);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v143;
  if (!v81 && v130)
  {
    _HKInitializeLogging();
    v82 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v83 = v82;
      v84 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v84;
      v163 = 2114;
      v164 = CFSTR("severityCodingCollection");
      v165 = 2114;
      v166 = v130;
      v85 = v84;
      _os_log_impl(&dword_224DAC000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v130);
  }
  v86 = v81;
  v142 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("bodySitesCodingCollections"), objc_opt_class(), 1, &v142);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v142;
  v89 = v88;
  if (!v87 && v88)
  {
    _HKInitializeLogging();
    v90 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v91 = v90;
      v92 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v162 = v92;
      v163 = 2114;
      v164 = CFSTR("bodySitesCodingCollections");
      v165 = 2114;
      v166 = v89;
      v93 = v92;
      _os_log_impl(&dword_224DAC000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v89);
  }
  v94 = v87;
  if (objc_msgSend(v141, "count"))
  {
    v95 = (void *)MEMORY[0x24BDD1540];
    v155 = CFSTR("conversionErrors");
    v156 = v141;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    v98 = v97;
    v99 = v98;
    if (v98)
    {
      if (a4)
      {
        v99 = objc_retainAutorelease(v98);
        v116 = 0;
        *a4 = v99;
        v100 = v99;
        goto LABEL_88;
      }
      _HKLogDroppedError();
    }
    v116 = 0;
    v100 = v99;
    goto LABEL_88;
  }
  -[__CFString representedResource](v4, "representedResource");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "receivedDate");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102;
  if (v102)
  {
    v104 = v102;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v104 = (id)objc_claimAutoreleasedReturnValue();
  }
  v100 = v104;

  v105 = objc_msgSend(v127, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v99 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3A70], "conditionRecordType");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3A68], "conditionRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:conditionCodingCollection:categoriesCodingCollections:asserter:abatement:onset:recordedDate:clinicalStatusCoding:verificationStatusCoding:severityCodingCollection:bodySitesCodingCollections:", v107, v128, v105, v100, v114, v129, v115, v99, v106, v113, (v111 >> 2) & 1, v119, v120, v121, v122,
    v123,
    v124,
    v125,
    v126,
    v86,
    v94);
  v116 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "firstSeenDate");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "_setCreationDate:", v109);

LABEL_88:
  return v116;
}

@end
