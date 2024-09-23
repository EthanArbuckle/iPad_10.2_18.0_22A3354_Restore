@implementation NSIndexSet

- (NSIndexSet)initWithCoder:(id)a3
{
  NSMutableIndexSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t i;
  unsigned int v13;
  uint64_t v14;
  NSIndexSet *v15;
  void *v17;
  const __CFString **v18;
  const __CFString **v19;
  uint64_t v20;
  unsigned __int8 *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(NSMutableIndexSet);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    LODWORD(v21) = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", &v21, 4);
    v8 = v21;
    if ((_DWORD)v21)
    {
      do
      {
        v20 = 0;
        objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", (char *)&v20 + 4, 4);
        objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", &v20, 4);
        -[NSMutableIndexSet addIndexesInRange:](v5, "addIndexesInRange:", HIDWORD(v20), v20);
        --v8;
      }
      while (v8);
    }
    goto LABEL_17;
  }
  v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSRangeCount"));
  if (v6)
  {
    v7 = v6;
    if (v6 == 1)
    {
      -[NSMutableIndexSet addIndexesInRange:](v5, "addIndexesInRange:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSLocation")), objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSLength")));
      goto LABEL_17;
    }
    if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("NSRangeData")) & 1) == 0)
    {

      v26 = CFSTR("NSLocalizedDescription");
      v27[0] = CFSTR("-[NSIndexSet initWithCoder:] decoder did not provide range data");
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1)));
      self = 0;
      goto LABEL_17;
    }
    v9 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSRangeData"));
    v10 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
    v21 = v10;
    if (objc_msgSend(a3, "requiresSecureCoding"))
    {
      if (v9)
      {
        v11 = objc_msgSend(v9, "length");
        for (i = 0; v11; --v11)
        {
          v13 = *v10++;
          i += (v13 >> 7) ^ 1;
        }
        if (i == 2 * v7)
          goto LABEL_14;

        v22 = CFSTR("NSLocalizedDescription");
        v23 = CFSTR("Range data did not match expected length.");
        v17 = (void *)MEMORY[0x1E0C99D80];
        v18 = &v23;
        v19 = &v22;
      }
      else
      {

        v24 = CFSTR("NSLocalizedDescription");
        v25 = CFSTR("Range data did not match expected length.");
        v17 = (void *)MEMORY[0x1E0C99D80];
        v18 = &v25;
        v19 = &v24;
      }
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1)));
      return 0;
    }
    do
    {
LABEL_14:
      v14 = _NSGetUnsignedInt2(&v21);
      -[NSMutableIndexSet addIndexesInRange:](v5, "addIndexesInRange:", v14, _NSGetUnsignedInt2(&v21));
      --v7;
    }
    while (v7);
  }
LABEL_17:
  v15 = -[NSIndexSet initWithIndexSet:](self, "initWithIndexSet:", v5);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  int v10;
  int v11;
  void *v12;
  uint64_t i;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  int v23;
  _DWORD v24[10];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = -[NSIndexSet rangeCount](self, "rangeCount");
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeInteger:forKey:", v5, CFSTR("NSRangeCount"));
    if (v5)
    {
      if (v5 == 1)
      {
        v6 = -[NSIndexSet rangeAtIndex:](self, "rangeAtIndex:", 0);
        v8 = v7;
        objc_msgSend(a3, "encodeInteger:forKey:", v6, CFSTR("NSLocation"));
        objc_msgSend(a3, "encodeInteger:forKey:", v8, CFSTR("NSLength"));
      }
      else
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 2 * v5 + 16);
        for (i = 0; i != v5; ++i)
        {
          v14 = -[NSIndexSet rangeAtIndex:](self, "rangeAtIndex:", i);
          v16 = v24;
          if (v14 >= 0x80)
          {
            v17 = v14;
            do
            {
              *v16++ = v17 | 0x80;
              v14 = v17 >> 7;
              v18 = v17 >> 14;
              v17 >>= 7;
            }
            while (v18);
          }
          *v16 = v14;
          v19 = v16 + 1;
          if (v15 < 0x80)
          {
            LOBYTE(v20) = v15;
          }
          else
          {
            do
            {
              *v19++ = v15 | 0x80;
              v20 = v15 >> 7;
              v21 = v15 >> 14;
              v15 >>= 7;
            }
            while (v21);
          }
          *v19 = v20;
          objc_msgSend(v12, "appendBytes:length:", v24, v19 - (_BYTE *)v24 + 1);
        }
        objc_msgSend(a3, "encodeObject:forKey:", v12, CFSTR("NSRangeData"));

      }
    }
  }
  else
  {
    v24[0] = v5;
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", v24);
    if (v5)
    {
      for (j = 0; j != v5; ++j)
      {
        v10 = -[NSIndexSet rangeAtIndex:](self, "rangeAtIndex:", j);
        v22 = v11;
        v23 = v10;
        objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &v23);
        objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &v22);
      }
    }
  }
}

- (Class)classForCoder
{
  return (Class)NSIndexSet;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)_indexOfRangeBeforeOrContainingIndex:(unint64_t)a3
{
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  unint64_t v11;
  $228E88DFACDD67E146FBAE62E08A49BD *v12;
  unint64_t location;
  unint64_t v14;
  _QWORD v15[7];
  _QWORD v16[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (((unint64_t)self & 0x8000000000000000) != 0
    || (indexSetFlags = self->_indexSetFlags, (*(_BYTE *)&indexSetFlags & 2) != 0))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__NSIndexSet__indexOfRangeBeforeOrContainingIndex___block_invoke;
    v15[3] = &unk_1E0F4E758;
    v15[5] = v16;
    v15[6] = a3;
    v15[4] = &v17;
    -[NSIndexSet enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", v15);
    v8 = v18[3];
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
    return v8;
  }
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->_internal._singleRange._range.length)
    {
      v7 = 0;
      goto LABEL_10;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v6 = *(_QWORD *)(self->_internal._singleRange._range.location + 8);
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = v6 - 1;
LABEL_10:
  if (-[NSIndexSet lastIndex](self, "lastIndex") <= a3)
    return v7;
  if (-[NSIndexSet firstIndex](self, "firstIndex") > a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  p_internal = &self->_internal;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0)
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                     + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                     + 64);
  v11 = 0;
  while (v11 < v7)
  {
    v8 = (v11 + v7) >> 1;
    v12 = &p_internal[v8];
    if (v12->_singleRange._range.location <= a3)
    {
      if (v12->_singleRange._range.location + v12->_singleRange._range.length - 1 >= a3)
        return v8;
      v11 = v8 + 1;
    }
    else
    {
      v7 = (v11 + v7) >> 1;
    }
  }
  location = p_internal[v11]._singleRange._range.location;
  v14 = v11 - 1;
  if (!v11)
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (location > a3)
    return v14;
  else
    return v11;
}

- (NSUInteger)lastIndex
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSUInteger location;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger v7;
  uint64_t v8;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  uint64_t v10;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v2 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v2 = 0;
    v3 = v2 ^ (unint64_t)self;
    v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0)
      v4 = 0xFFFFFFFFFFFFFLL;
    location = v4 & (v3 >> 3);
    if (!location)
      return 0x7FFFFFFFFFFFFFFFLL;
    return __clz(location) ^ 0x3F;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    location = self->_internal._singleRange._range.location;
    if (location)
      return __clz(location) ^ 0x3F;
  }
  else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->_internal._singleRange._range.length)
    {
      v10 = 0;
      p_internal = &self->_internal;
      return p_internal[v10]._singleRange._range.location + p_internal[v10]._singleRange._range.length - 1;
    }
  }
  else
  {
    v7 = self->_internal._singleRange._range.location;
    v8 = *(_QWORD *)(v7 + 8);
    if (v8)
    {
      p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(v7 + 16 * *(_QWORD *)(v7 + 24) + 64);
      v10 = v8 - 1;
      return p_internal[v10]._singleRange._range.location + p_internal[v10]._singleRange._range.length - 1;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsIndex:(NSUInteger)value
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger location;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger v10;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  _opaque_pthread_t *v12;
  _BOOL8 v13;
  NSUInteger length;
  NSUInteger v15;
  NSUInteger v16;
  $228E88DFACDD67E146FBAE62E08A49BD *v17;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v5 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v5 = 0;
    v6 = v5 ^ (unint64_t)self;
    v7 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v6 & 7) == 0)
      v7 = 0xFFFFFFFFFFFFFLL;
    location = v7 & (v6 >> 3);
LABEL_13:
    if (value <= 0x3F)
      return (location >> value) & 1;
    goto LABEL_17;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    location = self->_internal._singleRange._range.location;
    goto LABEL_13;
  }
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    length = self->_internal._singleRange._range.length;
    if (length)
    {
      v15 = self->_internal._singleRange._range.location;
      if (v15 <= value)
      {
        LOBYTE(v13) = v15 + length - 1 >= value;
        return v13;
      }
    }
    goto LABEL_17;
  }
  p_internal = &self->_internal;
  v10 = self->_internal._singleRange._range.location;
  if (!*(_QWORD *)(v10 + 8))
  {
LABEL_17:
    LOBYTE(v13) = 0;
    return v13;
  }
  v12 = (_opaque_pthread_t *)atomic_load((unint64_t *)(v10 + 56));
  if (pthread_self() != v12)
    goto LABEL_11;
  v16 = p_internal->_singleRange._range.location;
  if (*(_QWORD *)(p_internal->_singleRange._range.location + 32) == value)
    goto LABEL_24;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0)
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(v16 + 16 * *(_QWORD *)(v16 + 24) + 64);
  v17 = &p_internal[*(_QWORD *)(v16 + 40)];
  if (v17->_singleRange._range.location <= value
    && v17->_singleRange._range.location + v17->_singleRange._range.length - 1 >= value)
  {
LABEL_24:
    LOBYTE(v13) = 1;
  }
  else
  {
LABEL_11:
    LOBYTE(v13) = -[NSIndexSet _indexOfRangeContainingIndex:](self, "_indexOfRangeContainingIndex:", value) != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    v4 = self;
    if ((__objc2_class *)objc_opt_class() == NSIndexSet)
      return v4;
    else
      return -[NSIndexSet initWithIndexSet:](+[NSIndexSet allocWithZone:](NSIndexSet, "allocWithZone:", a3), "initWithIndexSet:", v4);
  }
  return self;
}

