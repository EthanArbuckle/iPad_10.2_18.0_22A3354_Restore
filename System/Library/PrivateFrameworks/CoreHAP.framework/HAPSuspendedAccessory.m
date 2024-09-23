@implementation HAPSuspendedAccessory

- (HAPSuspendedAccessory)initWithName:(id)a3 identifier:(id)a4 type:(unint64_t)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  HAPSuspendedAccessory *v14;
  HAPSuspendedAccessory *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HAPSuspendedAccessory;
  v14 = -[HAPSuspendedAccessory init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_identifier, a4);
    v15->_type = a5;
    objc_storeStrong((id *)&v15->_queue, a6);
  }

  return v15;
}

- (void)wakeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPSuspendedAccessory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HAPIsInternalBuild();
  if (v5)
  {
    -[HAPSuspendedAccessory name](self, "name");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("<private>");
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAPSuspendedAccessory type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
