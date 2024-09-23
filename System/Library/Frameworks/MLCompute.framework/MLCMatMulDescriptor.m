@implementation MLCMatMulDescriptor

+ (MLCMatMulDescriptor)descriptor
{
  id v2;
  double v3;

  v2 = objc_alloc((Class)a1);
  LODWORD(v3) = 1.0;
  return (MLCMatMulDescriptor *)(id)objc_msgSend(v2, "initWithAlpha:transposesX:transposesY:", 0, 0, v3);
}

+ (MLCMatMulDescriptor)descriptorWithAlpha:(float)alpha transposesX:(BOOL)transposesX transposesY:(BOOL)transposesY
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  double v9;

  v5 = transposesY;
  v6 = transposesX;
  v8 = objc_alloc((Class)a1);
  *(float *)&v9 = alpha;
  return (MLCMatMulDescriptor *)(id)objc_msgSend(v8, "initWithAlpha:transposesX:transposesY:", v6, v5, v9);
}

- (MLCMatMulDescriptor)initWithAlpha:(float)a3 transposesX:(BOOL)a4 transposesY:(BOOL)a5
{
  MLCMatMulDescriptor *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MLCMatMulDescriptor;
  result = -[MLCMatMulDescriptor init](&v9, sel_init);
  if (result)
  {
    result->_alpha = a3;
    result->_transposesX = a4;
    result->_transposesY = a5;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  float v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMatMulDescriptor alpha](self, "alpha");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { alpha=%f : transposesX=%d : transposesY=%d }"), v5, v6, -[MLCMatMulDescriptor transposesX](self, "transposesX"), -[MLCMatMulDescriptor transposesY](self, "transposesY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  int v9;
  int v10;
  int v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "alpha");
    v7 = v6;
    -[MLCMatMulDescriptor alpha](self, "alpha");
    if (v7 == v8
      && (v9 = objc_msgSend(v5, "transposesX"), v9 == -[MLCMatMulDescriptor transposesX](self, "transposesX")))
    {
      v11 = objc_msgSend(v5, "transposesY");
      v10 = v11 ^ -[MLCMatMulDescriptor transposesY](self, "transposesY") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v14 = 0;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCMatMulDescriptor alpha](self, "alpha");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[MLCMatMulDescriptor transposesX](self, "transposesX");
  -[MLCMatMulDescriptor transposesY](self, "transposesY");
  hashCombine_7(&v14, v6, v7, v8, v9, v10, v11, v12, v5);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int v5;
  int v6;
  _BOOL8 v7;
  _BOOL8 v8;
  double v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCMatMulDescriptor alpha](self, "alpha");
  v6 = v5;
  v7 = -[MLCMatMulDescriptor transposesY](self, "transposesY");
  v8 = -[MLCMatMulDescriptor transposesY](self, "transposesY");
  LODWORD(v9) = v6;
  return (id)objc_msgSend(v4, "initWithAlpha:transposesX:transposesY:", v7, v8, v9);
}

- (float)alpha
{
  return self->_alpha;
}

- (BOOL)transposesX
{
  return self->_transposesX;
}

- (BOOL)transposesY
{
  return self->_transposesY;
}

@end
