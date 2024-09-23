@implementation NSConcreteMutableData

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v4;
  NSUInteger v5;
  NSUInteger length;
  unint64_t capacity;
  char *bytes;
  unint64_t v12;
  BOOL v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  char *v18;
  _QWORD *v19;
  int v20;
  NSUInteger v21;
  unint64_t v22;
  _QWORD *v23;
  char *v24;
  NSUInteger v25;
  NSString *v26;
  void *v27;
  NSRange v28;

  v5 = a4;
  if (*MEMORY[0x1E0C9AA88])
  {
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(self, v4, *MEMORY[0x1E0C9AA10]);
    if (!v5)
      return;
  }
  else if (!a4)
  {
    return;
  }
  length = self->_length;
  if (__CFADD__(v5, length))
  {
    v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    v28.location = length;
    v28.length = v5;
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v26, NSStringFromRange(v28)), 0);
    objc_exception_throw(v27);
  }
  capacity = self->_capacity;
  bytes = (char *)self->_bytes;
  if (capacity < length + v5)
  {
    v12 = (unint64_t)&bytes[capacity];
    if (bytes)
      v13 = v12 > (unint64_t)a3;
    else
      v13 = 0;
    v14 = !v13 || bytes >= (char *)a3 + v5;
    v15 = (unint64_t)a3;
    if (v14)
      goto LABEL_19;
    v16 = (unint64_t)malloc_type_malloc(v5, 0xEBF71814uLL);
    v15 = v16;
    v17 = v5;
    v18 = (char *)a3;
    if (v5 >= 0x80000)
    {
      v19 = (_QWORD *)MEMORY[0x1E0C85AD8];
      v17 = v5;
      v18 = (char *)a3;
      if (((*MEMORY[0x1E0C85AD8] - 1) & (v16 | (unint64_t)a3)) == 0)
      {
        malloc_default_zone();
        v20 = malloc_zone_claimed_address();
        v16 = v15;
        v17 = v5;
        v18 = (char *)a3;
        if (!v20)
        {
          v21 = -*v19 & v5;
          NSCopyMemoryPages(a3, (void *)v15, v21);
          v17 = v5 - v21;
          if (v5 == v21)
          {
LABEL_19:
            _NSMutableDataGrowBytes((uint64_t)self, a2, length + v5, 0);
            bytes = (char *)self->_bytes;
            goto LABEL_20;
          }
          v18 = (char *)a3 + v21;
          v16 = v15 + v21;
        }
      }
    }
    memmove((void *)v16, v18, v17);
    goto LABEL_19;
  }
  v15 = (unint64_t)a3;
  if (!bytes)
    goto LABEL_19;
