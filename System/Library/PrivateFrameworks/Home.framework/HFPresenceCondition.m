@implementation HFPresenceCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  id v5;
  void *v6;
  HFPresenceEventBuilder *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HFUserNameFormatter *v18;
  void *v19;
  HFUserNameFormatter *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  HFConditionUISummary *v34;
  uint64_t v36;
  id v37;

  v5 = a3;
  -[HFPresenceCondition presenceEvent](self, "presenceEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFPresenceEventBuilder initWithEvent:]([HFPresenceEventBuilder alloc], "initWithEvent:", v6);
  -[HFPresenceEventBuilder users](v7, "users");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "type");

  v10 = -[HFPresenceEventBuilder locationEventType](v7, "locationEventType");
  if (v10 == 2)
  {
    if (v9 != (void *)2)
    {
      if (v9 != (void *)1)
      {
        if (!v9)
        {
          v11 = CFSTR("_noUserAtHome");
          goto LABEL_11;
        }
        goto LABEL_14;
      }
      v14 = CFSTR("_currentUserNotAtHome");
      goto LABEL_23;
    }
    v13 = CFSTR("_specificUsersNotAtHome");
    goto LABEL_18;
  }
  if (v10 == 1)
  {
    if (v9 != (void *)2)
    {
      if (v9 != (void *)1)
      {
        if (!v9)
        {
          v11 = CFSTR("_anyUserAtHome");
LABEL_11:
          objc_msgSend(CFSTR("HFConditionNamePresence"), "stringByAppendingString:", v11);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
LABEL_14:
        v9 = 0;
        v12 = CFSTR("HFConditionNamePresence");
        goto LABEL_27;
      }
      v14 = CFSTR("_currentUserAtHome");
LABEL_23:
      objc_msgSend(CFSTR("HFConditionNamePresence"), "stringByAppendingString:", v14);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v13 = CFSTR("_specificUsersAtHome");
LABEL_18:
    objc_msgSend(CFSTR("HFConditionNamePresence"), "stringByAppendingString:", v13);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v12 = CFSTR("HFConditionNamePresence");
  if (v9 != (void *)2)
    goto LABEL_24;
LABEL_19:
  -[HFPresenceCondition presenceEvent](self, "presenceEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "users");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 != 1)
  {
LABEL_24:
    v9 = 0;
    goto LABEL_27;
  }
  v18 = [HFUserNameFormatter alloc];
  objc_msgSend(v5, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HFUserNameFormatter initWithHome:](v18, "initWithHome:", v19);

  -[HFUserNameFormatter setStyle:](v20, "setStyle:", 1);
  objc_msgSend(v6, "users");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 == 1)
  {
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("_oneUserFormat"));
    v36 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "users");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hf_handleForUser:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFUserNameFormatter stringForObjectValue:](v20, "stringForObjectValue:", v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v36;
  }
  else
  {
    v9 = 0;
  }

LABEL_27:
  if (objc_msgSend(v5, "formattingStyle") != 3)
  {
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("_short"));
    v27 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v27;
  }
  _HFLocalizedStringWithDefaultValue(v12, 0, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    if (v9)
    {
      v37 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v28, CFSTR("%@"), &v37, v9);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v37;

      if (!v30)
      {
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Couldn't localize format string in %@. Most likely, the format specifiers don't match. %@"), v32, v31);

      }
      v29 = (void *)v30;
    }
  }
  else
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFConditionNamePresence_Custom"), CFSTR("HFConditionNamePresence_Custom"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "formattingContext") != 5)
  {
    objc_msgSend(v29, "hf_stringByCapitalizingFirstWord");
    v33 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v33;
  }
  v34 = -[HFConditionUISummary initWithCondition:title:description:]([HFConditionUISummary alloc], "initWithCondition:title:description:", self, v29, 0);

  return v34;
}

- (HFPresenceCondition)initWithPredicate:(id)a3
{
  id v4;
  HFPresenceCondition *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HFPresenceCondition *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  void *v18;
  HMPresenceEvent *v19;
  HMPresenceEvent *v20;
  HMPresenceEvent *v21;
  void *v22;
  void *v23;
  HMPresenceEvent *presenceEvent;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HFPresenceCondition;
  v5 = -[HFCondition initWithPredicate:](&v26, sel_initWithPredicate_, v4);
  if (!v5)
    goto LABEL_20;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
    goto LABEL_10;
  objc_msgSend(v8, "leftExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "expressionType") != 3)
    goto LABEL_9;
  objc_msgSend(v8, "leftExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB9880]);

  if (v12)
  {
    objc_msgSend(v8, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "expressionType"))
    {
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(v8, "rightExpression");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constantValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_10;
    v17 = objc_opt_class();
    objc_msgSend(v8, "rightExpression");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constantValue");
    v19 = (HMPresenceEvent *)(id)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v19;
      if (v20)
        goto LABEL_19;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v17, objc_opt_class());

    }
    v21 = 0;
LABEL_19:

    presenceEvent = v5->_presenceEvent;
    v5->_presenceEvent = v21;

LABEL_20:
    v13 = v5;
    goto LABEL_21;
  }
LABEL_10:

  v13 = 0;
LABEL_21:

  return v13;
}

- (HFPresenceCondition)initWithPresenceEvent:(id)a3
{
  void *v4;
  HFPresenceCondition *v5;

  objc_msgSend(MEMORY[0x1E0CBA4D0], "predicateForEvaluatingTriggerWithPresence:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFPresenceCondition initWithPredicate:](self, "initWithPredicate:", v4);

  return v5;
}

- (HMPresenceEvent)presenceEvent
{
  return self->_presenceEvent;
}

- (void)setPresenceEvent:(id)a3
{
  objc_storeStrong((id *)&self->_presenceEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenceEvent, 0);
}

@end
