@implementation BUCellularIdentity

+ (id)identityForSubscription:(id)a3 usingClient:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _BUNullCellularIdentity *v21;
  id v22;
  const char *v23;
  NSObject *v24;
  id v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v10 = v8;
  v11 = 0;
  if (!v7)
    goto LABEL_11;
  if (!v8)
    goto LABEL_11;
  v27 = 0;
  v12 = (void *)objc_msgSend_copySIMIdentity_error_(v8, v9, (uint64_t)v7, &v27);
  v11 = v27;
  if (!v12)
    goto LABEL_11;
  if (objc_msgSend_length(v12, v13, v14))
  {
    v26 = v11;
    objc_msgSend_getDataStatus_error_(v10, v15, (uint64_t)v7, &v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v26;

    v20 = v16 ? objc_msgSend_inHomeCountry(v16, v18, v19) ^ 1 : 0;
    v22 = objc_alloc((Class)a1);
    v21 = (_BUNullCellularIdentity *)objc_msgSend_initWithSIMIdentity_roaming_(v22, v23, (uint64_t)v12, v20);

    v11 = v17;
  }
  else
  {
    v21 = objc_alloc_init(_BUNullCellularIdentity);
  }

  if (!v21)
  {
LABEL_11:
    BookUtilityLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_212E6DF44((uint64_t)v11, v24);

    v21 = objc_alloc_init(_BUNullCellularIdentity);
  }

  return v21;
}

- (BUCellularIdentity)initWithSIMIdentity:(id)a3 roaming:(BOOL)a4
{
  id v7;
  BUCellularIdentity *v8;
  BUCellularIdentity *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSString *defaultsKey;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BUCellularIdentity;
  v8 = -[BUCellularIdentity init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_simIdentity, a3);
    v9->_roaming = a4;
    v10 = (void *)objc_opt_class();
    objc_msgSend_dataUsingEncoding_(v7, v11, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__digestMD5_(v10, v13, (uint64_t)v12);
    v14 = objc_claimAutoreleasedReturnValue();
    defaultsKey = v9->_defaultsKey;
    v9->_defaultsKey = (NSString *)v14;

  }
  return v9;
}

- (id)redactedDescription
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("<BUCellularIdentity %p; sim = <private>; key = %@>"),
               self,
               self->_defaultsKey);
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("<BUCellularIdentity %p; sim = %@; key = %@>"),
               self,
               self->_simIdentity,
               self->_defaultsKey);
}

+ (id)_digestMD5:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const void *v6;
  const char *v7;
  uint64_t v8;
  CC_LONG v9;
  const char *v10;
  const char *v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  unsigned __int8 md[16];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v6 = (const void *)objc_msgSend_bytes(v3, v4, v5);
  v9 = objc_msgSend_length(v3, v7, v8);
  CC_MD5(v6, v9, md);
  objc_msgSend_stringWithCapacity_(MEMORY[0x24BDD16A8], v10, 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
    objc_msgSend_appendFormat_(v12, v11, (uint64_t)CFSTR("%02x"), md[i]);
  v15 = (void *)objc_msgSend_copy(v12, v11, v14);

  return v15;
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (BOOL)isRoaming
{
  return self->_roaming;
}

- (void)setRoaming:(BOOL)a3
{
  self->_roaming = a3;
}

- (NSString)simIdentity
{
  return self->_simIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simIdentity, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
}

@end
