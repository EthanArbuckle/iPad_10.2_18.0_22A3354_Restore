@implementation CKSettingsMeCardSharingNameProvider

+ (id)nameProviderForNickname:(id)a3
{
  id v3;
  CKSettingsMeCardSharingNameProvider *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CKSettingsMeCardSharingNameProvider);
    if (v4)
    {
      objc_msgSend(v3, "firstName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSettingsMeCardSharingNameProvider setGivenName:](v4, "setGivenName:", v5);

      objc_msgSend(v3, "lastName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSettingsMeCardSharingNameProvider setFamilyName:](v4, "setFamilyName:", v6);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_givenName, a3);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->_middleName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end
