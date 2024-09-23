@implementation UNTimeIntervalNotificationTrigger

+ (UNTimeIntervalNotificationTrigger)triggerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats
{
  return (UNTimeIntervalNotificationTrigger *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithTimeInterval:repeats:", repeats, timeInterval);
}

- (id)_initWithTimeInterval:(double)a3 repeats:(BOOL)a4
{
  _BOOL8 v4;
  id result;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a4;
  if (a3 < 60.0 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 536, CFSTR("time interval must be at least 60 if repeating"));

  }
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 537, CFSTR("time interval must be greater than 0"));

  }
  v12.receiver = self;
  v12.super_class = (Class)UNTimeIntervalNotificationTrigger;
  result = -[UNNotificationTrigger _initWithRepeats:](&v12, sel__initWithRepeats_, v4);
  if (result)
    *((double *)result + 2) = a3;
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UNTimeIntervalNotificationTrigger;
  v3 = -[UNNotificationTrigger hash](&v8, sel_hash);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[UNTimeIntervalNotificationTrigger timeInterval](self, "timeInterval");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)UNTimeIntervalNotificationTrigger,
        -[UNNotificationTrigger isEqual:](&v10, sel_isEqual_, v4)))
  {
    -[UNTimeIntervalNotificationTrigger timeInterval](self, "timeInterval");
    v6 = v5;
    objc_msgSend(v4, "timeInterval");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationTrigger repeats](self, "repeats");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNTimeIntervalNotificationTrigger timeInterval](self, "timeInterval");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; repeats: %@, timeInterval: %lf>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)nextTriggerDate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UNTimeIntervalNotificationTrigger;
  -[UNNotificationTrigger nextTriggerDate](&v3, sel_nextTriggerDate);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)nextTriggerDateAfterDate:(id)a3 withRequestedDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double v18;
  void *v19;
  void *v21;
  void *v22;

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
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 569, CFSTR("date must not be nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 570, CFSTR("requestedDate must not be nil"));

LABEL_3:
  objc_msgSend(v7, "laterDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v14 = v13;
  -[UNTimeIntervalNotificationTrigger timeInterval](self, "timeInterval");
  v16 = v15;
  v17 = -[UNNotificationTrigger repeats](self, "repeats");
  v18 = 1.0;
  if (v17)
    v18 = (double)(uint64_t)((v12 - v14) / v16 + 1.0);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v14 + v18 * v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "compare:", v7) != 1)
  {

    v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UNTimeIntervalNotificationTrigger;
  v4 = a3;
  -[UNNotificationTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[UNTimeIntervalNotificationTrigger timeInterval](self, "timeInterval", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeInterval"));

}

- (UNTimeIntervalNotificationTrigger)initWithCoder:(id)a3
{
  id v4;
  UNTimeIntervalNotificationTrigger *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UNTimeIntervalNotificationTrigger;
  v5 = -[UNNotificationTrigger initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeInterval"));
    v5->_timeInterval = v6;
  }

  return v5;
}

- (NSTimeInterval)timeInterval
{
  return self->_timeInterval;
}

@end
