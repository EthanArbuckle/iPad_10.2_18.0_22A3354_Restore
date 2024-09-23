@implementation BRWaitForFPFSMigrationOperation

- (BRWaitForFPFSMigrationOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRWaitForFPFSMigrationOperation;
  return -[BROperation init](&v3, sel_init);
}

- (void)main
{
  OUTLINED_FUNCTION_3(&dword_19CBF0000, a2, a3, "[DEBUG] We are in Legacy, no need to wait for migration%@", a5, a6, a7, a8, 2u);
}

uint64_t __39__BRWaitForFPFSMigrationOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id fpfsMigrationCompletion;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v12;

  v6 = a4;
  fpfsMigrationCompletion = self->_fpfsMigrationCompletion;
  v8 = a3;
  v9 = MEMORY[0x1A1AD85E4](fpfsMigrationCompletion);
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    v11 = self->_fpfsMigrationCompletion;
    self->_fpfsMigrationCompletion = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)BRWaitForFPFSMigrationOperation;
  -[BROperation finishWithResult:error:](&v12, sel_finishWithResult_error_, v8, v6);

}

- (id)fpfsMigrationCompletion
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setFpfsMigrationCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fpfsMigrationCompletion, 0);
}

@end
