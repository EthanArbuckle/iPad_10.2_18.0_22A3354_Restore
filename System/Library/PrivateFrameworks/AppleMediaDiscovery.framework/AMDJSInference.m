@implementation AMDJSInference

+ (id)runInference:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v7;
  uint64_t v8;
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
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  char v34;
  id v35;
  id v36;
  id v37;
  char v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD __b[8];
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  int v60;
  id v61;
  id obj;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id *v70;
  id location[2];
  id v72;
  id v73;
  _QWORD v74[10];
  _QWORD v75[10];
  _QWORD v76[3];
  _QWORD v77[3];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v72 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v70 = a4;
  v69 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4B8948);
  v68 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2E48);
  v67 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BB468);
  v66 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BB448);
  v65 = 0;
  v64 = 0;
  v63 = 0;
  obj = 0;
  v61 = 0;
  v34 = objc_msgSend(v72, "areValidInputs:domainOut:useCaseIdsArray:useCaseIdsSetOut:storeFrontIdString:storeFrontIdOut:dsId:error:", v69, &v65, v68, &obj, v67, &v61, v66, a4);
  objc_storeStrong(&v64, obj);
  objc_storeStrong(&v63, v61);
  if ((v34 & 1) != 0)
  {
    v59 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("inferenceInputData"));
    if (!v59
      || ((v58 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x1EA4BB628, 0), objc_msgSend(v58, "storeFeatureData:error:", v59, v70), !*v70)? (v60 = 0): (v73 = 0, v60 = 1), objc_storeStrong(&v58, 0), !v60))
    {
      v57 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("auxillaryData"));
      if (!v57
        || ((v56 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x1EA4BB628, 0), objc_msgSend(v56, "storeOutputRemapData:error:", v57, v70), !*v70)? (v60 = 0): (v73 = 0, v60 = 1), objc_storeStrong(&v56, 0), !v60))
      {
        v55 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4C2CC8);
        if (v55)
          objc_storeStrong(&v55, v55);
        else
          objc_storeStrong(&v55, MEMORY[0x1E0C9AA70]);
        v54 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("returnInferenceResult"));
        if (v54)
          objc_storeStrong(&v54, v54);
        else
          objc_storeStrong(&v54, MEMORY[0x1E0C9AA70]);
        v53 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BACA8);
        v29 = objc_alloc(MEMORY[0x1E0C99E08]);
        v52 = (id)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v64, "count"));
        v30 = objc_alloc(MEMORY[0x1E0C99E08]);
        v51 = (id)objc_msgSend(v30, "initWithCapacity:", objc_msgSend(v64, "count"));
        v50 = 0;
        memset(__b, 0, sizeof(__b));
        v31 = v64;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v78, 16);
        if (v32)
        {
          v26 = *(_QWORD *)__b[2];
          v27 = 0;
          v28 = v32;
          while (1)
          {
            v25 = v27;
            if (*(_QWORD *)__b[2] != v26)
              objc_enumerationMutation(v31);
            v49 = *(_QWORD *)(__b[1] + 8 * v27);
            objc_storeStrong(&v50, 0);
            v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v46 = (id)objc_msgSend(CFSTR("inferenceUseCase:"), "stringByAppendingString:", v49);
            v45 = (id)objc_msgSend(CFSTR("inferenceError"), "stringByAppendingString:", v46);
            +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", v46);
            v44 = (id)objc_msgSend(v72, "getWorkflowForUseCase:treatmentId:domain:summary:bigSummary:errorKey:", v49, v53, v65, v47, v51, v45);
            if (v44)
            {
              v23 = v72;
              v21 = v49;
              v22 = v53;
              v24 = (id)objc_msgSend(v44, "first");
              v43 = (id)objc_msgSend(v23, "getPredictionForUseCase:treatmentId:UsingWorkflow:domainName:summary:bigSummary:errorKey:", v21, v22, v45);

              if (v43)
              {
                v42 = (id)objc_msgSend(v55, "objectForKey:", v49);
                if (v42)
                {
                  v41 = (id)objc_msgSend(v72, "persist:withUsecase:withConfig:domainName:", v43, v49, v42, v69);
                  objc_msgSend(v47, "setObject:forKey:", v41, CFSTR("resultPersistanceSummary"));
                  objc_storeStrong(&v41, 0);
                }
                v40 = (id)objc_msgSend(v72, "getIdAndScoresFrom:useCaseId:summary:bigGummary:errorKey:", v43, v49, v47, v51, v45);
                v39 = MEMORY[0x1E0C9AA70];
                v20 = (id)objc_msgSend(v43, "objectForKey:", CFSTR("results"));

                if (v20)
                {
                  v76[0] = CFSTR("reco_id");
                  v19 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
                  v18 = (id)objc_msgSend(v19, "UUIDString");
                  v77[0] = v18;
                  v76[1] = CFSTR("reco_eligible");
                  v77[1] = &unk_1EA4CEC50;
                  v76[2] = CFSTR("reco_useCase");
                  v77[2] = v49;
                  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 3);
                  v5 = v39;
                  v39 = v4;

                }
                v38 = 1;
                v37 = (id)objc_msgSend(v54, "objectForKey:", v49);
                if (v37)
                  v38 = objc_msgSend(v37, "BOOLValue") & 1;
                if ((v38 & 1) == 0)
                  objc_storeStrong(&v43, MEMORY[0x1E0C9AA70]);
                v36 = +[AMDFrameworkMetrics getValueForKey:](AMDFrameworkMetrics, "getValueForKey:");
                v74[0] = CFSTR("outputs");
                v75[0] = v43;
                v74[1] = CFSTR("contentIdsProvided");
                v8 = MEMORY[0x1E0C9AAB0];
                v75[1] = MEMORY[0x1E0C9AAB0];
                v74[2] = CFSTR("contentIds");
                v9 = (id)objc_msgSend(v40, "first");
                v75[2] = v9;
                v74[3] = CFSTR("scoresProvided");
                v75[3] = v8;
                v74[4] = CFSTR("scores");
                v10 = (id)objc_msgSend(v40, "second");
                v75[4] = v10;
                v74[5] = CFSTR("maxItemsToDisplay");
                v11 = (id)objc_msgSend(v44, "first");
                v12 = (id)objc_msgSend(v11, "getMaxItemsToDisplay");
                v75[5] = v12;
                v74[6] = CFSTR("workflowUsed");
                v13 = (id)objc_msgSend(v44, "second");
                v75[6] = v13;
                v74[7] = CFSTR("outputFeatures");
                v15 = v72;
                v14 = (id)objc_msgSend(v44, "first");
                v16 = (id)objc_msgSend(v14, "getOutputFeatureIds");
                v17 = (id)objc_msgSend(v15, "getDataForBizLogicForWorkflow:useCaseId:domainName:");
                v75[7] = v17;
                v74[8] = CFSTR("metrics");
                v75[8] = v39;
                v74[9] = CFSTR("inferenceModelInfo");
                if (v36)
                  v7 = v36;
                else
                  v7 = (id)MEMORY[0x1E0C9AA70];
                v75[9] = v7;
                v35 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 10);

                objc_msgSend(v52, "setValue:forKey:", v35, v49);
                objc_msgSend(v51, "setObject:forKey:", v47, v49);
                +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", v46);
                objc_storeStrong(&v35, 0);
                objc_storeStrong(&v36, 0);
                objc_storeStrong(&v37, 0);
                objc_storeStrong(&v39, 0);
                objc_storeStrong(&v40, 0);
                objc_storeStrong(&v42, 0);
                v60 = 0;
              }
              else
              {
                v60 = 3;
              }
              objc_storeStrong(&v43, 0);
            }
            else
            {
              v60 = 3;
            }
            objc_storeStrong(&v44, 0);
            objc_storeStrong(&v45, 0);
            objc_storeStrong(&v46, 0);
            objc_storeStrong(&v47, 0);
            ++v27;
            if (v25 + 1 >= v28)
            {
              v27 = 0;
              v28 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __b, v78, 16);
              if (!v28)
                break;
            }
          }
        }

        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v51, CFSTR("recommendationSummary"), 0);
        objc_msgSend(v72, "appendInAppEventDataTo:forDsId:withInferencePayload:", v52, v66, location[0]);
        v73 = v52;
        v60 = 1;
        objc_storeStrong(&v50, 0);
        objc_storeStrong(&v51, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
        objc_storeStrong(&v54, 0);
        objc_storeStrong(&v55, 0);
      }
      objc_storeStrong(&v57, 0);
    }
    objc_storeStrong(&v59, 0);
  }
  else
  {
    v73 = 0;
    v60 = 1;
  }
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, 0);
  return v73;
}

