uint64_t KRExperimentsInit()
{
  return KRExperimentsUpdateExperimentState(1u, 1);
}

uint64_t KRExperimentsUpdateExperimentState(unsigned int a1, int a2)
{
  os_log_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  int v36;
  id v37;
  const char *v38;
  int v39;
  id v40;
  char *v41;
  size_t v42;
  uint64_t v43;
  NSObject *v44;
  int *v45;
  char *v46;
  NSObject *v47;
  NSObject *v48;
  int *v49;
  char *v50;
  id v51;
  const char *v52;
  char *v53;
  size_t v54;
  id v55;
  const char *v56;
  char *v57;
  size_t v58;
  id v60;
  int v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v68;
  id v69;
  id v70;
  os_log_t oslog;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  int v78;
  int v79;
  uint64_t v80;
  uint8_t buf[4];
  id v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  int v86;
  _BYTE v87[128];
  char v88[16];
  char v89[16];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.coreos.sysperf.KRExperiments", "KRExperiments");
  objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", 241);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  v76 = 0;
  v77 = 0;
  v4 = objc_msgSend(v3, "trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:", CFSTR("FREEZER_POLICIES"), &v77, &v78, &v76);
  v64 = v77;
  v65 = v76;
  if ((v4 & 1) == 0)
    KRExperimentsUpdateExperimentState_cold_1();
  oslog = v2;
  v5 = v3;
  v69 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v68 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "factorLevelsWithNamespaceName:", CFSTR("FREEZER_POLICIES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    for (i = 0; i < objc_msgSend(v6, "count"); ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "hasFactor") & 1) == 0)
        KRExperimentsUpdateExperimentState_cold_1();
      if ((objc_msgSend(v8, "hasLevel") & 1) == 0)
        KRExperimentsUpdateExperimentState_cold_1();
      objc_msgSend(v8, "factor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v11, "count"))
      {
        v12 = oslog;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          KRExperimentsUpdateExperimentState_cold_4((uint64_t)v88, (uint64_t)v9);
        goto LABEL_17;
      }
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("meta")))
      {
        objc_msgSend(v8, "level");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v69;
      }
      else
      {
        if (!-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("sysctl")))
        {
          v15 = oslog;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            KRExperimentsUpdateExperimentState_cold_4((uint64_t)v89, (uint64_t)v9);
          goto LABEL_16;
        }
        objc_msgSend(v8, "level");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v68;
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v14);
LABEL_16:

LABEL_17:
    }
  }
  v17 = objc_retainAutorelease(v69);
  v18 = objc_retainAutorelease(v68);

  v19 = v17;
  v20 = v18;
  objc_msgSend(v19, "objectForKey:", CFSTR("component"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
    goto LABEL_23;
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("freezer")) & 1) == 0)
  {
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("stackshot")) & 1) == 0)
      objc_msgSend(v23, "isEqualToString:", CFSTR("libmalloc"));
LABEL_23:
    v24 = 1;
    goto LABEL_24;
  }
  v24 = 0;
