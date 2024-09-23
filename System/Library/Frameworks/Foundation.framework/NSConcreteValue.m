@implementation NSConcreteValue

- (unint64_t)hash
{
  uint64_t *IndexedIvars;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  v4 = *(_QWORD *)self->typeInfo;
  if (v4 <= 7)
  {
    v5 = 0;
    if (v4)
    {
      v8 = v4 + 1;
      do
      {
        v9 = *(unsigned __int8 *)IndexedIvars;
        IndexedIvars = (uint64_t *)((char *)IndexedIvars + 1);
        v5 = v9 | (v5 << 8);
        --v8;
      }
      while (v8 > 1);
    }
  }
  else
  {
    v5 = 0;
    if (v4 >= 0x20)
      v4 = 32;
    v6 = v4 + 8;
    do
    {
      v7 = *IndexedIvars++;
      v5 ^= v7;
      v6 -= 8;
    }
    while (v6 > 0xF);
  }
  return v5;
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  void *IndexedIvars;
  NSString *v7;

  if (*(_QWORD *)self->typeInfo != a4)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes"), a4, -[NSConcreteValue objCType](self, "objCType", a3), *(_QWORD *)self->typeInfo);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  IndexedIvars = object_getIndexedIvars(self);
  memmove(a3, IndexedIvars, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  float64x2_t *IndexedIvars;

  if (NSShouldRetainWithZone(self, a3))
    return self;
  IndexedIvars = (float64x2_t *)object_getIndexedIvars(self);
  return _NSNewValue(IndexedIvars, *((char **)self->typeInfo + 1), a3);
}

- (id)description
{
  const char *v3;
  id result;
  objc_super v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  NSRange v10;
  NSPoint v11;
  NSSize v12;
  NSRect v13;

  v9 = *MEMORY[0x1E0C80C00];
  switch(self->_specialFlags)
  {
    case 0uLL:
      v3 = -[NSConcreteValue objCType](self, "objCType");
      if (!strcmp(v3, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
        goto LABEL_17;
      if (!strcmp(v3, "{CGPoint=dd}"))
        goto LABEL_18;
      if (!strcmp(v3, "{CGSize=dd}"))
        goto LABEL_19;
      if (!strcmp(v3, "{_NSRange=QQ}"))
        goto LABEL_21;
      if (!strcmp(v3, "{CGAffineTransform=ffffff}") || !strcmp(v3, "{CGAffineTransform=dddddd}"))
        goto LABEL_20;
      if (!strcmp(v3, "{UIEdgeInsets=ffff}") || !strcmp(v3, "{UIEdgeInsets=dddd}"))
        goto LABEL_22;
      if (!strcmp(v3, "{NSEdgeInsets=ffff}") || !strcmp(v3, "{NSEdgeInsets=dddd}"))
        goto LABEL_23;
      if (!strcmp(v3, "{NSDirectionalEdgeInsets=ffff}") || !strcmp(v3, "{NSDirectionalEdgeInsets=dddd}"))
        goto LABEL_24;
      if (!strcmp(v3, "{UIOffset=ff}") || !strcmp(v3, "{UIOffset=dd}"))
        goto LABEL_25;
      goto LABEL_16;
    case 1uLL:
LABEL_18:
      -[NSValue pointValue](self, "pointValue");
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSPoint: %@"), NSStringFromPoint(v11));
      break;
    case 2uLL:
LABEL_19:
      -[NSValue sizeValue](self, "sizeValue");
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSSize: %@"), NSStringFromSize(v12));
      break;
    case 3uLL:
LABEL_17:
      -[NSValue rectValue](self, "rectValue");
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSRect: %@"), NSStringFromRect(v13));
      break;
    case 4uLL:
LABEL_21:
      v10.location = -[NSValue rangeValue](self, "rangeValue");
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSRange: %@"), NSStringFromRange(v10));
      break;
    case 0xAuLL:
LABEL_20:
      v7 = 0u;
      v8 = 0u;
      v6 = 0u;
      -[NSConcreteValue getValue:](self, "getValue:", &v6);
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CGAffineTransform: %@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{{%.*g, %.*g, %.*g, %.*g}, {%.*g, %.*g}}"), 17, (_QWORD)v6, 17, *((_QWORD *)&v6 + 1), 17, (_QWORD)v7, 17, *((_QWORD *)&v7 + 1), 17, (_QWORD)v8, 17, *((_QWORD *)&v8 + 1)));
      break;
    case 0xBuLL:
LABEL_22:
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UIEdgeInsets: %@"), _stringFromEdgeInsets(self));
      break;
    case 0xCuLL:
LABEL_23:
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSEdgeInsets: %@"), _stringFromEdgeInsets(self));
      break;
    case 0xDuLL:
LABEL_25:
      v6 = 0uLL;
      -[NSConcreteValue getValue:](self, "getValue:", &v6);
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UIOffset: %@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, (_QWORD)v6, 17, *((_QWORD *)&v6 + 1)));
      break;
    case 0xEuLL:
LABEL_24:
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSDirectionalEdgeInsets: %@"), _stringFromEdgeInsets(self));
      break;
    default:
LABEL_16:
      v5.receiver = self;
      v5.super_class = (Class)NSConcreteValue;
      result = -[NSValue description](&v5, sel_description);
      break;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  double v13[3];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_specialFlags && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", self->_specialFlags, CFSTR("NS.special"));
    switch(self->_specialFlags)
    {
      case 1uLL:
        -[NSValue pointValue](self, "pointValue");
        objc_msgSend(a3, "encodePoint:forKey:", CFSTR("NS.pointval"));
        return;
      case 2uLL:
        -[NSValue sizeValue](self, "sizeValue");
        objc_msgSend(a3, "encodeSize:forKey:", CFSTR("NS.sizeval"));
        return;
      case 3uLL:
        -[NSValue rectValue](self, "rectValue");
        objc_msgSend(a3, "encodeRect:forKey:", CFSTR("NS.rectval"));
        return;
      case 4uLL:
        v7 = -[NSValue rangeValue](self, "rangeValue");
        objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8), CFSTR("NS.rangeval.length"));
        objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7), CFSTR("NS.rangeval.location"));
        return;
      case 0xAuLL:
        v12 = 0u;
        *(_OWORD *)v13 = 0u;
        v11 = 0u;
        -[NSConcreteValue getValue:](self, "getValue:", &v11);
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.atval.a"), *(double *)&v11);
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.atval.b"), *((double *)&v11 + 1));
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.atval.c"), *(double *)&v12);
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.atval.d"), *((double *)&v12 + 1));
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.atval.tx"), v13[0]);
        v5 = v13[1];
        v6 = CFSTR("NS.atval.ty");
        goto LABEL_13;
      case 0xBuLL:
      case 0xCuLL:
        v11 = 0u;
        v12 = 0u;
        -[NSConcreteValue getValue:](self, "getValue:", &v11);
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.edgeval.top"), *(double *)&v11);
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.edgeval.left"), *((double *)&v11 + 1));
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.edgeval.bottom"), *(double *)&v12);
        v5 = *((double *)&v12 + 1);
        v6 = CFSTR("NS.edgeval.right");
        goto LABEL_13;
      case 0xDuLL:
        v11 = 0uLL;
        -[NSConcreteValue getValue:](self, "getValue:", &v11);
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.offset.h"), *(double *)&v11);
        v5 = *((double *)&v11 + 1);
        v6 = CFSTR("NS.offset.v");
        goto LABEL_13;
      case 0xEuLL:
        v11 = 0u;
        v12 = 0u;
        -[NSConcreteValue getValue:](self, "getValue:", &v11);
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.dirEdgeVal.top"), *(double *)&v11);
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.dirEdgeVal.leading"), *((double *)&v11 + 1));
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.dirEdgeVal.bottom"), *(double *)&v12);
        v5 = *((double *)&v12 + 1);
        v6 = CFSTR("NS.dirEdgeVal.trailing");
