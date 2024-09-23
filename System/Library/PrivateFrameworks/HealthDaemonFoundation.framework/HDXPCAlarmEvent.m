@implementation HDXPCAlarmEvent

+ (id)_eventWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:fireDate:isUserVisible:", v4, v6, 0);

  return v7;
}

- (HDXPCAlarmEvent)initWithName:(id)a3 fireDate:(id)a4 isUserVisible:(BOOL)a5
{
  id v8;
  id v9;
  HDXPCAlarmEvent *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSDate *fireDate;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDXPCAlarmEvent;
  v10 = -[HDXPCAlarmEvent init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    fireDate = v10->_fireDate;
    v10->_fireDate = (NSDate *)v13;

    v10->_isUserVisible = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDXPCAlarmEvent name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HDXPCAlarmEvent name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *name;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  name = self->_name;
  HDDiagnosticStringFromDate(self->_fireDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p name:%@ fireDate:%@ isUserVisible:%d>"), v4, self, name, v6, self->_isUserVisible);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
