@implementation CAFilter(AmbientUI)

+ (id)gaussianFilterWithInputRadius:()AmbientUI
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDE56B0]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x24BDE5A78]);
  objc_msgSend(v3, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inputNormalizeEdges"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("inputRadius"));

  objc_msgSend(v3, "setValue:forKey:", CFSTR("medium"), CFSTR("inputQuality"));
  return v3;
}

+ (id)brightnessFilterWithAmount:()AmbientUI
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDE56B0]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x24BDE59D0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("inputAmount"));

  return v3;
}

+ (id)saturationFilterWithAmount:()AmbientUI
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDE56B0]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x24BDE5A10]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("inputAmount"));

  return v3;
}

+ (id)curvesFilterWithValues:()AmbientUI
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDE56B0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithType:", *MEMORY[0x24BDE5A20]);
  objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("inputRedValues"));
  objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("inputGreenValues"));
  objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("inputBlueValues"));

  return v6;
}

@end
