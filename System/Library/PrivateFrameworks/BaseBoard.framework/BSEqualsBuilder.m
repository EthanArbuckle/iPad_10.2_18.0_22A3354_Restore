@implementation BSEqualsBuilder

- (id)appendInteger:(int64_t)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == a3;

  return self;
}

- (id)appendPointer:(void *)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == (_QWORD)a3;

  return self;
}

- (id)appendBool:(BOOL)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) ^ a3 ^ 1;

  return self;
}

- (BOOL)isEqual
{
  return self->_equal;
}

+ (id)builderWithObject:(id)a3 ofExpectedClass:(Class)a4
{
  id v4;
  BSEqualsBuilder *v5;
  char isKindOfClass;
  char v7;
  BSEqualsBuilder *v8;
  objc_super v10;

  v4 = a3;
  v5 = [BSEqualsBuilder alloc];
  isKindOfClass = objc_opt_isKindOfClass();
  if (v5)
  {
    v7 = isKindOfClass;
    v10.receiver = v5;
    v10.super_class = (Class)BSEqualsBuilder;
    v8 = objc_msgSendSuper2(&v10, sel_init);
    v5 = v8;
    if (v8)
      v8->_equal = v7 & 1;
  }

  return v5;
}

- (id)appendCGFloat:(double)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = vabdd_f64(a3, (*((double (**)(id))v6 + 2))(v6)) < 2.22044605e-16;

  return self;
}

- (id)appendDouble:(double)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = vabdd_f64(a3, (*((double (**)(id))v6 + 2))(v6)) < 2.22044605e-16;

  return self;
}

- (id)appendCGSize:(CGSize)a3 counterpart:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  BOOL v9;
  double v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    v9 = vabdd_f64(width, (*((double (**)(id))v7 + 2))(v7)) < 2.22044605e-16;
    if (vabdd_f64(height, v10) >= 2.22044605e-16)
      v9 = 0;
    self->_equal = v9;
  }

  return self;
}

- (id)appendUnsignedInteger:(unint64_t)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == a3;

  return self;
}

- (id)appendCGRect:(CGRect)a3 counterpart:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = v9;
  if (v9 && self->_equal)
  {
    v11 = (*((double (**)(id))v9 + 2))(v9);
    self->_equal = BSRectEqualToRect(x, y, width, height, v11, v12, v13, v14);
  }

  return self;
}

- (id)appendString:(id)a3 counterpart:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v6)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v6 && v9)
        v10 = objc_msgSend(v6, "isEqualToString:", v9);
    }
    self->_equal = v10;

  }
  return self;
}

- (id)appendObject:(id)a3 counterpart:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v6)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v6 && v9)
        v10 = objc_msgSend(v6, "isEqual:", v9);
    }
    self->_equal = v10;

  }
  return self;
}

- (id)appendClass:(Class)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == (_QWORD)a3;

  return self;
}

- (id)appendSizeT:(unint64_t)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == a3;

  return self;
}

- (id)appendEqualsBlocks:(id)a3
{
  uint64_t (**v4)(_QWORD);
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t *v9;
  uint64_t v10;

  v4 = (uint64_t (**)(_QWORD))a3;
  if (v4 && self->_equal)
  {
    v9 = &v10;
    do
    {
      self->_equal = v4[2](v4);
      v5 = v9++;
      v6 = MEMORY[0x18D769CFC](*v5);

      v7 = !self->_equal || v6 == 0;
      v4 = (uint64_t (**)(_QWORD))v6;
    }
    while (!v7);
    v4 = (uint64_t (**)(_QWORD))v6;
  }

  return self;
}

- (id)appendInt64:(int64_t)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == a3;

  return self;
}

+ (id)builder
{
  BSEqualsBuilder *v2;
  objc_super v4;

  v2 = [BSEqualsBuilder alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)BSEqualsBuilder;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
      v2->_equal = 1;
  }
  return v2;
}

- (BSEqualsBuilder)init
{
  objc_super v2;

  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)BSEqualsBuilder;
    self = -[BSEqualsBuilder init](&v2, sel_init);
    if (self)
      self->_equal = 1;
  }
  return self;
}

- (id)appendFloat:(float)a3 counterpart:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
    self->_equal = vabds_f32(a3, (*((float (**)(id))v6 + 2))(v6)) < 0.00000011921;

  return self;
}

- (id)appendCGPoint:(CGPoint)a3 counterpart:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  BOOL v9;
  double v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    v9 = vabdd_f64(x, (*((double (**)(id))v7 + 2))(v7)) < 2.22044605e-16;
    if (vabdd_f64(y, v10) >= 2.22044605e-16)
      v9 = 0;
    self->_equal = v9;
  }

  return self;
}

- (id)appendCGAffineTransform:(CGAffineTransform *)a3 counterpart:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  CGAffineTransform v10;
  CGAffineTransform t2;

  v6 = a4;
  v7 = v6;
  if (v6 && self->_equal)
  {
    (*((void (**)(CGAffineTransform *__return_ptr, id))v6 + 2))(&t2, v6);
    v8 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v10.c = v8;
    *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
    self->_equal = CGAffineTransformEqualToTransform(&v10, &t2);
  }

  return self;
}

- (id)appendArray:(id)a3 counterpart:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_equal = objc_msgSend(v6, "isEqualToArray:", v9);

  }
  return self;
}

@end
