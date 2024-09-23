@implementation _INPBAppIdentifier

- (void)setAppName:(id)a3
{
  NSString *v4;
  NSString *appName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  appName = self->_appName;
  self->_appName = v4;

}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (void)setBundleVersion:(id)a3
{
  NSString *v4;
  NSString *bundleVersion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleVersion = self->_bundleVersion;
  self->_bundleVersion = v4;

}

- (BOOL)hasBundleVersion
{
  return self->_bundleVersion != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBAppIdentifier appName](self, "appName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBAppIdentifier bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBAppIdentifier bundleVersion](self, "bundleVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (_INPBAppIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAppIdentifier *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAppIdentifier *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAppIdentifier *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAppIdentifier initWithData:](self, "initWithData:", v6);

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
  -[_INPBAppIdentifier data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAppIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[_INPBAppIdentifier init](+[_INPBAppIdentifier allocWithZone:](_INPBAppIdentifier, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  -[_INPBAppIdentifier setAppName:](v5, "setAppName:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  -[_INPBAppIdentifier setBundleIdentifier:](v5, "setBundleIdentifier:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  -[_INPBAppIdentifier setBundleVersion:](v5, "setBundleVersion:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBAppIdentifier appName](self, "appName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBAppIdentifier appName](self, "appName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAppIdentifier appName](self, "appName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBAppIdentifier bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBAppIdentifier bundleIdentifier](self, "bundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAppIdentifier bundleIdentifier](self, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBAppIdentifier bundleVersion](self, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAppIdentifier bundleVersion](self, "bundleVersion");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBAppIdentifier bundleVersion](self, "bundleVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_appName, "hash");
  v4 = -[NSString hash](self->_bundleIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_bundleVersion, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appName)
  {
    -[_INPBAppIdentifier appName](self, "appName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appName"));

  }
  if (self->_bundleIdentifier)
  {
    -[_INPBAppIdentifier bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bundleIdentifier"));

  }
  if (self->_bundleVersion)
  {
    -[_INPBAppIdentifier bundleVersion](self, "bundleVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bundleVersion"));

  }
  return v3;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
