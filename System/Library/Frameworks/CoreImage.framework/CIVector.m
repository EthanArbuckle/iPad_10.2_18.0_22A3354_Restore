@implementation CIVector

- (float)_norm
{
  unint64_t v3;
  double v4;
  double v5;
  float v6;

  if (self->_count)
  {
    v3 = 0;
    v4 = 0.0;
    do
    {
      -[CIVector valueAtIndex:](self, "valueAtIndex:", v3);
      v4 = v4 + v5 * v5;
      ++v3;
    }
    while (v3 < self->_count);
    v6 = v4;
  }
  else
  {
    v6 = 0.0;
  }
  return sqrtf(v6);
}

- (id)_orthonormalizeTo:(id)a3
{
  float v5;
  float v6;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(a3, "_dot:");
  v6 = v5;
  if (v5 < 0.000001)
    return self;
  -[CIVector _dot:](self, "_dot:", a3);
  v9 = v8 / v6;
  -[CIVector X](self, "X");
  v11 = v10;
  v12 = v9;
  -[CIVector X](self, "X");
  v14 = v11 + v9 * v13;
  -[CIVector Y](self, "Y");
  v16 = v15;
  -[CIVector Y](self, "Y");
  return +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v14, v16 + v12 * v17);
}

- (float)_dot:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[CIVector X](self, "X");
  v6 = v5;
  objc_msgSend(a3, "X");
  v8 = v7;
  -[CIVector Y](self, "Y");
  v10 = v9;
  objc_msgSend(a3, "Y");
  return v10 * v11 + v6 * v8;
}

