@implementation ZN8Espresso16ANERuntimeEngine8compiler24compilation

Espresso *___ZN8Espresso16ANERuntimeEngine8compiler24compilation_cache_existsEv_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  Espresso *v5;
  const char *v6;
  NSObject *v7;
  std::runtime_error *exception;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x58uLL);
    Espresso::invalid_state_error::invalid_state_error(exception);
  }
  v5 = (Espresso *)objc_msgSend(*(id *)(a1 + 32), "compiledModelExistsFor:", v4);
  Espresso::espresso_os_log_subsystem(v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v4;
    v12 = 1024;
    v13 = (int)v5;
    _os_log_debug_impl(&dword_190DAF000, v7, OS_LOG_TYPE_DEBUG, "compiledModelExistsFor:ane_model=%@ exists=%D", (uint8_t *)&v10, 0x12u);
  }

  return v5;
}

@end
