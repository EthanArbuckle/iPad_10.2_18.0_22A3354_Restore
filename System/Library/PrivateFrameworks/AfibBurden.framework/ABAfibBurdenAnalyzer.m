@implementation ABAfibBurdenAnalyzer

- (ABAfibBurdenAnalyzer)init
{
  ABAfibBurdenAnalyzer *v2;
  ABAfibBurdenAnalyzer *v3;
  uint64_t v5;
  int out_token;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABAfibBurdenAnalyzer;
  v2 = -[ABAfibBurdenAnalyzer init](&v7, sel_init);
  if (v2)
  {
    out_token = -1;
    v5 = 0;
    notify_register_check("com.apple.AfibBurden.ForceAnalysis.WriteToJson", &out_token);
    notify_get_state(out_token, &v5);
    if (!v5)
      +[ABAfibBurdenAnalyzer removeDiagnosticLogFiles](ABAfibBurdenAnalyzer, "removeDiagnosticLogFiles");
    v3 = v2;
  }

  return v2;
}

- (id)processResults:(void *)a3 withAlgsAnalytics:(core_analytics_t *)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char v31;
  float v32;
  BOOL v33;
  _QWORD *v34;
  _QWORD v35[8];
  _QWORD v36[8];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x24BDAC8D0];
  LOBYTE(v32) = 0;
  v33 = 0;
  LOBYTE(v30) = 0;
  v31 = 0;
  v37[0] = &v32;
  v37[1] = &v30;
  v4 = *((unsigned int *)a3 + 1);
  if ((_DWORD)v4 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v34 = v37;
  ((void (*)(_QWORD **, void *))off_250758F68[v4])(&v34, a3);
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (!v7)
    goto LABEL_35;
  if (!v33)
  {
    if (v31)
    {
      objc_msgSend(v7, "setBurdenPercentage:", 0);
      if (!v31)
        std::__throw_bad_optional_access[abi:ne180100]();
      v12 = v30;
      goto LABEL_14;
    }
    ab_get_framework_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:].cold.1(v24);

LABEL_35:
    v23 = 0;
    goto LABEL_36;
  }
  v9 = v32;
  v10 = v32 / 100.0;
  if (v10 >= 0.0199999996)
  {
    if (modff(v32, (float *)v37) <= 0.5)
      *(float *)&v13 = floorf(v9) / 100.0;
    else
      *(float *)&v13 = ceilf(v9) / 100.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBurdenPercentage:", v14);

  }
  else
  {
    LODWORD(v10) = 1017370378;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBurdenPercentage:", v11);

  }
  v12 = 0;
