@implementation AFHomeAccessorySiriDataSharingPropagationLogEvent

- (AFHomeAccessorySiriDataSharingPropagationLogEvent)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFHomeAccessorySiriDataSharingPropagationLogEventMutation *);
  AFHomeAccessorySiriDataSharingPropagationLogEvent *v5;
  AFHomeAccessorySiriDataSharingPropagationLogEvent *v6;
  _AFHomeAccessorySiriDataSharingPropagationLogEventMutation *v7;
  void *v8;
  uint64_t v9;
  NSDate *date;
  void *v11;
  uint64_t v12;
  NSString *accessoryIdentifier;
  void *v14;
  uint64_t v15;
  NSString *propagationEventReason;
  void *v17;
  uint64_t v18;
  NSString *associatedChangeLogEventIdentifier;
  objc_super v21;

  v4 = (void (**)(id, _AFHomeAccessorySiriDataSharingPropagationLogEventMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)AFHomeAccessorySiriDataSharingPropagationLogEvent;
  v5 = -[AFHomeAccessorySiriDataSharingPropagationLogEvent init](&v21, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation initWithBase:]([_AFHomeAccessorySiriDataSharingPropagationLogEventMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation isDirty](v7, "isDirty"))
    {
      -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getDate](v7, "getDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getAccessoryIdentifier](v7, "getAccessoryIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      accessoryIdentifier = v6->_accessoryIdentifier;
      v6->_accessoryIdentifier = (NSString *)v12;

      v6->_propagationEvent = -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getPropagationEvent](v7, "getPropagationEvent");
      -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getPropagationEventReason](v7, "getPropagationEventReason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      propagationEventReason = v6->_propagationEventReason;
      v6->_propagationEventReason = (NSString *)v15;

      -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getAssociatedChangeLogEventIdentifier](v7, "getAssociatedChangeLogEventIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      associatedChangeLogEventIdentifier = v6->_associatedChangeLogEventIdentifier;
      v6->_associatedChangeLogEventIdentifier = (NSString *)v18;

    }
  }

  return v6;
}

- (AFHomeAccessorySiriDataSharingPropagationLogEvent)init
{
  return -[AFHomeAccessorySiriDataSharingPropagationLogEvent initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFHomeAccessorySiriDataSharingPropagationLogEvent)initWithDate:(id)a3 accessoryIdentifier:(id)a4 propagationEvent:(int64_t)a5 propagationEventReason:(id)a6 associatedChangeLogEventIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AFHomeAccessorySiriDataSharingPropagationLogEvent *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __161__AFHomeAccessorySiriDataSharingPropagationLogEvent_initWithDate_accessoryIdentifier_propagationEvent_propagationEventReason_associatedChangeLogEventIdentifier___block_invoke;
  v22[3] = &unk_1E3A33098;
  v23 = v12;
  v24 = v13;
  v26 = v15;
  v27 = a5;
  v25 = v14;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = -[AFHomeAccessorySiriDataSharingPropagationLogEvent initWithBuilder:](self, "initWithBuilder:", v22);

  return v20;
}

