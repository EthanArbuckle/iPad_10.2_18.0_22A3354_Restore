@implementation ATXInterruptingAppSessionEvent

- (ATXInterruptingAppSessionEvent)initWithInterruptingBundleID:(id)a3 interruptedBundleID:(id)a4 eventStartTime:(id)a5 eventEndTime:(id)a6 interruptingCategory:(unint64_t)a7 interruptedCategory:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXInterruptingAppSessionEvent *v18;
  uint64_t v19;
  NSString *interruptingBundleID;
  uint64_t v21;
  NSString *interruptedBundleID;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXInterruptingAppSessionEvent;
  v18 = -[ATXInterruptingAppSessionEvent init](&v24, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    interruptingBundleID = v18->_interruptingBundleID;
    v18->_interruptingBundleID = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    interruptedBundleID = v18->_interruptedBundleID;
    v18->_interruptedBundleID = (NSString *)v21;

    objc_storeStrong((id *)&v18->_startTime, a5);
    objc_storeStrong((id *)&v18->_endTime, a6);
    v18->_interruptingCategory = a7;
    v18->_interruptedCategory = a8;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ATXInterruptingAppSessionEvent interruptingBundleID](self, "interruptingBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("interruptingBundleID"));

  -[ATXInterruptingAppSessionEvent interruptedBundleID](self, "interruptedBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("interruptedBundleID"));

  -[ATXInterruptingAppSessionEvent startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("startTime"));

  -[ATXInterruptingAppSessionEvent endTime](self, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("endTime"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXInterruptingAppSessionEvent interruptingCategory](self, "interruptingCategory"), CFSTR("interruptingCategory"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXInterruptingAppSessionEvent interruptedCategory](self, "interruptedCategory"), CFSTR("interruptedCategory"));

}

- (ATXInterruptingAppSessionEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  ATXInterruptingAppSessionEvent *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interruptingBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interruptedBundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interruptingCategory"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interruptedCategory"));

  v11 = -[ATXInterruptingAppSessionEvent initWithInterruptingBundleID:interruptedBundleID:eventStartTime:eventEndTime:interruptingCategory:interruptedCategory:](self, "initWithInterruptingBundleID:interruptedBundleID:eventStartTime:eventEndTime:interruptingCategory:interruptedCategory:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (NSDate)eventTime
{
  return self->_startTime;
}

- (NSString)bundleID
{
  return self->_interruptingBundleID;
}

- (NSString)interruptingBundleID
{
  return self->_interruptingBundleID;
}

- (NSString)interruptedBundleID
{
  return self->_interruptedBundleID;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (unint64_t)interruptingCategory
{
  return self->_interruptingCategory;
}

- (unint64_t)interruptedCategory
{
  return self->_interruptedCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_interruptedBundleID, 0);
  objc_storeStrong((id *)&self->_interruptingBundleID, 0);
}

@end
