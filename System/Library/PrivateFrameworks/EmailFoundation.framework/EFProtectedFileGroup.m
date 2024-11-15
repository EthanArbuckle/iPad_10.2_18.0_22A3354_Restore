@implementation EFProtectedFileGroup

id *__69__EFProtectedFileGroup_initWithFilePaths_isSensitive_protectionType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;

  v3 = a2;
  v4 = -[_EFProtectedFile initWithFilePath:isSensitive:protectionType:]((id *)[_EFProtectedFile alloc], v3, *(_BYTE *)(a1 + 40), *(void **)(a1 + 32));

  return v4;
}

- (EFProtectedFileGroup)initWithFilePaths:(id)a3 protectionType:(id)a4
{
  return -[EFProtectedFileGroup initWithFilePaths:isSensitive:protectionType:](self, "initWithFilePaths:isSensitive:protectionType:", a3, 0, a4);
}

- (EFProtectedFileGroup)initWithFilePaths:(id)a3 isSensitive:(BOOL)a4 protectionType:(id)a5
{
  id v8;
  id v9;
  EFProtectedFileGroup *v10;
  uint64_t v11;
  NSArray *files;
  _EFBackgroundProcessingAssertion *v13;
  _EFBackgroundProcessingAssertion *assertion;
  _QWORD v16[4];
  id v17;
  BOOL v18;
  objc_super v19;

  v8 = a3;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EFProtectedFileGroup;
  v10 = -[EFProtectedFileGroup init](&v19, sel_init);
  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__EFProtectedFileGroup_initWithFilePaths_isSensitive_protectionType___block_invoke;
    v16[3] = &unk_1E62A6E38;
    v18 = a4;
    v17 = v9;
    objc_msgSend(v8, "ef_map:", v16);
    v11 = objc_claimAutoreleasedReturnValue();
    files = v10->_files;
    v10->_files = (NSArray *)v11;

    v13 = (_EFBackgroundProcessingAssertion *)-[_EFBackgroundProcessingAssertion initWithProtectedFiles:]([_EFBackgroundProcessingAssertion alloc], v10->_files);
    assertion = v10->_assertion;
    v10->_assertion = v13;

  }
  return v10;
}

- (EFProtectedFileGroup)initWithSensitiveFilePaths:(id)a3 protectionType:(id)a4
{
  return -[EFProtectedFileGroup initWithFilePaths:isSensitive:protectionType:](self, "initWithFilePaths:isSensitive:protectionType:", a3, 1, a4);
}

- (BOOL)backgroundProcessingIsAllowed
{
  os_unfair_lock_s *v2;
  unsigned __int8 v3;

  -[EFProtectedFileGroup assertion](self, "assertion");
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
  -[EFProtectedFileGroup assertion](self, "assertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = -[_EFBackgroundProcessingAssertion incrementAssertionForDuration:outResetCount:error:]((uint64_t)v7, &v11, a4, a3);

  if ((_DWORD)a4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__EFProtectedFileGroup_requestBackgroundProcessingForDuration_error___block_invoke;
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

void __69__EFProtectedFileGroup_requestBackgroundProcessingForDuration_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "assertion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[_EFBackgroundProcessingAssertion decrementAssertionWithResetCount:]((uint64_t)v2, *(_QWORD *)(a1 + 40));

}

- (NSArray)files
{
  return self->_files;
}

- (_EFBackgroundProcessingAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_files, 0);
}

@end
