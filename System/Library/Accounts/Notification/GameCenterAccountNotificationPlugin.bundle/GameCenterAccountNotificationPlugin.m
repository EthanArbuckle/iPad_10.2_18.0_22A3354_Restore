uint64_t GKOSLoggers()
{
  return MEMORY[0x24BE3A0D8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

bject *v38;
  void *v39;
  NSObject **v40;
  NSObject *v41;
  id v42;
  const char *v43;
  NSObject **v44;
  id v45;
  NSObject **v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v8 = *(_QWORD *)&a4;
  v57 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if ((_DWORD)v8 == 3)
    v13 = v11;
  else
    v13 = v9;
  v14 = v13;
  objc_msgSend(v14, "accountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (NSObject **)MEMORY[0x24BE3A308];
  v18 = *MEMORY[0x24BE3A308];
  if (!*MEMORY[0x24BE3A308])
  {
    v19 = (id)GKOSLoggers();
    v18 = *v17;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)MEMORY[0x24BDD16E0];
    v21 = v18;
    objc_msgSend(v20, "numberWithUnsignedInt:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v50 = v9;
    v51 = 2112;
    v52 = v22;
    v53 = 2112;
    v54 = v12;
    v55 = 2112;
    v56 = v10;
    _os_log_impl(&dword_230F1E000, v21, OS_LOG_TYPE_INFO, "Plugin account: %@ - changeType: %@ - oldAccount: %@ - store: %@", buf, 0x2Au);

  }
  v23 = *v17;
  if (!*v17)
  {
    v24 = (id)GKOSLoggers();
    v23 = *v17;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v25 = v23;
    objc_msgSend(v9, "accountType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v48 = v16;
    v27 = v9;
    v28 = v14;
    v29 = v10;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountType");
    v31 = v8;
    v32 = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v50 = v30;
    v51 = 2112;
    v52 = v34;
    _os_log_impl(&dword_230F1E000, v25, OS_LOG_TYPE_INFO, "Plugin account identifier: %@ - oldAccount identifier: %@", buf, 0x16u);

    v12 = v32;
    v8 = v31;
    v17 = (NSObject **)MEMORY[0x24BE3A308];

    v10 = v29;
    v14 = v28;
    v9 = v27;
    v16 = v48;

  }
  v35 = *v17;
  if (!*v17)
  {
    v36 = (id)GKOSLoggers();
    v35 = *v17;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v37 = (void *)MEMORY[0x24BDD16E0];
    v38 = v35;
    objc_msgSend(v37, "numberWithUnsignedInt:", v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v50 = v39;
    v51 = 2112;
    v52 = v14;
    v53 = 2112;
    v54 = v10;
    _os_log_impl(&dword_230F1E000, v38, OS_LOG_TYPE_INFO, "Plugin (didChangeWithType: %@) - %@ - %@", buf, 0x20u);

  }
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB4060]))
  {
    switch((_DWORD)v8)
    {
      case 2:
        v44 = v17;
        v41 = *v17;
        if (!v41)
        {
          v45 = (id)GKOSLoggers();
          v41 = *v44;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v14;
          v43 = "Plugin (didChangeWithType): Game Center account was modified: %@";
          goto LABEL_32;
        }
        break;
      case 1:
        v40 = v17;
        v41 = *v17;
        if (!v41)
        {
          v42 = (id)GKOSLoggers();
          v41 = *v40;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v14;
          v43 = "Plugin (didChangeWithType): New Game Center account was added: %@";
LABEL_32:
          _os_log_impl(&dword_230F1E000, v41, OS_LOG_TYPE_INFO, v43, buf, 0xCu);
        }
        break;
      case 3:
        v46 = v17;
        v41 = *v17;
        if (!v41)
        {
          v47 = (id)GKOSLoggers();
          v41 = *v46;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v12;
          v43 = "Plugin (didChangeWithType): Game Center account was deleted: %@";
          goto LABEL_32;
        }
        break;
    }
  }

}

@end
