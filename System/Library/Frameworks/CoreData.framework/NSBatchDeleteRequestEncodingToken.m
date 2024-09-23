@implementation NSBatchDeleteRequestEncodingToken

- (id)initForRequest:(id)a3
{
  NSBatchDeleteRequestEncodingToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSBatchDeleteRequestEncodingToken;
  v4 = -[NSBatchDeleteRequestEncodingToken init](&v6, sel_init);
  if (v4)
  {
    v4->_fetchData = (NSData *)objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "encodeForXPC");
    v4->_resultType = objc_msgSend(a3, "resultType");
    v4->_secure = objc_msgSend(a3, "_secureOperation");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_fetchData = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchDeleteRequestEncodingToken;
  -[NSBatchDeleteRequestEncodingToken dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSBatchDeleteRequestEncodingToken)initWithCoder:(id)a3
{
  NSBatchDeleteRequestEncodingToken *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSBatchDeleteRequestEncodingToken;
  v4 = -[NSBatchDeleteRequestEncodingToken init](&v8, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_fetchData = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("fetch"));
    v4->_resultType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("resultType"));
    v4->_secure = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("secure"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_fetchData, CFSTR("fetch"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_resultType, CFSTR("resultType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_secure, CFSTR("secure"));
}

- (NSData)fetchData
{
  return self->_fetchData;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (BOOL)secure
{
  return self->_secure;
}

@end
