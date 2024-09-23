@implementation MXSampleAnalysisParser

+ (void)sendDiagnosticReport:(id)a3 forType:(int64_t)a4 forSourceID:(int64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "sampleStore"), (v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v10 = (void *)v9,
        objc_msgSend(v8, "options"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    +[MXSampleAnalysisParser constructPayloadWithReport:withType:](MXSampleAnalysisParser, "constructPayloadWithReport:withType:", v8, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MXSourceManager sharedManager](MXSourceManager, "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendDiagnostic:forDate:andSourceID:", v12, v13, a5);

    }
  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      +[MXSampleAnalysisParser sendDiagnosticReport:forType:forSourceID:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

+ (id)constructPayloadWithReport:(id)a3 withType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  id v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  double v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  id v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  _BOOL8 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  id v105;
  void *v106;
  const __CFString *v107;
  id v108;
  id v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  _QWORD v115[2];

  v115[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "sampleStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "targetProcess");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[MXSourceUtilities isMetricKitClient:forUser:](MXSourceUtilities, "isMetricKitClient:forUser:", v8, objc_msgSend(v9, "uid"));

    if (v10)
    {
      +[MXSampleAnalysisParser getCallStackForReport:withType:](MXSampleAnalysisParser, "getCallStackForReport:withType:", v5, a4);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x24BDDE650]);
      objc_msgSend(v6, "targetProcessBundleVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "targetProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v12, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:platformArchitecture:bundleID:", &stru_24D561108, &stru_24D561108, &stru_24D561108, v13, &stru_24D561108, v15);

      v109 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.12();
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v16)
        +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.11(v16, v17, v18, v19, v20, v21, v22, v23);
      objc_msgSend(v6, "eventTimeRange");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "startTime");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "wallTime");
      v27 = v26;

      if (v27 != 0.0)
      {
        v28 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v6, "eventTimeRange");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
LABEL_9:
        objc_msgSend(v29, "startTime");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "wallTime");
        objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:");
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v33)
        +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.10(v33, v34, v35, v36, v37, v38, v39, v40);
      objc_msgSend(v6, "eventTimeRange");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "startTime");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = objc_msgSend(v6, "indexOfFirstSampleOnOrAfterTimestamp:", v30);
      if (v42 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v43 = v42;
        objc_msgSend(v6, "sampleTimestamps");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectAtIndexedSubscript:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "guessMissingTimesBasedOnTimestamp:", v45);

      }
      objc_msgSend(v30, "wallTime");
      if (v46 == 0.0)
      {
        objc_msgSend(v6, "startTime");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "wallTime");
        v90 = v89;

        v91 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v90 != 0.0)
        {
          if (v91)
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.8(v91, v92, v93, v94, v95, v96, v97, v98);
          v28 = (void *)MEMORY[0x24BDBCE60];
          v29 = v6;
          goto LABEL_9;
        }
        if (v91)
          +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.9(v91, v92, v93, v94, v95, v96, v97, v98);
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v48 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v30, "wallTime");
        objc_msgSend(v47, "dateWithTimeIntervalSinceReferenceDate:");
        v48 = objc_claimAutoreleasedReturnValue();
      }
      v113 = (void *)v48;
