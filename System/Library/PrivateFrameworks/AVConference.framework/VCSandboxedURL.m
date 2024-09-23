@implementation VCSandboxedURL

- (const)extensionClass
{
  int accessType;
  const char *result;
  const char **v5;

  accessType = self->_accessType;
  if (accessType == 2)
  {
    v5 = (const char **)MEMORY[0x1E0C80008];
    return *v5;
  }
  if (accessType == 1)
  {
    v5 = (const char **)MEMORY[0x1E0C80000];
    return *v5;
  }
  if (self->_accessType)
    return 0;
  result = 0;
  self->_tokenConsumed = 1;
  return result;
}

- (BOOL)issueSandboxExtensionForPath:(id)a3
{
  char *v5;
  uint64_t v6;
  NSString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *urlToken;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  NSString *v17;
  BOOL v18;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = -[VCSandboxedURL extensionClass](self, "extensionClass");
  if (!v5)
    goto LABEL_15;
  objc_msgSend(a3, "UTF8String");
  v6 = sandbox_extension_issue_file();
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSandboxedURL issueSandboxExtensionForPath:].cold.1();
    }
    v5 = 0;
    goto LABEL_24;
  }
  v5 = (char *)v6;
  v7 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6);
  self->_urlToken = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSandboxedURL issueSandboxExtensionForPath:].cold.2(v20);
    }
LABEL_24:
    v18 = 0;
    goto LABEL_16;
  }
  if ((VCSandboxedURL *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_15;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    urlToken = self->_urlToken;
    v21 = 136316162;
    v22 = v9;
    v23 = 2080;
    v24 = "-[VCSandboxedURL issueSandboxExtensionForPath:]";
    v25 = 1024;
    v26 = 64;
    v27 = 2112;
    v28 = (const __CFString *)urlToken;
    v29 = 2112;
    v30 = a3;
    v12 = " [%s] %s:%d Successfully issued token=%@ for path=%@";
    v13 = v10;
    v14 = 48;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSandboxedURL performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_15;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v17 = self->_urlToken;
    v21 = 136316674;
    v22 = v15;
    v23 = 2080;
    v24 = "-[VCSandboxedURL issueSandboxExtensionForPath:]";
    v25 = 1024;
    v26 = 64;
    v27 = 2112;
    v28 = v8;
    v29 = 2048;
    v30 = self;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = a3;
    v12 = " [%s] %s:%d %@(%p) Successfully issued token=%@ for path=%@";
    v13 = v16;
    v14 = 68;
  }
  _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, v14);
LABEL_15:
  v18 = 1;
LABEL_16:
  free(v5);
  return v18;
}

- (VCSandboxedURL)initWithURL:(id)a3 accessType:(unsigned __int8)a4
{
  VCSandboxedURL *v4;
  uint64_t v6;
  VCSandboxedURL *v7;
  char *v8;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  char *__lasts;
  char *__str;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v4 = self;
  v30 = *MEMORY[0x1E0C80C00];
  self->_urlTokenHandle = -1;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSandboxedURL initWithURL:accessType:].cold.1(v12);
    }
    goto LABEL_23;
  }
  if (a4 >= 3u)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSandboxedURL initWithURL:accessType:].cold.2(v13, a4, v14);
    }
    goto LABEL_23;
  }
  v6 = objc_msgSend(a3, "path");
  v19.receiver = v4;
  v19.super_class = (Class)VCSandboxedURL;
  v7 = (VCSandboxedURL *)-[VCSandboxedURL initFileURLWithPath:](&v19, sel_initFileURLWithPath_, v6);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSandboxedURL initWithURL:accessType:].cold.3(v15);
    }
    v4 = 0;
    goto LABEL_23;
  }
  v4 = v7;
  v7->_accessType = a4;
  if (!-[VCSandboxedURL issueSandboxExtensionForPath:](v7, "issueSandboxExtensionForPath:", v6))
  {
LABEL_23:

    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    asprintf(&__str, "Issued token for instance=%s", (const char *)objc_msgSend(-[VCSandboxedURL description](v4, "description"), "UTF8String"));
    if (__str)
    {
      __lasts = 0;
      v8 = strtok_r(__str, "\n", &__lasts);
      v9 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v21 = v10;
            v22 = 2080;
            v23 = "-[VCSandboxedURL initWithURL:accessType:]";
            v24 = 1024;
            v25 = 91;
            v26 = 2080;
            v27 = "";
            v28 = 2080;
            v29 = v8;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v8 = strtok_r(0, "\n", &__lasts);
      }
      while (v8);
      free(__str);
    }
  }
  return v4;
}

