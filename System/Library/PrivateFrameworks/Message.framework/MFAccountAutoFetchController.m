@implementation MFAccountAutoFetchController

- (void)fetchNow:(int)a3 withMailboxes:(id)a4 fromAccount:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  uint8_t v17[24];
  uint64_t v18;

  v8 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "taskManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "fetchNow:withMailboxes:completion:", v8, v9, v11);
  }
  else
  {
    if (_ef_log_MFAccountAutoFetchController_onceToken != -1)
      dispatch_once(&_ef_log_MFAccountAutoFetchController_onceToken, &__block_literal_global_19);
    v14 = (id)_ef_log_MFAccountAutoFetchController_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAccountAutoFetchController fetchNow:withMailboxes:fromAccount:completion:].cold.1(v16, v17, v14);
    }

  }
}

void ___ef_log_MFAccountAutoFetchController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MFAccountAutoFetchController");
  v1 = (void *)_ef_log_MFAccountAutoFetchController_log;
  _ef_log_MFAccountAutoFetchController_log = (uint64_t)v0;

}

- (void)fetchNow:(os_log_t)log withMailboxes:fromAccount:completion:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Trying to fetch with %@ account that doesn't have a task manager", buf, 0xCu);

}

@end
