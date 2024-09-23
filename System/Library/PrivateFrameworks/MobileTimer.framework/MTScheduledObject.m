@implementation MTScheduledObject

+ (id)scheduledObjectForScheduleable:(id)a3 trigger:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScheduleable:trigger:", v7, v6);

  return v8;
}

- (MTScheduledObject)initWithScheduleable:(id)a3 trigger:(id)a4
{
  id v6;
  id v7;
  MTScheduledObject *v8;
  uint64_t v9;
  MTScheduleable *scheduleable;
  uint64_t v11;
  MTTrigger *trigger;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTScheduledObject;
  v8 = -[MTScheduledObject init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    scheduleable = v8->_scheduleable;
    v8->_scheduleable = (MTScheduleable *)v9;

    v11 = objc_msgSend(v7, "copy");
    trigger = v8->_trigger;
    v8->_trigger = (MTTrigger *)v11;

  }
  return v8;
}

- (unint64_t)type
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[MTScheduledObject trigger](self, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "scheduledTypeForTriggerType:", objc_msgSend(v4, "triggerType"));

  return v5;
}

- (BOOL)isVisible
{
  return -[MTScheduledObject type](self, "type") != 2;
}

+ (unint64_t)scheduledTypeForTriggerType:(unint64_t)a3
{
  if (a3 - 2 > 6)
    return 0;
  else
    return qword_19ACFEDD0[a3 - 2];
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTScheduledObject scheduleable](self, "scheduleable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTScheduledObject trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@, Trigger: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MTScheduledObject scheduleable](self, "scheduleable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MTScheduledObject trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = -[MTScheduledObject isEqualToScheduledObject:](self, "isEqualToScheduledObject:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)isEqualToScheduledObject:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(v6, "scheduleable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTScheduledObject scheduleable](self, "scheduleable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    objc_msgSend(v6, "scheduleable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTScheduledObject scheduleable](self, "scheduleable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v9 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(v6, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTScheduledObject trigger](self, "trigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTScheduledObject trigger](self, "trigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "isEqual:", v13);

  }
  if (v7 != v8)
    goto LABEL_8;
LABEL_9:

  return v9;
}

- (MTScheduleable)scheduleable
{
  return self->_scheduleable;
}

- (void)setScheduleable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_scheduleable, 0);
}

@end
