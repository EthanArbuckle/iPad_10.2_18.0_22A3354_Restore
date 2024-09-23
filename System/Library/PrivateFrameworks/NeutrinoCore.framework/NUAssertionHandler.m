@implementation NUAssertionHandler

- (NUAssertionHandler)init
{
  NUAssertionHandler *v2;
  uint64_t v3;
  NUAssertionPolicyHandler *policy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUAssertionHandler;
  v2 = -[NUAssertionHandler init](&v6, sel_init);
  -[NUAssertionHandler defaultPolicy](v2, "defaultPolicy");
  v3 = objc_claimAutoreleasedReturnValue();
  policy = v2->_policy;
  v2->_policy = (NUAssertionPolicyHandler *)v3;

  return v2;
}

- (id)defaultPolicy
{
  NUAssertionPolicyUnique *v3;
  NUAssertionPolicyDebuggerWarning *v4;
  NUAssertionPolicyDebuggerFatal *v5;
  NUAssertionPolicyCrashReport *v6;
  NUAssertionPolicyAbort *v7;

  if (+[NUAssertionHandler runningUnitTests](NUAssertionHandler, "runningUnitTests"))
  {
    -[NUAssertionHandler defaultTestingPolicy](self, "defaultTestingPolicy");
    v3 = (NUAssertionPolicyUnique *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(NUAssertionPolicyUnique);
    v4 = objc_alloc_init(NUAssertionPolicyDebuggerWarning);
    -[NUAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v4);

    v5 = objc_alloc_init(NUAssertionPolicyDebuggerFatal);
    -[NUAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v5);

    v6 = objc_alloc_init(NUAssertionPolicyCrashReport);
    -[NUAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v6);

    v7 = objc_alloc_init(NUAssertionPolicyAbort);
    -[NUAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v7);

  }
  return v3;
}

- (id)defaultTestingPolicy
{
  NUAssertionPolicyComposite *v2;
  NUAssertionPolicyUnitTest *v3;

  v2 = objc_alloc_init(NUAssertionPolicyComposite);
  v3 = objc_alloc_init(NUAssertionPolicyUnitTest);
  -[NUAssertionPolicyComposite addPolicy:](v2, "addPolicy:", v3);

  return v2;
}

- (id)newAssertionInfoInMethod:(SEL)a3 object:(id)a4 function:(id)a5 file:(id)a6 lineNumber:(unint64_t)a7 currentlyExecutingJobName:(id)a8 description:(id)a9 arguments:(char *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NUAssertionInfo *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;

  v15 = a8;
  v16 = a9;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = objc_alloc_init(NUAssertionInfo);
  -[NUAssertionInfo setSelector:](v20, "setSelector:", a3);
  -[NUAssertionInfo setObjectClass:](v20, "setObjectClass:", objc_opt_class());
  -[NUAssertionInfo setFunctionName:](v20, "setFunctionName:", v18);

  v21 = objc_opt_class() == (_QWORD)v19;
  -[NUAssertionInfo setIsClassMethod:](v20, "setIsClassMethod:", v21);
  -[NUAssertionInfo setFileName:](v20, "setFileName:", v17);

  -[NUAssertionInfo setLineNumber:](v20, "setLineNumber:", a7);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("job: %@"), v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUAssertionInfo setCurrentlyExecutingJobName:](v20, "setCurrentlyExecutingJobName:", v22);

  }
  else
  {
    -[NUAssertionInfo setCurrentlyExecutingJobName:](v20, "setCurrentlyExecutingJobName:", &stru_1E5068958);
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v16, a10);

  -[NUAssertionInfo setMessage:](v20, "setMessage:", v23);
  return v20;
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(unint64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7 arguments:(char *)a8
{
  id v9;
  void *v10;

  v9 = -[NUAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:currentlyExecutingJobName:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:currentlyExecutingJobName:description:arguments:", 0, 0, a3, a4, a5, a6, a7, a8);
  objc_msgSend(v9, "setIsFatal:", 1);
  -[NUAssertionHandler policy](self, "policy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyAssertion:", v9);

  abort();
}

- (void)continueAfterAssertInFunction:(id)a3 file:(id)a4 lineNumber:(unint64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7 arguments:(char *)a8
{
  void *v9;
  id v10;

  v10 = -[NUAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:currentlyExecutingJobName:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:currentlyExecutingJobName:description:arguments:", 0, 0, a3, a4, a5, a6, a7, a8);
  objc_msgSend(v10, "setIsFatal:", 0);
  -[NUAssertionHandler policy](self, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyAssertion:", v10);

}

- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 currentlyExecutingJobName:(id)a7 description:(id)a8
{
  id v9;
  void *v10;
  uint64_t v11;

  v9 = -[NUAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:currentlyExecutingJobName:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:currentlyExecutingJobName:description:arguments:", a3, a4, 0, a5, a6, a7, a8, &v11);
  objc_msgSend(v9, "setIsFatal:", 1);
  -[NUAssertionHandler policy](self, "policy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyAssertion:", v9);

  abort();
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7
{
  id v8;
  void *v9;
  uint64_t v10;

  v8 = -[NUAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:currentlyExecutingJobName:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:currentlyExecutingJobName:description:arguments:", 0, 0, a3, a4, a5, a6, a7, &v10);
  objc_msgSend(v8, "setIsFatal:", 1);
  -[NUAssertionHandler policy](self, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyAssertion:", v8);

  abort();
}

- (NUAssertionPolicyHandler)policy
{
  return (NUAssertionPolicyHandler *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
}

+ (id)currentHandler
{
  if (currentHandler_onceToken != -1)
    dispatch_once(&currentHandler_onceToken, &__block_literal_global_23515);
  return (id)currentHandler_handler;
}

void __36__NUAssertionHandler_currentHandler__block_invoke()
{
  NUAssertionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(NUAssertionHandler);
  v1 = (void *)currentHandler_handler;
  currentHandler_handler = (uint64_t)v0;

}

@end
