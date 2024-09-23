@implementation DIUserDataParams

- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4
{
  DIUserDataParams *v4;
  DIUserDataParams *v5;
  NSDictionary *userDict;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DIUserDataParams;
  v4 = -[DIBaseParams initWithURL:error:](&v8, sel_initWithURL_error_, a3, a4);
  v5 = v4;
  if (v4)
  {
    userDict = v4->_userDict;
    v4->_userDict = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v5;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DIUserDataParams)initWithCoder:(id)a3
{
  id v4;
  DIUserDataParams *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSDictionary *userDict;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIUserDataParams;
  v5 = -[DIBaseParams initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD1620];
      v8 = (void *)MEMORY[0x24BDBCF20];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v11, v6, &v16);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v16;
      userDict = v5->_userDict;
      v5->_userDict = (NSDictionary *)v12;

      if (!v13)
        goto LABEL_7;
    }
    else
    {
      +[DIError errorWithPOSIXCode:verboseInfo:](DIError, "errorWithPOSIXCode:verboseInfo:", 22, CFSTR("Failed serializing user dictionary"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[DIBaseParams setDeserializationError:](v5, "setDeserializationError:", v13);
LABEL_7:

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIUserDataParams;
  -[DIBaseParams encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x24BDD1618];
  -[DIUserDataParams userDict](self, "userDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 0, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;

  if (v8)
  {
    v9 = *__error();
    if (DIForwardLogs())
    {
      v15 = 0;
      getDIOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158210;
      v19 = 36;
      v20 = 2080;
      v21 = "-[DIUserDataParams encodeWithCoder:]";
      v22 = 2114;
      v23 = v8;
      LODWORD(v14) = 28;
      v13 = buf;
      v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      getDIOSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        v19 = 36;
        v20 = 2080;
        v21 = "-[DIUserDataParams encodeWithCoder:]";
        v22 = 2114;
        v23 = v8;
        _os_log_impl(&dword_212EB0000, v12, OS_LOG_TYPE_ERROR, "%.*s: Error encoding user dictionary: %{public}@", buf, 0x1Cu);
      }

    }
    *__error() = v9;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userData"), v13, v14, v15);

}

- (BOOL)retrieveWithError:(id *)a3
{
  int v5;
  NSObject *v6;
  char *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t *v14;
  uint64_t v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[8];
  _BYTE v24[24];
  void (*v25)(uint64_t);
  DIClient2Controller_XPCHandler *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0, a3))
    return 0;
  v5 = *__error();
  if (DIForwardLogs())
  {
    v17 = 0;
    getDIOSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&buf[4] = 38;
    *(_WORD *)v24 = 2080;
    *(_QWORD *)&v24[2] = "-[DIUserDataParams retrieveWithError:]";
    *(_WORD *)&v24[10] = 2114;
    *(_QWORD *)&v24[12] = self;
    LODWORD(v15) = 28;
    v14 = buf;
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 38;
      *(_WORD *)v24 = 2080;
      *(_QWORD *)&v24[2] = "-[DIUserDataParams retrieveWithError:]";
      *(_WORD *)&v24[10] = 2114;
      *(_QWORD *)&v24[12] = self;
      _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }

  }
  *__error() = v5;
  *(_QWORD *)buf = 0;
  *(_QWORD *)v24 = buf;
  *(_QWORD *)&v24[8] = 0x3032000000;
  *(_QWORD *)&v24[16] = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if ((objc_msgSend(*(id *)(*(_QWORD *)v24 + 40), "connectWithError:", a3) & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", *(_QWORD *)(*(_QWORD *)v24 + 40), 2, a3))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)v24 + 40), "remoteProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __38__DIUserDataParams_retrieveWithError___block_invoke;
    v16[3] = &unk_24CEED5F8;
    v16[4] = &v17;
    v16[5] = buf;
    objc_msgSend(v10, "retrieveUserDataWithParams:reply:", self, v16);

    v8 = objc_msgSend(*(id *)(*(_QWORD *)v24 + 40), "completeCommandWithError:", a3);
    if ((v8 & 1) != 0)
    {
      objc_msgSend((id)v18[5], "userDict");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend((id)v18[5], "userDict");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = (void *)MEMORY[0x24BDBD1B8];
      }
      -[DIUserDataParams setUserDict:](self, "setUserDict:", v12, v14, v15);
      if (v11)

    }
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v8;
}

void __38__DIUserDataParams_retrieveWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (!v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "signalCommandCompletedWithXpcError:", v6);

}

- (BOOL)embedWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  char *v10;
  char v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[6];
  uint8_t buf[8];
  _BYTE v17[24];
  void (*v18)(uint64_t);
  DIClient2Controller_XPCHandler *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[DIUserDataParams userDict](self, "userDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("userDict cannot be nil or empty"), a3);
  -[DIUserDataParams userDict](self, "userDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("userDict cannot be nil or empty"), a3);
  if (!-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2, a3))
    return 0;
  v8 = *__error();
  if (DIForwardLogs())
  {
    v15[5] = 0;
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&buf[4] = 35;
    *(_WORD *)v17 = 2080;
    *(_QWORD *)&v17[2] = "-[DIUserDataParams embedWithError:]";
    *(_WORD *)&v17[10] = 2114;
    *(_QWORD *)&v17[12] = self;
    v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    getDIOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 35;
      *(_WORD *)v17 = 2080;
      *(_QWORD *)&v17[2] = "-[DIUserDataParams embedWithError:]";
      *(_WORD *)&v17[10] = 2114;
      *(_QWORD *)&v17[12] = self;
      _os_log_impl(&dword_212EB0000, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }

  }
  *__error() = v8;
  *(_QWORD *)buf = 0;
  *(_QWORD *)v17 = buf;
  *(_QWORD *)&v17[8] = 0x3032000000;
  *(_QWORD *)&v17[16] = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if ((objc_msgSend(*(id *)(*(_QWORD *)v17 + 40), "connectWithError:", a3) & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", *(_QWORD *)(*(_QWORD *)v17 + 40), 4, a3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)v17 + 40), "remoteProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __35__DIUserDataParams_embedWithError___block_invoke;
    v15[3] = &unk_24CEED620;
    v15[4] = buf;
    objc_msgSend(v13, "embedUserDataWithParams:reply:", self, v15);

    v11 = objc_msgSend(*(id *)(*(_QWORD *)v17 + 40), "completeCommandWithError:", a3);
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v11;
}

uint64_t __35__DIUserDataParams_embedWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "signalCommandCompletedWithXpcError:", a2);
}

- (NSDictionary)userDict
{
  return self->_userDict;
}

- (void)setUserDict:(id)a3
{
  objc_storeStrong((id *)&self->_userDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDict, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