LABEL_20:
  self->_length = length + v5;
  v22 = (unint64_t)&bytes[length];
  if (v5 < 0x80000
    || (v23 = (_QWORD *)MEMORY[0x1E0C85AD8], ((*MEMORY[0x1E0C85AD8] - 1) & (v22 | v15)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    v24 = (char *)v15;
LABEL_24:
    memmove((void *)v22, v24, v5);
    goto LABEL_25;
  }
  v25 = -*v23 & v5;
  NSCopyMemoryPages((const void *)v15, (void *)v22, v25);
  v5 -= v25;
  if (v5)
  {
    v24 = (char *)(v15 + v25);
    v22 += v25;
    goto LABEL_24;
  }
LABEL_25:
  if ((const void *)v15 != a3)
    free((void *)v15);
}

- (unint64_t)length
{
  uint64_t v2;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(self, v2, *MEMORY[0x1E0C9AA10]);
  return self->_length;
}

- (BOOL)_canUseRealloc
{
  return 1;
}

- (void)appendData:(id)a3
{
  uint64_t v3;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(self, v3, *MEMORY[0x1E0C9AA10]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NSConcreteMutableData_appendData___block_invoke;
  v6[3] = &unk_1E0F4D100;
  v6[4] = self;
  objc_msgSend(a3, "enumerateByteRangesUsingBlock:", v6);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSConcreteMutableData _freeBytes](self, "_freeBytes");
  v3.receiver = self;
  v3.super_class = (Class)NSConcreteMutableData;
  -[NSConcreteMutableData dealloc](&v3, sel_dealloc);
}

- (void)_freeBytes
{
  if (self->_bytes)
  {
    if ((*((_BYTE *)self + 8) & 4) != 0)
      NSDeallocateMemoryPages(self->_bytes, self->_capacity);
    else
      free(self->_bytes);
  }
}

- (void)mutableBytes
{
  uint64_t v2;

  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(self, v2, *MEMORY[0x1E0C9AA10]);
  return self->_bytes;
}

- (NSConcreteMutableData)initWithLength:(unint64_t)a3
{
  NSConcreteMutableData *v4;
  unint64_t v5;
  size_t v6;
  malloc_zone_t *v7;
  void *v8;
  char v9;
  void *v11;

  v4 = self;
  if (a3 >= 0x8000000000000001)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "length", a3, 0x8000000000000000), 0);
    objc_exception_throw(v11);
  }
  v5 = a3 >> 2;
  if (a3 >> 30)
    v5 = 0;
  v6 = v5 + a3;
  if (v5 + a3 >= 0x80000)
    v6 = (v6 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
  *((_BYTE *)self + 8) &= ~4u;
  v7 = malloc_default_zone();
  if (a3 <= 0x20000)
  {
    v8 = malloc_type_zone_malloc(v7, v6, 0xAB91708DuLL);
    v9 = 2;
  }
  else
  {
    v8 = malloc_type_zone_calloc(v7, 1uLL, v6, 0xAB93A664uLL);
    v9 = 0;
  }
  v4->_bytes = v8;
  v4->_capacity = v6;
  *((_BYTE *)v4 + 8) = *((_BYTE *)v4 + 8) & 0xFD | v9;
  if (v4->_bytes)
  {
    -[NSConcreteMutableData setLength:](v4, "setLength:", a3);
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)setLength:(unint64_t)a3
{
  uint64_t v3;
  char *bytes;
  unint64_t length;
  void *v9;

  if (*MEMORY[0x1E0C9AA88])
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(self, v3, *MEMORY[0x1E0C9AA10]);
  if (a3 >= 0x8000000000000001)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "length", a3, 0x8000000000000000), 0);
    objc_exception_throw(v9);
  }
  if (self->_capacity >= a3 && (bytes = (char *)self->_bytes) != 0)
  {
    length = self->_length;
    if (a3 > length && (*((_BYTE *)self + 8) & 2) != 0)
    {
      bzero(&bytes[length], a3 - length);
    }
    else if (a3 < length)
    {
      *((_BYTE *)self + 8) |= 2u;
    }
  }
  else
  {
    _NSMutableDataGrowBytes((uint64_t)self, a2, a3, 1);
  }
  self->_length = a3;
}

- (const)bytes
{
  uint64_t v2;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(self, v2, *MEMORY[0x1E0C9AA10]);
  return self->_bytes;
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (NSConcreteMutableData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  NSConcreteMutableData *v9;
  NSConcreteMutableData *v10;
  unint64_t bytes;
  _QWORD *v12;
  size_t v13;
  char *v14;
  NSUInteger v16;
  void *v17;

  if (a4 >= 0x8000000000000001)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "length", a4, 0x8000000000000000), 0);
    objc_exception_throw(v17);
  }
  v9 = -[NSConcreteMutableData initWithCapacity:](self, "initWithCapacity:", a4);
  v10 = v9;
  if (v9)
  {
    bytes = (unint64_t)v9->_bytes;
    if (a4 < 0x80000)
    {
      v14 = (char *)a3;
      v13 = a4;
      if (!a4)
      {
LABEL_9:
        if (a6)
          (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
        v10->_length = a4;
        return v10;
      }
    }
    else
    {
      v12 = (_QWORD *)MEMORY[0x1E0C85AD8];
      if (((*MEMORY[0x1E0C85AD8] - 1) & (bytes | (unint64_t)a3)) != 0
        || (malloc_default_zone(), malloc_zone_claimed_address()))
      {
        v13 = a4;
        v14 = (char *)a3;
      }
      else
      {
        v16 = -*v12 & a4;
        NSCopyMemoryPages(a3, (void *)bytes, v16);
        v14 = (char *)a3 + v16;
        bytes += v16;
        v13 = a4 - v16;
        if (a4 == v16)
          goto LABEL_9;
      }
    }
    memmove((void *)bytes, v14, v13);
    goto LABEL_9;
  }
  return v10;
}

