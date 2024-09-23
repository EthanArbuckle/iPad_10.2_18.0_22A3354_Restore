@implementation QLRoundProgressLayer

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("progress")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___QLRoundProgressLayer;
    v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (QLRoundProgressLayer)initWithLayer:(id)a3
{
  id v4;
  QLRoundProgressLayer *v5;
  QLRoundProgressLayer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QLRoundProgressLayer;
  v5 = -[QLRoundProgressLayer initWithLayer:](&v8, sel_initWithLayer_, v4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "progress");
      -[QLRoundProgressLayer setProgress:](v5, "setProgress:");
    }
    v6 = v5;
  }

  return v5;
}

- (BOOL)needsDisplayOnBoundsChange
{
  return 1;
}

@end
