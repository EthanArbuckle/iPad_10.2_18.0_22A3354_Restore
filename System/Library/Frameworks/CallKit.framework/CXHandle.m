@implementation CXHandle

- (CXHandle)initWithType:(CXHandleType)type value:(NSString *)value
{
  NSString *v6;
  CXHandle *v7;
  uint64_t v8;
  NSString *v9;
  objc_super v11;

  v6 = value;
  v11.receiver = self;
  v11.super_class = (Class)CXHandle;
  v7 = -[CXHandle init](&v11, sel_init);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXHandle initWithType:value:]", CFSTR("value"));
    v7->_type = type;
    v8 = -[NSString copy](v6, "copy");
    v9 = v7->_value;
    v7->_value = (NSString *)v8;

  }
  return v7;
}

- (CXHandle)initWithType:(int64_t)a3 value:(id)a4 siriDisplayName:(id)a5
{
  id v8;
  CXHandle *v9;
  uint64_t v10;
  NSString *siriDisplayName;

  v8 = a5;
  v9 = -[CXHandle initWithType:value:](self, "initWithType:value:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    siriDisplayName = v9->_siriDisplayName;
    v9->_siriDisplayName = (NSString *)v10;

  }
  return v9;
}

- (CXHandle)initWithType:(int64_t)a3
{
  CXHandle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXHandle;
  result = -[CXHandle init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (CXHandle)init
{

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (description__pred_TULoggableStringForHandleTelephonyUtilities != -1)
    dispatch_once(&description__pred_TULoggableStringForHandleTelephonyUtilities, &__block_literal_global);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "stringForType:", -[CXHandle type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void (*)(void))description__TULoggableStringForHandle;
  -[CXHandle value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXHandle siriDisplayName](self, "siriDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p type=%@ value=%@ siriDisplayName=%@>"), v4, self, v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void *__23__CXHandle_description__block_invoke()
{
  void *result;

  result = (void *)CUTWeakLinkSymbol();
  description__TULoggableStringForHandle = result;
  return result;
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return off_1E4B88A00[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CXHandle isEqualToHandle:](self, "isEqualToHandle:", v4);

  return v5;
}

- (BOOL)isEqualToHandle:(CXHandle *)handle
{
  CXHandle *v4;
  CXHandleType v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v4 = handle;
  v5 = -[CXHandle type](self, "type");
  if (v5 == -[CXHandle type](v4, "type"))
  {
    -[CXHandle value](self, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    -[CXHandle value](v4, "value");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (v6 | v7) == 0;
    if (v7)
      v8 = objc_msgSend((id)v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  CXHandleType v3;
  void *v4;
  unint64_t v5;

  v3 = -[CXHandle type](self, "type");
  -[CXHandle value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:", -[CXHandle type](self, "type"));
  -[CXHandle value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  -[CXHandle siriDisplayName](self, "siriDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriDisplayName:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  CXHandle *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *value;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *siriDisplayName;

  v4 = a3;
  NSStringFromSelector(sel_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  v7 = -[CXHandle initWithType:](self, "initWithType:", v6);
  if (v7)
  {
    v8 = objc_opt_class();
    NSStringFromSelector(sel_value);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    value = v7->_value;
    v7->_value = (NSString *)v10;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_siriDisplayName);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    siriDisplayName = v7->_siriDisplayName;
    v7->_siriDisplayName = (NSString *)v14;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CXHandleType v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = -[CXHandle type](self, "type");
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[CXHandle value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CXHandle siriDisplayName](self, "siriDisplayName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_siriDisplayName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (CXHandleType)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)siriDisplayName
{
  return self->_siriDisplayName;
}

- (void)setSiriDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_siriDisplayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriDisplayName, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
