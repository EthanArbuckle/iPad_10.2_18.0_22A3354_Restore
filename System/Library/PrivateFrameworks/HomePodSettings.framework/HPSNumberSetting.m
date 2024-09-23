@implementation HPSNumberSetting

- (int64_t)integerValue
{
  void *v2;
  int64_t v3;

  -[HPSNumberSetting numberValue](self, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (float)floatValue
{
  void *v2;
  float v3;
  float v4;

  -[HPSNumberSetting numberValue](self, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (double)doubleValue
{
  void *v2;
  double v3;
  double v4;

  -[HPSNumberSetting numberValue](self, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end
