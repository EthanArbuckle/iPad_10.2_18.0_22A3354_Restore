@implementation NSData(NFTransportService)

- (uint64_t)encodeToCBOR
{
  return objc_msgSend(getCBORClass(), "cborWithData:", a1);
}

- (uint64_t)decodeCHRequest
{
  return objc_msgSend(a1, "decodeCHForRequest:", 1);
}

- (id)decodeCHSelect
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  const void **v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v39;
  void *v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(a1, "length") <= 1)
  {
    v4 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      objc_msgSend(a1, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Unexpected response received: %{public}@", v12, ClassName, Name, 61, v11);

    }
    dispatch_get_specific(*v4);
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v14 = object_getClass(a1);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(a1);
    v17 = sel_getName(a2);
    objc_msgSend(a1, "debugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    v42 = v15;
    v43 = 2082;
    v44 = v16;
    v45 = 2082;
    v46 = v17;
    v47 = 1024;
    v48 = 61;
    v49 = 2114;
    v50 = v18;
    v19 = "%c[%{public}s %{public}s]:%i Unexpected response received: %{public}@";
    v20 = v13;
    v21 = OS_LOG_TYPE_ERROR;
LABEL_22:
    _os_log_impl(&dword_19B5EB000, v20, v21, v19, buf, 0x2Cu);

LABEL_23:
    return 0;
  }
  v22 = objc_retainAutorelease(a1);
  v23 = objc_msgSend(v22, "bytes");
  v24 = objc_msgSend(v22, "length") - 2;
  if (*(unsigned __int16 *)(v23 + v24) == (unsigned __int16)SW_STATUS_DATA_NOT_FOUND)
  {
    objc_msgSend(v22, "subdataWithRange:", 0, objc_msgSend(v22, "length") - 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "decodeSelectErrorDictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    return v40;
  }
  else
  {
    if (*(unsigned __int16 *)(v23 + v24) != (unsigned __int16)SW_STATUS_SUCCESS)
    {
      v25 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v26 = NFLogGetLogger();
      if (v26)
      {
        v27 = (void (*)(uint64_t, const char *, ...))v26;
        v28 = object_getClass(v22);
        v29 = class_isMetaClass(v28);
        v30 = object_getClassName(v22);
        v31 = sel_getName(a2);
        objc_msgSend(v22, "debugDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 45;
        if (v29)
          v33 = 43;
        v27(6, "%c[%{public}s %{public}s]:%i SW status error: %{public}@", v33, v30, v31, 73, v32);

      }
      dispatch_get_specific(*v25);
      NFSharedLogGetLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v34 = object_getClass(v22);
      if (class_isMetaClass(v34))
        v35 = 43;
      else
        v35 = 45;
      v36 = object_getClassName(v22);
      v37 = sel_getName(a2);
      objc_msgSend(v22, "debugDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v42 = v35;
      v43 = 2082;
      v44 = v36;
      v45 = 2082;
      v46 = v37;
      v47 = 1024;
      v48 = 73;
      v49 = 2114;
      v50 = v18;
      v19 = "%c[%{public}s %{public}s]:%i SW status error: %{public}@";
      v20 = v13;
      v21 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_22;
    }
    objc_msgSend(v22, "decodeCHForRequest:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)decodeCHForRequest:()NFTransportService
{
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const void **v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  _BOOL4 v32;
  const char *v33;
  uint64_t v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  const void **v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  objc_class *v46;
  int v47;
  void *v48;
  const void **v49;
  uint64_t Logger;
  void (*v51)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v56;
  uint64_t v57;
  objc_class *v58;
  int v59;
  const char *v60;
  const char *v61;
  void *v62;
  const void **v63;
  uint64_t v64;
  void (*v65)(uint64_t, const char *, ...);
  objc_class *v66;
  _BOOL4 v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  const char *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  objc_class *v76;
  int v77;
  const char *v78;
  const char *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  void *v86;
  void *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  const char *v101;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t v107[128];
  _BYTE buf[28];
  __int16 v109;
  int v110;
  __int16 v111;
  const char *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECFF6180)
  {
    *(_OWORD *)buf = xmmword_1E3B51F80;
    *(_QWORD *)&buf[16] = 0;
    qword_1ECFF6180 = _sl_dlopen();
  }
  if (qword_1ECFF6180)
  {
    if (a3)
      v5 = "request";
    else
      v5 = "select";
    objc_msgSend(getCBORClass(), "decodeFromData:", a1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject type](v6, "type") != 5)
    {
      v49 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v51 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        -[NSObject description](v6, "description");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 45;
        if (isMetaClass)
          v57 = 43;
        v51(6, "%c[%{public}s %{public}s]:%i Unexpected %s received: %@", v57, ClassName, Name, 88, v5, v56);

      }
      dispatch_get_specific(*v49);
      NFSharedLogGetLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v58 = object_getClass(a1);
        if (class_isMetaClass(v58))
          v59 = 43;
        else
          v59 = 45;
        v60 = object_getClassName(a1);
        v61 = sel_getName(a2);
        -[NSObject description](v6, "description");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v59;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = v60;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v61;
        v109 = 1024;
        v110 = 88;
        v111 = 2080;
        v112 = v5;
        v113 = 2112;
        v114 = v62;
        _os_log_impl(&dword_19B5EB000, v7, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected %s received: %@", buf, 0x36u);

      }
      v48 = 0;
      goto LABEL_66;
    }
    objc_msgSend(getCBORClass(), "cborWithInteger:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(getCBORClass(), "cborWithInteger:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getCBORClass(), "cborWithInteger:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getCBORClass(), "cborWithInteger:", 3);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject dictionary](v6, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject dictionary](v6, "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject dictionary](v6, "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v9);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject dictionary](v6, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = (void *)v10;
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    v97 = v12;
    objc_msgSend(v12, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v99, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length") && v100)
      {
        v95 = v9;
        v18 = objc_msgSend(v100, "type");

        v19 = v18 == 4;
        v9 = v95;
        if (v19)
        {
          v92 = v8;
          v93 = v7;
          v94 = v6;
          v20 = objc_opt_new();
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          objc_msgSend(v100, "array");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v104;
            v25 = (const void **)MEMORY[0x1E0DE7900];
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v104 != v24)
                  objc_enumerationMutation(v21);
                v27 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
                if (objc_msgSend(v27, "type") == 5)
                {
                  objc_msgSend(v27, "asJSON");
                  v28 = objc_claimAutoreleasedReturnValue();
                  -[NSObject addObject:](v20, "addObject:", v28);
                }
                else
                {
                  dispatch_get_specific(*v25);
                  v29 = NFLogGetLogger();
                  if (v29)
                  {
                    v30 = (void (*)(uint64_t, const char *, ...))v29;
                    v31 = object_getClass(a1);
                    v32 = class_isMetaClass(v31);
                    v33 = object_getClassName(a1);
                    v89 = sel_getName(a2);
                    v34 = 45;
                    if (v32)
                      v34 = 43;
                    v30(6, "%c[%{public}s %{public}s]:%i Not a valid transport service dictionary; skipping",
                      v34,
                      v33,
                      v89,
                      115);
                  }
                  dispatch_get_specific(*v25);
                  NFSharedLogGetLogger();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    v35 = object_getClass(a1);
                    if (class_isMetaClass(v35))
                      v36 = 43;
                    else
                      v36 = 45;
                    v37 = object_getClassName(a1);
                    v38 = sel_getName(a2);
                    *(_DWORD *)buf = 67109890;
                    *(_DWORD *)&buf[4] = v36;
                    *(_WORD *)&buf[8] = 2082;
                    *(_QWORD *)&buf[10] = v37;
                    *(_WORD *)&buf[18] = 2082;
                    *(_QWORD *)&buf[20] = v38;
                    v109 = 1024;
                    v110 = 115;
                    _os_log_impl(&dword_19B5EB000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not a valid transport service dictionary; skipping",
                      buf,
                      0x22u);
                  }
                }

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
            }
            while (v23);
          }

          v48 = (void *)objc_opt_new();
          v82 = v97;
          objc_msgSend(v97, "string");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setVersion:", v85);

          objc_msgSend(v99, "string");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setApplicationLabel:", v86);

          v75 = v20;
          objc_msgSend(v48, "setTransportServiceList:", v20);
          v7 = v93;
          v6 = v94;
          v8 = v92;
          v9 = v95;
          v83 = v98;
          if (!v98)
          {
            v81 = v96;
            goto LABEL_65;
          }
          objc_msgSend(v98, "asJSON");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setUserInfo:", v87);

          v81 = v96;
LABEL_64:
          v83 = v98;
LABEL_65:

LABEL_66:
          goto LABEL_67;
        }
LABEL_54:
        v101 = v5;
        v63 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v64 = NFLogGetLogger();
        if (v64)
        {
          v65 = (void (*)(uint64_t, const char *, ...))v64;
          v66 = object_getClass(a1);
          v67 = class_isMetaClass(v66);
          v68 = v9;
          v69 = object_getClassName(a1);
          v70 = v7;
          v71 = sel_getName(a2);
          -[NSObject description](v6, "description");
          v72 = v8;
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v71;
          v7 = v70;
          v74 = 45;
          if (v67)
            v74 = 43;
          v88 = v69;
          v9 = v68;
          v65(6, "%c[%{public}s %{public}s]:%i Unexpected %s received: %@", v74, v88, v91, 107, v101, v73);

          v8 = v72;
          v63 = (const void **)MEMORY[0x1E0DE7900];
        }
        dispatch_get_specific(*v63);
        NFSharedLogGetLogger();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          v76 = object_getClass(a1);
          if (class_isMetaClass(v76))
            v77 = 43;
          else
            v77 = 45;
          v78 = object_getClassName(a1);
          v79 = sel_getName(a2);
          -[NSObject description](v6, "description");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)&buf[4] = v77;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = v78;
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = v79;
          v109 = 1024;
          v110 = 107;
          v111 = 2080;
          v112 = v101;
          v113 = 2112;
          v114 = v80;
          _os_log_impl(&dword_19B5EB000, v75, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected %s received: %@", buf, 0x36u);

        }
        v48 = 0;
        v81 = v96;
        v82 = v97;
        goto LABEL_64;
      }

    }
    goto LABEL_54;
  }
  v39 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v40 = NFLogGetLogger();
  if (v40)
  {
    v41 = (void (*)(uint64_t, const char *, ...))v40;
    v42 = object_getClass(a1);
    v43 = class_isMetaClass(v42);
    v44 = object_getClassName(a1);
    v90 = sel_getName(a2);
    v45 = 45;
    if (v43)
      v45 = 43;
    v41(3, "%c[%{public}s %{public}s]:%i CBOR library unavailable", v45, v44, v90, 80);
  }
  dispatch_get_specific(*v39);
  NFSharedLogGetLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v46 = object_getClass(a1);
    if (class_isMetaClass(v46))
      v47 = 43;
    else
      v47 = 45;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v47;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = object_getClassName(a1);
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = sel_getName(a2);
    v109 = 1024;
    v110 = 80;
    _os_log_impl(&dword_19B5EB000, v6, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i CBOR library unavailable", buf, 0x22u);
  }
  v48 = 0;
