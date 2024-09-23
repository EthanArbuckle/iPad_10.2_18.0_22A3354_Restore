@implementation BKSProcessAssertionSetExpirationHandler

void __BKSProcessAssertionSetExpirationHandler_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v1 = (void *)BKSProcessAssertionSetExpirationHandler__observers;
  BKSProcessAssertionSetExpirationHandler__observers = v0;

}

void __BKSProcessAssertionSetExpirationHandler_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void (**v5)(_QWORD);
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  rbs_shim_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x1B5E0B334](*(_QWORD *)(a1 + 40));
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B0792000, v2, OS_LOG_TYPE_DEFAULT, "BKSProcessAssertionSetExpirationHandler fired: %@", (uint8_t *)&v6, 0xCu);

  }
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(void (***)(_QWORD))(a1 + 40);
  if (v4)
    dispatch_async(v4, v5);
  else
    v5[2](*(_QWORD *)(a1 + 40));
}

@end
