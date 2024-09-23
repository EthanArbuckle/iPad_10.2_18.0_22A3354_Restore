@implementation _INPBRefinementItem

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)hasItem
{
  return self->_item != 0;
}

- (void)setSubKeyPath:(id)a3
{
  NSString *v4;
  NSString *subKeyPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subKeyPath = self->_subKeyPath;
  self->_subKeyPath = v4;

}

- (BOOL)hasSubKeyPath
{
  return self->_subKeyPath != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRefinementItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_INPBRefinementItem item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRefinementItem item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRefinementItem subKeyPath](self, "subKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();

}

- (_INPBRefinementItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRefinementItem *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRefinementItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRefinementItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRefinementItem initWithData:](self, "initWithData:", v6);

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
  -[_INPBRefinementItem data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRefinementItem *v5;
  id v6;
  void *v7;

  v5 = -[_INPBRefinementItem init](+[_INPBRefinementItem allocWithZone:](_INPBRefinementItem, "allocWithZone:"), "init");
  v6 = -[_INPBSelectionItem copyWithZone:](self->_item, "copyWithZone:", a3);
  -[_INPBRefinementItem setItem:](v5, "setItem:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_subKeyPath, "copyWithZone:", a3);
  -[_INPBRefinementItem setSubKeyPath:](v5, "setSubKeyPath:", v7);

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
  -[_INPBRefinementItem item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBRefinementItem item](self, "item");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRefinementItem item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBRefinementItem subKeyPath](self, "subKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRefinementItem subKeyPath](self, "subKeyPath");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBRefinementItem subKeyPath](self, "subKeyPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subKeyPath");
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
  unint64_t v3;

  v3 = -[_INPBSelectionItem hash](self->_item, "hash");
  return -[NSString hash](self->_subKeyPath, "hash") ^ v3;
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
  -[_INPBRefinementItem item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("item"));

  if (self->_subKeyPath)
  {
    -[_INPBRefinementItem subKeyPath](self, "subKeyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("subKeyPath"));

  }
  return v3;
}

- (_INPBSelectionItem)item
{
  return self->_item;
}

- (NSString)subKeyPath
{
  return self->_subKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subKeyPath, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
