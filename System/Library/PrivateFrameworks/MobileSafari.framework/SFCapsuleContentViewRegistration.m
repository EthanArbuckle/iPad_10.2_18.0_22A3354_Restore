@implementation SFCapsuleContentViewRegistration

- (id)createOrDequeueViewWithExistingView:(id)a3
{
  id v4;
  NSMutableSet *views;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  views = self->_views;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__SFCapsuleContentViewRegistration_createOrDequeueViewWithExistingView___block_invoke;
  v12[3] = &unk_1E21E2C68;
  v6 = v4;
  v13 = v6;
  -[NSMutableSet objectsPassingTest:](views, "objectsPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v6))
  {
    v8 = v6;
    -[NSMutableSet removeObject:](self->_views, "removeObject:", v8);
  }
  else
  {
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "anyObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](self->_views, "removeObject:", v9);
    }
    else
    {
      (*((void (**)(void))self->_createViewBlock + 2))();
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;
    if (v9 != v6)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "prepareForReuse");
      v8 = v9;
    }
  }
  v10 = v8;

  return v10;
}

- (void)enqueueView:(id)a3
{
  -[NSMutableSet addObject:](self->_views, "addObject:", a3);
}

- (SFCapsuleContentViewRegistration)initWithCreateViewBlock:(id)a3
{
  id v4;
  SFCapsuleContentViewRegistration *v5;
  uint64_t v6;
  NSMutableSet *views;
  void *v8;
  id createViewBlock;
  SFCapsuleContentViewRegistration *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCapsuleContentViewRegistration;
  v5 = -[SFCapsuleContentViewRegistration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    views = v5->_views;
    v5->_views = (NSMutableSet *)v6;

    v8 = _Block_copy(v4);
    createViewBlock = v5->_createViewBlock;
    v5->_createViewBlock = v8;

    v10 = v5;
  }

  return v5;
}

BOOL __72__SFCapsuleContentViewRegistration_createOrDequeueViewWithExistingView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "_sf_firstAncestorViewOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = !v4 || (objc_msgSend(v4, "isHidden") & 1) != 0 || *(_QWORD *)(a1 + 32) == (_QWORD)v3;

  return v6;
}

- (void)discardView:(id)a3
{
  -[NSMutableSet removeObject:](self->_views, "removeObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createViewBlock, 0);
  objc_storeStrong((id *)&self->_views, 0);
}

@end
