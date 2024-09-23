@implementation NSIndexPath

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  NSUInteger v7;
  uint64_t v8;
  __objc2_class *Class;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v3 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v3 = 0;
    v4 = v3 ^ (unint64_t)self;
    v5 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v4 & 7) == 0)
      v5 = 0xFFFFFFFFFFFFFLL;
    return v5 & (v4 >> 3);
  }
  else
  {
    result = self->_inlinePayload;
    if ((result & 7) != 6)
    {
      v7 = -[NSIndexPath length](self, "length");
      if (v7 > 4
        || (v8 = v7, Class = (__objc2_class *)object_getClass(self), Class == NSIndexPath)
        || (MEMORY[0x1E0C80A78](Class),
            v11 = (_QWORD *)((char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)),
            -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v11, 0, v8),
            (result = _makeInlinePayload(v11, v8)) == 0))
      {
        result = -[NSIndexPath length](self, "length");
        if (result)
        {
          v12 = result;
          v13 = result + (-[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0) << 8);
          return v13 + (-[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v12 - 1) << 36);
        }
      }
    }
  }
  return result;
}

- (NSUInteger)indexAtPosition:(NSUInteger)position
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (position == 0x7FFFFFFFFFFFFFFFLL)
    return v3;
  if ((self & 0x8000000000000000) != 0)
  {
    v4 = *MEMORY[0x1E0DE7C58];
    if ((~self & 0xC000000000000007) == 0)
      v4 = 0;
    v5 = v4 ^ self;
    v6 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v5 & 7) == 0)
      v6 = 0xFFFFFFFFFFFFFLL;
    v7 = v6 & (v5 >> 3);
  }
  else
  {
    v7 = *(_QWORD *)(self + 24);
    if ((v7 & 7) != 6)
    {
      if (*(_QWORD *)(self + 16) > position)
        return *(_QWORD *)(*(_QWORD *)(self + 8) + 8 * position);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (((v7 >> 3) & 7) <= position)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (position < 4)
    return (v7 >> (13 * position + 8)) & 0x1FFF;
  __break(1u);
  return self;
}

- (void)getIndexes:(NSUInteger *)indexes range:(NSRange)positionRange
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t inlinePayload;
  uint64_t v14;
  NSUInteger v15;
  NSString *v16;
  void *v17;
  NSRange v18;

  length = positionRange.length;
  location = positionRange.location;
  v9 = -[NSIndexPath length](self, "length");
  if (v9 < length || location > v9 - length)
    goto LABEL_21;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v10 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v10 = 0;
    v11 = v10 ^ (unint64_t)self;
    v12 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v11 & 7) == 0)
      v12 = 0xFFFFFFFFFFFFFLL;
    inlinePayload = v12 & (v11 >> 3);
  }
  else
  {
    inlinePayload = self->_inlinePayload;
    if ((inlinePayload & 7) != 6)
    {
      if (object_getClass(self) == (Class)NSIndexPath)
      {
        memmove(indexes, &self->_indexes[location], 8 * length);
      }
      else
      {
        for (; length; --length)
          *indexes++ = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", location++);
      }
      return;
    }
  }
  if (length)
  {
    v14 = 13 * location + 8;
    while (location < 4)
    {
      *indexes++ = (inlinePayload >> v14) & 0x1FFF;
      v14 += 13;
      ++location;
      if (!--length)
        return;
    }
    __break(1u);
LABEL_21:
    v15 = v9;
    v16 = _NSMethodExceptionProem((objc_class *)self, a2);
    v18.location = location;
    v18.length = length;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ beyond bounds (%lu)"), v16, NSStringFromRange(v18), v15), 0);
    objc_exception_throw(v17);
  }
}

- (NSUInteger)length
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t inlinePayload;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v2 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v2 = 0;
    v3 = v2 ^ (unint64_t)self;
    v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0)
      v4 = 0xFFFFFFFFFFFFFLL;
    inlinePayload = v4 & (v3 >> 3);
    return (inlinePayload >> 3) & 7;
  }
  inlinePayload = self->_inlinePayload;
  if ((inlinePayload & 7) == 6)
    return (inlinePayload >> 3) & 7;
  return self->_length;
}

