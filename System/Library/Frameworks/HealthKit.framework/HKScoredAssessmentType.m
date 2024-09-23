@implementation HKScoredAssessmentType

- (HKScoredAssessmentType)initWithIdentifier:(id)a3
{
  id v4;
  HKScoredAssessmentType *v5;

  v4 = a3;
  +[HKObjectType scoredAssessmentTypeForIdentifier:](HKObjectType, "scoredAssessmentTypeForIdentifier:", v4);
  v5 = (HKScoredAssessmentType *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid %@ identifier \"%@\"), objc_opt_class(), v4);

  return v5;
}

+ (id)gad7Type
{
  return -[HKScoredAssessmentType initWithIdentifier:]([HKScoredAssessmentType alloc], "initWithIdentifier:", CFSTR("HKScoredAssessmentTypeIdentifierGAD7"));
}

+ (id)phq9Type
{
  return -[HKScoredAssessmentType initWithIdentifier:]([HKScoredAssessmentType alloc], "initWithIdentifier:", CFSTR("HKScoredAssessmentTypeIdentifierPHQ9"));
}

@end
