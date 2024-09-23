@implementation CoreUtilsNSSubrangeData

- (CoreUtilsNSSubrangeData)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("[CoreUtilsNSSubrangeData init] should never be called"));

  return 0;
}

- (CoreUtilsNSSubrangeData)initWithData:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  char isKindOfClass;
  NSData *v10;
  NSData *v11;
  NSData *data;
  NSData *v13;
  CoreUtilsNSSubrangeData *v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    self->_range.location = *((_QWORD *)v7 + 2) + location;
    self->_range.length = length;
    v10 = (NSData *)*((id *)v7 + 1);
    v11 = (NSData *)v7;
    data = self->_data;
    self->_data = v10;

  }
  else
  {
    self->_range.location = location;
    self->_range.length = length;
    v13 = (NSData *)v7;
    v11 = self->_data;
    self->_data = v13;
  }

  if (self->_data)
    v14 = self;
  else
    v14 = 0;

  return v14;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CoreUtilsNSSubrangeData;
  -[CoreUtilsNSSubrangeData dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CoreUtilsNSSubrangeData *v4;

  v4 = self;

  return v4;
}

- (const)bytes
{
  return -[NSData bytes](self->_data, "bytes") + self->_range.location;
}

- (unint64_t)length
{
  return self->_range.length;
}

- (void)getBytes:(void *)a3
{
  -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, self->_range.location, self->_range.length);
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  unint64_t length;

  if (self->_range.length >= a4)
    length = a4;
  else
    length = self->_range.length;
  -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, self->_range.location, length);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  char *v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = -[NSData bytes](self->_data, "bytes");
    if (v8)
      memmove(a3, &v8[self->_range.location + location], length);
  }
}

- (BOOL)_isCompact
{
  return -[NSData _isCompact](self->_data, "_isCompact");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
