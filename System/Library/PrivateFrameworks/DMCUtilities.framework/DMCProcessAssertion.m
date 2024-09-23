@implementation DMCProcessAssertion

- (DMCProcessAssertion)initWithReason:(id)a3
{
  id v5;
  DMCProcessAssertion *v6;
  DMCProcessAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCProcessAssertion;
  v6 = -[DMCProcessAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reason, a3);
    -[DMCProcessAssertion _createAssertion](v7, "_createAssertion");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[DMCProcessAssertion _releaseAssertion](self, "_releaseAssertion");
  v3.receiver = self;
  v3.super_class = (Class)DMCProcessAssertion;
  -[DMCProcessAssertion dealloc](&v3, sel_dealloc);
}

- (void)_createAssertion
{
  NSObject *v3;
  _QWORD block[5];

  _assertionQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__DMCProcessAssertion__createAssertion__block_invoke;
  block[3] = &unk_1E4D37148;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __39__DMCProcessAssertion__createAssertion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = DMCLogObjects()[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1A4951000, v2, OS_LOG_TYPE_INFO, "Creating process assertion with reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(CFSTR("com.apple.ManagedConfiguration."), "stringByAppendingString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  v5 = os_transaction_create();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

}

- (void)_releaseAssertion
{
  NSObject *v3;
  _QWORD block[5];

  _assertionQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__DMCProcessAssertion__releaseAssertion__block_invoke;
  block[3] = &unk_1E4D37148;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __40__DMCProcessAssertion__releaseAssertion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = DMCLogObjects()[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A4951000, v2, OS_LOG_TYPE_INFO, "Releasing process assertion with reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