LABEL_14:
  objc_msgSend(v8, "setUnavailabilityReason:", v12);
  self->_rawBurdenValue.var0.__val_.Afib_burden = v32;
  self->_rawBurdenValue.__engaged_ = v33;
  v35[0] = CFSTR("reasonNoReport");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "unavailabilityReason"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v28;
  v35[1] = CFSTR("segmentsCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[ABAfibBurdenAnalyzer segmentsCount](self, "segmentsCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v27;
  v35[2] = CFSTR("segmentsWith5TachCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[ABAfibBurdenAnalyzer segmentsWith5TachCount](self, "segmentsWith5TachCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v26;
  v35[3] = CFSTR("AFBurden");
  if (v33)
  {
    *(float *)&v15 = v32;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v29;
  v35[4] = CFSTR("AFDensity");
  if ((LODWORD(a4->var1) & 0x7FFFFFFFu) > 0x7F7FFFFF)
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v16;
  v35[5] = CFSTR("timeBetweenTachs");
  if ((LODWORD(a4->var0) & 0x7FFFFFFFu) > 0x7F7FFFFF)
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v17;
  v35[6] = CFSTR("countTimezoneShifts");
  if ((*(_QWORD *)&a4->var2 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v18;
  v35[7] = CFSTR("highestTimezoneShift");
  if ((*(_QWORD *)&a4->var3 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4->var3 / 3600.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetricsForCoreAnalytics:", v20);

  ab_get_framework_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "metricsForCoreAnalytics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:].cold.2(v22, (uint64_t)v37, v21);
  }

  v23 = v8;
LABEL_36:

  return v23;
}

- (id)determineBurdenForTachogramClassificationBuckets:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  core_analytics_t *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE *v49;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  unsigned __int16 v55;
  uint64_t v56;
  ABAfibBurdenAnalyzer *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[16];
  void *__p[2];
  __int128 v64;
  uint8_t v65;
  _BYTE v66[7];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[8];
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t v78[16];
  __int128 v79;
  __int128 v80;
  _QWORD v81[8];
  _QWORD v82[11];

  v82[8] = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v57 = self;
  if (objc_msgSend(v50, "count"))
  {
    v79 = 0u;
    v80 = 0u;
    *(_OWORD *)v78 = 0u;
    -[ABAfibBurdenAnalyzer setSegmentsCount:](self, "setSegmentsCount:", objc_msgSend(v50, "count"));
    -[ABAfibBurdenAnalyzer setSegmentsWith5TachCount:](self, "setSegmentsWith5TachCount:", 0);
    ab_get_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235FAB000, v4, OS_LOG_TYPE_DEFAULT, "bucketIndex, timestamp, UUID :", buf, 2u);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v50;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    if (v5)
    {
      v55 = 0;
      v53 = *(_QWORD *)v68;
      v49 = v66;
      while (2)
      {
        v56 = 0;
        v52 = v5;
        do
        {
          if (*(_QWORD *)v68 != v53)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v56);
          if (!objc_msgSend(v6, "count", v49))
          {
            ab_get_framework_log();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
              -[ABAfibBurdenAnalyzer determineBurdenForTachogramClassificationBuckets:].cold.2(v45, v46, v47);

            v36 = 0;
            goto LABEL_64;
          }
          if ((unint64_t)objc_msgSend(v6, "count") >= 5)
            -[ABAfibBurdenAnalyzer setSegmentsWith5TachCount:](self, "setSegmentsWith5TachCount:", (-[ABAfibBurdenAnalyzer segmentsWith5TachCount](self, "segmentsWith5TachCount") + 1));
          objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v54, "isEqualToArray:", v6) & 1) == 0)
          {
            ab_get_framework_log();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
              -[ABAfibBurdenAnalyzer determineBurdenForTachogramClassificationBuckets:].cold.3(&v65, v49, v7);

          }
          *(_OWORD *)__p = 0u;
          v64 = 0u;
          v61 = 0u;
          *(_OWORD *)buf = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v8 = v54;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v59 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                ab_get_framework_log();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "date");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "timeIntervalSince1970");
                  v16 = v15;
                  objc_msgSend(v12, "uuid");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v71 = 67109634;
                  *(_DWORD *)&v71[4] = v55;
                  v72 = 2048;
                  v73 = v16;
                  v74 = 2112;
                  v75 = v17;
                  _os_log_impl(&dword_235FAB000, v13, OS_LOG_TYPE_DEFAULT, "%d, %f, %@", v71, 0x1Cu);

                  self = v57;
                }

                v71[0] = objc_msgSend(v12, "aFibDetected");
                std::vector<BOOL>::push_back((uint64_t)&__p[1], v71);
                objc_msgSend(v12, "date");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "timeIntervalSince1970");
                v20 = v19;
                v21 = *(char **)&buf[8];
                if ((void *)*(_QWORD *)&buf[8] >= __p[0])
                {
                  v23 = *(char **)buf;
                  v24 = (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3;
                  v25 = v24 + 1;
                  if ((unint64_t)(v24 + 1) >> 61)
                    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                  v26 = (uint64_t)__p[0] - *(_QWORD *)buf;
                  if (((uint64_t)__p[0] - *(_QWORD *)buf) >> 2 > v25)
                    v25 = v26 >> 2;
                  if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
                    v27 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v27 = v25;
                  if (v27)
                  {
                    v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)__p, v27);
                    v23 = *(char **)buf;
                    v21 = *(char **)&buf[8];
                  }
                  else
                  {
                    v28 = 0;
                  }
                  v29 = &v28[8 * v24];
                  *(_QWORD *)v29 = v20;
                  v22 = v29 + 8;
                  while (v21 != v23)
                  {
                    v30 = *((_QWORD *)v21 - 1);
                    v21 -= 8;
                    *((_QWORD *)v29 - 1) = v30;
                    v29 -= 8;
                  }
                  *(_QWORD *)buf = v29;
                  *(_QWORD *)&buf[8] = v22;
                  __p[0] = &v28[8 * v27];
                  if (v23)
                    operator delete(v23);
                }
                else
                {
                  **(_QWORD **)&buf[8] = v19;
                  v22 = v21 + 8;
                }
                *(_QWORD *)&buf[8] = v22;

              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
            }
            while (v9);
          }

          v31 = v80;
          if ((unint64_t)v80 >= *((_QWORD *)&v80 + 1))
          {
            v32 = std::vector<std::vector<BOOL>>::__push_back_slow_path<std::vector<BOOL> const&>((uint64_t *)&v79 + 1, (uint64_t)&__p[1]);
          }
          else
          {
            std::vector<BOOL>::vector((_QWORD *)v80, (uint64_t)&__p[1]);
            v32 = v31 + 24;
          }
          *(_QWORD *)&v80 = v32;
          v33 = *(_QWORD **)&v78[8];
          if (*(_QWORD *)&v78[8] >= (unint64_t)v79)
          {
            v34 = std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>((uint64_t *)v78, (uint64_t)buf);
          }
          else
          {
            **(_QWORD **)&v78[8] = 0;
            v33[1] = 0;
            v33[2] = 0;
            std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v33, *(const void **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
            v34 = (uint64_t)(v33 + 3);
          }
          *(_QWORD *)&v78[8] = v34;
          if (__p[1])
            operator delete(__p[1]);
          if (*(_QWORD *)buf)
          {
            *(_QWORD *)&buf[8] = *(_QWORD *)buf;
            operator delete(*(void **)buf);
          }

          ++v55;
          ++v56;
        }
        while (v56 != v52);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
        if (v5)
          continue;
        break;
      }
    }

    memset(buf, 0, sizeof(buf));
    __p[0] = 0;
    *(_QWORD *)v71 = beryllium::process((beryllium *)v78, (core_analytics_t *)buf, v35);
    -[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:](self, "processResults:withAlgsAnalytics:", v71, buf);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABAfibBurdenAnalyzer logToFileForTachoList:withBurdenResults:](self, "logToFileForTachoList:withBurdenResults:", obj, v36);
