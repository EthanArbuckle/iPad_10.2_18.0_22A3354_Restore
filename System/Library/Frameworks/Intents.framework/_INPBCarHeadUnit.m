@implementation _INPBCarHeadUnit

- (void)setBluetoothIdentifier:(id)a3
{
  NSString *v4;
  NSString *bluetoothIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bluetoothIdentifier = self->_bluetoothIdentifier;
  self->_bluetoothIdentifier = v4;

}

- (BOOL)hasBluetoothIdentifier
{
  return self->_bluetoothIdentifier != 0;
}

- (void)setIAP2Identifier:(id)a3
{
  NSString *v4;
  NSString *iAP2Identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  iAP2Identifier = self->_iAP2Identifier;
  self->_iAP2Identifier = v4;

}

- (BOOL)hasIAP2Identifier
{
  return self->_iAP2Identifier != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCarHeadUnitReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBCarHeadUnit bluetoothIdentifier](self, "bluetoothIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBCarHeadUnit iAP2Identifier](self, "iAP2Identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

}

- (_INPBCarHeadUnit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCarHeadUnit *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCarHeadUnit *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCarHeadUnit *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCarHeadUnit initWithData:](self, "initWithData:", v6);

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
  -[_INPBCarHeadUnit data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCarHeadUnit *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBCarHeadUnit init](+[_INPBCarHeadUnit allocWithZone:](_INPBCarHeadUnit, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_bluetoothIdentifier, "copyWithZone:", a3);
  -[_INPBCarHeadUnit setBluetoothIdentifier:](v5, "setBluetoothIdentifier:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_iAP2Identifier, "copyWithZone:", a3);
  -[_INPBCarHeadUnit setIAP2Identifier:](v5, "setIAP2Identifier:", v7);

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
  -[_INPBCarHeadUnit bluetoothIdentifier](self, "bluetoothIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bluetoothIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBCarHeadUnit bluetoothIdentifier](self, "bluetoothIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCarHeadUnit bluetoothIdentifier](self, "bluetoothIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bluetoothIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBCarHeadUnit iAP2Identifier](self, "iAP2Identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iAP2Identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCarHeadUnit iAP2Identifier](self, "iAP2Identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBCarHeadUnit iAP2Identifier](self, "iAP2Identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iAP2Identifier");
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

  v3 = -[NSString hash](self->_bluetoothIdentifier, "hash");
  return -[NSString hash](self->_iAP2Identifier, "hash") ^ v3;
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
  if (self->_bluetoothIdentifier)
  {
    -[_INPBCarHeadUnit bluetoothIdentifier](self, "bluetoothIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bluetoothIdentifier"));

  }
  if (self->_iAP2Identifier)
  {
    -[_INPBCarHeadUnit iAP2Identifier](self, "iAP2Identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("iAP2Identifier"));

  }
  return v3;
}

- (NSString)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (NSString)iAP2Identifier
{
  return self->_iAP2Identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAP2Identifier, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
