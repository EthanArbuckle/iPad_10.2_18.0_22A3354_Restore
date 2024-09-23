@implementation HKCoverageRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  __CFString *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  NSObject *v58;
  id v59;
  void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  NSObject *v64;
  id v65;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  NSObject *v70;
  id v71;
  void *v72;
  NSObject *v73;
  id v74;
  void *v75;
  NSObject *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  NSObject *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  unint64_t v101;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  id v110;
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
  void *v121;
  void *v122;
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
  id v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  id v140;
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
  id v155;
  const __CFString *v156;
  id v157;
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[2];
  uint8_t buf[4];
  id v165;
  __int16 v166;
  const __CFString *v167;
  __int16 v168;
  id v169;
  uint64_t v170;

  v170 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v138 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v136)
  {
    _HKInitializeLogging();
    v6 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v165 = v7;
      _os_log_impl(&dword_224DAC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "addObject:", v8);

  }
  v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v136);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10 <= 0)
  {
    _HKInitializeLogging();
    v11 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v165 = v12;
      v166 = 2114;
      v167 = v4;
      _os_log_impl(&dword_224DAC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "addObject:", v13);

  }
  v155 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v155);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v155;
  if (!v122 && v135)
  {
    _HKInitializeLogging();
    v14 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v15;
      v166 = 2114;
      v167 = CFSTR("locale");
      v168 = 2114;
      v169 = v135;
      _os_log_impl(&dword_224DAC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v135);
  }
  -[__CFString country](v4, "country");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v154);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v154;
  if (!v121 && v134)
  {
    _HKInitializeLogging();
    v16 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v17;
      v166 = 2114;
      v167 = CFSTR("note");
      v168 = 2114;
      v169 = v134;
      _os_log_impl(&dword_224DAC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v134);
  }
  v153 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v153);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v153;
  if (!v120 && v133)
  {
    _HKInitializeLogging();
    v18 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v19;
      v166 = 2114;
      v167 = CFSTR("enteredInError");
      v168 = 2114;
      v169 = v133;
      _os_log_impl(&dword_224DAC000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v133);
  }
  -[__CFString representedResource](v4, "representedResource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v20, "extractionHints");

  v152 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v152);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v152;
  v107 = v22;
  if (v21 || !v22)
  {
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FC8];
      v162[0] = CFSTR("propertyName");
      v162[1] = v27;
      v163[0] = CFSTR("statusCoding");
      v163[1] = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v163, v162, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v138, "addObject:", v29);
    }
  }
  else
  {
    _HKInitializeLogging();
    v23 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v24;
      v166 = 2114;
      v167 = CFSTR("statusCoding");
      v168 = 2114;
      v169 = v107;
      _os_log_impl(&dword_224DAC000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v107);
  }
  v108 = v21;
  v151 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("coverageTypeCodingCollection"), objc_opt_class(), 0, &v151);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v151;
  v106 = v31;
  if (v30 || !v31)
  {
    if (!v30)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueCoverageTypeCodingCollection instance to avoid throwing exception"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0FC8];
      v160[0] = CFSTR("propertyName");
      v160[1] = v36;
      v161[0] = CFSTR("coverageTypeCodingCollection");
      v161[1] = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v138, "addObject:", v38);
    }
  }
  else
  {
    _HKInitializeLogging();
    v32 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v33;
      v166 = 2114;
      v167 = CFSTR("coverageTypeCodingCollection");
      v168 = 2114;
      v169 = v106;
      _os_log_impl(&dword_224DAC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v106);
  }
  v109 = v30;
  v150 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("subscriber"), objc_opt_class(), 0, &v150);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v150;
  if (!v39 && v132)
  {
    _HKInitializeLogging();
    v40 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v41;
      v166 = 2114;
      v167 = CFSTR("subscriber");
      v168 = 2114;
      v169 = v132;
      _os_log_impl(&dword_224DAC000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v132);
  }
  v110 = v39;
  v149 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("subscriberId"), objc_opt_class(), 0, &v149);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v149;
  v105 = v43;
  if (v42 || !v43)
  {
    if (!v42)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueSubscriberId instance to avoid throwing exception"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)MEMORY[0x24BDD1540];
      v48 = *MEMORY[0x24BDD0FC8];
      v158[0] = CFSTR("propertyName");
      v158[1] = v48;
      v159[0] = CFSTR("subscriberId");
      v159[1] = v46;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v159, v158, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v138, "addObject:", v50);
    }
  }
  else
  {
    _HKInitializeLogging();
    v44 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v45;
      v166 = 2114;
      v167 = CFSTR("subscriberId");
      v168 = 2114;
      v169 = v105;
      _os_log_impl(&dword_224DAC000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v105);
  }
  v111 = v42;
  v148 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("beneficiary"), objc_opt_class(), 0, &v148);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v148;
  if (!v51 && v131)
  {
    _HKInitializeLogging();
    v52 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v53;
      v166 = 2114;
      v167 = CFSTR("beneficiary");
      v168 = 2114;
      v169 = v131;
      _os_log_impl(&dword_224DAC000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v131);
  }
  v112 = v51;
  v147 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("policyHolder"), objc_opt_class(), 0, &v147);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v147;
  if (!v54 && v130)
  {
    _HKInitializeLogging();
    v55 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v56;
      v166 = 2114;
      v167 = CFSTR("policyHolder");
      v168 = 2114;
      v169 = v130;
      _os_log_impl(&dword_224DAC000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v130);
  }
  v113 = v54;
  v146 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("payor"), objc_opt_class(), 1, &v146);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v146;
  if (!v57 && v129)
  {
    _HKInitializeLogging();
    v58 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v59;
      v166 = 2114;
      v167 = CFSTR("payor");
      v168 = 2114;
      v169 = v129;
      _os_log_impl(&dword_224DAC000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v129);
  }
  v114 = v57;
  v145 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("relationshipCodingCollection"), objc_opt_class(), 0, &v145);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v145;
  if (!v60 && v128)
  {
    _HKInitializeLogging();
    v61 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v62;
      v166 = 2114;
      v167 = CFSTR("relationshipCodingCollection");
      v168 = 2114;
      v169 = v128;
      _os_log_impl(&dword_224DAC000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v128);
  }
  v115 = v60;
  v144 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("classification"), objc_opt_class(), 1, &v144);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v144;
  if (!v63 && v127)
  {
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v65;
      v166 = 2114;
      v167 = CFSTR("classification");
      v168 = 2114;
      v169 = v127;
      _os_log_impl(&dword_224DAC000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v127);
  }
  v116 = v63;
  v143 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("network"), objc_opt_class(), 0, &v143);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v143;
  if (!v66 && v126)
  {
    _HKInitializeLogging();
    v67 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v68;
      v166 = 2114;
      v167 = CFSTR("network");
      v168 = 2114;
      v169 = v126;
      _os_log_impl(&dword_224DAC000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v126);
  }
  v117 = v66;
  v142 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("periodStartDate"), objc_opt_class(), 0, &v142);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v142;
  if (!v69 && v125)
  {
    _HKInitializeLogging();
    v70 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v71;
      v166 = 2114;
      v167 = CFSTR("periodStartDate");
      v168 = 2114;
      v169 = v125;
      _os_log_impl(&dword_224DAC000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v125);
  }
  v118 = v69;
  v141 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("periodEndDate"), objc_opt_class(), 0, &v141);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v141;
  if (!v72 && v124)
  {
    _HKInitializeLogging();
    v73 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v74;
      v166 = 2114;
      v167 = CFSTR("periodEndDate");
      v168 = 2114;
      v169 = v124;
      _os_log_impl(&dword_224DAC000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v124);
  }
  v119 = v72;
  v140 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("subscriberIdentifier"), objc_opt_class(), 0, &v140);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v140;
  if (!v75 && v123)
  {
    _HKInitializeLogging();
    v76 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v77;
      v166 = 2114;
      v167 = CFSTR("subscriberIdentifier");
      v168 = 2114;
      v169 = v123;
      _os_log_impl(&dword_224DAC000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v123);
  }
  v78 = v75;
  v139 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("beneficiaryIdentifier"), objc_opt_class(), 0, &v139);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v139;
  v81 = v80;
  if (!v79 && v80)
  {
    _HKInitializeLogging();
    v82 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      v83 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v83;
      v166 = 2114;
      v167 = CFSTR("beneficiaryIdentifier");
      v168 = 2114;
      v169 = v81;
      _os_log_impl(&dword_224DAC000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v138, "addObject:", v81);
  }
  v84 = v79;
  if (objc_msgSend(v138, "count"))
  {
    v85 = (void *)MEMORY[0x24BDD1540];
    v156 = CFSTR("conversionErrors");
    v157 = v138;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = v87;
    v89 = v88;
    if (v88)
    {
      if (a4)
      {
        v89 = objc_retainAutorelease(v88);
        v90 = 0;
        *a4 = v89;
        v91 = v89;
        goto LABEL_110;
      }
      _HKLogDroppedError();
    }
    v90 = 0;
    v91 = v89;
    goto LABEL_110;
  }
  -[__CFString representedResource](v4, "representedResource");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "receivedDate");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
  {
    v91 = v93;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v91 = (id)objc_claimAutoreleasedReturnValue();

  }
  v95 = objc_msgSend(v120, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v89 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3AC8], "coverageRecordType");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3AC0], "coverageRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:statusCoding:coverageTypeCodingCollection:subscriber:subscriberId:beneficiary:policyHolder:payor:relationshipCodingCollection:classification:network:periodStartDate:periodEndDate:subscriberIdentifier:beneficiaryIdentifier:", v96, v121, v95, v91, v104, v122, v10, v89, v137, v103, (v101 >> 2) & 1, v108, v109, v110, v111,
    v112,
    v113,
    v114,
    v115,
    v116,
    v117,
    v118,
    v119,
    v78,
    v84);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "firstSeenDate");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "_setCreationDate:", v99);

  v90 = v97;
LABEL_110:

  return v90;
}

@end
