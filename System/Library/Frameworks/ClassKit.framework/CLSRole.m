@implementation CLSRole

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSRole;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSRole)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSRole *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSArray *privileges;
  const char *v15;
  const char *v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLSRole;
  v6 = -[CLSObject initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_type = (int)objc_msgSend_decodeInt32ForKey_(v4, v5, (uint64_t)CFSTR("roleType"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, CFSTR("privileges"));
    v13 = objc_claimAutoreleasedReturnValue();
    privileges = v6->_privileges;
    v6->_privileges = (NSArray *)v13;

    v6->_sourceType = (int)objc_msgSend_decodeInt32ForKey_(v4, v15, (uint64_t)CFSTR("source"));
    v6->_isEditable = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("isEditable"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSRole;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInt32_forKey_(v4, v5, LODWORD(self->_type), CFSTR("roleType"), v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_privileges, CFSTR("privileges"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_sourceType, CFSTR("isEditable"));
  objc_msgSend_encodeBool_forKey_(v4, v8, self->_isEditable, CFSTR("isEditable"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  NSArray *privileges;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSRole;
  -[CLSObject dictionaryRepresentation](&v15, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForRoleType_(CLSRole, v4, self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)v5, CFSTR("type"));

  privileges = self->_privileges;
  if (privileges)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)privileges, CFSTR("privileges"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, self->_sourceType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("source"));

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v11, self->_isEditable);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, CFSTR("isEditable"));

  return v3;
}

+ (id)stringForRoleType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return CFSTR("unknown");
  else
    return off_1E974BD28[a3];
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)privileges
{
  return self->_privileges;
}

- (void)setPrivileges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privileges, 0);
}

@end
