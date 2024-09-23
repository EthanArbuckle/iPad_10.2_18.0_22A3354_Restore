@implementation COMTAlarmReadResult

- (COMTAlarmReadResult)initWithAlarms:(id)a3 actionIdentifier:(id)a4
{
  id v6;
  COMTAlarmReadResult *v7;
  uint64_t v8;
  NSArray *alarms;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTAlarmReadResult;
  v7 = -[COMTResult initWithActionIdentifier:](&v11, sel_initWithActionIdentifier_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    alarms = v7->_alarms;
    v7->_alarms = (NSArray *)v8;

  }
  return v7;
}

- (COMTAlarmReadResult)initWithCoder:(id)a3
{
  id v4;
  COMTAlarmReadResult *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *alarms;
  COMTAlarmReadResult *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)COMTAlarmReadResult;
  v5 = -[COMTResult initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARA"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v16 = 0;
            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v12)
          continue;
        break;
      }
    }

    alarms = v5->_alarms;
    v5->_alarms = v10;

  }
  v16 = v5;
LABEL_13:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMTAlarmReadResult;
  v4 = a3;
  -[COMTResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTAlarmReadResult alarms](self, "alarms", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ARA"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarms, 0);
}

@end
