@implementation SKRotationConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRotationConstraint)initWithZRotationRange:(id)a3
{
  id v4;
  SKRotationConstraint *v5;
  SKRotationConstraint *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRotationConstraint;
  v5 = -[SKConstraint init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SKRotationConstraint setZRotationRange:](v5, "setZRotationRange:", v4);

  return v6;
}

- (SKRotationConstraint)initWithCoder:(id)a3
{
  id v4;
  SKRotationConstraint *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRotationConstraint;
  v5 = -[SKConstraint initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_zRotationRange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKRotationConstraint setZRotationRange:](v5, "setZRotationRange:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKRotationConstraint;
  -[SKConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SKRotationConstraint zRotationRange](self, "zRotationRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_zRotationRange"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKRotationConstraint;
  v4 = -[SKConstraint copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SKRotationConstraint zRotationRange](self, "zRotationRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setZRotationRange:", v5);

  return v4;
}

- (BOOL)isEqualToRotationConstraint:(id)a3
{
  SKRotationConstraint *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (SKRotationConstraint *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    -[SKRotationConstraint zRotationRange](self, "zRotationRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKRotationConstraint zRotationRange](v4, "zRotationRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToRange:", v6);

  }
  return v7;
}

+ (id)constraintWithZRotationRange:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithZRotationRange:", v3);

  return v4;
}

- (SKRange)zRotationRange
{
  return (SKRange *)objc_getProperty(self, a2, 24, 1);
}

- (void)setZRotationRange:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zRotationRange, 0);
}

@end
