@implementation IKSlideshowElement

- (int64_t)showSettings
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = (void *)objc_opt_class();
  -[IKViewElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "ik_valueForBooleanAttribute:", v5);

  return v6;
}

- (NSArray)images
{
  return (NSArray *)-[IKViewElement childElementsWithType:](self, "childElementsWithType:", 49);
}

- (unint64_t)transition
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[IKViewElementStyle transitionFromString:](IKViewElementStyle, "transitionFromString:", v3);

  return v4;
}

- (double)transitionInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

@end