LABEL_20:
      v49 = (void *)v11;

      v50 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
      objc_msgSend(v50, "setLocale:");
      objc_msgSend(v50, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.7(v50, (uint64_t)v113);
      v108 = v50;
      objc_msgSend(v6, "targetProcess");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "pid");
      objc_msgSend(v6, "targetProcess");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "bundleIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[MXSourceUtilities getSignpostDataforPid:forClient:andEventTimestamp:](MXSourceUtilities, "getSignpostDataforPid:forClient:andEventTimestamp:", v52, v54, v113);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 == 1)
      {
        v72 = objc_alloc(MEMORY[0x24BDD1660]);
        v73 = (double)(unint64_t)objc_msgSend(v6, "bytesWritten");
        objc_msgSend(MEMORY[0x24BDD1920], "bytes");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v72, "initWithDoubleValue:unit:", v74, v73);

        objc_msgSend(MEMORY[0x24BDD1920], "megabytes");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "measurementByConvertingToUnit:", v75);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = objc_alloc(MEMORY[0x24BDDE610]);
        objc_msgSend(v6, "targetProcessBundleShortVersion");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v49;
        v69 = (void *)objc_msgSend(v76, "initWithMetaData:applicationVersion:signpostData:pid:totalWritesCaused:stackTrace:", v111, v77, v112, objc_msgSend(v6, "targetProcessId"), v65, v49);

        if (v69)
        {
          v70 = v109;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.6(v69);
          objc_msgSend(v109, "setObject:forKey:", v69, CFSTR("diskWriteExceptionDiagnostics"));
          v71 = -[MXSpinTracerData initPayloadDataWithDiagnostics:]([MXSpinTracerData alloc], "initPayloadDataWithDiagnostics:", v109);
          v68 = (void *)v111;
          goto LABEL_49;
        }
        v71 = 0;
        v68 = (void *)v111;
        goto LABEL_48;
      }
      v55 = v49;
      if (!a4)
      {
        v56 = objc_alloc(MEMORY[0x24BDD1660]);
        objc_msgSend(v6, "cpuUsed");
        v58 = v57;
        objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v56, "initWithDoubleValue:unit:", v59, v58);

        v61 = objc_alloc(MEMORY[0x24BDD1660]);
        objc_msgSend(v6, "cpuDuration");
        v63 = v62;
        objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v61, "initWithDoubleValue:unit:", v64, v63);

        v66 = objc_alloc(MEMORY[0x24BDDE5C8]);
        objc_msgSend(v6, "targetProcessBundleShortVersion");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v111;
        v69 = (void *)objc_msgSend(v66, "initWithMetaData:applicationVersion:signpostData:pid:callStack:totalCpuTime:totalSampledTime:", v111, v67, v112, objc_msgSend(v6, "targetProcessId"), v55, v60, v65);

        if (v69)
        {
          v70 = v109;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.5(v69);
          objc_msgSend(v109, "setObject:forKey:", v69, CFSTR("cpuExceptionDiagnostics"));
          v71 = -[MXSpinTracerData initPayloadDataWithDiagnostics:]([MXSpinTracerData alloc], "initPayloadDataWithDiagnostics:", v109);
          goto LABEL_49;
        }
        v71 = 0;
LABEL_48:
        v70 = v109;
LABEL_49:

        v87 = v108;
LABEL_50:

LABEL_51:
        if (v71)
        {
          v114 = v8;
          v115[0] = v71;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v115, &v114, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = 0;
        }

        goto LABEL_55;
      }
      v68 = (void *)v111;
      if (a4 != 4)
      {
        if (a4 == 3)
        {
          v100 = objc_alloc(MEMORY[0x24BDD1660]);
          objc_msgSend(v6, "eventTimeRange");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "deltaMachAbsTimeSeconds");
          v103 = v102;
          objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (void *)objc_msgSend(v100, "initWithDoubleValue:unit:", v104, v103);

          v105 = objc_alloc(MEMORY[0x24BDDE598]);
          objc_msgSend(v6, "targetProcessBundleShortVersion");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)objc_msgSend(v105, "initWithMetaData:applicationVersion:signpostData:pid:callStack:launchDuration:", v111, v106, v112, objc_msgSend(v6, "targetProcessId"), v55, v60);

          if (v65)
          {
            v87 = v108;
            v70 = v109;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.4(v65);
            v107 = CFSTR("appLaunchDiagnostic");
            goto LABEL_68;
          }
