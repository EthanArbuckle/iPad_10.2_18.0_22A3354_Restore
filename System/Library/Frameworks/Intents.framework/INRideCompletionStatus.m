@implementation INRideCompletionStatus

- (id)_initCompleted:(BOOL)a3 canceledByService:(BOOL)a4 missedPickup:(BOOL)a5 amount:(id)a6 feedbackType:(unint64_t)a7 outstanding:(BOOL)a8
{
  id v14;
  INRideCompletionStatus *v15;
  INRideCompletionStatus *v16;
  uint64_t v17;
  INCurrencyAmount *paymentAmount;
  objc_super v20;

  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)INRideCompletionStatus;
  v15 = -[INRideCompletionStatus init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_completed = a3;
    v15->_canceledByService = a4;
    v15->_missedPickup = a5;
    v17 = objc_msgSend(v14, "copy");
    paymentAmount = v16->_paymentAmount;
    v16->_paymentAmount = (INCurrencyAmount *)v17;

    v16->_feedbackType = a7;
    v16->_outstanding = a8;
  }

  return v16;
}

- (BOOL)isCanceled
{
  return !-[INRideCompletionStatus isCompleted](self, "isCompleted");
}

- (INRideCompletionStatus)initWithCoder:(id)a3
{
  id v4;
  INRideCompletionStatus *v5;
  uint64_t v6;
  INCurrencyAmount *paymentAmount;
  uint64_t v8;
  NSSet *defaultTippingOptions;
  void *v10;
  uint64_t v11;
  NSUserActivity *completionUserActivity;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INRideCompletionStatus;
  v5 = -[INRideCompletionStatus init](&v14, sel_init);
  if (v5)
  {
    v5->_completed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCompleted"));
    v5->_canceledByService = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCanceledByService"));
    v5->_missedPickup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMissedPickup"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentAmount = v5->_paymentAmount;
    v5->_paymentAmount = (INCurrencyAmount *)v6;

    v5->_feedbackType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feedbackType"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("defaultTippingOptions"));
    v8 = objc_claimAutoreleasedReturnValue();
    defaultTippingOptions = v5->_defaultTippingOptions;
    v5->_defaultTippingOptions = (NSSet *)v8;

    v5->_outstanding = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOutstanding"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completionUserActivity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    INUserActivityDeserializeFromData(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    completionUserActivity = v5->_completionUserActivity;
    v5->_completionUserActivity = (NSUserActivity *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 completed;
  id v5;
  id v6;

  completed = self->_completed;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", completed, CFSTR("isCompleted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canceledByService, CFSTR("isCanceledByService"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_missedPickup, CFSTR("isMissedPickup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentAmount, CFSTR("paymentAmount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feedbackType, CFSTR("feedbackType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultTippingOptions, CFSTR("defaultTippingOptions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_outstanding, CFSTR("isOutstanding"));
  INUserActivitySerializeToData(self->_completionUserActivity);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("completionUserActivity"));

}

- (id)_initWithValue:(id)a3
{
  id v4;
  INRideCompletionStatus *v5;
  void *v6;
  uint64_t v7;
  INCurrencyAmount *paymentAmount;
  void *v9;
  uint64_t v10;
  NSUserActivity *completionUserActivity;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  unint64_t feedbackType;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSSet *defaultTippingOptions;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INRideCompletionStatus;
  v5 = -[INRideCompletionStatus init](&v24, sel_init);
  if (v5)
  {
    v5->_completed = objc_msgSend(v4, "completed");
    v5->_canceledByService = objc_msgSend(v4, "canceledByService");
    v5->_missedPickup = objc_msgSend(v4, "missedPickup");
    objc_msgSend(v4, "paymentAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromCurrencyAmountValue(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    paymentAmount = v5->_paymentAmount;
    v5->_paymentAmount = (INCurrencyAmount *)v7;

    v5->_outstanding = objc_msgSend(v4, "outstanding");
    objc_msgSend(v4, "completionUserActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INUserActivityDeserializeFromBackingStore(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    completionUserActivity = v5->_completionUserActivity;
    v5->_completionUserActivity = (NSUserActivity *)v10;

    v5->_feedbackType = 0;
    v12 = objc_msgSend(v4, "feedbackTypesCount");
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        v15 = objc_msgSend(v4, "feedbackTypeAtIndex:", i);
        feedbackType = v5->_feedbackType;
        v17 = feedbackType | 2;
        if (v15 == 1)
          feedbackType |= 1uLL;
        if (v15 == 2)
          feedbackType = v17;
        v5->_feedbackType = feedbackType;
      }
    }
    v18 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "defaultTippingOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromCurrencyAmountValues(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    defaultTippingOptions = v5->_defaultTippingOptions;
    v5->_defaultTippingOptions = (NSSet *)v21;

  }
  return v5;
}

- (id)_newValue
{
  _INPBRideCompletionStatus *v3;
  void *v4;
  void *v5;
  NSUserActivity *completionUserActivity;
  void *v7;
  uint64_t v8;
  _INPBRideCompletionStatus *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _INPBRideCompletionStatus *v17;

  v3 = objc_alloc_init(_INPBRideCompletionStatus);
  -[_INPBRideCompletionStatus setCompleted:](v3, "setCompleted:", -[INRideCompletionStatus isCompleted](self, "isCompleted"));
  -[_INPBRideCompletionStatus setCanceledByService:](v3, "setCanceledByService:", -[INRideCompletionStatus isCanceledByService](self, "isCanceledByService"));
  -[_INPBRideCompletionStatus setMissedPickup:](v3, "setMissedPickup:", -[INRideCompletionStatus isMissedPickup](self, "isMissedPickup"));
  -[INRideCompletionStatus paymentAmount](self, "paymentAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCurrencyAmountValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBRideCompletionStatus setPaymentAmount:](v3, "setPaymentAmount:", v5);

  -[_INPBRideCompletionStatus setOutstanding:](v3, "setOutstanding:", -[INRideCompletionStatus isOutstanding](self, "isOutstanding"));
  completionUserActivity = self->_completionUserActivity;
  if (completionUserActivity)
  {
    INUserActivitySerializeToBackingStore(completionUserActivity);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INPBRideCompletionStatus setCompletionUserActivity:](v3, "setCompletionUserActivity:", v7);

  }
  v8 = -[INRideCompletionStatus feedbackType](self, "feedbackType");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __35__INRideCompletionStatus__newValue__block_invoke;
  v16[3] = &unk_1E2295130;
  v9 = v3;
  v17 = v9;
  INRideFeedbackTypeOptionsEnumerateBackingTypes(v8, v16);
  v10 = (void *)MEMORY[0x1E0C99DE8];
  -[INRideCompletionStatus defaultTippingOptions](self, "defaultTippingOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCurrencyAmountValues(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBRideCompletionStatus setDefaultTippingOptions:](v9, "setDefaultTippingOptions:", v14);

  return v9;
}

- (NSString)description
{
  return (NSString *)-[INRideCompletionStatus descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRideCompletionStatus;
  -[INRideCompletionStatus description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRideCompletionStatus _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSUserActivity *completionUserActivity;
  uint64_t v4;
  void *v5;
  void *v6;
  INCurrencyAmount *paymentAmount;
  void *v8;
  NSSet *defaultTippingOptions;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[8];
  _QWORD v18[10];

  v18[8] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("completionUserActivity");
  completionUserActivity = self->_completionUserActivity;
  v4 = (uint64_t)completionUserActivity;
  if (!completionUserActivity)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v4;
  v17[1] = CFSTR("completed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  v17[2] = CFSTR("isCanceled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INRideCompletionStatus isCompleted](self, "isCompleted") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  v17[3] = CFSTR("missedPickup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_missedPickup);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v6;
  v17[4] = CFSTR("paymentAmount");
  paymentAmount = self->_paymentAmount;
  v8 = paymentAmount;
  if (!paymentAmount)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[4] = v8;
  v17[5] = CFSTR("defaultTippingOptions");
  defaultTippingOptions = self->_defaultTippingOptions;
  v10 = defaultTippingOptions;
  if (!defaultTippingOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[5] = v10;
  v17[6] = CFSTR("feedbackType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_feedbackType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v11;
  v17[7] = CFSTR("outstanding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_outstanding);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (defaultTippingOptions)
  {
    if (paymentAmount)
      goto LABEL_9;
  }
  else
  {

    if (paymentAmount)
      goto LABEL_9;
  }

LABEL_9:
  if (!completionUserActivity)

  return v13;
}

- (NSUserActivity)completionUserActivity
{
  return self->_completionUserActivity;
}

- (void)setCompletionUserActivity:(NSUserActivity *)completionUserActivity
{
  objc_storeStrong((id *)&self->_completionUserActivity, completionUserActivity);
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (BOOL)isMissedPickup
{
  return self->_missedPickup;
}

- (INCurrencyAmount)paymentAmount
{
  return self->_paymentAmount;
}

- (INRideFeedbackTypeOptions)feedbackType
{
  return self->_feedbackType;
}

- (BOOL)isOutstanding
{
  return self->_outstanding;
}

- (NSSet)defaultTippingOptions
{
  return self->_defaultTippingOptions;
}

- (void)setDefaultTippingOptions:(NSSet *)defaultTippingOptions
{
  objc_storeStrong((id *)&self->_defaultTippingOptions, defaultTippingOptions);
}

- (BOOL)isCanceledByService
{
  return self->_canceledByService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTippingOptions, 0);
  objc_storeStrong((id *)&self->_paymentAmount, 0);
  objc_storeStrong((id *)&self->_completionUserActivity, 0);
}

uint64_t __35__INRideCompletionStatus__newValue__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addFeedbackType:", a2);
}

+ (INRideCompletionStatus)completed
{
  return (INRideCompletionStatus *)(id)objc_msgSend(objc_alloc((Class)a1), "_initCompleted:canceledByService:missedPickup:amount:feedbackType:outstanding:", 1, 0, 0, 0, 0, 0);
}

+ (INRideCompletionStatus)completedWithSettledPaymentAmount:(INCurrencyAmount *)settledPaymentAmount
{
  INCurrencyAmount *v4;
  void *v5;

  v4 = settledPaymentAmount;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initCompleted:canceledByService:missedPickup:amount:feedbackType:outstanding:", 1, 0, 0, v4, 0, 0);

  return (INRideCompletionStatus *)v5;
}

+ (INRideCompletionStatus)completedWithOutstandingPaymentAmount:(INCurrencyAmount *)outstandingPaymentAmount
{
  INCurrencyAmount *v4;
  void *v5;

  v4 = outstandingPaymentAmount;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initCompleted:canceledByService:missedPickup:amount:feedbackType:outstanding:", 1, 0, 0, v4, 0, 1);

  return (INRideCompletionStatus *)v5;
}

+ (INRideCompletionStatus)completedWithOutstandingFeedbackType:(INRideFeedbackTypeOptions)feedbackType
{
  return (INRideCompletionStatus *)(id)objc_msgSend(objc_alloc((Class)a1), "_initCompleted:canceledByService:missedPickup:amount:feedbackType:outstanding:", 1, 0, 0, 0, feedbackType, 1);
}

+ (INRideCompletionStatus)canceledByUser
{
  return (INRideCompletionStatus *)(id)objc_msgSend(objc_alloc((Class)a1), "_initCompleted:canceledByService:missedPickup:amount:feedbackType:outstanding:", 0, 0, 0, 0, 0, 0);
}

+ (INRideCompletionStatus)canceledByService
{
  return (INRideCompletionStatus *)(id)objc_msgSend(objc_alloc((Class)a1), "_initCompleted:canceledByService:missedPickup:amount:feedbackType:outstanding:", 0, 1, 0, 0, 0, 0);
}

+ (INRideCompletionStatus)canceledMissedPickup
{
  return (INRideCompletionStatus *)(id)objc_msgSend(objc_alloc((Class)a1), "_initCompleted:canceledByService:missedPickup:amount:feedbackType:outstanding:", 0, 1, 1, 0, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INRideCompletionStatus completionUserActivity](self, "completionUserActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INRideCompletionStatus completionUserActivity](self, "completionUserActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

@end
