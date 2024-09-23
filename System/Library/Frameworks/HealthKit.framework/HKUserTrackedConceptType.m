@implementation HKUserTrackedConceptType

- (HKUserTrackedConceptType)initWithIdentifier:(id)a3
{
  id v4;
  HKUserTrackedConceptType *v5;

  v4 = a3;
  +[HKObjectType userTrackedConceptTypeForIdentifier:](HKObjectType, "userTrackedConceptTypeForIdentifier:", v4);
  v5 = (HKUserTrackedConceptType *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid %@ identifier \"%@\"), objc_opt_class(), v4);

  return v5;
}

@end
