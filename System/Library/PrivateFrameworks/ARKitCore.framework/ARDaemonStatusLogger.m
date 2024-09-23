@implementation ARDaemonStatusLogger

- (void)logStatusUpdateWithDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5
{
  -[ARDaemonStatusLogger _logOrGenerateString:fromDictionary:forServerObject:andProcessName:](self, "_logOrGenerateString:fromDictionary:forServerObject:andProcessName:", 0, a3, a4, a5);
}

- (id)generateStringFromStatusDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x1E0CB37A0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  -[ARDaemonStatusLogger _logOrGenerateString:fromDictionary:forServerObject:andProcessName:](self, "_logOrGenerateString:fromDictionary:forServerObject:andProcessName:", v12, v11, v10, v9);

  return v12;
}

- (void)_logOrGenerateString:(id)a3 fromDictionary:(id)a4 forServerObject:(id)a5 andProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _ARLogGeneral_41();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v10)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v42 = v12;
      _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] START", buf, 0xCu);
    }

    _ARLogGeneral_41();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v42 = v12;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] {", buf, 0xCu);
    }
    goto LABEL_6;
  }
  *(_DWORD *)buf = 134349056;
  v42 = v12;
  LODWORD(v39) = 12;
  v20 = (void *)_os_log_send_and_compose_impl();

  v21 = 0x1E0CB3000uLL;
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] START", buf, v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "numberOfMatchesInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0x1E0CB3000;
    }
    else
    {

      v21 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "appendString:", v24);
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
    free(v20);

  }
  _ARLogGeneral_41();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349056;
  v42 = v12;
  LODWORD(v39) = 12;
  v38 = buf;
  v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    objc_msgSend(*(id *)(v21 + 2368), "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] {", buf, v39);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "numberOfMatchesInString:options:range:", v31, 0, 0, objc_msgSend(v31, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v31);
      v33 = v31;
      v16 = objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(*(id *)(v21 + 2368), "stringWithCString:encoding:", v30, 4);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "appendString:", v16);
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
    free(v30);
LABEL_6:

  }
  -[ARDaemonStatusLogger _logProcessInformationFromDictionary:forServerObject:andProcessName:generatedTestString:](self, "_logProcessInformationFromDictionary:forServerObject:andProcessName:generatedTestString:", v11, v12, v13, v10, v38, v39);
  -[ARDaemonStatusLogger _logSystemInformationFromDictionary:forServerObject:generatedTestString:](self, "_logSystemInformationFromDictionary:forServerObject:generatedTestString:", v11, v12, v10);
  _ARLogGeneral_41();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v10)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v42 = v12;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] }", buf, 0xCu);
    }

    _ARLogGeneral_41();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v42 = v12;
      _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] END", buf, 0xCu);
    }
    goto LABEL_12;
  }
  *(_DWORD *)buf = 134349056;
  v42 = v12;
  LODWORD(v40) = 12;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] }", buf, v40);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "numberOfMatchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "appendString:", v28);
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
    free(v25);

  }
  _ARLogGeneral_41();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349056;
  v42 = v12;
  LODWORD(v40) = 12;
  v35 = (void *)_os_log_send_and_compose_impl();

  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] END", buf, v40);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "numberOfMatchesInString:options:range:", v36, 0, 0, objc_msgSend(v36, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v36);
      v19 = objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v35, 4);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "appendString:", v19);
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
    free(v35);
LABEL_12:

  }
}

