@implementation BABreathingDisturbanceAnalyzer

+ (BABreathingDisturbanceAnalysis)analyzeSamples:(SEL)a3 dateInterval:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  float v51;
  float *v52;
  float *v53;
  float *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  float *v59;
  float *v60;
  __int128 v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  uint64_t v81;
  id var1;
  int v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  BABreathingDisturbanceAnalysis *result;
  BABreathingDisturbanceAnalysis *v90;
  id v91;
  id v92;
  void *v93;
  id obj;
  char v95[8];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  void *__p;
  float *v101;
  float *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t v107[4];
  int v108;
  _QWORD v109[11];
  _QWORD v110[11];
  uint8_t buf[32];
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v90 = retstr;
  v91 = a5;
  retstr->var0 = &unk_2508A8C58;
  retstr->var1 = 0;
  retstr->var2 = 0;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v104 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        hws_get_framework_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "quantity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValueForUnit:", v14);
          v16 = v15;
          objc_msgSend(v11, "startDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "endDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134546435;
          *(_QWORD *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v18;
          LOWORD(v112) = 2114;
          *(_QWORD *)((char *)&v112 + 2) = v19;
          _os_log_impl(&dword_23740B000, v12, OS_LOG_TYPE_DEFAULT, "%{sensitive}lf for %{public}@ - %{public}@ for %{public}@", buf, 0x2Au);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
    }
    while (v8);
  }

  if ((unint64_t)objc_msgSend(obj, "count") < 0x1F)
  {
    objc_msgSend(v91, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqualToDate:", v22);

    if (v23)
    {
      hws_get_framework_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v91, "startDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "endDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.2(v25, v26, buf, v24);
      }

    }
    else
    {
      __p = 0;
      v101 = 0;
      v102 = 0;
      std::vector<NebulaNotification::BDReport>::reserve(&__p, objc_msgSend(obj, "count"));
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v92 = obj;
      v27 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v97;
        v29 = (void *)*MEMORY[0x24BDD3358];
LABEL_20:
        v30 = 0;
        while (1)
        {
          if (*(_QWORD *)v97 != v28)
            objc_enumerationMutation(v92);
          v31 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v30);
          objc_msgSend(v31, "quantity");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "doubleValueForUnit:", v33);
          v35 = v34;

          objc_msgSend(v31, "quantityType");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37 == v29;

          if (!v38)
          {
            hws_get_framework_log();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v31, "quantityType");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "identifier");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "UUID");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v87;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v88;
              _os_log_fault_impl(&dword_23740B000, v85, OS_LOG_TYPE_FAULT, "Invalid HealthKit type (%{public}@) for sample %{public}@.", buf, 0x16u);

            }
            goto LABEL_61;
          }
          if (v35 < 0.0)
          {
            hws_get_framework_log();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v31, "UUID");
              objc_claimAutoreleasedReturnValue();
              +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.4();
            }
            goto LABEL_61;
          }
          if (v35 > 130.0)
          {
            hws_get_framework_log();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v31, "UUID");
              objc_claimAutoreleasedReturnValue();
              +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.5();
            }
            goto LABEL_61;
          }
          objc_msgSend(v31, "endDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "startDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v39, "compare:", v40) == 1;

          if (!v41)
            break;
          objc_msgSend(v31, "endDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "endDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "compare:", v43) == 1;

          if (v44)
          {
            hws_get_framework_log();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v31, "UUID");
              objc_claimAutoreleasedReturnValue();
              +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.6();
            }
LABEL_61:

            goto LABEL_62;
          }
          objc_msgSend(v31, "startDate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "timeIntervalSinceReferenceDate");
          v47 = v46;
          objc_msgSend(v31, "endDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "timeIntervalSinceReferenceDate");
          v50 = v49;
          v51 = v35;
          v52 = v101;
          if (v101 >= v102)
          {
            v54 = (float *)__p;
            v55 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (_BYTE *)__p) >> 3);
            v56 = v55 + 1;
            if (v55 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<NebulaNotification::BDReport>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * (((char *)v102 - (_BYTE *)__p) >> 3) > v56)
              v56 = 0x5555555555555556 * (((char *)v102 - (_BYTE *)__p) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v102 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
              v57 = 0xAAAAAAAAAAAAAAALL;
            else
              v57 = v56;
            if (v57)
            {
              v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NebulaNotification::BDReport>>((uint64_t)&v102, v57);
              v54 = (float *)__p;
              v52 = v101;
            }
            else
            {
              v58 = 0;
            }
            v59 = (float *)&v58[24 * v55];
            *v59 = v51;
            *((_QWORD *)v59 + 1) = v47;
            *((_QWORD *)v59 + 2) = v50;
            v60 = v59;
            if (v52 != v54)
            {
              do
              {
                v61 = *(_OWORD *)(v52 - 6);
                *((_QWORD *)v60 - 1) = *((_QWORD *)v52 - 1);
                *(_OWORD *)(v60 - 6) = v61;
                v60 -= 6;
                v52 -= 6;
              }
              while (v52 != v54);
              v54 = (float *)__p;
            }
            v53 = v59 + 6;
            __p = v60;
            v101 = v59 + 6;
            v102 = (float *)&v58[24 * v57];
            if (v54)
              operator delete(v54);
          }
          else
          {
            *v101 = v51;
            v53 = v52 + 6;
            *((_QWORD *)v52 + 1) = v47;
            *((_QWORD *)v52 + 2) = v49;
          }
          v101 = v53;

          if (++v30 == v27)
          {
            v27 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
            if (v27)
              goto LABEL_20;
            goto LABEL_46;
          }
        }
        hws_get_framework_log();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v31, "UUID");
          objc_claimAutoreleasedReturnValue();
          +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.7();
        }
        goto LABEL_61;
      }
