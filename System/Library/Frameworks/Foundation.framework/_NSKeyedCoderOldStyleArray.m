@implementation _NSKeyedCoderOldStyleArray

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSKeyedCoderOldStyleArray)initWithObjCType:(char)a3 count:(unint64_t)a4 at:(const void *)a5
{
  int v7;
  NSUInteger v9;
  NSUInteger v10;
  BOOL v11;
  NSString *v13;
  NSString *v14;
  NSUInteger alignp;
  NSUInteger sizep;
  char typePtr[2];
  uint64_t v18;

  v7 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  alignp = 0;
  sizep = 0;
  typePtr[0] = a3;
  typePtr[1] = 0;
  NSGetSizeAndAlignment(typePtr, &sizep, &alignp);
  v10 = alignp;
  v9 = sizep;
  if (sizep)
    v11 = alignp == 0;
  else
    v11 = 1;
  if (v11)
  {

    v13 = _NSMethodExceptionProem((objc_class *)self, sel_encodeArrayOfObjCType_count_at_);
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: size (%ld) or alignment (%ld) of type ('%c') is zero"), v13, sizep, alignp, v7);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v14, 0));
  }
  self->_type = v7;
  self->_addr = (void *)a5;
  self->_count = a4;
  if (v9 <= v10)
    v9 = v10;
  self->_size = v9;
  self->_decoded = 0;
  return self;
}

- (void)dealloc
{
  void *addr;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_decoded)
  {
    addr = self->_addr;
    if (addr)
      free(addr);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSKeyedCoderOldStyleArray;
  -[_NSKeyedCoderOldStyleArray dealloc](&v4, sel_dealloc);
}

- (void)fillObjCType:(char)a3 count:(unint64_t)a4 at:(void *)a5
{
  unint64_t count;
  unint64_t size;
  NSString *v9;
  void *v10;
  _QWORD *v11;

  count = self->_count;
  if (!count || (size = self->_size) == 0)
  {

    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: stored element size (%ld) or count (%ld) is zero"), _NSMethodExceptionProem((objc_class *)self, a2), self->_size, self->_count);
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (_QWORD *)MEMORY[0x1E0C99768];
    goto LABEL_8;
  }
  if (count != a4 || self->_type != a3)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: type ('%c') or count (%ld) does not match stored type and count ('%c', %ld)"), _NSMethodExceptionProem((objc_class *)self, sel_decodeArrayOfObjCType_count_at_), a3, a4, self->_type, self->_count);
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (_QWORD *)MEMORY[0x1E0C99778];
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", *v11, v9, 0));
  }
  memmove(a5, self->_addr, size * a4);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5;

  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_count), CFSTR("NS.count"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_size), CFSTR("NS.size"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_type, CFSTR("NS.type"));
  if (self->_count)
  {
    v5 = 0;
    do
      _compatEncodeValueOfObjCType((objc_class *)a3, self->_type, (double *)((char *)self->_addr + self->_size * v5++), sel_encodeArrayOfObjCType_count_at_);
    while (v5 < self->_count);
  }
}

- (_NSKeyedCoderOldStyleArray)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSUInteger v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  NSString *v22;
  NSUInteger alignp;
  NSUInteger sizep;
  char typePtr[2];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.count"));
  v7 = v6;
  if ((v6 & 0x80000000) != 0)
  {
    v15 = _NSMethodExceptionProem((objc_class *)self, a2);

    objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: unable to decode array with negative count (%d)"), v15, v7);
  }
  else
  {
    v8 = v6;
    self->_count = v6;
    v9 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.size"));
    v10 = v9;
    if ((v9 & 0x80000000) != 0)
    {
      v16 = _NSMethodExceptionProem((objc_class *)self, a2);

      objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: unable to decode array with negative size (%d)"), v16, v10);
    }
    else
    {
      v11 = v9;
      self->_size = v9;
      v12 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.type"));
      v13 = v12;
      if ((_DWORD)v12 == (char)v12)
      {
        self->_type = v12;
        alignp = 0;
        sizep = 0;
        typePtr[0] = v12;
        typePtr[1] = 0;
        NSGetSizeAndAlignment(typePtr, &sizep, &alignp);
        if (sizep <= alignp)
          v18 = alignp;
        else
          v18 = sizep;
        self->_size = v18;
        v19 = malloc_type_calloc(self->_count, v18, 0x1CB310D7uLL);
        self->_addr = v19;
        if (v19)
        {
          self->_decoded = 1;
          if (!self->_count)
            return self;
          v20 = 0;
          while ((_compatDecodeValueOfObjCType((uint64_t)a3, (NSString *)self->_type, (BOOL *)self->_addr + self->_size * v20, sel_decodeArrayOfObjCType_count_at_) & 1) != 0)
          {
            if (++v20 >= self->_count)
              return self;
          }
          v22 = _NSMethodExceptionProem((objc_class *)self, a2);

          if (!objc_msgSend(a3, "error"))
            objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: unable to decode element in array of size (%ld) and count (%ld)"), v22, v11, v8);
        }
        else
        {
          v21 = _NSMethodExceptionProem((objc_class *)self, a2);

          objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99850], 4864, CFSTR("%@: unable to allocate memory for size (%ld) and count (%ld)"), v21, v11, v8);
        }
      }
      else
      {
        v14 = _NSMethodExceptionProem((objc_class *)self, a2);

        objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: unable to decode array with invalid type (%d)"), v14, v13);
      }
    }
  }
  return 0;
}

@end
