@implementation CKDPUserPrivacySettingsUpdateRequest

+ (id)options
{
  if (qword_1ED700A30 != -1)
    dispatch_once(&qword_1ED700A30, &unk_1E7834DD8);
  return (id)qword_1ED700A28;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasUserPrivacySettings
{
  return self->_userPrivacySettings != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserPrivacySettingsUpdateRequest;
  -[CKDPUserPrivacySettingsUpdateRequest description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  NSString *bundleIdentifier;
  CKDPUserPrivacySettings *userPrivacySettings;
  void *v9;
  const char *v10;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)bundleIdentifier, CFSTR("bundleIdentifier"));
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettings, v5, (uint64_t)bundleIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("userPrivacySettings"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB66244((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_userPrivacySettings)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 16;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *bundleIdentifier;
  CKDPUserPrivacySettings *userPrivacySettings;
  id v8;

  v4 = a3;
  bundleIdentifier = self->_bundleIdentifier;
  v8 = v4;
  if (bundleIdentifier)
  {
    objc_msgSend_setBundleIdentifier_(v4, v5, (uint64_t)bundleIdentifier);
    v4 = v8;
  }
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings)
  {
    objc_msgSend_setUserPrivacySettings_(v8, v5, (uint64_t)userPrivacySettings);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_bundleIdentifier, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_userPrivacySettings, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *bundleIdentifier;
  uint64_t v9;
  CKDPUserPrivacySettings *userPrivacySettings;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((bundleIdentifier = self->_bundleIdentifier, v9 = v4[1], !((unint64_t)bundleIdentifier | v9))
     || objc_msgSend_isEqual_(bundleIdentifier, v7, v9)))
  {
    userPrivacySettings = self->_userPrivacySettings;
    v11 = v4[2];
    if ((unint64_t)userPrivacySettings | v11)
      isEqual = objc_msgSend_isEqual_(userPrivacySettings, v7, v11);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_bundleIdentifier, a2, v2);
  return objc_msgSend_hash(self->_userPrivacySettings, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  CKDPUserPrivacySettings *userPrivacySettings;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4[1];
  v8 = v4;
  if (v5)
  {
    objc_msgSend_setBundleIdentifier_(self, (const char *)v4, v5);
    v4 = v8;
  }
  userPrivacySettings = self->_userPrivacySettings;
  v7 = v4[2];
  if (userPrivacySettings)
  {
    if (v7)
    {
      objc_msgSend_mergeFrom_(userPrivacySettings, (const char *)v4, v7);
LABEL_8:
      v4 = v8;
    }
  }
  else if (v7)
  {
    objc_msgSend_setUserPrivacySettings_(self, (const char *)v4, v7);
    goto LABEL_8;
  }

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (CKDPUserPrivacySettings)userPrivacySettings
{
  return self->_userPrivacySettings;
}

- (void)setUserPrivacySettings:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrivacySettings, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
