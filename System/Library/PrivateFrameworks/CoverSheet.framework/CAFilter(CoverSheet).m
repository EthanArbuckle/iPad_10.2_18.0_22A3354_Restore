@implementation CAFilter(CoverSheet)

+ (id)gaussianFilterWithInputRadius:()CoverSheet
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CD2780]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x1E0CD2C88]);
  objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("inputRadius"));

  objc_msgSend(v3, "setValue:forKey:", CFSTR("medium"), CFSTR("inputQuality"));
  return v3;
}

+ (id)brightnessFilterWithAmount:()CoverSheet
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CD2780]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x1E0CD2BB8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("inputAmount"));

  return v3;
}

+ (id)saturationFilterWithAmount:()CoverSheet
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CD2780]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x1E0CD2C00]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("inputAmount"));

  return v3;
}

+ (id)curvesFilterWithValues:()CoverSheet
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CD2780];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithType:", *MEMORY[0x1E0CD2C20]);
  objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("inputRedValues"));
  objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("inputGreenValues"));
  objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("inputBlueValues"));

  return v6;
}

@end
