@implementation HDAlarmEvent

- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 eventOptions:(unint64_t)a6
{
  return (HDAlarmEvent *)-[HDAlarmEvent _initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:](self, "_initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:", a3, a4, a5, 0, a6, 0);
}

- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 eventOptions:(unint64_t)a6 clientOptions:(unint64_t)a7
{
  return (HDAlarmEvent *)-[HDAlarmEvent _initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:](self, "_initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:", a3, a4, a5, 0, a6, a7);
}

- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDateComponents:(id)a5 eventOptions:(unint64_t)a6
{
  return (HDAlarmEvent *)-[HDAlarmEvent _initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:](self, "_initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:", a3, a4, 0, a5, a6, 0);
}

- (HDAlarmEvent)initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDateComponents:(id)a5 eventOptions:(unint64_t)a6 clientOptions:(unint64_t)a7
{
  return (HDAlarmEvent *)-[HDAlarmEvent _initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:](self, "_initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:", a3, a4, 0, a5, a6, a7);
}

- (id)_initWithClientIdentifier:(id)a3 eventIdentifier:(id)a4 dueDate:(id)a5 dueDateComponents:(id)a6 eventOptions:(unint64_t)a7 clientOptions:(unint64_t)a8
{
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  HDAlarmEvent *v20;
  uint64_t v21;
  NSString *clientIdentifier;
  uint64_t v23;
  NSString *eventIdentifier;
  uint64_t v25;
  NSDate *dueDate;
  uint64_t v27;
  NSDateComponents *dueDateComponents;
  void *v30;
  void *v31;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = (unint64_t)a5;
  v18 = (unint64_t)a6;
  v19 = (void *)v18;
  if (!(v17 | v18))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAlarmEvent.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dueDate != nil || dueDateComponents != nil"));
LABEL_12:

    goto LABEL_6;
  }
  if (v17 && v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAlarmEvent.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dueDate == nil || dueDateComponents == nil"));

  }
  else if (!v18)
  {
    goto LABEL_6;
  }
  if ((objc_msgSend(v19, "isValidDate") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAlarmEvent.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HDAlarmEventValidateDateComponents(dueDateComponents)"));
    goto LABEL_12;
  }
LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)HDAlarmEvent;
  v20 = -[HDAlarmEvent init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    clientIdentifier = v20->_clientIdentifier;
    v20->_clientIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    eventIdentifier = v20->_eventIdentifier;
    v20->_eventIdentifier = (NSString *)v23;

    v25 = objc_msgSend((id)v17, "copy");
    dueDate = v20->_dueDate;
    v20->_dueDate = (NSDate *)v25;

    v27 = objc_msgSend(v19, "copy");
    dueDateComponents = v20->_dueDateComponents;
    v20->_dueDateComponents = (NSDateComponents *)v27;

    v20->_eventOptions = a7;
    v20->_clientOptions = a8;
  }

  return v20;
}

- (NSDate)currentDueDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[HDAlarmEvent dueDate](self, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HDAlarmEvent dueDate](self, "dueDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HDAlarmEvent dueDateComponents](self, "dueDateComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_populatedCalendarGregorianCalendarDefault");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "resetSystemTimeZone");
      -[HDAlarmEvent _unitTest_localTimeZoneOverride](self, "_unitTest_localTimeZoneOverride");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "setTimeZone:", v10);

    -[HDAlarmEvent dueDateComponents](self, "dueDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromComponents:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *clientIdentifier;
  NSString *v7;
  NSString *eventIdentifier;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    clientIdentifier = self->_clientIdentifier;
    v7 = (NSString *)v5[1];
    if ((clientIdentifier == v7 || v7 && -[NSString isEqualToString:](clientIdentifier, "isEqualToString:"))
      && ((eventIdentifier = self->_eventIdentifier, v9 = (NSString *)v5[2], eventIdentifier == v9)
       || v9 && -[NSString isEqualToString:](eventIdentifier, "isEqualToString:")))
    {
      -[HDAlarmEvent currentDueDate](self, "currentDueDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentDueDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {
        v15 = self->_eventOptions == v5[5] && self->_clientOptions == v5[6];
      }
      else
      {
        objc_msgSend(v5, "currentDueDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[HDAlarmEvent currentDueDate](self, "currentDueDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "currentDueDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToDate:", v14)
             && self->_eventOptions == v5[5]
             && self->_clientOptions == v5[6];

        }
        else
        {
          v15 = 0;
        }

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_clientIdentifier, "hash");
  v4 = -[NSString hash](self->_eventIdentifier, "hash") ^ v3;
  v5 = -[NSDate hash](self->_dueDate, "hash");
  return v4 ^ v5 ^ -[NSDateComponents hash](self->_dueDateComponents, "hash") ^ self->_eventOptions ^ self->_clientOptions;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  char v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDAlarmEvent clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAlarmEvent eventIdentifier](self, "eventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAlarmEvent dueDate](self, "dueDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAlarmEvent dueDateComponents](self, "dueDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDAlarmEvent eventOptions](self, "eventOptions");
  if (v9)
  {
    v10 = v9;
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = v11;
    if ((v10 & 2) != 0)
      objc_msgSend(v11, "addObject:", CFSTR("require-device-on-wrist"));
    if ((v10 & 1) != 0)
      objc_msgSend(v12, "addObject:", CFSTR("require-device-unlocked"));
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = CFSTR("none");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p client:%@ event:%@ dueDate:%@, dueDateComponents:%@, eventOptions: %@, clientOptions: %lu>"), v4, self, v5, v6, v7, v8, v13, -[HDAlarmEvent clientOptions](self, "clientOptions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)requiresDeviceOnWrist
{
  return (-[HDAlarmEvent eventOptions](self, "eventOptions") >> 1) & 1;
}

- (BOOL)requiresDeviceUnlocked
{
  return -[HDAlarmEvent eventOptions](self, "eventOptions") & 1;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (unint64_t)eventOptions
{
  return self->_eventOptions;
}

- (unint64_t)clientOptions
{
  return self->_clientOptions;
}

- (NSTimeZone)_unitTest_localTimeZoneOverride
{
  return self->__unitTest_localTimeZoneOverride;
}

- (void)set_unitTest_localTimeZoneOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__unitTest_localTimeZoneOverride, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
