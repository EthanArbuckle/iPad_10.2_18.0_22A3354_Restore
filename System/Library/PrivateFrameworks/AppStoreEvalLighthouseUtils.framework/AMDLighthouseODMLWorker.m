@implementation AMDLighthouseODMLWorker

- (AMDLighthouseODMLWorker)init
{
  os_log_t v2;
  void *v3;
  id v4;
  objc_super v6;
  SEL v7;
  id location;
  AMDLighthouseODMLWorker *v9;

  location = self;
  v7 = a2;
  v2 = os_log_create("com.apple.aiml.AMDLighthouseODMLPlugin", "AMDLighthouseODMLWorker");
  v3 = (void *)sLog;
  sLog = (uint64_t)v2;

  v4 = location;
  location = 0;
  v6.receiver = v4;
  v6.super_class = (Class)AMDLighthouseODMLWorker;
  location = -[AMDLighthouseODMLWorker init](&v6, sel_init);
  if (location)
    v9 = (AMDLighthouseODMLWorker *)location;
  else
    v9 = 0;
  objc_storeStrong(&location, 0);
  return v9;
}

- (id)createMLRTaskAttachmentsObject:(id)a3 modelDirURL:(id)a4 error:(id *)a5
{
  id v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD __b[8];
  uint64_t v19;
  id v20;
  id v21[2];
  id v22;
  id location[3];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21[1] = a5;
  v21[0] = (id)objc_msgSend(location[0], "objectForKey:", AttachmentKeys);
  v20 = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  v14 = v21[0];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
  if (v15)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v15;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(v14);
      v19 = *(_QWORD *)(__b[1] + 8 * v10);
      v17 = (id)objc_msgSend(v22, "URLByAppendingPathComponent:", v19);
      objc_msgSend(v20, "addObject:", v17);
      objc_storeStrong(&v17, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (!v11)
          break;
      }
    }
  }

  v5 = objc_alloc(MEMORY[0x24BE63318]);
  v16 = (id)objc_msgSend(v5, "initWithURLs:", v20);
  v7 = v16;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)logResultToCoreAnalytics:(id)a3 withMetric:(id)a4 withValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  AMDLighthouseODMLWorker *v12;
  id v13;
  id v14;
  id location[2];
  AMDLighthouseODMLWorker *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v9 = location[0];
  v10 = v14;
  v11 = v13;
  v12 = v16;
  AnalyticsSendEventLazy();
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v8;
}

id __73__AMDLighthouseODMLWorker_logResultToCoreAnalytics_withMetric_withValue___block_invoke(uint64_t a1)
{
  id v1;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  BOOL v13;
  id v14;
  unsigned int v15;
  id v16;
  id v17[3];

  v17[2] = (id)a1;
  v17[1] = (id)a1;
  v17[0] = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v17[0], "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), ModelNameKeyForLogging);
  objc_msgSend(v17[0], "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), MetricNameKeyForLogging);
  objc_msgSend(v17[0], "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), MetricValKeyForLogging);
  v1 = (id)objc_msgSend(*(id *)(a1 + 56), "triExperimentIdentifiers");
  v13 = v1 == 0;

  if (v13)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
    v4 = (id)objc_msgSend(v5, "stringValue");
    objc_msgSend(v17[0], "setObject:forKeyedSubscript:");

    objc_msgSend(v17[0], "setObject:forKeyedSubscript:", FailureKey, ExperimentIdKey);
    objc_msgSend(v17[0], "setObject:forKeyedSubscript:", FailureKey, TreatmentIdKey);
  }
  else
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 56), "triExperimentIdentifiers");
    v16 = (id)objc_msgSend(v6, "experimentId");

    v15 = 0;
    v7 = (id)objc_msgSend(*(id *)(a1 + 56), "triExperimentIdentifiers");
    v8 = objc_msgSend(v7, "deploymentId");

    v15 = v8;
    v9 = (id)objc_msgSend(*(id *)(a1 + 56), "triExperimentIdentifiers");
    v14 = (id)objc_msgSend(v9, "treatmentId");

    v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
    v10 = (id)objc_msgSend(v11, "stringValue");
    objc_msgSend(v17[0], "setObject:forKeyedSubscript:");

    objc_msgSend(v17[0], "setObject:forKeyedSubscript:", v16, ExperimentIdKey);
    objc_msgSend(v17[0], "setObject:forKeyedSubscript:", v14, TreatmentIdKey);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v16, 0);
  }
  v3 = v17[0];
  objc_storeStrong(v17, 0);
  return v3;
}

