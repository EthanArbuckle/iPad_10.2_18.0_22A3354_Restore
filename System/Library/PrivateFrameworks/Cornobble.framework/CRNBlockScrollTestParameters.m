@implementation CRNBlockScrollTestParameters

- (CRNBlockScrollTestParameters)initWithTestName:(id)a3 withComposerBlock:(id)a4
{
  return -[CRNBlockScrollTestParameters initWithTestName:withComposerBlock:completionHandler:](self, "initWithTestName:withComposerBlock:completionHandler:", a3, a4, 0);
}

- (CRNBlockScrollTestParameters)initWithTestName:(id)a3 withComposerBlock:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRNBlockScrollTestParameters *v12;
  CRNBlockScrollTestParameters *v13;
  uint64_t v14;
  id composerBlock;
  uint64_t v16;
  id completionHandler;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRNBlockScrollTestParameters;
  v12 = -[CRNBlockScrollTestParameters init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_testName, a3);
    v14 = MEMORY[0x22E2B5C74](v10);
    composerBlock = v13->_composerBlock;
    v13->_composerBlock = (id)v14;

    v16 = MEMORY[0x22E2B5C74](v11);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v16;

  }
  return v13;
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
  if (!RecapLibraryCore_frameworkLibrary_3)
  {
    v12 = xmmword_24F13BA88;
    v13 = 0;
    RecapLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!RecapLibraryCore_frameworkLibrary_3)
    return (RCPSyntheticEventStream *)0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getRCPSyntheticEventStreamClass_softClass_3;
  v11 = getRCPSyntheticEventStreamClass_softClass_3;
  if (!getRCPSyntheticEventStreamClass_softClass_3)
  {
    *(_QWORD *)&v12 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v12 + 1) = 3221225472;
    v13 = __getRCPSyntheticEventStreamClass_block_invoke_3;
    v14 = &unk_24F13B9F0;
    v15 = &v8;
    __getRCPSyntheticEventStreamClass_block_invoke_3((uint64_t)&v12);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  -[CRNBlockScrollTestParameters composerBlock](self, "composerBlock", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStreamWithEventActions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (RCPSyntheticEventStream *)v6;
}

- (id)composerBlock
{
  return (id)MEMORY[0x22E2B5C74](self->_composerBlock, a2);
}

- (NSString)testName
{
  return self->_testName;
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

- (void)setComposerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_composerBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
