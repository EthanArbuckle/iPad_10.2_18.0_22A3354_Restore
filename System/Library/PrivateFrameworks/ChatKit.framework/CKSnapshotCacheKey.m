@implementation CKSnapshotCacheKey

+ (id)keyWithIdentifier:(id)a3 interfaceStyle:(int64_t)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  CKSnapshotCacheKey *v11;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3;
  v11 = -[CKSnapshotCacheKey initWithIdentifier:interfaceStyle:bounds:]([CKSnapshotCacheKey alloc], "initWithIdentifier:interfaceStyle:bounds:", v10, a4, x, y, width, height);

  return v11;
}

- (CKSnapshotCacheKey)initWithIdentifier:(id)a3 interfaceStyle:(int64_t)a4 bounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  CKSnapshotCacheKey *v13;
  CKSnapshotCacheKey *v14;
  objc_super v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKSnapshotCacheKey;
  v13 = -[CKSnapshotCacheKey init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_interfaceStyle = a4;
    v14->_bounds.origin.x = x;
    v14->_bounds.origin.y = y;
    v14->_bounds.size.width = width;
    v14->_bounds.size.height = height;
  }

  return v14;
}

- (CKSnapshotCacheKey)keyWithOppositeInterfaceStyle
{
  void *v3;
  uint64_t v4;

  v3 = (void *)-[CKSnapshotCacheKey copy](self, "copy");
  if (-[CKSnapshotCacheKey interfaceStyle](self, "interfaceStyle") == 1)
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v3, "setInterfaceStyle:", v4);
  return (CKSnapshotCacheKey *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;

  -[CKSnapshotCacheKey identifier](self, "identifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKSnapshotCacheKey interfaceStyle](self, "interfaceStyle");
  -[CKSnapshotCacheKey bounds](self, "bounds");
  +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)stringValue
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGSize v16;

  v3 = -[CKSnapshotCacheKey interfaceStyle](self, "interfaceStyle");
  v4 = CFSTR("light");
  if (v3 == 2)
    v4 = CFSTR("dark");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = v4;
  -[CKSnapshotCacheKey identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSnapshotCacheKey bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  if (CKMainScreenScale_once_69 != -1)
    dispatch_once(&CKMainScreenScale_once_69, &__block_literal_global_173);
  v12 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_69 != 0.0)
    v12 = *(double *)&CKMainScreenScale_sMainScreenScale_69;
  v16.width = round(v9 * v12) / v12;
  v16.height = round(v11 * v12) / v12;
  NSStringFromCGSize(v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@-<%@>"), v7, v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (BOOL)isEqual:(id)a3
{
  CKSnapshotCacheKey *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (CKSnapshotCacheKey *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKSnapshotCacheKey stringValue](self, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSnapshotCacheKey stringValue](v4, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
