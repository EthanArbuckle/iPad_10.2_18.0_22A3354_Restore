@implementation MRProtocolMessageLogger

- (MRProtocolMessageLogger)init
{
  MRProtocolMessageLogger *v2;
  MRProtocolMessageLogger *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRProtocolMessageLogger;
  v2 = -[MRProtocolMessageLogger init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MRProtocolMessageLogger setShouldLog:](v2, "setShouldLog:", 1);
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProtocolMessageLogger setShouldVerboselyLog:](v3, "setShouldVerboselyLog:", objc_msgSend(v4, "verboseProtocolMessageLogging"));

  }
  return v3;
}

+ (id)sharedLogger
{
  if (sharedLogger___once != -1)
    dispatch_once(&sharedLogger___once, &__block_literal_global_114);
  return (id)sharedLogger___sharedContext;
}

void __39__MRProtocolMessageLogger_sharedLogger__block_invoke()
{
  MRProtocolMessageLogger *v0;
  void *v1;

  v0 = objc_alloc_init(MRProtocolMessageLogger);
  v1 = (void *)sharedLogger___sharedContext;
  sharedLogger___sharedContext = (uint64_t)v0;

}

- (void)logMessage:(id)a3 client:(id)a4 protocolMessage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  MRProtocolMessageLogger *v57;
  NSObject *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  NSObject *v64;
  __int16 v65;
  NSObject *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v8 = a4;
  v9 = a5;
  if (-[MRProtocolMessageLogger shouldLog](self, "shouldLog"))
  {
    v74[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "messages");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v60;
      v56 = v12;
      v57 = self;
      v55 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v60 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if (objc_msgSend(v17, "shouldLog"))
          {
            objc_msgSend(v8, "label");
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = (void *)v18;
              v20 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v8, "label");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "initWithFormat:", CFSTR("[%@] "), v21);

              if (v22)
              {
                if (-[MRProtocolMessageLogger shouldVerboselyLog](self, "shouldVerboselyLog"))
                {
                  _MRLogForCategory(1uLL);
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v8, "deviceInfo");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "deviceUID");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = (uint64_t)v24;
                    if (!v24)
                    {
                      objc_msgSend(v8, "deviceInfo");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "identifier");
                      v25 = objc_claimAutoreleasedReturnValue();
                      v47 = (void *)v25;
                    }
                    objc_msgSend(v8, "deviceInfo");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "name");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "description");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v64 = v22;
                    v65 = 2114;
                    v66 = v58;
                    v67 = 2114;
                    v68 = v25;
                    v69 = 2112;
                    v70 = v27;
                    v71 = 2114;
                    v72 = v28;
                    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@ <%{public}@-%@>]: %{public}@", buf, 0x34u);

                    if (!v24)
                    {

                      v29 = v49;
                      goto LABEL_36;
                    }
                    goto LABEL_37;
                  }
                }
                else
                {
                  _MRLogForCategory(0);
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v8, "deviceInfo");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "deviceUID");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = (uint64_t)v24;
                    if (!v24)
                    {
                      objc_msgSend(v8, "deviceInfo");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "identifier");
                      v41 = objc_claimAutoreleasedReturnValue();
                      v46 = (void *)v41;
                    }
                    objc_msgSend(v8, "deviceInfo");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "name");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "description");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v64 = v22;
                    v65 = 2114;
                    v66 = v58;
                    v67 = 2114;
                    v68 = v41;
                    v69 = 2112;
                    v70 = v43;
                    v71 = 2114;
                    v72 = v44;
                    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@ <%{public}@-%@>]: %{public}@", buf, 0x34u);

                    if (!v24)
                    {

                      v29 = v48;
LABEL_36:

                    }
LABEL_37:

                    v12 = v56;
                    self = v57;
                    v15 = v55;
                  }
                }

LABEL_39:
                continue;
              }
            }
            if (self->_shouldVerboselyLog)
            {
              _MRLogForCategory(1uLL);
              v22 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                goto LABEL_39;
              objc_msgSend(v8, "deviceInfo");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "deviceUID");
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = v31;
              if (!v31)
              {
                objc_msgSend(v8, "deviceInfo");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "identifier");
                v52 = objc_claimAutoreleasedReturnValue();
                v32 = v52;
              }
              objc_msgSend(v8, "deviceInfo");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "description");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v64 = v58;
              v65 = 2114;
              v66 = v32;
              v67 = 2112;
              v68 = (uint64_t)v34;
              v69 = 2114;
              v70 = v35;
              _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "[%@ <%{public}@-%@>]: %{public}@", buf, 0x2Au);

              if (!v31)
              {

                v36 = v53;
                goto LABEL_29;
              }
            }
            else
            {
              _MRLogForCategory(0);
              v22 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                goto LABEL_39;
              objc_msgSend(v8, "deviceInfo");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "deviceUID");
              v31 = objc_claimAutoreleasedReturnValue();
              v37 = v31;
              if (!v31)
              {
                objc_msgSend(v8, "deviceInfo");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "identifier");
                v50 = objc_claimAutoreleasedReturnValue();
                v37 = v50;
              }
              objc_msgSend(v8, "deviceInfo");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "name");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "description");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v64 = v58;
              v65 = 2114;
              v66 = v37;
              v67 = 2112;
              v68 = (uint64_t)v39;
              v69 = 2114;
              v70 = v40;
              _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "[%@ <%{public}@-%@>]: %{public}@", buf, 0x2Au);

              if (!v31)
              {

                v36 = v51;
LABEL_29:

              }
            }

            v12 = v56;
            self = v57;
            v15 = v55;
            goto LABEL_39;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
      }
      while (v14);
    }

    v9 = v45;
  }

}

- (BOOL)shouldLog
{
  return self->_shouldLog;
}

- (void)setShouldLog:(BOOL)a3
{
  self->_shouldLog = a3;
}

- (BOOL)shouldVerboselyLog
{
  return self->_shouldVerboselyLog;
}

- (void)setShouldVerboselyLog:(BOOL)a3
{
  self->_shouldVerboselyLog = a3;
}

@end
