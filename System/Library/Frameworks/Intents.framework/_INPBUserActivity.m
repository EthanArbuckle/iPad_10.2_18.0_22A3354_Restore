@implementation _INPBUserActivity

- (void)setData:(id)a3
{
  NSData *v4;
  NSData *data;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  data = self->_data;
  self->_data = v4;

}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setUri:(id)a3
{
  NSString *v4;
  NSString *uri;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  uri = self->_uri;
  self->_uri = v4;

}

- (BOOL)hasUri
{
  return self->_uri != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUserActivityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBUserActivity data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  -[_INPBUserActivity title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBUserActivity uri](self, "uri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (_INPBUserActivity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBUserActivity *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBUserActivity *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBUserActivity *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBUserActivity initWithData:](self, "initWithData:", v6);

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
  -[_INPBUserActivity data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBUserActivity *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[_INPBUserActivity init](+[_INPBUserActivity allocWithZone:](_INPBUserActivity, "allocWithZone:"), "init");
  v6 = (void *)-[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  -[_INPBUserActivity setData:](v5, "setData:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBUserActivity setTitle:](v5, "setTitle:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_uri, "copyWithZone:", a3);
  -[_INPBUserActivity setUri:](v5, "setUri:", v8);

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
  -[_INPBUserActivity data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBUserActivity data](self, "data");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBUserActivity data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBUserActivity title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBUserActivity title](self, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBUserActivity title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBUserActivity uri](self, "uri");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBUserActivity uri](self, "uri");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBUserActivity uri](self, "uri");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uri");
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
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSData hash](self->_data, "hash");
  v4 = -[NSString hash](self->_title, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_uri, "hash");
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
  if (self->_data)
  {
    -[_INPBUserActivity data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("data"));

  }
  if (self->_title)
  {
    -[_INPBUserActivity title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

  }
  if (self->_uri)
  {
    -[_INPBUserActivity uri](self, "uri");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("uri"));

  }
  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)uri
{
  return self->_uri;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
