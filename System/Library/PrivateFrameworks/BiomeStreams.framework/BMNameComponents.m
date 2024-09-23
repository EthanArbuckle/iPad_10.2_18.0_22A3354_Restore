@implementation BMNameComponents

- (BMNameComponents)initWithNamePrefix:(id)a3 givenName:(id)a4 middleName:(id)a5 previousFamilyName:(id)a6 familyName:(id)a7 nameSuffix:(id)a8 nickname:(id)a9
{
  id v16;
  id v17;
  BMNameComponents *v18;
  BMNameComponents *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMNameComponents;
  v18 = -[BMNameComponents init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_namePrefix, a3);
    objc_storeStrong((id *)&v19->_givenName, a4);
    objc_storeStrong((id *)&v19->_middleName, a5);
    objc_storeStrong((id *)&v19->_previousFamilyName, a6);
    objc_storeStrong((id *)&v19->_familyName, a7);
    objc_storeStrong((id *)&v19->_nameSuffix, a8);
    objc_storeStrong((id *)&v19->_nickname, a9);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *namePrefix;
  void *v7;
  NSString *givenName;
  void *v9;
  NSString *middleName;
  void *v11;
  NSString *previousFamilyName;
  void *v13;
  NSString *familyName;
  NSString *nameSuffix;
  void *v16;
  NSString *nickname;
  void *v18;
  BOOL v19;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    namePrefix = self->_namePrefix;
    objc_msgSend(v5, "namePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", namePrefix, v7))
    {
      givenName = self->_givenName;
      objc_msgSend(v5, "givenName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", givenName, v9))
      {
        middleName = self->_middleName;
        objc_msgSend(v5, "middleName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", middleName, v11))
        {
          previousFamilyName = self->_previousFamilyName;
          objc_msgSend(v5, "previousFamilyName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", previousFamilyName, v13))
          {
            familyName = self->_familyName;
            objc_msgSend(v5, "familyName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", familyName))
            {
              nameSuffix = self->_nameSuffix;
              objc_msgSend(v5, "nameSuffix");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", nameSuffix, v16))
              {
                nickname = self->_nickname;
                objc_msgSend(v5, "nickname");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = +[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", nickname, v18);

              }
              else
              {
                v19 = 0;
              }

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMNameComponents proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMNameComponents)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BMNameComponents *v13;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "namePrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "middleName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previousFamilyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nameSuffix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nickname");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[BMNameComponents initWithNamePrefix:givenName:middleName:previousFamilyName:familyName:nameSuffix:nickname:](self, "initWithNamePrefix:givenName:middleName:previousFamilyName:familyName:nameSuffix:nickname:", v6, v7, v8, v9, v10, v11, v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BMNameComponents)initWithProtoData:(id)a3
{
  id v4;
  BMPBNameComponents *v5;
  BMNameComponents *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBNameComponents initWithData:]([BMPBNameComponents alloc], "initWithData:", v4);

    self = -[BMNameComponents initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[BMNameComponents namePrefix](self, "namePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNamePrefix:", v4);

  -[BMNameComponents givenName](self, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v5);

  -[BMNameComponents middleName](self, "middleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMiddleName:", v6);

  -[BMNameComponents previousFamilyName](self, "previousFamilyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviousFamilyName:", v7);

  -[BMNameComponents familyName](self, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v8);

  -[BMNameComponents nameSuffix](self, "nameSuffix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNameSuffix:", v9);

  -[BMNameComponents nickname](self, "nickname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNickname:", v10);

  return v3;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)previousFamilyName
{
  return self->_previousFamilyName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
}

@end
