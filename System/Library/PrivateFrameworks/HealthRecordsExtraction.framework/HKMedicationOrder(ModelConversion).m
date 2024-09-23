@implementation HKMedicationOrder(ModelConversion)

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
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v115;
  unint64_t v116;
  void *v118;
  void *v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
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
  void *v146;
  void *v147;
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
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  const __CFString *v163;
  id v164;
  _QWORD v165[2];
  _QWORD v166[2];
  _QWORD v167[2];
  _QWORD v168[2];
  uint8_t buf[4];
  id v170;
  __int16 v171;
  const __CFString *v172;
  __int16 v173;
  id v174;
  uint64_t v175;

  v175 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v148 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v147)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      v170 = (id)objc_opt_class();
      v8 = v170;
      _os_log_impl(&dword_224DAC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v9);

  }
  v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v147);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (id)objc_msgSend(v10, "integerValue");

  if ((uint64_t)v120 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v170 = v13;
      v171 = 2114;
      v172 = v4;
      v14 = v13;
      _os_log_impl(&dword_224DAC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addObject:", v15);

  }
  v162 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v162);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v162;
  if (!v134 && v145)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v18;
      v171 = 2114;
      v172 = CFSTR("locale");
      v173 = 2114;
      v174 = v145;
      v19 = v18;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v145);
  }
  -[__CFString country](v4, "country");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v161);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v161;
  if (!v133 && v144)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v22;
      v171 = 2114;
      v172 = CFSTR("note");
      v173 = 2114;
      v174 = v144;
      v23 = v22;
      _os_log_impl(&dword_224DAC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v144);
  }
  v160 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v160);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v160;
  if (!v132 && v143)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v26;
      v171 = 2114;
      v172 = CFSTR("enteredInError");
      v173 = 2114;
      v174 = v143;
      v27 = v26;
      _os_log_impl(&dword_224DAC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v143);
  }
  -[__CFString representedResource](v4, "representedResource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v28, "extractionHints");

  v159 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("medicationCodingCollection"), objc_opt_class(), 0, &v159);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v159;
  v123 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueMedicationCodingCollection instance to avoid throwing exception"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v167[0] = CFSTR("propertyName");
      v167[1] = v37;
      v168[0] = CFSTR("medicationCodingCollection");
      v168[1] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v168, v167, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v148, "addObject:", v39);
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
      v170 = v33;
      v171 = 2114;
      v172 = CFSTR("medicationCodingCollection");
      v173 = 2114;
      v174 = v123;
      v34 = v33;
      _os_log_impl(&dword_224DAC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v123);
  }
  v124 = v29;
  v158 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("prescriber"), objc_opt_class(), 0, &v158);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v158;
  if (!v40 && v142)
  {
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v43;
      v171 = 2114;
      v172 = CFSTR("prescriber");
      v173 = 2114;
      v174 = v142;
      v44 = v43;
      _os_log_impl(&dword_224DAC000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v142);
  }
  v125 = v40;
  v157 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("numberOfFills"), objc_opt_class(), 0, &v157);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v157;
  if (!v146 && v141)
  {
    _HKInitializeLogging();
    v45 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      v47 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v47;
      v171 = 2114;
      v172 = CFSTR("numberOfFills");
      v173 = 2114;
      v174 = v141;
      v48 = v47;
      _os_log_impl(&dword_224DAC000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v141);
  }
  v115 = objc_msgSend(v146, "integerValue");
  v156 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("dosages"), objc_opt_class(), 1, &v156);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v156;
  if (!v49 && v140)
  {
    _HKInitializeLogging();
    v50 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v51 = v50;
      v52 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v52;
      v171 = 2114;
      v172 = CFSTR("dosages");
      v173 = 2114;
      v174 = v140;
      v53 = v52;
      _os_log_impl(&dword_224DAC000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v140);
  }
  v126 = v49;
  v155 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("earliestDosageDate"), objc_opt_class(), 0, &v155);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v155;
  if (!v54 && v139)
  {
    _HKInitializeLogging();
    v55 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v56 = v55;
      v57 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v57;
      v171 = 2114;
      v172 = CFSTR("earliestDosageDate");
      v173 = 2114;
      v174 = v139;
      v58 = v57;
      _os_log_impl(&dword_224DAC000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v139);
  }
  v127 = v54;
  v154 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("writtenDate"), objc_opt_class(), 0, &v154);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v154;
  if (!v59 && v138)
  {
    _HKInitializeLogging();
    v60 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v61 = v60;
      v62 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v62;
      v171 = 2114;
      v172 = CFSTR("writtenDate");
      v173 = 2114;
      v174 = v138;
      v63 = v62;
      _os_log_impl(&dword_224DAC000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v138);
  }
  v128 = v59;
  v153 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("endedDate"), objc_opt_class(), 0, &v153);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v153;
  if (!v64 && v137)
  {
    _HKInitializeLogging();
    v65 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v66 = v65;
      v67 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v67;
      v171 = 2114;
      v172 = CFSTR("endedDate");
      v173 = 2114;
      v174 = v137;
      v68 = v67;
      _os_log_impl(&dword_224DAC000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v137);
  }
  v129 = v64;
  v152 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v152);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v152;
  v122 = v70;
  if (v69 || !v70)
  {
    if (!v69)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)MEMORY[0x24BDD1540];
      v77 = *MEMORY[0x24BDD0FC8];
      v165[0] = CFSTR("propertyName");
      v165[1] = v77;
      v166[0] = CFSTR("statusCoding");
      v166[1] = v75;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v166, v165, 2);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v148, "addObject:", v79);
    }
  }
  else
  {
    _HKInitializeLogging();
    v71 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v72 = v71;
      v73 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v73;
      v171 = 2114;
      v172 = CFSTR("statusCoding");
      v173 = 2114;
      v174 = v122;
      v74 = v73;
      _os_log_impl(&dword_224DAC000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v122);
  }
  v130 = v69;
  v151 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reasonCodingCollections"), objc_opt_class(), 1, &v151);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v151;
  if (!v80 && v136)
  {
    _HKInitializeLogging();
    v81 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v82 = v81;
      v83 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v83;
      v171 = 2114;
      v172 = CFSTR("reasonCodingCollections");
      v173 = 2114;
      v174 = v136;
      v84 = v83;
      _os_log_impl(&dword_224DAC000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v136);
  }
  v131 = v80;
  v150 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("reasonEndedCodingCollection"), objc_opt_class(), 0, &v150);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v150;
  if (!v85 && v135)
  {
    _HKInitializeLogging();
    v86 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v87 = v86;
      v88 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v88;
      v171 = 2114;
      v172 = CFSTR("reasonEndedCodingCollection");
      v173 = 2114;
      v174 = v135;
      v89 = v88;
      _os_log_impl(&dword_224DAC000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v135);
  }
  v90 = v85;
  v149 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusReasonCodingCollection"), objc_opt_class(), 0, &v149);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v149;
  v93 = v92;
  if (!v91 && v92)
  {
    _HKInitializeLogging();
    v94 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v95 = v94;
      v96 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v170 = v96;
      v171 = 2114;
      v172 = CFSTR("statusReasonCodingCollection");
      v173 = 2114;
      v174 = v93;
      v97 = v96;
      _os_log_impl(&dword_224DAC000, v95, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v148, "addObject:", v93);
  }
  v98 = v91;
  if (objc_msgSend(v148, "count"))
  {
    v99 = (void *)MEMORY[0x24BDD1540];
    v163 = CFSTR("conversionErrors");
    v164 = v148;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = v101;
    v103 = v102;
    if (v102)
    {
      if (a4)
      {
        v103 = objc_retainAutorelease(v102);
        v121 = 0;
        *a4 = v103;
        v104 = v103;
        goto LABEL_93;
      }
      _HKLogDroppedError();
    }
    v121 = 0;
    v104 = v103;
    goto LABEL_93;
  }
  -[__CFString representedResource](v4, "representedResource");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "receivedDate");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v106;
  if (v106)
  {
    v108 = v106;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v108 = (id)objc_claimAutoreleasedReturnValue();
  }
  v104 = v108;

  v109 = objc_msgSend(v132, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v103 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3D58], "medicationOrderType");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3D50], "medicationOrderWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:medicationCodingCollection:prescriber:numberOfFills:dosages:earliestDosageDate:writtenDate:endedDate:statusCoding:reasonCodingCollections:reasonEndedCodingCollection:statusReasonCodingCollection:", v111, v133, v109, v104, v119, v134, v120, v103, v110, v118, (v116 >> 2) & 1, v124, v125, v115, v126,
    v127,
    v128,
    v129,
    v130,
    v131,
    v90,
    v98);
  v121 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "firstSeenDate");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "_setCreationDate:", v113);

LABEL_93:
  return v121;
}

@end
