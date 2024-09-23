@implementation CRNGroupScrollTestParameters

- (CRNGroupScrollTestParameters)initWithTestName:(id)a3 withParameters:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  CRNGroupScrollTestParameters *v9;
  CRNGroupScrollTestParameters *v10;
  objc_super v12;

  v7 = a4;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CRNGroupScrollTestParameters;
  v9 = -[CRNGroupScrollTestParameters init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[CRNGroupScrollTestParameters setParameters:](v9, "setParameters:", v7);
    -[CRNGroupScrollTestParameters setCompletionHandler:](v10, "setCompletionHandler:", v8);
  }

  return v10;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

+ (id)parametersByCombining:(id)a3 testName:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  CRNGroupScrollTestParameters *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CRNGroupScrollTestParameters initWithTestName:withParameters:completionHandler:]([CRNGroupScrollTestParameters alloc], "initWithTestName:withParameters:completionHandler:", v8, v9, v7);

  return v10;
}

- (RCPSyntheticEventStream)eventStream
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!RecapLibraryCore_frameworkLibrary_0)
  {
    v12 = xmmword_24F13BA38;
    v13 = 0;
    RecapLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!RecapLibraryCore_frameworkLibrary_0)
    return (RCPSyntheticEventStream *)0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getRCPSyntheticEventStreamClass_softClass_0;
  v11 = getRCPSyntheticEventStreamClass_softClass_0;
  if (!getRCPSyntheticEventStreamClass_softClass_0)
  {
    *(_QWORD *)&v12 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v12 + 1) = 3221225472;
    v13 = __getRCPSyntheticEventStreamClass_block_invoke_0;
    v14 = &unk_24F13B9F0;
    v15 = &v8;
    __getRCPSyntheticEventStreamClass_block_invoke_0((uint64_t)&v12);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  -[CRNGroupScrollTestParameters composerBlock](self, "composerBlock", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStreamWithEventActions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (RCPSyntheticEventStream *)v6;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__CRNGroupScrollTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_24F13BA18;
  v3[4] = self;
  return (id)MEMORY[0x22E2B5C74](v3, a2);
}

void __45__CRNGroupScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "parameters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "composerBlock");
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v9)[2](v9, v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSString)testName
{
  return self->testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->testName, 0);
}

@end
