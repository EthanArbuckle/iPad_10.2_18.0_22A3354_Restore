@implementation LSMIResultRegistrantServerDatabaseContextProviding

- (LSMIResultRegistrantServerDatabaseContextProviding)init
{
  objc_super v4;

  _LSAssertRunningInServer((uint64_t)"-[LSMIResultRegistrantServerDatabaseContextProviding init]");
  v4.receiver = self;
  v4.super_class = (Class)LSMIResultRegistrantServerDatabaseContextProviding;
  return -[LSMIResultRegistrantServerDatabaseContextProviding init](&v4, sel_init);
}

- (id)databaseContextWithError:(id *)a3
{
  Context *p_ctx;
  _LSDServiceDomain *v6;
  _QWORD *v7;
  LSMIResultRegistrantTrueDatabaseContext *v8;
  NSError *v9;
  _LSDServiceDomain *v10;
  uint64_t v11;

  p_ctx = &self->_ctx;
  +[_LSDServiceDomain defaultServiceDomain]();
  v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)p_ctx, v6, 0);

  if (v7)
  {
    v8 = -[LSMIResultRegistrantTrueDatabaseContext initWithDatabase:]([LSMIResultRegistrantTrueDatabaseContext alloc], "initWithDatabase:", *v7);
    v9 = 0;
    if (!a3)
      goto LABEL_10;
    goto LABEL_8;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)p_ctx, v10, 0);

  if (v11)
    v9 = 0;
  else
    v9 = self->_ctx._error;
  v8 = 0;
  if (a3)
  {
LABEL_8:
    if (!v8)
      *a3 = objc_retainAutorelease(v9);
  }
LABEL_10:

  return v8;
}

- (void)armSaveTimerIfNecessary:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__LSMIResultRegistrantServerDatabaseContextProviding_armSaveTimerIfNecessary___block_invoke;
  v5[3] = &unk_1E1045718;
  v6 = v3;
  v4 = v3;
  _LSArmSaveTimerWithObserver(5, v5);

}

void __78__LSMIResultRegistrantServerDatabaseContextProviding_armSaveTimerIfNecessary___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  LSMIResultRegistrantTrueDatabaseContext *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
    v7 = -[LSMIResultRegistrantTrueDatabaseContext initWithDatabase:]([LSMIResultRegistrantTrueDatabaseContext alloc], "initWithDatabase:", v8);
  else
    v7 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  LSContext *contextPointer;
  _LSDatabase *db;
  NSError *error;

  contextPointer = self->_ctx._contextPointer;
  if (contextPointer && self->_ctx._created)
    _LSContextDestroy((void **)&contextPointer->db);
  db = self->_ctx._contextStorage.db;
  self->_ctx._contextPointer = 0;
  self->_ctx._contextStorage.db = 0;

  self->_ctx._created = 0;
  error = self->_ctx._error;
  self->_ctx._error = 0;

}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_BYTE *)self + 24) = 0;
  return self;
}

@end