- (unint64_t)_indexOfRangeAfterOrContainingIndex:(unint64_t)a3
{
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  unint64_t v11;
  unint64_t v12;
  $228E88DFACDD67E146FBAE62E08A49BD *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD v16[7];
  _QWORD v17[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (((unint64_t)self & 0x8000000000000000) != 0
    || (indexSetFlags = self->_indexSetFlags, (*(_BYTE *)&indexSetFlags & 2) != 0))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__NSIndexSet__indexOfRangeAfterOrContainingIndex___block_invoke;
    v16[3] = &unk_1E0F4E758;
    v16[5] = v17;
    v16[6] = a3;
    v16[4] = &v18;
    -[NSIndexSet enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", v16);
    v8 = v19[3];
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v18, 8);
    return v8;
  }
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->_internal._singleRange._range.length)
    {
      v7 = 0;
      goto LABEL_10;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v6 = *(_QWORD *)(self->_internal._singleRange._range.location + 8);
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = v6 - 1;
LABEL_10:
  if (-[NSIndexSet firstIndex](self, "firstIndex") >= a3)
    return 0;
  if (-[NSIndexSet lastIndex](self, "lastIndex") < a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  p_internal = &self->_internal;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0)
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                     + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                     + 64);
  v11 = 0;
  if (v7)
  {
    v12 = v7;
    do
    {
      v8 = (v11 + v12) >> 1;
      v13 = &p_internal[v8];
      if (v13->_singleRange._range.location <= a3)
      {
        if (v13->_singleRange._range.location + v13->_singleRange._range.length - 1 >= a3)
          return v8;
        v11 = v8 + 1;
      }
      else
      {
        v12 = (v11 + v12) >> 1;
      }
    }
    while (v11 < v12);
  }
  v14 = p_internal[v11]._singleRange._range.location + p_internal[v11]._singleRange._range.length - 1;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 < v7)
    v15 = v11 + 1;
  if (v14 < a3)
    return v15;
  else
    return v11;
}

- (NSUInteger)firstIndex
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger location;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  int v9;
  int v10;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v2 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v2 = 0;
    v3 = v2 ^ (unint64_t)self;
    v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0)
      v4 = 0xFFFFFFFFFFFFFLL;
    v5 = v4 & (v3 >> 3);
    goto LABEL_12;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) == 0)
  {
    if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      if (self->_internal._singleRange._range.length)
      {
        p_internal = &self->_internal;
        return p_internal->_singleRange._range.location;
      }
    }
    else
    {
      location = self->_internal._singleRange._range.location;
      if (*(_QWORD *)(location + 8))
      {
        p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(location + 16 * *(_QWORD *)(location + 24) + 64);
        return p_internal->_singleRange._range.location;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v5 = self->_internal._singleRange._range.location;
LABEL_12:
  v9 = __clz(__rbit64(v5));
  if (v5)
    v10 = v9;
  else
    v10 = -1;
  if (v10 < 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v10;
}

- (NSUInteger)count
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSUInteger location;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger v7;
  uint8x8_t v9;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v2 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v2 = 0;
    v3 = v2 ^ (unint64_t)self;
    v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0)
      v4 = 0xFFFFFFFFFFFFFLL;
    location = v4 & (v3 >> 3);
    goto LABEL_12;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    location = self->_internal._singleRange._range.location;
LABEL_12:
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)location);
    v9.i16[0] = vaddlv_u8(v9);
    return v9.u32[0];
  }
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    return self->_internal._singleRange._range.length;
  v7 = self->_internal._singleRange._range.location;
  if (*(_QWORD *)(v7 + 8))
    return *(_QWORD *)(v7 + 16);
  else
    return 0;
}

- (NSUInteger)countOfIndexesInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger *p_length;
  NSUInteger v12;
  NSUInteger v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  unint64_t v19;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  NSUInteger v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  unint64_t v27;
  $228E88DFACDD67E146FBAE62E08A49BD *v28;
  NSUInteger v29;
  BOOL v30;
  unint64_t v31;
  NSUInteger *i;
  unint64_t v33;
  NSUInteger v34;

  length = range.length;
  if (!range.length)
    return length;
  location = range.location;
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    indexSetFlags = self->_indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      v9 = self->_internal._singleRange._range.location;
      if (v9)
        goto LABEL_13;
    }
    else
    {
      if ((*(_BYTE *)&indexSetFlags & 1) != 0)
        p_length = &self->_internal._singleRange._range.length;
      else
        p_length = (NSUInteger *)(self->_internal._singleRange._range.location + 8);
      if (*p_length)
      {
        v19 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", range.location);
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          p_internal = &self->_internal;
          if ((*(_DWORD *)&self->_indexSetFlags & 1) != 0)
          {
            v25 = 16;
            if ((*(_DWORD *)&self->_indexSetFlags & 2) == 0)
              v25 = 24;
            v24 = *(Class *)((char *)&self->super.isa + v25) != 0;
          }
          else
          {
            v21 = p_internal->_singleRange._range.location;
            p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                             + 16
                                                             * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                             + 64);
            v22 = *(_QWORD *)(v21 + 8);
            if (v22)
              v23 = 0;
            else
              v23 = (*(_DWORD *)&self->_indexSetFlags & 2) == 0;
            if (v23)
              v24 = 0;
            else
              v24 = v22;
          }
          v26 = location + length;
          v27 = location + length - 1;
          v28 = &p_internal[v19];
          if (v28->_singleRange._range.location >= location)
          {
            length = 0;
          }
          else
          {
            v29 = v28->_singleRange._range.length + v28->_singleRange._range.location;
            if (v29 - 1 >= v27)
              return length;
            length = v29 - location;
            ++v19;
          }
          v30 = v24 > v19;
          v31 = v24 - v19;
          if (v30)
          {
            for (i = &p_internal[v19]._singleRange._range.length; ; i += 2)
            {
              v33 = *(i - 1);
              v34 = *i;
              if (v33 + *i - 1 > v27)
                break;
              length += v34;
              if (!--v31)
                return length;
            }
            if (v33 <= v27)
              return length + v26 - v33;
          }
          return length;
        }
      }
    }
    return 0;
  }
  v6 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v6 = 0;
  v7 = v6 ^ (unint64_t)self;
  v8 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v7 & 7) == 0)
    v8 = 0xFFFFFFFFFFFFFLL;
  v9 = v8 & (v7 >> 3);
  if (!v9)
    return 0;
LABEL_13:
  v12 = range.location + range.length;
  if (range.location + range.length >= 0x40)
    v12 = 64;
  v13 = v12 - range.location;
  if (range.location <= 0x3F)
    v14 = range.location;
  else
    v14 = 0;
  if (range.location > 0x3F)
    v13 = 0;
  v15 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v13 << v14;
  if (v13)
    v16 = v15;
  else
    v16 = 0;
  v17 = (uint8x8_t)vcnt_s8((int8x8_t)(v16 & v9));
  v17.i16[0] = vaddlv_u8(v17);
  return v17.u32[0];
}

- (unint64_t)_indexOfRangeContainingIndex:(unint64_t)a3
{
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger location;
  uint64_t v5;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  $228E88DFACDD67E146FBAE62E08A49BD *v10;
  $228E88DFACDD67E146FBAE62E08A49BD *v11;
  _QWORD v13[7];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (((unint64_t)self & 0x8000000000000000) != 0
    || (indexSetFlags = self->_indexSetFlags, (*(_BYTE *)&indexSetFlags & 2) != 0))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__NSIndexSet__indexOfRangeContainingIndex___block_invoke;
    v13[3] = &unk_1E0F4E758;
    v13[5] = v14;
    v13[6] = a3;
    v13[4] = &v15;
    -[NSIndexSet enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", v13);
    v9 = v16[3];
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
    return v9;
  }
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->_internal._singleRange._range.length)
    {
      v9 = 0;
      p_internal = &self->_internal;
      goto LABEL_17;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  location = self->_internal._singleRange._range.location;
  v5 = *(_QWORD *)(location + 8);
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(location + 16 * *(_QWORD *)(location + 24) + 64);
  v7 = v5 - 1;
  if (v7)
  {
    v8 = 0;
    do
    {
      v9 = (v8 + v7) >> 1;
      v10 = &p_internal[v9];
      if (v10->_singleRange._range.location <= a3)
      {
        if (v10->_singleRange._range.location + v10->_singleRange._range.length - 1 >= a3)
          return v9;
        v8 = v9 + 1;
      }
      else
      {
        v7 = (v8 + v7) >> 1;
      }
    }
    while (v8 < v7);
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
LABEL_17:
  v11 = &p_internal[v9];
  if (v11->_singleRange._range.location > a3
    || v11->_singleRange._range.location + v11->_singleRange._range.length - 1 < a3)
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

+ (NSIndexSet)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  if (v4 == (objc_class *)NSIndexSet)
    return (NSIndexSet *)&___placeholderIndexSet;
  else
    return (NSIndexSet *)NSAllocateObject(v4, 0, a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0)
    free(self->_internal._multipleRanges._data);
  v3.receiver = self;
  v3.super_class = (Class)NSIndexSet;
  -[NSIndexSet dealloc](&v3, sel_dealloc);
}

- (void)enumerateIndexesUsingBlock:(void *)block
{
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, 0, 0, 0x7FFFFFFFFFFFFFFFLL);
  __NSIndexSetEnumerate((uint64_t)self, 0, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

+ (NSIndexSet)indexSet
{
  NSIndexSet *result;
  unint64_t v3;

  if (_NSTaggedIndexSetAllowed != 1 || NSIndexSet != a1)
    return (NSIndexSet *)objc_alloc_init((Class)a1);
  result = (NSIndexSet *)0x8580000000000007;
  v3 = *MEMORY[0x1E0DE7C58] ^ 0x8580000000000007;
  if ((~v3 & 0xC000000000000007) != 0)
    return (NSIndexSet *)(v3 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v3 & 7)));
  return result;
}

- (NSIndexSet)initWithIndexesInRange:(NSRange)range
{
  unint64_t length;
  NSUInteger location;
  NSIndexSet *result;
  unint64_t v7;
  uint64_t v8;
  NSIndexSet *v9;
  NSString *v10;
  NSString *v11;
  NSRange v12;

  length = range.length;
  location = range.location;
  result = -[NSIndexSet _init](self, "_init");
  if (result)
  {
    v7 = location + length;
    if (length && (v7 & 0x8000000000000000) != 0)
    {
      v9 = result;
      v10 = _NSMethodExceptionProem((objc_class *)result, a2);
      v12.location = location;
      v12.length = length;
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range %@ exceeds maximum index value of NSNotFound - 1"), v10, NSStringFromRange(v12));

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v11, 0));
    }
    if (length && (location > 0x3F || v7 > 0x40 || v7 < location))
    {
      *(_DWORD *)&result->_indexSetFlags &= ~2u;
      result->_internal._singleRange._range.location = location;
      v8 = 24;
    }
    else
    {
      if (length)
        length = 0xFFFFFFFFFFFFFFFFLL >> -(char)length << location;
      else
        length = 0;
      v8 = 16;
    }
    *(Class *)((char *)&result->super.isa + v8) = (Class)length;
  }
  return result;
}