LABEL_64:
    *(_QWORD *)buf = (char *)&v79 + 8;
    std::vector<std::vector<BOOL>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    *(_QWORD *)buf = v78;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    ab_get_framework_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v78 = 0;
      _os_log_impl(&dword_235FAB000, v37, OS_LOG_TYPE_DEFAULT, "Empty list of classification buckets received", v78, 2u);
    }

    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "setBurdenPercentage:", 0);
    objc_msgSend(v36, "setUnavailabilityReason:", 1);
    if (self->_rawBurdenValue.__engaged_)
      self->_rawBurdenValue.__engaged_ = 0;
    -[ABAfibBurdenAnalyzer logToFileForTachoList:withBurdenResults:](self, "logToFileForTachoList:withBurdenResults:", v50, v36);
    v81[0] = CFSTR("reasonNoReport");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v36, "unavailabilityReason"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v38;
    v81[1] = CFSTR("segmentsCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[ABAfibBurdenAnalyzer segmentsCount](self, "segmentsCount"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v39;
    v81[2] = CFSTR("segmentsWith5TachCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[ABAfibBurdenAnalyzer segmentsWith5TachCount](self, "segmentsWith5TachCount"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v40;
    v81[3] = CFSTR("AFBurden");
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v82[3] = v41;
    v82[4] = &unk_25075A2F8;
    v81[4] = CFSTR("AFDensity");
    v81[5] = CFSTR("timeBetweenTachs");
    v82[5] = &unk_25075A2F8;
    v82[6] = &unk_25075A2F8;
    v81[6] = CFSTR("countTimezoneShifts");
    v81[7] = CFSTR("highestTimezoneShift");
    v82[7] = &unk_25075A2F8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMetricsForCoreAnalytics:", v42);

    ab_get_framework_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v36, "metricsForCoreAnalytics");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:].cold.2(v44, (uint64_t)v78, v43);
    }

  }
  return v36;
}

