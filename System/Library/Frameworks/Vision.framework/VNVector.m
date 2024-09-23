@implementation VNVector

- (VNVector)init
{
  return -[VNVector initWithXComponent:yComponent:](self, "initWithXComponent:yComponent:", 0.0, 0.0);
}

- (VNVector)initWithXComponent:(double)x yComponent:(double)y
{
  VNVector *v6;
  VNVector *v7;
  VNPoint *v9;
  VNPoint *vectorProjections;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNVector;
  v6 = -[VNVector init](&v11, sel_init);
  if (v6
    && (*(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v9 = -[VNPoint initWithX:y:]([VNPoint alloc], "initWithX:y:", x, y);
    vectorProjections = v6->_vectorProjections;
    v6->_vectorProjections = v9;

    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (VNVector)initWithR:(double)r theta:(double)theta
{
  VNVector *v6;
  __double2 v7;

  if ((*(_QWORD *)&r & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(_QWORD *)&theta & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v7 = __sincos_stret(theta);
    self = -[VNVector initWithXComponent:yComponent:](self, "initWithXComponent:yComponent:", v7.__cosval * r, v7.__sinval * r);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VNVector)initWithVectorHead:(VNPoint *)head tail:(VNPoint *)tail
{
  VNPoint *v6;
  VNPoint *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  VNVector *v15;

  v6 = head;
  v7 = tail;
  -[VNPoint x](v7, "x");
  v9 = v8;
  -[VNPoint x](v6, "x");
  v11 = v10;
  -[VNPoint y](v7, "y");
  v13 = v12;
  -[VNPoint y](v6, "y");
  v15 = -[VNVector initWithXComponent:yComponent:](self, "initWithXComponent:yComponent:", v9 - v11, v13 - v14);

  return v15;
}

- (VNVector)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  VNVector *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vproj"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "x");
  v8 = v7;
  objc_msgSend(v6, "y");
  v10 = -[VNVector initWithXComponent:yComponent:](self, "initWithXComponent:yComponent:", v8, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_vectorProjections, CFSTR("vproj"));
}

- (double)x
{
  double result;

  -[VNPoint x](self->_vectorProjections, "x");
  return result;
}

- (double)y
{
  double result;

  -[VNPoint y](self->_vectorProjections, "y");
  return result;
}

- (double)theta
{
  double v3;
  double v4;
  double v5;

  -[VNPoint y](self->_vectorProjections, "y");
  v4 = v3;
  -[VNPoint x](self->_vectorProjections, "x");
  return atan(v4 / v5);
}

- (double)length
{
  double v2;

  -[VNVector squaredLength](self, "squaredLength");
  return sqrt(v2);
}

- (double)squaredLength
{
  double v3;
  double v4;
  double v5;

  -[VNVector x](self, "x");
  v4 = v3 * v3;
  -[VNVector y](self, "y");
  return v4 + v5 * v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNVector;
  return -[VNPoint hash](self->_vectorProjections, "hash") ^ __ROR8__(-[VNVector hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VNPoint *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = self->_vectorProjections;
    v6 = VisionCoreEqualOrNilObjects();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VNVector x](self, "x");
  v5 = v4;
  -[VNVector y](self, "y");
  v7 = v6;
  -[VNVector r](self, "r");
  v9 = v8;
  -[VNVector theta](self, "theta");
  return objc_autoreleaseReturnValue((id)objc_msgSend(v3, "initWithFormat:", CFSTR("(x; y) = (%f; %f); (r; theta) = (%f; %f)"),
                                           v5,
                                           v7,
                                           v9,
                                           v10));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorProjections, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (VNVector)zeroVector
{
  if (+[VNVector zeroVector]::onceToken != -1)
    dispatch_once(&+[VNVector zeroVector]::onceToken, &__block_literal_global_23090);
  return (VNVector *)(id)+[VNVector zeroVector]::zeroVector;
}

+ (VNVector)unitVectorForVector:(VNVector *)vector
{
  VNVector *v4;
  double v5;
  double v6;
  uint64_t v7;
  VNVector *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v4 = vector;
  -[VNVector length](v4, "length");
  v6 = v5;
  if (v5 == 0.0)
  {
    v7 = objc_msgSend(a1, "copy");
  }
  else
  {
    v8 = [VNVector alloc];
    -[VNVector x](v4, "x");
    v10 = v9;
    -[VNVector y](v4, "y");
    v7 = -[VNVector initWithXComponent:yComponent:](v8, "initWithXComponent:yComponent:", v10 / v6, v11 / v6);
  }
  v12 = (void *)v7;

  return (VNVector *)v12;
}

+ (VNVector)vectorByMultiplyingVector:(VNVector *)vector byScalar:(double)scalar
{
  VNVector *v5;
  VNVector *v6;
  double v7;
  double v8;
  double v9;
  VNVector *v10;

  v5 = vector;
  v6 = [VNVector alloc];
  -[VNVector x](v5, "x");
  v8 = v7;
  -[VNVector y](v5, "y");
  v10 = -[VNVector initWithXComponent:yComponent:](v6, "initWithXComponent:yComponent:", v8 * scalar, v9 * scalar);

  return v10;
}

+ (VNVector)vectorByAddingVector:(VNVector *)v1 toVector:(VNVector *)v2
{
  VNVector *v5;
  VNVector *v6;
  VNVector *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  VNVector *v15;

  v5 = v1;
  v6 = v2;
  v7 = [VNVector alloc];
  -[VNVector x](v5, "x");
  v9 = v8;
  -[VNVector x](v6, "x");
  v11 = v10;
  -[VNVector y](v5, "y");
  v13 = v12;
  -[VNVector y](v6, "y");
  v15 = -[VNVector initWithXComponent:yComponent:](v7, "initWithXComponent:yComponent:", v9 + v11, v13 + v14);

  return v15;
}

+ (VNVector)vectorBySubtractingVector:(VNVector *)v1 fromVector:(VNVector *)v2
{
  VNVector *v5;
  VNVector *v6;
  VNVector *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  VNVector *v15;

  v5 = v1;
  v6 = v2;
  v7 = [VNVector alloc];
  -[VNVector x](v6, "x");
  v9 = v8;
  -[VNVector x](v5, "x");
  v11 = v10;
  -[VNVector y](v6, "y");
  v13 = v12;
  -[VNVector y](v5, "y");
  v15 = -[VNVector initWithXComponent:yComponent:](v7, "initWithXComponent:yComponent:", v9 - v11, v13 - v14);

  return v15;
}

+ (double)dotProductOfVector:(VNVector *)v1 vector:(VNVector *)v2
{
  VNVector *v5;
  VNVector *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = v1;
  v6 = v2;
  -[VNVector x](v5, "x");
  v8 = v7;
  -[VNVector x](v6, "x");
  v10 = v9;
  -[VNVector y](v5, "y");
  v12 = v11;
  -[VNVector y](v6, "y");
  v14 = v12 * v13 + v8 * v10;

  return v14;
}

void __22__VNVector_zeroVector__block_invoke()
{
  VNVector *v0;
  void *v1;

  v0 = -[VNVector initWithXComponent:yComponent:]([VNVector alloc], "initWithXComponent:yComponent:", 0.0, 0.0);
  v1 = (void *)+[VNVector zeroVector]::zeroVector;
  +[VNVector zeroVector]::zeroVector = (uint64_t)v0;

}

@end