- (id)_init
{
  id result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSIndexSet;
  result = -[NSIndexSet init](&v3, sel_init);
  if (result)
    *((_DWORD *)result + 2) |= 3u;
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSIndexSet initWithIndexSet:](+[NSIndexSet allocWithZone:](NSMutableIndexSet, "allocWithZone:", a3), "initWithIndexSet:", self);
}

- (BOOL)getBitfield:(unint64_t *)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger location;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v3 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v3 = 0;
    v4 = v3 ^ (unint64_t)self;
    v5 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v4 & 7) == 0)
      v5 = 0xFFFFFFFFFFFFFLL;
    location = v5 & (v4 >> 3);
    if (!a3)
      return 1;
LABEL_7:
    *a3 = location;
    return 1;
  }
  if ((*(_BYTE *)&self->_indexSetFlags & 2) != 0)
  {
    location = self->_internal._singleRange._range.location;
    if (!a3)
      return 1;
    goto LABEL_7;
  }
  return 0;
}

void __45__NSIndexSet_indexesWithOptions_passingTest___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 56));
    if (a2 > 0x3F)
    {
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v4)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[NSIndexSet initWithBitfield:]([NSMutableIndexSet alloc], "initWithBitfield:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 24));
        v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v4, "addIndex:", a2);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1 << a2;
    }
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 56));
  }
}

- (unint64_t)hash
{
  unint64_t result;
  unint64_t v4;
  NSUInteger v5;

  result = -[NSIndexSet count](self, "count");
  if (result)
  {
    v4 = result;
    v5 = -[NSIndexSet firstIndex](self, "firstIndex");
    return v5 + v4 + -[NSIndexSet lastIndex](self, "lastIndex");
  }
  return result;
}

- (void)__forwardEnumerateRanges:(id)a3
{
  __objc2_class *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger location;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  unint64_t v12;
  unint64_t i;

  v5 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet != v5
    && _NSConstantIndexSet != v5
    && NSMutableIndexSet != v5)
  {
    -[NSIndexSet enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", a3);
    return;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v6 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v6 = 0;
    v7 = v6 ^ (unint64_t)self;
    v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0)
      v8 = 0xFFFFFFFFFFFFFLL;
    location = v8 & (v7 >> 3);
    goto LABEL_16;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    location = self->_internal._singleRange._range.location;
LABEL_16:
    __NSIndexSetEnumerateBitfield(location, 0x4000000000000000, 0, 64, (uint64_t)a3);
    return;
  }
  p_internal = &self->_internal;
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (!self->_internal._singleRange._range.length)
      return;
    v12 = 1;
  }
  else
  {
    v12 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
    if (!v12)
      return;
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                     + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                     + 64);
  }
  for (i = 0; i < v12; ++i)
  {
    while (p_internal[i]._singleRange._range.length)
    {
      __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)a3);
      if (++i >= v12)
        return;
    }
  }
}

+ (void)initialize
{
  if (NSIndexSet == a1)
  {
    _objc_registerTaggedPointerClass();
    _NSTaggedIndexSetAllowed = 1;
  }
}

- (NSIndexSet)indexesPassingTest:(void *)predicate
{
  return -[NSIndexSet indexesWithOptions:passingTest:](self, "indexesWithOptions:passingTest:", 0, predicate);
}

- (unint64_t)rangeCount
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSUInteger location;
  unint64_t result;
  unint64_t v7;
  unint64_t v8;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v2 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v2 = 0;
    v3 = v2 ^ (unint64_t)self;
    v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0)
      v4 = 0xFFFFFFFFFFFFFLL;
    location = v4 & (v3 >> 3);
    if (location)
      goto LABEL_7;
    return 0;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) == 0)
  {
    if ((*(_BYTE *)&indexSetFlags & 1) != 0)
      return self->_internal._singleRange._range.length != 0;
    else
      return *(_QWORD *)(self->_internal._singleRange._range.location + 8);
  }
  location = self->_internal._singleRange._range.location;
  if (!location)
    return 0;
LABEL_7:
  result = 1;
  v7 = location;
  while (1)
  {
    v8 = (-1 << __clz(__rbit64(v7))) & ~location;
    if (!v8)
      break;
    ++result;
    v7 = (-1 << __clz(__rbit64(v8))) & location;
    if (!v7)
      return --result;
  }
  return result;
}

- (BOOL)containsIndexes:(NSIndexSet *)indexSet
{
  _BOOL4 v3;
  __objc2_class *v6;
  NSUInteger v7;
  NSUInteger i;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger location;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  unint64_t v30;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  $228E88DFACDD67E146FBAE62E08A49BD *v33;
  $228E88DFACDD67E146FBAE62E08A49BD *v34;
  NSUInteger v35;
  unint64_t v36;
  $228E88DFACDD67E146FBAE62E08A49BD *v37;
  $228E88DFACDD67E146FBAE62E08A49BD *v38;
  NSUInteger length;
  NSUInteger v40;
  unint64_t v41;
  unint64_t v42;
  NSUInteger v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  $228E88DFACDD67E146FBAE62E08A49BD *v47;
  $228E88DFACDD67E146FBAE62E08A49BD *v48;
  $A8859644891BA8F5A580113D622AC538 v49;
  $228E88DFACDD67E146FBAE62E08A49BD *v50;
  NSUInteger v51;
  unint64_t v52;
  $228E88DFACDD67E146FBAE62E08A49BD *v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  $A8859644891BA8F5A580113D622AC538 v59;
  $228E88DFACDD67E146FBAE62E08A49BD *v60;
  $228E88DFACDD67E146FBAE62E08A49BD *v61;
  $228E88DFACDD67E146FBAE62E08A49BD *v62;
  NSUInteger v63;
  unint64_t v64;
  $228E88DFACDD67E146FBAE62E08A49BD *v65;
  $228E88DFACDD67E146FBAE62E08A49BD *v66;
  NSUInteger v67;
  NSUInteger v68;
  unint64_t v69;
  unint64_t v70;

  LOBYTE(v3) = 1;
  if (!indexSet || indexSet == self)
    return v3;
  v6 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet != v6
    && _NSConstantIndexSet != v6
    && NSMutableIndexSet != v6)
  {
    v7 = -[NSIndexSet firstIndex](indexSet, "firstIndex");
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v7;
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = -[NSIndexSet indexGreaterThanIndex:](indexSet, "indexGreaterThanIndex:", i))
      {
        v3 = -[NSIndexSet containsIndex:](self, "containsIndex:", i);
        if (!v3)
          break;
      }
    }
    return v3;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v9 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v9 = 0;
    v10 = v9 ^ (unint64_t)self;
    v11 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v10 & 7) == 0)
      v11 = 0xFFFFFFFFFFFFFLL;
    location = v11 & (v10 >> 3);
    if (((unint64_t)indexSet & 0x8000000000000000) != 0)
      goto LABEL_17;
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_indexSetFlags & 2) != 0)
  {
    location = self->_internal._singleRange._range.location;
    if (((unint64_t)indexSet & 0x8000000000000000) != 0)
    {
LABEL_17:
      v13 = *MEMORY[0x1E0DE7C58];
      if ((~(unint64_t)indexSet & 0xC000000000000007) == 0)
        v13 = 0;
      v14 = v13 ^ (unint64_t)indexSet;
      v15 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v14 & 7) == 0)
        v15 = 0xFFFFFFFFFFFFFLL;
      v16 = v15 & (v14 >> 3);
      goto LABEL_35;
    }
LABEL_30:
    if ((*(_BYTE *)&indexSet->_indexSetFlags & 2) != 0)
    {
      v16 = indexSet->_internal._singleRange._range.location;
    }
    else
    {
      v21 = -[NSIndexSet lastIndex](indexSet, "lastIndex");
      if (v21 != 0x7FFFFFFFFFFFFFFFLL && v21 > 0x3F)
      {
        v16 = 0;
        v22 = 0;
        goto LABEL_36;
      }
      v29 = 0;
      v30 = 0;
      v16 = 0;
      indexSetFlags = indexSet->_indexSetFlags;
      p_internal = &indexSet->_internal;
      v33 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&indexSet->_internal._singleBitfield + 1);
      if ((*(_BYTE *)&indexSetFlags & 2) != 0)
        v33 = &indexSet->_internal;
      while (1)
      {
        v34 = v33;
        if ((*(_BYTE *)&indexSetFlags & 3) == 0)
          v34 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location + 8);
        v35 = v34->_singleRange._range.location;
        v36 = v34->_singleRange._range.location != 0;
        if ((*(_BYTE *)&indexSetFlags & 1) == 0 && v35)
          v36 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
        if (v30 >= v36)
          break;
        v37 = &indexSet->_internal;
        if ((*(_BYTE *)&indexSetFlags & 1) == 0)
          v37 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                    + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                    + 64);
        v38 = &v37[v29];
        v40 = v38->_singleRange._range.location;
        length = v38->_singleRange._range.length;
        v41 = 0xFFFFFFFFFFFFFFFFLL >> -(char)length << v40;
        if (length)
          v42 = v41;
        else
          v42 = 0;
        v16 |= v42;
        ++v30;
        ++v29;
      }
    }
LABEL_35:
    v22 = 1;
