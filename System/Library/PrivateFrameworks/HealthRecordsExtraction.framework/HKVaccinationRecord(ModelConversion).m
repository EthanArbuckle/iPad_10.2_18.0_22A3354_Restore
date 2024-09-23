@implementation HKVaccinationRecord(ModelConversion)

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
  NSObject *v39;
  id v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  NSObject *v45;
  id v46;
  void *v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  id v51;
  void *v52;
  id v53;
  NSObject *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  id v65;
  char v66;
  void *v67;
  NSObject *v68;
  id v69;
  void *v70;
  NSObject *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  NSObject *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v96;
  uint64_t v97;
  char v98;
  unint64_t v99;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
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
  id v131;
  id v132;
  id v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
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
  id v156;
  id v157;
  const __CFString *v158;
  id v159;
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
  v139 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v137)
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
    objc_msgSend(v139, "addObject:", v8);

  }
  v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v137);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v9, "integerValue");

  if (v103 <= 0)
  {
    _HKInitializeLogging();
    v10 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v165 = v11;
      v166 = 2114;
      v167 = v4;
      _os_log_impl(&dword_224DAC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "addObject:", v12);

  }
  v157 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v157);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v157;
  if (!v119 && v134)
  {
    _HKInitializeLogging();
    v13 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v14;
      v166 = 2114;
      v167 = CFSTR("locale");
      v168 = 2114;
      v169 = v134;
      _os_log_impl(&dword_224DAC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v134);
  }
  -[__CFString country](v4, "country");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v156);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v156;
  if (!v118 && v133)
  {
    _HKInitializeLogging();
    v15 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v16;
      v166 = 2114;
      v167 = CFSTR("note");
      v168 = 2114;
      v169 = v133;
      _os_log_impl(&dword_224DAC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v133);
  }
  v155 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v155);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v155;
  if (!v117 && v132)
  {
    _HKInitializeLogging();
    v17 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v18;
      v166 = 2114;
      v167 = CFSTR("enteredInError");
      v168 = 2114;
      v169 = v132;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v132);
  }
  -[__CFString representedResource](v4, "representedResource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v19, "extractionHints");

  v154 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("vaccinationCodings"), objc_opt_class(), 1, &v154);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v154;
  v105 = v21;
  if (v20 || !v21)
  {
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueVaccinationCodings instance to avoid throwing exception"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FC8];
      v162[0] = CFSTR("propertyName");
      v162[1] = v26;
      v163[0] = CFSTR("vaccinationCodings");
      v163[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v163, v162, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v139, "addObject:", v28);
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
      v165 = v23;
      v166 = 2114;
      v167 = CFSTR("vaccinationCodings");
      v168 = 2114;
      v169 = v105;
      _os_log_impl(&dword_224DAC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v105);
  }
  v106 = v20;
  v153 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("expirationDate"), objc_opt_class(), 0, &v153);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v153;
  if (!v29 && v131)
  {
    _HKInitializeLogging();
    v30 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v31;
      v166 = 2114;
      v167 = CFSTR("expirationDate");
      v168 = 2114;
      v169 = v131;
      _os_log_impl(&dword_224DAC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v131);
  }
  v107 = v29;
  v152 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("doseNumber"), objc_opt_class(), 0, &v152);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v152;
  if (!v32 && v130)
  {
    _HKInitializeLogging();
    v33 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v34;
      v166 = 2114;
      v167 = CFSTR("doseNumber");
      v168 = 2114;
      v169 = v130;
      _os_log_impl(&dword_224DAC000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v130);
  }
  v108 = v32;
  v151 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("doseQuantity"), objc_opt_class(), 0, &v151);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v151;
  if (!v35 && v129)
  {
    _HKInitializeLogging();
    v36 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v37;
      v166 = 2114;
      v167 = CFSTR("doseQuantity");
      v168 = 2114;
      v169 = v129;
      _os_log_impl(&dword_224DAC000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v129);
  }
  v109 = v35;
  v150 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("lotNumber"), objc_opt_class(), 0, &v150);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v150;
  if (!v38 && v128)
  {
    _HKInitializeLogging();
    v39 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v40;
      v166 = 2114;
      v167 = CFSTR("lotNumber");
      v168 = 2114;
      v169 = v128;
      _os_log_impl(&dword_224DAC000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v128);
  }
  v110 = v38;
  v149 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("performer"), objc_opt_class(), 0, &v149);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v149;
  if (!v41 && v127)
  {
    _HKInitializeLogging();
    v42 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v43;
      v166 = 2114;
      v167 = CFSTR("performer");
      v168 = 2114;
      v169 = v127;
      _os_log_impl(&dword_224DAC000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v127);
  }
  v111 = v41;
  v148 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("bodySiteCodings"), objc_opt_class(), 1, &v148);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v148;
  if (!v44 && v126)
  {
    _HKInitializeLogging();
    v45 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v46;
      v166 = 2114;
      v167 = CFSTR("bodySiteCodings");
      v168 = 2114;
      v169 = v126;
      _os_log_impl(&dword_224DAC000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v126);
  }
  v112 = v44;
  v147 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reaction"), objc_opt_class(), 0, &v147);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v147;
  if (!v47 && v125)
  {
    _HKInitializeLogging();
    v48 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v49;
      v166 = 2114;
      v167 = CFSTR("reaction");
      v168 = 2114;
      v169 = v125;
      _os_log_impl(&dword_224DAC000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v125);
  }
  v114 = v47;
  v146 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("notGiven"), objc_opt_class(), 0, &v146);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v146;
  if (!v136 && v124)
  {
    _HKInitializeLogging();
    v50 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v51;
      v166 = 2114;
      v167 = CFSTR("notGiven");
      v168 = 2114;
      v169 = v124;
      _os_log_impl(&dword_224DAC000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v124);
  }
  v98 = objc_msgSend(v136, "BOOLValue");
  v145 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("administrationDate"), objc_opt_class(), 0, &v145);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v145;
  v104 = v53;
  if (v52 || !v53)
  {
    if (!v52)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueAdministrationDate instance to avoid throwing exception"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x24BDD1540];
      v58 = *MEMORY[0x24BDD0FC8];
      v160[0] = CFSTR("propertyName");
      v160[1] = v58;
      v161[0] = CFSTR("administrationDate");
      v161[1] = v56;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v139, "addObject:", v60);
    }
  }
  else
  {
    _HKInitializeLogging();
    v54 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v55;
      v166 = 2114;
      v167 = CFSTR("administrationDate");
      v168 = 2114;
      v169 = v104;
      _os_log_impl(&dword_224DAC000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v104);
  }
  v113 = v52;
  v144 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v144);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v144;
  if (!v61 && v123)
  {
    _HKInitializeLogging();
    v62 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v63;
      v166 = 2114;
      v167 = CFSTR("statusCoding");
      v168 = 2114;
      v169 = v123;
      _os_log_impl(&dword_224DAC000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v123);
  }
  v115 = v61;
  v143 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("patientReported"), objc_opt_class(), 0, &v143);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v143;
  if (!v135 && v122)
  {
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v65;
      v166 = 2114;
      v167 = CFSTR("patientReported");
      v168 = 2114;
      v169 = v122;
      _os_log_impl(&dword_224DAC000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v122);
  }
  v66 = objc_msgSend(v135, "BOOLValue");
  v142 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("routeCodings"), objc_opt_class(), 1, &v142);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v142;
  if (!v67 && v121)
  {
    _HKInitializeLogging();
    v68 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v69;
      v166 = 2114;
      v167 = CFSTR("routeCodings");
      v168 = 2114;
      v169 = v121;
      _os_log_impl(&dword_224DAC000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v121);
  }
  v116 = v67;
  v141 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reasonsCodings"), objc_opt_class(), 1, &v141);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v141;
  if (!v70 && v120)
  {
    _HKInitializeLogging();
    v71 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v72;
      v166 = 2114;
      v167 = CFSTR("reasonsCodings");
      v168 = 2114;
      v169 = v120;
      _os_log_impl(&dword_224DAC000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v120);
  }
  v73 = v70;
  v140 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reasonsNotGivenCodings"), objc_opt_class(), 1, &v140);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v140;
  v76 = v75;
  if (!v74 && v75)
  {
    _HKInitializeLogging();
    v77 = (id)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v165 = v78;
      v166 = 2114;
      v167 = CFSTR("reasonsNotGivenCodings");
      v168 = 2114;
      v169 = v76;
      _os_log_impl(&dword_224DAC000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v139, "addObject:", v76);
  }
  v79 = v74;
  if (objc_msgSend(v139, "count"))
  {
    v80 = (void *)MEMORY[0x24BDD1540];
    v158 = CFSTR("conversionErrors");
    v159 = v139;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
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
        goto LABEL_113;
      }
      _HKLogDroppedError();
    }
    v85 = 0;
    v86 = v84;
    goto LABEL_113;
  }
  -[__CFString representedResource](v4, "representedResource");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "receivedDate");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88;
  if (v88)
  {
    v86 = v88;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v86 = (id)objc_claimAutoreleasedReturnValue();

  }
  v90 = objc_msgSend(v117, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v84 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD40C0], "vaccinationRecordType");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v97) = v66;
  LOBYTE(v96) = v98;
  objc_msgSend(MEMORY[0x24BDD40B8], "vaccinationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:vaccinationCodings:expirationDate:doseNumber:doseQuantity:lotNumber:performer:bodySiteCodings:reaction:notGiven:administrationDate:statusCoding:patientReported:routeCodings:reasonsCodings:reasonsNotGivenCodings:", v91, v118, v90, v86, v102, v119, v103, v84, v138, v101, (v99 >> 2) & 1, v106, v107, v108, v109,
    v110,
    v111,
    v112,
    v114,
    v96,
    v113,
    v115,
    v97,
    v116,
    v73,
    v79);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "firstSeenDate");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "_setCreationDate:", v94);

  v85 = v92;
LABEL_113:

  return v85;
}

@end