- (NSConcreteMutableData)initWithCapacity:(unint64_t)a3
{
  NSConcreteMutableData *v3;
  unint64_t v4;
  size_t v5;
  malloc_zone_t *v6;
  void *v8;

  v3 = self;
  if (a3 >= 0x8000000000000001)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "capacity", a3, 0x8000000000000000), 0);
    objc_exception_throw(v8);
  }
  v4 = a3 >> 2;
  if (a3 >> 30)
    v4 = 0;
  v5 = v4 + a3;
  if (v4 + a3 >= 0x80000)
    v5 = (v5 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
  self->_length = 0;
  *((_BYTE *)self + 8) &= ~4u;
  v6 = malloc_default_zone();
  v3->_bytes = malloc_type_zone_malloc(v6, v5, 0xAB91708DuLL);
  v3->_capacity = v5;
  *((_BYTE *)v3 + 8) |= 2u;
  if (!v3->_bytes)
  {

    return 0;
  }
  return v3;
}

- (NSConcreteMutableData)init
{
  return -[NSConcreteMutableData initWithCapacity:](self, "initWithCapacity:", 0);
}

uint64_t __36__NSConcreteMutableData_appendData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", a2);
}

- (void)increaseLengthBy:(unint64_t)a3
{
  uint64_t v3;
  unint64_t length;
  unint64_t v8;
  char *bytes;
  NSString *v10;
  void *v11;
  _QWORD *v12;
  NSUInteger v13;
  NSString *v14;
  NSRange v15;

  if (*MEMORY[0x1E0C9AA88])
  {
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(self, v3, *MEMORY[0x1E0C9AA10]);
    if (!a3)
      return;
  }
  else if (!a3)
  {
    return;
  }
  if (a3 >= 0x8000000000000001)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "extra length", a3, 0x8000000000000000);
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_16;
  }
  length = self->_length;
  if (__CFADD__(a3, length))
  {
    v13 = self->_length;
    v14 = _NSMethodExceptionProem((objc_class *)self, a2);
    v15.location = v13;
    v15.length = a3;
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v14, NSStringFromRange(v15));
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (_QWORD *)MEMORY[0x1E0C99858];
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", *v12, v10, 0));
  }
  v8 = length + a3;
  if (self->_capacity >= length + a3 && (bytes = (char *)self->_bytes) != 0)
  {
    if ((*((_BYTE *)self + 8) & 2) != 0)
      bzero(&bytes[length], a3);
  }
  else
  {
    _NSMutableDataGrowBytes((uint64_t)self, a2, length + a3, 1);
  }
  self->_length = v8;
}