LABEL_36:
    if ((v16 & ~location) != 0)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = v22;
    return v3;
  }
  if (((unint64_t)indexSet & 0x8000000000000000) != 0)
  {
    v17 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)indexSet & 0xC000000000000007) == 0)
      v17 = 0;
    v18 = v17 ^ (unint64_t)indexSet;
    v19 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v18 & 7) == 0)
      v19 = 0xFFFFFFFFFFFFFLL;
    v20 = v19 & (v18 >> 3);
    goto LABEL_61;
  }
  if ((*(_BYTE *)&indexSet->_indexSetFlags & 2) != 0)
  {
    v20 = indexSet->_internal._singleRange._range.location;
LABEL_61:
    v43 = -[NSIndexSet lastIndex](self, "lastIndex");
    if (v43 == 0x7FFFFFFFFFFFFFFFLL || v43 <= 0x3F)
    {
      v57 = 0;
      v58 = 0;
      v45 = 0;
      v59 = self->_indexSetFlags;
      v60 = &self->_internal;
      v61 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&self->_internal._singleBitfield + 1);
      if ((*(_BYTE *)&v59 & 2) != 0)
        v61 = &self->_internal;
      while (1)
      {
        v62 = v61;
        if ((*(_BYTE *)&v59 & 3) == 0)
          v62 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v60->_singleRange._range.location + 8);
        v63 = v62->_singleRange._range.location;
        v64 = v62->_singleRange._range.location != 0;
        if ((*(_BYTE *)&v59 & 1) == 0 && v63)
          v64 = *(_QWORD *)(v60->_singleRange._range.location + 8);
        if (v58 >= v64)
          break;
        v65 = &self->_internal;
        if ((*(_BYTE *)&v59 & 1) == 0)
          v65 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v60->_singleRange._range.location
                                                    + 16 * *(_QWORD *)(v60->_singleRange._range.location + 24)
                                                    + 64);
        v66 = &v65[v57];
        v68 = v66->_singleRange._range.location;
        v67 = v66->_singleRange._range.length;
        v69 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v67 << v68;
        if (v67)
          v70 = v69;
        else
          v70 = 0;
        v45 |= v70;
        ++v58;
        ++v57;
      }
    }
    else
    {
      v44 = 0;
      v45 = 0;
      v46 = 0;
      v47 = &self->_internal;
      v48 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&self->_internal._singleBitfield + 1);
      v49 = self->_indexSetFlags;
      if ((*(_BYTE *)&v49 & 2) != 0)
        v48 = &self->_internal;
      while (1)
      {
        v50 = v48;
        if ((*(_BYTE *)&v49 & 3) == 0)
          v50 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v47->_singleRange._range.location + 8);
        v51 = v50->_singleRange._range.location;
        v52 = v50->_singleRange._range.location != 0;
        if ((*(_BYTE *)&v49 & 1) == 0 && v51)
          v52 = *(_QWORD *)(v47->_singleRange._range.location + 8);
        if (v46 >= v52)
          break;
        v53 = &self->_internal;
        if ((*(_BYTE *)&v49 & 1) == 0)
          v53 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v47->_singleRange._range.location
                                                    + 16 * *(_QWORD *)(v47->_singleRange._range.location + 24)
                                                    + 64);
        v54 = v53[v44]._singleRange._range.location;
        if (v54 > 0x3F)
        {
          LOBYTE(v54) = 0;
          v56 = 0;
        }
        else
        {
          v55 = v53[v44]._singleRange._range.length + v54;
          if (v55 >= 0x40)
            v55 = 64;
          v56 = v55 - v54;
        }
        if (!v56)
          break;
        v45 |= 0xFFFFFFFFFFFFFFFFLL >> -(char)v56 << v54;
        ++v46;
        ++v44;
      }
    }
    LOBYTE(v3) = (v20 & ~v45) == 0;
    return v3;
  }
  v23 = -[NSIndexSet rangeCount](indexSet, "rangeCount");
  if (v23)
  {
    v24 = 0;
    v25 = v23 - 1;
    do
    {
      v26 = -[NSIndexSet rangeAtIndex:](indexSet, "rangeAtIndex:", v24);
      v3 = -[NSIndexSet containsIndexesInRange:](self, "containsIndexesInRange:", v26, v27);
      if (!v3)
        break;
    }
    while (v25 != v24++);
  }
  return v3;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t location;
  unint64_t v13;
  NSString *v14;
  NSUInteger length;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  $228E88DFACDD67E146FBAE62E08A49BD *v17;
  NSUInteger v18;
  _NSRange result;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v3 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v3 = 0;
    v4 = v3 ^ (unint64_t)self;
    v5 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v4 & 7) == 0)
      v5 = 0xFFFFFFFFFFFFFLL;
    v6 = v5 & (v4 >> 3);
    goto LABEL_13;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) == 0)
  {
    if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      v9 = self->_internal._singleRange._range.length != 0;
      if (v9 >= a3)
      {
        p_internal = &self->_internal;
LABEL_25:
        v17 = &p_internal[a3];
        location = v17->_singleRange._range.location;
        length = v17->_singleRange._range.length;
        goto LABEL_26;
      }
    }
    else
    {
      v8 = self->_internal._singleRange._range.location;
      v9 = *(_QWORD *)(v8 + 8);
      if (v9)
      {
        if (v9 < a3)
          goto LABEL_28;
        goto LABEL_24;
      }
      if (!a3)
      {
LABEL_24:
        p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(v8 + 16 * *(_QWORD *)(v8 + 24) + 64);
        goto LABEL_25;
      }
      v9 = 0;
    }
LABEL_28:
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Index %ld out of bounds [0...%ld]"), a3, v9);
LABEL_19:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
  }
  v6 = self->_internal._singleRange._range.location;
LABEL_13:
  LOBYTE(v10) = 0;
  v11 = -1;
  while (1)
  {
    if (((-1 << v10) & v6) == 0)
    {
LABEL_18:
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Index %ld out of bounds [0...%ld]"), a3, _bitfieldSetRangesCount(v6));
      goto LABEL_19;
    }
    location = __clz(__rbit64((-1 << v10) & v6));
    v13 = (-1 << location) & ~v6;
    v10 = __clz(__rbit64(v13));
    if (a3 == ++v11)
      break;
    if (!v13 || v10 >= 0x40)
      goto LABEL_18;
  }
  length = v10 - location;
LABEL_26:
  v18 = location;
  result.length = length;
  result.location = v18;
  return result;
}

- (BOOL)containsIndexesInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  BOOL result;
  unint64_t v11;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  BOOL v13;

  if (!range.length)
    return 0;
  length = range.length;
  location = range.location;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v6 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v6 = 0;
    v7 = v6 ^ (unint64_t)self;
    v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0)
      v8 = 0xFFFFFFFFFFFFFLL;
    v9 = v8 & (v7 >> 3);
LABEL_15:
    if (range.location <= 0x3F)
    {
      result = 0;
      v13 = __CFADD__(range.location, range.length);
      if (range.location + range.length <= 0x40 && !v13)
        return ((0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location)) & ~v9) == 0;
      return result;
    }
    return 0;
  }
  if ((*(_BYTE *)&self->_indexSetFlags & 2) != 0)
  {
    v9 = self->_internal._singleRange._range.location;
    goto LABEL_15;
  }
  v11 = -[NSIndexSet _indexOfRangeContainingIndex:](self, "_indexOfRangeContainingIndex:", range.location);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  p_internal = &self->_internal;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0)
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                     + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                     + 64);
  return p_internal[v11]._singleRange._range.length + p_internal[v11]._singleRange._range.location >= location + length;
}

- (void)enumerateRangesUsingBlock:(void *)block
{
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, 0x4000000000000000, 0, 0x7FFFFFFFFFFFFFFFLL);
  __NSIndexSetEnumerate((uint64_t)self, 0x4000000000000000, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

+ (NSIndexSet)indexSetWithIndexesInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v5;
  NSIndexSet *result;
  unint64_t v7;
  NSString *v8;
  void *v9;
  NSRange v10;

  length = range.length;
  location = range.location;
  if (NSIndexSet != a1)
    return (NSIndexSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIndexesInRange:", range.location, range.length);
  v5 = range.location + range.length;
  if (range.length && (v5 & 0x8000000000000000) != 0)
  {
    v8 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v10.location = location;
    v10.length = length;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range %@ exceeds maximum index value of NSNotFound - 1"), v8, NSStringFromRange(v10)), 0);
    objc_exception_throw(v9);
  }
  if (_NSTaggedIndexSetAllowed != 1 || range.length && (range.location > 0x33 || v5 > 0x34 || v5 < range.location))
    return (NSIndexSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIndexesInRange:", range.location, range.length);
  if (range.length)
    result = (NSIndexSet *)((8
                           * ((0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location)) & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007);
  else
    result = (NSIndexSet *)0x8580000000000007;
  v7 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v7 & 0xC000000000000007) != 0)
    return (NSIndexSet *)(v7 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v7 & 7)));
  return result;
}

- (NSIndexSet)initWithIndexSet:(NSIndexSet *)indexSet
{
  NSIndexSet *v4;
  NSIndexSet *v5;

  v4 = -[NSIndexSet _init](self, "_init");
  v5 = v4;
  if (v4)
    -[NSIndexSet _setContentToContentFromIndexSet:](v4, "_setContentToContentFromIndexSet:", indexSet);
  return v5;
}

