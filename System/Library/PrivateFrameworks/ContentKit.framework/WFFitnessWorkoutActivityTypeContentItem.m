@implementation WFFitnessWorkoutActivityTypeContentItem

- (id)activityType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", getFIUIWorkoutActivityTypeClass());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityTypeIdentifier
{
  void *v2;
  void *v3;

  -[WFFitnessWorkoutActivityTypeContentItem activityType](self, "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)itemWithActivityType:(id)a3
{
  return +[WFContentItem itemWithObject:](WFFitnessWorkoutActivityTypeContentItem, "itemWithObject:", a3);
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  getFIUIWorkoutActivityTypeClass();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Workout Activity Type"), CFSTR("Workout Activity Type"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Workout Activity Types"), CFSTR("Workout Activity Types"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Activities"));
}

@end
