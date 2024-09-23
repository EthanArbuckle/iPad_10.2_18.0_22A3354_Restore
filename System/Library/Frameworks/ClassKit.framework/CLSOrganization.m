@implementation CLSOrganization

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSOrganization;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSOrganization)initWithOrganizationID:(id)a3 type:(int64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  CLSOrganization *v10;
  const char *v11;
  CLSOrganization *v12;
  NSArray *locationIDs;
  NSArray *v14;
  NSArray *emailDomains;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CLSOrganization;
  v10 = -[CLSObject _init](&v17, sel__init);
  v12 = v10;
  if (v10)
  {
    objc_msgSend_setObjectID_(v10, v11, (uint64_t)v8);
    objc_storeStrong((id *)&v12->_name, a5);
    v12->_type = a4;
    locationIDs = v12->_locationIDs;
    v14 = (NSArray *)MEMORY[0x1E0C9AA60];
    v12->_locationIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    emailDomains = v12->_emailDomains;
    v12->_emailDomains = v14;

  }
  return v12;
}

- (CLSOrganization)initWithCoder:(id)a3
{
  id v4;
  CLSOrganization *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *name;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *searchText;
  id v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSArray *locationIDs;
  const char *v23;
  uint64_t v24;
  NSArray *emailDomains;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLSOrganization;
  v5 = -[CLSObject initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("type"));
    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("searchText"));
    v13 = objc_claimAutoreleasedReturnValue();
    searchText = v5->_searchText;
    v5->_searchText = (NSString *)v13;

    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v19 = (void *)objc_msgSend_initWithObjects_(v15, v18, v16, v17, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v20, (uint64_t)v19, CFSTR("locationIDs"));
    v21 = objc_claimAutoreleasedReturnValue();
    locationIDs = v5->_locationIDs;
    v5->_locationIDs = (NSArray *)v21;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v19, CFSTR("emailDomains"));
    v24 = objc_claimAutoreleasedReturnValue();
    emailDomains = v5->_emailDomains;
    v5->_emailDomains = (NSArray *)v24;

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
  v10.super_class = (Class)CLSOrganization;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_name, CFSTR("name"), v10.receiver, v10.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_type, CFSTR("type"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_locationIDs, CFSTR("locationIDs"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_emailDomains, CFSTR("emailDomains"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_searchText, CFSTR("searchText"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLSOrganization;
  -[CLSObject mergeWithObject:](&v21, sel_mergeWithObject_, v4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend__propertyNames(CLSOrganization, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v22, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v10, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v16, (uint64_t)v15, v14);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v22, 16);
    }
    while (v11);
  }

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  NSArray *locationIDs;
  NSArray *emailDomains;
  NSString *searchText;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLSOrganization;
  -[CLSObject dictionaryRepresentation](&v18, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_name, CFSTR("name"));
  objc_msgSend_stringForType_(CLSOrganization, v5, self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("type"));

  locationIDs = self->_locationIDs;
  if (locationIDs)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)locationIDs, CFSTR("locationIDs"));
  emailDomains = self->_emailDomains;
  if (emailDomains)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)emailDomains, CFSTR("emailDomains"));
  searchText = self->_searchText;
  if (searchText)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)searchText, CFSTR("searchText"));
  objc_msgSend_dateExpires(self, v8, (uint64_t)searchText);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_dateExpires(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, CFSTR("dateExpires"));

  }
  return v3;
}

+ (id)stringForType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 2)
    v3 = CFSTR("business");
  if (a3 == 1)
    return CFSTR("education");
  else
    return (id)v3;
}

+ (int64_t)typeFromString:(id)a3
{
  const char *v3;
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  int64_t v8;

  v4 = a3;
  if (v4
    && (objc_msgSend_isEqualToString_(&stru_1E974C8A0, v3, (uint64_t)v4) & 1) == 0
    && objc_msgSend_caseInsensitiveCompare_(CFSTR("none"), v5, (uint64_t)v4))
  {
    if ((objc_msgSend_isEqualToString_(CFSTR("education"), v6, (uint64_t)v4) & 1) != 0)
    {
      v8 = 1;
    }
    else if (objc_msgSend_isEqualToString_(CFSTR("business"), v7, (uint64_t)v4))
    {
      v8 = 2;
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
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("name");
  v3[1] = CFSTR("type");
  v3[2] = CFSTR("locationIDs");
  v3[3] = CFSTR("emailDomains");
  v3[4] = CFSTR("searchText");
  v3[5] = CFSTR("dateExpires");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)displayName
{
  return self->_name;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)locationIDs
{
  return self->_locationIDs;
}

- (void)setLocationIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)emailDomains
{
  return self->_emailDomains;
}

- (void)setEmailDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_emailDomains, 0);
  objc_storeStrong((id *)&self->_locationIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