- (void)_setContentToContentFromIndexSet:(id)a3
{
  __objc2_class *v5;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  int v12;
  $A8859644891BA8F5A580113D622AC538 v13;
  int v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  $228E88DFACDD67E146FBAE62E08A49BD *v29;
  uint64_t v30;
  unint64_t *v31;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  $228E88DFACDD67E146FBAE62E08A49BD *v33;
  char *v34;
  NSUInteger *p_length;
  NSUInteger v36;
  NSIndexSet *v37;

  if (a3)
  {
    v5 = (__objc2_class *)objc_opt_class();
    if (NSIndexSet != v5
      && _NSConstantIndexSet != v5
      && NSMutableIndexSet != v5)
    {
      v37 = -[NSIndexSet initWithIndexSet:]([NSIndexSet alloc], "initWithIndexSet:", a3);
      -[NSIndexSet _setContentToContentFromIndexSet:](self, "_setContentToContentFromIndexSet:", v37);

      return;
    }
    indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->_indexSetFlags | 1);
    self->_indexSetFlags = indexSetFlags;
    if (((unint64_t)a3 & 0x8000000000000000) != 0)
    {
      v7 = *MEMORY[0x1E0DE7C58];
      if ((~(unint64_t)a3 & 0xC000000000000007) == 0)
        v7 = 0;
      v8 = v7 ^ (unint64_t)a3;
      v9 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v8 & 7) == 0)
        v9 = 0xFFFFFFFFFFFFFLL;
      v10 = v9 & (v8 >> 3);
      goto LABEL_35;
    }
    if ((*((_BYTE *)a3 + 8) & 2) != 0)
    {
      v10 = *((_QWORD *)a3 + 2);
LABEL_35:
      self->_indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags | 2);
      self->_internal._singleRange._range.location = v10;
      return;
    }
    v11 = objc_msgSend(a3, "lastIndex");
    v12 = *((_DWORD *)a3 + 2);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v11 <= 0x3F)
    {
      v16 = 0;
      v17 = 0;
      v10 = 0;
      v18 = (char *)a3 + 16;
      v19 = (char *)a3 + 24;
      if ((v12 & 2) != 0)
        v19 = (char *)a3 + 16;
      while (1)
      {
        v20 = (uint64_t *)v19;
        if ((v12 & 3) == 0)
          v20 = (uint64_t *)(*(_QWORD *)v18 + 8);
        v21 = *v20;
        v22 = *v20 != 0;
        if ((v12 & 1) == 0 && v21)
          v22 = *(_QWORD *)(*(_QWORD *)v18 + 8);
        if (v17 >= v22)
          break;
        v23 = (char *)a3 + 16;
        if ((v12 & 1) == 0)
          v23 = (char *)(*(_QWORD *)v18 + 16 * *(_QWORD *)(*(_QWORD *)v18 + 24) + 64);
        v24 = &v23[v16];
        v26 = *(_QWORD *)v24;
        v25 = *((_QWORD *)v24 + 1);
        v27 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v25 << v26;
        if (v25)
          v28 = v27;
        else
          v28 = 0;
        v10 |= v28;
        ++v17;
        v16 += 16;
      }
      indexSetFlags = self->_indexSetFlags;
      goto LABEL_35;
    }
    v13 = self->_indexSetFlags;
    if ((v12 & 1) != 0)
    {
      self->_indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&v13 & 0xFFFFFFFD);
      v29 = ($228E88DFACDD67E146FBAE62E08A49BD *)((char *)a3 + 16);
      if ((*((_BYTE *)a3 + 8) & 1) == 0)
        v29 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v29->_singleRange._range.location
                                                  + 16 * *(_QWORD *)(v29->_singleRange._range.location + 24)
                                                  + 64);
      self->_internal = *v29;
    }
    else
    {
      self->_indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&v13 & 0xFFFFFFFC);
      v14 = *((_DWORD *)a3 + 2);
      if ((v14 & 2) != 0)
      {
        v15 = (char *)a3 + 16;
      }
      else if ((v14 & 1) != 0)
      {
        v15 = (char *)a3 + 24;
      }
      else
      {
        v15 = (char *)(*((_QWORD *)a3 + 2) + 8);
      }
      if (*(_QWORD *)v15)
      {
        if ((v14 & 1) != 0)
          v30 = 1;
        else
          v30 = *(_QWORD *)(*((_QWORD *)a3 + 2) + 8);
      }
      else
      {
        v30 = 0;
      }
      v31 = (unint64_t *)malloc_type_malloc(16 * v30 + 64, 0xF8ABEA1BuLL);
      self->_internal._singleRange._range.location = (NSUInteger)v31;
      p_internal = &self->_internal;
      atomic_store(0, v31 + 7);
      *(_QWORD *)p_internal->_singleRange._range.location = v30;
      *(_QWORD *)(p_internal->_singleRange._range.location + 8) = v30;
      *(_QWORD *)(p_internal->_singleRange._range.location + 16) = 0;
      *(_QWORD *)(p_internal->_singleRange._range.location + 24) = 0;
      v33 = p_internal;
      if ((*(_BYTE *)(&p_internal[-1]._singleBitfield + 1) & 1) == 0)
        v33 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                  + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                  + 64);
      v34 = (char *)a3 + 16;
      if ((*((_BYTE *)a3 + 8) & 1) == 0)
        v34 = (char *)(*(_QWORD *)v34 + 16 * *(_QWORD *)(*(_QWORD *)v34 + 24) + 64);
      memcpy(v33, v34, 16 * v30);
      if (v30)
      {
        p_length = &v33->_singleRange._range.length;
        do
        {
          v36 = *p_length;
          p_length += 2;
          *(_QWORD *)(p_internal->_singleRange._range.location + 16) += v36;
          --v30;
        }
        while (v30);
      }
    }
  }
}

- (NSIndexSet)indexesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSEnumerationOptions v6;
  void *v7;
  void *v8;
  NSIndexSet *v9;
  NSIndexSet *v10;
  _QWORD v12[8];
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((opts & 2) != 0)
    v6 = opts & 0xFFFFFFFFFFFFFFFELL;
  else
    v6 = opts;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v6, 0, 0x7FFFFFFFFFFFFFFFLL);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__NSIndexSet_indexesWithOptions_passingTest___block_invoke;
  v12[3] = &unk_1E0F4E780;
  v12[4] = predicate;
  v12[5] = &v14;
  v12[6] = &v18;
  v12[7] = &v13;
  __NSIndexSetEnumerate((uint64_t)self, v6, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)v12);
  v7 = (void *)v19[5];
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = v8;
  }
  else
  {
    v9 = +[NSIndexSet indexSetWithBitfield:](NSIndexSet, "indexSetWithBitfield:", v15[3]);
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

+ (NSIndexSet)indexSetWithIndex:(NSUInteger)value
{
  NSIndexSet *result;
  unint64_t v4;

  if (_NSTaggedIndexSetAllowed != 1 || value > 0x33 || NSIndexSet != a1)
    return (NSIndexSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIndex:", value);
  result = (NSIndexSet *)((8 << value) & 0x7FFFFFFFFFFFF8 | 0x8580000000000007);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSIndexSet *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (id)_alloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___NSIndexSet;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

- (NSIndexSet)initWithBitfield:(unint64_t)a3
{
  NSIndexSet *result;
  unint64_t v6;

  if (_NSTaggedIndexSetAllowed == 1
    && (__objc2_class *)objc_opt_class() == NSIndexSet
    && (!a3 || (__clz(a3) ^ 0x3C) <= 0x33))
  {

    result = (NSIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007);
    v6 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
    if ((~v6 & 0xC000000000000007) != 0)
      return (NSIndexSet *)(v6 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v6 & 7)));
  }
  else
  {
    result = -[NSIndexSet _init](self, "_init");
    if (result)
      result->_internal._singleRange._range.location = a3;
  }
  return result;
}

- (NSIndexSet)initWithIndex:(NSUInteger)value
{
  char v3;
  NSIndexSet *result;

  v3 = value;
  if (value > 0x3F)
    return -[NSIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:", value, 1);
  result = -[NSIndexSet _init](self, "_init");
  if (result)
    result->_internal._singleRange._range.location = 1 << v3;
  return result;
}

+ (NSIndexSet)indexSetWithBitfield:(unint64_t)a3
{
  NSIndexSet *result;
  unint64_t v4;

  if (_NSTaggedIndexSetAllowed != 1 || NSIndexSet != a1 || a3 && (__clz(a3) ^ 0x3C) > 0x33)
    return (NSIndexSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithBitfield:", a3);
  result = (NSIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSIndexSet *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

- (NSUInteger)indexLessThanIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 0, 0);
}

- (uint64_t)_indexClosestToIndex:(int)a3 equalAllowed:(int)a4 following:
{
  char v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  pthread_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  pthread_t v33;
  unint64_t v34;
  unint64_t *v35;
  uint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  pthread_t v41;
  unint64_t v42;
  unint64_t *v43;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  if (!a1)
    return 0;
  v5 = a3;
  v6 = a2;
  if (a1 < 0)
  {
    v8 = *MEMORY[0x1E0DE7C58];
    if ((~a1 & 0xC000000000000007) == 0)
      v8 = 0;
    v9 = v8 ^ a1;
    v10 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v9 & 7) == 0)
      v10 = 0xFFFFFFFFFFFFFLL;
    v11 = v10 & (v9 >> 3);
    if (!v11)
      return 0x7FFFFFFFFFFFFFFFLL;
LABEL_17:
    v18 = 1;
    if (!a4)
      v18 = -1;
    if (a3)
      v18 = 0;
    v19 = v18 + a2;
    if (a4)
    {
      v20 = v19 & ~(v19 >> 63);
      if (v20 > 0x3F)
        return 0x7FFFFFFFFFFFFFFFLL;
      v22 = v11 & (-1 << v20);
      v21 = v22 == 0;
      v23 = __clz(__rbit64(v22));
    }
    else
    {
      if (v19 < 0)
        return 0x7FFFFFFFFFFFFFFFLL;
      if (v19 >= 63)
        LOBYTE(v19) = 63;
      v24 = v11 & (0xFFFFFFFFFFFFFFFFLL >> ~(_BYTE)v19);
      v21 = v24 == 0;
      v23 = __clz(v24) ^ 0x3F;
    }
    if (v21)
      v17 = -1;
    else
      v17 = v23;
    if (v17 < 0x40)
      return v17;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v12 = *(_DWORD *)(a1 + 8);
  if ((v12 & 2) != 0)
  {
    v11 = *(_QWORD *)(a1 + 16);
    if (!v11)
      return 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_17;
  }
  if ((v12 & 1) != 0)
  {
    v25 = *(_QWORD *)(a1 + 24);
    if (!v25)
      return 0x7FFFFFFFFFFFFFFFLL;
    v26 = *(_QWORD *)(a1 + 16);
    v27 = v26 + v25 - 1;
    if (a4)
    {
      v17 = *(_QWORD *)(a1 + 16);
      if (a3)
      {
        if (v26 >= a2)
          return v17;
        v17 = a2;
        if (v27 >= a2)
          return v17;
        goto LABEL_53;
      }
      if (v26 > a2)
        return v17;
      if (v27 > a2)
        return a2 + 1;
LABEL_51:
      if (v6 > 0x7FFFFFFFFFFFFFFELL)
        return 0x7FFFFFFFFFFFFFFFLL;
      ++v6;
LABEL_53:
      v28 = a1 + 16;
      v29 = a1 + 16;
      if ((*(_BYTE *)(a1 + 8) & 1) == 0)
        v29 = *(_QWORD *)v28 + 16 * *(_QWORD *)(*(_QWORD *)v28 + 24) + 64;
      v30 = objc_msgSend((id)a1, "_indexOfRangeAfterOrContainingIndex:", v6);
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v31 = v30;
        v32 = *(_QWORD *)(v29 + 16 * v30);
        if (v6 <= v32)
          v17 = v32;
        else
          v17 = v6;
        v33 = pthread_self();
        v34 = atomic_load((unint64_t *)(*(_QWORD *)v28 + 56));
        if (v33 != (pthread_t)v34)
        {
          v35 = (unint64_t *)(*(_QWORD *)v28 + 56);
          while (!__ldaxr(v35))
          {
            if (!__stlxr((unint64_t)v33, v35))
              goto LABEL_79;
          }
LABEL_80:
          __clrex();
          return v17;
        }
        goto LABEL_79;
      }
      return v17;
    }
    v17 = v27;
    if (a3)
    {
      if (v27 <= a2)
        return v17;
      v17 = a2;
      if (v26 <= a2)
        return v17;
      goto LABEL_69;
    }
    if (v27 < a2)
      return v17;
    if (v26 < a2)
      return a2 - 1;
    goto LABEL_67;
  }
  v13 = a1 + 16;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8))
    return 0x7FFFFFFFFFFFFFFFLL;
  v14 = pthread_self();
  v15 = atomic_load((unint64_t *)(*(_QWORD *)v13 + 56));
  if (v14 == (pthread_t)v15)
  {
    v16 = *(_QWORD **)v13;
    if (*(_QWORD *)(*(_QWORD *)v13 + 32) == v6)
    {
      if ((v5 & 1) != 0)
        return v6;
      v45 = *(_DWORD *)(a1 + 8);
      v46 = a1 + 16;
      if ((v45 & 1) == 0)
        v46 = (uint64_t)&v16[2 * v16[3] + 8];
      if (a4)
      {
        v47 = v16[5];
        if ((unint64_t)(*(_QWORD *)(v46 + 16 * v47 + 8) - 1) > v16[6])
        {
          v16[4] = v6 + 1;
          v48 = *(_QWORD *)v13;
          v49 = *(_QWORD *)(*(_QWORD *)v13 + 48) + 1;
LABEL_88:
          *(_QWORD *)(v48 + 48) = v49;
          return *(_QWORD *)(*(_QWORD *)v13 + 32);
        }
        if (!_isEmpty(a1))
        {
          v50 = (v45 & 1) != 0 ? 1 : v16[1];
          if (v47 + 1 < v50)
          {
            v16[5] = v47 + 1;
            v55 = *(_QWORD *)(v46 + 16 * *(_QWORD *)(*(_QWORD *)v13 + 40));
            *(_QWORD *)(*(_QWORD *)v13 + 48) = 0;
            v54 = *(_QWORD *)v13;
            goto LABEL_97;
          }
        }
      }
      else
      {
        if (v16[6])
        {
          v16[4] = v6 - 1;
          v48 = *(_QWORD *)v13;
          v49 = *(_QWORD *)(*(_QWORD *)v13 + 48) - 1;
          goto LABEL_88;
        }
        v51 = v16[5];
        if (v51)
        {
          v16[5] = v51 - 1;
          v52 = (uint64_t *)(v46 + 16 * *(_QWORD *)(*(_QWORD *)v13 + 40));
          v53 = *v52;
          *(_QWORD *)(*(_QWORD *)v13 + 48) = v52[1] - 1;
          v54 = *(_QWORD *)v13;
          v55 = *(_QWORD *)(*(_QWORD *)v13 + 48) + v53;
LABEL_97:
          *(_QWORD *)(v54 + 32) = v55;
          return *(_QWORD *)(*(_QWORD *)v13 + 32);
        }
      }
      atomic_store(0, v16 + 7);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (a4)
  {
    if ((v5 & 1) != 0)
      goto LABEL_53;
    goto LABEL_51;
  }
  if ((v5 & 1) == 0)
  {
LABEL_67:
    if (!v6)
      return 0x7FFFFFFFFFFFFFFFLL;
    --v6;
  }
LABEL_69:
  v28 = a1 + 16;
  v37 = a1 + 16;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
    v37 = *(_QWORD *)v28 + 16 * *(_QWORD *)(*(_QWORD *)v28 + 24) + 64;
  v38 = objc_msgSend((id)a1, "_indexOfRangeBeforeOrContainingIndex:", v6);
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (v38 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = v38;
    v39 = (unint64_t *)(v37 + 16 * v38);
    v32 = *v39;
    v40 = *v39 + v39[1] - 1;
    if (v6 >= v40)
      v17 = v40;
    else
      v17 = v6;
    v41 = pthread_self();
    v42 = atomic_load((unint64_t *)(*(_QWORD *)v28 + 56));
    if (v41 != (pthread_t)v42)
    {
      v43 = (unint64_t *)(*(_QWORD *)v28 + 56);
      while (!__ldaxr(v43))
      {
        if (!__stlxr((unint64_t)v41, v43))
          goto LABEL_79;
      }
      goto LABEL_80;
    }
LABEL_79:
    *(_QWORD *)(*(_QWORD *)v28 + 40) = v31;
    *(_QWORD *)(*(_QWORD *)v28 + 48) = v17 - v32;
    *(_QWORD *)(*(_QWORD *)v28 + 32) = v17;
  }
  return v17;
}

- (NSUInteger)indexGreaterThanIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 0, 1);
}