- (NSIndexPath)initWithCoder:(id)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  const __CFString **v16;
  const __CFString **v17;
  NSIndexPath *v18;
  uint64_t *v19;
  unint64_t v20;
  void *v21;
  const __CFString **v22;
  const __CFString **v23;
  NSString *v25;
  void *v26;
  uint64_t v27;
  NSString *v28;
  uint64_t *v29;
  uint64_t v30;
  objc_super v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v31.receiver = self;
    v31.super_class = (Class)NSIndexPath;
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be serialized with a coder that does not support keyed archives"), -[NSIndexPath description](&v31, sel_description));

    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v28 = v25;
    goto LABEL_44;
  }
  if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("NSIndexPathLength")) & 1) == 0)
  {

    v40 = CFSTR("NSLocalizedDescription");
    v41[0] = CFSTR("-[NSIndexPath initWithCoder:] decoder did not provide a length value for the indexPath.");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (const __CFString **)v41;
    v17 = &v40;
    goto LABEL_17;
  }
  v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSIndexPathLength"));
  v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSIndexPathData"));
  v7 = objc_msgSend(v6, "bytes");
  v8 = (unsigned __int8 *)v7;
  v30 = v7;
  if (v5 < 2)
    goto LABEL_11;
  v7 = objc_msgSend(a3, "requiresSecureCoding", v30);
  if ((_DWORD)v7)
  {
    if (v8)
    {
      v7 = objc_msgSend(v6, "length");
      v9 = 0;
      if (v7)
      {
        v10 = v8;
        do
        {
          v11 = *v10++;
          v9 += (v11 >> 7) ^ 1;
          --v7;
        }
        while (v7);
      }
      if (v9 == v5)
        goto LABEL_10;

      v36 = CFSTR("NSLocalizedDescription");
      v37 = CFSTR("Range data did not match expected length.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v37;
      v17 = &v36;
    }
    else
    {

      v38 = CFSTR("NSLocalizedDescription");
      v39 = CFSTR("Range data missing.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v39;
      v17 = &v38;
    }
LABEL_17:
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1)));
    return 0;
  }
LABEL_10:
  if (v5 >> 61)
  {
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v29 = (uint64_t *)MEMORY[0x1E0C99750];
    goto LABEL_43;
  }
LABEL_11:
  if (v5 <= 1)
    v12 = 1;
  else
    v12 = v5;
  MEMORY[0x1E0C80A78](v7);
  v14 = (uint64_t *)((char *)&v30 - v13);
  if (v5 <= 0x100)
  {
    bzero((char *)&v30 - v13, 8 * v12);
    goto LABEL_19;
  }
  v14 = (uint64_t *)malloc_type_malloc(8 * v12, 0x100004000313F17uLL);
  if (!v14)
  {
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** attempt to create an NSUInteger buffer of length (%lu) failed"), v12);
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v29 = (uint64_t *)MEMORY[0x1E0C99850];
LABEL_43:
    v27 = *v29;
LABEL_44:
    objc_exception_throw((id)objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, v28, 0, v30));
  }
LABEL_19:
  if (v5)
  {
    if (v5 == 1)
    {
      if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("NSIndexPathValue")) & 1) != 0)
      {
        *v14 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSIndexPathValue"));
        goto LABEL_27;
      }

      v34 = CFSTR("NSLocalizedDescription");
      v35 = CFSTR("-[NSIndexPath initWithCoder:] decoder did not provide indexPath data.");
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v35;
      v23 = &v34;
    }
    else
    {
      if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("NSIndexPathData")) & 1) != 0)
      {
        if (v8)
        {
          v19 = v14;
          v20 = v5;
          do
          {
            *v19++ = _NSGetUnsignedInt2(&v30);
            --v20;
          }
          while (v20);
        }
        goto LABEL_27;
      }

      if (v5 >= 0x101)
        free(v14);
      v32 = CFSTR("NSLocalizedDescription");
      v33 = CFSTR("-[NSIndexPath initWithCoder:] decoder did not provide indexPath data.");
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v33;
      v23 = &v32;
    }
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1, v30)));
    return 0;
  }
LABEL_27:
  if (objc_msgSend(a3, "error", v30))
  {

    v18 = 0;
  }
  else
  {
    v18 = -[NSIndexPath initWithIndexes:length:](self, "initWithIndexes:length:", v14, v5);
  }
  if (v5 >= 0x101)
    free(v14);
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSComparisonResult)compare:(NSIndexPath *)otherObject
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSComparisonResult v10;
  unint64_t v11;
  NSComparisonResult v12;

  if (!otherObject)
    return 1;
  if (otherObject == self)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to compare %@ with object of different class: %@"), self, otherObject), 0));
  v5 = -[NSIndexPath length](self, "length");
  v6 = -[NSIndexPath length](otherObject, "length");
  v7 = v6;
  if (v5 >= v6)
    v8 = v6;
  else
    v8 = v5;
  if (v8)
  {
    v9 = 0;
    v10 = NSOrderedDescending;
    while (1)
    {
      v11 = -[NSIndexPath indexAtPosition:](otherObject, "indexAtPosition:", v9);
      if (-[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v9) < v11)
        return -1;
      if (-[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v9) > v11)
        return v10;
      if (v8 == ++v9)
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    if (v5 >= v7)
      v12 = NSOrderedSame;
    else
      v12 = NSOrderedAscending;
    if (v5 <= v7)
      return v12;
    else
      return 1;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a3 == self)
    return 1;
  v19 = v8;
  v20 = v7;
  v21 = v6;
  v22 = v5;
  v23 = v4;
  v24 = v3;
  v25 = v9;
  v26 = v10;
  if (!a3 || ((unint64_t)self & 0x8000000000000000) != 0 && ((unint64_t)a3 & 0x8000000000000000) != 0)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v13 = -[NSIndexPath length](self, "length");
  if (v13 != objc_msgSend(a3, "length"))
    return 0;
  if (v13)
  {
    if (v13 != 2)
    {
      v17 = 0;
      while (1)
      {
        v18 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v17, v19, v20, v21, v22, v23, v24, v25, v26);
        if (v18 != objc_msgSend(a3, "indexAtPosition:", v17))
          break;
        if (v13 == ++v17)
          return 1;
      }
      return 0;
    }
    v14 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 1);
    if (v14 != objc_msgSend(a3, "indexAtPosition:", 1))
      return 0;
    v15 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0);
    if (v15 != objc_msgSend(a3, "indexAtPosition:", 0))
      return 0;
  }
  return 1;
}

