@implementation CKOperationGroupSystemImposedInfoConfiguration

- (void)setIsUplink:(BOOL)a3
{
  self->_isUplink = a3;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)isEqual:(id)a3
{
  CKOperationGroupSystemImposedInfoConfiguration *v4;
  CKOperationGroupSystemImposedInfoConfiguration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isUplink;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = (CKOperationGroupSystemImposedInfoConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isUplink = objc_msgSend_isUplink(v5, v6, v7, v8);
      if (isUplink == objc_msgSend_isUplink(self, v10, v11, v12))
      {
        v17 = objc_msgSend_allowsCellularAccess(v5, v13, v14, v15);
        v16 = v17 ^ objc_msgSend_allowsCellularAccess(self, v18, v19, v20) ^ 1;
      }
      else
      {
        LOBYTE(v16) = 0;
      }

    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend_isUplink(self, a2, v2, v3))
    v8 = 2;
  else
    v8 = 0;
  return v8 | objc_msgSend_allowsCellularAccess(self, v5, v6, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t isUplink;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  isUplink = objc_msgSend_isUplink(self, v5, v6, v7);
  objc_msgSend_encodeBool_forKey_(v15, v9, isUplink, (uint64_t)CFSTR("IsUplink"));
  v13 = objc_msgSend_allowsCellularAccess(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v15, v14, v13, (uint64_t)CFSTR("AllowsCellularAccess"));
  objc_autoreleasePoolPop(v4);

}

- (CKOperationGroupSystemImposedInfoConfiguration)initWithCoder:(id)a3
{
  id v4;
  CKOperationGroupSystemImposedInfoConfiguration *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKOperationGroupSystemImposedInfoConfiguration;
  v5 = -[CKOperationGroupSystemImposedInfoConfiguration init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v5->_isUplink = objc_msgSend_decodeBoolForKey_(v4, v7, (uint64_t)CFSTR("IsUplink"), v8);
    v5->_allowsCellularAccess = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("AllowsCellularAccess"), v10);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (BOOL)isUplink
{
  return self->_isUplink;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

@end