- (void)enumerateRangesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSEnumerationOptions v6;
  uint64_t v7;

  v6 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v6 = opts;
  v7 = v6 | 0x4000000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v6 | 0x4000000000000000, 0, 0x7FFFFFFFFFFFFFFFLL);
  __NSIndexSetEnumerate((uint64_t)self, v7, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
    return -[NSIndexSet isEqualToIndexSet:](self, "isEqualToIndexSet:", a3);
  return 0;
}

- (BOOL)isEqualToIndexSet:(NSIndexSet *)indexSet
{
  __objc2_class *v5;
  __objc2_class *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSUInteger location;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  char v25;
  $A8859644891BA8F5A580113D622AC538 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  $A8859644891BA8F5A580113D622AC538 v30;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  $228E88DFACDD67E146FBAE62E08A49BD *v32;
  $228E88DFACDD67E146FBAE62E08A49BD *v33;
  NSUInteger v34;
  unint64_t v35;
  $228E88DFACDD67E146FBAE62E08A49BD *v36;
  $228E88DFACDD67E146FBAE62E08A49BD *v37;
  NSUInteger length;
  NSUInteger v39;
  unint64_t v40;
  unint64_t v41;
  NSUInteger v42;
  BOOL v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  $A8859644891BA8F5A580113D622AC538 v48;
  $228E88DFACDD67E146FBAE62E08A49BD *v49;
  $228E88DFACDD67E146FBAE62E08A49BD *v50;
  $228E88DFACDD67E146FBAE62E08A49BD *v51;
  NSUInteger v52;
  unint64_t v53;
  $228E88DFACDD67E146FBAE62E08A49BD *v54;
  $228E88DFACDD67E146FBAE62E08A49BD *v55;
  NSUInteger v56;
  NSUInteger v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t bitfield;
  $246AE1437D6384FE1219915B69C5C0EF *v62;
  unint64_t v63;
  $246AE1437D6384FE1219915B69C5C0EF *v64;
  $228E88DFACDD67E146FBAE62E08A49BD *v65;
  $228E88DFACDD67E146FBAE62E08A49BD *v66;
  uint64_t v67;
  int64x2_t v68;
  int64x2_t v69;
  int64x2_t v70;
  int32x2_t v71;
  char v72;

  if (indexSet == self)
    goto LABEL_116;
  if (!indexSet)
  {
LABEL_117:
    v10 = 0;
    return v10 & 1;
  }
  v5 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet != v5
    && _NSConstantIndexSet != v5
    && NSMutableIndexSet != v5
    || (v6 = (__objc2_class *)objc_opt_class(), NSIndexSet != v6)
    && _NSConstantIndexSet != v6
    && NSMutableIndexSet != v6)
  {
    v7 = -[NSIndexSet count](self, "count");
    if (v7 == -[NSIndexSet count](indexSet, "count"))
    {
      if (v7)
      {
        v8 = -[NSIndexSet firstIndex](self, "firstIndex");
        v9 = -[NSIndexSet firstIndex](indexSet, "firstIndex");
        do
        {
          v10 = v8 == v9;
          if (v8 != v9)
            break;
          v8 = -[NSIndexSet indexGreaterThanIndex:](self, "indexGreaterThanIndex:", v9);
          v9 = -[NSIndexSet indexGreaterThanIndex:](indexSet, "indexGreaterThanIndex:", v9);
          --v7;
        }
        while (v7);
        return v10 & 1;
      }
LABEL_116:
      v10 = 1;
      return v10 & 1;
    }
    goto LABEL_117;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v11 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v11 = 0;
    v12 = v11 ^ (unint64_t)self;
    v13 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v12 & 7) == 0)
      v13 = 0xFFFFFFFFFFFFFLL;
    location = v13 & (v12 >> 3);
    if (((unint64_t)indexSet & 0x8000000000000000) != 0)
      goto LABEL_21;
    goto LABEL_34;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    location = self->_internal._singleRange._range.location;
    if (((unint64_t)indexSet & 0x8000000000000000) != 0)
    {
LABEL_21:
      v15 = *MEMORY[0x1E0DE7C58];
      if ((~(unint64_t)indexSet & 0xC000000000000007) == 0)
        v15 = 0;
      v16 = v15 ^ (unint64_t)indexSet;
      v17 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v16 & 7) == 0)
        v17 = 0xFFFFFFFFFFFFFLL;
      v18 = v17 & (v16 >> 3);
      goto LABEL_39;
    }
LABEL_34:
    if ((*(_BYTE *)&indexSet->_indexSetFlags & 2) != 0)
    {
      v18 = indexSet->_internal._singleRange._range.location;
    }
    else
    {
      v24 = -[NSIndexSet lastIndex](indexSet, "lastIndex");
      if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 > 0x3F)
      {
        v18 = 0;
        v25 = 0;
        goto LABEL_40;
      }
      v28 = 0;
      v29 = 0;
      v18 = 0;
      v30 = indexSet->_indexSetFlags;
      p_internal = &indexSet->_internal;
      v32 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&indexSet->_internal._singleBitfield + 1);
      if ((*(_BYTE *)&v30 & 2) != 0)
        v32 = &indexSet->_internal;
      while (1)
      {
        v33 = v32;
        if ((*(_BYTE *)&v30 & 3) == 0)
          v33 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location + 8);
        v34 = v33->_singleRange._range.location;
        v35 = v33->_singleRange._range.location != 0;
        if ((*(_BYTE *)&v30 & 1) == 0 && v34)
          v35 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
        if (v29 >= v35)
          break;
        v36 = &indexSet->_internal;
        if ((*(_BYTE *)&v30 & 1) == 0)
          v36 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                    + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                    + 64);
        v37 = &v36[v28];
        v39 = v37->_singleRange._range.location;
        length = v37->_singleRange._range.length;
        v40 = 0xFFFFFFFFFFFFFFFFLL >> -(char)length << v39;
        if (length)
          v41 = v40;
        else
          v41 = 0;
        v18 |= v41;
        ++v29;
        ++v28;
      }
    }
LABEL_39:
    v25 = 1;
