@implementation _INPBPlatformSupport

- (void)setMinimumOsVersion:(id)a3
{
  NSString *v4;
  NSString *minimumOsVersion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  minimumOsVersion = self->_minimumOsVersion;
  self->_minimumOsVersion = v4;

}

- (BOOL)hasMinimumOsVersion
{
  return self->_minimumOsVersion != 0;
}

- (void)setSupportedPlatform:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_supportedPlatform = a3;
  }
}

- (BOOL)hasSupportedPlatform
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSupportedPlatform:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)supportedPlatformAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E22922A8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedPlatform:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IOS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVOS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WATCHOS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlatformSupportReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_INPBPlatformSupport minimumOsVersion](self, "minimumOsVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_INPBPlatformSupport hasSupportedPlatform](self, "hasSupportedPlatform"))
    PBDataWriterWriteInt32Field();

}

- (_INPBPlatformSupport)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPlatformSupport *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPlatformSupport *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPlatformSupport *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPlatformSupport initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBPlatformSupport data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPlatformSupport *v5;
  void *v6;

  v5 = -[_INPBPlatformSupport init](+[_INPBPlatformSupport allocWithZone:](_INPBPlatformSupport, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_minimumOsVersion, "copyWithZone:", a3);
  -[_INPBPlatformSupport setMinimumOsVersion:](v5, "setMinimumOsVersion:", v6);

  if (-[_INPBPlatformSupport hasSupportedPlatform](self, "hasSupportedPlatform"))
    -[_INPBPlatformSupport setSupportedPlatform:](v5, "setSupportedPlatform:", -[_INPBPlatformSupport supportedPlatform](self, "supportedPlatform"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int supportedPlatform;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBPlatformSupport minimumOsVersion](self, "minimumOsVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumOsVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPlatformSupport minimumOsVersion](self, "minimumOsVersion");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBPlatformSupport minimumOsVersion](self, "minimumOsVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "minimumOsVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBPlatformSupport hasSupportedPlatform](self, "hasSupportedPlatform");
    if (v13 == objc_msgSend(v4, "hasSupportedPlatform"))
    {
      if (!-[_INPBPlatformSupport hasSupportedPlatform](self, "hasSupportedPlatform")
        || !objc_msgSend(v4, "hasSupportedPlatform")
        || (supportedPlatform = self->_supportedPlatform,
            supportedPlatform == objc_msgSend(v4, "supportedPlatform")))
      {
        v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_minimumOsVersion, "hash");
  if (-[_INPBPlatformSupport hasSupportedPlatform](self, "hasSupportedPlatform"))
    v4 = 2654435761 * self->_supportedPlatform;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_minimumOsVersion)
  {
    -[_INPBPlatformSupport minimumOsVersion](self, "minimumOsVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("minimum_os_version"));

  }
  if (-[_INPBPlatformSupport hasSupportedPlatform](self, "hasSupportedPlatform"))
  {
    v6 = -[_INPBPlatformSupport supportedPlatform](self, "supportedPlatform");
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E22922A8[(v6 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("supported_platform"));

  }
  return v3;
}

- (NSString)minimumOsVersion
{
  return self->_minimumOsVersion;
}

- (int)supportedPlatform
{
  return self->_supportedPlatform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumOsVersion, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
