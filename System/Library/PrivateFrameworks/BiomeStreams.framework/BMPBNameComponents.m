@implementation BMPBNameComponents

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (BOOL)hasGivenName
{
  return self->_givenName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasPreviousFamilyName
{
  return self->_previousFamilyName != 0;
}

- (BOOL)hasFamilyName
{
  return self->_familyName != 0;
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBNameComponents;
  -[BMPBNameComponents description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBNameComponents dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *namePrefix;
  NSString *givenName;
  NSString *middleName;
  NSString *previousFamilyName;
  NSString *familyName;
  NSString *nameSuffix;
  NSString *nickname;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  namePrefix = self->_namePrefix;
  if (namePrefix)
    objc_msgSend(v3, "setObject:forKey:", namePrefix, CFSTR("namePrefix"));
  givenName = self->_givenName;
  if (givenName)
    objc_msgSend(v4, "setObject:forKey:", givenName, CFSTR("givenName"));
  middleName = self->_middleName;
  if (middleName)
    objc_msgSend(v4, "setObject:forKey:", middleName, CFSTR("middleName"));
  previousFamilyName = self->_previousFamilyName;
  if (previousFamilyName)
    objc_msgSend(v4, "setObject:forKey:", previousFamilyName, CFSTR("previousFamilyName"));
  familyName = self->_familyName;
  if (familyName)
    objc_msgSend(v4, "setObject:forKey:", familyName, CFSTR("familyName"));
  nameSuffix = self->_nameSuffix;
  if (nameSuffix)
    objc_msgSend(v4, "setObject:forKey:", nameSuffix, CFSTR("nameSuffix"));
  nickname = self->_nickname;
  if (nickname)
    objc_msgSend(v4, "setObject:forKey:", nickname, CFSTR("nickname"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNameComponentsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_namePrefix)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_givenName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_middleName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_previousFamilyName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_familyName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nameSuffix)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nickname)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_namePrefix)
  {
    objc_msgSend(v4, "setNamePrefix:");
    v4 = v5;
  }
  if (self->_givenName)
  {
    objc_msgSend(v5, "setGivenName:");
    v4 = v5;
  }
  if (self->_middleName)
  {
    objc_msgSend(v5, "setMiddleName:");
    v4 = v5;
  }
  if (self->_previousFamilyName)
  {
    objc_msgSend(v5, "setPreviousFamilyName:");
    v4 = v5;
  }
  if (self->_familyName)
  {
    objc_msgSend(v5, "setFamilyName:");
    v4 = v5;
  }
  if (self->_nameSuffix)
  {
    objc_msgSend(v5, "setNameSuffix:");
    v4 = v5;
  }
  if (self->_nickname)
  {
    objc_msgSend(v5, "setNickname:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_namePrefix, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_givenName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_previousFamilyName, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSString copyWithZone:](self->_familyName, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  v16 = -[NSString copyWithZone:](self->_nameSuffix, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *namePrefix;
  NSString *givenName;
  NSString *middleName;
  NSString *previousFamilyName;
  NSString *familyName;
  NSString *nameSuffix;
  NSString *nickname;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((namePrefix = self->_namePrefix, !((unint64_t)namePrefix | v4[4]))
     || -[NSString isEqual:](namePrefix, "isEqual:"))
    && ((givenName = self->_givenName, !((unint64_t)givenName | v4[2]))
     || -[NSString isEqual:](givenName, "isEqual:"))
    && ((middleName = self->_middleName, !((unint64_t)middleName | v4[3]))
     || -[NSString isEqual:](middleName, "isEqual:"))
    && ((previousFamilyName = self->_previousFamilyName, !((unint64_t)previousFamilyName | v4[7]))
     || -[NSString isEqual:](previousFamilyName, "isEqual:"))
    && ((familyName = self->_familyName, !((unint64_t)familyName | v4[1]))
     || -[NSString isEqual:](familyName, "isEqual:"))
    && ((nameSuffix = self->_nameSuffix, !((unint64_t)nameSuffix | v4[5]))
     || -[NSString isEqual:](nameSuffix, "isEqual:")))
  {
    nickname = self->_nickname;
    if ((unint64_t)nickname | v4[6])
      v12 = -[NSString isEqual:](nickname, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_namePrefix, "hash");
  v4 = -[NSString hash](self->_givenName, "hash") ^ v3;
  v5 = -[NSString hash](self->_middleName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_previousFamilyName, "hash");
  v7 = -[NSString hash](self->_familyName, "hash");
  v8 = v7 ^ -[NSString hash](self->_nameSuffix, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_nickname, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[BMPBNameComponents setNamePrefix:](self, "setNamePrefix:");
  if (v4[2])
    -[BMPBNameComponents setGivenName:](self, "setGivenName:");
  if (v4[3])
    -[BMPBNameComponents setMiddleName:](self, "setMiddleName:");
  if (v4[7])
    -[BMPBNameComponents setPreviousFamilyName:](self, "setPreviousFamilyName:");
  if (v4[1])
    -[BMPBNameComponents setFamilyName:](self, "setFamilyName:");
  if (v4[5])
    -[BMPBNameComponents setNameSuffix:](self, "setNameSuffix:");
  if (v4[6])
    -[BMPBNameComponents setNickname:](self, "setNickname:");

}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (void)setNamePrefix:(id)a3
{
  objc_storeStrong((id *)&self->_namePrefix, a3);
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

- (NSString)previousFamilyName
{
  return self->_previousFamilyName;
}

- (void)setPreviousFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_previousFamilyName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void)setNameSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_nameSuffix, a3);
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
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end