+ (BOOL)areValidInputs:(id)a3 domainOut:(int64_t *)a4 useCaseIdsArray:(id)a5 useCaseIdsSetOut:(id *)a6 storeFrontIdString:(id)a7 storeFrontIdOut:(id *)a8 dsId:(id)a9 error:(id *)a10
{
  BOOL result;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  id v22;
  id v23;
  int64_t v24;
  int v25;
  char v26;
  id v27;
  id *v28;
  id v29;
  id *v30;
  id v31;
  id *v32;
  id v33;
  int64_t *v34;
  id location[3];
  char v36;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = a4;
  v33 = 0;
  objc_storeStrong(&v33, a5);
  v32 = a6;
  v31 = 0;
  objc_storeStrong(&v31, a7);
  v30 = a8;
  v29 = 0;
  objc_storeStrong(&v29, a9);
  v28 = a10;
  v27 = 0;
  v26 = 0;
  if (location[0])
  {
    v24 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", location[0]);
    if (v24)
    {
      *v34 = v24;
      if (v33 && objc_msgSend(v33, "count"))
      {
        v11 = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
        *v32 = v11;
        if (v31)
        {
          v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v31, "intValue"));
          *v30 = v12;
          if (v29)
          {
            if (+[AMDMiscHelpers isValidDSID:](AMDMiscHelpers, "isValidDSID:", v29))
            {
              v23 = +[AMDTasteProfile getStorefrontIdForDomain:](AMDTasteProfile, "getStorefrontIdForDomain:", location[0]);
              v22 = +[AMDTasteProfile getUserIdForDomain:](AMDTasteProfile, "getUserIdForDomain:", location[0]);
              if (*v30 && v22)
              {
                if ((objc_msgSend(v29, "isEqualToString:", v22) & 1) != 0)
                {
                  if ((objc_msgSend(*v30, "isEqualToNumber:", v23) & 1) != 0)
                  {
                    v25 = 0;
                  }
                  else
                  {
                    v13 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SfId mismatch: payload:%@ TP:%@"), *v30, v23);
                    v14 = v27;
                    v27 = v13;

                    v36 = 0;
                    v25 = 1;
                  }
                }
                else
                {
                  objc_storeStrong(&v27, CFSTR("DsId mismatch"));
                  v36 = 0;
                  v25 = 1;
                }
              }
              else
              {
                objc_storeStrong(&v27, CFSTR("No dsId or sfId in TP"));
                v36 = 0;
                v25 = 1;
              }
              objc_storeStrong(&v22, 0);
              objc_storeStrong(&v23, 0);
              if (!v25)
                v25 = 0;
            }
            else
            {
              objc_storeStrong(&v27, CFSTR("Invalid dsId"));
              v36 = 0;
              v25 = 1;
            }
          }
          else
          {
            objc_storeStrong(&v27, CFSTR("Missing dsId"));
            v36 = 0;
            v25 = 1;
          }
        }
        else
        {
          objc_storeStrong(&v27, CFSTR("Missing storeFrontId"));
          v36 = 0;
          v25 = 1;
        }
      }
      else
      {
        objc_storeStrong(&v27, CFSTR("No use cases"));
        v36 = 0;
        v25 = 1;
      }
    }
    else
    {
      objc_storeStrong(&v27, CFSTR("Unknown domain"));
      v36 = 0;
      v25 = 1;
    }
  }
  else
  {
    objc_storeStrong(&v27, CFSTR("Missing domain"));
    v36 = 0;
    v25 = 1;
  }
  v16 = v25;
  if (v27)
  {
    v15 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v27);
    *v28 = v15;
    result = +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v27, CFSTR("inferenceError"), 0);
  }
  if ((v26 & 1) != 0)
    objc_exception_rethrow();
  v25 = v16;
  if (!v16)
  {
    v36 = 1;
    v25 = 1;
LABEL_32:
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(location, 0);
    return v36 & 1;
  }
  if (v16 != 2)
    goto LABEL_32;
  __break(1u);
  return result;
}