- (NSIndexPath)initWithIndex:(NSUInteger)index
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = index;
  return -[NSIndexPath initWithIndexes:length:](self, "initWithIndexes:length:", v4, 1);
}

- (NSIndexPath)indexPathByAddingIndex:(NSUInteger)index
{
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSIndexPath *v11;
  NSString *v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = -[NSIndexPath length](self, "length");
  v6 = v5 + 1;
  if ((v5 + 1) >> 61)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (_QWORD *)MEMORY[0x1E0C99750];
    goto LABEL_13;
  }
  v7 = v5;
  if (v6 <= 1)
    v8 = 1;
  else
    v8 = v5 + 1;
  MEMORY[0x1E0C80A78](v5);
  v10 = (char *)v16 - v9;
  if (v6 <= 0x100)
  {
    bzero((char *)v16 - v9, 8 * v8);
    goto LABEL_8;
  }
  v10 = (char *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
  if (!v10)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** attempt to create an NSUInteger buffer of length (%lu) failed"), v8);
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (_QWORD *)MEMORY[0x1E0C99850];
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", *v15, v13, 0));
  }
LABEL_8:
  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v10, 0, v7);
  *(_QWORD *)&v10[8 * v7] = index;
  v11 = +[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", v10, v6);
  if (v6 >= 0x101)
    free(v10);
  return v11;
}

- (NSIndexPath)initWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length
{
  NSIndexPath *v6;
  unint64_t v7;
  uint64_t InlinePayload;
  unint64_t v9;
  malloc_zone_t *v10;
  unint64_t *v11;
  unint64_t v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NSIndexPath;
  v6 = -[NSIndexPath init](&v14, sel_init);
  v7 = (unint64_t)v6;
  if (length >> 30 || !v6)
  {

    return 0;
  }
  InlinePayload = _makeInlinePayload((unint64_t *)indexes, length);
  if (!InlinePayload)
    goto LABEL_9;
  v9 = InlinePayload;
  if ((__objc2_class *)objc_opt_class() != NSIndexPath || (_NSIndexSetTaggedPointersDisabled & 1) != 0)
  {
    if (objc_msgSend((id)v7, "isMemberOfClass:", NSIndexPath))
    {
      *(_QWORD *)(v7 + 24) = v9;
      return (NSIndexPath *)v7;
    }
LABEL_9:
    v10 = malloc_default_zone();
    v11 = (unint64_t *)malloc_type_zone_malloc(v10, 8 * length, 0x4A6F13AEuLL);
    *(_QWORD *)(v7 + 8) = v11;
    memmove(v11, indexes, 8 * length);
    *(_QWORD *)(v7 + 16) = length;
    return (NSIndexPath *)v7;
  }

  v7 = (8 * v9) | 0x8000000000000004;
  v13 = *MEMORY[0x1E0DE7C58] ^ v7;
  if ((~v13 & 0xC000000000000007) != 0)
    return (NSIndexPath *)(v13 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v13 & 7)));
  return (NSIndexPath *)v7;
}

+ (NSIndexPath)indexPathWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length
{
  uint64_t InlinePayload;
  NSIndexPath *result;
  unint64_t v9;

  if (NSIndexPath != a1)
    return (NSIndexPath *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIndexes:length:", indexes, length);
  if ((_NSIndexSetTaggedPointersDisabled & 1) != 0)
    return (NSIndexPath *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIndexes:length:", indexes, length);
  InlinePayload = _makeInlinePayload((unint64_t *)indexes, length);
  if (!InlinePayload)
    return (NSIndexPath *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIndexes:length:", indexes, length);
  result = (NSIndexPath *)((8 * InlinePayload) | 0x8000000000000004);
  v9 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v9 & 0xC000000000000007) != 0)
    return (NSIndexPath *)(v9 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v9 & 7)));
  return result;
}

