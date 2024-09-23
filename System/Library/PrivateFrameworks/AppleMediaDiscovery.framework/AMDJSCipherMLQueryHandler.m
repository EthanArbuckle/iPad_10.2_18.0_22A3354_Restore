@implementation AMDJSCipherMLQueryHandler

+ (id)triggerPIRKVFetch:(id)a3 withError:(id *)a4
{
  id v5;
  NSObject *log;
  os_log_type_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v14;
  os_log_t v16;
  id v17;
  os_log_type_t type;
  os_log_t oslog;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD __b[8];
  id v25;
  id v26;
  id v27;
  id v28;
  __CFString *v29;
  __CFString *v30;
  id v31;
  __CFString *v32;
  __CFString *v33;
  id v34;
  id v35;
  __CFString *v36;
  int v37;
  __CFString *v38;
  id *v39;
  id location[3];
  id v41;
  const __CFString *v42;
  id v43;
  uint8_t v44[32];
  uint8_t v45[24];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = a4;
  if (location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = location[0];
      v34 = (id)objc_msgSend(v35, "objectForKey:", CFSTR("keywords"));
      if (v34)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = (id)objc_msgSend(v35, "objectForKey:", CFSTR("usecase"));
          if (v31)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = v31;
              v27 = v34;
              v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
              memset(__b, 0, sizeof(__b));
              obj = v27;
              v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
              if (v14)
              {
                v10 = *(_QWORD *)__b[2];
                v11 = 0;
                v12 = v14;
                while (1)
                {
                  v9 = v11;
                  if (*(_QWORD *)__b[2] != v10)
                    objc_enumerationMutation(obj);
                  v25 = *(id *)(__b[1] + 8 * v11);
                  v23 = (id)objc_msgSend(v25, "dataUsingEncoding:", 4);
                  objc_msgSend(v26, "addObject:", v23);
                  objc_storeStrong(&v23, 0);
                  ++v11;
                  if (v9 + 1 >= v12)
                  {
                    v11 = 0;
                    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
                    if (!v12)
                      break;
                  }
                }
              }

              v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D106C8]), "initWithUseCase:", v28);
              v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D106E0]), "initWithClientConfig:", v22);
              *v39 = 0;
              v20 = (id)objc_msgSend(v21, "asyncResponseDataByKeywords:error:", v26, v39);
              if (*v39)
              {
                oslog = (os_log_t)MEMORY[0x1E0C81028];
                type = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                {
                  log = oslog;
                  v7 = type;
                  v5 = v28;
                  v8 = (id)objc_msgSend(*v39, "localizedDescription");
                  v17 = v8;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v45, (uint64_t)v5, (uint64_t)v17);
                  _os_log_error_impl(&dword_1DC678000, log, v7, "PIR use case %@ error: %@", v45, 0x16u);

                  objc_storeStrong(&v17, 0);
                }
                objc_storeStrong((id *)&oslog, 0);
                v41 = 0;
                v37 = 1;
              }
              else
              {
                v16 = (os_log_t)MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v44, (uint64_t)v28, (uint64_t)v20);
                  _os_log_debug_impl(&dword_1DC678000, v16, OS_LOG_TYPE_DEBUG, "PIR call handle, usecase %@: %@", v44, 0x16u);
                }
                objc_storeStrong((id *)&v16, 0);
                v42 = CFSTR("callHandle");
                v43 = v20;
                v41 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
                v37 = 1;
              }
              objc_storeStrong(&v20, 0);
              objc_storeStrong(&v21, 0);
              objc_storeStrong(&v22, 0);
              objc_storeStrong(&v26, 0);
              objc_storeStrong(&v27, 0);
              objc_storeStrong(&v28, 0);
            }
            else
            {
              v29 = CFSTR("usecase is not a string");
              *v39 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v29);
              v41 = 0;
              v37 = 1;
              objc_storeStrong((id *)&v29, 0);
            }
          }
          else
          {
            v30 = CFSTR("usecase absent in PIR query payload");
            *v39 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v30);
            v41 = 0;
            v37 = 1;
            objc_storeStrong((id *)&v30, 0);
          }
          objc_storeStrong(&v31, 0);
        }
        else
        {
          v32 = CFSTR("Keywords are not an array");
          *v39 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v32);
          v41 = 0;
          v37 = 1;
          objc_storeStrong((id *)&v32, 0);
        }
      }
      else
      {
        v33 = CFSTR("Keywords absent in PIR query payload");
        *v39 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v33);
        v41 = 0;
        v37 = 1;
        objc_storeStrong((id *)&v33, 0);
      }
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    else
    {
      v36 = CFSTR("PIRQueryPayload is not a dictionary");
      *v39 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v36);
      v41 = 0;
      v37 = 1;
      objc_storeStrong((id *)&v36, 0);
    }
  }
  else
  {
    v38 = CFSTR("PIRQueryPayload is nil");
    *v39 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v38);
    v41 = 0;
    v37 = 1;
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(location, 0);
  return v41;
}

