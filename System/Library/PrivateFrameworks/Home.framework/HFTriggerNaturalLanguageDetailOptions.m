@implementation HFTriggerNaturalLanguageDetailOptions

+ (id)detailOptionsWithOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:nameType:", v5, objc_msgSend(v3, "nameType"));

  objc_msgSend(v6, "_copyFromOptions:", v3);
  return v6;
}

- (void)_copyFromOptions:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HFTriggerNaturalLanguageDetailOptions;
  -[HFTriggerNaturalLanguageOptions _copyFromOptions:](&v3, sel__copyFromOptions_, a3);
}

@end