LABEL_24:

  objc_msgSend(v5, "experimentIdentifiersWithNamespaceName:", CFSTR("FREEZER_POLICIES"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v24 | a2 | a1;
  if ((_DWORD)v26 == 1 && v25)
  {
    v61 = v24;
    v62 = v20;
    v63 = v19;
    v60 = v5;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v27 = v20;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    if (v28)
    {
      v29 = v28;
      v70 = *(id *)v73;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(id *)v73 != v70)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
          objc_msgSend(v27, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = oslog;
          v34 = v31;
          v35 = v32;
          v36 = objc_msgSend(v35, "levelOneOfCase");
          v80 = 0;
          v79 = 0;
          v37 = objc_retainAutorelease(v34);
          v38 = (const char *)objc_msgSend(v37, "cStringUsingEncoding:", 1);
          switch(v36)
          {
            case 13:
              v43 = objc_msgSend(v35, "longValue");
              v80 = v43;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v82 = v37;
                v83 = 2048;
                v84 = v43;
                _os_log_impl(&dword_216884000, v33, OS_LOG_TYPE_DEFAULT, "Setting %@ to %llu", buf, 0x16u);
              }
              v40 = 0;
              v41 = (char *)&v80;
              v42 = 8;
              break;
            case 11:
              objc_msgSend(v35, "stringValue");
              v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v41 = (char *)objc_msgSend(v40, "cStringUsingEncoding:", 1);
              v42 = strlen(v41);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v82 = v37;
                v83 = 2080;
                v84 = (uint64_t)v41;
                _os_log_impl(&dword_216884000, v33, OS_LOG_TYPE_DEFAULT, "Setting %@ to %s", buf, 0x16u);
              }
              break;
            case 10:
              v39 = objc_msgSend(v35, "BOOLeanValue");
              v79 = v39;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v82 = v37;
                v83 = 1024;
                LODWORD(v84) = v39;
                _os_log_impl(&dword_216884000, v33, OS_LOG_TYPE_DEFAULT, "Setting %@ to %u", buf, 0x12u);
              }
              v40 = 0;
              v41 = (char *)&v79;
              v42 = 4;
              break;
            default:
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v82) = v36;
                _os_log_error_impl(&dword_216884000, v33, OS_LOG_TYPE_ERROR, "Attempt to set unsupported factor type: %d", buf, 8u);
              }
              v40 = 0;
              v42 = 0;
              v41 = 0;
              break;
          }
          if (sysctlbyname(v38, 0, 0, v41, v42))
          {
            v44 = v33;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = __error();
              v46 = strerror(*v45);
              *(_DWORD *)buf = 136315394;
              v82 = (id)v38;
              v83 = 2080;
              v84 = (uint64_t)v46;
              _os_log_error_impl(&dword_216884000, v44, OS_LOG_TYPE_ERROR, "Unable to set %s: %s", buf, 0x16u);
            }

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      }
      while (v29);
    }

    v26 = 1;
    v20 = v62;
    v19 = v63;
    if (((a2 ^ 1 | a1 | v61) & 1) == 0)
    {
      v47 = oslog;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216884000, v47, OS_LOG_TYPE_DEFAULT, "Resetting freezer state to enroll in an experiment. All frozen processes will be killed.", buf, 2u);
      }
      if (memorystatus_control())
      {
        v48 = v47;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = __error();
          v50 = strerror(*v49);
          *(_DWORD *)buf = 136315138;
          v82 = v50;
          _os_log_impl(&dword_216884000, v48, OS_LOG_TYPE_DEFAULT, "Error while trying to reset freezer state: %s", buf, 0xCu);
        }

      }
      else if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216884000, v47, OS_LOG_TYPE_DEFAULT, "Freezer state reset.", buf, 2u);
      }

    }
    v51 = objc_retainAutorelease(v65);
    v52 = (const char *)objc_msgSend(v51, "UTF8String");
    if (v52)
    {
      v53 = (char *)v52;
      v54 = strlen(v52);
      if (sysctlbyname("kern.trial_treatment_id", 0, 0, v53, v54))
        KRExperimentsUpdateExperimentState_cold_1();
    }
    v55 = objc_retainAutorelease(v64);
    v56 = (const char *)objc_msgSend(v55, "UTF8String");
    v5 = v60;
    if (v56)
    {
      v57 = (char *)v56;
      v58 = strlen(v56);
      if (sysctlbyname("kern.trial_experiment_id", 0, 0, v57, v58))
        KRExperimentsUpdateExperimentState_cold_1();
    }
    if (sysctlbyname("kern.trial_deployment_id", 0, 0, &v78, 4uLL))
      KRExperimentsUpdateExperimentState_cold_1();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v82 = v51;
      v83 = 2112;
      v84 = (uint64_t)v55;
      v85 = 1024;
      v86 = v78;
      _os_log_impl(&dword_216884000, oslog, OS_LOG_TYPE_DEFAULT, "Set trial treatment information. %@ %@ %d", buf, 0x1Cu);
    }
  }

  return v26;
}

uint64_t KRExperimentsHandleUpdate(int a1)
{
  return KRExperimentsUpdateExperimentState(0, a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2)
{
  return a2;
}

void KRExperimentsUpdateExperimentState_cold_1()
{
  OUTLINED_FUNCTION_0();
  _os_crash();
  __break(1u);
}

void KRExperimentsUpdateExperimentState_cold_4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2(a1, a2), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_1(&dword_216884000, v5, v6, "Skipping unknown factor: %@");

  OUTLINED_FUNCTION_3();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x24BDAEEA0]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

