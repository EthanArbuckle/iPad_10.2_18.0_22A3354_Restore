@implementation _INPBRideCompletionStatus

- (void)setCanceled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_canceled = a3;
}

- (BOOL)hasCanceled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCanceled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setCanceledByService:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_canceledByService = a3;
}

- (BOOL)hasCanceledByService
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCanceledByService:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_completed = a3;
}

- (BOOL)hasCompleted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setCompletionUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_completionUserActivity, a3);
}

- (BOOL)hasCompletionUserActivity
{
  return self->_completionUserActivity != 0;
}

- (void)setDefaultTippingOptions:(id)a3
{
  NSArray *v4;
  NSArray *defaultTippingOptions;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  defaultTippingOptions = self->_defaultTippingOptions;
  self->_defaultTippingOptions = v4;

}

- (void)clearDefaultTippingOptions
{
  -[NSArray removeAllObjects](self->_defaultTippingOptions, "removeAllObjects");
}

- (void)addDefaultTippingOptions:(id)a3
{
  id v4;
  NSArray *defaultTippingOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  defaultTippingOptions = self->_defaultTippingOptions;
  v8 = v4;
  if (!defaultTippingOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_defaultTippingOptions;
    self->_defaultTippingOptions = v6;

    v4 = v8;
    defaultTippingOptions = self->_defaultTippingOptions;
  }
  -[NSArray addObject:](defaultTippingOptions, "addObject:", v4);

}

- (unint64_t)defaultTippingOptionsCount
{
  return -[NSArray count](self->_defaultTippingOptions, "count");
}

- (id)defaultTippingOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_defaultTippingOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setFeedbackTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)feedbackTypes
{
  return self->_feedbackTypes.list;
}

- (void)clearFeedbackTypes
{
  PBRepeatedInt32Clear();
}

- (void)addFeedbackType:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)feedbackTypesCount
{
  return self->_feedbackTypes.count;
}

- (int)feedbackTypeAtIndex:(unint64_t)a3
{
  return self->_feedbackTypes.list[a3];
}

- (id)feedbackTypesAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("RATE");
  if (a3 == 2)
  {
    v3 = CFSTR("TIP");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsFeedbackTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RATE")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("TIP")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setMissedPickup:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_missedPickup = a3;
}

- (BOOL)hasMissedPickup
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasMissedPickup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setOutstanding:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_outstanding = a3;
}

- (BOOL)hasOutstanding
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasOutstanding:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)setPaymentAmount:(id)a3
{
  objc_storeStrong((id *)&self->_paymentAmount, a3);
}

- (BOOL)hasPaymentAmount
{
  return self->_paymentAmount != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideCompletionStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBRideCompletionStatus hasCanceled](self, "hasCanceled"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBRideCompletionStatus hasCanceledByService](self, "hasCanceledByService"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBRideCompletionStatus hasCompleted](self, "hasCompleted"))
    PBDataWriterWriteBOOLField();
  -[_INPBRideCompletionStatus completionUserActivity](self, "completionUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBRideCompletionStatus completionUserActivity](self, "completionUserActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_defaultTippingOptions;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (self->_feedbackTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_feedbackTypes.count);
  }
  if (-[_INPBRideCompletionStatus hasMissedPickup](self, "hasMissedPickup", v15))
    PBDataWriterWriteBOOLField();
  if (-[_INPBRideCompletionStatus hasOutstanding](self, "hasOutstanding"))
    PBDataWriterWriteBOOLField();
  -[_INPBRideCompletionStatus paymentAmount](self, "paymentAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBRideCompletionStatus paymentAmount](self, "paymentAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_INPBRideCompletionStatus clearFeedbackTypes](self, "clearFeedbackTypes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBRideCompletionStatus;
  -[_INPBRideCompletionStatus dealloc](&v3, sel_dealloc);
}

