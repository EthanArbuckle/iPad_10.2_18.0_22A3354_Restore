@implementation CNUINullSaveExecutor

- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4
{
  id v5;
  NSObject *v6;
  CNUIContactSaveResult *v7;
  void *v8;
  CNUIContactSaveResult *v9;
  int v11;
  CNUINullSaveExecutor *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CNUILogContactCard();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134349056;
    v12 = self;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEFAULT, "[CNUINullSaveExecutor] %{public}p will execute save…", (uint8_t *)&v11, 0xCu);
  }

  v7 = [CNUIContactSaveResult alloc];
  objc_msgSend(v5, "mutableContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CNUIContactSaveResult initWithSuccess:contact:identifiersOfIssuedSaveRequests:](v7, "initWithSuccess:contact:identifiersOfIssuedSaveRequests:", 1, v8, MEMORY[0x1E0C9AA60]);
  return v9;
}

@end
