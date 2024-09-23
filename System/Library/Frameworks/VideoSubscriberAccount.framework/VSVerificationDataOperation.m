@implementation VSVerificationDataOperation

- (VSVerificationDataOperation)init
{
  VSVerificationDataOperation *v2;
  AKAnisetteProvisioningController *v3;
  AKAnisetteProvisioningController *provisioningController;
  VSOptional *v5;
  VSOptional *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSVerificationDataOperation;
  v2 = -[VSVerificationDataOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = (AKAnisetteProvisioningController *)objc_alloc_init(MEMORY[0x1E0D00120]);
    provisioningController = v2->_provisioningController;
    v2->_provisioningController = v3;

    v5 = objc_alloc_init(VSOptional);
    v6 = v2->_result;
    v2->_result = v5;

  }
  return v2;
}

- (void)_finishWithData:(id)a3
{
  void *v4;
  void *v5;

  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVerificationDataOperation setResult:](self, "setResult:", v5);

  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  VSErrorLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[VSVerificationDataOperation _finishWithError:].cold.1((uint64_t)v4, v5);

  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVerificationDataOperation setResult:](self, "setResult:", v7);

  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)_finishWithResult:(int)a3 bytes:(char *)a4 length:(unsigned int)a5
{
  id v7;

  if (a3 || !a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[VSVerificationDataOperation _finishWithError:](self, "_finishWithError:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    jEHf8Xzsv8K((uint64_t)a4);
    -[VSVerificationDataOperation _finishWithData:](self, "_finishWithData:", v7);
  }

}

- (void)executionDidBegin
{
  uint64_t v3;
  void *v5;
  _QWORD v6[5];
  unsigned int v7;
  uint64_t v8;

  v8 = 0;
  v7 = 0;
  pggRSNuJfiTW0g((uint64_t)&v8, (uint64_t)&v7);
  if ((_DWORD)v3 == -45061 || (_DWORD)v3 == -45065)
  {
    -[VSVerificationDataOperation provisioningController](self, "provisioningController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__VSVerificationDataOperation_executionDidBegin__block_invoke;
    v6[3] = &unk_1E93A07D0;
    v6[4] = self;
    objc_msgSend(v5, "provisionWithCompletion:", v6);

  }
  else
  {
    -[VSVerificationDataOperation _finishWithResult:bytes:length:](self, "_finishWithResult:bytes:length:", v3, v8, v7);
  }
}

void __48__VSVerificationDataOperation_executionDidBegin__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v9 = 0;
    v8 = 0;
    pggRSNuJfiTW0g((uint64_t)&v9, (uint64_t)&v8);
    objc_msgSend(*(id *)(a1 + 32), "_finishWithResult:bytes:length:", v7, v9, v8);
  }
  else
  {
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorOrNil parameter must not be nil."));
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v6);
  }

}

- (VSOptional)result
{
  return (VSOptional *)objc_getProperty(self, a2, 256, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (AKAnisetteProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)_finishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain verification data: %@", (uint8_t *)&v2, 0xCu);
}

@end