+ (id)stringFromAccessType:(unsigned __int8)a3
{
  const char *v3;

  if (a3 > 2u)
    v3 = "Invalid";
  else
    v3 = off_1E9E55A28[(char)a3];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s(%hhu)"), v3, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  const char *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v12.receiver = self;
  v12.super_class = (Class)VCSandboxedURL;
  v6 = -[VCSandboxedURL description](&v12, sel_description);
  v7 = +[VCSandboxedURL stringFromAccessType:](VCSandboxedURL, "stringFromAccessType:", self->_accessType);
  v8 = "YES";
  if (self->_urlToken)
    v9 = "YES";
  else
    v9 = "NO";
  if (self->_deserialized)
    v10 = "YES";
  else
    v10 = "NO";
  if (!self->_tokenConsumed)
    v8 = "NO";
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Bad usage: deserializer never consumed the token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (id)consumeToken
{
  char **v2;
  const __CFString **v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  char *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  char *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  const __CFString *v34;
  int *v35;
  char *v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  char **v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  char *v50;
  uint64_t v51;

  v2 = (char **)self;
  v51 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)self + 65))
    goto LABEL_16;
  if (!*((_BYTE *)self + 64))
  {
    if ((id)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL consumeToken].cold.1();
      }
      goto LABEL_47;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)objc_msgSend(v2, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_47;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    v37 = 136316162;
    v38 = v26;
    v39 = 2080;
    v40 = "-[VCSandboxedURL consumeToken]";
    v41 = 1024;
    v42 = 138;
    v43 = 2112;
    v44 = v23;
    v45 = 2048;
    v46 = v2;
    v28 = " [%s] %s:%d %@(%p) Bad usage: attempting to consume a non-deserialized URL, we are within the issuing process.";
LABEL_43:
    v30 = v27;
    v31 = 48;
    goto LABEL_49;
  }
  v3 = (const __CFString **)((char *)self + 48);
  v4 = (void *)*((_QWORD *)self + 6);
  if (!v4)
  {
    if ((char **)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL consumeToken].cold.2();
      }
      goto LABEL_47;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)objc_msgSend(v2, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_47;
    v29 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    v37 = 136316162;
    v38 = v29;
    v39 = 2080;
    v40 = "-[VCSandboxedURL consumeToken]";
    v41 = 1024;
    v42 = 139;
    v43 = 2112;
    v44 = v24;
    v45 = 2048;
    v46 = v2;
    v28 = " [%s] %s:%d %@(%p) No urlToken on instance";
    goto LABEL_43;
  }
  objc_msgSend(v4, "UTF8String");
  v5 = sandbox_extension_consume();
  v2[7] = (char *)v5;
  v6 = objc_opt_class();
  if (v5 == -1)
  {
    if ((char **)v6 == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL consumeToken].cold.3();
      }
      goto LABEL_47;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)objc_msgSend(v2, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v32 = VRTraceErrorLogLevelToCSTR(),
          v33 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_47:
      self = 0;
      goto LABEL_16;
    }
    v34 = *v3;
    v35 = __error();
    v36 = strerror(*v35);
    v37 = 136316674;
    v38 = v32;
    v39 = 2080;
    v40 = "-[VCSandboxedURL consumeToken]";
    v41 = 1024;
    v42 = 142;
    v43 = 2112;
    v44 = v25;
    v45 = 2048;
    v46 = v2;
    v47 = 2112;
    v48 = v34;
    v49 = 2080;
    v50 = v36;
    v28 = " [%s] %s:%d %@(%p) Failed to consume token=%@, error=%s";
    v30 = v33;
    v31 = 68;
LABEL_49:
    _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v37, v31);
    goto LABEL_47;
  }
  if ((char **)v6 == v2)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    self = v2;
    if (ErrorLogLevelForModule >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      self = v2;
      if (v11)
      {
        v12 = *v3;
        v13 = v2[7];
        v37 = 136316162;
        v38 = v9;
        v39 = 2080;
        v40 = "-[VCSandboxedURL consumeToken]";
        v41 = 1024;
        v42 = 144;
        v43 = 2112;
        v44 = v12;
        v45 = 2048;
        v46 = (char **)v13;
        v14 = " [%s] %s:%d Successfully consumed token=%@ yielding urlTokenHandle=%lld";
        v15 = v10;
        v16 = 48;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v37, v16);
        self = v2;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)objc_msgSend(v2, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    v17 = VRTraceGetErrorLogLevelForModule();
    self = v2;
    if (v17 >= 6)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      self = v2;
      if (v20)
      {
        v21 = v2[7];
        v22 = *v3;
        v37 = 136316674;
        v38 = v18;
        v39 = 2080;
        v40 = "-[VCSandboxedURL consumeToken]";
        v41 = 1024;
        v42 = 144;
        v43 = 2112;
        v44 = v7;
        v45 = 2048;
        v46 = v2;
        v47 = 2112;
        v48 = v22;
        v49 = 2048;
        v50 = v21;
        v14 = " [%s] %s:%d %@(%p) Successfully consumed token=%@ yielding urlTokenHandle=%lld";
        v15 = v19;
        v16 = 68;
        goto LABEL_15;
      }
    }
  }