uint64_t __73__ABAfibBurdenAnalyzer_determineBurdenForTachogramClassificationBuckets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (void)logToFileForTachoList:(id)a3 withBurdenResults:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  id v21;
  void *v22;
  float v23;
  NSObject *v24;
  void *v25;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  id v35;
  char *v36;
  std::string v37;
  uint64_t v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[8];
  uint64_t *v49;
  int v50;
  _BYTE v51[8];
  uint64_t *v52[3];
  char v53;
  __int128 v54;
  std::string::size_type v55;
  id v56;
  uint64_t state64;
  int out_token;
  _BYTE v59[128];
  _BYTE v60[128];
  std::string buf[17];
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v30 = a4;
  out_token = -1;
  state64 = 0;
  notify_register_check("com.apple.AfibBurden.ForceAnalysis.WriteToJson", &out_token);
  notify_get_state(out_token, &state64);
  if (state64)
  {
    ab_get_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = state64;
      _os_log_impl(&dword_235FAB000, v5, OS_LOG_TYPE_DEFAULT, "ABAfibBurdenAnalyzer : logging to file. notifyState is set to %llu", (uint8_t *)buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = *MEMORY[0x24BDD0CF0];
    v64[0] = *MEMORY[0x24BDD0CD8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v8 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Logs/AfBHIDDiagnostics/"), 1, v7, &v56);
    v28 = v56;

    if ((v8 & 1) != 0)
    {
      std::to_string(&v37, state64);
      v9 = std::string::insert(&v37, 0, "process_burden_");
      v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
      buf[0].__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
      *(_OWORD *)&buf[0].__r_.__value_.__l.__data_ = v10;
      v9->__r_.__value_.__l.__size_ = 0;
      v9->__r_.__value_.__r.__words[2] = 0;
      v9->__r_.__value_.__r.__words[0] = 0;
      v11 = std::string::append(buf, ".json");
      v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      v55 = v11->__r_.__value_.__r.__words[2];
      v54 = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v37.__r_.__value_.__l.__data_);
      objc_msgSend(CFSTR("/var/mobile/Library/Logs/AfBHIDDiagnostics/"), "UTF8String", self);
      std::operator+<char>();
      std::ofstream::basic_ofstream(buf);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v51, 0, 0, 0, 1);
      v50 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v48, 0, 0, 0, 2);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v29;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      if (v13)
      {
        v32 = *(_QWORD *)v45;
        do
        {
          v33 = v13;
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v45 != v32)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v35 = v14;
            v7 = (void *)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v59, 16);
            if (v7)
            {
              v15 = *(_QWORD *)v41;
              do
              {
                for (j = 0; j != v7; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v41 != v15)
                    objc_enumerationMutation(v35);
                  v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v38, 0, 0, 0, 1);
                  objc_msgSend(v17, "date", nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[12],int &>((uint64_t)&v38, "bucketIndex", &v50, (uint64_t)&v37));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "timeIntervalSince1970");
                  v36 = v19;
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[10],double>((uint64_t)&v38, "timestamp", (uint64_t *)&v36, (uint64_t)&v37);

                  objc_msgSend(v17, "uuid");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "UUIDString");
                  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v36 = (char *)objc_msgSend(v21, "UTF8String");
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[5],char const*>((uint64_t)&v38, "uuid", &v36, (uint64_t)&v37);

                  LOBYTE(v36) = objc_msgSend(v17, "aFibDetected");
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[13],BOOL>((uint64_t)&v38, "afibDetected", (unsigned __int8 *)&v36, (uint64_t)&v37);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v48, (uint64_t)&v38);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v38);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v39, v38);
                }
                v7 = (void *)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v59, 16);
              }
              while (v7);
            }

            ++v50;
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        }
        while (v13);
      }

      objc_msgSend(v30, "burdenPercentage", nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v51, "classifiedTachoList", (uint64_t)v48, (uint64_t)&v37));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v30, "burdenPercentage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "floatValue");
      }
      else
      {
        v23 = -1.0;
      }
      *(float *)&v38 = v23;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],float>((uint64_t)v51, "burdenReportedValue", (float *)&v38, (uint64_t)&v37);
      if (v22)

      LODWORD(v36) = -1082130432;
      if (*(_BYTE *)(v27 + 12) && (*(_DWORD *)(v27 + 8) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
        LODWORD(v36) = *(_DWORD *)(v27 + 8);
      v38 = objc_msgSend(v30, "unavailabilityReason", nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[15],float &>((uint64_t)v51, "burdenRawValue", (float *)&v36, (uint64_t)&v37));
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[21],ABUnavailabilityReason>((uint64_t)v51, "unavailabilityReason", &v38, (uint64_t)&v37);
      nlohmann::operator<<((uint64_t *)buf, (uint64_t)v51);
      v37.__r_.__value_.__s.__data_[0] = 10;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)&v37, 1);
      notify_cancel(out_token);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v48);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v49, v48[0]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v52, v51[0]);
      buf[0].__r_.__value_.__r.__words[0] = *MEMORY[0x24BEDB7E8];
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words
                                + *(_QWORD *)(buf[0].__r_.__value_.__r.__words[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 24);
      MEMORY[0x23B7E7FD4](&buf[0].__r_.__value_.__r.__words[1]);
      std::ostream::~ostream();
      MEMORY[0x23B7E8064](&v62);
      if (v53 < 0)
        operator delete(v52[1]);
      v25 = v28;
      if (SHIBYTE(v55) < 0)
        operator delete((void *)v54);
    }
    else
    {
      ab_get_framework_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[ABTachogramClassifier logToFileForTacho:withClassification:].cold.1((uint64_t)v28, v24);

      v25 = v28;
      notify_cancel(out_token);
    }

  }
  else
  {
    notify_cancel(out_token);
  }

}

