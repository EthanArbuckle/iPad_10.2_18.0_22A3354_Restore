@implementation HMCameraBulletinBoardNotificationCondition

- (HMCameraBulletinBoardNotificationCondition)initWithPredicate:(id)a3
{
  id v4;
  void *v5;
  HMCameraBulletinBoardNotificationCondition *v6;
  void *v7;
  HMCameraBulletinBoardNotificationCondition *v8;
  HMCameraBulletinBoardNotificationCondition *v10;
  SEL v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = -[HMCameraBulletinBoardNotificationCondition init](self, "init");
    v7 = (void *)-[HMCameraBulletinBoardNotificationCondition mutableCopy](v6, "mutableCopy");
    +[HMCameraBulletinBoardNotificationCondition _updateCondition:usingPredicate:]((uint64_t)HMCameraBulletinBoardNotificationCondition, v7, v5);
    v8 = (HMCameraBulletinBoardNotificationCondition *)objc_msgSend(v7, "copy");

    return v8;
  }
  else
  {
    v10 = (HMCameraBulletinBoardNotificationCondition *)_HMFPreconditionFailure();
    return -[HMCameraBulletinBoardNotificationCondition init](v10, v11);
  }
}

- (HMCameraBulletinBoardNotificationCondition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraBulletinBoardNotificationCondition;
  return -[HMCameraBulletinBoardNotificationCondition init](&v3, sel_init);
}

