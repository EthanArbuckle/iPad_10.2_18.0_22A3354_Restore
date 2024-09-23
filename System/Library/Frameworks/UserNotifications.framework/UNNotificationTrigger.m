@implementation UNNotificationTrigger

- (UNNotificationTrigger)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 36, CFSTR("use subclasses"));

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UNNotificationTrigger;
  return -[UNNotificationTrigger init](&v3, sel_init);
}

- (id)_initWithRepeats:(BOOL)a3
{
  id result;

  result = -[UNNotificationTrigger _init](self, "_init");
  if (result)
    *((_BYTE *)result + 8) = a3;
  return result;
}

- (unint64_t)hash
{
  return -[UNNotificationTrigger repeats](self, "repeats");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[UNNotificationTrigger repeats](self, "repeats");
    v6 = v5 ^ objc_msgSend(v4, "repeats") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationTrigger repeats](self, "repeats");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; repeats: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nextTriggerDate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationTrigger nextTriggerDateAfterDate:withRequestedDate:](self, "nextTriggerDateAfterDate:withRequestedDate:", v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextTriggerDateAfterLastTriggerDate:(id)a3 withRequestedDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[UNNotificationTrigger _retroactiveTriggerHysteresis](self, "_retroactiveTriggerHysteresis");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "laterDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNNotificationTrigger nextTriggerDateAfterDate:withRequestedDate:](self, "nextTriggerDateAfterDate:withRequestedDate:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4
{
  return 0;
}

- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[UNNotificationTrigger repeats](self, "repeats"))
  {
    v8 = 1;
  }
  else
  {
    -[UNNotificationTrigger nextTriggerDateAfterDate:withRequestedDate:](self, "nextTriggerDateAfterDate:withRequestedDate:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  return v8;
}

- (double)_retroactiveTriggerHysteresis
{
  return 900.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationTrigger repeats](self, "repeats"), CFSTR("repeats"));

}

- (UNNotificationTrigger)initWithCoder:(id)a3
{
  return (UNNotificationTrigger *)-[UNNotificationTrigger _initWithRepeats:](self, "_initWithRepeats:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("repeats")));
}

- (BOOL)repeats
{
  return self->_repeats;
}

@end