+ (void)removeDiagnosticLogFiles
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("/var/mobile/Library/Logs/AfBHIDDiagnostics/");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_235FAB000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve files at path : %@ with error : %@", (uint8_t *)&v2, 0x16u);
}

- (unsigned)segmentsCount
{
  return self->_segmentsCount;
}

- (void)setSegmentsCount:(unsigned __int8)a3
{
  self->_segmentsCount = a3;
}

- (unsigned)segmentsWith5TachCount
{
  return self->_segmentsWith5TachCount;
}

- (void)setSegmentsWith5TachCount:(unsigned __int8)a3
{
  self->_segmentsWith5TachCount = a3;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 12) = 0;
  return self;
}

- (void)processResults:(os_log_t)log withAlgsAnalytics:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235FAB000, log, OS_LOG_TYPE_ERROR, "No valid reason or value to report", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)processResults:(NSObject *)a3 withAlgsAnalytics:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1(&dword_235FAB000, a2, a3, "CA Metrics : %@", (uint8_t *)a2);

}

- (void)determineBurdenForTachogramClassificationBuckets:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_235FAB000, a1, a3, "empty classification bucket received", v3);
  OUTLINED_FUNCTION_2();
}

- (void)determineBurdenForTachogramClassificationBuckets:(NSObject *)a3 .cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_235FAB000, a3, (uint64_t)a3, "input tachogram classification bucket is not in ascending order", a1);
}

@end