+ (id)triggerPECCall:(id)a3 withError:(id *)a4
{
  _DWORD *v4;
  int v5;
  id v7;
  NSObject *log;
  os_log_type_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id obj;
  uint64_t v34;
  os_log_t v36;
  id v37;
  os_log_type_t type;
  os_log_t oslog;
  id v40;
  id v41;
  id v42;
  _QWORD v43[8];
  id v44;
  uint64_t v45;
  id v46;
  _QWORD v47[8];
  id v48;
  id v49;
  id v50;
  __CFString *v51;
  _QWORD v52[9];
  __CFString *v53;
  _QWORD __b[8];
  id v55;
  __CFString *v56;
  __CFString *v57;
  id v58;
  id v59;
  __CFString *v60;
  __CFString *v61;
  id v62;
  id v63;
  __CFString *v64;
  __CFString *v65;
  id v66;
  id v67;
  __CFString *v68;
  int v69;
  __CFString *v70;
  id *v71;
  id location[3];
  id v73;
  const __CFString *v74;
  id v75;
  uint8_t v76[32];
  uint8_t v77[24];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v71 = a4;
  if (location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = location[0];
      v66 = (id)objc_msgSend(v67, "objectForKey:", CFSTR("usecase"));
      if (v66)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v63 = v66;
          v62 = (id)objc_msgSend(v67, "objectForKey:", CFSTR("shardIndices"));
          if (v62)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v59 = v62;
              v58 = (id)objc_msgSend(v67, "objectForKey:", CFSTR("queryData"));
              if (v58)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  memset(__b, 0, sizeof(__b));
                  obj = v58;
                  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v81, 16);
                  if (v34)
                  {
                    v30 = *(_QWORD *)__b[2];
                    v31 = 0;
                    v32 = v34;
                    while (1)
                    {
                      v29 = v31;
                      if (*(_QWORD *)__b[2] != v30)
                        objc_enumerationMutation(obj);
                      v55 = *(id *)(__b[1] + 8 * v31);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        break;
                      memset(v52, 0, 0x40uLL);
                      v27 = v55;
                      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", v52, v80, 16);
                      if (v28)
                      {
                        v24 = *(_QWORD *)v52[2];
                        v25 = 0;
                        v26 = v28;
                        while (1)
                        {
                          v23 = v25;
                          if (*(_QWORD *)v52[2] != v24)
                            objc_enumerationMutation(v27);
                          v52[8] = *(_QWORD *)(v52[1] + 8 * v25);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            break;
                          ++v25;
                          if (v23 + 1 >= v26)
                          {
                            v25 = 0;
                            v26 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", v52, v80, 16);
                            if (!v26)
                              goto LABEL_31;
                          }
                        }
                        v51 = CFSTR("an embedding element is not a number");
                        *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v51);
                        v73 = 0;
                        v69 = 1;
                        objc_storeStrong((id *)&v51, 0);
                      }
                      else
                      {
LABEL_31:
                        v69 = 0;
                      }

                      if (v69)
                        goto LABEL_36;
                      ++v31;
                      if (v29 + 1 >= v32)
                      {
                        v31 = 0;
                        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v81, 16);
                        if (!v32)
                          goto LABEL_35;
                      }
                    }
                    v53 = CFSTR("an embedding is not an array");
                    *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v53);
                    v73 = 0;
                    v69 = 1;
                    objc_storeStrong((id *)&v53, 0);
                  }
                  else
                  {
LABEL_35:
                    v69 = 0;
                  }
