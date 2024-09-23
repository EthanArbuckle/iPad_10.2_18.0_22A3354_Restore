@implementation ARBody2D

- (ARBody2D)initWithSkeleton2D:(id)a3
{
  id v5;
  ARBody2D *v6;
  ARBody2D *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARBody2D;
  v6 = -[ARBody2D init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_skeleton, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_skeleton, CFSTR("skeleton"));
}

- (ARBody2D)initWithCoder:(id)a3
{
  id v4;
  ARBody2D *v5;
  uint64_t v6;
  ARSkeleton2D *skeleton;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARBody2D;
  v5 = -[ARBody2D init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("skeleton"));
    v6 = objc_claimAutoreleasedReturnValue();
    skeleton = v5->_skeleton;
    v5->_skeleton = (ARSkeleton2D *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ARSkeleton2D isEqual:](self->_skeleton, "isEqual:", v4[1]);

  return v5;
}

- (ARSkeleton2D)skeleton
{
  return self->_skeleton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton, 0);
}

@end
