@implementation CNChangeHistoryContactRefillStrategy

void __70___CNChangeHistoryContactRefillStrategy_fetchContactsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    +[CNChangeHistoryTriageLogger log](CNChangeHistoryTriageLogger, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __70___CNChangeHistoryContactRefillStrategy_fetchContactsWithIdentifiers___block_invoke_cold_1((uint64_t)v3, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }

}

void __70___CNChangeHistoryContactRefillStrategy_fetchContactsWithIdentifiers___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_FAULT, "Contact has empty identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