- (void)dealloc
{
  unint64_t *indexes;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  indexes = self->_indexes;
  if (indexes)
  {
    self->_indexes = 0;
    free(indexes);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSIndexPath;
  -[NSIndexPath dealloc](&v4, sel_dealloc);
}

- (void)getIndexes:(NSUInteger *)indexes
{
  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", indexes, 0, -[NSIndexPath length](self, "length"));
}

- (NSIndexPath)init
{
  return -[NSIndexPath initWithIndexes:length:](self, "initWithIndexes:length:", 0, 0);
}

+ (void)initialize
{
  if (NSIndexPath == a1)
  {
    if (*MEMORY[0x1E0DE7C50] && _CFExecutableLinkedOnOrAfter())
      _objc_registerTaggedPointerClass();
    else
      _NSIndexSetTaggedPointersDisabled = 1;
  }
}

+ (NSIndexPath)indexPathWithIndex:(NSUInteger)index
{
  NSIndexPath *result;
  unint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = index;
  if (NSIndexPath != a1 || index >> 13 || (_NSIndexSetTaggedPointersDisabled & 1) != 0)
    return (NSIndexPath *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIndexes:length:", v5, 1);
  result = (NSIndexPath *)((index << 11) | 0x8000000000000074);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSIndexPath *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (id)indexPath
{
  id result;
  unint64_t v3;

  if (NSIndexPath != a1 || (_NSIndexSetTaggedPointersDisabled & 1) != 0)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIndexes:length:", 0, 0);
  result = (id)0x8000000000000034;
  v3 = *MEMORY[0x1E0DE7C58] ^ 0x8000000000000034;
  if ((~v3 & 0xC000000000000007) != 0)
    return (id)(v3 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v3 & 7)));
  return result;
}

- (NSIndexPath)indexPathByRemovingLastIndex
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  NSIndexPath *v10;
  NSString *v11;
  void *v12;
  _QWORD *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSIndexPath length](self, "length");
  v4 = v3 - 1;
  if (v3 <= 1)
    return +[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", 0, 0);
  if (v4 >> 61)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v4);
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (_QWORD *)MEMORY[0x1E0C99750];
    goto LABEL_12;
  }
  v6 = v3;
  MEMORY[0x1E0C80A78](v3);
  v8 = (char *)v14 - v7;
  if (v9 > 0x101)
  {
    v8 = (char *)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
    if (v8)
      goto LABEL_7;
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** attempt to create an NSUInteger buffer of length (%lu) failed"), v4);
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (_QWORD *)MEMORY[0x1E0C99850];
LABEL_12:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", *v13, v11, 0));
  }
  bzero((char *)v14 - v7, 8 * v4);
LABEL_7:
  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v8, 0, v4);
  v10 = +[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", v8, v4);
  if (v6 >= 0x102)
    free(v8);
  return v10;
}

- (id)description
{
  NSUInteger v3;
  NSMutableString *v4;
  NSUInteger v5;
  NSUInteger v6;
  const char *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[NSIndexPath length](self, "length");
  v9.receiver = self;
  v9.super_class = (Class)NSIndexPath;
  v4 = +[NSString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@ {length = %lu, path = "), -[NSIndexPath description](&v9, sel_description), v3);
  if (v3)
  {
    v5 = 0;
    do
    {
      v6 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v5++);
      if (v5 >= v3)
        v7 = "";
      else
        v7 = " - ";
      -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("%lu%s"), v6, v7);
    }
    while (v3 != v5);
  }
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("}"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger v5;
  void *v6;
  uint64_t i;
  NSUInteger v8;
  _BYTE *v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  objc_super v13;
  _BYTE v14[20];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)NSIndexPath;
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be serialized with a coder that does not support keyed archiving"), -[NSIndexPath description](&v13, sel_description)), 0);
    objc_exception_throw(v12);
  }
  v5 = -[NSIndexPath length](self, "length");
  objc_msgSend(a3, "encodeInteger:forKey:", v5, CFSTR("NSIndexPathLength"));
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(a3, "encodeInteger:forKey:", -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0), CFSTR("NSIndexPathValue"));
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 2 * v5 + 16);
      for (i = 0; i != v5; ++i)
      {
        v8 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", i);
        v9 = v14;
        if (v8 >= 0x80)
        {
          v10 = v8;
          do
          {
            *v9++ = v10 | 0x80;
            v8 = v10 >> 7;
            v11 = v10 >> 14;
            v10 >>= 7;
          }
          while (v11);
        }
        *v9 = v8;
        objc_msgSend(v6, "appendBytes:length:", v14, v9 - v14 + 1);
      }
      objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSIndexPathData"));

    }
  }
}

@end
