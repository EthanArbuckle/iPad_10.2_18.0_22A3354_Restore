@implementation _INPBMediaSubItem

- (void)setAssetInfo:(id)a3
{
  NSString *v4;
  NSString *assetInfo;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  assetInfo = self->_assetInfo;
  self->_assetInfo = v4;

}

- (BOOL)hasAssetInfo
{
  return self->_assetInfo != 0;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMediaSubItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBMediaSubItem assetInfo](self, "assetInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBMediaSubItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

}

- (_INPBMediaSubItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMediaSubItem *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMediaSubItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMediaSubItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMediaSubItem initWithData:](self, "initWithData:", v6);

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
  -[_INPBMediaSubItem data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMediaSubItem *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBMediaSubItem init](+[_INPBMediaSubItem allocWithZone:](_INPBMediaSubItem, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_assetInfo, "copyWithZone:", a3);
  -[_INPBMediaSubItem setAssetInfo:](v5, "setAssetInfo:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBMediaSubItem setIdentifier:](v5, "setIdentifier:", v7);

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBMediaSubItem assetInfo](self, "assetInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBMediaSubItem assetInfo](self, "assetInfo");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBMediaSubItem assetInfo](self, "assetInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBMediaSubItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBMediaSubItem identifier](self, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBMediaSubItem identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_assetInfo, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assetInfo)
  {
    -[_INPBMediaSubItem assetInfo](self, "assetInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetInfo"));

  }
  if (self->_identifier)
  {
    -[_INPBMediaSubItem identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));

  }
  return v3;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