LABEL_13:
        objc_msgSend(a3, "encodeDouble:forKey:", v6, v5);
        break;
      default:
        v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot encode special type '%ld'"), self->_specialFlags);
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v9, 0));
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NSConcreteValue;
    -[NSValue encodeWithCoder:](&v10, sel_encodeWithCoder_, a3);
  }
}

- (BOOL)isEqualToValue:(id)a3
{
  size_t v6;
  uint64_t v7;
  void *IndexedIvars;
  int v9;
  char *v10;
  void *v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 1;
  if (strcmp(*((const char **)self->typeInfo + 1), (const char *)objc_msgSend(a3, "objCType")))
    return 0;
  v6 = *(_QWORD *)self->typeInfo;
  v7 = objc_opt_class();
  if (v7 == objc_opt_class() || (objc_opt_isKindOfClass() & 1) != 0)
  {
    IndexedIvars = object_getIndexedIvars(self);
    v9 = memcmp(IndexedIvars, (const void *)objc_msgSend(a3, "_value"), v6);
  }
  else
  {
    if (v6 < 0x401)
      v10 = &v12;
    else
      v10 = (char *)malloc_type_malloc(v6, 0x13938C8FuLL);
    objc_msgSend(a3, "getValue:", v10);
    v11 = object_getIndexedIvars(self);
    v9 = memcmp(v11, v10, v6);
    if (v6 >= 0x401)
      free(v10);
  }
  return v9 == 0;
}

- (const)objCType
{
  return (const char *)*((_QWORD *)self->typeInfo + 1);
}

- (void)getValue:(void *)a3
{
  void *IndexedIvars;

  IndexedIvars = object_getIndexedIvars(self);
  memmove(a3, IndexedIvars, *(_QWORD *)self->typeInfo);
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5
{
  char **typeInfo;
  BOOL result;

  typeInfo = (char **)self->typeInfo;
  result = *typeInfo == (char *)a4 && !a5;
  if (a5 && *typeInfo == (char *)a4)
    return matchTypeEncoding(typeInfo[1], (char *)a3, a4);
  return result;
}

+ (void)initialize
{
  NSUInteger v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v2[0] = 0;
    NSGetSizeAndAlignment("{CGRect={CGPoint=dd}{CGSize=dd}}", v2, 0);
    if (v2[0] != 32)
      NSLog((NSString *)CFSTR("*** Inconsistency in NSValue type strings for NSRect types!"));
    v2[0] = 0;
    NSGetSizeAndAlignment("{CGPoint=dd}", v2, 0);
    if (v2[0] != 16)
      NSLog((NSString *)CFSTR("*** Inconsistency in NSValue type strings for NSPoint types!"));
    v2[0] = 0;
    NSGetSizeAndAlignment("{CGSize=dd}", v2, 0);
    if (v2[0] != 16)
      NSLog((NSString *)CFSTR("*** Inconsistency in NSValue type strings for NSSize types!"));
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
