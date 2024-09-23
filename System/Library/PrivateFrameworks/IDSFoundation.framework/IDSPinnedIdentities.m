@implementation IDSPinnedIdentities

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPinnedIdentities)initWithCoder:(id)a3
{
  id v4;
  IDSPinnedIdentities *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSData *pushToken;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  NSArray *pinnedIdentityMetadatas;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IDSPinnedIdentities;
  v5 = -[IDSPinnedIdentities init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, CFSTR("PinnedIdentitiesPushToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSData *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v24, v13, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v11, v15, (uint64_t)v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v17, v19, CFSTR("PinnedIdentitiesMetadatas"));
    v20 = objc_claimAutoreleasedReturnValue();
    pinnedIdentityMetadatas = v5->_pinnedIdentityMetadatas;
    v5->_pinnedIdentityMetadatas = (NSArray *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *pushToken;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  pushToken = self->_pushToken;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)pushToken, v6, CFSTR("PinnedIdentitiesPushToken"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_pinnedIdentityMetadatas, v8, CFSTR("PinnedIdentitiesMetadatas"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p; { pushToken: %@, metadatas: %@ }"),
               v6,
               v4,
               self,
               self->_pushToken,
               self->_pinnedIdentityMetadatas);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_debugDescription(self->_pushToken, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(self->_pinnedIdentityMetadatas, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: %p; { pushToken: %@,\n metadatas: %@ }"),
    v14,
    v4,
    self,
    v8,
    v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (NSArray)pinnedIdentityMetadatas
{
  return self->_pinnedIdentityMetadatas;
}

- (void)setPinnedIdentityMetadatas:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedIdentityMetadatas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedIdentityMetadatas, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end
