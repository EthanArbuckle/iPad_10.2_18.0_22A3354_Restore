@implementation INCarHeadUnit

- (INCarHeadUnit)initWithBluetoothIdentifier:(NSString *)bluetoothIdentifier iAP2Identifier:(NSString *)iAP2Identifier
{
  NSString *v6;
  NSString *v7;
  INCarHeadUnit *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = bluetoothIdentifier;
  v7 = iAP2Identifier;
  v14.receiver = self;
  v14.super_class = (Class)INCarHeadUnit;
  v8 = -[INCarHeadUnit init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_bluetoothIdentifier;
    v8->_bluetoothIdentifier = (NSString *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_iAP2Identifier;
    v8->_iAP2Identifier = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_bluetoothIdentifier, "hash");
  return -[NSString hash](self->_iAP2Identifier, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INCarHeadUnit *v4;
  INCarHeadUnit *v5;
  NSString *bluetoothIdentifier;
  NSString *iAP2Identifier;
  BOOL v8;

  v4 = (INCarHeadUnit *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      bluetoothIdentifier = self->_bluetoothIdentifier;
      v8 = 0;
      if (bluetoothIdentifier == v5->_bluetoothIdentifier
        || -[NSString isEqual:](bluetoothIdentifier, "isEqual:"))
      {
        iAP2Identifier = self->_iAP2Identifier;
        if (iAP2Identifier == v5->_iAP2Identifier || -[NSString isEqual:](iAP2Identifier, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INCarHeadUnit)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  INCarHeadUnit *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("bluetoothIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("iAP2Identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[INCarHeadUnit initWithBluetoothIdentifier:iAP2Identifier:](self, "initWithBluetoothIdentifier:iAP2Identifier:", v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bluetoothIdentifier;
  id v5;

  bluetoothIdentifier = self->_bluetoothIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bluetoothIdentifier, CFSTR("bluetoothIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iAP2Identifier, CFSTR("iAP2Identifier"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_bluetoothIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("bluetoothIdentifier"));

  objc_msgSend(v6, "encodeObject:", self->_iAP2Identifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("iAP2Identifier"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCarHeadUnit descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INCarHeadUnit;
  -[INCarHeadUnit description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCarHeadUnit _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *bluetoothIdentifier;
  void *v4;
  NSString *iAP2Identifier;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("bluetoothIdentifier");
  bluetoothIdentifier = self->_bluetoothIdentifier;
  v4 = bluetoothIdentifier;
  if (!bluetoothIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("iAP2Identifier");
  v10[0] = v4;
  iAP2Identifier = self->_iAP2Identifier;
  v6 = iAP2Identifier;
  if (!iAP2Identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!iAP2Identifier)
  {

    if (bluetoothIdentifier)
      return v7;
LABEL_9:

    return v7;
  }
  if (!bluetoothIdentifier)
    goto LABEL_9;
  return v7;
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

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bluetoothIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iAP2Identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBluetoothIdentifier:iAP2Identifier:", v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
