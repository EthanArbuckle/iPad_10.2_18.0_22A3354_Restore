@implementation ICASSharrowContextData

- (ICASSharrowContextData)initWithSharrowSelectedItem:(id)a3
{
  id v5;
  ICASSharrowContextData *v6;
  ICASSharrowContextData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSharrowContextData;
  v6 = -[ICASSharrowContextData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sharrowSelectedItem, a3);

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SharrowContextData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("sharrowSelectedItem");
  -[ICASSharrowContextData sharrowSelectedItem](self, "sharrowSelectedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASSharrowContextData sharrowSelectedItem](self, "sharrowSelectedItem");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)sharrowSelectedItem
{
  return self->_sharrowSelectedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharrowSelectedItem, 0);
}

@end