+ (id)getWorkflowForUseCase:(id)a3 treatmentId:(id)a4 domain:(int64_t)a5 summary:(id)a6 bigSummary:(id)a7 errorKey:(id)a8
{
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v24;
  os_log_t v25;
  id v26;
  id v27;
  id v28;
  os_log_type_t v29;
  os_log_t v30;
  id v31;
  os_log_type_t v32;
  os_log_t v33;
  int v34;
  os_log_type_t type;
  os_log_t oslog;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int64_t v43;
  id v44;
  id location[3];
  AMDPair *v46;
  uint8_t v47[32];
  uint8_t v48[32];
  uint8_t v49[32];
  uint8_t v50[40];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = 0;
  objc_storeStrong(&v44, a4);
  v43 = a5;
  v42 = 0;
  objc_storeStrong(&v42, a6);
  v41 = 0;
  objc_storeStrong(&v41, a7);
  v40 = 0;
  objc_storeStrong(&v40, a8);
  v39 = 0;
  v37 = 0;
  v24 = +[AMDWorkflow getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:](AMDWorkflow, "getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:", v43, v44, location[0], &v37);
  objc_storeStrong(&v39, v37);
  v38 = v24;
  if (v39)
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      v16 = location[0];
      v17 = v44;
      v18 = (id)objc_msgSend(v39, "localizedDescription");
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v50, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18);
      _os_log_impl(&dword_1DC678000, oslog, type, "error fetching workflow for use case %@, treatment %@: %@", v50, 0x20u);

    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(v42, "setObject:forKey:", CFSTR("Error getting workflow"), CFSTR("error"));
    v14 = v42;
    v15 = (id)objc_msgSend(v39, "localizedDescription");
    objc_msgSend(v14, "setObject:forKey:");

    objc_msgSend(v41, "setObject:forKey:", v42, location[0]);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Error fetching workflow"), v40, 0);
    v46 = 0;
    v34 = 1;
  }
  else if (v38)
  {
    v31 = (id)objc_msgSend(v38, "second");
    if (!v44)
    {
      v8 = (id)objc_msgSend(v38, "first");
      v9 = v44;
      v44 = v8;

    }
    if (v31 && objc_msgSend(v31, "count"))
    {
      if (v44)
        objc_msgSend(v42, "setObject:forKey:", v44, 0x1EA4BACA8);
      v26 = -[AMDUseCaseWorkflow initWithDictionary:]([AMDUseCaseWorkflow alloc], "initWithDictionary:", v31);
      if ((objc_msgSend(v26, "isValid") & 1) != 0)
      {
        v46 = -[AMDPair initWith:and:]([AMDPair alloc], "initWith:and:", v26, v31);
        v34 = 1;
      }
      else
      {
        v25 = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v47, (uint64_t)location[0], (uint64_t)v44);
          _os_log_error_impl(&dword_1DC678000, v25, OS_LOG_TYPE_ERROR, "invalid workflow for use case %@, treatment %@", v47, 0x16u);
        }
        objc_storeStrong((id *)&v25, 0);
        objc_msgSend(v42, "setObject:forKey:");
        objc_msgSend(v41, "setObject:forKey:", v42, location[0]);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Invalid workflow"), v40, 0);
        v46 = 0;
        v34 = 1;
      }
      objc_storeStrong(&v26, 0);
    }
    else
    {
      v30 = (os_log_t)MEMORY[0x1E0C81028];
      v29 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v48, (uint64_t)location[0], (uint64_t)v44);
        _os_log_impl(&dword_1DC678000, v30, v29, "no workflow for use case %@, treatment %@", v48, 0x16u);
      }
      objc_storeStrong((id *)&v30, 0);
      objc_msgSend(v42, "setObject:forKey:");
      objc_msgSend(v41, "setObject:forKey:", v42, location[0]);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("No workflow"), v40, 0);
      v27 = v39;
      v13 = +[AMDWorkflowInFlight fetchAllModelIds:](AMDWorkflowInFlight, "fetchAllModelIds:", &v27);
      objc_storeStrong(&v39, v27);
      v28 = v13;
      if (!v39)
      {
        v11 = v28;
        v12 = (id)objc_msgSend(CFSTR("inflight_"), "stringByAppendingString:", location[0]);
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v11);

      }
      v46 = 0;
      v34 = 1;
      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v33 = (os_log_t)MEMORY[0x1E0C81028];
    v32 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v49, (uint64_t)location[0], (uint64_t)v44);
      _os_log_impl(&dword_1DC678000, v33, v32, "no workflow for use case %@, treatment %@", v49, 0x16u);
    }
    objc_storeStrong((id *)&v33, 0);
    objc_msgSend(v42, "setObject:forKey:", CFSTR("No workflow"), CFSTR("error"));
    objc_msgSend(v41, "setObject:forKey:", v42, location[0]);
    v46 = 0;
    v34 = 1;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  return v46;
}