- (id)logMultipleDeDiscoResults:(id)a3 outError:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  id v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  NSObject *log;
  os_log_type_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  NSDictionary *v57;
  void *v58;
  id v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  id obj;
  uint64_t v73;
  id v74;
  _QWORD v75[8];
  uint64_t v76;
  id v77;
  os_log_type_t v78;
  os_log_t v79;
  os_log_type_t type;
  os_log_t oslog;
  id v82;
  id v83;
  id v84;
  id v85;
  unsigned int v86;
  id v87;
  id v88;
  id v89;
  _QWORD v90[8];
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  int v101;
  _QWORD v102[8];
  uint64_t v103;
  id v104;
  id v105;
  _QWORD __b[8];
  id v107;
  id v108;
  id *v109;
  id location[2];
  AMDLighthouseODMLWorker *v111;
  id v112;
  _BYTE v113[128];
  uint8_t v114[16];
  uint8_t v115[24];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v111 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v109 = a4;
  v108 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v118, 16);
  if (v73)
  {
    v68 = *(_QWORD *)__b[2];
    v69 = 0;
    v70 = v73;
    while (1)
    {
      v67 = v69;
      if (*(_QWORD *)__b[2] != v68)
        objc_enumerationMutation(obj);
      v107 = *(id *)(__b[1] + 8 * v69);
      v105 = (id)objc_msgSend(v107, "objectForKey:", ModelMetrics);
      v104 = (id)objc_msgSend(v107, "objectForKey:", ModelName);
      memset(v102, 0, sizeof(v102));
      v65 = v105;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", v102, v117, 16);
      if (v66)
      {
        v62 = *(_QWORD *)v102[2];
        v63 = 0;
        v64 = v66;
        while (1)
        {
          v61 = v63;
          if (*(_QWORD *)v102[2] != v62)
            objc_enumerationMutation(v65);
          v103 = *(_QWORD *)(v102[1] + 8 * v63);
          v4 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v111, "checkIfTaskShouldBeStopped:", v109);
          v60 = v4 != 0;

          if (!v60)
            break;
          v100 = (id)objc_msgSend(v105, "objectForKey:", v103);
          v99 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v104, v103);
          v58 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v100, "floatValue");
          v59 = (id)objc_msgSend(v58, "numberWithFloat:");
          objc_msgSend(v108, "setObject:forKeyedSubscript:");

          objc_storeStrong(&v99, 0);
          objc_storeStrong(&v100, 0);
          ++v63;
          if (v61 + 1 >= v64)
          {
            v63 = 0;
            v64 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", v102, v117, 16);
            if (!v64)
              goto LABEL_13;
          }
        }
        v112 = 0;
        v101 = 1;
      }
      else
      {
LABEL_13:
        v101 = 0;
      }

      if (!v101)
        v101 = 0;
      objc_storeStrong(&v104, 0);
      objc_storeStrong(&v105, 0);
      if (v101)
        break;
      ++v69;
      if (v67 + 1 >= v70)
      {
        v69 = 0;
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v118, 16);
        if (!v70)
          goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    v101 = 0;
  }

  if (!v101)
  {
    v98 = 0;
    v57 = -[AMDLighthouseODMLWorker recipe](v111, "recipe");
    v97 = -[NSDictionary objectForKey:](v57, "objectForKey:", CFSTR("multipleDediscoEncodingSchema"));

    if (v97)
      goto LABEL_30;
    v96 = -[AMDLighthouseODMLWorker modelsURL](v111, "modelsURL");
    if (v96)
    {
      v95 = (id)objc_msgSend(v96, "URLByAppendingPathComponent:", EncodingPath);
      v93 = 0;
      v56 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v95, 0, &v93);
      objc_storeStrong(&v98, v93);
      v94 = v56;
      if (v98)
      {
        v6 = objc_alloc(MEMORY[0x24BDD1540]);
        v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 150, 0);
        *v109 = v7;
      }
      v92 = v98;
      v55 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v94, 0, &v92);
      objc_storeStrong(&v98, v92);
      v8 = v97;
      v97 = v55;

      if (v98)
      {
        v9 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 151, 0);
        *v109 = v10;
      }
      objc_storeStrong(&v94, 0);
      objc_storeStrong(&v95, 0);
      v101 = 0;
    }
    else
    {
      v5 = objc_retainAutorelease(v98);
      *v109 = v5;
      v112 = 0;
      v101 = 1;
    }
    objc_storeStrong(&v96, 0);
    if (!v101)
    {
LABEL_30:
      memset(v90, 0, sizeof(v90));
      v53 = v97;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v90, v116, 16);
      if (v54)
      {
        v50 = *(_QWORD *)v90[2];
        v51 = 0;
        v52 = v54;
        while (1)
        {
          v49 = v51;
          if (*(_QWORD *)v90[2] != v50)
            objc_enumerationMutation(v53);
          v91 = *(id *)(v90[1] + 8 * v51);
          v89 = (id)objc_msgSend(v91, "objectForKey:", PopulationSection);
          v88 = -[AMDLighthouseODMLWorker triExperimentIdentifiers](v111, "triExperimentIdentifiers");
          if (v88)
          {
            v87 = (id)objc_msgSend(v88, "experimentId");
            v86 = 0;
            v86 = objc_msgSend(v88, "deploymentId");
            v85 = (id)objc_msgSend(v88, "treatmentId");
            v84 = 0;
            if (v89)
            {
              v83 = (id)objc_msgSend(v108, "objectForKey:", v89);
              v82 = (id)objc_msgSend(v83, "stringValue");
              v42 = (void *)MEMORY[0x24BDD17C8];
              v40 = v82;
              v41 = v87;
              v44 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v86);
              v43 = (id)objc_msgSend(v44, "stringValue");
              v15 = (id)objc_msgSend(v42, "stringWithFormat:", CFSTR("com.apple.ampaiml.AppleMediaDiscoveryFrameworkLighthousePlugin:%@:%@:%@:%@"), v40, v41, v43, v85);
              v16 = v84;
              v84 = v15;

              objc_storeStrong(&v82, 0);
              objc_storeStrong(&v83, 0);
            }
            else
            {
              v46 = (void *)MEMORY[0x24BDD17C8];
              v45 = v87;
              v48 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v86);
              v47 = (id)objc_msgSend(v48, "stringValue");
              v13 = (id)objc_msgSend(v46, "stringWithFormat:", CFSTR("com.apple.ampaiml.AppleMediaDiscoveryFrameworkLighthousePlugin:%@:%@:%@"), v45, v47, v85);
              v14 = v84;
              v84 = v13;

            }
            oslog = (os_log_t)(id)sLog;
            type = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              log = oslog;
              v39 = type;
              __os_log_helper_16_2_1_8_64((uint64_t)v115, (uint64_t)v108);
              _os_log_debug_impl(&dword_23630A000, log, v39, "dataToUpload: %@", v115, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            v79 = (os_log_t)(id)sLog;
            v78 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
            {
              v36 = v79;
              v37 = v78;
              __os_log_helper_16_2_1_8_64((uint64_t)v114, (uint64_t)v84);
              _os_log_debug_impl(&dword_23630A000, v36, v37, "baseKeyWithTrialInfo: %@", v114, 0xCu);
            }
            objc_storeStrong((id *)&v79, 0);
            v77 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            memset(v75, 0, sizeof(v75));
            v34 = (id)objc_msgSend(v91, "objectForKeyedSubscript:", DataToUpload);
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", v75, v113, 16);
            if (v35)
            {
              v31 = *(_QWORD *)v75[2];
              v32 = 0;
              v33 = v35;
              while (1)
              {
                v30 = v32;
                if (*(_QWORD *)v75[2] != v31)
                  objc_enumerationMutation(v34);
                v76 = *(_QWORD *)(v75[1] + 8 * v32);
                v17 = (id)objc_msgSend(v108, "objectForKey:", v76);
                v29 = v17 != 0;

                if (!v29)
                {
                  v18 = objc_alloc(MEMORY[0x24BDD1540]);
                  v19 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 182, 0);
                  *v109 = v19;
                }
                v27 = v77;
                v28 = (id)objc_msgSend(v108, "objectForKey:", v76);
                objc_msgSend(v27, "setObject:forKey:");

                ++v32;
                if (v30 + 1 >= v33)
                {
                  v32 = 0;
                  v33 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", v75, v113, 16);
                  if (!v33)
                    break;
                }
              }
            }

            v24 = (void *)MEMORY[0x24BE78B90];
            v23 = v77;
            v25 = (id)objc_msgSend(v91, "objectForKeyedSubscript:", DataContentTypes);
            v74 = v98;
            v26 = objc_msgSend(v24, "encodeDataAndRecord:dataTypeContent:baseKey:errorOut:", v23);
            objc_storeStrong(&v98, v74);

            if ((v26 & 1) != 1)
              goto LABEL_53;
            if (!v98)
            {
              v101 = 0;
            }
            else
            {
LABEL_53:
              NSLog(CFSTR("Failed to submit to dedisco. Error is %@"), v98);
              v20 = objc_alloc(MEMORY[0x24BDD1540]);
              v21 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 144, 0);
              *v109 = v21;
              v112 = 0;
              v101 = 1;
            }
            objc_storeStrong(&v77, 0);
            objc_storeStrong(&v84, 0);
            objc_storeStrong(&v85, 0);
            objc_storeStrong(&v87, 0);
          }
          else
          {
            v11 = objc_alloc(MEMORY[0x24BDD1540]);
            v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 145, 0);
            *v109 = v12;
            v112 = 0;
            v101 = 1;
          }
          objc_storeStrong(&v88, 0);
          objc_storeStrong(&v89, 0);
          if (v101)
            break;
          ++v51;
          if (v49 + 1 >= v52)
          {
            v51 = 0;
            v52 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v90, v116, 16);
            if (!v52)
              goto LABEL_59;
          }
        }
      }
      else
      {
LABEL_59:
        v101 = 0;
      }

      if (!v101)
      {
        v112 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v101 = 1;
      }
    }
    objc_storeStrong(&v97, 0);
    objc_storeStrong(&v98, 0);
  }
  objc_storeStrong(&v108, 0);
  objc_storeStrong(location, 0);
  return v112;
}

