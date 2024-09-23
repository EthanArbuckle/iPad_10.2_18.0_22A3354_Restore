@implementation _EDDeleteReconciliationMergeHandler

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
  v7.super_class = (Class)&OBJC_METACLASS____EDDeleteReconciliationMergeHandler;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (_EDDeleteReconciliationMergeHandler)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___EDDeleteReconciliationMergeHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, block);
  return (_EDDeleteReconciliationMergeHandler *)(id)sharedInstance_sharedInstance;
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
  v5.super_class = (Class)_EDDeleteReconciliationMergeHandler;
  -[_EDDeleteReconciliationMergeHandler dealloc](&v5, sel_dealloc);
}

- (unint64_t)handleReconciliationMergeErrorForTable:(id)a3 columnName:(id)a4 statement:(id)a5 journalRowID:(id)a6 protectedRowID:(id)a7 connection:(id)a8 rowsUpdated:(unint64_t *)a9 error:(id *)a10
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;

  v13 = a3;
  v14 = a6;
  v15 = a8;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "equalTo:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", v13, v17);
  if (objc_msgSend(v15, "executeDeleteStatement:error:", v18, a10))
  {
    if (!a9)
    {
      v19 = 0;
      goto LABEL_8;
    }
    v19 = 0;
    v20 = sqlite3_changes((sqlite3 *)objc_msgSend(v15, "sqlDB"));
    goto LABEL_6;
  }
  v19 = 2;
  if (a9)
  {
    v20 = 0;
LABEL_6:
    *a9 = v20;
  }
LABEL_8:

  return v19;
}

@end