+ (id)getPredictionForUseCase:(id)a3 treatmentId:(id)a4 UsingWorkflow:(id)a5 domainName:(id)a6 summary:(id)a7 bigSummary:(id)a8 errorKey:(id)a9
{
  unsigned int v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *log;
  os_log_type_t type;
  id v18;
  id v24;
  id v25;
  id v26;
  id v27;
  __CFString *v28;
  int v29;
  id v30;
  char v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id location[3];
  id v43;
  uint8_t v44[16];
  uint8_t v45[40];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = 0;
  objc_storeStrong(&v40, a5);
  v39 = 0;
  objc_storeStrong(&v39, a6);
  v38 = 0;
  objc_storeStrong(&v38, a7);
  v37 = 0;
  objc_storeStrong(&v37, a8);
  v36 = 0;
  objc_storeStrong(&v36, a9);
  v35 = 0;
  v34 = 0;
  v24 = v40;
  v26 = (id)objc_msgSend(v40, "getMaxItemsToDisplay");
  v9 = objc_msgSend(v26, "unsignedIntValue");
  v33 = v35;
  v25 = (id)objc_msgSend(v24, "getPredictions:forDomain:error:", ((double)v9 * 1.5), v39, &v33);
  objc_storeStrong(&v35, v33);
  v10 = v34;
  v34 = v25;

  if (v35)
  {
    v32 = MEMORY[0x1E0C81028];
    v31 = 1;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_INFO))
    {
      log = v32;
      type = v31;
      v14 = location[0];
      v15 = v41;
      v18 = (id)objc_msgSend(v35, "localizedDescription");
      v30 = v18;
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v45, (uint64_t)v14, (uint64_t)v15, (uint64_t)v30);
      _os_log_impl(&dword_1DC678000, log, type, "error running inference for use case %@, treatment %@: %@", v45, 0x20u);

      objc_storeStrong(&v30, 0);
    }
    objc_storeStrong(&v32, 0);
    objc_msgSend(v38, "setObject:forKey:");
    v12 = v38;
    v13 = (id)objc_msgSend(v35, "localizedDescription");
    objc_msgSend(v12, "setObject:forKey:");

    objc_msgSend(v37, "setObject:forKey:", v38, location[0]);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Error running inference"), v36, 0);
    v43 = 0;
    v29 = 1;
  }
  else if (v34 && objc_msgSend(v34, "count"))
  {
    v43 = v34;
    v29 = 1;
  }
  else
  {
    v28 = CFSTR("No inference output");
    v27 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v28);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v27, OS_LOG_TYPE_ERROR, "%@", v44, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    objc_msgSend(v38, "setObject:forKey:", v28, CFSTR("error"));
    objc_msgSend(v37, "setObject:forKey:", v38, location[0]);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v28, v36, 0);
    v43 = 0;
    v29 = 1;
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v43;
}

