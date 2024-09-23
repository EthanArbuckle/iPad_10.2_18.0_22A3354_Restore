@implementation HUControlPanelFilterRule

+ (id)ruleWithFilter:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilter:", v4);

  return v5;
}

- (HUControlPanelFilterRule)initWithFilter:(id)a3
{
  id v4;
  HUControlPanelFilterRule *v5;
  HUControlPanelFilterRule *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUControlPanelFilterRule;
  v5 = -[HUControlPanelFilterRule init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HUControlPanelFilterRule setFilter:](v5, "setFilter:", v4);

  return v6;
}

- (BOOL)ruleMatchesItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;

  v4 = a3;
  -[HUControlPanelFilterRule filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HUControlPanelFilterRule filter](self, "filter");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)priority
{
  return self->_priority;
}

- (void)setPriority:(double)a3
{
  self->_priority = a3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
}

@end
