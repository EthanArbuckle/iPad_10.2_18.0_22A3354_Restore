@implementation BSBlockTransaction

- (id)_descriptionProem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  -[BSBlockTransaction debugName](self, "debugName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v10.receiver = self;
    v10.super_class = (Class)BSBlockTransaction;
    -[BSTransaction _descriptionProem](&v10, sel__descriptionProem);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSBlockTransaction debugName](self, "debugName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: %@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BSBlockTransaction;
    -[BSTransaction _descriptionProem](&v9, sel__descriptionProem);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

uint64_t __28__BSBlockTransaction__begin__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "satisfyMilestone:", CFSTR("awaitingCompletion"));
  else
    return objc_msgSend(v2, "failWithReason:", CFSTR("Completion block indicated failure."));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong(&self->_block, 0);
}

- (BSBlockTransaction)initWithBlock:(id)a3
{
  BSBlockTransaction *v5;
  uint64_t v6;
  id block;
  void *v10;
  objc_super v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSBlockTransaction.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v11.receiver = self;
  v11.super_class = (Class)BSBlockTransaction;
  v5 = -[BSTransaction init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(a3, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)_begin
{
  void (**block)(void);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, int);
  void *v8;
  BSBlockTransaction *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BSBlockTransaction;
  -[BSTransaction _begin](&v10, sel__begin);
  -[BSTransaction addMilestone:](self, "addMilestone:", CFSTR("awaitingCompletion"));
  block = (void (**)(void))self->_block;
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __28__BSBlockTransaction__begin__block_invoke;
  v8 = &unk_1E1EBF6A0;
  v9 = self;
  block[2]();
  v4 = self->_block;
  self->_block = 0;

}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (id)_graphNodeDebugName
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[BSBlockTransaction debugName](self, "debugName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSBlockTransaction debugName](self, "debugName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@(%@)"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BSBlockTransaction;
    -[BSTransaction _graphNodeDebugName](&v10, sel__graphNodeDebugName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