- (void)replaceBytesInRange:(_NSRange)a3 withBytes:(const void *)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t capacity;
  char *bytes;
  unint64_t v15;
  BOOL v16;
  BOOL v17;
  unint64_t v18;
  size_t v19;
  char *v20;
  _QWORD *v21;
  int v22;
  NSUInteger v23;
  unint64_t v24;
  _QWORD *v25;
  char *v26;
  NSUInteger v27;
  NSString *v28;
  NSString *v29;
  uint64_t v30;
  NSRange v31;

  length = a3.length;
  location = a3.location;
  if (*MEMORY[0x1E0C9AA88])
  {
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(self, v4, *MEMORY[0x1E0C9AA10]);
    if (!length)
      return;
  }
  else if (!a3.length)
  {
    return;
  }
  v10 = self->_length;
  if (location > v10)
  {
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: location %lu exceeds data length %lu"), _NSMethodExceptionProem((objc_class *)self, a2), location, v10);
    goto LABEL_35;
  }
  if (__CFADD__(length, location))
  {
    v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v31.location = location;
    v31.length = length;
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v29, NSStringFromRange(v31), v30);
LABEL_35:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v28, 0));
  }
  v11 = location + length;
  v12 = (unint64_t)a4;
  if (v10 < location + length)
  {
    capacity = self->_capacity;
    v12 = (unint64_t)a4;
    if (capacity >= v11)
    {
LABEL_21:
      self->_length = v11;
      goto LABEL_22;
    }
    bytes = (char *)self->_bytes;
    v15 = (unint64_t)&bytes[capacity];
    if (bytes)
      v16 = v15 > (unint64_t)a4;
    else
      v16 = 0;
    v17 = !v16 || bytes >= (char *)a4 + length;
    v12 = (unint64_t)a4;
    if (!v17)
    {
      v18 = (unint64_t)malloc_type_malloc(length, 0xD0F68583uLL);
      v12 = v18;
      v19 = length;
      v20 = (char *)a4;
      if (length < 0x80000)
        goto LABEL_19;
      v21 = (_QWORD *)MEMORY[0x1E0C85AD8];
      v19 = length;
      v20 = (char *)a4;
      if (((*MEMORY[0x1E0C85AD8] - 1) & (v18 | (unint64_t)a4)) != 0)
        goto LABEL_19;
      malloc_default_zone();
      v22 = malloc_zone_claimed_address();
      v18 = v12;
      v19 = length;
      v20 = (char *)a4;
      if (v22)
        goto LABEL_19;
      v23 = length & -*v21;
      NSCopyMemoryPages(a4, (void *)v12, v23);
      v19 = length - v23;
      if (length != v23)
      {
        v20 = (char *)a4 + v23;
        v18 = v12 + v23;
LABEL_19:
        memmove((void *)v18, v20, v19);
      }
    }
    _NSMutableDataGrowBytes((uint64_t)self, a2, location + length, 0);
    goto LABEL_21;
  }
LABEL_22:
  v24 = (unint64_t)self->_bytes + location;
  if (length < 0x80000
    || (v25 = (_QWORD *)MEMORY[0x1E0C85AD8], ((*MEMORY[0x1E0C85AD8] - 1) & (v24 | v12)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    v26 = (char *)v12;
LABEL_26:
    memmove((void *)v24, v26, length);
    goto LABEL_27;
  }
  v27 = length & -*v25;
  NSCopyMemoryPages((const void *)v12, (void *)v24, v27);
  length -= v27;
  if (length)
  {
    v26 = (char *)(v12 + v27);
    v24 += v27;
    goto LABEL_26;
  }
LABEL_27:
  if ((const void *)v12 != a4)
    free((void *)v12);
}

- (void)resetBytesInRange:(_NSRange)a3
{
  uint64_t v3;
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  unint64_t v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;
  NSRange v13;

  length = a3.length;
  location = a3.location;
  if (*MEMORY[0x1E0C9AA88])
  {
    ((void (*)(NSConcreteMutableData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA88])(self, v3, *MEMORY[0x1E0C9AA10]);
    if (!length)
      return;
  }
  else if (!a3.length)
  {
    return;
  }
  v8 = self->_length;
  if (location > v8)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: location %lu exceeds data length %lu"), _NSMethodExceptionProem((objc_class *)self, a2), location, self->_length);
    goto LABEL_14;
  }
  if (__CFADD__(length, location))
  {
    v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    v13.location = location;
    v13.length = length;
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v11, NSStringFromRange(v13), v12);
LABEL_14:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v10, 0));
  }
  v9 = location + length;
  if (v8 < location + length)
  {
    if (self->_capacity < v9)
      _NSMutableDataGrowBytes((uint64_t)self, a2, location + length, 0);
    self->_length = v9;
  }
  bzero((char *)self->_bytes + location, length);
}

@end