- (void)_logProcessInformationFromDictionary:(id)a3 forServerObject:(id)a4 andProcessName:(id)a5 generatedTestString:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _ARLogGeneral_41();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("pid"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v63 = v10;
      v64 = 2114;
      v65 = v11;
      v66 = 2114;
      v67 = v16;
      _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@\": {\"pid\": %{public}@},", buf, 0x20u);

    }
    _ARLogGeneral_41();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_spawn_time"), v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v63 = v10;
      v64 = 2114;
      v65 = v11;
      v66 = 2114;
      v67 = v19;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_spawn_time\": \"%{public}@\",", buf, 0x20u);

    }
    _ARLogGeneral_41();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_up_time"), v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v63 = v10;
      v64 = 2114;
      v65 = v11;
      v66 = 2114;
      v67 = v22;
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time\": \"%{public}@\",", buf, 0x20u);

    }
    _ARLogGeneral_41();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_up_time_including_sleep"), v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v63 = v10;
      v64 = 2114;
      v65 = v11;
      v66 = 2114;
      v67 = v25;
      _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time_including_sleep\": \"%{public}@\",", buf, 0x20u);

    }
    _ARLogGeneral_41();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_up_time_including_sleep_and_drift_correction"), v11);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v63 = v10;
      v64 = 2114;
      v65 = v11;
      v66 = 2114;
      v67 = v28;
      _os_log_impl(&dword_1B3A68000, v26, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time_including_sleep_and_drift_correction\": \"%{public}@\",", buf, 0x20u);

    }
    goto LABEL_12;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("pid"));
  *(_DWORD *)buf = 134349570;
  v63 = v10;
  v64 = 2114;
  v65 = v11;
  v66 = 2114;
  v67 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = 32;
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@\": {\"pid\": %{public}@},", buf, v61);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "numberOfMatchesInString:options:range:", v30, 0, 0, objc_msgSend(v30, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "appendString:", v32);
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    free(v29);

  }
  _ARLogGeneral_41();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_spawn_time"), v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349570;
  v63 = v10;
  v64 = 2114;
  v65 = v11;
  v66 = 2114;
  v67 = v35;
  LODWORD(v61) = 32;
  v36 = (void *)_os_log_send_and_compose_impl();

  if (v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_spawn_time\": \"%{public}@\",", buf, v61);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "numberOfMatchesInString:options:range:", v37, 0, 0, objc_msgSend(v37, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v36, 4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "appendString:", v39);
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    free(v36);

  }
  _ARLogGeneral_41();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_up_time"), v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349570;
  v63 = v10;
  v64 = 2114;
  v65 = v11;
  v66 = 2114;
  v67 = v42;
  LODWORD(v61) = 32;
  v43 = (void *)_os_log_send_and_compose_impl();

  if (v43)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time\": \"%{public}@\",", buf, v61);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "numberOfMatchesInString:options:range:", v44, 0, 0, objc_msgSend(v44, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "appendString:", v46);
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    free(v43);

  }
  _ARLogGeneral_41();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_up_time_including_sleep"), v11);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349570;
  v63 = v10;
  v64 = 2114;
  v65 = v11;
  v66 = 2114;
  v67 = v49;
  LODWORD(v61) = 32;
  v50 = (void *)_os_log_send_and_compose_impl();

  if (v50)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time_including_sleep\": \"%{public}@\",", buf, v61);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "numberOfMatchesInString:options:range:", v51, 0, 0, objc_msgSend(v51, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v50, 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "appendString:", v53);
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    free(v50);

  }
  _ARLogGeneral_41();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_up_time_including_sleep_and_drift_correction"), v11);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349570;
  v63 = v10;
  v64 = 2114;
  v65 = v11;
  v66 = 2114;
  v67 = v56;
  LODWORD(v61) = 32;
  v57 = (void *)_os_log_send_and_compose_impl();

  if (v57)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"%{public}@_up_time_including_sleep_and_drift_correction\": \"%{public}@\",", buf, v61);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "numberOfMatchesInString:options:range:", v58, 0, 0, objc_msgSend(v58, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v58);
      v60 = v58;
      v26 = objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v57, 4);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "appendString:", v26);
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    free(v57);
LABEL_12:

  }
}

