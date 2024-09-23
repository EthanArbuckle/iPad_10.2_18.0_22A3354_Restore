@implementation NSManagedObjectModel(VSSubscriptionAdditions)

+ (id)vs_subscriptionModelForVersion:()VSSubscriptionAdditions
{
  id v4;
  id v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0C97B98]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C97B20], "vs_subscriptionEntityForVersion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(v4, "setEntities:", v5);

  return v4;
}

@end
