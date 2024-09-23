@implementation HMCameraSignificantEventPersonFamiliarityNotificationCondition

- (HMCameraSignificantEventPersonFamiliarityNotificationCondition)initWithPredicate:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMCameraSignificantEventPersonFamiliarityNotificationCondition *v11;
  HMCameraSignificantEventPersonFamiliarityNotificationCondition *v13;
  SEL v14;
  unint64_t v15;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      +[HMPredicateUtilities personFamiliarityOptionsInComparisonPredicate:](HMPredicateUtilities, "personFamiliarityOptionsInComparisonPredicate:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        self = -[HMCameraSignificantEventPersonFamiliarityNotificationCondition initWithPersonFamiliarityOptions:](self, "initWithPersonFamiliarityOptions:", objc_msgSend(v9, "integerValue"));
        v11 = self;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

    return v11;
  }
  else
  {
    v13 = (HMCameraSignificantEventPersonFamiliarityNotificationCondition *)_HMFPreconditionFailure();
    return -[HMCameraSignificantEventPersonFamiliarityNotificationCondition initWithPersonFamiliarityOptions:](v13, v14, v15);
  }
}

- (HMCameraSignificantEventPersonFamiliarityNotificationCondition)initWithPersonFamiliarityOptions:(unint64_t)a3
{
  HMCameraSignificantEventPersonFamiliarityNotificationCondition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMCameraSignificantEventPersonFamiliarityNotificationCondition;
  result = -[HMCameraSignificantEventPersonFamiliarityNotificationCondition init](&v5, sel_init);
  if (result)
    result->_personFamiliarityOptions = a3;
  return result;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)+[HMCameraBulletinBoardSmartNotification predicateForPersonFamiliarityOptions:](HMCameraBulletinBoardSmartNotification, "predicateForPersonFamiliarityOptions:", -[HMCameraSignificantEventPersonFamiliarityNotificationCondition personFamiliarityOptions](self, "personFamiliarityOptions"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = -[HMCameraSignificantEventPersonFamiliarityNotificationCondition personFamiliarityOptions](self, "personFamiliarityOptions");
    v8 = v7 == objc_msgSend(v6, "personFamiliarityOptions");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v8 = -[HMCameraSignificantEventPersonFamiliarityNotificationCondition personFamiliarityOptions](self, "personFamiliarityOptions");
  NSPrintF();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Person Familiarity"), v4, v8, &unk_19B44CEFE);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (unint64_t)personFamiliarityOptions
{
  return self->_personFamiliarityOptions;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