- (id)gatherGaussianResults:(id)a3 withPartitions:(id)a4 outError:(id *)a5
{
  id v5;
  id v6;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  int v30;
  _QWORD v31[8];
  uint64_t v32;
  id v33;
  id v34;
  _QWORD __b[8];
  id v36;
  id v37;
  id v38;
  id *v39;
  id v40;
  id location[2];
  AMDLighthouseODMLWorker *v42;
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = 0;
  objc_storeStrong(&v40, a4);
  v39 = a5;
  v38 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  memset(__b, 0, sizeof(__b));
  v26 = location[0];
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
  if (v27)
  {
    v21 = *(_QWORD *)__b[2];
    v22 = 0;
    v23 = v27;
    while (1)
    {
      v20 = v22;
      if (*(_QWORD *)__b[2] != v21)
        objc_enumerationMutation(v26);
      v36 = *(id *)(__b[1] + 8 * v22);
      v34 = (id)objc_msgSend(v36, "objectForKey:", ModelMetrics);
      v33 = (id)objc_msgSend(v36, "objectForKey:", ModelName);
      memset(v31, 0, sizeof(v31));
      v18 = v34;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v31, v44, 16);
      if (v19)
      {
        v15 = *(_QWORD *)v31[2];
        v16 = 0;
        v17 = v19;
        while (1)
        {
          v14 = v16;
          if (*(_QWORD *)v31[2] != v15)
            objc_enumerationMutation(v18);
          v32 = *(_QWORD *)(v31[1] + 8 * v16);
          v5 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v42, "checkIfTaskShouldBeStopped:", v39);
          v13 = v5 != 0;

          if (!v13)
            break;
          v29 = (id)objc_msgSend(v34, "objectForKey:", v32);
          v28 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v33, v32);
          if ((objc_msgSend(v40, "containsObject:", v28) & 1) != 0)
          {
            v9 = v37;
            v8 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v29, "floatValue");
            v10 = (id)objc_msgSend(v8, "numberWithFloat:");
            objc_msgSend(v9, "setObject:forKey:");

          }
          else
          {
            v11 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v29, "floatValue");
            v12 = (id)objc_msgSend(v11, "numberWithFloat:");
            objc_msgSend(v38, "setObject:forKeyedSubscript:");

          }
          objc_storeStrong(&v28, 0);
          objc_storeStrong(&v29, 0);
          ++v16;
          if (v14 + 1 >= v17)
          {
            v16 = 0;
            v17 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v31, v44, 16);
            if (!v17)
              goto LABEL_16;
          }
        }
        v43 = 0;
        v30 = 1;
      }
      else
      {
LABEL_16:
        v30 = 0;
      }

      if (!v30)
        v30 = 0;
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      if (v30)
        break;
      ++v22;
      if (v20 + 1 >= v23)
      {
        v22 = 0;
        v23 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
        if (!v23)
          goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    v30 = 0;
  }

  if (!v30)
  {
    v6 = objc_alloc(MEMORY[0x24BE63330]);
    v43 = (id)objc_msgSend(v6, "initWithJSONResult:namespaceName:factorName:additionalKeyVariables:", v38, TrialNamespace, CFSTR("recipe"), v37);
    v30 = 1;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  return v43;
}

