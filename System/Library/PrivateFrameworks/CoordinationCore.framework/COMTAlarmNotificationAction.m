@implementation COMTAlarmNotificationAction

- (COMTAlarmNotificationAction)initWithReason:(id)a3 alarms:(id)a4
{
  id v6;
  id v7;
  COMTAlarmNotificationAction *v8;
  uint64_t v9;
  NSString *reason;
  uint64_t v11;
  NSArray *alarms;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMTAlarmNotificationAction;
  v8 = -[COMTAction init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    alarms = v8->_alarms;
    v8->_alarms = (NSArray *)v11;

  }
  return v8;
}

- (COMTAlarmNotificationAction)initWithCoder:(id)a3
{
  id v4;
  COMTAlarmNotificationAction *v5;
  uint64_t v6;
  NSString *reason;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *alarms;
  COMTAlarmNotificationAction *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)COMTAlarmNotificationAction;
  v5 = -[COMTAction initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v6 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    if (!-[NSString length](v5->_reason, "length"))
    {
LABEL_14:
      v18 = 0;
      goto LABEL_15;
    }
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("alarms"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v11;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_14;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v14)
          continue;
        break;
      }
    }

    alarms = v5->_alarms;
    v5->_alarms = v12;

  }
  v18 = v5;
LABEL_15:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)COMTAlarmNotificationAction;
  v4 = a3;
  -[COMTAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[COMTAlarmNotificationAction reason](self, "reason", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("reason"));

  -[COMTAlarmNotificationAction alarms](self, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("alarms"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTAlarmNotificationAction;
  if (-[COMTAction isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[COMTAlarmNotificationAction reason](self, "reason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reason");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[COMTAlarmNotificationAction alarms](self, "alarms");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "alarms");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
