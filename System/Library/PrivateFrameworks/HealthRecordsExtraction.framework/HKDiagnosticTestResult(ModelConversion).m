@implementation HKDiagnosticTestResult(ModelConversion)

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
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  void *v74;
  NSObject *v75;
  id v76;
  void *v77;
  NSObject *v78;
  id v79;
  void *v80;
  NSObject *v81;
  id v82;
  void *v83;
  NSObject *v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  NSObject *v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  unint64_t v109;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  id v120;
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
  void *v131;
  void *v132;
  void *v133;
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
  id v144;
  id v145;
  id v146;
  void *v147;
  void *v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  const __CFString *v168;
  id v169;
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[2];
  uint8_t buf[4];
  id v179;
  __int16 v180;
  const __CFString *v181;
  __int16 v182;
  id v183;
  uint64_t v184;

  v184 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v149 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v147)
  {
    _HKInitializeLogging();
    v6 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v179 = v7;
      _os_log_impl(&dword_224DAC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "addObject:", v8);

  }
  v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v147);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v9, "integerValue");

  if (v113 <= 0)
  {
    _HKInitializeLogging();
    v10 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v179 = v11;
      v180 = 2114;
      v181 = v4;
      _os_log_impl(&dword_224DAC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "addObject:", v12);

  }
  v167 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v167);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v167;
  if (!v133 && v146)
  {
    _HKInitializeLogging();
    v13 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v14;
      v180 = 2114;
      v181 = CFSTR("locale");
      v182 = 2114;
      v183 = v146;
      _os_log_impl(&dword_224DAC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v146);
  }
  -[__CFString country](v4, "country");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v166);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v166;
  if (!v132 && v145)
  {
    _HKInitializeLogging();
    v15 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v16;
      v180 = 2114;
      v181 = CFSTR("note");
      v182 = 2114;
      v183 = v145;
      _os_log_impl(&dword_224DAC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v145);
  }
  v165 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v165);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v165;
  if (!v131 && v144)
  {
    _HKInitializeLogging();
    v17 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v18;
      v180 = 2114;
      v181 = CFSTR("enteredInError");
      v182 = 2114;
      v183 = v144;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v144);
  }
  -[__CFString representedResource](v4, "representedResource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v19, "extractionHints");

  v164 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("diagnosticTestCodingCollection"), objc_opt_class(), 0, &v164);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v164;
  v117 = v21;
  if (v20 || !v21)
  {
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueDiagnosticTestCodingCollection instance to avoid throwing exception"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FC8];
      v176[0] = CFSTR("propertyName");
      v176[1] = v26;
      v177[0] = CFSTR("diagnosticTestCodingCollection");
      v177[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v149, "addObject:", v28);
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
      v179 = v23;
      v180 = 2114;
      v181 = CFSTR("diagnosticTestCodingCollection");
      v182 = 2114;
      v183 = v117;
      _os_log_impl(&dword_224DAC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v117);
  }
  v118 = v20;
  v163 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("value"), objc_opt_class(), 0, &v163);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v163;
  if (!v29 && v143)
  {
    _HKInitializeLogging();
    v30 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v31;
      v180 = 2114;
      v181 = CFSTR("value");
      v182 = 2114;
      v183 = v143;
      _os_log_impl(&dword_224DAC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v143);
  }
  v119 = v29;
  v162 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("referenceRanges"), objc_opt_class(), 1, &v162);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v162;
  if (!v32 && v142)
  {
    _HKInitializeLogging();
    v33 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v34;
      v180 = 2114;
      v181 = CFSTR("referenceRanges");
      v182 = 2114;
      v183 = v142;
      _os_log_impl(&dword_224DAC000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v142);
  }
  v120 = v32;
  v161 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("effectiveStartDate"), objc_opt_class(), 0, &v161);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v161;
  if (!v35 && v141)
  {
    _HKInitializeLogging();
    v36 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v37;
      v180 = 2114;
      v181 = CFSTR("effectiveStartDate");
      v182 = 2114;
      v183 = v141;
      _os_log_impl(&dword_224DAC000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v141);
  }
  v121 = v35;
  v160 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("category"), objc_opt_class(), 0, &v160);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v160;
  v116 = v39;
  if (v38 || !v39)
  {
    if (!v38)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueCategory instance to avoid throwing exception"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD0FC8];
      v174[0] = CFSTR("propertyName");
      v174[1] = v44;
      v175[0] = CFSTR("category");
      v175[1] = v42;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v175, v174, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v149, "addObject:", v46);
    }
  }
  else
  {
    _HKInitializeLogging();
    v40 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v41;
      v180 = 2114;
      v181 = CFSTR("category");
      v182 = 2114;
      v183 = v116;
      _os_log_impl(&dword_224DAC000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v116);
  }
  v122 = v38;
  v159 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("categoriesCodingCollections"), objc_opt_class(), 1, &v159);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v159;
  v115 = v48;
  if (v47 || !v48)
  {
    if (!v47)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueCategoriesCodingCollections instance to avoid throwing exception"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)MEMORY[0x24BDD1540];
      v53 = *MEMORY[0x24BDD0FC8];
      v172[0] = CFSTR("propertyName");
      v172[1] = v53;
      v173[0] = CFSTR("categoriesCodingCollections");
      v173[1] = v51;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v173, v172, 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v149, "addObject:", v55);
    }
  }
  else
  {
    _HKInitializeLogging();
    v49 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v50;
      v180 = 2114;
      v181 = CFSTR("categoriesCodingCollections");
      v182 = 2114;
      v183 = v115;
      _os_log_impl(&dword_224DAC000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v115);
  }
  v123 = v47;
  v158 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("issueDate"), objc_opt_class(), 0, &v158);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v158;
  if (!v56 && v140)
  {
    _HKInitializeLogging();
    v57 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v58;
      v180 = 2114;
      v181 = CFSTR("issueDate");
      v182 = 2114;
      v183 = v140;
      _os_log_impl(&dword_224DAC000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v140);
  }
  v124 = v56;
  v157 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("effectiveEndDate"), objc_opt_class(), 0, &v157);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v157;
  if (!v59 && v139)
  {
    _HKInitializeLogging();
    v60 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v61;
      v180 = 2114;
      v181 = CFSTR("effectiveEndDate");
      v182 = 2114;
      v183 = v139;
      _os_log_impl(&dword_224DAC000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v139);
  }
  v125 = v59;
  v156 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v156);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v156;
  v114 = v63;
  if (v62 || !v63)
  {
    if (!v62)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)MEMORY[0x24BDD1540];
      v68 = *MEMORY[0x24BDD0FC8];
      v170[0] = CFSTR("propertyName");
      v170[1] = v68;
      v171[0] = CFSTR("statusCoding");
      v171[1] = v66;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v171, v170, 2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v149, "addObject:", v70);
    }
  }
  else
  {
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v65;
      v180 = 2114;
      v181 = CFSTR("statusCoding");
      v182 = 2114;
      v183 = v114;
      _os_log_impl(&dword_224DAC000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v114);
  }
  v126 = v62;
  v155 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("interpretationCodingCollections"), objc_opt_class(), 1, &v155);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v155;
  if (!v71 && v138)
  {
    _HKInitializeLogging();
    v72 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v73;
      v180 = 2114;
      v181 = CFSTR("interpretationCodingCollections");
      v182 = 2114;
      v183 = v138;
      _os_log_impl(&dword_224DAC000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v138);
  }
  v127 = v71;
  v154 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("comments"), objc_opt_class(), 0, &v154);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v154;
  if (!v74 && v137)
  {
    _HKInitializeLogging();
    v75 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v76;
      v180 = 2114;
      v181 = CFSTR("comments");
      v182 = 2114;
      v183 = v137;
      _os_log_impl(&dword_224DAC000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v137);
  }
  v128 = v74;
  v153 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("bodySiteCodingCollection"), objc_opt_class(), 0, &v153);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v153;
  if (!v77 && v136)
  {
    _HKInitializeLogging();
    v78 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      v79 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v79;
      v180 = 2114;
      v181 = CFSTR("bodySiteCodingCollection");
      v182 = 2114;
      v183 = v136;
      _os_log_impl(&dword_224DAC000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v136);
  }
  v129 = v77;
  v152 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("methodCodingCollection"), objc_opt_class(), 0, &v152);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v152;
  if (!v80 && v135)
  {
    _HKInitializeLogging();
    v81 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      v82 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v82;
      v180 = 2114;
      v181 = CFSTR("methodCodingCollection");
      v182 = 2114;
      v183 = v135;
      _os_log_impl(&dword_224DAC000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v135);
  }
  v130 = v80;
  v151 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("performers"), objc_opt_class(), 1, &v151);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v151;
  if (!v83 && v134)
  {
    _HKInitializeLogging();
    v84 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v85;
      v180 = 2114;
      v181 = CFSTR("performers");
      v182 = 2114;
      v183 = v134;
      _os_log_impl(&dword_224DAC000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v134);
  }
  v86 = v83;
  v150 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("referenceRangeStatus"), objc_opt_class(), 0, &v150);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v150;
  v89 = v88;
  if (!v87 && v88)
  {
    _HKInitializeLogging();
    v90 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v179 = v91;
      v180 = 2114;
      v181 = CFSTR("referenceRangeStatus");
      v182 = 2114;
      v183 = v89;
      _os_log_impl(&dword_224DAC000, v90, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v149, "addObject:", v89);
  }
  v92 = objc_msgSend(v87, "integerValue");
  if (objc_msgSend(v149, "count"))
  {
    v93 = (void *)MEMORY[0x24BDD1540];
    v168 = CFSTR("conversionErrors");
    v169 = v149;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    v96 = v95;
    v97 = v96;
    if (v96)
    {
      if (a4)
      {
        v97 = objc_retainAutorelease(v96);
        v98 = 0;
        *a4 = v97;
        v99 = v97;
        goto LABEL_117;
      }
      _HKLogDroppedError();
    }
    v98 = 0;
    v99 = v97;
    goto LABEL_117;
  }
  -[__CFString representedResource](v4, "representedResource");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "receivedDate");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101;
  if (v101)
  {
    v99 = v101;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v99 = (id)objc_claimAutoreleasedReturnValue();

  }
  v103 = objc_msgSend(v131, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3B50], "diagnosticTestResultType");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3B48], "diagnosticTestResultWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:diagnosticTestCodingCollection:value:referenceRanges:effectiveStartDate:category:categoriesCodingCollections:issueDate:effectiveEndDate:statusCoding:interpretationCodingCollections:comments:bodySiteCodingCollection:methodCodingCollection:performers:referenceRangeStatus:", v104, v132, v103, v99, v112, v133, v113, v97, v148, v111, (v109 >> 2) & 1, v118, v119, v120,
    v121,
    v122,
    v123,
    v124,
    v125,
    v126,
    v127,
    v128,
    v129,
    v130,
    v86,
    v92);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "firstSeenDate");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "_setCreationDate:", v107);

  v98 = v105;
LABEL_117:

  return v98;
}

@end