- (id)logDeDiscoResults:(id)a3 outError:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  id v20;
  NSDictionary *v21;
  void *v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  id v36;
  id v37;
  id obj;
  uint64_t v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  os_log_type_t v49;
  os_log_t v50;
  os_log_type_t type;
  os_log_t oslog;
  id v53;
  id v54;
  _QWORD v55[8];
  uint64_t v56;
  id v57;
  id v58;
  _QWORD __b[8];
  id v60;
  id v61;
  id v62;
  id v63;
  unsigned int v64;
  id v65;
  int v66;
  id v67;
  id *v68;
  id location[2];
  AMDLighthouseODMLWorker *v70;
  id v71;
  uint8_t v72[16];
  uint8_t v73[24];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v70 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v68 = a4;
  v67 = -[AMDLighthouseODMLWorker triExperimentIdentifiers](v70, "triExperimentIdentifiers");
  if (v67)
  {
    v65 = (id)objc_msgSend(v67, "experimentId");
    v64 = objc_msgSend(v67, "deploymentId");
    v63 = (id)objc_msgSend(v67, "treatmentId");
    v35 = (void *)MEMORY[0x24BDD17C8];
    v37 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v64);
    v36 = (id)objc_msgSend(v37, "stringValue");
    v62 = (id)objc_msgSend(v35, "stringWithFormat:", CFSTR("com.apple.ampaiml.AppleMediaDiscoveryFrameworkLighthousePlugin:%@:%@:%@"), v65, v36, v63);

    v61 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    memset(__b, 0, sizeof(__b));
    obj = location[0];
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v75, 16);
    if (v39)
    {
      v32 = *(_QWORD *)__b[2];
      v33 = 0;
      v34 = v39;
      while (1)
      {
        v31 = v33;
        if (*(_QWORD *)__b[2] != v32)
          objc_enumerationMutation(obj);
        v60 = *(id *)(__b[1] + 8 * v33);
        v58 = (id)objc_msgSend(v60, "objectForKey:", ModelMetrics);
        v57 = (id)objc_msgSend(v60, "objectForKey:", ModelName);
        memset(v55, 0, sizeof(v55));
        v29 = v58;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v55, v74, 16);
        if (v30)
        {
          v26 = *(_QWORD *)v55[2];
          v27 = 0;
          v28 = v30;
          while (1)
          {
            v25 = v27;
            if (*(_QWORD *)v55[2] != v26)
              objc_enumerationMutation(v29);
            v56 = *(_QWORD *)(v55[1] + 8 * v27);
            v5 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v70, "checkIfTaskShouldBeStopped:", v68);
            v24 = v5 != 0;

            if (!v24)
              break;
            v54 = (id)objc_msgSend(v58, "objectForKey:", v56);
            v53 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v57, v56);
            v22 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v54, "floatValue");
            v23 = (id)objc_msgSend(v22, "numberWithFloat:");
            objc_msgSend(v61, "setObject:forKeyedSubscript:");

            objc_storeStrong(&v53, 0);
            objc_storeStrong(&v54, 0);
            ++v27;
            if (v25 + 1 >= v28)
            {
              v27 = 0;
              v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v55, v74, 16);
              if (!v28)
                goto LABEL_15;
            }
          }
          v71 = 0;
          v66 = 1;
        }
        else
        {
LABEL_15:
          v66 = 0;
        }

        if (!v66)
          v66 = 0;
        objc_storeStrong(&v57, 0);
        objc_storeStrong(&v58, 0);
        if (v66)
          break;
        ++v33;
        if (v31 + 1 >= v34)
        {
          v33 = 0;
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v75, 16);
          if (!v34)
            goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      v66 = 0;
    }

    if (!v66)
    {
      oslog = (os_log_t)(id)sLog;
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v61);
        _os_log_debug_impl(&dword_23630A000, oslog, type, "dataToUpload: %@", v73, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v50 = (os_log_t)(id)sLog;
      v49 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v62);
        _os_log_debug_impl(&dword_23630A000, v50, v49, "baseKeyWithTrialInfo: %@", v72, 0xCu);
      }
      objc_storeStrong((id *)&v50, 0);
      v48 = 0;
      v21 = -[AMDLighthouseODMLWorker recipe](v70, "recipe");
      v47 = -[NSDictionary objectForKey:](v21, "objectForKey:", CFSTR("dediscoEncodingSchema"));

      if (v47)
        goto LABEL_36;
      v46 = -[AMDLighthouseODMLWorker modelsURL](v70, "modelsURL");
      if (v46)
      {
        v45 = (id)objc_msgSend(v46, "URLByAppendingPathComponent:", EncodingPath);
        v43 = 0;
        v20 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v45, 0, &v43);
        objc_storeStrong(&v48, v43);
        v44 = v20;
        if (v48)
        {
          v7 = objc_alloc(MEMORY[0x24BDD1540]);
          v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 150, 0);
          *v68 = v8;
        }
        v42 = v48;
        v19 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v44, 0, &v42);
        objc_storeStrong(&v48, v42);
        v9 = v47;
        v47 = v19;

        if (v48)
        {
          v10 = objc_alloc(MEMORY[0x24BDD1540]);
          v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 151, 0);
          *v68 = v11;
        }
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
        v66 = 0;
      }
      else
      {
        v6 = objc_retainAutorelease(v48);
        *v68 = v6;
        v71 = 0;
        v66 = 1;
      }
      objc_storeStrong(&v46, 0);
      if (!v66)
      {
LABEL_36:
        v16 = (void *)MEMORY[0x24BE78B90];
        v15 = v61;
        v17 = (id)objc_msgSend(v47, "objectForKeyedSubscript:", DataContentTypes);
        v41 = v48;
        v18 = objc_msgSend(v16, "encodeDataAndRecord:dataTypeContent:baseKey:errorOut:", v15);
        objc_storeStrong(&v48, v41);

        if ((v18 & 1) == 1 && !v48)
        {
          v71 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
          v66 = 1;
        }
        else
        {
          NSLog(CFSTR("Failed to submit to dedisco. Error is %@"), v48);
          v12 = objc_alloc(MEMORY[0x24BDD1540]);
          v13 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 144, 0);
          *v68 = v13;
          v71 = 0;
          v66 = 1;
        }
      }
      objc_storeStrong(&v47, 0);
      objc_storeStrong(&v48, 0);
    }
    objc_storeStrong(&v61, 0);
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v63, 0);
    objc_storeStrong(&v65, 0);
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BDD1540]);
    *v68 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 145, 0);
    v71 = 0;
    v66 = 1;
  }
  objc_storeStrong(&v67, 0);
  objc_storeStrong(location, 0);
  return v71;
}