+ (id)persist:(id)a3 withUsecase:(id)a4 withConfig:(id)a5 domainName:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  os_log_type_t v31;
  os_log_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int v39;
  id v40;
  _QWORD __b[8];
  uint64_t v42;
  os_log_type_t type;
  os_log_t oslog;
  id v45;
  id v46;
  id v47;
  id v48;
  id location[3];
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t v52[16];
  id v53;
  id v54;
  _BYTE v55[128];
  uint8_t v56[24];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = 0;
  objc_storeStrong(&v48, a4);
  v47 = 0;
  objc_storeStrong(&v47, a5);
  v46 = 0;
  objc_storeStrong(&v46, a6);
  v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  oslog = (os_log_t)MEMORY[0x1E0C81028];
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v48);
    _os_log_debug_impl(&dword_1DC678000, oslog, type, "Persisting inference result with usecase %@", v56, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(__b, 0, sizeof(__b));
  v19 = location[0];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
  if (v20)
  {
    v16 = *(_QWORD *)__b[2];
    v17 = 0;
    v18 = v20;
    while (1)
    {
      v15 = v17;
      if (*(_QWORD *)__b[2] != v16)
        objc_enumerationMutation(v19);
      v42 = *(_QWORD *)(__b[1] + 8 * v17);
      v40 = (id)objc_msgSend(v47, "objectForKey:", v42);
      if (!v40)
      {
        v39 = 3;
        goto LABEL_30;
      }
      v38 = (id)objc_msgSend(v40, "objectForKey:", CFSTR("datastore"));
      if (v38 && (objc_msgSend(v38, "isEqualToString:", CFSTR("AMDDatabase")) & 1) == 0)
      {
        if ((objc_msgSend(v38, "isEqualToString:", CFSTR("vectorDB")) & 1) != 0)
        {
          v30 = (id)objc_msgSend(v40, "objectForKey:", CFSTR("vectorDBConfig"));
          if (v30)
          {
            v29 = (id)objc_msgSend(location[0], "objectForKey:", v42);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = v29;
              v27 = 0;
              v50[0] = CFSTR("vectorDBConfig");
              v51[0] = v30;
              v50[1] = CFSTR("vectorDict");
              v51[1] = v28;
              v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
              v24 = v27;
              v8 = +[AMDVectorDBManager insertVectorsHandlerWithInsertVectorsPayload:error:](_TtC19AppleMediaDiscovery18AMDVectorDBManager, "insertVectorsHandlerWithInsertVectorsPayload:error:", v26, &v24);
              objc_storeStrong(&v27, v24);
              v25 = v8;
              objc_msgSend(v45, "setObject:forKey:", v8, v42);
              objc_storeStrong(&v25, 0);
              objc_storeStrong(&v26, 0);
              objc_storeStrong(&v27, 0);
              objc_storeStrong(&v28, 0);
              v39 = 0;
            }
            else
            {
              objc_msgSend(v45, "setObject:forKey:", CFSTR("Inference output has to be a dictionary to be persisted in vectorDB"), v42);
              v39 = 3;
            }
            objc_storeStrong(&v29, 0);
          }
          else
          {
            objc_msgSend(v45, "setObject:forKey:", CFSTR("VectorDB Config missing"), v42);
            v39 = 3;
          }
          objc_storeStrong(&v30, 0);
          if (v39)
            goto LABEL_29;
        }
        else
        {
          objc_msgSend(v45, "setObject:forKey:", CFSTR("Unsupported datastore passed for persistance"), v42);
        }
      }
      else
      {
        v37 = (id)objc_msgSend(v48, "stringByAppendingString:", v42);
        v53 = v37;
        v54 = location[0];
        v36 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v35 = 0;
        v33 = 0;
        v14 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:", v36, v46, 0x1EA4C2528, &v33);
        objc_storeStrong(&v35, v33);
        v34 = v14;
        if (v35)
        {
          v32 = (os_log_t)MEMORY[0x1E0C81028];
          v31 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v11 = v32;
            v12 = v31;
            v13 = (id)objc_msgSend(v35, "localizedDescription");
            __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v13);
            _os_log_impl(&dword_1DC678000, v11, v12, "Error persisting inference result: %@", v52, 0xCu);

          }
          objc_storeStrong((id *)&v32, 0);
          v9 = v45;
          v10 = (id)objc_msgSend(v35, "localizedDescription");
          objc_msgSend(v9, "setObject:forKey:");

          v39 = 3;
        }
        else
        {
          objc_msgSend(v45, "setObject:forKey:", v34, CFSTR("saveSummary"));
          v39 = 0;
        }
        objc_storeStrong(&v34, 0);
        objc_storeStrong(&v35, 0);
        objc_storeStrong(&v36, 0);
        objc_storeStrong(&v37, 0);
        if (v39)
          goto LABEL_29;
      }
      v39 = 0;
