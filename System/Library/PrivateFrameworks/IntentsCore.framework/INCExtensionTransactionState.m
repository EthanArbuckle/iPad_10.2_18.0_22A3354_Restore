@implementation INCExtensionTransactionState

- (INCExtensionTransactionState)initWithType:(int64_t)a3 intent:(id)a4 intentResponse:(id)a5 userActivities:(id)a6
{
  id v11;
  id v12;
  id v13;
  INCExtensionTransactionState *v14;
  INCExtensionTransactionState *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)INCExtensionTransactionState;
  v14 = -[INCExtensionTransactionState init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_intent, a4);
    objc_storeStrong((id *)&v15->_intentResponse, a5);
    objc_storeStrong((id *)&v15->_userActivities, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t type;
  __CFString *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)INCExtensionTransactionState;
  -[INCExtensionTransactionState description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type > 5)
    v6 = 0;
  else
    v6 = off_1E6BC4158[type];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {type = %ld (%@), intent = %@, intentResponse = %@, userActivities = %@}"), v4, type, v6, v8, v10, self->_userActivities);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (NSSet)userActivities
{
  return self->_userActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivities, 0);
  objc_storeStrong((id *)&self->_intentResponse, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