LABEL_60:
          v71 = 0;
          v87 = v108;
          v70 = v109;
          goto LABEL_50;
        }
        if (a4 != 2)
        {
          v71 = 0;
          v87 = v50;
          v70 = v109;
          goto LABEL_51;
        }
      }
      if (a4 == 2)
        v78 = 1;
      else
        v78 = 2;
      v79 = objc_alloc(MEMORY[0x24BDD1660]);
      objc_msgSend(v6, "eventTimeRange");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "deltaMachAbsTimeSeconds");
      v82 = v81;
      objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend(v79, "initWithDoubleValue:unit:", v83, v82);

      v84 = objc_alloc(MEMORY[0x24BDDE630]);
      objc_msgSend(v6, "targetProcessBundleShortVersion");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)objc_msgSend(v84, "initWithMetaData:applicationVersion:signpostData:pid:callStack:hangDuration:hangType:", v111, v85, v112, objc_msgSend(v6, "targetProcessId"), v55, v60, v78);

      if (v65)
      {
        v86 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        v70 = v109;
        if (a4 == 2)
        {
          v87 = v108;
          if (v86)
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.2(v65);
        }
        else
        {
          v87 = v108;
          if (v86)
            +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.3(v65);
        }
        v107 = CFSTR("hangDiagnostic");
LABEL_68:
        objc_msgSend(v70, "setObject:forKey:", v65, v107);
        v71 = -[MXHangTracerData initPayloadDataWithDiagnostics:]([MXHangTracerData alloc], "initPayloadDataWithDiagnostics:", v70);
        goto LABEL_50;
      }
      goto LABEL_60;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    +[MXSampleAnalysisParser constructPayloadWithReport:withType:].cold.1();
  v32 = 0;
LABEL_55:

  return v32;
}

+ (id)getCallStackForReport:(id)a3 withType:(int64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "sampleStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "aggregateStacksByProcess");

  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      +[MXSampleAnalysisParser getCallStackForReport:withType:].cold.1(v7);
    objc_msgSend(v7, "targetProcess");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "targetProcess");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "callTreeForTask:", v11);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      +[MXSampleAnalysisParser parseCallTree:isAttributedThread:](MXSampleAnalysisParser, "parseCallTree:isAttributedThread:", v10, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v6, "addObject:", v12);
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  objc_msgSend(v5, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "printTargetThreadOnly");
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2 || (v14 & 1) != 0)
  {

LABEL_15:
    objc_msgSend(v7, "targetProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "threads");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v7, "targetThreadId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v10 = v20;
    }
    else
    {
      objc_msgSend(v7, "targetProcess");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mainThread");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      +[MXSampleAnalysisParser getCallStackForReport:withType:].cold.2();
      if (!v10)
        goto LABEL_24;
    }
    else if (!v10)
    {
      goto LABEL_24;
    }
    objc_msgSend(v7, "targetProcess");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callTreeForThread:inTask:", v10, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[MXSampleAnalysisParser parseCallTree:isAttributedThread:](MXSampleAnalysisParser, "parseCallTree:isAttributedThread:", v12, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v6, "addObject:", v24);

    goto LABEL_23;
  }

  if (a4 == 4)
    goto LABEL_15;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    +[MXSampleAnalysisParser getCallStackForReport:withType:].cold.3(v7);
  objc_msgSend(v7, "targetProcess");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "targetProcess");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callTreesForThreadsInTask:", v15);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "threadCallTrees");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __57__MXSampleAnalysisParser_getCallStackForReport_withType___block_invoke;
    v28[3] = &unk_24D560D40;
    v29 = v7;
    v30 = v6;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v28);

    v12 = v29;
LABEL_23:

    v25 = objc_alloc(MEMORY[0x24BDDE5E8]);
    objc_msgSend(v5, "options");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v25, "initWithThreadArray:aggregatedByProcess:", v6, objc_msgSend(v26, "aggregateStacksByProcess"));

  }
LABEL_24:

  return v10;
}

void __57__MXSampleAnalysisParser_getCallStackForReport_withType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "targetThreadId");
  objc_msgSend(v4, "thread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 == objc_msgSend(v6, "threadId");

  +[MXSampleAnalysisParser parseCallTree:isAttributedThread:](MXSampleAnalysisParser, "parseCallTree:isAttributedThread:", v4, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v8 = v9;
  }

}

+ (id)parseCallTree:(id)a3 isAttributedThread:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "rootFrames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__MXSampleAnalysisParser_parseCallTree_isAttributedThread___block_invoke;
  v12[3] = &unk_24D560D68;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE5E0]), "initWithTopCallStackFrames:isAttributedThread:", v9, v4);
  return v10;
}

