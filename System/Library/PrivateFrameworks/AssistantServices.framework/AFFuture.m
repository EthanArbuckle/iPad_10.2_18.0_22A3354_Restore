@implementation AFFuture

- (id)initAndGetSetterBlock:(id *)a3
{
  id v4;
  dispatch_group_t v5;
  void *v6;
  AFOneArgumentSafetyBlock *v7;
  uint64_t v8;
  AFOneArgumentSafetyBlock *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  AFOneArgumentSafetyBlock *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AFFuture;
  v4 = -[AFFuture init](&v23, sel_init);
  if (v4)
  {
    v5 = dispatch_group_create();
    v6 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v5;

    dispatch_group_enter(*((dispatch_group_t *)v4 + 1));
    v7 = [AFOneArgumentSafetyBlock alloc];
    v8 = MEMORY[0x1E0C809B0];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __34__AFFuture_initAndGetSetterBlock___block_invoke;
    v21 = &unk_1E3A31158;
    v22 = v4;
    v13 = v8;
    v14 = 3221225472;
    v15 = __34__AFFuture_initAndGetSetterBlock___block_invoke_2;
    v16 = &unk_1E3A31158;
    v17 = -[AFOneArgumentSafetyBlock initWithBlock:](v7, "initWithBlock:", &v18);
    v9 = v17;
    v10 = (void *)MEMORY[0x1A1AC0C3C](&v13);
    v11 = v10;
    if (a3)
      *a3 = (id)objc_msgSend(v10, "copy", v13, v14, v15, v16, v17, v18, v19, v20, v21);

  }
  return v4;
}

- (id)waitForValue:(unint64_t)a3
{
  id v4;

  if (dispatch_group_wait((dispatch_group_t)self->_group, a3))
    v4 = 0;
  else
    v4 = self->_value;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

void __34__AFFuture_initAndGetSetterBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));

}

uint64_t __34__AFFuture_initAndGetSetterBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

@end
