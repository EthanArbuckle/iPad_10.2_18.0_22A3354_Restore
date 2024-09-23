@implementation _NSDispatchData

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (BOOL)_isDispatchData
{
  return 1;
}

- (id)_createDispatchData
{
  dispatch_retain(&self->super.super);
  return self;
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  NSString *v10;
  NSString *v11;
  unint64_t v12;
  NSString *v13;
  uint64_t v14;
  _QWORD applier[7];
  _QWORD v16[5];
  NSRange v17;
  NSRange v18;

  v16[4] = *MEMORY[0x1E0C80C00];
  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v9 = -[NSData length](self, "length");
    if (__CFADD__(length, location))
    {
      v10 = _NSMethodExceptionProem((objc_class *)self, a2);
      v17.location = location;
      v17.length = length;
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v10, NSStringFromRange(v17), v14);
    }
    else
    {
      if (location + length <= v9)
      {
        v16[0] = 0;
        v16[1] = v16;
        v16[2] = 0x2020000000;
        v16[3] = a3;
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __34___NSDispatchData_getBytes_range___block_invoke;
        applier[3] = &unk_1E0F55FE8;
        applier[5] = location;
        applier[6] = length;
        applier[4] = v16;
        dispatch_data_apply(&self->super.super, applier);
        _Block_object_dispose(v16, 8);
        return;
      }
      v12 = v9;
      v13 = _NSMethodExceptionProem((objc_class *)self, a2);
      v18.location = location;
      v18.length = length;
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ exceeds data length %lu"), v13, NSStringFromRange(v18), v12);
    }
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v11, 0));
  }
}

- (void)enumerateByteRangesUsingBlock:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49___NSDispatchData_enumerateByteRangesUsingBlock___block_invoke;
  v3[3] = &unk_1E0F55FC0;
  v3[4] = a3;
  dispatch_data_apply(&self->super.super, v3);
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v7;
  NSString *v9;
  NSString *v10;
  unint64_t v11;
  NSString *v12;
  uint64_t v13;
  NSRange v14;
  NSRange v15;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    v7 = -[NSData length](self, "length");
    if (__CFADD__(length, location))
    {
      v9 = _NSMethodExceptionProem((objc_class *)self, a2);
      v14.location = location;
      v14.length = length;
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ causes integer overflow"), v9, NSStringFromRange(v14), v13);
    }
    else
    {
      if (location + length <= v7)
        return dispatch_data_create_subrange(&self->super.super, location, length);
      v11 = v7;
      v12 = _NSMethodExceptionProem((objc_class *)self, a2);
      v15.location = location;
      v15.length = length;
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: range %@ exceeds data length %lu"), v12, NSStringFromRange(v15), v11);
    }
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v10, 0));
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3.location);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  xpc_object_t v5;
  size_t v6;
  void *v7;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = xpc_data_create_with_dispatch_data(&self->super.super);
      objc_msgSend(a3, "encodeXPCObject:forKey:", v5, CFSTR("NS.xpcdata"));
      xpc_release(v5);
    }
    else
    {
      v6 = -[NSData length](self, "length");
      if (-[NSData _isCompact](self, "_isCompact"))
      {
        objc_msgSend(a3, "encodeBytes:length:forKey:", -[NSData bytes](self, "bytes"), v6, CFSTR("NS.bytes"));
      }
      else
      {
        v7 = malloc_type_malloc(v6, 0x44867618uLL);
        -[_NSDispatchData getBytes:length:](self, "getBytes:length:", v7, v6);
        objc_msgSend(a3, "encodeBytes:length:forKey:", v7, v6, CFSTR("NS.bytes"));
        free(v7);
      }
    }
  }
  else
  {
    objc_msgSend(a3, "encodeDataObject:", self);
  }
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  unint64_t v4;

  v4 = a4;
  if (-[NSData length](self, "length") < a4)
    v4 = -[NSData length](self, "length");
  -[_NSDispatchData getBytes:range:](self, "getBytes:range:", a3, 0, v4);
}

- (void)getBytes:(void *)a3
{
  -[_NSDispatchData getBytes:range:](self, "getBytes:range:", a3, 0, dispatch_data_get_size(&self->super.super));
}

- (unint64_t)hash
{
  size_t size;
  _BOOL8 v4;
  unint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _QWORD applier[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  size = dispatch_data_get_size(&self->super.super);
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __23___NSDispatchData_hash__block_invoke;
  applier[3] = &unk_1E0F56010;
  applier[4] = &v13;
  applier[5] = size;
  v4 = dispatch_data_apply(&self->super.super, applier);
  v5 = v14[3];
  if (!v5)
  {
    if (size >= 0x50)
      size = 80;
    *(_QWORD *)&v6 = MEMORY[0x1E0C80A78](v4).n128_u64[0];
    -[_NSDispatchData getBytes:range:](self, "getBytes:range:", (char *)&applier[-1] - v7, 0, size, v6);
    v8 = CFHashBytes();
    v9 = v14;
    v14[3] = v8;
    v5 = v9[3];
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSDispatchData)initWithCoder:(id)a3
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Decoding an _NSDispatchData directly is not allowed"), 0));
}

@end
