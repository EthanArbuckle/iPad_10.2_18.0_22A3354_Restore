@implementation CoreDAVCopyTask

- (id)httpMethod
{
  return CFSTR("COPY");
}

- (void)dealloc
{
  objc_super v3;

  -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVCopyTask;
  -[CoreDAVTask dealloc](&v3, sel_dealloc);
}

- (BOOL)validate:(id *)a3
{
  unsigned int v5;
  BOOL v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CoreDAVCopyTask;
  v5 = -[CoreDAVTask validate:](&v9, sel_validate_);
  if (v5)
  {
    v5 = -[CoreDAVTask depth](self, "depth");
    v6 = v5 >= 3;
    LOBYTE(v5) = v5 < 3;
    if (a3)
    {
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 5, 0);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v5) = 0;
        *a3 = v7;
      }
    }
  }
  return v5;
}

- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CoreDAVTask delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "copyTask:parsedResponses:error:", self, v10, v6);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }

}

@end
