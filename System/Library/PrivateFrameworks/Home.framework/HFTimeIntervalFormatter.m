@implementation HFTimeIntervalFormatter

- (id)stringForObjectValue:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    -[NSDateComponentsFormatter stringFromTimeInterval:](self, "stringFromTimeInterval:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HFTimeIntervalFormatter;
    -[NSDateComponentsFormatter stringForObjectValue:](&v9, sel_stringForObjectValue_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