- (_INPBRideCompletionStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRideCompletionStatus *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRideCompletionStatus *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRideCompletionStatus *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRideCompletionStatus initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBRideCompletionStatus data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRideCompletionStatus *v5;
  id v6;
  void *v7;
  id v8;

  v5 = -[_INPBRideCompletionStatus init](+[_INPBRideCompletionStatus allocWithZone:](_INPBRideCompletionStatus, "allocWithZone:"), "init");
  if (-[_INPBRideCompletionStatus hasCanceled](self, "hasCanceled"))
    -[_INPBRideCompletionStatus setCanceled:](v5, "setCanceled:", -[_INPBRideCompletionStatus canceled](self, "canceled"));
  if (-[_INPBRideCompletionStatus hasCanceledByService](self, "hasCanceledByService"))
    -[_INPBRideCompletionStatus setCanceledByService:](v5, "setCanceledByService:", -[_INPBRideCompletionStatus canceledByService](self, "canceledByService"));
  if (-[_INPBRideCompletionStatus hasCompleted](self, "hasCompleted"))
    -[_INPBRideCompletionStatus setCompleted:](v5, "setCompleted:", -[_INPBRideCompletionStatus completed](self, "completed"));
  v6 = -[_INPBUserActivity copyWithZone:](self->_completionUserActivity, "copyWithZone:", a3);
  -[_INPBRideCompletionStatus setCompletionUserActivity:](v5, "setCompletionUserActivity:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_defaultTippingOptions, "copyWithZone:", a3);
  -[_INPBRideCompletionStatus setDefaultTippingOptions:](v5, "setDefaultTippingOptions:", v7);

  PBRepeatedInt32Copy();
  if (-[_INPBRideCompletionStatus hasMissedPickup](self, "hasMissedPickup"))
    -[_INPBRideCompletionStatus setMissedPickup:](v5, "setMissedPickup:", -[_INPBRideCompletionStatus missedPickup](self, "missedPickup"));
  if (-[_INPBRideCompletionStatus hasOutstanding](self, "hasOutstanding"))
    -[_INPBRideCompletionStatus setOutstanding:](v5, "setOutstanding:", -[_INPBRideCompletionStatus outstanding](self, "outstanding"));
  v8 = -[_INPBCurrencyAmountValue copyWithZone:](self->_paymentAmount, "copyWithZone:", a3);
  -[_INPBRideCompletionStatus setPaymentAmount:](v5, "setPaymentAmount:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int canceled;
  int v7;
  int canceledByService;
  int v9;
  int completed;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int missedPickup;
  int v25;
  int outstanding;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  v5 = -[_INPBRideCompletionStatus hasCanceled](self, "hasCanceled");
  if (v5 != objc_msgSend(v4, "hasCanceled"))
    goto LABEL_38;
  if (-[_INPBRideCompletionStatus hasCanceled](self, "hasCanceled"))
  {
    if (objc_msgSend(v4, "hasCanceled"))
    {
      canceled = self->_canceled;
      if (canceled != objc_msgSend(v4, "canceled"))
        goto LABEL_38;
    }
  }
  v7 = -[_INPBRideCompletionStatus hasCanceledByService](self, "hasCanceledByService");
  if (v7 != objc_msgSend(v4, "hasCanceledByService"))
    goto LABEL_38;
  if (-[_INPBRideCompletionStatus hasCanceledByService](self, "hasCanceledByService"))
  {
    if (objc_msgSend(v4, "hasCanceledByService"))
    {
      canceledByService = self->_canceledByService;
      if (canceledByService != objc_msgSend(v4, "canceledByService"))
        goto LABEL_38;
    }
  }
  v9 = -[_INPBRideCompletionStatus hasCompleted](self, "hasCompleted");
  if (v9 != objc_msgSend(v4, "hasCompleted"))
    goto LABEL_38;
  if (-[_INPBRideCompletionStatus hasCompleted](self, "hasCompleted"))
  {
    if (objc_msgSend(v4, "hasCompleted"))
    {
      completed = self->_completed;
      if (completed != objc_msgSend(v4, "completed"))
        goto LABEL_38;
    }
  }
  -[_INPBRideCompletionStatus completionUserActivity](self, "completionUserActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionUserActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_37;
  -[_INPBRideCompletionStatus completionUserActivity](self, "completionUserActivity");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_INPBRideCompletionStatus completionUserActivity](self, "completionUserActivity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completionUserActivity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_38;
  }
  else
  {

  }
  -[_INPBRideCompletionStatus defaultTippingOptions](self, "defaultTippingOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultTippingOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_37;
  -[_INPBRideCompletionStatus defaultTippingOptions](self, "defaultTippingOptions");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_INPBRideCompletionStatus defaultTippingOptions](self, "defaultTippingOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultTippingOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_38;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_38;
  v23 = -[_INPBRideCompletionStatus hasMissedPickup](self, "hasMissedPickup");
  if (v23 != objc_msgSend(v4, "hasMissedPickup"))
    goto LABEL_38;
  if (-[_INPBRideCompletionStatus hasMissedPickup](self, "hasMissedPickup"))
  {
    if (objc_msgSend(v4, "hasMissedPickup"))
    {
      missedPickup = self->_missedPickup;
      if (missedPickup != objc_msgSend(v4, "missedPickup"))
        goto LABEL_38;
    }
  }
  v25 = -[_INPBRideCompletionStatus hasOutstanding](self, "hasOutstanding");
  if (v25 != objc_msgSend(v4, "hasOutstanding"))
    goto LABEL_38;
  if (-[_INPBRideCompletionStatus hasOutstanding](self, "hasOutstanding"))
  {
    if (objc_msgSend(v4, "hasOutstanding"))
    {
      outstanding = self->_outstanding;
      if (outstanding != objc_msgSend(v4, "outstanding"))
        goto LABEL_38;
    }
  }
  -[_INPBRideCompletionStatus paymentAmount](self, "paymentAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentAmount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) != (v12 != 0))
  {
    -[_INPBRideCompletionStatus paymentAmount](self, "paymentAmount");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_41:
      v32 = 1;
      goto LABEL_39;
    }
    v28 = (void *)v27;
    -[_INPBRideCompletionStatus paymentAmount](self, "paymentAmount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentAmount");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_41;
  }
  else
  {
LABEL_37:

  }
LABEL_38:
  v32 = 0;
LABEL_39:

  return v32;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (-[_INPBRideCompletionStatus hasCanceled](self, "hasCanceled"))
    v3 = 2654435761 * self->_canceled;
  else
    v3 = 0;
  if (-[_INPBRideCompletionStatus hasCanceledByService](self, "hasCanceledByService"))
    v4 = 2654435761 * self->_canceledByService;
  else
    v4 = 0;
  if (-[_INPBRideCompletionStatus hasCompleted](self, "hasCompleted"))
    v5 = 2654435761 * self->_completed;
  else
    v5 = 0;
  v6 = -[_INPBUserActivity hash](self->_completionUserActivity, "hash");
  v7 = -[NSArray hash](self->_defaultTippingOptions, "hash");
  v8 = PBRepeatedInt32Hash();
  if (-[_INPBRideCompletionStatus hasMissedPickup](self, "hasMissedPickup"))
    v9 = 2654435761 * self->_missedPickup;
  else
    v9 = 0;
  if (-[_INPBRideCompletionStatus hasOutstanding](self, "hasOutstanding"))
    v10 = 2654435761 * self->_outstanding;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[_INPBCurrencyAmountValue hash](self->_paymentAmount, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  int v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBRideCompletionStatus hasCanceled](self, "hasCanceled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRideCompletionStatus canceled](self, "canceled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("canceled"));

  }
  if (-[_INPBRideCompletionStatus hasCanceledByService](self, "hasCanceledByService"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRideCompletionStatus canceledByService](self, "canceledByService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("canceledByService"));

  }
  if (-[_INPBRideCompletionStatus hasCompleted](self, "hasCompleted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRideCompletionStatus completed](self, "completed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("completed"));

  }
  -[_INPBRideCompletionStatus completionUserActivity](self, "completionUserActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("completionUserActivity"));

  if (-[NSArray count](self->_defaultTippingOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = self->_defaultTippingOptions;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("defaultTippingOptions"));
  }
  if (self->_feedbackTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBRideCompletionStatus feedbackTypesCount](self, "feedbackTypesCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBRideCompletionStatus feedbackTypesCount](self, "feedbackTypesCount"))
    {
      v17 = 0;
      do
      {
        v18 = self->_feedbackTypes.list[v17];
        if (v18 == 1)
        {
          v19 = CFSTR("RATE");
        }
        else if (v18 == 2)
        {
          v19 = CFSTR("TIP");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedbackTypes.list[v17]);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v16, "addObject:", v19);

        ++v17;
      }
      while (v17 < -[_INPBRideCompletionStatus feedbackTypesCount](self, "feedbackTypesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("feedbackType"));

  }
  if (-[_INPBRideCompletionStatus hasMissedPickup](self, "hasMissedPickup"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRideCompletionStatus missedPickup](self, "missedPickup"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("missedPickup"));

  }
  if (-[_INPBRideCompletionStatus hasOutstanding](self, "hasOutstanding"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRideCompletionStatus outstanding](self, "outstanding"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("outstanding"));

  }
  -[_INPBRideCompletionStatus paymentAmount](self, "paymentAmount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("paymentAmount"));

  return v3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (BOOL)canceledByService
{
  return self->_canceledByService;
}

- (BOOL)completed
{
  return self->_completed;
}

- (_INPBUserActivity)completionUserActivity
{
  return self->_completionUserActivity;
}

- (NSArray)defaultTippingOptions
{
  return self->_defaultTippingOptions;
}

- (BOOL)missedPickup
{
  return self->_missedPickup;
}

- (BOOL)outstanding
{
  return self->_outstanding;
}

- (_INPBCurrencyAmountValue)paymentAmount
{
  return self->_paymentAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentAmount, 0);
  objc_storeStrong((id *)&self->_defaultTippingOptions, 0);
  objc_storeStrong((id *)&self->_completionUserActivity, 0);
}

+ (Class)defaultTippingOptionsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
