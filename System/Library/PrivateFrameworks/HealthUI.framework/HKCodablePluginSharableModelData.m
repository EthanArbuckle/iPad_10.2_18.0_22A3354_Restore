@implementation HKCodablePluginSharableModelData

- (BOOL)readFrom:(id)a3
{
  return HKCodablePluginSharableModelDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSData)userData
{
  return self->_userData;
}

- (NSString)sourceTimeZoneIdentifier
{
  return self->_sourceTimeZoneIdentifier;
}

- (NSString)sourceLocaleIdentifier
{
  return self->_sourceLocaleIdentifier;
}

- (BOOL)hasUserData
{
  return self->_userData != 0;
}

- (BOOL)hasSourceTimeZoneIdentifier
{
  return self->_sourceTimeZoneIdentifier != 0;
}

- (BOOL)hasSourceLocaleIdentifier
{
  return self->_sourceLocaleIdentifier != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_sourceTimeZoneIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceLocaleIdentifier, 0);
}

- (void)setUserData:(id)a3
{
  objc_storeStrong((id *)&self->_userData, a3);
}

- (void)setSourceTimeZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTimeZoneIdentifier, a3);
}

- (void)setSourceLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceLocaleIdentifier, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_userData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_sourceTimeZoneIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceLocaleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

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
  v8.super_class = (Class)HKCodablePluginSharableModelData;
  -[HKCodablePluginSharableModelData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodablePluginSharableModelData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *userData;
  NSString *sourceTimeZoneIdentifier;
  NSString *sourceLocaleIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  userData = self->_userData;
  if (userData)
    objc_msgSend(v3, "setObject:forKey:", userData, CFSTR("userData"));
  sourceTimeZoneIdentifier = self->_sourceTimeZoneIdentifier;
  if (sourceTimeZoneIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sourceTimeZoneIdentifier, CFSTR("sourceTimeZoneIdentifier"));
  sourceLocaleIdentifier = self->_sourceLocaleIdentifier;
  if (sourceLocaleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sourceLocaleIdentifier, CFSTR("sourceLocaleIdentifier"));
  return v4;
}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_userData)
  {
    objc_msgSend(v4, "setUserData:");
    v4 = v5;
  }
  if (self->_sourceTimeZoneIdentifier)
  {
    objc_msgSend(v5, "setSourceTimeZoneIdentifier:");
    v4 = v5;
  }
  if (self->_sourceLocaleIdentifier)
  {
    objc_msgSend(v5, "setSourceLocaleIdentifier:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_userData, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_sourceTimeZoneIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_sourceLocaleIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *userData;
  NSString *sourceTimeZoneIdentifier;
  NSString *sourceLocaleIdentifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((userData = self->_userData, !((unint64_t)userData | v4[3]))
     || -[NSData isEqual:](userData, "isEqual:"))
    && ((sourceTimeZoneIdentifier = self->_sourceTimeZoneIdentifier,
         !((unint64_t)sourceTimeZoneIdentifier | v4[2]))
     || -[NSString isEqual:](sourceTimeZoneIdentifier, "isEqual:")))
  {
    sourceLocaleIdentifier = self->_sourceLocaleIdentifier;
    if ((unint64_t)sourceLocaleIdentifier | v4[1])
      v8 = -[NSString isEqual:](sourceLocaleIdentifier, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSData hash](self->_userData, "hash");
  v4 = -[NSString hash](self->_sourceTimeZoneIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sourceLocaleIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[HKCodablePluginSharableModelData setUserData:](self, "setUserData:");
  if (v4[2])
    -[HKCodablePluginSharableModelData setSourceTimeZoneIdentifier:](self, "setSourceTimeZoneIdentifier:");
  if (v4[1])
    -[HKCodablePluginSharableModelData setSourceLocaleIdentifier:](self, "setSourceLocaleIdentifier:");

}

@end
