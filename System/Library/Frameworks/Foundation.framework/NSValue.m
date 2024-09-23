@implementation NSValue

- (NSValue)init
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((__objc2_class *)objc_opt_class() == NSValue)
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)NSValue);
  v5.receiver = self;
  v5.super_class = (Class)NSValue;
  return -[NSValue init](&v5, sel_init);
}

+ (NSValue)valueWithPoint:(NSPoint)point
{
  NSPoint v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = point;
  return +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v4, "{CGPoint=dd}");
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3)
  {
    if (objc_opt_class() == __NSConcreteValueClass || (v5 = _NSIsNSValue()) != 0)
      LOBYTE(v5) = -[NSValue isEqualToValue:](self, "isEqualToValue:", a3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isNSValue__
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  NSUInteger v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  NSGetSizeAndAlignment(-[NSValue objCType](self, "objCType"), v6, 0);
  v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithLength:", v6[0]);
  -[NSValue getValue:](self, "getValue:", objc_msgSend(v3, "mutableBytes"));
  v4 = (void *)objc_msgSend(v3, "description");

  return v4;
}

- (NSPoint)pointValue
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  NSPoint result;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{CGPoint=dd}", 16, 1);
  v4 = 0.0;
  v5 = 0.0;
  if (v3)
  {
    v6 = 0.0;
    v7 = 0.0;
    -[NSValue getValue:](self, "getValue:", &v6, 0.0, 0.0);
    v5 = v6;
    v4 = v7;
  }
  result.y = v4;
  result.x = v5;
  return result;
}

- (void)pointerValue
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSValue _matchType:size:](self, "_matchType:size:", "^v", 8))
    return 0;
  v4[0] = 0;
  -[NSValue getValue:](self, "getValue:", v4);
  return (void *)v4[0];
}

- (NSRange)rangeValue
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSRange result;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{_NSRange=QQ}", 16, 1))
  {
    v5 = 0;
    v6 = 0;
    -[NSValue getValue:](self, "getValue:", &v5);
    v3 = v5;
    v4 = v6;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSSize)sizeValue
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  NSSize result;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{CGSize=dd}", 16, 1);
  v4 = 0.0;
  v5 = 0.0;
  if (v3)
  {
    v6 = 0.0;
    v7 = 0.0;
    -[NSValue getValue:](self, "getValue:", &v6, 0.0, 0.0);
    v5 = v6;
    v4 = v7;
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (NSRect)rectValue
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  double v9[3];
  uint64_t v10;
  NSRect result;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{CGRect={CGPoint=dd}{CGSize=dd}}", 32, 1);
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (v3)
  {
    v8 = 0u;
    *(_OWORD *)v9 = 0u;
    -[NSValue getValue:](self, "getValue:", &v8);
    v6 = *((double *)&v8 + 1);
    v7 = *(double *)&v8;
    v4 = v9[1];
    v5 = v9[0];
  }
  result.size.height = v4;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4
{
  return -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", a3, a4, 0);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  NSUInteger v6;
  void *v7;
  NSString *v8;
  const char *v9;
  NSUInteger sizep[129];

  sizep[128] = *MEMORY[0x1E0C80C00];
  v5 = -[NSValue objCType](self, "objCType");
  v9 = v5;
  sizep[0] = 0;
  NSGetSizeAndAlignment(v5, sizep, 0);
  v6 = sizep[0];
  if (sizep[0] < 0x401)
    v7 = sizep;
  else
    v7 = malloc_type_malloc(sizep[0], 0xEBCFD26AuLL);
  if (*v5 == 94 && v5[1] == 118)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot encode (void *) value: %@"), self);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0));
  }
  -[NSValue getValue:](self, "getValue:", v7);
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "*", &v9);
  objc_msgSend(a3, "encodeValueOfObjCType:at:", v9, v7);
  if (v6 > 0x400)
    free(v7);
}

