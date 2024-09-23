@implementation FBSProcessWatchdogPolicy

- (NSArray)provisions
{
  return self->_provisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisions, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)description
{
  return (NSString *)-[FBSProcessWatchdogPolicy descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (FBSProcessWatchdogPolicy)policyWithProvisions:(id)a3
{
  return (FBSProcessWatchdogPolicy *)objc_msgSend(a1, "policyWithName:forProvisions:", 0, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setProvisions:", self->_provisions);
  return v4;
}

+ (FBSProcessWatchdogPolicy)policyWithName:(id)a3 forProvisions:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setName:", v7);

  objc_msgSend(v8, "setProvisions:", v6);
  return (FBSProcessWatchdogPolicy *)v8;
}

- (void)setProvisions:(id)a3
{
  objc_class *v4;
  id v5;
  NSArray *v6;
  NSArray *provisions;

  if (self->_provisions != a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99D20];
    v5 = a3;
    v6 = (NSArray *)objc_msgSend([v4 alloc], "initWithArray:copyItems:", v5, 1);

    provisions = self->_provisions;
    self->_provisions = v6;

  }
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

uint64_t __66__FBSProcessWatchdogPolicy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("provisions"), 1);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSProcessWatchdogPolicy descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  FBSProcessWatchdogPolicy *v6;
  _QWORD v8[4];
  id v9;
  FBSProcessWatchdogPolicy *v10;

  v4 = a3;
  -[FBSProcessWatchdogPolicy succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  if (-[NSArray count](v6->_provisions, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__FBSProcessWatchdogPolicy_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E38EAE08;
    v9 = v5;
    v10 = v6;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  }
  objc_sync_exit(v6);

  return v5;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_name, CFSTR("name"), 1);
  return v3;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSProcessWatchdogPolicy succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)name
{
  return self->_name;
}

@end
