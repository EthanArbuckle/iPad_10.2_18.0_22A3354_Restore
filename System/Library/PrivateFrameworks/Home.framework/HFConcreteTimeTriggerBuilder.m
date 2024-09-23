@implementation HFConcreteTimeTriggerBuilder

+ (id)builderForExistingTrigger:(id)a3 inHome:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  HFTimerBasedTimeTriggerBuilder *v13;
  id v14;
  void *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  v10 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v13 = -[HFTimerBasedTimeTriggerBuilder initWithExistingObject:inHome:context:]([HFTimerBasedTimeTriggerBuilder alloc], "initWithExistingObject:inHome:context:", v12, v8, v9);
  }
  else
  {
    objc_opt_class();
    v14 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      v13 = -[HFEventTriggerBuilder initWithExistingObject:inHome:context:]([HFEventTriggerBuilder alloc], "initWithExistingObject:inHome:context:", v16, v8, v9);
    }
    else
    {
      NSLog(CFSTR("Unknown or nil trigger %@"), v14);
      v13 = 0;
    }

  }
  return v13;
}

@end