- (BOOL)isEqualToValue:(NSValue *)value
{
  const char *v5;
  BOOL v6;
  size_t v7;
  void *v8;
  char *v9;
  char v11;
  NSUInteger sizep[129];

  sizep[128] = *MEMORY[0x1E0C80C00];
  if (self == value)
    return 1;
  v5 = -[NSValue objCType](self, "objCType");
  if (strcmp(v5, -[NSValue objCType](value, "objCType")))
    return 0;
  sizep[0] = 0;
  NSGetSizeAndAlignment(v5, sizep, 0);
  v7 = sizep[0];
  if (sizep[0] < 0x401)
  {
    v9 = &v11;
    v8 = sizep;
  }
  else
  {
    v8 = malloc_type_malloc(sizep[0], 0x7A5C2353uLL);
    v9 = (char *)malloc_type_malloc(v7, 0x5824A3B1uLL);
  }
  -[NSValue getValue:](self, "getValue:", v8);
  -[NSValue getValue:](value, "getValue:", v9);
  v6 = memcmp(v8, v9, v7) == 0;
  if (v7 > 0x400)
  {
    free(v8);
    free(v9);
  }
  return v6;
}

- (Class)classForCoder
{
  return (Class)NSValue;
}

+ (NSValue)valueWithNonretainedObject:(id)anObject
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = anObject;
  return +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v4, "^v");
}

+ (NSValue)valueWithPointer:(const void *)pointer
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = pointer;
  return +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v4, "^v");
}

+ (NSValue)valueWithRange:(NSRange)range
{
  NSRange v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = range;
  return +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v4, "{_NSRange=QQ}");
}

+ (NSValue)valueWithSize:(NSSize)size
{
  NSSize v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = size;
  return +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v4, "{CGSize=dd}");
}

+ (NSValue)valueWithRect:(NSRect)rect
{
  NSRect v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = rect;
  return +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v4, "{CGRect={CGPoint=dd}{CGSize=dd}}");
}

+ (NSValue)valueWithBytes:(const void *)value objCType:(const char *)type
{
  return (NSValue *)_NSNewValue((float64x2_t *)value, (char *)type, 0);
}

- (id)nonretainedObjectValue
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSValue _matchType:size:](self, "_matchType:size:", "^v", 8))
    return 0;
  v4[0] = 0;
  -[NSValue getValue:](self, "getValue:", v4);
  return (id)v4[0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)getValue:(void *)value size:(NSUInteger)size
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSString *v12;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_opt_class();
  v9 = objc_msgSend(v8, "instanceMethodForSelector:", sel_getValue_);
  if (v9 == +[NSValue instanceMethodForSelector:](NSValue, "instanceMethodForSelector:", sel_getValue_)
    || (v10 = objc_msgSend(v8, "instanceMethodForSelector:", sel_getValue_size_),
        v10 != +[NSValue instanceMethodForSelector:](NSValue, "instanceMethodForSelector:", sel_getValue_size_)))
  {
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)NSValue);
  }
  sizep[0] = 0;
  v11 = -[NSValue objCType](self, "objCType");
  NSGetSizeAndAlignment(v11, sizep, 0);
  if (sizep[0] != size)
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes"), size, v11, sizep[0]);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  -[NSValue getValue:](self, "getValue:", value);
}

+ (NSValue)valueWithWeakObject:(id)a3
{
  return (NSValue *)-[NSWeakObjectValue initWithObject:]([NSWeakObjectValue alloc], "initWithObject:", a3);
}

+ (NSValue)allocWithZone:(_NSZone *)a3
{
  if (NSValue == a1)
    return (NSValue *)&__placeholderValue;
  else
    return (NSValue *)NSAllocateObject((Class)a1, 0, a3);
}

- (void)getValue:(void *)value
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_class();
  v7 = objc_msgSend(v6, "instanceMethodForSelector:", sel_getValue_size_);
  if (v7 == +[NSValue instanceMethodForSelector:](NSValue, "instanceMethodForSelector:", sel_getValue_size_)|| (v8 = objc_msgSend(v6, "instanceMethodForSelector:", sel_getValue_), v8 != +[NSValue instanceMethodForSelector:](NSValue, "instanceMethodForSelector:", sel_getValue_)))
  {
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)NSValue);
  }
  v9[0] = 0;
  NSGetSizeAndAlignment(-[NSValue objCType](self, "objCType"), v9, 0);
  -[NSValue getValue:size:](self, "getValue:size:", value, v9[0]);
}

