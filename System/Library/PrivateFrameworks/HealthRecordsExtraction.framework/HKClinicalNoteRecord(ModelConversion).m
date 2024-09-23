@implementation HKClinicalNoteRecord(ModelConversion)

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
  id v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  unint64_t v102;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
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
  const __CFString *v137;
  id v138;
  _QWORD v139[2];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[2];
  uint8_t buf[4];
  id v146;
  __int16 v147;
  const __CFString *v148;
  __int16 v149;
  id v150;
  uint64_t v151;

  v151 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v126 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v125)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      v146 = (id)objc_opt_class();
      v8 = v146;
      _os_log_impl(&dword_224DAC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "addObject:", v9);

  }
  v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v125);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v10, "integerValue");

  if (v106 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v146 = v13;
      v147 = 2114;
      v148 = v4;
      v14 = v13;
      _os_log_impl(&dword_224DAC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "addObject:", v15);

  }
  v136 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v136);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v136;
  if (!v117 && v123)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v146 = v18;
      v147 = 2114;
      v148 = CFSTR("locale");
      v149 = 2114;
      v150 = v123;
      v19 = v18;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v123);
  }
  -[__CFString country](v4, "country");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v135);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v135;
  if (!v116 && v122)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v146 = v22;
      v147 = 2114;
      v148 = CFSTR("note");
      v149 = 2114;
      v150 = v122;
      v23 = v22;
      _os_log_impl(&dword_224DAC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v122);
  }
  v134 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v134);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v134;
  if (!v115 && v121)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v146 = v26;
      v147 = 2114;
      v148 = CFSTR("enteredInError");
      v149 = 2114;
      v150 = v121;
      v27 = v26;
      _os_log_impl(&dword_224DAC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v121);
  }
  -[__CFString representedResource](v4, "representedResource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v28, "extractionHints");

  v133 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v133);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v133;
  v109 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v143[0] = CFSTR("propertyName");
      v143[1] = v37;
      v144[0] = CFSTR("statusCoding");
      v144[1] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v144, v143, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v126, "addObject:", v39);
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
      v146 = v33;
      v147 = 2114;
      v148 = CFSTR("statusCoding");
      v149 = 2114;
      v150 = v109;
      v34 = v33;
      _os_log_impl(&dword_224DAC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v109);
  }
  v110 = v29;
  v132 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("documentTypeCodingCollection"), objc_opt_class(), 0, &v132);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v132;
  v108 = v41;
  if (v40 || !v41)
  {
    if (!v40)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueDocumentTypeCodingCollection instance to avoid throwing exception"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)MEMORY[0x24BDD1540];
      v48 = *MEMORY[0x24BDD0FC8];
      v141[0] = CFSTR("propertyName");
      v141[1] = v48;
      v142[0] = CFSTR("documentTypeCodingCollection");
      v142[1] = v46;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v142, v141, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v126, "addObject:", v50);
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
      v146 = v44;
      v147 = 2114;
      v148 = CFSTR("documentTypeCodingCollection");
      v149 = 2114;
      v150 = v108;
      v45 = v44;
      _os_log_impl(&dword_224DAC000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v108);
  }
  v111 = v40;
  v131 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("noteCreationDate"), objc_opt_class(), 0, &v131);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v131;
  if (!v51 && v120)
  {
    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v146 = v54;
      v147 = 2114;
      v148 = CFSTR("noteCreationDate");
      v149 = 2114;
      v150 = v120;
      v55 = v54;
      _os_log_impl(&dword_224DAC000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v120);
  }
  v112 = v51;
  v130 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("categoriesCodingCollections"), objc_opt_class(), 1, &v130);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v130;
  v107 = v57;
  if (v56 || !v57)
  {
    if (!v56)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueCategoriesCodingCollections instance to avoid throwing exception"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)MEMORY[0x24BDD1540];
      v64 = *MEMORY[0x24BDD0FC8];
      v139[0] = CFSTR("propertyName");
      v139[1] = v64;
      v140[0] = CFSTR("categoriesCodingCollections");
      v140[1] = v62;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v140, v139, 2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v126, "addObject:", v66);
    }
  }
  else
  {
    _HKInitializeLogging();
    v58 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v59 = v58;
      v60 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v146 = v60;
      v147 = 2114;
      v148 = CFSTR("categoriesCodingCollections");
      v149 = 2114;
      v150 = v107;
      v61 = v60;
      _os_log_impl(&dword_224DAC000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v107);
  }
  v113 = v56;
  v129 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("relevantStartDate"), objc_opt_class(), 0, &v129);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v129;
  if (!v67 && v119)
  {
    _HKInitializeLogging();
    v68 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v69 = v68;
      v70 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v146 = v70;
      v147 = 2114;
      v148 = CFSTR("relevantStartDate");
      v149 = 2114;
      v150 = v119;
      v71 = v70;
      _os_log_impl(&dword_224DAC000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v119);
  }
  v114 = v67;
  v128 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("relevantEndDate"), objc_opt_class(), 0, &v128);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v128;
  if (!v72 && v118)
  {
    _HKInitializeLogging();
    v73 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v74 = v73;
      v75 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v146 = v75;
      v147 = 2114;
      v148 = CFSTR("relevantEndDate");
      v149 = 2114;
      v150 = v118;
      v76 = v75;
      _os_log_impl(&dword_224DAC000, v74, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v118);
  }
  v77 = v72;
  v127 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("authors"), objc_opt_class(), 1, &v127);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v127;
  v80 = v79;
  if (!v78 && v79)
  {
    _HKInitializeLogging();
    v81 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v82 = v81;
      v83 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v146 = v83;
      v147 = 2114;
      v148 = CFSTR("authors");
      v149 = 2114;
      v150 = v80;
      v84 = v83;
      _os_log_impl(&dword_224DAC000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v126, "addObject:", v80);
  }
  v85 = v78;
  if (objc_msgSend(v126, "count"))
  {
    v86 = (void *)MEMORY[0x24BDD1540];
    v137 = CFSTR("conversionErrors");
    v138 = v126;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v89 = v88;
    v90 = v89;
    if (v89)
    {
      if (a4)
      {
        v90 = objc_retainAutorelease(v89);
        v91 = 0;
        *a4 = v90;
        v92 = v90;
        goto LABEL_75;
      }
      _HKLogDroppedError();
    }
    v91 = 0;
    v92 = v90;
    goto LABEL_75;
  }
  -[__CFString representedResource](v4, "representedResource");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "receivedDate");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v94;
  if (v94)
  {
    v96 = v94;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v96 = (id)objc_claimAutoreleasedReturnValue();
  }
  v92 = v96;

  v97 = objc_msgSend(v115, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v90 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD39D0], "clinicalNoteRecordType");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD39C8], "clinicalNoteRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:statusCoding:documentTypeCodingCollection:noteCreationDate:categoriesCodingCollections:relevantStartDate:relevantEndDate:authors:", v98, v116, v97, v92, v105, v117, v106, v90, v124, v104, (v102 >> 2) & 1, v110, v111, v112, v113,
    v114,
    v77,
    v85);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "firstSeenDate");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "_setCreationDate:", v100);

LABEL_75:
  return v91;
}

@end
