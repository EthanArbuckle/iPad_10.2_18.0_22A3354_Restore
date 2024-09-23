@implementation HKDiagnosticTestReport(ModelConversion)

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
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  unint64_t v96;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
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
  const __CFString *v128;
  id v129;
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  uint8_t buf[4];
  id v137;
  __int16 v138;
  const __CFString *v139;
  __int16 v140;
  id v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v118 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[__CFString representedResource](v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v117)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      v137 = (id)objc_opt_class();
      v8 = v137;
      _os_log_impl(&dword_224DAC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item is missing a represented resource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObject:", v9);

  }
  v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D00]), "initWithFHIRIdentifier:", v117);
  -[__CFString rulesVersion](v4, "rulesVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v10, "integerValue");

  if (v100 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v137 = v13;
      v138 = 2114;
      v139 = v4;
      v14 = v13;
      _os_log_impl(&dword_224DAC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("clinical item has invalid rules version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObject:", v15);

  }
  v127 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("locale"), objc_opt_class(), 0, &v127);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v127;
  if (!v110 && v116)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v137 = v18;
      v138 = 2114;
      v139 = CFSTR("locale");
      v140 = 2114;
      v141 = v116;
      v19 = v18;
      _os_log_impl(&dword_224DAC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v116);
  }
  -[__CFString country](v4, "country");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("note"), objc_opt_class(), 0, &v126);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v126;
  if (!v109 && v115)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v137 = v22;
      v138 = 2114;
      v139 = CFSTR("note");
      v140 = 2114;
      v141 = v115;
      v23 = v22;
      _os_log_impl(&dword_224DAC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v115);
  }
  v125 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v125);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v125;
  if (!v108 && v114)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v137 = v26;
      v138 = 2114;
      v139 = CFSTR("enteredInError");
      v140 = 2114;
      v141 = v114;
      v27 = v26;
      _os_log_impl(&dword_224DAC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v114);
  }
  -[__CFString representedResource](v4, "representedResource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v28, "extractionHints");

  v124 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("diagnosticTestCodingCollection"), objc_opt_class(), 0, &v124);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v124;
  v102 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueDiagnosticTestCodingCollection instance to avoid throwing exception"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v134[0] = CFSTR("propertyName");
      v134[1] = v37;
      v135[0] = CFSTR("diagnosticTestCodingCollection");
      v135[1] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v135, v134, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v118, "addObject:", v39);
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
      v137 = v33;
      v138 = 2114;
      v139 = CFSTR("diagnosticTestCodingCollection");
      v140 = 2114;
      v141 = v102;
      v34 = v33;
      _os_log_impl(&dword_224DAC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v102);
  }
  v103 = v29;
  v123 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("results"), objc_opt_class(), 1, &v123);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v123;
  if (!v40 && v113)
  {
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v137 = v43;
      v138 = 2114;
      v139 = CFSTR("results");
      v140 = 2114;
      v141 = v113;
      v44 = v43;
      _os_log_impl(&dword_224DAC000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v113);
  }
  v104 = v40;
  v122 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("effectiveStartDate"), objc_opt_class(), 0, &v122);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v122;
  if (!v45 && v112)
  {
    _HKInitializeLogging();
    v46 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v47 = v46;
      v48 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v137 = v48;
      v138 = 2114;
      v139 = CFSTR("effectiveStartDate");
      v140 = 2114;
      v141 = v112;
      v49 = v48;
      _os_log_impl(&dword_224DAC000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v112);
  }
  v105 = v45;
  v121 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("statusCoding"), objc_opt_class(), 0, &v121);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v121;
  v101 = v51;
  if (v50 || !v51)
  {
    if (!v50)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x24BDD1540];
      v58 = *MEMORY[0x24BDD0FC8];
      v132[0] = CFSTR("propertyName");
      v132[1] = v58;
      v133[0] = CFSTR("statusCoding");
      v133[1] = v56;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v133, v132, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v118, "addObject:", v60);
    }
  }
  else
  {
    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v137 = v54;
      v138 = 2114;
      v139 = CFSTR("statusCoding");
      v140 = 2114;
      v141 = v101;
      v55 = v54;
      _os_log_impl(&dword_224DAC000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v101);
  }
  v106 = v50;
  v120 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("effectiveEndDate"), objc_opt_class(), 0, &v120);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v120;
  if (!v61 && v111)
  {
    _HKInitializeLogging();
    v62 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v63 = v62;
      v64 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v137 = v64;
      v138 = 2114;
      v139 = CFSTR("effectiveEndDate");
      v140 = 2114;
      v141 = v111;
      v65 = v64;
      _os_log_impl(&dword_224DAC000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v111);
  }
  v107 = v61;
  v119 = 0;
  -[__CFString medicalRecordPropertyValueForKey:expectedClass:isArray:error:](v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("issueDate"), objc_opt_class(), 0, &v119);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v119;
  v68 = v67;
  if (v66 || !v67)
  {
    if (!v66)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required value is nil, not creating valueIssueDate instance to avoid throwing exception"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)MEMORY[0x24BDD1540];
      v75 = *MEMORY[0x24BDD0FC8];
      v130[0] = CFSTR("propertyName");
      v130[1] = v75;
      v131[0] = CFSTR("issueDate");
      v131[1] = v73;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v131, v130, 2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 204, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v118, "addObject:", v77);
    }
  }
  else
  {
    _HKInitializeLogging();
    v69 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v70 = v69;
      v71 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v137 = v71;
      v138 = 2114;
      v139 = CFSTR("issueDate");
      v140 = 2114;
      v141 = v68;
      v72 = v71;
      _os_log_impl(&dword_224DAC000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);

    }
    objc_msgSend(v118, "addObject:", v68);
  }
  v78 = v66;
  if (objc_msgSend(v118, "count"))
  {
    v79 = (void *)MEMORY[0x24BDD1540];
    v128 = CFSTR("conversionErrors");
    v129 = v118;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 201, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = v81;
    v83 = v82;
    if (v82)
    {
      if (a4)
      {
        v83 = objc_retainAutorelease(v82);
        v84 = 0;
        *a4 = v83;
        v85 = v83;
        goto LABEL_70;
      }
      _HKLogDroppedError();
    }
    v84 = 0;
    v85 = v83;
    goto LABEL_70;
  }
  -[__CFString representedResource](v4, "representedResource");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "receivedDate");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87)
  {
    v89 = v87;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v89 = (id)objc_claimAutoreleasedReturnValue();
  }
  v85 = v89;

  v90 = objc_msgSend(v108, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v83 = (id)objc_claimAutoreleasedReturnValue();
  -[__CFString medicalRecordMetadata](v4, "medicalRecordMetadata");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3B40], "diagnosticTestReportType");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3B38], "diagnosticTestReportWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:diagnosticTestCodingCollection:results:effectiveStartDate:statusCoding:effectiveEndDate:issueDate:", v92, v109, v90, v85, v99, v110, v100, v83, v91, v98, (v96 >> 2) & 1, v103, v104, v105, v106, v107,
    v78);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString representedResource](v4, "representedResource");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "firstSeenDate");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "_setCreationDate:", v94);

LABEL_70:
  return v84;
}

@end
