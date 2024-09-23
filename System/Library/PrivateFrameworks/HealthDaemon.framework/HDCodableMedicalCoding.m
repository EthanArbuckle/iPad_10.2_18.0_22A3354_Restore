@implementation HDCodableMedicalCoding

- (BOOL)hasCodingSystem
{
  return self->_codingSystem != 0;
}

- (BOOL)hasCodingVersion
{
  return self->_codingVersion != 0;
}

- (BOOL)hasCode
{
  return self->_code != 0;
}

- (BOOL)hasDisplayString
{
  return self->_displayString != 0;
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
  v8.super_class = (Class)HDCodableMedicalCoding;
  -[HDCodableMedicalCoding description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalCoding dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *codingSystem;
  NSString *codingVersion;
  NSString *code;
  NSString *displayString;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  codingSystem = self->_codingSystem;
  if (codingSystem)
    objc_msgSend(v3, "setObject:forKey:", codingSystem, CFSTR("codingSystem"));
  codingVersion = self->_codingVersion;
  if (codingVersion)
    objc_msgSend(v4, "setObject:forKey:", codingVersion, CFSTR("codingVersion"));
  code = self->_code;
  if (code)
    objc_msgSend(v4, "setObject:forKey:", code, CFSTR("code"));
  displayString = self->_displayString;
  if (displayString)
    objc_msgSend(v4, "setObject:forKey:", displayString, CFSTR("displayString"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicalCodingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_codingSystem)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_codingVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_code)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_displayString)
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
  if (self->_codingSystem)
  {
    objc_msgSend(v4, "setCodingSystem:");
    v4 = v5;
  }
  if (self->_codingVersion)
  {
    objc_msgSend(v5, "setCodingVersion:");
    v4 = v5;
  }
  if (self->_code)
  {
    objc_msgSend(v5, "setCode:");
    v4 = v5;
  }
  if (self->_displayString)
  {
    objc_msgSend(v5, "setDisplayString:");
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
  v6 = -[NSString copyWithZone:](self->_codingSystem, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_codingVersion, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_code, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_displayString, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *codingSystem;
  NSString *codingVersion;
  NSString *code;
  NSString *displayString;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((codingSystem = self->_codingSystem, !((unint64_t)codingSystem | v4[2]))
     || -[NSString isEqual:](codingSystem, "isEqual:"))
    && ((codingVersion = self->_codingVersion, !((unint64_t)codingVersion | v4[3]))
     || -[NSString isEqual:](codingVersion, "isEqual:"))
    && ((code = self->_code, !((unint64_t)code | v4[1])) || -[NSString isEqual:](code, "isEqual:")))
  {
    displayString = self->_displayString;
    if ((unint64_t)displayString | v4[4])
      v9 = -[NSString isEqual:](displayString, "isEqual:");
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

  v3 = -[NSString hash](self->_codingSystem, "hash");
  v4 = -[NSString hash](self->_codingVersion, "hash") ^ v3;
  v5 = -[NSString hash](self->_code, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_displayString, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[HDCodableMedicalCoding setCodingSystem:](self, "setCodingSystem:");
  if (v4[3])
    -[HDCodableMedicalCoding setCodingVersion:](self, "setCodingVersion:");
  if (v4[1])
    -[HDCodableMedicalCoding setCode:](self, "setCode:");
  if (v4[4])
    -[HDCodableMedicalCoding setDisplayString:](self, "setDisplayString:");

}

- (NSString)codingSystem
{
  return self->_codingSystem;
}

- (void)setCodingSystem:(id)a3
{
  objc_storeStrong((id *)&self->_codingSystem, a3);
}

- (NSString)codingVersion
{
  return self->_codingVersion;
}

- (void)setCodingVersion:(id)a3
{
  objc_storeStrong((id *)&self->_codingVersion, a3);
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_storeStrong((id *)&self->_code, a3);
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_codingVersion, 0);
  objc_storeStrong((id *)&self->_codingSystem, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