- (NSString)description
{
  return (NSString *)-[AFHomeAccessorySiriDataSharingPropagationLogEvent _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  NSDate *date;
  NSString *accessoryIdentifier;
  unint64_t propagationEvent;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)AFHomeAccessorySiriDataSharingPropagationLogEvent;
  -[AFHomeAccessorySiriDataSharingPropagationLogEvent description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  accessoryIdentifier = self->_accessoryIdentifier;
  propagationEvent = self->_propagationEvent;
  if (propagationEvent > 4)
    v9 = CFSTR("(unknown)");
  else
    v9 = off_1E3A329C8[propagationEvent];
  v10 = v9;
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {date = %@, accessoryIdentifier = %@, propagationEvent = %@, propagationEventReason = %@, associatedChangeLogEventIdentifier = %@}"), v5, date, accessoryIdentifier, v10, self->_propagationEventReason, self->_associatedChangeLogEventIdentifier);

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;

  v3 = -[NSDate hash](self->_date, "hash");
  v4 = -[NSString hash](self->_accessoryIdentifier, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_propagationEvent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[NSString hash](self->_propagationEventReason, "hash") ^ v6;
  v8 = v7 ^ -[NSString hash](self->_associatedChangeLogEventIdentifier, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AFHomeAccessorySiriDataSharingPropagationLogEvent *v4;
  AFHomeAccessorySiriDataSharingPropagationLogEvent *v5;
  int64_t propagationEvent;
  NSDate *v7;
  NSDate *date;
  NSString *v9;
  NSString *accessoryIdentifier;
  NSString *v11;
  NSString *propagationEventReason;
  NSString *v13;
  NSString *associatedChangeLogEventIdentifier;
  BOOL v15;

  v4 = (AFHomeAccessorySiriDataSharingPropagationLogEvent *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      propagationEvent = self->_propagationEvent;
      if (propagationEvent == -[AFHomeAccessorySiriDataSharingPropagationLogEvent propagationEvent](v5, "propagationEvent"))
      {
        -[AFHomeAccessorySiriDataSharingPropagationLogEvent date](v5, "date");
        v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
        date = self->_date;
        if (date == v7 || -[NSDate isEqual:](date, "isEqual:", v7))
        {
          -[AFHomeAccessorySiriDataSharingPropagationLogEvent accessoryIdentifier](v5, "accessoryIdentifier");
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          accessoryIdentifier = self->_accessoryIdentifier;
          if (accessoryIdentifier == v9 || -[NSString isEqual:](accessoryIdentifier, "isEqual:", v9))
          {
            -[AFHomeAccessorySiriDataSharingPropagationLogEvent propagationEventReason](v5, "propagationEventReason");
            v11 = (NSString *)objc_claimAutoreleasedReturnValue();
            propagationEventReason = self->_propagationEventReason;
            if (propagationEventReason == v11
              || -[NSString isEqual:](propagationEventReason, "isEqual:", v11))
            {
              -[AFHomeAccessorySiriDataSharingPropagationLogEvent associatedChangeLogEventIdentifier](v5, "associatedChangeLogEventIdentifier");
              v13 = (NSString *)objc_claimAutoreleasedReturnValue();
              associatedChangeLogEventIdentifier = self->_associatedChangeLogEventIdentifier;
              v15 = associatedChangeLogEventIdentifier == v13
                 || -[NSString isEqual:](associatedChangeLogEventIdentifier, "isEqual:", v13);

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

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (AFHomeAccessorySiriDataSharingPropagationLogEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  AFHomeAccessorySiriDataSharingPropagationLogEvent *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::propagationEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::propagationEventReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::associatedChangeLogEventIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[AFHomeAccessorySiriDataSharingPropagationLogEvent initWithDate:accessoryIdentifier:propagationEvent:propagationEventReason:associatedChangeLogEventIdentifier:](self, "initWithDate:accessoryIdentifier:propagationEvent:propagationEventReason:associatedChangeLogEventIdentifier:", v5, v6, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  void *v5;
  id v6;

  date = self->_date;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", date, CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::date"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_accessoryIdentifier, CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::accessoryIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_propagationEvent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::propagationEvent"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_propagationEventReason, CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::propagationEventReason"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_associatedChangeLogEventIdentifier, CFSTR("AFHomeAccessorySiriDataSharingPropagationLogEvent::associatedChangeLogEventIdentifier"));

}

- (AFHomeAccessorySiriDataSharingPropagationLogEvent)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFHomeAccessorySiriDataSharingPropagationLogEvent *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("accessoryIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("propagationEvent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = AFHomeAccessorySiriDataSharingPropagationEventGetFromName(v11);
    else
      v12 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("propagationEventReason"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("associatedChangeLogEventIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    self = -[AFHomeAccessorySiriDataSharingPropagationLogEvent initWithDate:accessoryIdentifier:propagationEvent:propagationEventReason:associatedChangeLogEventIdentifier:](self, "initWithDate:accessoryIdentifier:propagationEvent:propagationEventReason:associatedChangeLogEventIdentifier:", v7, v10, v12, v14, v16);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSDate *date;
  NSString *accessoryIdentifier;
  unint64_t propagationEvent;
  __CFString *v8;
  __CFString *v9;
  NSString *propagationEventReason;
  NSString *associatedChangeLogEventIdentifier;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  date = self->_date;
  if (date)
    objc_msgSend(v3, "setObject:forKey:", date, CFSTR("date"));
  accessoryIdentifier = self->_accessoryIdentifier;
  if (accessoryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accessoryIdentifier, CFSTR("accessoryIdentifier"));
  propagationEvent = self->_propagationEvent;
  if (propagationEvent > 4)
    v8 = CFSTR("(unknown)");
  else
    v8 = off_1E3A329C8[propagationEvent];
  v9 = v8;
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("propagationEvent"));

  propagationEventReason = self->_propagationEventReason;
  if (propagationEventReason)
    objc_msgSend(v4, "setObject:forKey:", propagationEventReason, CFSTR("propagationEventReason"));
  associatedChangeLogEventIdentifier = self->_associatedChangeLogEventIdentifier;
  if (associatedChangeLogEventIdentifier)
    objc_msgSend(v4, "setObject:forKey:", associatedChangeLogEventIdentifier, CFSTR("associatedChangeLogEventIdentifier"));
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (int64_t)propagationEvent
{
  return self->_propagationEvent;
}

- (NSString)propagationEventReason
{
  return self->_propagationEventReason;
}

- (NSString)associatedChangeLogEventIdentifier
{
  return self->_associatedChangeLogEventIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedChangeLogEventIdentifier, 0);
  objc_storeStrong((id *)&self->_propagationEventReason, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

void __161__AFHomeAccessorySiriDataSharingPropagationLogEvent_initWithDate_accessoryIdentifier_propagationEvent_propagationEventReason_associatedChangeLogEventIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setDate:", v3);
  objc_msgSend(v4, "setAccessoryIdentifier:", a1[5]);
  objc_msgSend(v4, "setPropagationEvent:", a1[8]);
  objc_msgSend(v4, "setPropagationEventReason:", a1[6]);
  objc_msgSend(v4, "setAssociatedChangeLogEventIdentifier:", a1[7]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFHomeAccessorySiriDataSharingPropagationLogEventMutation *);
  _AFHomeAccessorySiriDataSharingPropagationLogEventMutation *v5;
  AFHomeAccessorySiriDataSharingPropagationLogEvent *v6;
  void *v7;
  uint64_t v8;
  NSDate *date;
  void *v10;
  uint64_t v11;
  NSString *accessoryIdentifier;
  void *v13;
  uint64_t v14;
  NSString *propagationEventReason;
  void *v16;
  uint64_t v17;
  NSString *associatedChangeLogEventIdentifier;

  v4 = (void (**)(id, _AFHomeAccessorySiriDataSharingPropagationLogEventMutation *))a3;
  if (v4)
  {
    v5 = -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation initWithBase:]([_AFHomeAccessorySiriDataSharingPropagationLogEventMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFHomeAccessorySiriDataSharingPropagationLogEvent);
      -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getDate](v5, "getDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getAccessoryIdentifier](v5, "getAccessoryIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      accessoryIdentifier = v6->_accessoryIdentifier;
      v6->_accessoryIdentifier = (NSString *)v11;

      v6->_propagationEvent = -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getPropagationEvent](v5, "getPropagationEvent");
      -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getPropagationEventReason](v5, "getPropagationEventReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      propagationEventReason = v6->_propagationEventReason;
      v6->_propagationEventReason = (NSString *)v14;

      -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation getAssociatedChangeLogEventIdentifier](v5, "getAssociatedChangeLogEventIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      associatedChangeLogEventIdentifier = v6->_associatedChangeLogEventIdentifier;
      v6->_associatedChangeLogEventIdentifier = (NSString *)v17;

    }
    else
    {
      v6 = (AFHomeAccessorySiriDataSharingPropagationLogEvent *)-[AFHomeAccessorySiriDataSharingPropagationLogEvent copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFHomeAccessorySiriDataSharingPropagationLogEvent *)-[AFHomeAccessorySiriDataSharingPropagationLogEvent copy](self, "copy");
  }

  return v6;
}

@end
