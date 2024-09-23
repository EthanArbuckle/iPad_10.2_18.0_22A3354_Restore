@implementation SKScaleConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKScaleConstraint)initWithXRange:(id)a3 YRange:(id)a4
{
  id v6;
  id v7;
  SKScaleConstraint *v8;
  SKScaleConstraint *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKScaleConstraint;
  v8 = -[SKConstraint init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SKScaleConstraint setXRange:](v8, "setXRange:", v6);
    -[SKScaleConstraint setYRange:](v9, "setYRange:", v7);
  }

  return v9;
}

- (SKScaleConstraint)initWithCoder:(id)a3
{
  id v4;
  SKScaleConstraint *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKScaleConstraint;
  v5 = -[SKConstraint initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_xRange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScaleConstraint setXRange:](v5, "setXRange:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_yRange"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScaleConstraint setYRange:](v5, "setYRange:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKScaleConstraint;
  -[SKConstraint encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SKScaleConstraint xRange](self, "xRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_xRange"));

  -[SKScaleConstraint yRange](self, "yRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_yRange"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKScaleConstraint;
  v4 = -[SKConstraint copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SKScaleConstraint xRange](self, "xRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setXRange:", v5);

  -[SKScaleConstraint yRange](self, "yRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setYRange:", v6);

  return v4;
}

- (BOOL)isEqualToScaleConstraint:(id)a3
{
  SKScaleConstraint *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SKScaleConstraint *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[SKScaleConstraint xRange](self, "xRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScaleConstraint xRange](v4, "xRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToRange:", v6);

    if ((v7 & 1) != 0)
    {
      -[SKScaleConstraint yRange](self, "yRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKScaleConstraint yRange](v4, "yRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToRange:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (id)constraintWithXRange:(id)a3 YRange:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithXRange:YRange:", v5, v6);

  return v7;
}

+ (id)constraintWithScaleRange:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithXRange:YRange:", v3, v3);

  return v4;
}

+ (id)constraintWithXRange:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  +[SKRange rangeWithNoLimits](SKRange, "rangeWithNoLimits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithXRange:YRange:", v3, v5);

  return v6;
}

+ (id)constraintWithYRange:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  +[SKRange rangeWithNoLimits](SKRange, "rangeWithNoLimits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithXRange:YRange:", v5, v3);

  return v6;
}

- (SKRange)xRange
{
  return (SKRange *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXRange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (SKRange)yRange
{
  return (SKRange *)objc_getProperty(self, a2, 32, 1);
}

- (void)setYRange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yRange, 0);
  objc_storeStrong((id *)&self->_xRange, 0);
}

@end
