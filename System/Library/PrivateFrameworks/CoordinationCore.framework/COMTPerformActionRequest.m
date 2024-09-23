@implementation COMTPerformActionRequest

- (COMTPerformActionRequest)initWithActions:(id)a3
{
  id v4;
  COMTPerformActionRequest *v5;
  uint64_t v6;
  NSArray *actions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTPerformActionRequest;
  v5 = -[COMessageChannelRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;

  }
  return v5;
}

- (COMTPerformActionRequest)initWithCoder:(id)a3
{
  id v4;
  COMTPerformActionRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *actions;
  COMTPerformActionRequest *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)COMTPerformActionRequest;
  v5 = -[COMessageChannelRequest initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("PA"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v17 = 0;
            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v12)
          continue;
        break;
      }
    }

    v15 = objc_msgSend(v10, "copy");
    actions = v5->_actions;
    v5->_actions = (NSArray *)v15;

  }
  v17 = v5;
LABEL_13:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMTPerformActionRequest;
  v4 = a3;
  -[COMessageChannelRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTPerformActionRequest actions](self, "actions", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PA"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
