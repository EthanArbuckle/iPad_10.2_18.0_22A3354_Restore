@implementation CoreDAVOptionsTask

- (id)httpMethod
{
  return CFSTR("OPTIONS");
}

- (id)requestBody
{
  return 0;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[CoreDAVTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "optionsTask:error:", self, v4);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVOptionsTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v8, sel_finishCoreDAVTaskWithError_, v4);

}

@end
