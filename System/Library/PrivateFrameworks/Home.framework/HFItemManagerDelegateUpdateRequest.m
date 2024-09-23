@implementation HFItemManagerDelegateUpdateRequest

- (HFItemManagerDelegateUpdateRequest)initWithChanges:(id)a3 isInitialUpdate:(BOOL)a4 applyChangesBlock:(id)a5 issueDelegateMessagesBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  HFItemManagerDelegateUpdateRequest *v14;
  HFItemManagerDelegateUpdateRequest *v15;
  void *v16;
  id applyChangesBlock;
  void *v18;
  id issueDelegateMessagesBlock;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HFItemManagerDelegateUpdateRequest;
  v14 = -[HFItemManagerDelegateUpdateRequest init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_changes, a3);
    v15->_initialUpdate = a4;
    v16 = _Block_copy(v12);
    applyChangesBlock = v15->_applyChangesBlock;
    v15->_applyChangesBlock = v16;

    v18 = _Block_copy(v13);
    issueDelegateMessagesBlock = v15->_issueDelegateMessagesBlock;
    v15->_issueDelegateMessagesBlock = v18;

  }
  return v15;
}

- (BOOL)debug_wasPerformed
{
  return self->_debug_wasPerformed;
}

- (void)performWithOptions:(unint64_t)a3
{
  char v3;
  void (**v5)(void);
  void (**v6)(void);

  v3 = a3;
  -[HFItemManagerDelegateUpdateRequest applyChangesBlock](self, "applyChangesBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

  if ((v3 & 1) == 0)
  {
    -[HFItemManagerDelegateUpdateRequest issueDelegateMessagesBlock](self, "issueDelegateMessagesBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
  self->_debug_wasPerformed = 1;
}

- (id)issueDelegateMessagesBlock
{
  return self->_issueDelegateMessagesBlock;
}

- (id)applyChangesBlock
{
  return self->_applyChangesBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_issueDelegateMessagesBlock, 0);
  objc_storeStrong(&self->_applyChangesBlock, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

- (HFItemManagerDelegateUpdateRequest)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithChanges_isInitialUpdate_applyChangesBlock_issueDelegateMessagesBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemManager.m"), 101, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFItemManagerDelegateUpdateRequest init]",
    v5);

  return 0;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[HFItemManagerDelegateUpdateRequest isInitialUpdate](self, "isInitialUpdate"), CFSTR("isInitialUpdate"), 1);
  -[HFItemManagerDelegateUpdateRequest changes](self, "changes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("changes"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HFGroupedItemDiff)changes
{
  return self->_changes;
}

- (BOOL)isInitialUpdate
{
  return self->_initialUpdate;
}

@end
