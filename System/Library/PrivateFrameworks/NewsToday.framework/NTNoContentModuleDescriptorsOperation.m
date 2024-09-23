@implementation NTNoContentModuleDescriptorsOperation

- (BOOL)validateOperation
{
  void *v2;

  -[NTTodayModuleDescriptorsOperation descriptorsCompletion](self, "descriptorsCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNoContentModuleDescriptorsOperation validateOperation].cold.1();
  return v2 != 0;
}

- (void)performOperation
{
  -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTTodayModuleDescriptorsOperation descriptorsCompletion](self, "descriptorsCompletion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))v5 + 2))(v5, MEMORY[0x24BDBD1A8], 0, v4);

}

- (void)validateOperation
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("module descriptors operation requires completion"));
  v1 = 136315906;
  v2 = "-[NTNoContentModuleDescriptorsOperation validateOperation]";
  v3 = 2080;
  v4 = "NTNoContentModuleDescriptorsOperation.m";
  v5 = 1024;
  v6 = 19;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
