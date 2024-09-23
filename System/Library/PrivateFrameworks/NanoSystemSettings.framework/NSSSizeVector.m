@implementation NSSSizeVector

- (BOOL)isEqual:(id)a3
{
  NSSSizeVector *v4;
  BOOL v5;

  v4 = (NSSSizeVector *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NSSSizeVector isEqualToSizeVector:](self, "isEqualToSizeVector:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSizeVector:(id)a3
{
  id v4;
  void *v5;
  int64_t docsAndData;
  int64_t fixed;
  int64_t purgeable;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4
    && (docsAndData = self->_docsAndData, docsAndData == objc_msgSend(v4, "docsAndData"))
    && (fixed = self->_fixed, fixed == objc_msgSend(v5, "fixed")))
  {
    purgeable = self->_purgeable;
    v9 = purgeable == objc_msgSend(v5, "purgeable");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_docsAndData + 13 * self->_fixed + 65 * self->_purgeable;
}

- (BOOL)isZero
{
  return !self->_docsAndData && !self->_purgeable && self->_fixed == 0;
}

- (int64_t)dynamic
{
  return self->_purgeable + self->_docsAndData;
}

- (int64_t)userTotal
{
  return self->_fixed + self->_docsAndData;
}

+ (id)zero
{
  if (zero_onceToken != -1)
    dispatch_once(&zero_onceToken, &__block_literal_global_0);
  return (id)zero;
}

void __21__NSSSizeVector_zero__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSSSizeVector fixed:](NSSSizeVector, "fixed:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)zero;
  zero = v0;

}

- (id)plus:(id)a3
{
  id v4;
  NSSSizeVector *v5;
  int64_t fixed;
  uint64_t v7;
  int64_t docsAndData;
  uint64_t v9;
  int64_t purgeable;
  uint64_t v11;

  v4 = a3;
  v5 = [NSSSizeVector alloc];
  fixed = self->_fixed;
  v7 = objc_msgSend(v4, "fixed") + fixed;
  docsAndData = self->_docsAndData;
  v9 = objc_msgSend(v4, "docsAndData") + docsAndData;
  purgeable = self->_purgeable;
  v11 = objc_msgSend(v4, "purgeable");

  return -[NSSSizeVector initWithFixed:docsAndData:purgeable:](v5, "initWithFixed:docsAndData:purgeable:", v7, v9, v11 + purgeable);
}

- (NSSSizeVector)initWithFixed:(int64_t)a3 docsAndData:(int64_t)a4 purgeable:(int64_t)a5
{
  NSSSizeVector *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSSizeVector;
  result = -[NSSSizeVector init](&v9, sel_init);
  if (result)
  {
    result->_fixed = a3;
    result->_docsAndData = a4;
    result->_purgeable = a5;
  }
  return result;
}

+ (id)fixed:(int64_t)a3
{
  return (id)objc_msgSend(a1, "fixed:docsAndData:purgeable:", a3, 0, 0);
}

+ (id)docsAndData:(int64_t)a3
{
  return (id)objc_msgSend(a1, "fixed:docsAndData:purgeable:", 0, a3, 0);
}

+ (id)purgeable:(int64_t)a3
{
  return (id)objc_msgSend(a1, "fixed:docsAndData:purgeable:", 0, 0, a3);
}

+ (id)fixed:(int64_t)a3 docsAndData:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fixed:docsAndData:purgeable:", a3, a4, 0);
}

+ (id)fixed:(int64_t)a3 purgeable:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fixed:docsAndData:purgeable:", a3, 0, 0);
}

+ (id)docsAndData:(int64_t)a3 purgeable:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fixed:docsAndData:purgeable:", 0, a3, a4);
}

+ (id)fixed:(int64_t)a3 docsAndData:(int64_t)a4 purgeable:(int64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFixed:docsAndData:purgeable:", a3, a4, a5);
}

+ (id)fixed:(int64_t)a3 dynamic:(int64_t)a4 purgeable:(int64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFixed:docsAndData:purgeable:", a3, a4 - a5, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t fixed;
  id v5;

  fixed = self->_fixed;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", fixed, CFSTR("fixed"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_docsAndData, CFSTR("docsAndData"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_purgeable, CFSTR("purgeable"));

}

- (NSSSizeVector)initWithCoder:(id)a3
{
  id v4;
  NSSSizeVector *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NSSSizeVector;
  v5 = -[NSSSizeVector init](&v7, sel_init);
  if (v5)
  {
    v5->_fixed = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fixed"));
    v5->_docsAndData = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("docsAndData"));
    v5->_purgeable = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("purgeable"));
  }

  return v5;
}

- (int64_t)fixed
{
  return self->_fixed;
}

- (int64_t)docsAndData
{
  return self->_docsAndData;
}

- (int64_t)purgeable
{
  return self->_purgeable;
}

@end
