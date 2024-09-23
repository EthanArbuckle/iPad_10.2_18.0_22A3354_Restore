@implementation UNCalendarNotificationTrigger

+ (UNCalendarNotificationTrigger)triggerWithDateMatchingComponents:(NSDateComponents *)dateComponents repeats:(BOOL)repeats
{
  _BOOL8 v4;
  NSDateComponents *v6;
  void *v7;

  v4 = repeats;
  v6 = dateComponents;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDateComponents:repeats:", v6, v4);

  return (UNCalendarNotificationTrigger *)v7;
}

- (id)_initWithDateComponents:(id)a3 repeats:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  objc_super v13;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 133, CFSTR("dateComponents must not be nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)UNCalendarNotificationTrigger;
  v8 = -[UNNotificationTrigger _initWithRepeats:](&v13, sel__initWithRepeats_, v4);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    v10 = (void *)v8[2];
    v8[2] = v9;

  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UNCalendarNotificationTrigger;
  v3 = -[UNNotificationTrigger hash](&v7, sel_hash);
  -[UNCalendarNotificationTrigger dateComponents](self, "dateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)UNCalendarNotificationTrigger,
        -[UNNotificationTrigger isEqual:](&v9, sel_isEqual_, v4)))
  {
    -[UNCalendarNotificationTrigger dateComponents](self, "dateComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = UNEqualObjects(v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNCalendarNotificationTrigger dateComponents](self, "dateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationTrigger repeats](self, "repeats");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; dateComponents: %@, repeats: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)nextTriggerDate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UNCalendarNotificationTrigger;
  -[UNNotificationTrigger nextTriggerDate](&v3, sel_nextTriggerDate);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 164, CFSTR("afterDate must not be nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 165, CFSTR("requestedDate must not be nil"));

LABEL_3:
  -[UNCalendarNotificationTrigger dateComponents](self, "dateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v11, "timeZone");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTimeZone:", v14);

      }
    }
    if (-[UNNotificationTrigger repeats](self, "repeats"))
      v15 = v7;
    else
      v15 = v9;
    v16 = v15;
    v17 = (void *)MEMORY[0x1AF4228BC]();
    objc_msgSend(v12, "nextDateAfterDate:matchingComponents:options:", v16, v11, 512);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v17);
    if (objc_msgSend(v18, "compare:", v7) != 1)
    {

      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UNCalendarNotificationTrigger;
  v4 = a3;
  -[UNNotificationTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UNCalendarNotificationTrigger dateComponents](self, "dateComponents", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("matchingDateComponents"));

}

- (UNCalendarNotificationTrigger)initWithCoder:(id)a3
{
  id v4;
  UNCalendarNotificationTrigger *v5;
  void *v6;
  uint64_t v7;
  NSDateComponents *dateComponents;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNCalendarNotificationTrigger;
  v5 = -[UNNotificationTrigger initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchingDateComponents"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v7;

  }
  return v5;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end