LABEL_16:
  *((_BYTE *)v2 + 65) = 1;
  return self;
}

- (id)serialize
{
  unsigned __int8 *p_accessType;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  VCSandboxedURL *v27;
  VCSandboxedURL *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  VCSandboxedURL *v36;
  __int16 v37;
  VCSandboxedURL *v38;
  __int16 v39;
  VCSandboxedURL *v40;
  __int16 v41;
  VCSandboxedURL *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  p_accessType = &self->_accessType;
  if (self->_accessType - 1 >= 2)
  {
    if ((VCSandboxedURL *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL serialize].cold.1(v23, p_accessType, v24);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = (const __CFString *)-[VCSandboxedURL performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v22 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v27 = +[VCSandboxedURL stringFromAccessType:](VCSandboxedURL, "stringFromAccessType:", *p_accessType);
          *(_DWORD *)buf = 136316418;
          v30 = v25;
          v31 = 2080;
          v32 = "-[VCSandboxedURL serialize]";
          v33 = 1024;
          v34 = 154;
          v35 = 2112;
          v36 = (VCSandboxedURL *)v22;
          v37 = 2048;
          v38 = self;
          v39 = 2112;
          v40 = v27;
          _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Can't serialize for configured accessType=%@", buf, 0x3Au);
        }
      }
    }
    return 0;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v28);
  if (v28)
  {
    if ((VCSandboxedURL *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_12;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 136316162;
      v30 = v6;
      v31 = 2080;
      v32 = "-[VCSandboxedURL serialize]";
      v33 = 1024;
      v34 = 158;
      v35 = 2112;
      v36 = self;
      v37 = 2112;
      v38 = v28;
      v8 = " [%s] %s:%d Failed to serialize instance=%@, error=%@";
      v9 = v7;
      v10 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCSandboxedURL performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_12;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 136316674;
      v30 = v11;
      v31 = 2080;
      v32 = "-[VCSandboxedURL serialize]";
      v33 = 1024;
      v34 = 158;
      v35 = 2112;
      v36 = (VCSandboxedURL *)v5;
      v37 = 2048;
      v38 = self;
      v39 = 2112;
      v40 = self;
      v41 = 2112;
      v42 = v28;
      v8 = " [%s] %s:%d %@(%p) Failed to serialize instance=%@, error=%@";
      v9 = v12;
      v10 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
  }
LABEL_12:
  if ((VCSandboxedURL *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v30 = v14;
        v31 = 2080;
        v32 = "-[VCSandboxedURL serialize]";
        v33 = 1024;
        v34 = 161;
        v35 = 2112;
        v36 = self;
        v16 = " [%s] %s:%d Successfully serialized instance=%@";
        v17 = v15;
        v18 = 38;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSandboxedURL performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v30 = v19;
        v31 = 2080;
        v32 = "-[VCSandboxedURL serialize]";
        v33 = 1024;
        v34 = 161;
        v35 = 2112;
        v36 = (VCSandboxedURL *)v13;
        v37 = 2048;
        v38 = self;
        v39 = 2112;
        v40 = self;
        v16 = " [%s] %s:%d %@(%p) Successfully serialized instance=%@";
        v17 = v20;
        v18 = 58;
        goto LABEL_22;
      }
    }
  }
  return v4;
}

