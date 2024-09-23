@implementation SKSizeConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSizeConstraint)initWithWidthRange:(id)a3 heightRange:(id)a4
{
  id v6;
  id v7;
  SKSizeConstraint *v8;
  SKSizeConstraint *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKSizeConstraint;
  v8 = -[SKConstraint init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SKSizeConstraint setWidthRange:](v8, "setWidthRange:", v6);
    -[SKSizeConstraint setHeightRange:](v9, "setHeightRange:", v7);
  }

  return v9;
}

- (SKSizeConstraint)initWithCoder:(id)a3
{
  id v4;
  SKSizeConstraint *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKSizeConstraint;
  v5 = -[SKConstraint initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_widthRange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSizeConstraint setWidthRange:](v5, "setWidthRange:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_heightRange"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSizeConstraint setHeightRange:](v5, "setHeightRange:", v7);

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
  v7.super_class = (Class)SKSizeConstraint;
  -[SKConstraint encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SKSizeConstraint widthRange](self, "widthRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_widthRange"));

  -[SKSizeConstraint heightRange](self, "heightRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_heightRange"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKSizeConstraint;
  v4 = -[SKConstraint copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SKSizeConstraint widthRange](self, "widthRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidthRange:", v5);

  -[SKSizeConstraint heightRange](self, "heightRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeightRange:", v6);

  return v4;
}

- (BOOL)isEqualToSizeConstraint:(id)a3
{
  SKSizeConstraint *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SKSizeConstraint *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[SKSizeConstraint widthRange](self, "widthRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSizeConstraint widthRange](v4, "widthRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToRange:", v6);

    if ((v7 & 1) != 0)
    {
      -[SKSizeConstraint heightRange](self, "heightRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKSizeConstraint heightRange](v4, "heightRange");
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

+ (id)constraintWithWidthRange:(id)a3 heightRange:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWidthRange:heightRange:", v5, v6);

  return v7;
}

+ (id)constraintWithWidthRange:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  +[SKRange rangeWithNoLimits](SKRange, "rangeWithNoLimits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithWidthRange:heightRange:", v3, v5);

  return v6;
}

+ (id)constraintWithHeightRange:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  +[SKRange rangeWithNoLimits](SKRange, "rangeWithNoLimits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithWidthRange:heightRange:", v5, v3);

  return v6;
}

- (SKRange)widthRange
{
  return (SKRange *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWidthRange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (SKRange)heightRange
{
  return (SKRange *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHeightRange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightRange, 0);
  objc_storeStrong((id *)&self->_widthRange, 0);
}

@end