LABEL_29:
      objc_storeStrong(&v38, 0);
LABEL_30:
      objc_storeStrong(&v40, 0);
      ++v17;
      if (v15 + 1 >= v18)
      {
        v17 = 0;
        v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
        if (!v18)
          break;
      }
    }
  }

  v7 = v45;
  v39 = 1;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)getIdAndScoresFrom:(id)a3 useCaseId:(id)a4 summary:(id)a5 bigGummary:(id)a6 errorKey:(id)a7
{
  AMDPair *v7;
  AMDPair *v8;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  os_log_t oslog;
  __CFString *v19;
  id v20;
  id v21;
  id v22;
  int v23;
  uint8_t v24[15];
  char v25;
  id v26;
  id v27;
  os_log_type_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id location[3];
  AMDPair *v35;
  uint8_t v36[16];
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = 0;
  objc_storeStrong(&v32, a5);
  v31 = 0;
  objc_storeStrong(&v31, a6);
  v30 = 0;
  objc_storeStrong(&v30, a7);
  v29 = MEMORY[0x1E0C81028];
  v28 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v33);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v29, v28, "Retrieving contentId and scores for use case %@", v37, 0xCu);
  }
  objc_storeStrong(&v29, 0);
  v13 = (id)objc_msgSend(location[0], "allValues");
  v27 = (id)objc_msgSend(v13, "firstObject");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v27;
    v21 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("ids"));
    v20 = (id)objc_msgSend(v22, "objectForKey:", CFSTR("scores"));
    if (!v21 || !objc_msgSend(v21, "count") || !v20 || !objc_msgSend(v20, "count"))
    {
      v19 = CFSTR("No content ids or scores available");
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v19);
        _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v36, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_msgSend(v32, "setObject:forKey:", v19, CFSTR("error"));
      objc_msgSend(v31, "setObject:forKey:", v32, v33);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Empty inference"), v30, 0);
      v10 = (id)MEMORY[0x1E0C9AA60];
      objc_storeStrong(&v21, MEMORY[0x1E0C9AA60]);
      objc_storeStrong(&v20, v10);
      objc_storeStrong((id *)&v19, 0);
    }
    v8 = [AMDPair alloc];
    v35 = -[AMDPair initWith:and:](v8, "initWith:and:", v21, v20);
    v23 = 1;
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  else
  {
    v26 = MEMORY[0x1E0C81028];
    v25 = 1;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_INFO))
    {
      v11 = v26;
      v12 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_impl(&dword_1DC678000, v11, v12, "Recommendation results are not a dict", v24, 2u);
    }
    objc_storeStrong(&v26, 0);
    v7 = [AMDPair alloc];
    v35 = -[AMDPair initWith:and:](v7, "initWith:and:", MEMORY[0x1E0C9AA60]);
    v23 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v35;
}