- (id)logAllResultsToCoreAnalyticsOrDeDisco:(id)a3 withLoggingStrategies:(id)a4 outError:(id *)a5
{
  id v5;
  id v6;
  id v7;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  id v24;
  id v25;
  _QWORD v26[8];
  uint64_t v27;
  id v28;
  id v29;
  _QWORD __b[8];
  id v31;
  id v32;
  int v33;
  id v34;
  char v35;
  id *v36;
  id v37;
  id location[2];
  AMDLighthouseODMLWorker *v39;
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36 = a5;
  v35 = 0;
  if ((objc_msgSend(v37, "containsObject:", DeDisco) & 1) == 0
    || ((v34 = -[AMDLighthouseODMLWorker logDeDiscoResults:outError:](v39, "logDeDiscoResults:outError:", location[0], v36)) != 0? (v35 = 1, v33 = 0): (v40 = 0, v33 = 1), objc_storeStrong(&v34, 0), !v33))
  {
    if ((objc_msgSend(v37, "containsObject:", MultipleDeDisco) & 1) == 0
      || ((v32 = -[AMDLighthouseODMLWorker logMultipleDeDiscoResults:outError:](v39, "logMultipleDeDiscoResults:outError:", location[0], v36)) != 0? (v35 = 1, v33 = 0): (v40 = 0, v33 = 1), objc_storeStrong(&v32, 0), !v33))
    {
      if ((objc_msgSend(v37, "containsObject:", CoreAnalytics) & 1) == 0)
        goto LABEL_36;
      memset(__b, 0, sizeof(__b));
      v20 = location[0];
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
      if (v21)
      {
        v17 = *(_QWORD *)__b[2];
        v18 = 0;
        v19 = v21;
        while (1)
        {
          v16 = v18;
          if (*(_QWORD *)__b[2] != v17)
            objc_enumerationMutation(v20);
          v31 = *(id *)(__b[1] + 8 * v18);
          v29 = (id)objc_msgSend(v31, "objectForKey:", ModelMetrics);
          v28 = (id)objc_msgSend(v31, "objectForKey:", ModelName);
          memset(v26, 0, sizeof(v26));
          v14 = v29;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v26, v41, 16);
          if (v15)
          {
            v11 = *(_QWORD *)v26[2];
            v12 = 0;
            v13 = v15;
            while (1)
            {
              v10 = v12;
              if (*(_QWORD *)v26[2] != v11)
                objc_enumerationMutation(v14);
              v27 = *(_QWORD *)(v26[1] + 8 * v12);
              v5 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v39, "checkIfTaskShouldBeStopped:", v36);
              v9 = v5 != 0;

              if (!v9)
                break;
              v25 = (id)objc_msgSend(v29, "objectForKey:", v27);
              v24 = -[AMDLighthouseODMLWorker logResultToCoreAnalytics:withMetric:withValue:](v39, "logResultToCoreAnalytics:withMetric:withValue:", v28, v27, v25);
              if (v24)
              {
                v35 = 1;
                v33 = 0;
              }
              else
              {
                v40 = 0;
                v33 = 1;
              }
              objc_storeStrong(&v24, 0);
              objc_storeStrong(&v25, 0);
              if (v33)
                goto LABEL_29;
              ++v12;
              if (v10 + 1 >= v13)
              {
                v12 = 0;
                v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v26, v41, 16);
                if (!v13)
                  goto LABEL_28;
              }
            }
            v40 = 0;
            v33 = 1;
          }
          else
          {
LABEL_28:
            v33 = 0;
          }
LABEL_29:

          if (!v33)
            v33 = 0;
          objc_storeStrong(&v28, 0);
          objc_storeStrong(&v29, 0);
          if (v33)
            break;
          ++v18;
          if (v16 + 1 >= v19)
          {
            v18 = 0;
            v19 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
            if (!v19)
              goto LABEL_34;
          }
        }
      }
      else
      {
LABEL_34:
        v33 = 0;
      }

      if (!v33)
      {
LABEL_36:
        if ((v35 & 1) != 0)
        {
          v40 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        }
        else
        {
          v6 = objc_alloc(MEMORY[0x24BDD1540]);
          v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 143, 0);
          *v36 = v7;
          v40 = 0;
        }
        v33 = 1;
      }
    }
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v40;
}

