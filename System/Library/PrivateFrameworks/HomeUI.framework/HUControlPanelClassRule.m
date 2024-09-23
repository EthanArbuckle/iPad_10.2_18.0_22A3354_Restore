@implementation HUControlPanelClassRule

+ (id)ruleWithControlItemClass:(Class)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithControlItemClass:protocol:", a3, &unk_1EF227580);
}

+ (id)ruleWithControlItemProtocol:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithControlItemClass:protocol:", objc_opt_class(), v4);

  return v5;
}

- (HUControlPanelClassRule)initWithControlItemClass:(Class)a3 protocol:(id)a4
{
  id v6;
  HUControlPanelClassRule *v7;
  HUControlPanelClassRule *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUControlPanelClassRule;
  v7 = -[HUControlPanelClassRule init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[HUControlPanelClassRule setClass:](v7, "setClass:", a3);
    -[HUControlPanelClassRule setProtocol:](v8, "setProtocol:", v6);
  }

  return v8;
}

- (BOOL)ruleMatchesItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  objc_msgSend(v4, "controlItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__HUControlPanelClassRule_ruleMatchesItem___block_invoke;
  v11[3] = &unk_1E6F4C330;
  v11[4] = self;
  v7 = objc_msgSend(v5, "na_all:", v11);

  objc_msgSend(v4, "controlItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __43__HUControlPanelClassRule_ruleMatchesItem___block_invoke_2;
  v10[3] = &unk_1E6F4C330;
  v10[4] = self;
  LOBYTE(self) = objc_msgSend(v8, "na_all:", v10);

  return v7 & self;
}

uint64_t __43__HUControlPanelClassRule_ruleMatchesItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "protocol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "conformsToProtocol:", v4);

  return v5;
}

uint64_t __43__HUControlPanelClassRule_ruleMatchesItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)priority
{
  return self->_priority;
}

- (void)setPriority:(double)a3
{
  self->_priority = a3;
}

- (Class)class
{
  return self->_class;
}

- (void)setClass:(Class)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_class, 0);
}

@end