- (NSPredicate)predicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition significantEventReasonCondition](self, "significantEventReasonCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMCameraBulletinBoardNotificationCondition significantEventReasonCondition](self, "significantEventReasonCondition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[HMCameraBulletinBoardNotificationCondition significantEventPersonFamiliarityCondition](self, "significantEventPersonFamiliarityCondition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMCameraBulletinBoardNotificationCondition significantEventPersonFamiliarityCondition](self, "significantEventPersonFamiliarityCondition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[HMCameraBulletinBoardNotificationCondition dateComponentsPredicate](self, "dateComponentsPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMCameraBulletinBoardNotificationCondition dateComponentsPredicate](self, "dateComponentsPredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMCameraBulletinBoardNotificationCondition presencePredicate](self, "presencePredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMCameraBulletinBoardNotificationCondition presencePredicate](self, "presencePredicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCameraBulletinBoardNotificationCondition *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(HMMutableCameraBulletinBoardNotificationCondition);
  -[HMCameraBulletinBoardNotificationCondition significantEventReasonCondition](self, "significantEventReasonCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition setSignificantEventReasonCondition:](v4, "setSignificantEventReasonCondition:", v5);

  -[HMCameraBulletinBoardNotificationCondition significantEventPersonFamiliarityCondition](self, "significantEventPersonFamiliarityCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition setSignificantEventPersonFamiliarityCondition:](v4, "setSignificantEventPersonFamiliarityCondition:", v6);

  -[HMCameraBulletinBoardNotificationCondition dateComponentsPredicate](self, "dateComponentsPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition setDateComponentsPredicate:](v4, "setDateComponentsPredicate:", v7);

  -[HMCameraBulletinBoardNotificationCondition presencePredicate](self, "presencePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition setPresencePredicate:](v4, "setPresencePredicate:", v8);

  return v4;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition significantEventReasonCondition](self, "significantEventReasonCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCameraBulletinBoardNotificationCondition significantEventReasonCondition](self, "significantEventReasonCondition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Significant Event Reason"), v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  -[HMCameraBulletinBoardNotificationCondition significantEventPersonFamiliarityCondition](self, "significantEventPersonFamiliarityCondition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCameraBulletinBoardNotificationCondition significantEventPersonFamiliarityCondition](self, "significantEventPersonFamiliarityCondition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Person Familiarity"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMCameraBulletinBoardNotificationCondition dateComponentsPredicate](self, "dateComponentsPredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCameraBulletinBoardNotificationCondition dateComponentsPredicate](self, "dateComponentsPredicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Date Components"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  -[HMCameraBulletinBoardNotificationCondition presencePredicate](self, "presencePredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCameraBulletinBoardNotificationCondition presencePredicate](self, "presencePredicate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Presence"), v18);
    objc_msgSend(v3, "addObject:", v19);

  }
  v20 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v20;
}

- (HMCameraSignificantEventReasonNotificationCondition)significantEventReasonCondition
{
  return (HMCameraSignificantEventReasonNotificationCondition *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSignificantEventReasonCondition:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (HMCameraSignificantEventPersonFamiliarityNotificationCondition)significantEventPersonFamiliarityCondition
{
  return (HMCameraSignificantEventPersonFamiliarityNotificationCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSignificantEventPersonFamiliarityCondition:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSPredicate)dateComponentsPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDateComponentsPredicate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSPredicate)presencePredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPresencePredicate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presencePredicate, 0);
  objc_storeStrong((id *)&self->_dateComponentsPredicate, 0);
  objc_storeStrong((id *)&self->_significantEventPersonFamiliarityCondition, 0);
  objc_storeStrong((id *)&self->_significantEventReasonCondition, 0);
}

+ (void)_updateCondition:(void *)a3 usingPredicate:
{
  id v4;
  id v5;
  uint64_t v6;
  HMCameraSignificantEventReasonNotificationCondition *v7;
  HMCameraSignificantEventPersonFamiliarityNotificationCondition *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  v7 = -[HMCameraSignificantEventReasonNotificationCondition initWithPredicate:]([HMCameraSignificantEventReasonNotificationCondition alloc], "initWithPredicate:", v5);
  if (!v7)
  {
    v8 = -[HMCameraSignificantEventPersonFamiliarityNotificationCondition initWithPredicate:]([HMCameraSignificantEventPersonFamiliarityNotificationCondition alloc], "initWithPredicate:", v5);
    if (v8)
    {
      objc_msgSend(v4, "setSignificantEventPersonFamiliarityCondition:", v8);
LABEL_36:

      goto LABEL_37;
    }
    v9 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (!v11)
    {
      v22 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      v24 = v23;

      if (v24)
      {
        if (+[HMCameraBulletinBoardNotificationCondition isDateComponentsComparisonPredicate:](v6, v24))
        {
          objc_msgSend(v4, "setDateComponentsPredicate:", v24);
        }
        else if (+[HMCameraBulletinBoardNotificationCondition isPresenceComparisonPredicate:](v6, v24))
        {
          objc_msgSend(v4, "setPresencePredicate:", v24);
        }
      }
      goto LABEL_34;
    }
    v12 = v11;
    v30 = objc_opt_self();
    objc_msgSend(v12, "subpredicates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count") == 2)
    {
      v29 = v11;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      v20 = +[HMCameraBulletinBoardNotificationCondition isDateComponentsComparisonPredicate:](v30, v16);
      if ((v20 & 1) != 0)
      {
        v21 = +[HMCameraBulletinBoardNotificationCondition isDateComponentsComparisonPredicate:](v30, v19);

        v11 = v29;
        if (v21)
        {
          objc_msgSend(v4, "setDateComponentsPredicate:", v12);
LABEL_35:

          goto LABEL_36;
        }
        goto LABEL_27;
      }

      v11 = v29;
    }

LABEL_27:
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v12, "subpredicates");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          +[HMCameraBulletinBoardNotificationCondition _updateCondition:usingPredicate:](v6, v4, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v26);
    }
LABEL_34:

    goto LABEL_35;
  }
  objc_msgSend(v4, "setSignificantEventReasonCondition:", v7);
LABEL_37:

}

+ (uint64_t)isDateComponentsComparisonPredicate:(uint64_t)a1
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "rightExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "expressionType"))
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_msgSend(v2, "rightExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constantValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

+ (uint64_t)isPresenceComparisonPredicate:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "leftExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "expressionType") == 3)
  {
    objc_msgSend(v2, "leftExpression");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("presence"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