- (const)objCType
{
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)NSValue);
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5
{
  char *v8;
  BOOL result;
  NSUInteger v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8 = -[NSValue objCType](self, "objCType");
  v10[0] = 0;
  NSGetSizeAndAlignment(v8, v10, 0);
  result = v10[0] == a4 && !a5;
  if (a5 && v10[0] == a4)
    return matchTypeEncoding(v8, (char *)a3, a4);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v5;
  NSUInteger v6;
  float64x2_t *v7;
  _QWORD *v8;
  NSUInteger sizep[129];

  sizep[128] = *MEMORY[0x1E0C80C00];
  v5 = -[NSValue objCType](self, "objCType");
  sizep[0] = 0;
  NSGetSizeAndAlignment(v5, sizep, 0);
  v6 = sizep[0];
  if (sizep[0] < 0x401)
    v7 = (float64x2_t *)sizep;
  else
    v7 = (float64x2_t *)malloc_type_malloc(sizep[0], 0xD10E9699uLL);
  -[NSValue getValue:](self, "getValue:", v7);
  v8 = _NSNewValue(v7, v5, a3);
  if (v6 > 0x400)
    free(v7);
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v11;
  NSUInteger sizep[129];

  sizep[128] = *MEMORY[0x1E0C80C00];
  sizep[0] = 0;
  NSGetSizeAndAlignment(-[NSValue objCType](self, "objCType"), sizep, 0);
  v3 = sizep[0];
  if (sizep[0] >= 0x401)
  {
    v4 = (uint64_t *)malloc_type_malloc(sizep[0], 0x1D06C794uLL);
    -[NSValue getValue:](self, "getValue:", v4);
LABEL_5:
    v5 = 0;
    v6 = 32;
    if (v3 < 0x20)
      v6 = v3;
    v7 = v6 + 8;
    v8 = v4;
    do
    {
      v9 = *v8++;
      v5 ^= v9;
      v7 -= 8;
    }
    while (v7 > 0xF);
    goto LABEL_9;
  }
  -[NSValue getValue:](self, "getValue:", sizep);
  if (v3 > 7)
  {
    v4 = (uint64_t *)sizep;
    goto LABEL_5;
  }
  if (!v3)
    return 0;
  v11 = 0;
  v5 = 0;
  do
  {
    v4 = (uint64_t *)sizep;
    v5 = *((unsigned __int8 *)sizep + v11++) | (v5 << 8);
  }
  while (v3 != v11);
LABEL_9:
  if (v3 >= 0x401)
    free(v4);
  return v5;
}

- (id)weakObjectValue
{
  return 0;
}

+ (NSValue)valueWithEdgeInsets:(NSEdgeInsets)insets
{
  NSEdgeInsets v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = insets;
  return +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v4, "{NSEdgeInsets=dddd}");
}

- (NSEdgeInsets)edgeInsetsValue
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  double v9[3];
  uint64_t v10;
  NSEdgeInsets result;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{NSEdgeInsets=dddd}", 32, 1);
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (v3)
  {
    v8 = 0u;
    *(_OWORD *)v9 = 0u;
    -[NSValue getValue:](self, "getValue:", &v8);
    v6 = *((double *)&v8 + 1);
    v7 = *(double *)&v8;
    v4 = v9[1];
    v5 = v9[0];
  }
  result.right = v4;
  result.bottom = v5;
  result.left = v6;
  result.top = v7;
  return result;
}

- (NSValue)initWithCoder:(NSCoder *)coder
{
  NSZone *v5;

  v5 = (NSZone *)-[NSValue zone](self, "zone");

  return newDecodedValue(coder, v5);
}

- (NSValue)initWithBytes:(const void *)value objCType:(const char *)type
{
  _NSRequestConcreteObject((int)self, a2);
}

@end
