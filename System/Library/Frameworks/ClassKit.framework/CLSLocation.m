@implementation CLSLocation

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSLocation;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSLocation)initWithLocationID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  CLSLocation *v8;
  const char *v9;
  CLSLocation *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSLocation;
  v8 = -[CLSObject _init](&v12, sel__init);
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setObjectID_(v8, v9, (uint64_t)v6);
    objc_storeStrong((id *)&v10->_locationName, a4);
  }

  return v10;
}

- (CLSLocation)initWithCoder:(id)a3
{
  id v4;
  CLSLocation *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *locationName;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *searchText;
  const char *v14;
  const char *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLSLocation;
  v5 = -[CLSObject initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("locationName"));
    v8 = objc_claimAutoreleasedReturnValue();
    locationName = v5->_locationName;
    v5->_locationName = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("searchText"));
    v12 = objc_claimAutoreleasedReturnValue();
    searchText = v5->_searchText;
    v5->_searchText = (NSString *)v12;

    v5->_sourceType = (int)objc_msgSend_decodeInt32ForKey_(v4, v14, (uint64_t)CFSTR("source"));
    v5->_isEditable = objc_msgSend_decodeInt32ForKey_(v4, v15, (uint64_t)CFSTR("isEditable")) != 0;
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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSLocation;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_locationName, CFSTR("locationName"), v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_searchText, CFSTR("searchText"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_sourceType, CFSTR("source"));
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_isEditable, CFSTR("isEditable"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayName
{
  return self->_locationName;
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
  void *v11;
  const char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSLocation;
  -[CLSObject dictionaryRepresentation](&v14, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (self->_locationName)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_locationName, CFSTR("locationName"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)&stru_1E974C8A0, CFSTR("locationName"));
  if (self->_searchText)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v6, (uint64_t)self->_searchText, CFSTR("searchText"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v5, v6, (uint64_t)&stru_1E974C8A0, CFSTR("searchText"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, self->_sourceType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v9, (uint64_t)v8, CFSTR("source"));

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, self->_isEditable);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v12, (uint64_t)v11, CFSTR("isEditable"));

  return v5;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
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
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
}

@end
