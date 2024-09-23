@implementation AFSiriPhoneticContactNames

- (id)spokenName
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (-[NSString length](self->_givenName, "length") && -[NSString length](self->_familyName, "length"))
  {
    AFRingtoneLocalizedString(CFSTR("SPOKEN_CONTACT_FULL"), self->_languageCode);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v3, self->_givenName, self->_familyName);

  }
  else
  {
    v4 = 0;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v5 = -[NSString copy](self->_givenName, "copy");

    v4 = (void *)v5;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v6 = -[NSString copy](self->_familyName, "copy");

    v4 = (void *)v6;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v7 = -[NSString copy](self->_nickname, "copy");

    v4 = (void *)v7;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v8 = -[NSString copy](self->_middleName, "copy");

    v4 = (void *)v8;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v9 = -[NSString copy](self->_organizationName, "copy");

    v4 = (void *)v9;
  }
  if (objc_msgSend(v4, "length"))
    v10 = v4;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end