+ (id)deserialize:(id)a3
{
  const __CFString *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), a3, &v24);
  v5 = v24;
  v6 = (id)objc_opt_class();
  if (v5)
  {
    if (v6 == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136316162;
      v26 = v9;
      v27 = 2080;
      v28 = "+[VCSandboxedURL deserialize:]";
      v29 = 1024;
      v30 = 171;
      v31 = 2112;
      v32 = v4;
      v33 = 2112;
      v34 = v24;
      v11 = " [%s] %s:%d Failed to deserialize instance=%@, error=%@";
      v12 = v10;
      v13 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136316674;
      v26 = v14;
      v27 = 2080;
      v28 = "+[VCSandboxedURL deserialize:]";
      v29 = 1024;
      v30 = 171;
      v31 = 2112;
      v32 = v7;
      v33 = 2048;
      v34 = a1;
      v35 = 2112;
      v36 = v4;
      v37 = 2112;
      v38 = v24;
      v11 = " [%s] %s:%d %@(%p) Failed to deserialize instance=%@, error=%@";
      v12 = v15;
      v13 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 0;
  }
  if (v6 == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v26 = v17;
        v27 = 2080;
        v28 = "+[VCSandboxedURL deserialize:]";
        v29 = 1024;
        v30 = 175;
        v31 = 2112;
        v32 = v4;
        v19 = " [%s] %s:%d Successfully deserialized instance=%@";
        v20 = v18;
        v21 = 38;
LABEL_23:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v26 = v22;
        v27 = 2080;
        v28 = "+[VCSandboxedURL deserialize:]";
        v29 = 1024;
        v30 = 175;
        v31 = 2112;
        v32 = v8;
        v33 = 2048;
        v34 = a1;
        v35 = 2112;
        v36 = v4;
        v19 = " [%s] %s:%d %@(%p) Successfully deserialized instance=%@";
        v20 = v23;
        v21 = 58;
        goto LABEL_23;
      }
    }
  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFString *v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int64_t urlTokenHandle;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCSandboxedURL *v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_tokenConsumed)
  {
    if ((VCSandboxedURL *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL encodeWithCoder:].cold.1(v6);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)-[VCSandboxedURL performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          urlTokenHandle = self->_urlTokenHandle;
          *(_DWORD *)buf = 136316418;
          v12 = v7;
          v13 = 2080;
          v14 = "-[VCSandboxedURL encodeWithCoder:]";
          v15 = 1024;
          v16 = 203;
          v17 = 2112;
          v18 = v4;
          v19 = 2048;
          v20 = self;
          v21 = 2048;
          v22 = urlTokenHandle;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Bad usage: attempting to encode with a tokenHandle=%lld, we are within the consuming process.", buf, 0x3Au);
        }
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VCSandboxedURL;
    -[VCSandboxedURL encodeWithCoder:](&v10, sel_encodeWithCoder_);
    objc_msgSend(a3, "encodeBytes:length:forKey:", &self->_accessType, 1, CFSTR("VCSandboxedURL_AccessType"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_urlToken, CFSTR("VCSandboxedURL_URLToken"));
  }
}