LABEL_36:

                  if (!v69)
                  {
                    v50 = v58;
                    v49 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v50, "count"));
                    memset(v47, 0, sizeof(v47));
                    v21 = v50;
                    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v47, v79, 16);
                    if (v22)
                    {
                      v18 = *(_QWORD *)v47[2];
                      v19 = 0;
                      v20 = v22;
                      while (1)
                      {
                        v17 = v19;
                        if (*(_QWORD *)v47[2] != v18)
                          objc_enumerationMutation(v21);
                        v48 = *(id *)(v47[1] + 8 * v19);
                        v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * objc_msgSend(v48, "count"));
                        v45 = 0;
                        v45 = objc_msgSend(objc_retainAutorelease(v46), "mutableBytes");
                        memset(v43, 0, sizeof(v43));
                        v15 = v48;
                        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", v43, v78, 16);
                        if (v16)
                        {
                          v12 = *(_QWORD *)v43[2];
                          v13 = 0;
                          v14 = v16;
                          while (1)
                          {
                            v11 = v13;
                            if (*(_QWORD *)v43[2] != v12)
                              objc_enumerationMutation(v15);
                            v44 = *(id *)(v43[1] + 8 * v13);
                            objc_msgSend(v44, "floatValue");
                            v4 = (_DWORD *)v45;
                            v45 += 4;
                            *v4 = v5;
                            ++v13;
                            if (v11 + 1 >= v14)
                            {
                              v13 = 0;
                              v14 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", v43, v78, 16);
                              if (!v14)
                                break;
                            }
                          }
                        }

                        objc_msgSend(v49, "addObject:", v46);
                        objc_storeStrong(&v46, 0);
                        ++v19;
                        if (v17 + 1 >= v20)
                        {
                          v19 = 0;
                          v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v47, v79, 16);
                          if (!v20)
                            break;
                        }
                      }
                    }

                    v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D106C8]), "initWithUseCase:", v63);
                    v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D10700]), "initWithClientConfig:", v42);
                    v40 = (id)objc_msgSend(v41, "asyncResponseSimilarityScoresForElements:shardIndices:error:", v49, v59, v71);
                    if (*v71)
                    {
                      oslog = (os_log_t)MEMORY[0x1E0C81028];
                      type = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                      {
                        log = oslog;
                        v9 = type;
                        v7 = v63;
                        v10 = (id)objc_msgSend(*v71, "localizedDescription");
                        v37 = v10;
                        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, (uint64_t)v7, (uint64_t)v37);
                        _os_log_error_impl(&dword_1DC678000, log, v9, "PEC use case %@ error: %@", v77, 0x16u);

                        objc_storeStrong(&v37, 0);
                      }
                      objc_storeStrong((id *)&oslog, 0);
                      v73 = 0;
                      v69 = 1;
                    }
                    else
                    {
                      v36 = (os_log_t)MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                      {
                        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v76, (uint64_t)v63, (uint64_t)v40);
                        _os_log_debug_impl(&dword_1DC678000, v36, OS_LOG_TYPE_DEBUG, "PEC call handle, usecase %@: %@", v76, 0x16u);
                      }
                      objc_storeStrong((id *)&v36, 0);
                      v74 = CFSTR("callHandle");
                      v75 = v40;
                      v73 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
                      v69 = 1;
                    }
                    objc_storeStrong(&v40, 0);
                    objc_storeStrong(&v41, 0);
                    objc_storeStrong(&v42, 0);
                    objc_storeStrong(&v49, 0);
                    objc_storeStrong(&v50, 0);
                  }
                }
                else
                {
                  v56 = CFSTR("data is not an array");
                  *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v56);
                  v73 = 0;
                  v69 = 1;
                  objc_storeStrong((id *)&v56, 0);
                }
              }
              else
              {
                v57 = CFSTR("data absent in PEC query payload");
                *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v57);
                v73 = 0;
                v69 = 1;
                objc_storeStrong((id *)&v57, 0);
              }
              objc_storeStrong(&v58, 0);
              objc_storeStrong(&v59, 0);
            }
            else
            {
              v60 = CFSTR("shardIndices are not an array");
              *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v60);
              v73 = 0;
              v69 = 1;
              objc_storeStrong((id *)&v60, 0);
            }
          }
          else
          {
            v61 = CFSTR("shardIndices absent in PEC query payload");
            *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v61);
            v73 = 0;
            v69 = 1;
            objc_storeStrong((id *)&v61, 0);
          }
          objc_storeStrong(&v62, 0);
          objc_storeStrong(&v63, 0);
        }
        else
        {
          v64 = CFSTR("usecase is not a string");
          *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v64);
          v73 = 0;
          v69 = 1;
          objc_storeStrong((id *)&v64, 0);
        }
      }
      else
      {
        v65 = CFSTR("usecase absent in PEC query payload");
        *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v65);
        v73 = 0;
        v69 = 1;
        objc_storeStrong((id *)&v65, 0);
      }
      objc_storeStrong(&v66, 0);
      objc_storeStrong(&v67, 0);
    }
    else
    {
      v68 = CFSTR("PECQueryPayload is not a dictionary");
      *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v68);
      v73 = 0;
      v69 = 1;
      objc_storeStrong((id *)&v68, 0);
    }
  }
  else
  {
    v70 = CFSTR("PECQueryPayload is nil");
    *v71 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 18, v70);
    v73 = 0;
    v69 = 1;
    objc_storeStrong((id *)&v70, 0);
  }
  objc_storeStrong(location, 0);
  return v73;
}

@end
