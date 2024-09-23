@implementation _EDReplaceReconciliationMergeHandler

+ (id)allocWithZone:(_NSZone *)a3
{
  id v6;
  objc_super v7;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot directly allocate a %@ object, use +sharedInstance instead."), a1);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_claimAutoreleasedReturnValue(), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS____EDReplaceReconciliationMergeHandler;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (_EDReplaceReconciliationMergeHandler)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___EDReplaceReconciliationMergeHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate_283 != -1)
    dispatch_once(&sharedInstance_predicate_283, block);
  return (_EDReplaceReconciliationMergeHandler *)(id)sharedInstance_sharedInstance_284;
}

- (void)dealloc
{
  uint64_t v3;
  id v4;
  objc_super v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot deallocate a %@ object."), objc_opt_class());
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_claimAutoreleasedReturnValue(), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)_EDReplaceReconciliationMergeHandler;
  -[_EDReplaceReconciliationMergeHandler dealloc](&v5, sel_dealloc);
}

- (unint64_t)handleReconciliationMergeErrorForTable:(id)a3 columnName:(id)a4 statement:(id)a5 journalRowID:(id)a6 protectedRowID:(id)a7 connection:(id)a8 rowsUpdated:(unint64_t *)a9 error:(id *)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "equalTo:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", v14, v19);
  if (objc_msgSend(v17, "executeDeleteStatement:error:", v20, a10)
    && objc_msgSend(v17, "executeUpdateStatement:error:", v15, a10))
  {
    if (!a9)
    {
      v21 = 0;
      goto LABEL_8;
    }
    v21 = 0;
    v22 = sqlite3_changes((sqlite3 *)objc_msgSend(v17, "sqlDB"));
    goto LABEL_7;
  }
  v21 = 2;
  if (a9)
  {
    v22 = 0;
LABEL_7:
    *a9 = v22;
  }
LABEL_8:

  return v21;
}

@end