- (void)_logSystemInformationFromDictionary:(id)a3 forServerObject:(id)a4 generatedTestString:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _ARLogGeneral_41();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("system_boot_time"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v44 = v8;
      v45 = 2114;
      v46 = v12;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"system_boot_time\": \"%{public}@\",", buf, 0x16u);

    }
    _ARLogGeneral_41();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("system_up_time"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v44 = v8;
      v45 = 2114;
      v46 = v14;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time\": \"%{public}@\",", buf, 0x16u);

    }
    _ARLogGeneral_41();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("system_up_time_including_sleep"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v44 = v8;
      v45 = 2114;
      v46 = v16;
      _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time_including_sleep\": \"%{public}@\",", buf, 0x16u);

    }
    _ARLogGeneral_41();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("system_up_time_including_sleep_and_drift_correction"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v44 = v8;
      v45 = 2114;
      v46 = v18;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time_including_sleep_and_drift_correction\": \"%{public}@\",", buf, 0x16u);

    }
    goto LABEL_10;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("system_boot_time"));
  *(_DWORD *)buf = 134349314;
  v44 = v8;
  v45 = 2114;
  v46 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = 22;
  v19 = (void *)_os_log_send_and_compose_impl();

  v20 = 0x1E0CB3000uLL;
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"system_boot_time\": \"%{public}@\",", buf, v42);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "numberOfMatchesInString:options:range:", v21, 0, 0, objc_msgSend(v21, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0x1E0CB3000;
    }
    else
    {

      v20 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "appendString:", v23);
    objc_msgSend(v9, "appendString:", CFSTR("\n"));
    free(v19);

  }
  _ARLogGeneral_41();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("system_up_time"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349314;
  v44 = v8;
  v45 = 2114;
  v46 = v25;
  LODWORD(v42) = 22;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    objc_msgSend(*(id *)(v20 + 2368), "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time\": \"%{public}@\",", buf, v42);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "numberOfMatchesInString:options:range:", v27, 0, 0, objc_msgSend(v27, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0x1E0CB3000;
    }
    else
    {

      v20 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "appendString:", v29);
    objc_msgSend(v9, "appendString:", CFSTR("\n"));
    free(v26);

  }
  _ARLogGeneral_41();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("system_up_time_including_sleep"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349314;
  v44 = v8;
  v45 = 2114;
  v46 = v31;
  LODWORD(v42) = 22;
  v32 = (void *)_os_log_send_and_compose_impl();

  if (v32)
  {
    objc_msgSend(*(id *)(v20 + 2368), "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time_including_sleep\": \"%{public}@\",", buf, v42);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "numberOfMatchesInString:options:range:", v33, 0, 0, objc_msgSend(v33, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0x1E0CB3000;
    }
    else
    {

      v20 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v32, 4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "appendString:", v35);
    objc_msgSend(v9, "appendString:", CFSTR("\n"));
    free(v32);

  }
  _ARLogGeneral_41();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("system_up_time_including_sleep_and_drift_correction"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 134349314;
  v44 = v8;
  v45 = 2114;
  v46 = v37;
  LODWORD(v42) = 22;
  v38 = (void *)_os_log_send_and_compose_impl();

  if (v38)
  {
    objc_msgSend(*(id *)(v20 + 2368), "stringWithUTF8String:", "ARServer <%{public}p>: Status [UPDATE] \t\"system_up_time_including_sleep_and_drift_correction\": \"%{public}@\",", buf, v42);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("%[^\\{]"), 1, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "numberOfMatchesInString:options:range:", v39, 0, 0, objc_msgSend(v39, "length")))
    {
      objc_msgSend(CFSTR("Privacy annotation missing:\n\t"), "stringByAppendingString:", v39);
      v41 = v39;
      v17 = objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(*(id *)(v20 + 2368), "stringWithCString:encoding:", v38, 4);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "appendString:", v17);
    objc_msgSend(v9, "appendString:", CFSTR("\n"));
    free(v38);
LABEL_10:

  }
}

@end
