@implementation _NSPersonNameComponentsData

- (NSString)middleName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSPersonNameComponents)phoneticRepresentation
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)nickname
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)nameSuffix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)namePrefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setMiddleName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setNameSuffix:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setNickname:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setNamePrefix:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setPhoneticRepresentation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)givenName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)familyName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (_NSPersonNameComponentsData)init
{
  _NSPersonNameComponentsData *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSPersonNameComponentsData;
  result = -[_NSPersonNameComponentsData init](&v3, sel_init);
  if (result)
  {
    result->_phoneticRepresentation = 0;
    *(_OWORD *)&result->_nameSuffix = 0u;
    *(_OWORD *)&result->_middleName = 0u;
    *(_OWORD *)&result->_givenName = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self)
  {

    self->_givenName = 0;
    self->_familyName = 0;

    self->_middleName = 0;
    self->_namePrefix = 0;

    self->_nameSuffix = 0;
    self->_nickname = 0;

    self->_phoneticRepresentation = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSPersonNameComponentsData;
  -[_NSPersonNameComponentsData dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSPersonNameComponentsData *v5;

  v5 = objc_alloc_init(_NSPersonNameComponentsData);
  v5->_givenName = (NSString *)-[NSString copyWithZone:](self->_givenName, "copyWithZone:", a3);
  v5->_familyName = (NSString *)-[NSString copyWithZone:](self->_familyName, "copyWithZone:", a3);
  v5->_middleName = (NSString *)-[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  v5->_namePrefix = (NSString *)-[NSString copyWithZone:](self->_namePrefix, "copyWithZone:", a3);
  v5->_nameSuffix = (NSString *)-[NSString copyWithZone:](self->_nameSuffix, "copyWithZone:", a3);
  v5->_nickname = (NSString *)-[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  v5->_phoneticRepresentation = (NSPersonNameComponents *)-[NSPersonNameComponents copyWithZone:](self->_phoneticRepresentation, "copyWithZone:", a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersonNameComponentsData)initWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersonNameComponents cannot be decoded by non-keyed archivers"), 0));
  }
  if (self)
  {
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.givenName")))
      self->_givenName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.givenName")), "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.familyName")))
      self->_familyName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.familyName")), "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.middleName")))
      self->_middleName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.middleName")), "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.namePrefix")))
      self->_namePrefix = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.namePrefix")), "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.nameSuffix")))
      self->_nameSuffix = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.nameSuffix")), "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.nickname")))
      self->_nickname = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.nickname")), "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.phoneticRepresentation")))
      self->_phoneticRepresentation = (NSPersonNameComponents *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.phoneticRepresentation")), "copy");
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersonNameComponents cannot be encoded by non-keyed archivers"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->_givenName, CFSTR("NS.givenName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_familyName, CFSTR("NS.familyName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_middleName, CFSTR("NS.middleName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_namePrefix, CFSTR("NS.namePrefix"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_nameSuffix, CFSTR("NS.nameSuffix"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_nickname, CFSTR("NS.nickname"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_phoneticRepresentation, CFSTR("NS.phoneticRepresentation"));
}

@end