+ (id)getDataForBizLogicForWorkflow:(id)a3 useCaseId:(id)a4 domainName:(id)a5
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *log;
  os_log_type_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v20;
  uint64_t v21;
  id v22;
  int v23;
  os_log_type_t type;
  os_log_t oslog;
  id v26;
  id v27;
  id v28;
  _QWORD __b[8];
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id location[3];
  uint8_t v35[56];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = 0;
  objc_storeStrong(&v32, a5);
  v31 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  v20 = location[0];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
  if (v21)
  {
    v15 = *(_QWORD *)__b[2];
    v16 = 0;
    v17 = v21;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)__b[2] != v15)
        objc_enumerationMutation(v20);
      v30 = *(_QWORD *)(__b[1] + 8 * v16);
      v28 = 0;
      v26 = 0;
      v13 = +[AMDTasteProfile getFeatureWithName:inDomain:withColumnName:error:](AMDTasteProfile, "getFeatureWithName:inDomain:withColumnName:error:", v30, v32, 0, &v26);
      objc_storeStrong(&v28, v26);
      v27 = v13;
      if (!v28 && v27)
      {
        v22 = (id)objc_msgSend(v27, "getValue");
        if (v22)
          objc_msgSend(v31, "setObject:forKey:", v22, v30);
        objc_storeStrong(&v22, 0);
        v23 = 0;
      }
      else
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        type = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          log = oslog;
          v11 = type;
          v7 = v30;
          v8 = v32;
          v9 = v33;
          v12 = (id)objc_msgSend(v28, "localizedDescription");
          __os_log_helper_16_2_4_8_64_8_64_8_64_8_64((uint64_t)v35, v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v12);
          _os_log_impl(&dword_1DC678000, log, v11, "Error fetching feature '%@' for domain: %@, useCaseId: %@: %@", v35, 0x2Au);

        }
        objc_storeStrong((id *)&oslog, 0);
        v23 = 3;
      }
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
        if (!v17)
          break;
      }
    }
  }

  v6 = v31;
  v23 = 1;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (void)appendInAppEventDataTo:(id)a3 forDsId:(id)a4 withInferencePayload:(id)a5
{
  id v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  os_log_t oslog;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint8_t v18[7];
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[3];
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = (id)objc_msgSend(v22, "objectForKey:", 0x1EA4C2F48);
  if (v21 && objc_msgSend(v21, "intValue"))
  {
    v16 = (id)objc_msgSend(v22, "objectForKey:", 0x1EA4C2EE8);
    v15 = (id)objc_msgSend(v22, "objectForKey:", 0x1EA4C2F08);
    if (v15)
      objc_storeStrong(&v15, v15);
    else
      objc_storeStrong(&v15, &unk_1EA4CEC68);
    v14 = 0;
    v12 = 0;
    v6 = +[AMDAppStoreEvent retrieveEventsOfType:inPeriod:forUser:error:](AMDAppStoreEvent, "retrieveEventsOfType:inPeriod:forUser:error:", v16, v15, v23, &v12);
    objc_storeStrong(&v14, v12);
    v13 = v6;
    if (v14)
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v5 = (id)objc_msgSend(v14, "localizedDescription");
        __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v5);
        _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "Error while retrieving AppStore Events: %@", v25, 0xCu);

      }
      objc_storeStrong((id *)&oslog, 0);
      v17 = 1;
    }
    else
    {
      if (v13)
        objc_msgSend(location[0], "setObject:forKey:", v13, CFSTR("appStoreEvents"));
      v17 = 0;
    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v20 = MEMORY[0x1E0C81028];
    v19 = 2;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG))
    {
      log = v20;
      type = v19;
      __os_log_helper_16_0_0(v18);
      _os_log_debug_impl(&dword_1DC678000, log, type, "App store impressions/clicks skipped", v18, 2u);
    }
    objc_storeStrong(&v20, 0);
    v17 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end
