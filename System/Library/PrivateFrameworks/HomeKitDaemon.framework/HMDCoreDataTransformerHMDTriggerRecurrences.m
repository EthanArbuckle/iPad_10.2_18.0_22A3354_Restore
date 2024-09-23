@implementation HMDCoreDataTransformerHMDTriggerRecurrences

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCoreDataTransformerHMDTriggerRecurrences *v8;
  SEL v9;
  id v10;
  objc_super v11;

  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDCoreDataTransformerHMDTriggerRecurrences;
    -[HMDSecureUnarchiveFromDataTransformer transformedValue:](&v11, sel_transformedValue_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", HMDaysOfTheWeekFromDateComponents());
    v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    return v6;
  }
  v8 = (HMDCoreDataTransformerHMDTriggerRecurrences *)_HMFPreconditionFailure();
  return -[HMDCoreDataTransformerHMDTriggerRecurrences reverseTransformedValue:](v8, v9, v10);
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  SEL v14;
  objc_super v15;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v11 = 0;
LABEL_11:

    return v11;
  }
  v6 = v4;
  objc_opt_class();
  v7 = objc_opt_isKindOfClass() & 1;
  if (v7)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (v7)
  {
    if (objc_msgSend(v6, "unsignedIntegerValue"))
    {
      HMDaysOfTheWeekToDateComponents();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15.receiver = self;
      v15.super_class = (Class)HMDCoreDataTransformerHMDTriggerRecurrences;
      -[NSSecureUnarchiveFromDataTransformer reverseTransformedValue:](&v15, sel_reverseTransformedValue_, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

    goto LABEL_11;
  }
  v13 = (void *)_HMFPreconditionFailure();
  return +[HMDCoreDataTransformerHMDTriggerRecurrences allowedTopLevelClasses](v13, v14);
}

+ (id)allowedTopLevelClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
