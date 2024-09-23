@implementation DIVerifyParams

- (DIVerifyParams)initWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  DIVerifyParams *v9;

  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DIVerifyParams initWithURL:shadowURLs:error:](self, "initWithURL:shadowURLs:error:", v7, v8, a4);

  return v9;
}

- (DIVerifyParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8;
  DIVerifyParams *v9;
  DIVerifyParams *v10;
  void *v11;
  int v12;
  DIVerifyParams *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DIVerifyParams;
  v9 = -[DIBaseParams initWithURL:error:](&v15, sel_initWithURL_error_, a3, a5);
  v10 = v9;
  if (!v9
    || -[DIBaseParams openExistingImageWithFlags:error:](v9, "openExistingImageWithFlags:error:", 0, a5)
    && (-[DIBaseParams shadowChain](v10, "shadowChain"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "addShadowURLs:error:", v8, a5),
        v11,
        v12))
  {
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldValidateShadows
{
  void *v2;
  char v3;

  -[DIBaseParams shadowChain](self, "shadowChain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldValidate");

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DIBaseParams shadowChain](self, "shadowChain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldValidate:", v3);

}

- (BOOL)verifyWithError:(id *)a3
{
  int v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  DIClient2Controller_XPCHandler *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  DIVerifyParams *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = objc_alloc_init(DIClient2Controller_XPCHandler);
  v5 = *__error();
  if (DIForwardLogs())
  {
    v12[5] = 0;
    getDIOSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    v20 = 34;
    v21 = 2080;
    v22 = "-[DIVerifyParams verifyWithError:]";
    v23 = 2114;
    v24 = self;
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
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v20 = 34;
      v21 = 2080;
      v22 = "-[DIVerifyParams verifyWithError:]";
      v23 = 2114;
      v24 = self;
      _os_log_impl(&dword_212EB0000, v8, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }

  }
  *__error() = v5;
  if ((objc_msgSend((id)v14[5], "connectWithError:", a3) & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v14[5], 2, a3))
  {
    objc_msgSend((id)v14[5], "remoteProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __34__DIVerifyParams_verifyWithError___block_invoke;
    v12[3] = &unk_24CEED620;
    v12[4] = &v13;
    objc_msgSend(v9, "verifyWithParams:reply:", self, v12);

    v10 = objc_msgSend((id)v14[5], "completeCommandWithError:", a3);
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __34__DIVerifyParams_verifyWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "signalCommandCompletedWithXpcError:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
