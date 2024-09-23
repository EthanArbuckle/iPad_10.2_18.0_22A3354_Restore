@implementation MAMutableFloatMatrix

- (void)setFloat:(float)a3 atRow:(int64_t)a4 column:(int64_t)a5
{
  double v8;
  id v9;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v9, "setFloat:atRow:column:", a4, a5, v8);

}

- (void)subtractMatrix:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subtract:", v5);
}

- (void)subtractScalar:(float)a3
{
  double v4;
  id v5;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "subtractScalar:", v4);

}

- (void)addScalar:(float)a3
{
  double v4;
  id v5;

  -[MAFloatMatrix wrapper](self, "wrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "addScalar:", v4);

}

- (void)appendRow:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MAFloatMatrix wrapper](self, "wrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendRow:", v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MAFloatMatrix *v4;
  void *v5;
  void *v6;
  MAFloatMatrix *v7;

  v4 = +[MAFloatMatrix allocWithZone:](MAFloatMatrix, "allocWithZone:", a3);
  -[MAFloatMatrix wrapper](self, "wrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[MAFloatMatrix initWithWrapper:](v4, "initWithWrapper:", v6);

  return v7;
}

+ (Class)wrapperClass
{
  return (Class)objc_opt_class();
}

@end