- (VCSandboxedURL)initWithCoder:(id)a3
{
  VCSandboxedURL *v4;
  unsigned __int8 *v5;
  int v6;
  NSString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  VCSandboxedURL *v38;
  __int16 v39;
  VCSandboxedURL *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)VCSandboxedURL;
  v4 = -[VCSandboxedURL initWithCoder:](&v28, sel_initWithCoder_);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSandboxedURL initWithCoder:].cold.1();
    }
    goto LABEL_62;
  }
  if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("VCSandboxedURL_AccessType")) & 1) == 0)
  {
    if ((VCSandboxedURL *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL initWithCoder:].cold.5();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSandboxedURL performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_62;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_DWORD *)buf = 136316162;
    v30 = v21;
    v31 = 2080;
    v32 = "-[VCSandboxedURL initWithCoder:]";
    v33 = 1024;
    v34 = 216;
    v35 = 2112;
    v36 = (void *)v17;
    v37 = 2048;
    v38 = v4;
    v23 = " [%s] %s:%d %@(%p) Failed to contain accessType";
    goto LABEL_64;
  }
  if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("VCSandboxedURL_URLToken")) & 1) == 0)
  {
    if ((VCSandboxedURL *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL initWithCoder:].cold.4();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCSandboxedURL performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_62;
    v24 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_DWORD *)buf = 136316162;
    v30 = v24;
    v31 = 2080;
    v32 = "-[VCSandboxedURL initWithCoder:]";
    v33 = 1024;
    v34 = 217;
    v35 = 2112;
    v36 = (void *)v18;
    v37 = 2048;
    v38 = v4;
    v23 = " [%s] %s:%d %@(%p) Failed to contain urlToken";
    goto LABEL_64;
  }
  v27 = 0;
  v5 = (unsigned __int8 *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("VCSandboxedURL_AccessType"), &v27);
  if (v27 != 1)
  {
    if ((VCSandboxedURL *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL initWithCoder:].cold.3();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCSandboxedURL performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_62;
    v25 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_DWORD *)buf = 136316162;
    v30 = v25;
    v31 = 2080;
    v32 = "-[VCSandboxedURL initWithCoder:]";
    v33 = 1024;
    v34 = 220;
    v35 = 2112;
    v36 = (void *)v19;
    v37 = 2048;
    v38 = v4;
    v23 = " [%s] %s:%d %@(%p) Failed to decode accessType";
    goto LABEL_64;
  }
  v6 = *v5;
  v4->_accessType = v6;
  if (!v6)
    v4->_tokenConsumed = 1;
  v7 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VCSandboxedURL_URLToken"));
  v4->_urlToken = v7;
  if (!v7)
  {
    if ((VCSandboxedURL *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSandboxedURL initWithCoder:].cold.2();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSandboxedURL performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v26 = VRTraceErrorLogLevelToCSTR(),
          v22 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_62:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v30 = v26;
    v31 = 2080;
    v32 = "-[VCSandboxedURL initWithCoder:]";
    v33 = 1024;
    v34 = 227;
    v35 = 2112;
    v36 = (void *)v20;
    v37 = 2048;
    v38 = v4;
    v23 = " [%s] %s:%d %@(%p) Failed to decode urlToken";
LABEL_64:
    _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x30u);
    goto LABEL_62;
  }
  v4->_deserialized = 1;
  if ((VCSandboxedURL *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v30 = v9;
        v31 = 2080;
        v32 = "-[VCSandboxedURL initWithCoder:]";
        v33 = 1024;
        v34 = 231;
        v35 = 2112;
        v36 = v4;
        v11 = " [%s] %s:%d Successfully deserialized instance=%@";
        v12 = v10;
        v13 = 38;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSandboxedURL performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v30 = v14;
        v31 = 2080;
        v32 = "-[VCSandboxedURL initWithCoder:]";
        v33 = 1024;
        v34 = 231;
        v35 = 2112;
        v36 = (void *)v8;
        v37 = 2048;
        v38 = v4;
        v39 = 2112;
        v40 = v4;
        v11 = " [%s] %s:%d %@(%p) Successfully deserialized instance=%@";
        v12 = v15;
        v13 = 58;
        goto LABEL_18;
      }
    }
  }
  return v4;
}

- (void)issueSandboxExtensionForPath:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to issue token for path=%@, error=%s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_9_1();
}

- (void)issueSandboxExtensionForPath:(uint64_t)a1 .cold.2(uint64_t a1)
{
  __int16 v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  v6 = 63;
  v7 = v1;
  v8 = v2;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v3, (uint64_t)v3, " [%s] %s:%d Failed to allocate string for token=%s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)initWithURL:(uint64_t)a1 accessType:.cold.1(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  const char *v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  OUTLINED_FUNCTION_7_1();
  v5 = "-[VCSandboxedURL initWithURL:accessType:]";
  OUTLINED_FUNCTION_4();
  v6 = 75;
  v7 = 2112;
  v8 = 0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, v2, " [%s] %s:%d Invalid url=%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)initWithURL:(NSObject *)a3 accessType:.cold.2(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[VCSandboxedURL stringFromAccessType:](VCSandboxedURL, "stringFromAccessType:", a2);
  v6 = 136315906;
  v7 = a1;
  OUTLINED_FUNCTION_7_1();
  v8 = "-[VCSandboxedURL initWithURL:accessType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v5, " [%s] %s:%d Invalid accessType=%@", (uint8_t *)&v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithURL:(uint64_t)a1 accessType:.cold.3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  const char *v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  OUTLINED_FUNCTION_7_1();
  v5 = "-[VCSandboxedURL initWithURL:accessType:]";
  OUTLINED_FUNCTION_4();
  v6 = 80;
  v7 = 2112;
  v8 = v1;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Failed to initialize instance for path=%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)consumeToken
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to consume token=%@, error=%s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_9_1();
}

- (void)serialize
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[VCSandboxedURL stringFromAccessType:](VCSandboxedURL, "stringFromAccessType:", *a2);
  v6 = 136315906;
  v7 = a1;
  OUTLINED_FUNCTION_7_1();
  v8 = "-[VCSandboxedURL serialize]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v5, " [%s] %s:%d Can't serialize for configured accessType=%@", (uint8_t *)&v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  OUTLINED_FUNCTION_9();
  v6 = 203;
  v7 = 2048;
  v8 = v1;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Bad usage: attempting to encode with a tokenHandle=%lld, we are within the consuming process.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode super instance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode urlToken", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode accessType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to contain urlToken", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to contain accessType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
