@implementation EFProtectedFile

void ___ef_log_EFProtectedFile_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EFProtectedFile");
  v1 = (void *)_ef_log_EFProtectedFile_log;
  _ef_log_EFProtectedFile_log = (uint64_t)v0;

}

- (EFProtectedFile)initWithFilePath:(id)a3 protectionType:(id)a4
{
  return -[EFProtectedFile initWithFilePath:isSensitive:protectionType:](self, "initWithFilePath:isSensitive:protectionType:", a3, 0, a4);
}

- (EFProtectedFile)initWithSensitiveFilePath:(id)a3 protectionType:(id)a4
{
  return -[EFProtectedFile initWithFilePath:isSensitive:protectionType:](self, "initWithFilePath:isSensitive:protectionType:", a3, 1, a4);
}

- (EFProtectedFile)initWithFilePath:(id)a3 isSensitive:(BOOL)a4 protectionType:(id)a5
{
  id v8;
  id v9;
  EFProtectedFile *v10;
  id *v11;
  _EFProtectedFile *file;
  _EFBackgroundProcessingAssertion *v13;
  void *v14;
  _EFBackgroundProcessingAssertion *v15;
  _EFBackgroundProcessingAssertion *assertion;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)EFProtectedFile;
  v10 = -[EFProtectedFile init](&v18, sel_init);
  if (v10)
  {
    v11 = -[_EFProtectedFile initWithFilePath:isSensitive:protectionType:]((id *)[_EFProtectedFile alloc], v8, a4, v9);
    file = v10->_file;
    v10->_file = (_EFProtectedFile *)v11;

    v13 = [_EFBackgroundProcessingAssertion alloc];
    v19[0] = v10->_file;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (_EFBackgroundProcessingAssertion *)-[_EFBackgroundProcessingAssertion initWithProtectedFiles:](v13, v14);
    assertion = v10->_assertion;
    v10->_assertion = v15;

  }
  return v10;
}

- (BOOL)backgroundProcessingIsAllowed
{
  os_unfair_lock_s *v2;
  unsigned __int8 v3;

  -[EFProtectedFile assertion](self, "assertion");
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3 = -[_EFBackgroundProcessingAssertion isActive](v2);

  return v3;
}

- (id)requestBackgroundProcessingForDuration:(double)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;

  v11 = 0;
  -[EFProtectedFile assertion](self, "assertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = -[_EFBackgroundProcessingAssertion incrementAssertionForDuration:outResetCount:error:]((uint64_t)v7, &v11, a4, a3);

  if ((_DWORD)a4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__EFProtectedFile_requestBackgroundProcessingForDuration_error___block_invoke;
    v10[3] = &unk_1E62A6E10;
    v10[4] = self;
    v10[5] = v11;
    +[EFCancelationToken tokenWithCancelationBlock:](EFCancelationToken, "tokenWithCancelationBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void __64__EFProtectedFile_requestBackgroundProcessingForDuration_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "assertion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[_EFBackgroundProcessingAssertion decrementAssertionWithResetCount:]((uint64_t)v2, *(_QWORD *)(a1 + 40));

}

- (_EFProtectedFile)file
{
  return self->_file;
}

- (_EFBackgroundProcessingAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end