LABEL_46:

      NebulaNotification::Processor::Processor((NebulaNotification::Processor *)v95);
      v112 = 0u;
      memset(buf, 0, sizeof(buf));
      NebulaNotification::Processor::process((int **)&__p, (uint64_t)buf);
      v109[0] = CFSTR("notification_status");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", buf[4]);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v62;
      v109[1] = CFSTR("percent_bd_at_least_10");
      LODWORD(v63) = *(_DWORD *)&buf[8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v63);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v93;
      v109[2] = CFSTR("percent_bd_at_least_11");
      LODWORD(v64) = *(_DWORD *)&buf[12];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v110[2] = v65;
      v109[3] = CFSTR("percent_bd_at_least_12");
      LODWORD(v66) = *(_DWORD *)&buf[16];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v110[3] = v67;
      v109[4] = CFSTR("percent_bd_at_least_13");
      LODWORD(v68) = *(_DWORD *)&buf[20];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v110[4] = v69;
      v109[5] = CFSTR("bd_count");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)&buf[24]);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v110[5] = v70;
      v109[6] = CFSTR("bd_median");
      LODWORD(v71) = *(_DWORD *)&buf[28];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v110[6] = v72;
      v109[7] = CFSTR("bd_mean");
      LODWORD(v73) = v112;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v110[7] = v74;
      v109[8] = CFSTR("bd_standard_deviation");
      LODWORD(v75) = DWORD1(v112);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v110[8] = v76;
      v109[9] = CFSTR("bd_maximum");
      LODWORD(v77) = DWORD2(v112);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v110[9] = v78;
      v109[10] = CFSTR("bd_minimum");
      LODWORD(v79) = HIDWORD(v112);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v110[10] = v80;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 11);
      v81 = objc_claimAutoreleasedReturnValue();
      var1 = v90->var1;
      v90->var1 = (id)v81;

      v83 = buf[0];
      v90->var2 = buf[0];
      hws_get_framework_log();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v107 = 67436801;
        v108 = v83;
        _os_log_impl(&dword_23740B000, v84, OS_LOG_TYPE_DEFAULT, "Algs result: %{sensitive}u", v107, 8u);
      }

      if (MGGetBoolAnswer())
        +[BABreathingDisturbanceAnalyzerFileHandler deleteLogsForLiveOnUsers](BABreathingDisturbanceAnalyzerFileHandler, "deleteLogsForLiveOnUsers");
      NebulaNotification::Processor::~Processor((NebulaNotification::Processor *)v95);
LABEL_62:
      if (__p)
      {
        v101 = (float *)__p;
        operator delete(__p);
      }
    }
  }
  else
  {
    hws_get_framework_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      +[BABreathingDisturbanceAnalyzer analyzeSamples:dateInterval:].cold.1((uint64_t)buf, objc_msgSend(obj, "count"), v20);

  }
  return result;
}

+ (void)analyzeSamples:(NSObject *)a3 dateInterval:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134349056;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_23740B000, a2, a3, "Invalid number (%{public}lu) of BD samples, more than expected.", (uint8_t *)a1);
}

+ (void)analyzeSamples:(uint8_t *)buf dateInterval:(os_log_t)log .cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_23740B000, log, OS_LOG_TYPE_FAULT, "Invalid query interval (%{public}@ - %{public}@) with a duration of zero.", buf, 0x16u);

  OUTLINED_FUNCTION_1();
}

+ (void)analyzeSamples:dateInterval:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_23740B000, v3, v4, "Invalid BD sample %{public}@ has NAN.", v5);

  OUTLINED_FUNCTION_1();
}

+ (void)analyzeSamples:dateInterval:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_23740B000, v3, v4, "Invalid BD sample %{public}@, less than minimum.", v5);

  OUTLINED_FUNCTION_1();
}

+ (void)analyzeSamples:dateInterval:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_23740B000, v3, v4, "Invalid BD sample %{public}@, greater than limit.", v5);

  OUTLINED_FUNCTION_1();
}

+ (void)analyzeSamples:dateInterval:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_23740B000, v3, v4, "Invalid BD sample %{public}@ with end date after end of query interval.", v5);

  OUTLINED_FUNCTION_1();
}

+ (void)analyzeSamples:dateInterval:.cold.7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_23740B000, v3, v4, "Invalid BD sample %{public}@ with end date prior to or equal to start of query interval.", v5);

  OUTLINED_FUNCTION_1();
}

@end
