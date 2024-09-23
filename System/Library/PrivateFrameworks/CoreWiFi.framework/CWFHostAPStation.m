@implementation CWFHostAPStation

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_BSSID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("bssid"), v15);

  sub_1B06475A8(v3, 0, 1u);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v16, (uint64_t)v19, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)description
{
  uint64_t v2;
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v17, (uint64_t)CFSTR("bssid=%@"), v18, v19, v16);

  return (NSString *)v6;
}

- (BOOL)isEqualToHostAPStation:(id)a3
{
  id v4;
  NSString *BSSID;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char isEqual;

  v4 = a3;
  BSSID = self->_BSSID;
  objc_msgSend_BSSID(v4, v6, v7, v8, v9);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (BSSID == v14)
  {
    isEqual = 1;
  }
  else if (self->_BSSID)
  {
    objc_msgSend_BSSID(v4, v10, v11, v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = self->_BSSID;
      objc_msgSend_BSSID(v4, v15, v16, v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v20, v22, (uint64_t)v21, v23, v24);

    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFHostAPStation *v4;
  CWFHostAPStation *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToHostAPStation;

  v4 = (CWFHostAPStation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToHostAPStation = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToHostAPStation = objc_msgSend_isEqualToHostAPStation_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToHostAPStation = 0;
  }

  return isEqualToHostAPStation;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_hash(self->_BSSID, a2, v2, v3, v4);
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFHostAPStation, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setBSSID_(v11, v12, (uint64_t)self->_BSSID, v13, v14);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_BSSID, (uint64_t)CFSTR("_BSSID"), v3);
}

- (CWFHostAPStation)initWithCoder:(id)a3
{
  id v4;
  CWFHostAPStation *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *BSSID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CWFHostAPStation;
  v5 = -[CWFHostAPStation init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_BSSID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v9;

  }
  return v5;
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BSSID, 0);
}

@end
