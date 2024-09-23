@implementation NPKStandaloneProvisioningNumericEntryCoordinator

- (void)requestNumericInputForFields:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSMutableArray *v9;
  NSMutableArray *completedFields;
  void *v11;
  id completionHandler;

  objc_storeStrong((id *)&self->_providedFields, a3);
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  completedFields = self->_completedFields;
  self->_completedFields = v9;

  v11 = (void *)MEMORY[0x2199B6780](v8);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v11;

  self->_currentIndex = 0;
  -[NPKStandaloneProvisioningNumericEntryCoordinator _showCurrentPasscodePromptOrComplete](self, "_showCurrentPasscodePromptOrComplete");
}

- (void)invalidate
{
  id completionHandler;
  NSArray *providedFields;
  NSMutableArray *completedFields;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  providedFields = self->_providedFields;
  self->_providedFields = 0;

  completedFields = self->_completedFields;
  self->_completedFields = 0;

}

- (void)_showNextPasscodePromptOrComplete
{
  ++self->_currentIndex;
  -[NPKStandaloneProvisioningNumericEntryCoordinator _showCurrentPasscodePromptOrComplete](self, "_showCurrentPasscodePromptOrComplete");
}

- (void)_showCurrentPasscodePromptOrComplete
{
  unint64_t currentIndex;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[16];

  currentIndex = self->_currentIndex;
  if (currentIndex >= -[NSArray count](self->_providedFields, "count"))
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Numeric entry complete; invoking completion handler",
          v7,
          2u);
      }

    }
    -[NPKStandaloneProvisioningNumericEntryCoordinator _invokeCompletionHandler](self, "_invokeCompletionHandler");
  }
  else
  {
    -[NPKStandaloneProvisioningNumericEntryCoordinator _invokeCompletionHandler](self, "_invokeCompletionHandler");
  }
}

- (void)_invokeCompletionHandler
{
  id completionHandler;
  NSArray *providedFields;
  void (**v5)(id, NSMutableArray *);

  v5 = (void (**)(id, NSMutableArray *))MEMORY[0x2199B6780](self->_completionHandler, a2);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  if (v5)
    v5[2](v5, self->_completedFields);
  providedFields = self->_providedFields;
  self->_providedFields = 0;

}

- (NSArray)providedFields
{
  return self->_providedFields;
}

- (void)setProvidedFields:(id)a3
{
  objc_storeStrong((id *)&self->_providedFields, a3);
}

- (NSMutableArray)completedFields
{
  return self->_completedFields;
}

- (void)setCompletedFields:(id)a3
{
  objc_storeStrong((id *)&self->_completedFields, a3);
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_completedFields, 0);
  objc_storeStrong((id *)&self->_providedFields, 0);
}

@end
