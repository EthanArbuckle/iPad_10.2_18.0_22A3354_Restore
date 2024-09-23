@implementation HKMedicationRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  __CFString *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  NSObject *v62;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  void *v67;
  id v68;
  NSObject *v69;
  void *v70;
  id v71;
  void *v72;
  NSObject *v73;
  void *v74;
  id v75;
  void *v76;
  NSObject *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  NSObject *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v104;
  char v105;
  uint64_t v106;
  unint64_t v107;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
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
  id v136;
  void *v137;
  void *v138;
  void *v139;
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
  id v156;
  const __CFString *v157;
  id v158;
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[2];
  uint8_t buf[4];
  id v164;
  __int16 v165;
  const __CFString *v166;
  __int16 v167;
  id v168;
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v141 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v139)
  {
    _HKInitializeLogging();
    v6 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v164 = (id)objc_opt_class();
      v7 = v164;
      _os_log_impl(&dword_224DAC000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "addObject:", v8);

  }
  v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v139);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v9, "integerValue");

  if (v111 <= 0)
  {
    _HKInitializeLogging();
    v10 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v164 = v11;
      v165 = 2114;
      v166 = v4;
      v12 = v11;
      _os_log_impl(&dword_224DAC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "addObject:", v13);

  }
  v156 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v156);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v156;
  if (!v124 && v136)
  {
    _HKInitializeLogging();
    v14 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v15;
      v165 = 2114;
      v166 = CFSTR("locale");
      v167 = 2114;
      v168 = v136;
      v16 = v15;
      _os_log_impl(&dword_224DAC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v136);
  }
  -[__CFString country](v4, "country");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v155);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v155;
  if (!v123 && v135)
  {
    _HKInitializeLogging();
    v17 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v18;
      v165 = 2114;
      v166 = CFSTR("note");
      v167 = 2114;
      v168 = v135;
      v19 = v18;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v135);
  }
  v154 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v154);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v154;
  if (!v122 && v134)
  {
    _HKInitializeLogging();
    v20 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v21;
      v165 = 2114;
      v166 = CFSTR("enteredInError");
      v167 = 2114;
      v168 = v134;
      v22 = v21;
      _os_log_impl(&dword_224DAC000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v134);
  }
  -[__CFString representedResource](v4, "representedResource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v23, "extractionHints");

  v153 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("medicationCodingCollection"), objc_opt_class(), 0, &v153);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v153;
  v113 = v25;
  if (v24 || !v25)
  {
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueMedicationCodingCollection instance to avoid throwing exception"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDD0FC8];
      v161[0] = CFSTR("propertyName");
      v161[1] = v32;
      v162[0] = CFSTR("medicationCodingCollection");
      v162[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v162, v161, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v141, "addObject:", v34);
    }
  }
  else
  {
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v28;
      v165 = 2114;
      v166 = CFSTR("medicationCodingCollection");
      v167 = 2114;
      v168 = v113;
      v29 = v28;
      _os_log_impl(&dword_224DAC000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v113);
  }
  v114 = v24;
  v152 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("assertionType"), objc_opt_class(), 0, &v152);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v152;
  if (!v138 && v133)
  {
    _HKInitializeLogging();
    v35 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v36;
      v165 = 2114;
      v166 = CFSTR("assertionType");
      v167 = 2114;
      v168 = v133;
      v37 = v36;
      _os_log_impl(&dword_224DAC000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v133);
  }
  v106 = objc_msgSend(v138, "integerValue");
  v151 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("asserter"), objc_opt_class(), 0, &v151);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v151;
  if (!v38 && v132)
  {
    _HKInitializeLogging();
    v39 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v40;
      v165 = 2114;
      v166 = CFSTR("asserter");
      v167 = 2114;
      v168 = v132;
      v41 = v40;
      _os_log_impl(&dword_224DAC000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v132);
  }
  v115 = v38;
  v150 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("assertionDate"), objc_opt_class(), 0, &v150);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v150;
  if (!v42 && v131)
  {
    _HKInitializeLogging();
    v43 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v44;
      v165 = 2114;
      v166 = CFSTR("assertionDate");
      v167 = 2114;
      v168 = v131;
      v45 = v44;
      _os_log_impl(&dword_224DAC000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v131);
  }
  v116 = v42;
  v149 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v149);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v149;
  v112 = v47;
  if (v46 || !v47)
  {
    if (!v46)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x24BDD1540];
      v54 = *MEMORY[0x24BDD0FC8];
      v159[0] = CFSTR("propertyName");
      v159[1] = v54;
      v160[0] = CFSTR("statusCoding");
      v160[1] = v52;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v160, v159, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v141, "addObject:", v56);
    }
  }
  else
  {
    _HKInitializeLogging();
    v48 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v49 = v48;
      v50 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v50;
      v165 = 2114;
      v166 = CFSTR("statusCoding");
      v167 = 2114;
      v168 = v112;
      v51 = v50;
      _os_log_impl(&dword_224DAC000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v112);
  }
  v117 = v46;
  v148 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("dosages"), objc_opt_class(), 1, &v148);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v148;
  if (!v57 && v130)
  {
    _HKInitializeLogging();
    v58 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v59;
      v165 = 2114;
      v166 = CFSTR("dosages");
      v167 = 2114;
      v168 = v130;
      v60 = v59;
      _os_log_impl(&dword_224DAC000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v130);
  }
  v118 = v57;
  v147 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("earliestDosageDate"), objc_opt_class(), 0, &v147);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v147;
  if (!v61 && v129)
  {
    _HKInitializeLogging();
    v62 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v63;
      v165 = 2114;
      v166 = CFSTR("earliestDosageDate");
      v167 = 2114;
      v168 = v129;
      v64 = v63;
      _os_log_impl(&dword_224DAC000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v129);
  }
  v119 = v61;
  v146 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reasonForUseCodingCollections"), objc_opt_class(), 1, &v146);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v146;
  if (!v65 && v128)
  {
    _HKInitializeLogging();
    v66 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v67;
      v165 = 2114;
      v166 = CFSTR("reasonForUseCodingCollections");
      v167 = 2114;
      v168 = v128;
      v68 = v67;
      _os_log_impl(&dword_224DAC000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v128);
  }
  v120 = v65;
  v145 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("notTaken"), objc_opt_class(), 0, &v145);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v145;
  if (!v137 && v127)
  {
    _HKInitializeLogging();
    v69 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v70;
      v165 = 2114;
      v166 = CFSTR("notTaken");
      v167 = 2114;
      v168 = v127;
      v71 = v70;
      _os_log_impl(&dword_224DAC000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v127);
  }
  v105 = objc_msgSend(v137, "BOOLValue");
  v144 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reasonsNotTakenCodingCollections"), objc_opt_class(), 1, &v144);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v144;
  if (!v72 && v126)
  {
    _HKInitializeLogging();
    v73 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v74;
      v165 = 2114;
      v166 = CFSTR("reasonsNotTakenCodingCollections");
      v167 = 2114;
      v168 = v126;
      v75 = v74;
      _os_log_impl(&dword_224DAC000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v126);
  }
  v121 = v72;
  v143 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("effectiveStartDate"), objc_opt_class(), 0, &v143);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v143;
  if (!v76 && v125)
  {
    _HKInitializeLogging();
    v77 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v78;
      v165 = 2114;
      v166 = CFSTR("effectiveStartDate");
      v167 = 2114;
      v168 = v125;
      v79 = v78;
      _os_log_impl(&dword_224DAC000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v125);
  }
  v80 = v76;
  v142 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("effectiveEndDate"), objc_opt_class(), 0, &v142);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v142;
  v83 = v82;
  if (!v81 && v82)
  {
    _HKInitializeLogging();
    v84 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v164 = v85;
      v165 = 2114;
      v166 = CFSTR("effectiveEndDate");
      v167 = 2114;
      v168 = v83;
      v86 = v85;
      _os_log_impl(&dword_224DAC000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v141, "addObject:", v83);
  }
  v87 = v81;
  if (objc_msgSend(v141, "count"))
  {
    v88 = (void *)MEMORY[0x24BDD1540];
    v157 = CFSTR("conversionErrors");
    v158 = v141;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = v90;
    v92 = v91;
    if (v91)
    {
      if (a4)
      {
        v92 = objc_retainAutorelease(v91);
        v140 = 0;
        *a4 = v92;
        v93 = v92;
        goto LABEL_98;
      }
      _HKLogDroppedError();
    }
    v140 = 0;
    v93 = v92;
    goto LABEL_98;
  }
  -[__CFString representedResource](v4, "representedResource");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "receivedDate");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v95;
  if (v95)
  {
    v97 = v95;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v97 = (id)objc_claimAutoreleasedReturnValue();
  }
  v93 = v97;

  v98 = objc_msgSend(v122, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v92 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3D68], "medicationRecordType");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v104) = v105;
  objc_msgSend(MEMORY[0x24BDD3D60], "medicationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:medicationCodingCollection:assertionType:asserter:assertionDate:statusCoding:dosages:earliestDosageDate:reasonForUseCodingCollections:notTaken:reasonsNotTakenCodingCollections:effectiveStartDate:effectiveEndDate:", v100, v123, v98, v93, v110, v124, v111, v92, v99, v109, (v107 >> 2) & 1, v114, v106, v115, v116,
    v117,
    v118,
    v119,
    v120,
    v104,
    v121,
    v80,
    v87);
  v140 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "firstSeenDate");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "_setCreationDate:", v102);

LABEL_98:
  return v140;
}

@end
