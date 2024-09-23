@implementation AVMutableValueTiming

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)setAnchorValue:(double)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v5);
}

- (void)setAnchorTimeStamp:(double)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v5);
}

- (void)setRate:(double)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation(self, a2, v5);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return +[AVMutableValueTiming allocWithZone:](AVConcreteMutableValueTiming, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AVMutableValueTiming;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (void)setValueTiming:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  objc_msgSend(v4, "anchorValue");
  -[AVMutableValueTiming setAnchorValue:](self, "setAnchorValue:");
  objc_msgSend(v4, "anchorTimeStamp");
  -[AVMutableValueTiming setAnchorTimeStamp:](self, "setAnchorTimeStamp:");
  objc_msgSend(v4, "rate");
  v6 = v5;

  -[AVMutableValueTiming setRate:](self, "setRate:", v6);
}

@end
