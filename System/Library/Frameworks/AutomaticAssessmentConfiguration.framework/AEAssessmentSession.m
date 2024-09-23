@implementation AEAssessmentSession

- (AEAssessmentSession)initWithConfiguration:(AEAssessmentConfiguration *)configuration
{
  AEAssessmentConfiguration *v4;
  AEAssessmentSession *v5;
  id v6;
  void *v7;
  uint64_t v8;
  AECAssessmentSessionWrapper *sessionWrapper;
  objc_super v11;

  v4 = configuration;
  v11.receiver = self;
  v11.super_class = (Class)AEAssessmentSession;
  v5 = -[AEAssessmentSession init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDB7200]);
    -[AEAssessmentConfiguration configurationWrapper](v4, "configurationWrapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithConfigurationWrapper:queue:", v7, MEMORY[0x24BDAC9B8]);
    sessionWrapper = v5->_sessionWrapper;
    v5->_sessionWrapper = (AECAssessmentSessionWrapper *)v8;

    -[AECAssessmentSessionWrapper setDelegate:](v5->_sessionWrapper, "setDelegate:", v5);
  }

  return v5;
}

+ (BOOL)supportsConfigurationUpdates
{
  return objc_msgSend(MEMORY[0x24BDB7200], "supportsMultiAppConfiguration");
}

+ (BOOL)supportsMultipleParticipants
{
  return objc_msgSend(MEMORY[0x24BDB7200], "supportsMultiAppConfiguration");
}

- (AEAssessmentConfiguration)configuration
{
  void *v2;
  void *v3;

  if (self)
    self = (AEAssessmentSession *)self->_sessionWrapper;
  -[AEAssessmentSession configurationWrapper](self, "configurationWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AEAssessmentConfiguration configurationFromWrapper:](AEAssessmentConfiguration, "configurationFromWrapper:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AEAssessmentConfiguration *)v3;
}

- (BOOL)isActive
{
  if (self)
    self = (AEAssessmentSession *)self->_sessionWrapper;
  return -[AEAssessmentSession isActive](self, "isActive");
}

- (void)begin
{
  if (self)
    self = (AEAssessmentSession *)self->_sessionWrapper;
  -[AEAssessmentSession begin](self, "begin");
}

- (void)updateToConfiguration:(AEAssessmentConfiguration *)configuration
{
  AECAssessmentSessionWrapper *sessionWrapper;
  AECAssessmentSessionWrapper *v5;
  id v6;

  if (self)
    sessionWrapper = self->_sessionWrapper;
  else
    sessionWrapper = 0;
  v5 = sessionWrapper;
  -[AEAssessmentConfiguration configurationWrapper](configuration, "configurationWrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AECAssessmentSessionWrapper updateToConfigurationWrapper:](v5, "updateToConfigurationWrapper:", v6);

}

- (void)end
{
  if (self)
    self = (AEAssessmentSession *)self->_sessionWrapper;
  -[AEAssessmentSession end](self, "end");
}

- (void)assessmentSessionWrapperDidBegin:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AEAssessmentSession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AEAssessmentSession delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assessmentSessionDidBegin:", self);

  }
}

- (void)assessmentSessionWrapperDidEnd:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AEAssessmentSession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AEAssessmentSession delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assessmentSessionDidEnd:", self);

  }
}

- (void)assessmentSessionWrapper:(id)a3 failedToBeginWithError:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[AEAssessmentSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AEAssessmentSession publicErrorForClientError:](self, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEAssessmentSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assessmentSession:failedToBeginWithError:", self, v7);

  }
}

- (id)publicErrorForClientError:(id)a1
{
  id v2;
  id v3;
  uint64_t v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    if (-[AEAssessmentSession isUnsupportedPlatformClientError:]((uint64_t)v2, v3))
      v4 = 2;
    else
      v4 = 1;
    AEErrorUnderlyingError(v4, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)assessmentSessionWrapper:(id)a3 wasInterruptedWithError:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[AEAssessmentSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AEAssessmentSession publicErrorForClientError:](self, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEAssessmentSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assessmentSession:wasInterruptedWithError:", self, v7);

  }
}

- (void)assessmentSessionWrapperDidUpdate:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AEAssessmentSession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AEAssessmentSession delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assessmentSessionDidUpdate:", self);

  }
}

- (void)assessmentSessionWrapper:(id)a3 failedToUpdateToConfigurationWrapper:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  -[AEAssessmentSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AEAssessmentSession publicErrorForClientError:](self, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AEAssessmentConfiguration configurationFromWrapper:](AEAssessmentConfiguration, "configurationFromWrapper:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEAssessmentSession delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assessmentSession:failedToUpdateToConfiguration:error:", self, v11, v10);

  }
}

- (uint64_t)isUnsupportedPlatformClientError:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)MEMORY[0x24BDFC670];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDFC670]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v4, "domain");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDFC650]) && objc_msgSend(v4, "code") == 100)
  {

    if (!v9)
      goto LABEL_20;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v15, "domain", (_QWORD)v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDB7208], "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", v17))
          {
            v18 = objc_msgSend(v15, "code");

            if (v18 == 2)
            {

              v20 = 1;
              goto LABEL_21;
            }
          }
          else
          {

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }
  }

LABEL_20:
  v20 = 0;
LABEL_21:

LABEL_22:
  return v20;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