- (id)targetingKeyValuePairsForKeys:(id)a3 error:(id *)a4
{
  id v6;
  id v7[2];
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = objc_alloc_init(AMDDODMLCustomTargetingHelper);
  v6 = (id)objc_msgSend(v7[0], "mainTargetingResolver:error:", location[0], a4);
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)gatherMetricsToReturn:(id)a3 withRecipe:(id)a4 withAttachments:(id)a5 outError:(id *)a6
{
  id v6;
  id v7;
  AMDDODMLDataProcessor *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  BOOL v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  AMDDODMLEspressoDataProvider *v53;
  id v54;
  id v55;
  uint64_t v56;
  AMDCoreMLDataProvider *v57;
  id v58;
  id v59;
  uint64_t v60;
  AMDCoreMLDataProvider *v61;
  id v62;
  id v63;
  BOOL v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  AMDDODMLAttachmentProcessor *v72;
  MLRTaskAttachments *v73;
  BOOL v74;
  id v78;
  _QWORD v79[8];
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _QWORD v88[8];
  uint64_t v89;
  id v90;
  AMDDODMLTrainer *v91;
  AMDDODMLEspressoDataProvider *v92;
  AMDHeuristicModelEvaluator *v93;
  AMDCoreMLDataProvider *v94;
  AMDCoreMLTrainer *v95;
  AMDCoreMLDataProvider *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  _QWORD __b[8];
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  int v112;
  id v113;
  id *v114;
  id v115;
  id v116;
  id location[2];
  AMDLighthouseODMLWorker *v118;
  id v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v118 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v116 = 0;
  objc_storeStrong(&v116, a4);
  v115 = 0;
  objc_storeStrong(&v115, a5);
  v114 = a6;
  v113 = (id)objc_msgSend(v116, "objectForKeyedSubscript:", DataProcessingAndModelTraining);
  if (v113)
  {
    v7 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v118, "checkIfTaskShouldBeStopped:", v114);
    v74 = v7 != 0;

    if (v74)
    {
      v111 = (id)objc_msgSend(v116, "objectForKeyedSubscript:", AttachmentInstructions);
      v72 = [AMDDODMLAttachmentProcessor alloc];
      v73 = -[AMDLighthouseODMLWorker attachments](v118, "attachments");
      v110 = -[AMDDODMLAttachmentProcessor initWithAttachmentURLs:withInstructions:error:errorDomain:](v72, "initWithAttachmentURLs:withInstructions:error:errorDomain:");

      if (v110)
      {
        v8 = [AMDDODMLDataProcessor alloc];
        v109 = -[AMDDODMLDataProcessor initWithActionArray:withAttachmentProcessor:](v8, "initWithActionArray:withAttachmentProcessor:", MEMORY[0x24BDBD1A8], v110);
        if (v109)
        {
          objc_msgSend(v109, "setElementsInCoreDictionary:", location[0]);
          v108 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          memset(__b, 0, sizeof(__b));
          v70 = v113;
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", __b, v122, 16);
          if (v71)
          {
            v67 = *(_QWORD *)__b[2];
            v68 = 0;
            v69 = v71;
            while (1)
            {
              v66 = v68;
              if (*(_QWORD *)__b[2] != v67)
                objc_enumerationMutation(v70);
              v107 = *(id *)(__b[1] + 8 * v68);
              v105 = (id)objc_msgSend(v107, "objectForKey:", ModelName);
              if (v105)
              {
                v12 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v118, "checkIfTaskShouldBeStopped:", v114);
                v65 = v12 != 0;

                if (v65)
                {
                  v104 = (id)objc_msgSend(v107, "objectForKey:", DataProcessing);
                  if (!v104
                    || ((objc_msgSend(v109, "resetDataProcessorWithRecipe:", v104),
                         (v103 = (id)objc_msgSend(v109, "processRecipe:errorDomain:", v114, AMDLighthouseODMLPluginErrorDomain)) != 0)? (v112 = 0): (v119 = 0, v112 = 1), objc_storeStrong(&v103, 0), !v112))
                  {
                    v102 = (id)objc_msgSend(v107, "objectForKey:", TaskParameters);
                    if (!v102)
                      goto LABEL_48;
                    v13 = objc_alloc(MEMORY[0x24BE63320]);
                    v101 = (id)objc_msgSend(v13, "initWithParametersDict:", v102);
                    v14 = objc_alloc(MEMORY[0x24BE63310]);
                    v100 = (id)objc_msgSend(v14, "initWithParameters:attachments:", v101, v115);
                    v99 = (id)objc_msgSend(v101, "objectForKeyedSubscript:", UseCoreMLTrainer);
                    if (!v99)
                    {
                      v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
                      v16 = v99;
                      v99 = v15;

                    }
                    v98 = (id)objc_msgSend(v101, "objectForKeyedSubscript:", IsHeuristicModel);
                    if (!v98)
                    {
                      v17 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
                      v18 = v98;
                      v98 = v17;

                    }
                    if (objc_msgSend(v98, "longValue") == 1 && objc_msgSend(v99, "longValue") == 1)
                    {
                      v19 = objc_alloc(MEMORY[0x24BDD1540]);
                      v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 143, 0);
                      *v114 = v20;
                      v119 = 0;
                      v112 = 1;
                    }
                    else
                    {
                      v21 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v118, "checkIfTaskShouldBeStopped:", v114);
                      v64 = v21 != 0;

                      if (v64)
                      {
                        v97 = 0;
                        if (objc_msgSend(v99, "longValue") == 1)
                        {
                          v61 = [AMDCoreMLDataProvider alloc];
                          v60 = objc_msgSend(v109, "getInputSize");
                          v63 = (id)objc_msgSend(v109, "getElementsInSampleDictionary");
                          v62 = (id)objc_msgSend(v109, "getInputDictionary");
                          v96 = -[AMDCoreMLDataProvider initWithInputs:featureSizeMap:inputDictionary:](v61, "initWithInputs:featureSizeMap:inputDictionary:", v60, v63);

                          v95 = objc_alloc_init(AMDCoreMLTrainer);
                          v22 = -[AMDCoreMLTrainer runTask:error:errorDomain:dataProvider:](v95, "runTask:error:errorDomain:dataProvider:", v100, v114, AMDLighthouseODMLPluginErrorDomain, v96);
                          v23 = v97;
                          v97 = v22;

                          objc_storeStrong((id *)&v95, 0);
                          objc_storeStrong((id *)&v96, 0);
                        }
                        else if (objc_msgSend(v98, "longValue") == 1)
                        {
                          v57 = [AMDCoreMLDataProvider alloc];
                          v56 = objc_msgSend(v109, "getInputSize");
                          v59 = (id)objc_msgSend(v109, "getElementsInSampleDictionary");
                          v58 = (id)objc_msgSend(v109, "getInputDictionary");
                          v94 = -[AMDCoreMLDataProvider initWithInputs:featureSizeMap:inputDictionary:](v57, "initWithInputs:featureSizeMap:inputDictionary:", v56, v59);

                          v93 = objc_alloc_init(AMDHeuristicModelEvaluator);
                          v24 = -[AMDHeuristicModelEvaluator runTask:error:errorDomain:dataProvider:](v93, "runTask:error:errorDomain:dataProvider:", v100, v114, AMDLighthouseODMLPluginErrorDomain, v94);
                          v25 = v97;
                          v97 = v24;

                          objc_storeStrong((id *)&v93, 0);
                          objc_storeStrong((id *)&v94, 0);
                        }
                        else
                        {
                          v53 = [AMDDODMLEspressoDataProvider alloc];
                          v52 = objc_msgSend(v109, "getInputSize");
                          v55 = (id)objc_msgSend(v109, "getElementsInSampleDictionary");
                          v54 = (id)objc_msgSend(v109, "getInputDictionary");
                          v92 = -[AMDDODMLEspressoDataProvider initWithInputs:featureSizeMap:inputDictionary:](v53, "initWithInputs:featureSizeMap:inputDictionary:", v52, v55);

                          v91 = objc_alloc_init(AMDDODMLTrainer);
                          v26 = -[AMDDODMLTrainer runTask:error:errorDomain:dataProvider:attachmentProcessor:](v91, "runTask:error:errorDomain:dataProvider:attachmentProcessor:", v100, v114, AMDLighthouseODMLPluginErrorDomain, v92, v110);
                          v27 = v97;
                          v97 = v26;

                          objc_storeStrong((id *)&v91, 0);
                          objc_storeStrong((id *)&v92, 0);
                        }
                        if (v97)
                        {
                          v49 = (id)objc_msgSend(v97, "JSONResult");
                          v90 = (id)objc_msgSend(v49, "objectForKey:", ModelMetrics);

                          memset(v88, 0, sizeof(v88));
                          v50 = (id)objc_msgSend(v90, "allKeys");
                          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", v88, v121, 16);
                          if (v51)
                          {
                            v46 = *(_QWORD *)v88[2];
                            v47 = 0;
                            v48 = v51;
                            while (1)
                            {
                              v45 = v47;
                              if (*(_QWORD *)v88[2] != v46)
                                objc_enumerationMutation(v50);
                              v89 = *(_QWORD *)(v88[1] + 8 * v47);
                              v87 = (id)objc_msgSend(v90, "objectForKey:", v89);
                              objc_msgSend(v109, "setElementInCoreDictionary:withKey:", v87, v89);
                              objc_storeStrong(&v87, 0);
                              ++v47;
                              if (v45 + 1 >= v48)
                              {
                                v47 = 0;
                                v48 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", v88, v121, 16);
                                if (!v48)
                                  break;
                              }
                            }
                          }

                          objc_storeStrong(&v90, 0);
                          v112 = 0;
                        }
                        else
                        {
                          v119 = 0;
                          v112 = 1;
                        }
                        objc_storeStrong(&v97, 0);
                      }
                      else
                      {
                        v119 = 0;
                        v112 = 1;
                      }
                    }
                    objc_storeStrong(&v98, 0);
                    objc_storeStrong(&v99, 0);
                    objc_storeStrong(&v100, 0);
                    objc_storeStrong(&v101, 0);
                    if (!v112)
                    {
LABEL_48:
                      v28 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v118, "checkIfTaskShouldBeStopped:", v114);
                      v44 = v28 != 0;

                      if (v44)
                      {
                        v86 = (id)objc_msgSend(v107, "objectForKey:", DataPostProcessing);
                        if (!v86
                          || ((objc_msgSend(v109, "resetDataProcessorWithRecipe:", v86),
                               (v85 = (id)objc_msgSend(v109, "processRecipe:errorDomain:", v114, AMDLighthouseODMLPluginErrorDomain)) != 0)? (v112 = 0): (v119 = 0, v112 = 1), objc_storeStrong(&v85, 0), !v112))
                        {
                          v29 = -[AMDLighthouseODMLWorker checkIfTaskShouldBeStopped:](v118, "checkIfTaskShouldBeStopped:", v114);
                          v43 = v29 != 0;

                          if (v43)
                          {
                            v84 = (id)objc_msgSend(v107, "objectForKeyedSubscript:", FinalMetricsToCollect);
                            v83 = (id)objc_msgSend(v116, "objectForKeyedSubscript:", LoggingStrategies);
                            if (!v84)
                              goto LABEL_74;
                            v82 = (id)objc_opt_new();
                            v81 = (id)objc_opt_new();
                            objc_msgSend(v82, "setObject:forKey:", v105, ModelName);
                            memset(v79, 0, sizeof(v79));
                            v41 = v84;
                            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", v79, v120, 16);
                            if (v42)
                            {
                              v38 = *(_QWORD *)v79[2];
                              v39 = 0;
                              v40 = v42;
                              while (1)
                              {
                                v37 = v39;
                                if (*(_QWORD *)v79[2] != v38)
                                  objc_enumerationMutation(v41);
                                v80 = *(_QWORD *)(v79[1] + 8 * v39);
                                v78 = (id)objc_msgSend(v109, "getElementInCoreDictionary:", v80);
                                if (v78)
                                {
                                  if (objc_msgSend(v78, "count") == 1)
                                  {
                                    v36 = (id)objc_msgSend(v78, "firstObject");
                                    v35 = (id)objc_msgSend(v36, "stringValue");
                                    objc_msgSend(v81, "setObject:forKeyedSubscript:");

                                    v112 = 0;
                                  }
                                  else
                                  {
                                    v32 = objc_alloc(MEMORY[0x24BDD1540]);
                                    v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 139, 0);
                                    *v114 = v33;
                                    v119 = 0;
                                    v112 = 1;
                                  }
                                }
                                else
                                {
                                  v30 = objc_alloc(MEMORY[0x24BDD1540]);
                                  v31 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 138, 0);
                                  *v114 = v31;
                                  v119 = 0;
                                  v112 = 1;
                                }
                                objc_storeStrong(&v78, 0);
                                if (v112)
                                  break;
                                ++v39;
                                if (v37 + 1 >= v40)
                                {
                                  v39 = 0;
                                  v40 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", v79, v120, 16);
                                  if (!v40)
                                    goto LABEL_70;
                                }
                              }
                            }
                            else
                            {
LABEL_70:
                              v112 = 0;
                            }

                            if (!v112)
                            {
                              objc_msgSend(v82, "setObject:forKey:", v81, ModelMetrics);
                              objc_msgSend(v108, "addObject:", v82);
                              v112 = 0;
                            }
                            objc_storeStrong(&v81, 0);
                            objc_storeStrong(&v82, 0);
                            if (!v112)
LABEL_74:
                              v112 = 0;
                            objc_storeStrong(&v83, 0);
                            objc_storeStrong(&v84, 0);
                          }
                          else
                          {
                            v119 = 0;
                            v112 = 1;
                          }
                        }
                        objc_storeStrong(&v86, 0);
                      }
                      else
                      {
                        v119 = 0;
                        v112 = 1;
                      }
                    }
                    objc_storeStrong(&v102, 0);
                  }
                  objc_storeStrong(&v104, 0);
                }
                else
                {
                  v119 = 0;
                  v112 = 1;
                }
              }
              else
              {
                v10 = objc_alloc(MEMORY[0x24BDD1540]);
                v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 137, 0);
                *v114 = v11;
                v119 = 0;
                v112 = 1;
              }
              objc_storeStrong(&v105, 0);
              if (v112)
                break;
              ++v68;
              if (v66 + 1 >= v69)
              {
                v68 = 0;
                v69 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", __b, v122, 16);
                if (!v69)
                  goto LABEL_82;
              }
            }
          }
          else
          {
LABEL_82:
            v112 = 0;
          }

          if (!v112)
          {
            v119 = v108;
            v112 = 1;
          }
          objc_storeStrong(&v108, 0);
        }
        else
        {
          v9 = objc_alloc(MEMORY[0x24BDD1540]);
          *v114 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 126, 0);
          v119 = 0;
          v112 = 1;
        }
        objc_storeStrong(&v109, 0);
      }
      else
      {
        v119 = 0;
        v112 = 1;
      }
      objc_storeStrong(&v110, 0);
      objc_storeStrong(&v111, 0);
    }
    else
    {
      v119 = 0;
      v112 = 1;
    }
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDD1540]);
    *v114 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 134, 0);
    v119 = 0;
    v112 = 1;
  }
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(location, 0);
  return v119;
}