LABEL_40:
    if (location == v18)
      v10 = v25;
    else
      v10 = 0;
    return v10 & 1;
  }
  if (((unint64_t)indexSet & 0x8000000000000000) != 0)
  {
    v20 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)indexSet & 0xC000000000000007) == 0)
      v20 = 0;
    v21 = v20 ^ (unint64_t)indexSet;
    v22 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v21 & 7) == 0)
      v22 = 0xFFFFFFFFFFFFFLL;
    v23 = v22 & (v21 >> 3);
    goto LABEL_61;
  }
  v26 = indexSet->_indexSetFlags;
  if ((*(_BYTE *)&v26 & 2) != 0)
  {
    v23 = indexSet->_internal._singleRange._range.location;
LABEL_61:
    v42 = -[NSIndexSet lastIndex](self, "lastIndex");
    v43 = v42 != 0x7FFFFFFFFFFFFFFFLL && v42 >= 0x40;
    v44 = !v43;
    if (v44 == 1)
    {
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = self->_indexSetFlags;
      v49 = &self->_internal;
      v50 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&self->_internal._singleBitfield + 1);
      if ((*(_BYTE *)&v48 & 2) != 0)
        v50 = &self->_internal;
      while (1)
      {
        v51 = v50;
        if ((*(_BYTE *)&v48 & 3) == 0)
          v51 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v49->_singleRange._range.location + 8);
        v52 = v51->_singleRange._range.location;
        v53 = v51->_singleRange._range.location != 0;
        if ((*(_BYTE *)&v48 & 1) == 0 && v52)
          v53 = *(_QWORD *)(v49->_singleRange._range.location + 8);
        if (v46 >= v53)
          break;
        v54 = &self->_internal;
        if ((*(_BYTE *)&v48 & 1) == 0)
          v54 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v49->_singleRange._range.location
                                                    + 16 * *(_QWORD *)(v49->_singleRange._range.location + 24)
                                                    + 64);
        v55 = &v54[v45];
        v56 = v55->_singleRange._range.location;
        v57 = v55->_singleRange._range.length;
        v58 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v57 << v56;
        if (v57)
          v59 = v58;
        else
          v59 = 0;
        v47 |= v59;
        ++v46;
        ++v45;
      }
    }
    else
    {
      v47 = 0;
    }
    if (v47 == v23)
      v10 = v44;
    else
      v10 = 0;
    return v10 & 1;
  }
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    v27 = self->_internal._singleRange._range.length != 0;
  else
    v27 = *(_QWORD *)(self->_internal._singleRange._range.location + 8);
  if ((*(_BYTE *)&v26 & 1) != 0)
    v60 = indexSet->_internal._singleRange._range.length != 0;
  else
    v60 = *(_QWORD *)(indexSet->_internal._singleRange._range.location + 8);
  if (v27 != v60)
    goto LABEL_117;
  if (_isEmpty((uint64_t)self))
  {
    bitfield = 0;
  }
  else
  {
    v62 = (*(_BYTE *)&indexSetFlags & 1) != 0
        ? &self->_internal._singleBitfield + 1
        : ($246AE1437D6384FE1219915B69C5C0EF *)(self->_internal._singleRange._range.location + 16);
    bitfield = v62->_bitfield;
  }
  if (_isEmpty((uint64_t)indexSet))
  {
    v63 = 0;
  }
  else
  {
    v64 = (*(_BYTE *)&v26 & 1) != 0
        ? &indexSet->_internal._singleBitfield + 1
        : ($246AE1437D6384FE1219915B69C5C0EF *)(indexSet->_internal._singleRange._range.location + 16);
    v63 = v64->_bitfield;
  }
  if (bitfield != v63)
    goto LABEL_117;
  v65 = &self->_internal;
  if ((*(_BYTE *)&indexSetFlags & 1) == 0)
    v65 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v65->_singleRange._range.location
                                              + 16 * *(_QWORD *)(v65->_singleRange._range.location + 24)
                                              + 64);
  v66 = &indexSet->_internal;
  if ((*(_BYTE *)&v26 & 1) == 0)
    v66 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v66->_singleRange._range.location
                                              + 16 * *(_QWORD *)(v66->_singleRange._range.location + 24)
                                              + 64);
  if (!v27)
    goto LABEL_116;
  v67 = v27 - 1;
  do
  {
    v68 = *(int64x2_t *)v65++;
    v69 = v68;
    v70 = *(int64x2_t *)v66++;
    v71 = vmovn_s64(vceqq_s64(v69, v70));
    v10 = v71.i8[0] & v71.i8[4];
    v43 = v67-- != 0;
    v72 = v43;
  }
  while ((v71.i8[0] & v71.i8[4] & 1) != 0 && (v72 & 1) != 0);
  return v10 & 1;
}

- (void)enumerateIndexesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSEnumerationOptions v6;

  if ((opts & 2) != 0)
    v6 = opts & 0xFFFFFFFFFFFFFFFELL;
  else
    v6 = opts;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v6, 0, 0x7FFFFFFFFFFFFFFFLL);
  __NSIndexSetEnumerate((uint64_t)self, v6, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

- (BOOL)intersectsIndexesInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  unint64_t v12;
  $228E88DFACDD67E146FBAE62E08A49BD *v13;
  NSUInteger v15;
  NSUInteger v16;
  char v17;
  unint64_t v18;
  unint64_t v19;

  length = range.length;
  location = range.location;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v6 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v6 = 0;
    v7 = v6 ^ (unint64_t)self;
    v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0)
      v8 = 0xFFFFFFFFFFFFFLL;
    v9 = v8 & (v7 >> 3);
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_indexSetFlags & 2) != 0)
  {
    v9 = self->_internal._singleRange._range.location;
LABEL_19:
    v15 = range.location + range.length;
    if (range.location + range.length >= 0x40)
      v15 = 64;
    v16 = v15 - range.location;
    if (range.location <= 0x3F)
      v17 = range.location;
    else
      v17 = 0;
    if (range.location > 0x3F)
      v16 = 0;
    v18 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v16 << v17;
    if (v16)
      v19 = v18;
    else
      v19 = 0;
    return (v19 & v9) != 0;
  }
  if (!range.length)
    return 0;
  v10 = -[NSIndexSet _indexOfRangeBeforeOrContainingIndex:](self, "_indexOfRangeBeforeOrContainingIndex:", range.location);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    p_internal = &self->_internal;
    if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0)
      p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                       + 16
                                                       * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                       + 64);
    if (p_internal[v10]._singleRange._range.location + p_internal[v10]._singleRange._range.length - 1 >= location)
      return 1;
  }
  v12 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", location);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v13 = &self->_internal;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0)
    v13 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v13->_singleRange._range.location
                                              + 16 * *(_QWORD *)(v13->_singleRange._range.location + 24)
                                              + 64);
  return location + length - 1 >= v13[v12]._singleRange._range.location;
}

- (NSUInteger)indexGreaterThanOrEqualToIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 1, 1);
}

+ (NSIndexSet)indexSetWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if (!a4)
    return (NSIndexSet *)objc_msgSend(a1, "indexSet", a3);
  v5 = 0;
  v6 = a4 - 1;
  while (1)
  {
    v7 = a3[v6];
    if (v7 > 0x3F)
      break;
    v5 |= 1 << v7;
LABEL_6:
    if (--v6 == -1)
      return (NSIndexSet *)objc_msgSend(a1, "indexSetWithBitfield:", v5);
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  return (NSIndexSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIndexes:count:", a3, a4);
}

- (NSIndexSet)initWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v10;
  NSMutableIndexSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSIndexSet *v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = 0;
    v7 = a4 - 1;
    while (1)
    {
      v8 = a3[v7];
      if (v8 > 0x3F)
      {
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = _NSGroupIndexesIntoSimpleRanges((uint64_t *)a3, a4);
          v11 = objc_alloc_init(NSMutableIndexSet);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(v10);
                v16 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "rangeValue");
                -[NSMutableIndexSet addIndexesInRange:](v11, "addIndexesInRange:", v16, v17);
                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
            }
            while (v13);
          }
          v18 = -[NSIndexSet initWithIndexSet:](self, "initWithIndexSet:", v11);

          return v18;
        }
      }
      else
      {
        v6 |= 1 << v8;
      }
      if (--v7 == -1)
        return -[NSIndexSet initWithBitfield:](self, "initWithBitfield:", v6);
    }
  }
  v6 = 0;
  return -[NSIndexSet initWithBitfield:](self, "initWithBitfield:", v6);
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

_QWORD *__43__NSIndexSet__indexOfRangeContainingIndex___block_invoke(_QWORD *result, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v4;

  v4 = result[6];
  if (v4 >= a2 && v4 - a2 < a3)
  {
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
LABEL_7:
    *a4 = 1;
    goto LABEL_8;
  }
  if (v4 < a2)
    goto LABEL_7;
LABEL_8:
  ++*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  return result;
}

_QWORD *__51__NSIndexSet__indexOfRangeBeforeOrContainingIndex___block_invoke(_QWORD *result, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v4;

  v4 = result[6];
  if (v4 >= a2 && v4 - a2 < a3)
  {
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
LABEL_9:
    *a4 = 1;
    goto LABEL_10;
  }
  if (a2 + a3 >= v4)
  {
    if (v4 < a2)
      goto LABEL_9;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  }
LABEL_10:
  ++*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  return result;
}

_QWORD *__50__NSIndexSet__indexOfRangeAfterOrContainingIndex___block_invoke(_QWORD *result, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  _BOOL4 v5;

  v4 = result[6];
  v5 = v4 - a2 < a3 && v4 >= a2;
  if (v4 < a2 || v5)
  {
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
    *a4 = 1;
  }
  ++*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  return result;
}

- (NSUInteger)indexLessThanOrEqualToIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 1, 0);
}

- (NSUInteger)getIndexes:(NSUInteger *)indexBuffer maxCount:(NSUInteger)bufferSize inIndexRange:(NSRangePointer)range
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  _opaque_pthread_t *v17;
  NSUInteger v18;
  unint64_t v19;
  $A8859644891BA8F5A580113D622AC538 v20;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  _BOOL4 v22;
  NSUInteger v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  unint64_t v32;
  $228E88DFACDD67E146FBAE62E08A49BD *v33;
  NSUInteger v34;
  $228E88DFACDD67E146FBAE62E08A49BD *v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  _BOOL4 v40;
  BOOL v41;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  $228E88DFACDD67E146FBAE62E08A49BD *v48;
  NSUInteger v49;
  NSUInteger v50;
  pthread_t v51;
  unint64_t v52;
  unint64_t *v53;

  if (!bufferSize || !-[NSIndexSet count](self, "count"))
    return 0;
  if (range)
  {
    length = range->length;
    if (!length)
      return 0;
    location = range->location;
    v11 = length + range->location - 1;
  }
  else
  {
    location = -[NSIndexSet firstIndex](self, "firstIndex");
    v11 = -[NSIndexSet lastIndex](self, "lastIndex");
  }
  if (v11 < location)
    return 0;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v12 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v12 = 0;
    v13 = v12 ^ (unint64_t)self;
    v14 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v13 & 7) == 0)
      v14 = 0xFFFFFFFFFFFFFLL;
    v15 = v14 & (v13 >> 3);
