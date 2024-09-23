@implementation HKCodableHealthRecordsCode

- (BOOL)hasSystem
{
  return self->_system != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasCode
{
  return self->_code != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
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
  v8.super_class = (Class)HKCodableHealthRecordsCode;
  -[HKCodableHealthRecordsCode description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableHealthRecordsCode dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *system;
  NSString *version;
  NSString *code;
  NSString *displayName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  system = self->_system;
  if (system)
    objc_msgSend(v3, "setObject:forKey:", system, CFSTR("system"));
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKey:", version, CFSTR("version"));
  code = self->_code;
  if (code)
    objc_msgSend(v4, "setObject:forKey:", code, CFSTR("code"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsCodeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_system)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_code)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_displayName)
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
  if (self->_system)
  {
    objc_msgSend(v4, "setSystem:");
    v4 = v5;
  }
  if (self->_version)
  {
    objc_msgSend(v5, "setVersion:");
    v4 = v5;
  }
  if (self->_code)
  {
    objc_msgSend(v5, "setCode:");
    v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_system, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_code, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *system;
  NSString *version;
  NSString *code;
  NSString *displayName;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((system = self->_system, !((unint64_t)system | v4[3]))
     || -[NSString isEqual:](system, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[4]))
     || -[NSString isEqual:](version, "isEqual:"))
    && ((code = self->_code, !((unint64_t)code | v4[1])) || -[NSString isEqual:](code, "isEqual:")))
  {
    displayName = self->_displayName;
    if ((unint64_t)displayName | v4[2])
      v9 = -[NSString isEqual:](displayName, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_system, "hash");
  v4 = -[NSString hash](self->_version, "hash") ^ v3;
  v5 = -[NSString hash](self->_code, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_displayName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[HKCodableHealthRecordsCode setSystem:](self, "setSystem:");
  if (v4[4])
    -[HKCodableHealthRecordsCode setVersion:](self, "setVersion:");
  if (v4[1])
    -[HKCodableHealthRecordsCode setCode:](self, "setCode:");
  if (v4[2])
    -[HKCodableHealthRecordsCode setDisplayName:](self, "setDisplayName:");

}

- (NSString)system
{
  return self->_system;
}

- (void)setSystem:(id)a3
{
  objc_storeStrong((id *)&self->_system, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_storeStrong((id *)&self->_code, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
