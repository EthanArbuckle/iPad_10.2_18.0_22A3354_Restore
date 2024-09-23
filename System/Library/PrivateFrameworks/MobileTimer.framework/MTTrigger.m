@implementation MTTrigger

+ (MTTrigger)triggerWithDate:(id)a3 triggerType:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:type:", v6, a4);

  return (MTTrigger *)v7;
}

+ (MTTrigger)triggerWithDate:(id)a3 triggerType:(unint64_t)a4 isPastOverrideEvent:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:type:isPastOverrideEvent:", v8, a4, v5);

  return (MTTrigger *)v9;
}

- (MTTrigger)initWithDate:(id)a3 type:(unint64_t)a4 isPastOverrideEvent:(BOOL)a5
{
  id v8;
  MTTrigger *v9;
  uint64_t v10;
  NSDate *triggerDate;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTTrigger;
  v9 = -[MTTrigger init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    triggerDate = v9->_triggerDate;
    v9->_triggerDate = (NSDate *)v10;

    v9->_triggerType = a4;
    v9->_isPastOverrideEvent = a5;
  }

  return v9;
}

- (MTTrigger)initWithDate:(id)a3 type:(unint64_t)a4
{
  id v6;
  MTTrigger *v7;
  uint64_t v8;
  NSDate *triggerDate;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTTrigger;
  v7 = -[MTTrigger init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    triggerDate = v7->_triggerDate;
    v7->_triggerDate = (NSDate *)v8;

    v7->_triggerType = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[MTTrigger triggerDate](self, "triggerDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[MTTrigger triggerType](self, "triggerType") ^ v4;

  return v5;
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
    v8 = -[MTTrigger isEqualToTrigger:](self, "isEqualToTrigger:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)isEqualToTrigger:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[MTTrigger triggerType](self, "triggerType");
  if (v5 == objc_msgSend(v4, "triggerType"))
  {
    -[MTTrigger triggerDate](self, "triggerDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "triggerDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[MTTrigger triggerDate](self, "triggerDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "triggerDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTrigger)initWithCoder:(id)a3
{
  id v4;
  MTTrigger *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDate *triggerDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTTrigger;
  v5 = -[MTTrigger init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTriggerType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_triggerType = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTTriggerDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    triggerDate = v5->_triggerDate;
    v5->_triggerDate = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[MTTrigger triggerType](self, "triggerType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("MTTriggerType"));

  -[MTTrigger triggerDate](self, "triggerDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("MTTriggerDate"));

}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[MTTrigger triggerDate](self, "triggerDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)isForSnooze
{
  unint64_t v3;

  v3 = -[MTTrigger triggerType](self, "triggerType");
  if (v3 != 1)
    LOBYTE(v3) = -[MTTrigger triggerType](self, "triggerType") == 3
              || -[MTTrigger triggerType](self, "triggerType") == 5;
  return v3;
}

- (BOOL)isForGoToBed
{
  return -[MTTrigger triggerType](self, "triggerType") == 2 || -[MTTrigger triggerType](self, "triggerType") == 3;
}

- (BOOL)isForAlert
{
  unint64_t v3;

  if (!-[MTTrigger triggerType](self, "triggerType"))
  {
LABEL_4:
    LOBYTE(v3) = 1;
    return v3;
  }
  v3 = -[MTTrigger triggerType](self, "triggerType");
  if (v3 != 1)
  {
    if (-[MTTrigger triggerType](self, "triggerType") != 4)
    {
      LOBYTE(v3) = -[MTTrigger triggerType](self, "triggerType") == 5;
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (BOOL)isScheduled
{
  return -[MTTrigger isForGoToBed](self, "isForGoToBed")
      || -[MTTrigger isForAlert](self, "isForAlert")
      || -[MTTrigger isEvent](self, "isEvent");
}

- (BOOL)isEvent
{
  return -[MTTrigger triggerType](self, "triggerType") == 7 || -[MTTrigger triggerType](self, "triggerType") == 8;
}

- (BOOL)isBedtimeRelated
{
  return -[MTTrigger triggerType](self, "triggerType") == 7
      || -[MTTrigger triggerType](self, "triggerType") == 2
      || -[MTTrigger triggerType](self, "triggerType") == 3;
}

- (BOOL)isWakeUpRelated
{
  return -[MTTrigger triggerType](self, "triggerType") == 4
      || -[MTTrigger triggerType](self, "triggerType") == 5
      || -[MTTrigger triggerType](self, "triggerType") == 8;
}

+ (id)_stringForType:(unint64_t)a3
{
  if (a3 > 8)
    return 0;
  else
    return off_1E39CEF28[a3];
}

- (NSString)description
{
  return (NSString *)-[MTTrigger descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[MTTrigger succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return -[MTTrigger descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[MTTrigger descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_stringForType:", -[MTTrigger triggerType](self, "triggerType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("trigger"));

  -[MTTrigger triggerDate](self, "triggerDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mtDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("date"));

  v8 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[MTTrigger isPastOverrideEvent](self, "isPastOverrideEvent"), CFSTR("isPastOverride"), 1);
  return v4;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(unint64_t)a3
{
  self->_triggerType = a3;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isPastOverrideEvent
{
  return self->_isPastOverrideEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerDate, 0);
}

@end
