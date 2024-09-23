@implementation ATXContext

- (ATXContext)initWithContextType:(unint64_t)a3 location:(id)a4 timeWindow:(id)a5
{
  id v9;
  id v10;
  ATXContext *v11;
  ATXContext *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXContext;
  v11 = -[ATXContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_contextType = a3;
    objc_storeStrong((id *)&v11->_location, a4);
    objc_storeStrong((id *)&v12->_timeWindow, a5);
  }

  return v12;
}

+ (id)defaultTimeWindowForContextType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1234.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setDay:", 0);
  if (a3 == 2)
  {
    v9 = 3;
    goto LABEL_5;
  }
  v7 = 0;
  v8 = 0;
  if (a3 == 1)
  {
    v9 = 15;
LABEL_5:
    objc_msgSend(v6, "setHour:", v9);
    objc_msgSend(v5, "startOfDayForDate:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v7, 28800.0);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXContext contextType](self, "contextType"), CFSTR("contextTypeKey"));
  -[ATXContext location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contextLocationKey"));

  -[ATXContext timeWindow](self, "timeWindow");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contextTimeWindowKey"));

}

- (ATXContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ATXContext *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contextTypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextLocationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextTimeWindowKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ATXContext initWithContextType:location:timeWindow:](self, "initWithContextType:location:timeWindow:", v5, v6, v7);
  return v8;
}

- (CLLocation)location
{
  return self->_location;
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (NSDateInterval)timeWindow
{
  return self->_timeWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeWindow, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