LABEL_24:
    if (location <= 0x3F)
    {
      v23 = 0;
      v24 = 63;
      if (v11 < 0x3F)
        v24 = v11;
      v25 = location;
      while (v25 <= 0x3F)
      {
        v26 = (-1 << v25) & v15;
        if (!v26)
          break;
        v27 = __clz(__rbit64(v26));
        if (v24 < v27)
          break;
        v25 = v27 + 1;
        indexBuffer[v23++] = v27;
        if (bufferSize == v23)
        {
          v23 = bufferSize;
          break;
        }
      }
      if (range && v23)
      {
        v28 = indexBuffer[v23 - 1] - location + 1;
        v29 = v28 + range->location;
        v30 = range->length - v28;
        range->location = v29;
        range->length = v30;
      }
      return v23;
    }
    return 0;
  }
  indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    v15 = self->_internal._singleRange._range.location;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&indexSetFlags & 1) != 0
    || (v17 = (_opaque_pthread_t *)atomic_load((unint64_t *)(self->_internal._singleRange._range.location + 56)),
        pthread_self() != v17)
    || (v18 = self->_internal._singleRange._range.location, *(_QWORD *)(v18 + 32) != location)
    || (v19 = *(_QWORD *)(v18 + 40), v19 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v19 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", location);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  v20 = self->_indexSetFlags;
  if ((*(_BYTE *)&v20 & 2) != 0)
  {
    p_internal = &self->_internal;
    v22 = (*(_DWORD *)&self->_indexSetFlags & 1) == 0;
  }
  else
  {
    if ((*(_BYTE *)&v20 & 1) != 0)
    {
      v32 = self->_internal._singleRange._range.length != 0;
      goto LABEL_46;
    }
    p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(self->_internal._singleRange._range.location + 8);
    v22 = 1;
  }
  if (p_internal->_singleRange._range.location)
  {
    if (v22)
    {
      v31 = self->_internal._singleRange._range.location;
      v32 = *(_QWORD *)(v31 + 8);
LABEL_42:
      v33 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v31 + 16 * *(_QWORD *)(v31 + 24) + 64);
      goto LABEL_47;
    }
    v32 = 1;
  }
  else
  {
    if (v22)
    {
      v32 = 0;
      v31 = self->_internal._singleRange._range.location;
      goto LABEL_42;
    }
    v32 = 0;
  }
LABEL_46:
  v33 = &self->_internal;
LABEL_47:
  if (v19 >= v32)
    return 0;
  v34 = 0;
  v23 = 0;
  do
  {
    v35 = &v33[v19];
    v36 = v35->_singleRange._range.location;
    v37 = v35->_singleRange._range.length;
    if (v35->_singleRange._range.location <= location)
      v38 = location;
    else
      v38 = v35->_singleRange._range.location;
    v41 = location >= v36;
    v39 = location - v36;
    if (v41)
      v34 = v39;
    v40 = v34 < v37;
    v41 = v38 > v11 || v34 >= v37;
    if (!v41)
    {
      do
      {
        indexBuffer[v23++] = v38++;
        v40 = ++v34 < v37;
      }
      while (v38 <= v11 && v23 < bufferSize && v34 < v37);
    }
    v19 += !v40;
    if (!v40)
      v34 = 0;
  }
  while (v38 <= v11 && v19 < v32 && v23 < bufferSize);
  if (v23)
  {
    if (range)
    {
      v44 = indexBuffer[v23 - 1] - location + 1;
      v45 = v44 + range->location;
      v46 = range->length - v44;
      range->location = v45;
      range->length = v46;
    }
    if (v19 < v32 && (*(_DWORD *)&self->_indexSetFlags & 1) == 0)
    {
      v48 = &v33[v19];
      v49 = indexBuffer[v23 - 1];
      v50 = v49 - v48->_singleRange._range.location;
      if (v50 < v48->_singleRange._range.length)
      {
        v51 = pthread_self();
        v52 = atomic_load((unint64_t *)(self->_internal._singleRange._range.location + 56));
        if (v51 == (pthread_t)v52)
        {
LABEL_85:
          *(_QWORD *)(self->_internal._singleRange._range.location + 40) = v19;
          *(_QWORD *)(self->_internal._singleRange._range.location + 48) = v50;
          *(_QWORD *)(self->_internal._singleRange._range.location + 32) = v49;
        }
        else
        {
          v53 = (unint64_t *)(self->_internal._singleRange._range.location + 56);
          while (!__ldaxr(v53))
          {
            if (!__stlxr((unint64_t)v51, v53))
              goto LABEL_85;
          }
          __clrex();
        }
      }
    }
  }
  return v23;
}

- (unint64_t)__getContainmentVector:(BOOL *)a3 inRange:(_NSRange)a4
{
  size_t length;
  NSUInteger location;
  int v8;
  char *v9;
  char *v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v17[3];

  length = a4.length;
  location = a4.location;
  v17[2] = *MEMORY[0x1E0C80C00];
  if (a4.length >= 0x101)
    v8 = 1;
  else
    v8 = 256;
  v9 = (char *)&v17[-1] - ((8 * v8 + 15) & 0xFFFFFFF0);
  v10 = v9;
  if (a4.length >= 0x101)
    v10 = (char *)malloc_type_malloc(8 * a4.length, 0x100004000313F17uLL);
  v17[0] = location;
  v17[1] = length;
  v11 = -[NSIndexSet getIndexes:maxCount:inIndexRange:](self, "getIndexes:maxCount:inIndexRange:", v10, length, v17);
  bzero(a3, length);
  if (v11)
  {
    v12 = v10;
    v13 = v11;
    do
    {
      v14 = *(_QWORD *)v12;
      v12 += 8;
      a3[v14 - location] = 1;
      --v13;
    }
    while (v13);
  }
  if (v10 != v9)
    free(v10);
  return v11;
}

- (id)_numberEnumerator
{
  return -[_NSIndexSetEnumerator initWithIndexSet:]([_NSIndexSetEnumerator alloc], "initWithIndexSet:", self);
}

- (id)description
{
  NSMutableString *v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t i;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 128);
  v12.receiver = self;
  v12.super_class = (Class)NSIndexSet;
  -[NSMutableString appendString:](v3, "appendString:", -[NSIndexSet description](&v12, sel_description));
  v4 = -[NSIndexSet count](self, "count");
  if (v4)
  {
    v5 = v4;
    v6 = -[NSIndexSet rangeCount](self, "rangeCount");
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("[number of indexes: %lu (in %lu ranges), indexes: ("), v5, v6);
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        if (i)
          -[NSMutableString appendString:](v3, "appendString:", CFSTR(" "));
        v8 = -[NSIndexSet rangeAtIndex:](self, "rangeAtIndex:", i);
        v10 = v9;
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%lu"), v8);
        if (v10 >= 2)
          -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("-%lu"), v10 + v8 - 1);
      }
    }
    -[NSMutableString appendString:](v3, "appendString:", CFSTR(")]"));
  }
  else
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("(no indexes)"));
  }
  return v3;
}

- (void)enumerateIndexesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  NSEnumerationOptions v9;
  uint64_t v10;

  length = range.length;
  location = range.location;
  v9 = opts & 0xF7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v9 = opts;
  v10 = v9 | 0x800000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v9 | 0x800000000000000, range.location, range.length);
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)block);
}

- (NSUInteger)indexPassingTest:(void *)predicate
{
  return -[NSIndexSet indexWithOptions:passingTest:](self, "indexWithOptions:passingTest:", 0, predicate);
}

- (NSUInteger)indexWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSEnumerationOptions v6;
  uint64_t v7;

  v6 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v6 = opts;
  v7 = v6 | 0x2000000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v6 | 0x2000000000000000, 0, 0x7FFFFFFFFFFFFFFFLL);
  return __NSIndexSetEnumerate((uint64_t)self, v7, 0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)predicate);
}

- (NSUInteger)indexInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSUInteger length;
  NSUInteger location;
  NSEnumerationOptions v9;
  uint64_t v10;

  length = range.length;
  location = range.location;
  v9 = opts & 0xD7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v9 = opts;
  v10 = v9 | 0x2800000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x2800000000000000, range.location, range.length);
  return __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)predicate);
}

- (NSIndexSet)indexesInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSUInteger length;
  NSUInteger location;
  NSEnumerationOptions v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSIndexSet *v13;
  NSIndexSet *v14;
  _QWORD v16[8];
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;

  length = range.length;
  location = range.location;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = opts & 0xF7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v9 = opts;
  v10 = v9 | 0x800000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x800000000000000, range.location, range.length);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__NSIndexSet_indexesInRange_options_passingTest___block_invoke;
  v16[3] = &unk_1E0F4E780;
  v16[4] = predicate;
  v16[5] = &v18;
  v16[6] = &v22;
  v16[7] = &v17;
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)v16);
  v11 = (void *)v23[5];
  if (v11)
  {
    v12 = (void *)objc_msgSend(v11, "copy");

    v13 = v12;
  }
  else
  {
    v13 = +[NSIndexSet indexSetWithBitfield:](NSIndexSet, "indexSetWithBitfield:", v19[3]);
  }
  v14 = v13;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v14;
}

void __49__NSIndexSet_indexesInRange_options_passingTest___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 56));
    if (a2 > 0x3F)
    {
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v4)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[NSIndexSet initWithBitfield:]([NSMutableIndexSet alloc], "initWithBitfield:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 24));
        v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v4, "addIndex:", a2);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1 << a2;
    }
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 56));
  }
}

- (void)enumerateRangesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  NSEnumerationOptions v9;
  uint64_t v10;

  length = range.length;
  location = range.location;
  v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0)
    v9 = opts;
  v10 = v9 | 0x4000000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v9 | 0x4000000000000000, range.location, range.length);
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)block);
}

- (unint64_t)_indexAtIndex:(unint64_t)a3
{
  unint64_t result;

  result = -[NSIndexSet firstIndex](self, "firstIndex");
  while (a3)
  {
    --a3;
    result = -[NSIndexSet indexGreaterThanIndex:](self, "indexGreaterThanIndex:", result);
  }
  return result;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isByref"))
  {
    v6.receiver = self;
    v6.super_class = (Class)NSIndexSet;
    return -[NSIndexSet replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }
  return self;
}

@end
