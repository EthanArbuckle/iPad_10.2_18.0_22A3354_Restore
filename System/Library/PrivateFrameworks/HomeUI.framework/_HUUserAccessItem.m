@implementation _HUUserAccessItem

- (_HUUserAccessItem)initWithUser:(id)a3 resultsBlock:(id)a4
{
  id v7;
  id v8;
  _HUUserAccessItem *v9;
  _HUUserAccessItem *v10;
  void *v11;
  id resultsBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HUUserAccessItem;
  v9 = -[_HUUserAccessItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    v11 = _Block_copy(v8);
    resultsBlock = v10->_resultsBlock;
    v10->_resultsBlock = v11;

  }
  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _HUUserAccessItem *v12;

  v4 = a3;
  -[_HUUserAccessItem resultsBlock](self, "resultsBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49___HUUserAccessItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E6F4E848;
  v11 = v4;
  v12 = self;
  v7 = v4;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMUser)user
{
  return self->_user;
}

- (id)resultsBlock
{
  return self->_resultsBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
