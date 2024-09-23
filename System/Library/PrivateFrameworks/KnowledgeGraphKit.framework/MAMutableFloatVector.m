@implementation MAMutableFloatVector

- (void)appendFloat:(float)a3
{
  double v4;
  id v5;

  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "appendFloat:", v4);

}

- (void)appendFloats:(const float *)a3 count:(int64_t)a4
{
  id v6;

  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFloats:count:", a3, a4);

}

- (void)appendDoubles:(const double *)a3 count:(int64_t)a4
{
  id v6;

  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendDoubles:count:", a3, a4);

}

- (void)appendVector:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendVector:", v5);
}

- (void)appendArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArray:", v4);

}

- (void)setFloat:(float)a3 atIndex:(int64_t)a4
{
  double v6;
  id v7;

  -[MAFloatVector wrapper](self, "wrapper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v7, "setFloat:atIndex:", a4, v6);

}

- (void)subtractVector:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subtractVector:", v5);
}

- (void)addVector:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addVector:", v5);
}

- (void)subtractScalar:(float)a3
{
  double v4;
  id v5;

  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "subtractScalar:", v4);

}

- (void)addScalar:(float)a3
{
  double v4;
  id v5;

  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "addScalar:", v4);

}

- (void)multiplyByScalar:(float)a3
{
  double v4;
  id v5;

  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "multiplyByScalar:", v4);

}

- (void)divideByScalar:(float)a3
{
  double v4;
  id v5;

  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "divideByScalar:", v4);

}

- (void)elementwiseMultiplyByVector:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MAFloatVector wrapper](self, "wrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "elementwiseMultiplyByWrapper:", v5);
}

- (void)elementwiseRaiseToExponent:(float)a3
{
  double v4;
  id v5;

  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "elementwiseRaiseToExponent:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  MAFloatVector *v4;
  void *v5;
  void *v6;
  MAFloatVector *v7;

  v4 = +[MAFloatVector allocWithZone:](MAFloatVector, "allocWithZone:", a3);
  -[MAFloatVector wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[MAFloatVector initWithWrapper:](v4, "initWithWrapper:", v6);

  return v7;
}

+ (Class)wrapperClass
{
  return (Class)objc_opt_class();
}

@end