LABEL_67:

  return v48;
}

- (id)decodeSelectErrorDictionary
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *v17;
  _BOOL4 v18;
  const char *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  void *v27;
  const void **v28;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v44;
  const char *v45;
  void *v46;
  const char *sel;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getCBORClass(), "decodeFromData:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 5)
  {
    objc_msgSend(getCBORClass(), "cborWithInteger:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(getCBORClass(), "cborWithInteger:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v10)
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(v7, "numeric");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRetryInMS:", v12);

      objc_msgSend(v10, "numeric");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRetryRandom:", v13);

    }
    else
    {
      sel = a2;
      v28 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v30 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        v46 = v8;
        ClassName = object_getClassName(a1);
        Name = sel_getName(sel);
        objc_msgSend(v4, "description");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = Name;
        v28 = (const void **)MEMORY[0x1E0DE7900];
        v36 = 45;
        if (isMetaClass)
          v36 = 43;
        v44 = ClassName;
        v8 = v46;
        v30(3, "%c[%{public}s %{public}s]:%i Unexpected error dictionary: %@", v36, v44, v45, 164, v35);

      }
      dispatch_get_specific(*v28);
      NFSharedLogGetLogger();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = object_getClass(a1);
        if (class_isMetaClass(v38))
          v39 = 43;
        else
          v39 = 45;
        v40 = object_getClassName(a1);
        v41 = sel_getName(sel);
        objc_msgSend(v4, "description");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        v49 = v39;
        v50 = 2082;
        v51 = v40;
        v52 = 2082;
        v53 = v41;
        v54 = 1024;
        v55 = 164;
        v56 = 2112;
        v57 = v42;
        _os_log_impl(&dword_19B5EB000, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected error dictionary: %@", buf, 0x2Cu);

      }
      v11 = 0;
    }

  }
  else
  {
    v14 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v15 = NFLogGetLogger();
    if (v15)
    {
      v16 = (void (*)(uint64_t, const char *, ...))v15;
      v17 = object_getClass(a1);
      v18 = class_isMetaClass(v17);
      v19 = object_getClassName(a1);
      v20 = sel_getName(a2);
      objc_msgSend(v4, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 45;
      if (v18)
        v22 = 43;
      v16(6, "%c[%{public}s %{public}s]:%i Unexpected response received: %@", v22, v19, v20, 148, v21);

    }
    dispatch_get_specific(*v14);
    NFSharedLogGetLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v23 = object_getClass(a1);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      v25 = object_getClassName(a1);
      v26 = sel_getName(a2);
      objc_msgSend(v4, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v49 = v24;
      v50 = 2082;
      v51 = v25;
      v52 = 2082;
      v53 = v26;
      v54 = 1024;
      v55 = 148;
      v56 = 2112;
      v57 = v27;
      _os_log_impl(&dword_19B5EB000, v5, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected response received: %@", buf, 0x2Cu);

    }
    v11 = 0;
  }

  return v11;
}

- (id)decodeCHRequestRetry
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  void *v29;
  const void **v30;
  uint64_t Logger;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  void *v36;
  void *v37;
  const char *Name;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  void *v46;
  void *v47;
  const char *v49;
  const char *v50;
  void *v51;
  const char *sel;
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getCBORClass(), "decodeFromData:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 5)
  {
    objc_msgSend(getCBORClass(), "cborWithInteger:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(getCBORClass(), "cborWithInteger:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10
      && (objc_msgSend(v7, "string"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "length"),
          v11,
          v12))
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v10, "numeric");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRetryRandom:", v14);

      objc_msgSend(v7, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setVersion:", v15);

    }
    else
    {
      sel = a2;
      v30 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v32 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        v51 = v7;
        ClassName = object_getClassName(a1);
        v36 = v10;
        v37 = v8;
        Name = sel_getName(sel);
        objc_msgSend(v4, "description");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = Name;
        v8 = v37;
        v10 = v36;
        v30 = (const void **)MEMORY[0x1E0DE7900];
        v40 = 45;
        if (isMetaClass)
          v40 = 43;
        v49 = ClassName;
        v7 = v51;
        v32(3, "%c[%{public}s %{public}s]:%i Unexpected retry request: %@", v40, v49, v50, 185, v39);

      }
      dispatch_get_specific(*v30);
      NFSharedLogGetLogger();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = object_getClass(a1);
        if (class_isMetaClass(v42))
          v43 = 43;
        else
          v43 = 45;
        v44 = object_getClassName(a1);
        v45 = sel_getName(sel);
        objc_msgSend(v4, "description");
        v46 = v8;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        v54 = v43;
        v55 = 2082;
        v56 = v44;
        v57 = 2082;
        v58 = v45;
        v59 = 1024;
        v60 = 185;
        v61 = 2112;
        v62 = v47;
        _os_log_impl(&dword_19B5EB000, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected retry request: %@", buf, 0x2Cu);

        v8 = v46;
      }

      v13 = 0;
    }

  }
  else
  {
    v16 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v17 = NFLogGetLogger();
    if (v17)
    {
      v18 = (void (*)(uint64_t, const char *, ...))v17;
      v19 = object_getClass(a1);
      v20 = class_isMetaClass(v19);
      v21 = object_getClassName(a1);
      v22 = sel_getName(a2);
      objc_msgSend(v4, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 45;
      if (v20)
        v24 = 43;
      v18(6, "%c[%{public}s %{public}s]:%i Unexpected response received: %@", v24, v21, v22, 173, v23);

    }
    dispatch_get_specific(*v16);
    NFSharedLogGetLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v25 = object_getClass(a1);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(a1);
      v28 = sel_getName(a2);
      objc_msgSend(v4, "description");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v54 = v26;
      v55 = 2082;
      v56 = v27;
      v57 = 2082;
      v58 = v28;
      v59 = 1024;
      v60 = 173;
      v61 = 2112;
      v62 = v29;
      _os_log_impl(&dword_19B5EB000, v5, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unexpected response received: %@", buf, 0x2Cu);

    }
    v13 = 0;
  }

  return v13;
}

@end
