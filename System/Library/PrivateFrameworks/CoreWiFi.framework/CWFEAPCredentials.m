@implementation CWFEAPCredentials

- (void)dealloc
{
  void *TLSIdentityHandle;
  objc_super v4;

  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle)
    CFRelease(TLSIdentityHandle);
  v4.receiver = self;
  v4.super_class = (Class)CWFEAPCredentials;
  -[CWFEAPCredentials dealloc](&v4, sel_dealloc);
}

- (__SecIdentity)TLSIdentity
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __SecIdentity *result;
  CFTypeRef arg;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  arg = 0;
  if (!self->_TLSIdentityHandle)
    return 0;
  if (!qword_1EEEB8148)
  {
    v8 = xmmword_1E6133A80;
    v9 = 0;
    qword_1EEEB8148 = _sl_dlopen();
  }
  if (!qword_1EEEB8148)
    return 0;
  sub_1B0674004((uint64_t)self->_TLSIdentityHandle, (const char *)&arg, v2, v3, v4);
  result = (__SecIdentity *)arg;
  if (arg)
    return (__SecIdentity *)CFAutorelease(arg);
  return result;
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *TLSIdentityHandle;
  void *v8;

  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle)
    CFRelease(TLSIdentityHandle);
  if (!a3)
    goto LABEL_8;
  if (!qword_1EEEB8148)
    qword_1EEEB8148 = _sl_dlopen();
  if (qword_1EEEB8148)
    sub_1B06741D0((uint64_t)a3, a2, (uint64_t)a3, v3, v4);
  else
LABEL_8:
    v8 = 0;
  self->_TLSIdentityHandle = v8;
}

- (void)TLSIdentityHandle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  result = (void *)objc_msgSend_TLSIdentity(self, a2, v2, v3, v4);
  if (result)
  {
    v10 = result;
    if (!qword_1EEEB8148)
      qword_1EEEB8148 = _sl_dlopen();
    if (qword_1EEEB8148)
    {
      sub_1B06741D0((uint64_t)v10, v6, v7, v8, v9);
      if (result)
        return (void *)CFAutorelease(result);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setTLSIdentityHandle:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *TLSIdentityHandle;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle != a3)
  {
    cf = 0;
    if (a3)
    {
      if (!qword_1EEEB8148)
      {
        v12 = xmmword_1E6133A80;
        v13 = 0;
        qword_1EEEB8148 = _sl_dlopen();
      }
      if (qword_1EEEB8148)
      {
        sub_1B0674004((uint64_t)a3, (const char *)&cf, (uint64_t)a3, v3, v4);
        if (cf)
        {
          objc_msgSend_setTLSIdentity_(self, v8, (uint64_t)cf, v9, v10);
          CFRelease(cf);
        }
        return;
      }
      TLSIdentityHandle = self->_TLSIdentityHandle;
    }
    if (TLSIdentityHandle)
      CFRelease(TLSIdentityHandle);
    self->_TLSIdentityHandle = 0;
  }
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("hasUsername=%d, hasPassword=%d, hasIdentity=%d"), v2, v3, self->_username != 0, self->_password != 0, self->_TLSIdentityHandle != 0);
}

- (BOOL)isEqualToEAPCredentials:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  const void *v16;
  void *TLSIdentityHandle;
  char isEqual;
  NSString *username;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *password;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSString *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v52;

  v6 = a3;
  v15 = (const void *)objc_msgSend_TLSIdentity(v6, v7, v8, v9, v10);
  if (v15)
  {
    if (!qword_1EEEB8148)
      qword_1EEEB8148 = _sl_dlopen();
    if (qword_1EEEB8148)
    {
      sub_1B06741D0((uint64_t)v15, v11, v12, v13, v14);
      v15 = v16;
    }
    else
    {
      v15 = 0;
    }
  }
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle == v15)
    goto LABEL_11;
  isEqual = 0;
  if (v15 && TLSIdentityHandle)
  {
    if (!CFEqual(TLSIdentityHandle, v15))
    {
      isEqual = 0;
      goto LABEL_26;
    }
LABEL_11:
    username = self->_username;
    objc_msgSend_username(v6, v11, v12, v13, v14);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (username != v24)
    {
      if (!self->_username
        || (objc_msgSend_username(v6, v20, v21, v22, v23), (v25 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        isEqual = 0;
        goto LABEL_24;
      }
      v3 = (void *)v25;
      v30 = self->_username;
      objc_msgSend_username(v6, v26, v27, v28, v29);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(v30, v31, (uint64_t)v4, v32, v33))
      {
        isEqual = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    password = self->_password;
    objc_msgSend_password(v6, v20, v21, v22, v23);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    isEqual = password == v39;
    if (!isEqual && self->_password)
    {
      objc_msgSend_password(v6, v35, v36, v37, v38);
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
      {

        isEqual = 0;
LABEL_22:
        if (username != v24)
          goto LABEL_23;
LABEL_24:

        goto LABEL_25;
      }
      v45 = (void *)v40;
      v46 = self->_password;
      objc_msgSend_password(v6, v41, v42, v43, v44);
      v52 = v4;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v46, v48, (uint64_t)v47, v49, v50);

      v4 = v52;
    }

    goto LABEL_22;
  }
LABEL_25:
  if (v15)
LABEL_26:
    CFRelease(v15);

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFEAPCredentials *v4;
  CWFEAPCredentials *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToEAPCredentials;

  v4 = (CWFEAPCredentials *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToEAPCredentials = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToEAPCredentials = objc_msgSend_isEqualToEAPCredentials_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToEAPCredentials = 0;
  }

  return isEqualToEAPCredentials;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFHashCode TLSIdentityHandle;

  v6 = objc_msgSend_hash(self->_username, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_password, v7, v8, v9, v10);
  TLSIdentityHandle = (CFHashCode)self->_TLSIdentityHandle;
  if (TLSIdentityHandle)
    TLSIdentityHandle = CFHash((CFTypeRef)TLSIdentityHandle);
  return v11 ^ v6 ^ TLSIdentityHandle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFEAPCredentials, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUsername_(v11, v12, (uint64_t)self->_username, v13, v14);
  objc_msgSend_setPassword_(v11, v15, (uint64_t)self->_password, v16, v17);
  v22 = objc_msgSend_TLSIdentity(self, v18, v19, v20, v21);
  objc_msgSend_setTLSIdentity_(v11, v23, v22, v24, v25);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *username;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  username = self->_username;
  v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)username, (uint64_t)CFSTR("_username"), v6);
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_password, (uint64_t)CFSTR("_password"), v8);
  objc_msgSend_encodeObject_forKey_(v11, v9, (uint64_t)self->_TLSIdentityHandle, (uint64_t)CFSTR("_TLSIdentityHandle"), v10);

}

- (CWFEAPCredentials)initWithCoder:(id)a3
{
  id v4;
  CWFEAPCredentials *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *username;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *password;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CWFEAPCredentials;
  v5 = -[CWFEAPCredentials init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_username"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_password"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v14;

    objc_msgSend_decodePropertyListForKey_(v4, v16, (uint64_t)CFSTR("_TLSIdentityHandle"), v17, v18);
    v5->_TLSIdentityHandle = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
