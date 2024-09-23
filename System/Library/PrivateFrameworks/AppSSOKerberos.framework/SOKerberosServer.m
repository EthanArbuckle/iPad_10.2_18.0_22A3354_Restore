@implementation SOKerberosServer

+ (id)serverWithString:(id)a3
{
  void *v3;
  const __CFString *v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  SOKerberosServer *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v50;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("tcp/")) & 1) != 0)
  {
    v4 = CFSTR("tcp");
LABEL_5:
    v5 = 4;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("udp/")) & 1) != 0)
  {
    v4 = CFSTR("udp");
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("http://")) & 1) != 0)
  {
    v4 = CFSTR("http");
    v5 = 7;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("http/")) & 1) != 0)
  {
    v4 = CFSTR("http");
    v5 = 5;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("kkdcp://")) & 1) != 0)
  {
    v4 = CFSTR("kkdcp");
    v5 = 8;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v16 = 0;
    if ((objc_msgSend(v3, "containsString:", CFSTR("://")) & 1) != 0)
      goto LABEL_39;
  }
LABEL_6:
  if (objc_msgSend(v3, "length") <= v5)
  {
    SO_LOG_SOKerberosServer();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[SOKerberosServer serverWithString:].cold.4(v15);
    v16 = 0;
    goto LABEL_38;
  }
  v50 = v4;
  objc_msgSend(v3, "substringFromIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD1808]);
  objc_msgSend(CFSTR("host://"), "stringByAppendingString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("[")) & 1) != 0)
  {
    objc_msgSend(v9, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasSuffix:", CFSTR("]"));

    if (v12)
    {
      objc_msgSend(v9, "host");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "substringWithRange:", 1, objc_msgSend(v14, "length") - 2);
      v15 = objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "host");
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  objc_msgSend(v9, "port");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", &stru_24D3EC758) & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v9, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD14A8], "URLHostAllowedCharacterSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invertedSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[NSObject rangeOfCharacterFromSet:](v15, "rangeOfCharacterFromSet:", v22);

  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    SO_LOG_SOKerberosServer();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[SOKerberosServer serverWithString:].cold.3((uint64_t)v15, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_36;
  }
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "invertedSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v18, "rangeOfCharacterFromSet:", v25);

    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      SO_LOG_SOKerberosServer();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        +[SOKerberosServer serverWithString:].cold.2((uint64_t)v18, v30, v37, v38, v39, v40, v41, v42);
      goto LABEL_36;
    }
  }
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "invertedSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v20, "rangeOfCharacterFromSet:", v28);

    if (v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      SO_LOG_SOKerberosServer();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        +[SOKerberosServer serverWithString:].cold.1((uint64_t)v20, v30, v43, v44, v45, v46, v47, v48);
LABEL_36:

      v16 = 0;
      goto LABEL_37;
    }
  }
  v16 = -[SOKerberosServer initWithHost:port:protocol:path:]([SOKerberosServer alloc], "initWithHost:port:protocol:path:", v15, v18, v50, v20);
LABEL_37:

LABEL_38:
LABEL_39:

  return v16;
}

- (SOKerberosServer)initWithHost:(id)a3 port:(id)a4 protocol:(id)a5 path:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SOKerberosServer *v15;
  SOKerberosServer *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SOKerberosServer;
  v15 = -[SOKerberosServer init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_host, a3);
    objc_storeStrong((id *)&v16->_port, a4);
    objc_storeStrong((id *)&v16->_protocol, a5);
    objc_storeStrong((id *)&v16->_path, a6);
  }

  return v16;
}

- (NSString)host
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)port
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

+ (void)serverWithString:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, a2, a3, "path contains invalid characters: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)serverWithString:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, a2, a3, "port contains invalid characters: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)serverWithString:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, a2, a3, "host contains invalid characters: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)serverWithString:(os_log_t)log .cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215A1B000, log, OS_LOG_TYPE_ERROR, "invalid input length", v1, 2u);
}

@end
