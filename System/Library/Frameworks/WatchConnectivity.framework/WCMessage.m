@implementation WCMessage

- (WCMessage)initWithPairingID:(id)a3 identifier:(id)a4 data:(id)a5 dictionaryMessage:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  WCMessage *v13;
  uint64_t v14;
  NSString *pairingID;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSData *data;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WCMessage;
  v13 = -[WCMessage init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    pairingID = v13->_pairingID;
    v13->_pairingID = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    data = v13->_data;
    v13->_data = (NSData *)v18;

    v13->_dictionaryMessage = a6;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *pairingID;
  id v5;

  pairingID = self->_pairingID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pairingID, CFSTR("pairingID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dictionaryMessage, CFSTR("dictionaryMessage"));

}

- (WCMessage)initWithCoder:(id)a3
{
  id v4;
  WCMessage *v5;
  void *v6;
  uint64_t v7;
  NSString *pairingID;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSData *data;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WCMessage;
  v5 = -[WCMessage init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    pairingID = v5->_pairingID;
    v5->_pairingID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    data = v5->_data;
    v5->_data = (NSData *)v13;

    v5->_dictionaryMessage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dictionaryMessage"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  const char *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCMessage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCMessage identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCMessage data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = -[WCMessage isDictionaryMessage](self, "isDictionaryMessage");
  v11 = "NO";
  if (v10)
    v11 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, pairingID: %@, identifier: %@, dataLength: %lu, dictionaryMessage: %s>"), v5, self, v6, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  WCMessage *v4;
  WCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (WCMessage *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WCMessage pairingID](self, "pairingID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCMessage pairingID](v5, "pairingID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[WCMessage identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WCMessage identifier](v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WCMessage pairingID](self, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WCMessage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)pairingID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDictionaryMessage
{
  return self->_dictionaryMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end
