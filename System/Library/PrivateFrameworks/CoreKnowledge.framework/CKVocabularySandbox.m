@implementation CKVocabularySandbox

+ (id)sandboxWithRawSpeechProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(getSEMSandboxClass(), "sandboxWithRawSpeechProfile:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSandbox:", v6);
  return v7;
}

+ (id)sandboxWithRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(getSEMSandboxClass(), "sandboxWithRawSpeechProfile:error:", v6, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSandbox:", v7);
  return v8;
}

+ (id)sandboxWithProfile:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  objc_msgSend(getSEMSandboxClass(), "sandboxWithKVProfile:locale:error:", v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSandbox:", v9);
  return v10;
}

- (CKVocabularySandbox)init
{
  id v3;
  CKVocabularySandbox *v4;

  v3 = objc_alloc_init((Class)getSEMSandboxClass_1148());
  v4 = -[CKVocabularySandbox initWithSandbox:](self, "initWithSandbox:", v3);

  return v4;
}

- (CKVocabularySandbox)initWithSandbox:(id)a3
{
  id v5;
  CKVocabularySandbox *v6;
  CKVocabularySandbox *v7;
  CKVocabularySandbox *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKVocabularySandbox;
  v6 = -[CKVocabularySandbox init](&v10, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_sandbox, a3), !v7->_sandbox))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (void)reset
{
  -[SEMSandbox reset](self->_sandbox, "reset");
}

- (id)save
{
  return (id)-[SEMSandbox save](self->_sandbox, "save");
}

- (id)sandboxId
{
  return (id)-[SEMSandbox sandboxId](self->_sandbox, "sandboxId");
}

- (SEMSandbox)sandbox
{
  return self->_sandbox;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandbox, 0);
}

+ (id)loadWithSandboxId:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(getSEMSandboxClass_1148(), "loadWithSandboxId:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSandbox:", v6);
  return v7;
}

- (id)searcher
{
  CKVocabularySandboxSearcher *v3;
  void *v4;
  CKVocabularySandboxSearcher *v5;

  v3 = [CKVocabularySandboxSearcher alloc];
  -[CKVocabularySandbox sandbox](self, "sandbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKVocabularySandboxSearcher initWithSandbox:userId:prewarm:](v3, "initWithSandbox:userId:prewarm:", v4, 0, 0);

  return v5;
}

- (id)searcherForUserId:(id)a3
{
  id v4;
  CKVocabularySandboxSearcher *v5;
  void *v6;
  CKVocabularySandboxSearcher *v7;

  v4 = a3;
  v5 = [CKVocabularySandboxSearcher alloc];
  -[CKVocabularySandbox sandbox](self, "sandbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKVocabularySandboxSearcher initWithSandbox:userId:prewarm:](v5, "initWithSandbox:userId:prewarm:", v6, v4, 1);

  return v7;
}

@end
