@implementation NSSubrangeData

- (const)bytes
{
  return -[NSData bytes](self->_data, "bytes") + self->_range.location;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSubrangeData;
  -[NSSubrangeData dealloc](&v3, sel_dealloc);
}

- (NSSubrangeData)initWithData:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  NSData *v10;
  NSString *v12;
  NSString *v13;
  unint64_t v14;
  NSString *v15;
  NSString *v16;
  const __CFString *v17;
  NSString *v18;
  NSString *v19;
  uint64_t v20;
  unint64_t v21;
  NSRange v22;
  NSRange v23;

  length = a4.length;
  location = a4.location;
  v9 = objc_msgSend(a3, "length");
  if (__CFADD__(length, location))
  {
    v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    v22.location = location;
    v22.length = length;
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v12, NSStringFromRange(v22), v20);
    goto LABEL_14;
  }
  if (location + length > v9)
  {
    v14 = v9;
    v15 = _NSMethodExceptionProem((objc_class *)self, a2);
    v16 = v15;
    if (length)
    {
      v23.location = location;
      v23.length = length;
      v19 = NSStringFromRange(v23);
      v21 = v14;
      v18 = v16;
      v17 = CFSTR("%@: range %@ exceeds data length %lu");
    }
    else
    {
      v19 = (NSString *)location;
      v21 = v14;
      v18 = v15;
      v17 = CFSTR("%@: location %lu exceeds data length %lu");
    }
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18, v19, v21);
LABEL_14:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v13, 0));
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_range.location = *((_QWORD *)a3 + 1) + location;
    self->_range.length = length;
    v10 = (NSData *)*((id *)a3 + 3);
  }
  else
  {
    self->_range.location = location;
    self->_range.length = length;
    v10 = (NSData *)objc_msgSend(a3, "copyWithZone:", 0);
  }
  self->_data = v10;
  if (!v10)
  {

    return 0;
  }
  return self;
}

- (unint64_t)length
{
  return self->_range.length;
}

- (BOOL)_isCompact
{
  return -[NSData _isCompact](self->_data, "_isCompact");
}

- (void)getBytes:(void *)a3
{
  int v5;
  NSData *data;
  uint64_t v7;
  NSUInteger location;
  size_t length;
  NSUInteger v10;
  _QWORD *v11;
  NSUInteger v12;

  v5 = _CFExecutableLinkedOnOrAfter();
  data = self->_data;
  if (v5)
  {
    -[NSData getBytes:range:](data, "getBytes:range:", a3, self->_range.location, self->_range.length);
    return;
  }
  v7 = -[NSData bytes](data, "bytes");
  location = self->_range.location;
  length = self->_range.length;
  v10 = v7 + location;
  if (length < 0x80000)
  {
LABEL_7:
    if (!length)
      return;
    goto LABEL_8;
  }
  v11 = (_QWORD *)MEMORY[0x1E0C85AD8];
  if (((*MEMORY[0x1E0C85AD8] - 1) & (v10 | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      v12 = length & -*v11;
      NSCopyMemoryPages((const void *)v10, a3, v12);
      v10 += v12;
      a3 = (char *)a3 + v12;
      length -= v12;
      goto LABEL_7;
    }
  }
LABEL_8:
  memmove(a3, (const void *)v10, length);
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  _NSRange *p_range;
  size_t length;
  int v8;
  NSData *data;
  uint64_t v10;
  _QWORD *v11;
  NSUInteger v12;

  p_range = &self->_range;
  if (self->_range.length >= a4)
    length = a4;
  else
    length = self->_range.length;
  v8 = _CFExecutableLinkedOnOrAfter();
  data = self->_data;
  if (v8)
  {
    -[NSData getBytes:range:](data, "getBytes:range:", a3, p_range->location, length);
    return;
  }
  v10 = (uint64_t)(-[NSData bytes](data, "bytes") + p_range->location);
  if (length < 0x80000)
  {
LABEL_10:
    if (!length)
      return;
    goto LABEL_11;
  }
  v11 = (_QWORD *)MEMORY[0x1E0C85AD8];
  if (((*MEMORY[0x1E0C85AD8] - 1) & (v10 | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      v12 = length & -*v11;
      NSCopyMemoryPages((const void *)v10, a3, v12);
      v10 += v12;
      a3 = (char *)a3 + v12;
      length -= v12;
      goto LABEL_10;
    }
  }
LABEL_11:
  memmove(a3, (const void *)v10, length);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  int v9;
  NSUInteger v10;
  const char *v11;
  NSUInteger v12;
  NSString *v13;
  const __CFString *v14;
  unint64_t v15;
  _QWORD *v16;
  NSUInteger v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSUInteger v22;
  NSRange v23;
  NSRange v24;

  if (!a4.length)
    return;
  length = a4.length;
  location = a4.location;
  v9 = _CFExecutableLinkedOnOrAfter();
  v10 = self->_range.length;
  if (v9)
  {
    if (!__CFADD__(length, location))
    {
      if (location + length > v10)
      {
        v11 = a2;
        v12 = self->_range.length;
        v13 = _NSMethodExceptionProem((objc_class *)self, v11);
        v23.location = location;
        v23.length = length;
        v21 = NSStringFromRange(v23);
        v22 = v12;
        v20 = v13;
        v14 = CFSTR("%@: range %@ exceeds data length %lu");
        goto LABEL_18;
      }
      goto LABEL_9;
    }
    v18 = _NSMethodExceptionProem((objc_class *)self, a2);
    v24.location = location;
    v24.length = length;
    v20 = v18;
    v21 = NSStringFromRange(v24);
    v14 = CFSTR("%@: range %@ causes integer overflow");
LABEL_18:
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v20, v21, v22);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v19, 0));
  }
  if (v10 <= location)
  {
    v21 = (NSString *)location;
    v22 = self->_range.length;
    v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    v14 = CFSTR("%@: location %lu exceeds data length %lu");
    goto LABEL_18;
  }
  if (length >= v10 - location)
    length = v10 - location;
LABEL_9:
  v15 = (unint64_t)(-[NSData bytes](self->_data, "bytes") + self->_range.location + location);
  if (length >= 0x80000)
  {
    v16 = (_QWORD *)MEMORY[0x1E0C85AD8];
    if (((*MEMORY[0x1E0C85AD8] - 1) & (v15 | (unint64_t)a3)) != 0)
      goto LABEL_14;
    malloc_default_zone();
    if (malloc_zone_claimed_address())
      goto LABEL_14;
    v17 = length & -*v16;
    NSCopyMemoryPages((const void *)v15, a3, v17);
    v15 += v17;
    a3 = (char *)a3 + v17;
    length -= v17;
  }
  if (length)
LABEL_14:
    memmove(a3, (const void *)v15, length);
}

- (NSSubrangeData)init
{
  NSString *v3;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: should never be called"), _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v3, 0));
}

@end
