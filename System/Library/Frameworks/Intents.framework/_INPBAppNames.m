@implementation _INPBAppNames

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

- (void)setAxSpokenName:(id)a3
{
  NSString *v4;
  NSString *axSpokenName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  axSpokenName = self->_axSpokenName;
  self->_axSpokenName = v4;

}

- (BOOL)hasAxSpokenName
{
  return self->_axSpokenName != 0;
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->_displayName;
  self->_displayName = v4;

}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setSpotlightName:(id)a3
{
  NSString *v4;
  NSString *spotlightName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  spotlightName = self->_spotlightName;
  self->_spotlightName = v4;

}

- (BOOL)hasSpotlightName
{
  return self->_spotlightName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppNamesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_INPBAppNames appName](self, "appName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBAppNames axSpokenName](self, "axSpokenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBAppNames displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBAppNames spotlightName](self, "spotlightName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (_INPBAppNames)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAppNames *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAppNames *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAppNames *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAppNames initWithData:](self, "initWithData:", v6);

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
  -[_INPBAppNames data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAppNames *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[_INPBAppNames init](+[_INPBAppNames allocWithZone:](_INPBAppNames, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  -[_INPBAppNames setAppName:](v5, "setAppName:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_axSpokenName, "copyWithZone:", a3);
  -[_INPBAppNames setAxSpokenName:](v5, "setAxSpokenName:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  -[_INPBAppNames setDisplayName:](v5, "setDisplayName:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_spotlightName, "copyWithZone:", a3);
  -[_INPBAppNames setSpotlightName:](v5, "setSpotlightName:", v9);

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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBAppNames appName](self, "appName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBAppNames appName](self, "appName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAppNames appName](self, "appName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBAppNames axSpokenName](self, "axSpokenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axSpokenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBAppNames axSpokenName](self, "axSpokenName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAppNames axSpokenName](self, "axSpokenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axSpokenName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBAppNames displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBAppNames displayName](self, "displayName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBAppNames displayName](self, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBAppNames spotlightName](self, "spotlightName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spotlightName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAppNames spotlightName](self, "spotlightName");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBAppNames spotlightName](self, "spotlightName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spotlightName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_appName, "hash");
  v4 = -[NSString hash](self->_axSpokenName, "hash") ^ v3;
  v5 = -[NSString hash](self->_displayName, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_spotlightName, "hash");
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
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appName)
  {
    -[_INPBAppNames appName](self, "appName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("app_name"));

  }
  if (self->_axSpokenName)
  {
    -[_INPBAppNames axSpokenName](self, "axSpokenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ax_spoken_name"));

  }
  if (self->_displayName)
  {
    -[_INPBAppNames displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("display_name"));

  }
  if (self->_spotlightName)
  {
    -[_INPBAppNames spotlightName](self, "spotlightName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("spotlight_name"));

  }
  return v3;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)axSpokenName
{
  return self->_axSpokenName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)spotlightName
{
  return self->_spotlightName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_axSpokenName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
