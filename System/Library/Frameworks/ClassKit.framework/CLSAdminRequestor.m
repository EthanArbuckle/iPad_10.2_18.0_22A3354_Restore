@implementation CLSAdminRequestor

+ (id)identifierForRequestorEmail:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_lowercaseString(a3, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sha224(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSAdminRequestor;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSAdminRequestor)initWithEmail:(id)a3
{
  id v5;
  const char *v6;
  CLSAdminRequestor *v7;
  void *v8;
  const char *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSAdminRequestor;
  v7 = -[CLSObject _init](&v11, sel__init);
  if (v7)
  {
    objc_msgSend_identifierForRequestorEmail_(CLSAdminRequestor, v6, (uint64_t)v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjectID_(v7, v9, (uint64_t)v8);

    objc_storeStrong((id *)&v7->_email, a3);
    v7->_state = 1;
  }

  return v7;
}

- (void)reset
{
  const char *v3;
  const char *v4;
  const char *v5;

  objc_msgSend_setState_(self, a2, 1);
  objc_msgSend_setNote_(self, v3, 0);
  objc_msgSend_setVerificationCode_(self, v4, 0);
  objc_msgSend_setServerRequestHeaders_(self, v5, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_msgSend_email(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_copy(v10, v11, v12);
  v15 = (void *)objc_msgSend_initWithEmail_(v7, v14, (uint64_t)v13);

  v18 = objc_msgSend_state(self, v16, v17);
  objc_msgSend_setState_(v15, v19, v18);
  objc_msgSend_verificationCode(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_copy(v22, v23, v24);
  objc_msgSend_setVerificationCode_(v15, v26, (uint64_t)v25);

  objc_msgSend_note(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend_copy(v29, v30, v31);
  objc_msgSend_setNote_(v15, v33, (uint64_t)v32);

  objc_msgSend_serverRequestHeaders(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend_copy(v36, v37, v38);
  objc_msgSend_setServerRequestHeaders_(v15, v40, (uint64_t)v39);

  return v15;
}

- (CLSAdminRequestor)initWithCoder:(id)a3
{
  id v4;
  CLSAdminRequestor *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *email;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *verificationCode;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *note;
  id v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSDictionary *serverRequestHeaders;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLSAdminRequestor;
  v5 = -[CLSObject initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("email"));
    v8 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v8;

    v5->_state = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("state"));
    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("verificationCode"));
    v13 = objc_claimAutoreleasedReturnValue();
    verificationCode = v5->_verificationCode;
    v5->_verificationCode = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("note"));
    v17 = objc_claimAutoreleasedReturnValue();
    note = v5->_note;
    v5->_note = (NSString *)v17;

    v19 = objc_alloc(MEMORY[0x1E0C99E60]);
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v23 = (void *)objc_msgSend_initWithObjects_(v19, v22, v20, v21, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, CFSTR("serverRequestHeaders"));
    v25 = objc_claimAutoreleasedReturnValue();
    serverRequestHeaders = v5->_serverRequestHeaders;
    v5->_serverRequestHeaders = (NSDictionary *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSAdminRequestor;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_email, CFSTR("email"), v10.receiver, v10.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_state, CFSTR("state"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_verificationCode, CFSTR("verificationCode"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_note, CFSTR("note"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_serverRequestHeaders, CFSTR("serverRequestHeaders"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)verificationCode
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_verificationCode;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setVerificationCode:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *verificationCode;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  verificationCode = self->_verificationCode;
  v12 = (id)v8;
  if (v8 | (unint64_t)verificationCode
    && (!v8 || !verificationCode || (objc_msgSend_isEqualToString_(verificationCode, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_verificationCode, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)note
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_note;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setNote:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *note;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  note = self->_note;
  v12 = (id)v8;
  if (v8 | (unint64_t)note
    && (!v8 || !note || (objc_msgSend_isEqualToString_(note, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_note, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)mergeWithObject:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSAdminRequestor;
  -[CLSObject mergeWithObject:](&v22, sel_mergeWithObject_, v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_opt_class();
  objc_msgSend__propertyNames(v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v23, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v11, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v17, (uint64_t)v16, v15);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, v23, 16);
    }
    while (v12);
  }

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *email;
  void *v7;
  const char *v8;
  const char *v9;
  NSString *verificationCode;
  NSString *note;
  NSDictionary *serverRequestHeaders;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSAdminRequestor;
  -[CLSObject dictionaryRepresentation](&v14, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  email = self->_email;
  if (email)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)email, CFSTR("email"));
  objc_msgSend_stringForVerificationState_(CLSAdminRequestor, v4, self->_state);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v8, (uint64_t)v7, CFSTR("state"));

  verificationCode = self->_verificationCode;
  if (verificationCode)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v9, (uint64_t)verificationCode, CFSTR("verificationCode"));
  note = self->_note;
  if (note)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v9, (uint64_t)note, CFSTR("note"));
  serverRequestHeaders = self->_serverRequestHeaders;
  if (serverRequestHeaders)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v9, (uint64_t)serverRequestHeaders, CFSTR("serverRequestHeaders"));
  return v5;
}

+ (id)stringForVerificationState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E974BB40[a3 - 1];
}

+ (int64_t)verificationStateFromString:(id)a3
{
  const char *v3;
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  int64_t v8;
  const char *v10;
  const char *v11;

  v4 = a3;
  if (v4
    && (objc_msgSend_isEqualToString_(&stru_1E974C8A0, v3, (uint64_t)v4) & 1) == 0
    && objc_msgSend_caseInsensitiveCompare_(CFSTR("none"), v5, (uint64_t)v4))
  {
    if ((objc_msgSend_isEqualToString_(CFSTR("unverified"), v6, (uint64_t)v4) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("emailVerificationSent"), v7, (uint64_t)v4) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("emailVerificationFailed"), v10, (uint64_t)v4) & 1) != 0)
    {
      v8 = 3;
    }
    else if (objc_msgSend_isEqualToString_(CFSTR("emailVerified"), v11, (uint64_t)v4))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_propertyNames
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("state");
  v3[1] = CFSTR("email");
  v3[2] = CFSTR("verificationCode");
  v3[3] = CFSTR("note");
  v3[4] = CFSTR("serverRequestHeaders");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)serverRequestHeaders
{
  return self->_serverRequestHeaders;
}

- (void)setServerRequestHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverRequestHeaders, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end
