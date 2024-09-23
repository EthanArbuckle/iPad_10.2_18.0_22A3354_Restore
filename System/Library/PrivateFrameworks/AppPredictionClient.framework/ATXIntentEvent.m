@implementation ATXIntentEvent

- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXIntentEvent *v12;
  uint64_t v13;
  NSString *bundleId;
  uint64_t v15;
  NSString *intentType;
  uint64_t v17;
  NSDateInterval *dateInterval;
  INIntent *intent;
  NSString *arg1;
  NSString *arg2;
  void *v23;
  void *v24;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXIntentEvent.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXIntentEvent.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intentType"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)ATXIntentEvent;
  v12 = -[ATXIntentEvent init](&v25, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    bundleId = v12->_bundleId;
    v12->_bundleId = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    intentType = v12->_intentType;
    v12->_intentType = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    dateInterval = v12->_dateInterval;
    v12->_dateInterval = (NSDateInterval *)v17;

    intent = v12->_intent;
    v12->_intent = 0;

    arg1 = v12->_arg1;
    v12->_arg1 = (NSString *)CFSTR("ARG1_MISSING");

    arg2 = v12->_arg2;
    v12->_arg2 = (NSString *)CFSTR("ARG2_MISSING");

  }
  return v12;
}

- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5 intent:(id)a6
{
  id v11;
  ATXIntentEvent *v12;
  ATXIntentEvent *v13;

  v11 = a6;
  v12 = -[ATXIntentEvent initWithBundleId:intentType:dateInterval:](self, "initWithBundleId:intentType:dateInterval:", a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intent, a6);
    objc_msgSend(v11, "atx_getArgsInto:", v13);
  }

  return v13;
}

- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5 action:(id)a6
{
  id v11;
  ATXIntentEvent *v12;
  ATXIntentEvent *v13;
  uint64_t v14;
  INIntent *intent;

  v11 = a6;
  v12 = -[ATXIntentEvent initWithBundleId:intentType:dateInterval:](self, "initWithBundleId:intentType:dateInterval:", a3, a4, a5);
  v13 = v12;
  if (v11)
  {
    if (v12)
    {
      objc_storeStrong((id *)&v12->_action, a6);
      if (!objc_msgSend(v11, "actionType") || objc_msgSend(v11, "actionType") == 2)
      {
        objc_msgSend(v11, "intent");
        v14 = objc_claimAutoreleasedReturnValue();
        intent = v13->_intent;
        v13->_intent = (INIntent *)v14;

        -[INIntent atx_getArgsInto:](v13->_intent, "atx_getArgsInto:", v13);
      }
    }
  }

  return v13;
}

- (void)setArg1:(id)a3
{
  __CFString *v3;

  if (a3)
    v3 = (__CFString *)a3;
  else
    v3 = CFSTR("ARG1_MISSING");
  objc_storeStrong((id *)&self->_arg1, v3);
}

- (void)setArg2:(id)a3
{
  __CFString *v3;

  if (a3)
    v3 = (__CFString *)a3;
  else
    v3 = CFSTR("ARG2_MISSING");
  objc_storeStrong((id *)&self->_arg2, v3);
}

- (id)startDate
{
  return -[NSDateInterval startDate](self->_dateInterval, "startDate");
}

- (id)endDate
{
  return -[NSDateInterval endDate](self->_dateInterval, "endDate");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@(%@, %@)>"), v5, self->_dateInterval, self->_bundleId, self->_arg1, self->_arg2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXIntentEvent *v4;
  ATXIntentEvent *v5;
  BOOL v6;

  v4 = (ATXIntentEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXIntentEvent isEqualToATXIntentEvent:](self, "isEqualToATXIntentEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXIntentEvent:(id)a3
{
  id *v4;
  NSString *bundleId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *intentType;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSDateInterval *dateInterval;
  NSDateInterval *v16;
  NSDateInterval *v17;
  NSDateInterval *v18;
  char v19;
  INIntent *intent;
  INIntent *v21;
  INIntent *v22;
  INIntent *v23;
  char v24;
  NSString *arg1;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  char v29;
  char v30;
  NSString *v32;
  NSString *v33;

  v4 = (id *)a3;
  bundleId = self->_bundleId;
  v6 = (NSString *)v4[2];
  if (bundleId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = bundleId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_19;
  }
  intentType = self->_intentType;
  v11 = (NSString *)v4[1];
  if (intentType == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = intentType;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_19;
  }
  dateInterval = self->_dateInterval;
  v16 = (NSDateInterval *)v4[3];
  if (dateInterval == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = dateInterval;
    v19 = -[NSDateInterval isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_19;
  }
  intent = self->_intent;
  v21 = (INIntent *)v4[4];
  if (intent == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = intent;
    v24 = -[INIntent isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_19;
  }
  arg1 = self->_arg1;
  v26 = (NSString *)v4[6];
  if (arg1 == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = arg1;
    v29 = -[NSString isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
    {
LABEL_19:
      v30 = 0;
      goto LABEL_20;
    }
  }
  v32 = self->_arg2;
  v33 = v32;
  if (v32 == v4[7])
    v30 = 1;
  else
    v30 = -[NSString isEqual:](v32, "isEqual:");

LABEL_20:
  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSString hash](self->_intentType, "hash") - v3 + 32 * v3;
  v5 = -[NSDateInterval hash](self->_dateInterval, "hash") - v4 + 32 * v4;
  v6 = -[INIntent hash](self->_intent, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_arg1, "hash") - v6 + 32 * v6;
  return -[NSString hash](self->_arg2, "hash") - v7 + 32 * v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXIntentEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ATXIntentEvent *v8;
  uint64_t v9;
  NSString *arg1;
  uint64_t v11;
  NSString *arg2;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXIntentEvent initWithBundleId:intentType:dateInterval:](self, "initWithBundleId:intentType:dateInterval:", v5, v6, v7);

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arg1"));
    v9 = objc_claimAutoreleasedReturnValue();
    arg1 = v8->_arg1;
    v8->_arg1 = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arg2"));
    v11 = objc_claimAutoreleasedReturnValue();
    arg2 = v8->_arg2;
    v8->_arg2 = (NSString *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  ATXIntentEvent *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", v4->_arg1, CFSTR("arg1"));
  objc_msgSend(v5, "encodeObject:forKey:", v4->_arg2, CFSTR("arg2"));
  objc_msgSend(v5, "encodeObject:forKey:", v4->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", v4->_intentType, CFSTR("intentType"));
  objc_sync_exit(v4);

}

- (NSString)intentType
{
  return self->_intentType;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (INIntent)intent
{
  return self->_intent;
}

- (ATXAction)action
{
  return self->_action;
}

- (NSString)arg1
{
  return self->_arg1;
}

- (NSString)arg2
{
  return self->_arg2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arg2, 0);
  objc_storeStrong((id *)&self->_arg1, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
}

@end
