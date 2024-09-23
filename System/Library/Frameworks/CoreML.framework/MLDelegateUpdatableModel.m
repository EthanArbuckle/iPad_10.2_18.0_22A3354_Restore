@implementation MLDelegateUpdatableModel

- (MLDelegateUpdatableModel)initWithEngine:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  MLDelegateUpdatableModel *v8;
  objc_super v10;
  uint8_t buf[16];

  v6 = a3;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE43B770) & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)MLDelegateUpdatableModel;
  v8 = -[MLDelegateModel initWithEngine:error:](&v10, sel_initWithEngine_error_, v6, a4);

  return v8;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MLDelegateUpdatableModel updatableEngine](self, "updatableEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "writeToURL:error:", v6, a4);

  return (char)a4;
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MLDelegateUpdatableModel updatableEngine](self, "updatableEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpdateProgressHandlers:dispatchQueue:", v8, v6);

}

- (void)cancelUpdate
{
  id v2;

  -[MLDelegateUpdatableModel updatableEngine](self, "updatableEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelUpdate");

}

- (void)resumeUpdate
{
  id v2;

  -[MLDelegateUpdatableModel updatableEngine](self, "updatableEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeUpdate");

}

- (void)resumeUpdateWithParameters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MLDelegateUpdatableModel updatableEngine](self, "updatableEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeUpdateWithParameters:", v5);

}

- (void)updateModelWithData:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MLDelegateUpdatableModel updatableEngine](self, "updatableEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateModelWithData:", v5);

}

+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  NSObject *v7;
  uint8_t v9[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel", a3, a4, a5, a6, a7);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
  }

  return 0;
}

@end
