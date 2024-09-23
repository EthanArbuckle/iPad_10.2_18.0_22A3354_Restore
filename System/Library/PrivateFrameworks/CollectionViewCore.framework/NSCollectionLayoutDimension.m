@implementation NSCollectionLayoutDimension

- (BOOL)isEstimated
{
  return (unint64_t)(self->_semantic - 3) < 2;
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutDimension *v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = (NSCollectionLayoutDimension *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[NSCollectionLayoutDimension semantic](self, "semantic"),
          v5 == -[NSCollectionLayoutDimension semantic](v4, "semantic")))
    {
      -[NSCollectionLayoutDimension dimension](self, "dimension");
      v7 = v6;
      -[NSCollectionLayoutDimension dimension](v4, "dimension");
      v9 = vabdd_f64(v7, v8) <= 0.00001;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (int64_t)semantic
{
  return self->_semantic;
}

- (CGFloat)dimension
{
  return self->_dimension;
}

+ (NSCollectionLayoutDimension)uniformAcrossSiblingsWithEstimate:(CGFloat)estimatedDimension
{
  double v6;
  void *v7;
  void *v9;

  if (estimatedDimension <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 1830, CFSTR("Invalid estimated dimension (%g), must be > 0"), *(_QWORD *)&estimatedDimension);

  }
  v6 = fabs(estimatedDimension);
  if (v6 >= INFINITY && v6 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 1831, CFSTR("Invalid estimated dimension: %g. The dimension must be a finite value."), *(_QWORD *)&estimatedDimension);

  }
  return (NSCollectionLayoutDimension *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:semantic:", 4, estimatedDimension);
}

+ (NSCollectionLayoutDimension)fractionalHeightDimension:(CGFloat)fractionalHeight
{
  NSObject *v6;
  double v7;
  void *v8;
  uint8_t buf[16];

  if (fractionalHeight <= 0.0)
  {
    _compLayoutLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD770000, v6, OS_LOG_TYPE_ERROR, "Invalid fractional height dimension, must be > 0.0. NOTE: This will be a hard-assert soon, please update your call site.", buf, 2u);
    }

  }
  v7 = fabs(fractionalHeight);
  if (v7 >= INFINITY && v7 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 1809, CFSTR("Invalid fractional height: %g. The fraction must be a finite value."), *(_QWORD *)&fractionalHeight);

  }
  return (NSCollectionLayoutDimension *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:semantic:", 2, fractionalHeight);
}

+ (id)_dimensionWithDimension:(double)a3 semantic:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:semantic:", a4, a3);
}

+ (NSCollectionLayoutDimension)estimatedDimension:(CGFloat)estimatedDimension
{
  NSObject *v6;
  double v7;
  void *v8;
  uint8_t buf[16];

  if (estimatedDimension <= 0.0)
  {
    _compLayoutLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD770000, v6, OS_LOG_TYPE_ERROR, "Invalid estimated dimension, must be > 0. NOTE: This will be a hard-assert soon, please update your call site.", buf, 2u);
    }

  }
  v7 = fabs(estimatedDimension);
  if (v7 >= INFINITY && v7 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 1825, CFSTR("Invalid estimated dimension: %g. The dimension must be a finite value."), *(_QWORD *)&estimatedDimension);

  }
  return (NSCollectionLayoutDimension *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:semantic:", 3, estimatedDimension);
}

+ (NSCollectionLayoutDimension)absoluteDimension:(CGFloat)absoluteDimension
{
  NSObject *v6;
  double v7;
  void *v8;
  uint8_t buf[16];

  if (absoluteDimension <= 0.0)
  {
    _compLayoutLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD770000, v6, OS_LOG_TYPE_ERROR, "Invalid absolute dimension, must be > 0.0. NOTE: This will be a hard-assert soon, please update your call site.", buf, 2u);
    }

  }
  v7 = fabs(absoluteDimension);
  if (v7 >= INFINITY && v7 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 1817, CFSTR("Invalid absolute dimension: %g. The dimension must be a finite value."), *(_QWORD *)&absoluteDimension);

  }
  return (NSCollectionLayoutDimension *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:semantic:", 0, absoluteDimension);
}

+ (NSCollectionLayoutDimension)fractionalWidthDimension:(CGFloat)fractionalWidth
{
  NSObject *v6;
  double v7;
  void *v8;
  uint8_t buf[16];

  if (fractionalWidth <= 0.0)
  {
    _compLayoutLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD770000, v6, OS_LOG_TYPE_ERROR, "Invalid fractional width dimension, must be > 0.0. NOTE: This will be a hard-assert soon, please update your call site.", buf, 2u);
    }

  }
  v7 = fabs(fractionalWidth);
  if (v7 >= INFINITY && v7 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 1801, CFSTR("Invalid fractional width: %g. The fraction must be a finite value."), *(_QWORD *)&fractionalWidth);

  }
  return (NSCollectionLayoutDimension *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimension:semantic:", 1, fractionalWidth);
}

- (NSCollectionLayoutDimension)initWithDimension:(double)a3 semantic:(int64_t)a4
{
  NSCollectionLayoutDimension *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSCollectionLayoutDimension;
  result = -[NSCollectionLayoutDimension init](&v7, sel_init);
  if (result)
  {
    result->_dimension = a3;
    result->_semantic = a4;
  }
  return result;
}

- (BOOL)isAbsolute
{
  return self->_semantic == 0;
}

- (BOOL)isFractionalWidth
{
  return self->_semantic == 1;
}

- (BOOL)isFractionalHeight
{
  return self->_semantic == 2;
}

- (BOOL)isUniformAcrossSiblings
{
  return self->_semantic == 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;

  v4 = objc_alloc((Class)objc_opt_class());
  -[NSCollectionLayoutDimension dimension](self, "dimension");
  return (id)objc_msgSend(v4, "initWithDimension:semantic:", -[NSCollectionLayoutDimension semantic](self, "semantic"), v5);
}

- (void)setDimension:(double)a3
{
  self->_dimension = a3;
}

- (void)setSemantic:(int64_t)a3
{
  self->_semantic = a3;
}

@end