void __59__MXSampleAnalysisParser_parseCallTree_isAttributedThread___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[MXSampleAnalysisParser parseCallTreeFrame:withDepth:](MXSampleAnalysisParser, "parseCallTreeFrame:withDepth:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

+ (id)parseCallTreeFrame:(id)a3 withDepth:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  unint64_t v28;

  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "frame"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "childFrames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (a4 <= 0x81 && v9)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v6, "childFrames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __55__MXSampleAnalysisParser_parseCallTreeFrame_withDepth___block_invoke;
      v26[3] = &unk_24D560D90;
      v27 = v11;
      v28 = a4;
      v25 = v11;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v26);

      objc_msgSend(v6, "frame");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "instruction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "binary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x24BDDE5D8]);
      objc_msgSend(v24, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "frame");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v18, "address"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v14, "offsetIntoTextSegment"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "sampleCount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v23, "initWithBinaryName:binaryUUID:address:binaryOffset:sampleCount:withDepth:subFrameArray:", v15, v16, v19, v20, v21, a4, v25);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __55__MXSampleAnalysisParser_parseCallTreeFrame_withDepth___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[MXSampleAnalysisParser parseCallTreeFrame:withDepth:](MXSampleAnalysisParser, "parseCallTreeFrame:withDepth:", a2, *(_QWORD *)(a1 + 40) + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

+ (void)sendDiagnosticReport:(uint64_t)a3 forType:(uint64_t)a4 forSourceID:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21642F000, MEMORY[0x24BDACB70], a3, "Malformed diagnostic report received!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithReport:withType:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_21642F000, MEMORY[0x24BDACB70], v0, "Not a metrickit client: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8();
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "hangDuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21642F000, MEMORY[0x24BDACB70], v2, "Hang Diagnostic: %@ with hang duration: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "hangDuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21642F000, MEMORY[0x24BDACB70], v2, "Compositor Client Hang Diagnostic: %@ with hang duration: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "launchDuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21642F000, MEMORY[0x24BDACB70], v2, "App Launch Diagnostic: %@ with launch duration: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "totalCPUTime");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21642F000, MEMORY[0x24BDACB70], v2, "CPU Exception Diagnostic: %@ with cpu time: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)constructPayloadWithReport:(void *)a1 withType:.cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "totalWritesCaused");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21642F000, MEMORY[0x24BDACB70], v2, "Disk Write Exception Diagnostic: %@ with writes caused: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)constructPayloadWithReport:(void *)a1 withType:(uint64_t)a2 .cold.7(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "stringFromDate:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_21642F000, MEMORY[0x24BDACB70], v3, "The timestamp for the detected event is %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)constructPayloadWithReport:(uint64_t)a3 withType:(uint64_t)a4 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21642F000, MEMORY[0x24BDACB70], a3, "Failed to calculate timestamp. Falling back to start of sampling.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithReport:(uint64_t)a3 withType:(uint64_t)a4 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21642F000, MEMORY[0x24BDACB70], a3, "All timestamps are missing. Falling back to current time", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithReport:(uint64_t)a3 withType:(uint64_t)a4 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_21642F000, MEMORY[0x24BDACB70], a3, "sampleStore does not have event timestamp - calculating closest timestamp", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithReport:(uint64_t)a3 withType:(uint64_t)a4 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_21642F000, MEMORY[0x24BDACB70], a3, "Starting to readback MXSignposts", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithReport:withType:.cold.12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_21642F000, MEMORY[0x24BDACB70], v0, "Report Type: %ld", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8();
}

+ (void)getCallStackForReport:(void *)a1 withType:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "targetProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_21642F000, MEMORY[0x24BDACB70], v2, "Call Stack by Process %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)getCallStackForReport:withType:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_21642F000, MEMORY[0x24BDACB70], v0, "Call Stack for Target Thread %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8();
}

+ (void)getCallStackForReport:(void *)a1 withType:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "targetProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_21642F000, MEMORY[0x24BDACB70], v2, "Call Stack by All Threads in Task %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
