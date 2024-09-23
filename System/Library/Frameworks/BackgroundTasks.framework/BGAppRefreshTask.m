@implementation BGAppRefreshTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BGAppRefreshTask;
  return -[BGTask _initWithIdentifier:activity:](&v5, sel__initWithIdentifier_activity_, a3, a4);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[BGTask identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<BGAppRefreshTask: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTaskCompletedWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (a3)
  {
    -[BGTask _activity](self, "_activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = &__block_literal_global;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  -[BGTask _setTaskCompletedWithSuccess:actionsIfNotAlreadyCompleted:](self, "_setTaskCompletedWithSuccess:actionsIfNotAlreadyCompleted:", v3, v6);
}

double __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke()
{
  Class v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t (**v4)(_QWORD);
  void *v5;
  int v6;
  int v7;
  double v8;
  _QWORD block[4];
  uint64_t (**v11)(_QWORD);
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[4];
  id v18;

  v0 = NSClassFromString(CFSTR("UIApplication"));
  if (!v0)
    return 0.0;
  -[objc_class sharedApplication](v0, "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke_2;
  v17[3] = &unk_24CC62140;
  v3 = v1;
  v18 = v3;
  v4 = (uint64_t (**)(_QWORD))MEMORY[0x212BE0554](v17);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainThread");

  if (v6)
  {
    v7 = v4[2](v4);
    *((_BYTE *)v14 + 24) = v7;
  }
  else
  {
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke_3;
    block[3] = &unk_24CC62168;
    v12 = &v13;
    v11 = v4;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

    v7 = *((unsigned __int8 *)v14 + 24);
  }
  if (v7)
    v8 = 0.1;
  else
    v8 = 0.0;
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke_2(uint64_t a1)
{
  int v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_appAdoptsUISceneLifecycle");
  if ((v2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotForBackgroundApplication:", 1);
  return v2 ^ 1u;
}

uint64_t __48__BGAppRefreshTask_setTaskCompletedWithSuccess___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
