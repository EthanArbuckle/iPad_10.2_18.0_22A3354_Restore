@implementation DRSRequestOutcomeStats

+ (id)keyName
{
  return CFSTR("RequestOutcome");
}

+ (id)descriptionStringForRequest:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "requestOutcomeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v6);
  return v7;
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end