- (id)checkIfTaskShouldBeStopped:(id *)a3
{
  id v3;

  if (-[NSNumber intValue](self->_taskShouldBeStopped, "intValue") != 1)
    return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  v3 = objc_alloc(MEMORY[0x24BDD1540]);
  *a3 = (id)objc_msgSend(v3, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 148, 0);
  return 0;
}

- (id)checkIfModelShouldBeDownloaded:(id)a3 outError:(id *)a4
{
  id v4;
  AMDDODMLDataProcessor *v5;
  id v6;
  id v7;
  id v9;
  AMDDODMLAttachmentProcessor *v10;
  id v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  id location[3];
  id v19;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v4 = objc_alloc(MEMORY[0x24BE63318]);
  v16 = (id)objc_msgSend(v4, "initWithURLs:", MEMORY[0x24BDBD1A8]);
  v15 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", DataProcessingToCheckIfDownloadModel);
  if (!v15)
    objc_storeStrong(&v15, MEMORY[0x24BDBD1A8]);
  v10 = [AMDDODMLAttachmentProcessor alloc];
  v9 = v16;
  v11 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v14 = -[AMDDODMLAttachmentProcessor initWithAttachmentURLs:withInstructions:error:errorDomain:](v10, "initWithAttachmentURLs:withInstructions:error:errorDomain:", v9);

  v5 = [AMDDODMLDataProcessor alloc];
  v13 = -[AMDDODMLDataProcessor initWithActionArray:withAttachmentProcessor:](v5, "initWithActionArray:withAttachmentProcessor:", v15, v14);
  if (v13)
  {
    v19 = v13;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDD1540]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 126, 0);
    *v17 = v7;
    v19 = 0;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (id)performGenericTaskWithDataProcessingCarryover:(id)a3 outError:(id *)a4
{
  NSNumber *v4;
  NSNumber *taskShouldBeStopped;
  id v7;
  AMDLighthouseODMLWorker *v8;
  MLRTaskAttachments *v9;
  NSDictionary *v10;
  NSObject *log;
  os_log_type_t type;
  id v14;
  uint8_t v15[15];
  char v16;
  id v17[2];
  id location[2];
  AMDLighthouseODMLWorker *v19;
  id v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17[1] = a4;
  v4 = (NSNumber *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  taskShouldBeStopped = v19->_taskShouldBeStopped;
  v19->_taskShouldBeStopped = v4;

  v17[0] = (id)sLog;
  v16 = 1;
  if (os_log_type_enabled((os_log_t)v17[0], OS_LOG_TYPE_INFO))
  {
    log = v17[0];
    type = v16;
    __os_log_helper_16_0_0(v15);
    _os_log_impl(&dword_23630A000, log, type, "AMDLighthouseODMLPlugin: Start task", v15, 2u);
  }
  objc_storeStrong(v17, 0);
  v8 = v19;
  v7 = location[0];
  v10 = -[AMDLighthouseODMLWorker recipe](v19, "recipe");
  v9 = -[AMDLighthouseODMLWorker attachments](v19, "attachments");
  v14 = -[AMDLighthouseODMLWorker gatherMetricsToReturn:withRecipe:withAttachments:outError:](v8, "gatherMetricsToReturn:withRecipe:withAttachments:outError:", v7, v10);

  if (v14)
    v20 = v14;
  else
    v20 = 0;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (void)stop
{
  NSNumber *v2;
  NSNumber *taskShouldBeStopped;

  v2 = (NSNumber *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1, a2);
  taskShouldBeStopped = self->_taskShouldBeStopped;
  self->_taskShouldBeStopped = v2;

}

- (NSMutableArray)candidateModels
{
  return self->_candidateModels;
}

- (void)setCandidateModels:(id)a3
{
  objc_storeStrong((id *)&self->_candidateModels, a3);
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_recipe, a3);
}

- (MLRTaskAttachments)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSNumber)taskShouldBeStopped
{
  return self->_taskShouldBeStopped;
}

- (void)setTaskShouldBeStopped:(id)a3
{
  objc_storeStrong((id *)&self->_taskShouldBeStopped, a3);
}

- (TRIExperimentIdentifiers)triExperimentIdentifiers
{
  return self->_triExperimentIdentifiers;
}

- (void)setTriExperimentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_triExperimentIdentifiers, a3);
}

- (NSURL)modelsURL
{
  return self->_modelsURL;
}

- (void)setModelsURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelsURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelsURL, 0);
  objc_storeStrong((id *)&self->_triExperimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_taskShouldBeStopped, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_candidateModels, 0);
}

@end
