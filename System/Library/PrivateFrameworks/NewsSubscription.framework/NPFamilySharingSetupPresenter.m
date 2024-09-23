@implementation NPFamilySharingSetupPresenter

- (void)presentFamilySharingSetupWith:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0D20ED8];
  v4 = a3;
  v5 = [v3 alloc];
  v7 = (id)objc_msgSend(v5, "initWithEventType:", *MEMORY[0x1E0D20ED0]);
  objc_msgSend(v7, "setClientName:", CFSTR("AppleNewsPlus"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20EE0]), "initWithPresenter:", v4);

  objc_msgSend(v6, "performWithContext:completion:", v7, &__block_literal_global);
}

void __63__NPFamilySharingSetupPresenter_presentFamilySharingSetupWith___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0D58748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D58748], OS_LOG_TYPE_ERROR))
      __63__NPFamilySharingSetupPresenter_presentFamilySharingSetupWith___block_invoke_cold_1(v4, v2);
  }

}

void __63__NPFamilySharingSetupPresenter_presentFamilySharingSetupWith___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1BA2EF000, v3, OS_LOG_TYPE_ERROR, "Failed to launch family setup UI with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
