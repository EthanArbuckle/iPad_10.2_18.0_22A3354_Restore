@implementation CWFActivity

- (CWFActivity)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CWFActivity *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFActivity;
  v6 = -[CWFActivity init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

  }
  return v6;
}

+ (id)activityWithType:(int64_t)a3 reason:(id)a4
{
  id v5;
  CWFActivity *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  v6 = objc_alloc_init(CWFActivity);
  objc_msgSend_setType_(v6, v7, a3, v8, v9);
  objc_msgSend_setReason_(v6, v10, (uint64_t)v5, v11, v12);

  return v6;
}

+ (id)activityWithType:(int64_t)a3 reason:(id)a4 UUID:(id)a5
{
  id v7;
  id v8;
  CWFActivity *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(CWFActivity);
  objc_msgSend_setType_(v9, v10, a3, v11, v12);
  objc_msgSend_setReason_(v9, v13, (uint64_t)v8, v14, v15);

  if (v7)
    objc_msgSend_setUUID_(v9, v16, (uint64_t)v7, v17, v18);

  return v9;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int64_t type;
  unint64_t timeout;
  NSString *reason;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = (void *)MEMORY[0x1E0CB3940];
  type = self->_type;
  timeout = self->_timeout;
  reason = self->_reason;
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v9, v10, 5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v14, (uint64_t)CFSTR("type=%ld reason=%@ timeout=%lluns uuid=%@"), v15, v16, type, reason, timeout, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isEqualToActivity:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSUUID *UUID;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t type;
  BOOL v25;

  v4 = a3;
  v9 = v4;
  if (self->_UUID)
  {
    objc_msgSend_UUID(v4, v5, v6, v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      UUID = self->_UUID;
      objc_msgSend_UUID(v9, v10, v11, v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(UUID, v17, (uint64_t)v16, v18, v19))
      {
        type = self->_type;
        v25 = type == objc_msgSend_type(v9, v20, v21, v22, v23);
      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  CWFActivity *v4;
  CWFActivity *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToActivity;

  v4 = (CWFActivity *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToActivity = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToActivity = objc_msgSend_isEqualToActivity_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToActivity = 0;
  }

  return isEqualToActivity;
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

  v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_reason, v7, v8, v9, v10) ^ v6 ^ self->_type ^ self->_timeout;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFActivity, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setReason_(v11, v15, (uint64_t)self->_reason, v16, v17);
  objc_msgSend_setType_(v11, v18, self->_type, v19, v20);
  objc_msgSend_setTimeout_(v11, v21, self->_timeout, v22, v23);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id v17;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)UUID, (uint64_t)CFSTR("_UUID"), v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_reason, (uint64_t)CFSTR("_reason"), v9);
  objc_msgSend_encodeInteger_forKey_(v5, v10, self->_type, (uint64_t)CFSTR("_type"), v11);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v12, self->_timeout, v13, v14);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)v17, (uint64_t)CFSTR("_timeout"), v16);

}

- (CWFActivity)initWithCoder:(id)a3
{
  id v4;
  CWFActivity *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *reason;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CWFActivity;
  v5 = -[CWFActivity init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_UUID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_reason"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v14;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v16, (uint64_t)CFSTR("_type"), v17, v18);
    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("_timeout"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeout = objc_msgSend_unsignedLongLongValue(v22, v23, v24, v25, v26);

  }
  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
