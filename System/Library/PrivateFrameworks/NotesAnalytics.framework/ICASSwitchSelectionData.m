@implementation ICASSwitchSelectionData

- (ICASSwitchSelectionData)initWithSwitchSelectionType:(id)a3
{
  id v5;
  ICASSwitchSelectionData *v6;
  ICASSwitchSelectionData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSwitchSelectionData;
  v6 = -[ICASSwitchSelectionData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_switchSelectionType, a3);

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SwitchSelectionData");
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
  v8 = CFSTR("switchSelectionType");
  -[ICASSwitchSelectionData switchSelectionType](self, "switchSelectionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASSwitchSelectionData switchSelectionType](self, "switchSelectionType");
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

- (ICASSwitchSelectionType)switchSelectionType
{
  return self->_switchSelectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchSelectionType, 0);
}

@end
