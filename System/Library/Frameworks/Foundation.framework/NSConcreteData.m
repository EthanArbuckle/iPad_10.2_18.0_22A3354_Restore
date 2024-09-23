@implementation NSConcreteData

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return self->_bytes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[NSConcreteData _copyWillRetain](self, "_copyWillRetain"))
    return self;
  v6.receiver = self;
  v6.super_class = (Class)NSConcreteData;
  return -[NSData copyWithZone:](&v6, sel_copyWithZone_, a3);
}

- (BOOL)_copyWillRetain
{
  return !_CFExecutableLinkedOnOrAfter() || self->_deallocator != 0;
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  char *v4;
  size_t length;
  unint64_t bytes;
  _QWORD *v7;
  NSUInteger v8;

  v4 = (char *)a3;
  if (self->_length >= a4)
    length = a4;
  else
    length = self->_length;
  bytes = (unint64_t)self->_bytes;
  if (length < 0x80000)
  {
LABEL_8:
    if (!length)
      return;
    goto LABEL_9;
  }
  v7 = (_QWORD *)MEMORY[0x1E0C85AD8];
  if (((*MEMORY[0x1E0C85AD8] - 1) & (bytes | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      v8 = length & -*v7;
      NSCopyMemoryPages((const void *)bytes, v4, v8);
      bytes += v8;
      v4 += v8;
      length -= v8;
      goto LABEL_8;
    }
  }
LABEL_9:
  memmove(v4, (const void *)bytes, length);
}

- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  NSConcreteData *v7;
  malloc_zone_t *v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  size_t v14;
  char *v15;
  NSUInteger v17;
  void *v18;

  v7 = self;
  if (a4 >= 0x8000000000000001)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "length", a4, 0x8000000000000000), 0);
    objc_exception_throw(v18);
  }
  if (!a4)
  {
    self->_bytes = 0;
    if (a6)
      (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, self->_length);
    goto LABEL_17;
  }
  if (!a5)
  {
    self->_bytes = a3;
    if (a6)
      self->_deallocator = _Block_copy(a6);
    goto LABEL_17;
  }
  v10 = malloc_default_zone();
  v11 = (unint64_t)malloc_type_zone_malloc(v10, a4, 0xAB91708DuLL);
  v7->_bytes = (void *)v11;
  if (!v11)
  {

    return 0;
  }
  v12 = (char *)v11;
  if (a4 < 0x80000
    || (v13 = (_QWORD *)MEMORY[0x1E0C85AD8], ((*MEMORY[0x1E0C85AD8] - 1) & (v11 | (unint64_t)a3)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    v14 = a4;
    v15 = (char *)a3;
LABEL_9:
    memmove(v12, v15, v14);
    goto LABEL_10;
  }
  v17 = -*v13 & a4;
  NSCopyMemoryPages(a3, v12, v17);
  v14 = a4 - v17;
  if (a4 != v17)
  {
    v15 = (char *)a3 + v17;
    v12 += v17;
    goto LABEL_9;
  }
LABEL_10:
  v7->_deallocator = _Block_copy(&__block_literal_global_6);
  if (a6)
    (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
LABEL_17:
  v7->_length = a4;
  return v7;
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (void)dealloc
{
  void (**deallocator)(id, void *, unint64_t);
  void *bytes;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    bytes = self->_bytes;
    if (bytes)
    {
      deallocator[2](deallocator, bytes, self->_length);
      deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
    }
    _Block_release(deallocator);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSConcreteData;
  -[NSConcreteData dealloc](&v5, sel_dealloc);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  int v9;
  unint64_t v10;
  const char *v11;
  unint64_t v12;
  NSString *v13;
  const __CFString *v14;
  unint64_t v15;
  _QWORD *v16;
  NSUInteger v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  unint64_t v22;
  NSRange v23;
  NSRange v24;

  if (!a4.length)
    return;
  length = a4.length;
  location = a4.location;
  v9 = _CFExecutableLinkedOnOrAfter();
  v10 = self->_length;
  if (v9)
  {
    if (!__CFADD__(length, location))
    {
      if (location + length > v10)
      {
        v11 = a2;
        v12 = self->_length;
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
    v22 = self->_length;
    v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    v14 = CFSTR("%@: location %lu exceeds data length %lu");
    goto LABEL_18;
  }
  if (length >= v10 - location)
    length = v10 - location;
LABEL_9:
  v15 = (unint64_t)self->_bytes + location;
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

- (id)_createDispatchData
{
  return (id)_NSDataCreateDispatchDataFromData(self, !-[NSConcreteData _copyWillRetain](self, "_copyWillRetain"));
}

- (BOOL)_isCompact
{
  return 1;
}

- (void)getBytes:(void *)a3
{
  char *v3;
  unint64_t bytes;
  size_t length;
  _QWORD *v6;
  NSUInteger v7;

  v3 = (char *)a3;
  bytes = (unint64_t)self->_bytes;
  length = self->_length;
  if (length < 0x80000)
  {
LABEL_5:
    if (!length)
      return;
    goto LABEL_6;
  }
  v6 = (_QWORD *)MEMORY[0x1E0C85AD8];
  if (((*MEMORY[0x1E0C85AD8] - 1) & (bytes | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      v7 = length & -*v6;
      NSCopyMemoryPages((const void *)bytes, v3, v7);
      bytes += v7;
      v3 += v7;
      length -= v7;
      goto LABEL_5;
    }
  }
LABEL_6:
  memmove(v3, (const void *)bytes, length);
}

- (NSConcreteData)init
{
  return -[NSConcreteData initWithBytes:length:copy:freeWhenDone:bytesAreVM:](self, "initWithBytes:length:copy:freeWhenDone:bytesAreVM:", 0, 0, 0, 0, 0);
}

- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7
{
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSConcreteData;
  return -[NSData initWithBytes:length:copy:freeWhenDone:bytesAreVM:](&v8, sel_initWithBytes_length_copy_freeWhenDone_bytesAreVM_, a3, a4, a5, a6, a7);
}

@end