+ (CIVector)vectorWithValues:(const CGFloat *)values count:(size_t)count
{
  return (CIVector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithValues:count:", values, count);
}

+ (CIVector)vectorWithX:(CGFloat)x
{
  return (CIVector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithX:", x);
}

+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y
{
  return (CIVector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithX:Y:", x, y);
}

+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z
{
  return (CIVector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithX:Y:Z:", x, y, z);
}

+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z W:(CGFloat)w
{
  return (CIVector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithX:Y:Z:W:", x, y, z, w);
}

+ (CIVector)vectorWithCGPoint:(CGPoint)p
{
  return (CIVector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCGPoint:", p.x, p.y);
}

+ (CIVector)vectorWithCGRect:(CGRect)r
{
  return (CIVector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCGRect:", r.origin.x, r.origin.y, r.size.width, r.size.height);
}

+ (CIVector)vectorWithCGAffineTransform:(CGAffineTransform *)t
{
  id v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = objc_alloc((Class)a1);
  v5 = *(_OWORD *)&t->c;
  v7[0] = *(_OWORD *)&t->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&t->tx;
  return (CIVector *)(id)objc_msgSend(v4, "initWithCGAffineTransform:", v7);
}

+ (CIVector)vectorWithString:(NSString *)representation
{
  return (CIVector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", representation);
}

- (CIVector)init
{
  uint64_t v3;

  v3 = 0;
  return -[CIVector initWithValues:count:](self, "initWithValues:count:", &v3, 0);
}

- (CIVector)initWithX:(CGFloat)x
{
  CGFloat v4;

  v4 = x;
  return -[CIVector initWithValues:count:](self, "initWithValues:count:", &v4, 1);
}

- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v5 = x;
  *(CGFloat *)&v5[1] = y;
  return -[CIVector initWithValues:count:](self, "initWithValues:count:", v5, 2);
}

- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z
{
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v6 = x;
  *(CGFloat *)&v6[1] = y;
  *(CGFloat *)&v6[2] = z;
  return -[CIVector initWithValues:count:](self, "initWithValues:count:", v6, 3);
}

- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z W:(CGFloat)w
{
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v7 = x;
  *(CGFloat *)&v7[1] = y;
  *(CGFloat *)&v7[2] = z;
  *(CGFloat *)&v7[3] = w;
  return -[CIVector initWithValues:count:](self, "initWithValues:count:", v7, 4);
}

- (CIVector)initWithCGPoint:(CGPoint)p
{
  CGPoint v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = p;
  return -[CIVector initWithValues:count:](self, "initWithValues:count:", &v4, 2);
}

- (CIVector)initWithCGRect:(CGRect)r
{
  CGRect v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = r;
  return -[CIVector initWithValues:count:](self, "initWithValues:count:", &v4, 4);
}

- (CIVector)initWithCGAffineTransform:(CGAffineTransform *)r
{
  return -[CIVector initWithValues:count:](self, "initWithValues:count:", r, 6);
}

- (CIVector)initWithValues:(const CGFloat *)values count:(size_t)count
{
  CIVector *v6;
  CIVector *v7;
  uint64_t v8;
  double *v9;
  size_t v10;
  double *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CIVector;
  v6 = -[CIVector init](&v14, sel_init);
  v7 = v6;
  if (v6 && count)
  {
    if (count >= 0x401)
    {
LABEL_4:

      return 0;
    }
    v6->_count = count;
    if (count > 4)
    {
      v11 = (double *)malloc_type_malloc(8 * count, 0x100004000313F17uLL);
      v7->_u.ptr = v11;
      if (!v11)
        goto LABEL_4;
      v12 = 0;
      do
      {
        v7->_u.ptr[v12] = values[v12];
        ++v12;
      }
      while (count != v12);
    }
    else
    {
      v8 = 0;
      do
      {
        v6->_u.vec[v8] = values[v8];
        ++v8;
      }
      while (count != v8);
      if ((unint64_t)(v8 - 1) <= 2)
      {
        v9 = &v6->_u.vec[count];
        v10 = 3 - count;
        if (count > 3)
          v10 = 0;
        bzero(v9, 8 * v10 + 8);
      }
    }
  }
  return v7;
}

- (CIVector)initWithString:(NSString *)representation
{
  const char *v4;
  const char *v5;
  double v6;
  char *v7;
  double v8;
  uint64_t v9;
  int v10;
  double *v11;
  double *v12;
  double *v13;
  unsigned int v14;
  BOOL v15;
  CIVector *v17;
  char *v18;
  _BYTE v19[256];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = -[NSString UTF8String](representation, "UTF8String");
  if (!v4)
    return -[CIVector init](self, "init");
  v18 = 0;
  if (*v4 == 91)
    v5 = v4 + 1;
  else
    v5 = v4;
  v6 = strtod(v5, &v18);
  v7 = v18;
  if (v18 == v5)
    return -[CIVector initWithValues:count:](self, "initWithValues:count:", v19, 0, v6);
  v8 = v6;
  v9 = 0;
  v10 = 32;
  v11 = (double *)v19;
  while (v9 != v10)
  {
    v13 = v11;
LABEL_13:
    v14 = v9 + 1;
    v13[v9] = v8;
    v8 = strtod(v7, &v18);
    ++v9;
    v15 = v18 == v7;
    v7 = v18;
    if (v15)
      goto LABEL_19;
  }
  v12 = (double *)malloc_type_malloc(16 * v10, 0x4D5DE1A3uLL);
  if (v12)
  {
    v13 = v12;
    memcpy(v12, v11, 8 * v10);
    if (v11 != (double *)v19)
      free(v11);
    v10 *= 2;
    v7 = v18;
    v11 = v13;
    goto LABEL_13;
  }
  v13 = v11;
  v14 = v9;
LABEL_19:
  v17 = -[CIVector initWithValues:count:](self, "initWithValues:count:", v13, v14, v18);
  if (v13 != (double *)v19)
    free(v13);
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_count >= 5)
    free(self->_u.ptr);
  v3.receiver = self;
  v3.super_class = (Class)CIVector;
  -[CIVector dealloc](&v3, sel_dealloc);
}

- (size_t)count
{
  return self->_count;
}

- (CGFloat)valueAtIndex:(size_t)index
{
  size_t count;
  CGFloat result;
  $88552A8D2734CBBEDCC5ADBDCF1D9580 *p_u;
  CGFloat *v6;

  count = self->_count;
  result = 0.0;
  if (count > index)
  {
    p_u = &self->_u;
    if (count > 4)
      v6 = &p_u->ptr[index];
    else
      v6 = &p_u->vec[index];
    return *v6;
  }
  return result;
}

- (CGFloat)X
{
  $88552A8D2734CBBEDCC5ADBDCF1D9580 *p_u;

  p_u = &self->_u;
  if (self->_count >= 5)
    p_u = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)p_u->ptr;
  return p_u->vec[0];
}

- (CGFloat)Y
{
  CGFloat *v2;

  if (self->_count > 4)
    v2 = self->_u.ptr + 1;
  else
    v2 = &self->_u.vec[1];
  return *v2;
}

- (CGFloat)Z
{
  CGFloat *v2;

  if (self->_count > 4)
    v2 = self->_u.ptr + 2;
  else
    v2 = &self->_u.vec[2];
  return *v2;
}

- (CGFloat)W
{
  CGFloat *v2;

  if (self->_count > 4)
    v2 = self->_u.ptr + 3;
  else
    v2 = &self->_u.vec[3];
  return *v2;
}

- (CGPoint)CGPointValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[CIVector X](self, "X");
  v4 = v3;
  -[CIVector Y](self, "Y");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CGRect)CGRectValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[CIVector X](self, "X");
  v4 = v3;
  -[CIVector Y](self, "Y");
  v6 = v5;
  -[CIVector Z](self, "Z");
  v8 = v7;
  -[CIVector W](self, "W");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGAffineTransform)CGAffineTransformValue
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGAffineTransform *result;
  CGFloat v16;

  -[CIVector X](self, "X");
  v6 = v5;
  -[CIVector Y](self, "Y");
  v8 = v7;
  -[CIVector Z](self, "Z");
  v10 = v9;
  -[CIVector W](self, "W");
  v12 = v11;
  -[CIVector valueAtIndex:](self, "valueAtIndex:", 4);
  v14 = v13;
  result = (CGAffineTransform *)-[CIVector valueAtIndex:](self, "valueAtIndex:", 5);
  retstr->a = v6;
  retstr->b = v8;
  retstr->c = v10;
  retstr->d = v12;
  retstr->tx = v14;
  retstr->ty = v16;
  return result;
}

- (id)description
{
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  switch(self->_count)
  {
    case 0uLL:
      result = CFSTR("[]");
      break;
    case 1uLL:
      result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g]"), self->_u.ptr, v17, v18, v19);
      break;
    case 2uLL:
      result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g %g]"), self->_u.ptr, *(_QWORD *)&self->_u.vec[1], v18, v19);
      break;
    case 3uLL:
      result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g %g %g]"), self->_u.ptr, *(_QWORD *)&self->_u.vec[1], *(_QWORD *)&self->_u.vec[2], v19);
      break;
    case 4uLL:
      result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g %g %g %g]"), self->_u.ptr, *(_QWORD *)&self->_u.vec[1], *(_QWORD *)&self->_u.vec[2], *(_QWORD *)&self->_u.vec[3]);
      break;
    default:
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[CIVector X](self, "X");
      v6 = v5;
      -[CIVector Y](self, "Y");
      v8 = v7;
      -[CIVector Z](self, "Z");
      v10 = v9;
      -[CIVector W](self, "W");
      v12 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("[%g %g %g %g"), v6, v8, v10, v11);
      if (self->_count >= 5)
      {
        v13 = 5;
        v14 = 4;
        do
        {
          -[CIVector valueAtIndex:](self, "valueAtIndex:", v14);
          v12 = (void *)objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" %g"), v15);
          v14 = v13;
        }
        while (self->_count > v13++);
      }
      result = (id)objc_msgSend(v12, "stringByAppendingString:", CFSTR("]"));
      break;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  unint64_t v6;
  _QWORD *v7;
  $88552A8D2734CBBEDCC5ADBDCF1D9580 *ptr;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
    {
      v6 = objc_msgSend(a3, "count");
      if (v6 == self->_count)
      {
        v7 = (char *)a3 + 16;
        if (v6 > 4)
        {
          v7 = (_QWORD *)*v7;
          ptr = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)self->_u.ptr;
        }
        else
        {
          ptr = &self->_u;
        }
        LOBYTE(v5) = memcmp(v7, ptr, 8 * v6) == 0;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t count;
  $88552A8D2734CBBEDCC5ADBDCF1D9580 *p_u;
  unint64_t v5;
  double v6;

  count = self->_count;
  p_u = &self->_u;
  if (count >= 5)
  {
    p_u = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)p_u->ptr;
  }
  else if (!count)
  {
    return 0;
  }
  v5 = self->_count;
  do
  {
    v6 = p_u->vec[0];
    p_u = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)((char *)p_u + 8);
    LODWORD(v5) = 33 * v5 + vcvtmd_s64_f64(v6 * 1024.0);
    --count;
  }
  while (count);
  return (int)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIVector)initWithCoder:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  CIVector *v14;
  _QWORD *v15;
  uint64_t i;
  void *v17;
  float v18;
  _QWORD v19[65];

  v19[64] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "containsValueForKey:", CFSTR("CICount")))
    goto LABEL_4;
  v5 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICount"));
  if (!v5)
    return -[CIVector init](self, "init");
  v6 = v5;
  if (v5 >= 0x401)
    goto LABEL_4;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("CIVector")))
  {
    objc_msgSend(a3, "decodeRectForKey:", CFSTR("CIVector"));
    v19[0] = v8;
    v19[1] = v9;
    v19[2] = v10;
    v19[3] = v11;
    if ((int)v6 >= 4)
      v12 = 4;
    else
      v12 = v6;
    v13 = v19;
    v14 = self;
    return -[CIVector initWithValues:count:](v14, "initWithValues:count:", v13, v12);
  }
  if (v6 < 0x41)
  {
    v15 = v19;
    goto LABEL_15;
  }
  v15 = malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
  if (v15)
  {
LABEL_15:
    for (i = 0; i != v6; ++i)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CI_%zu"), i);
      objc_msgSend(a3, "decodeFloatForKey:", v17);
      *(double *)&v15[i] = v18;

    }
    v14 = self;
    v13 = v15;
    v12 = v6;
    return -[CIVector initWithValues:count:](v14, "initWithValues:count:", v13, v12);
  }
LABEL_4:

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t count;
  unint64_t v6;
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;

  objc_msgSend(a3, "encodeInt:forKey:", LODWORD(self->_count), CFSTR("CICount"));
  count = self->_count;
  if (count >= 5)
  {
    v9 = 0;
    do
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CI_%zu"), v9);
      v11 = self->_u.ptr[v9];
      *(float *)&v11 = v11;
      objc_msgSend(a3, "encodeFloat:forKey:", v10, v11);

      ++v9;
    }
    while (v9 < self->_count);
  }
  else if (count)
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CI_%zu"), v6);
      v8 = self->_u.vec[v6];
      *(float *)&v8 = v8;
      objc_msgSend(a3, "encodeFloat:forKey:", v7, v8);

      ++v6;
    }
    while (v6 < self->_count);
  }
}

- (double)_values
{
  return self->_u.ptr;
}

@end
