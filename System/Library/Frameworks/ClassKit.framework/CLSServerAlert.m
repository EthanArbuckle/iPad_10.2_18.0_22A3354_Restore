@implementation CLSServerAlert

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSServerAlert;
  v2 = -[CLSObject _init](&v6, sel__init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)v2[18];
    v2[18] = v3;

  }
  return v2;
}

- (void)setDisplayedCount:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_displayedCount != a3)
  {
    self->_displayedCount = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)displayedCount
{
  uint64_t v2;
  int64_t displayedCount;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  displayedCount = self->_displayedCount;
  objc_msgSend_unlock(self, v5, v6);
  return displayedCount;
}

- (CLSServerAlert)initWithCoder:(id)a3
{
  id v4;
  CLSServerAlert *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSString *title;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSString *message;
  const char *v27;
  uint64_t v28;
  NSDictionary *defaultButtonInfo;
  const char *v30;
  uint64_t v31;
  NSArray *otherButtonInfos;
  const char *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CLSServerAlert;
  v5 = -[CLSObject initWithCoder:](&v35, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v15, v12, v13, v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_alertType = (int)objc_msgSend_decodeInt32ForKey_(v4, v17, (uint64_t)CFSTR("alertType"));
    v5->_displayRoles = (int)objc_msgSend_decodeInt32ForKey_(v4, v18, (uint64_t)CFSTR("displayRoles"));
    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("title"));
    v21 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, CFSTR("message"));
    v25 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v25;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v10, CFSTR("defaultButtonInfo"));
    v28 = objc_claimAutoreleasedReturnValue();
    defaultButtonInfo = v5->_defaultButtonInfo;
    v5->_defaultButtonInfo = (NSDictionary *)v28;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v16, CFSTR("otherButtonInfos"));
    v31 = objc_claimAutoreleasedReturnValue();
    otherButtonInfos = v5->_otherButtonInfos;
    v5->_otherButtonInfos = (NSArray *)v31;

    v5->_displayedCount = (int)objc_msgSend_decodeInt32ForKey_(v4, v33, (uint64_t)CFSTR("displayedCount"));
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
  const char *v10;
  NSArray *otherButtonInfos;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSServerAlert;
  -[CLSObject encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_alertType, CFSTR("alertType"));
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_displayRoles, CFSTR("displayRoles"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_message, CFSTR("message"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_defaultButtonInfo, CFSTR("defaultButtonInfo"));
  otherButtonInfos = self->_otherButtonInfos;
  if (otherButtonInfos)
    objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)otherButtonInfos, CFSTR("otherButtonInfos"));
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_displayedCount, CFSTR("displayedCount"));

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
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  NSArray *otherButtonInfos;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSServerAlert;
  -[CLSObject dictionaryRepresentation](&v19, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v4, self->_alertType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)v5, CFSTR("alertType"));

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, self->_displayRoles);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, CFSTR("displayRoles"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)self->_message, CFSTR("message"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v12, self->_displayedCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, CFSTR("displayedCount"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)self->_defaultButtonInfo, CFSTR("defaultButtonInfo"));
  otherButtonInfos = self->_otherButtonInfos;
  if (otherButtonInfos)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)otherButtonInfos, CFSTR("otherButtonInfos"));
  return v3;
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(int64_t)a3
{
  self->_alertType = a3;
}

- (int64_t)displayRoles
{
  return self->_displayRoles;
}

- (void)setDisplayRoles:(int64_t)a3
{
  self->_displayRoles = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)defaultButtonInfo
{
  return self->_defaultButtonInfo;
}

- (void)setDefaultButtonInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)otherButtonInfos
{
  return self->_otherButtonInfos;
}

- (void)setOtherButtonInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherButtonInfos, 0);
  objc_storeStrong((id *)&self->_defaultButtonInfo, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
