@implementation WCMessageRequest

- (WCMessageRequest)initWithPairingID:(id)a3 identifier:(id)a4 data:(id)a5 dictionaryMessage:(BOOL)a6 expectsResponse:(BOOL)a7
{
  WCMessageRequest *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WCMessageRequest;
  result = -[WCMessage initWithPairingID:identifier:data:dictionaryMessage:](&v9, sel_initWithPairingID_identifier_data_dictionaryMessage_, a3, a4, a5, a6);
  if (result)
    result->_expectsResponse = a7;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCMessageRequest;
  v4 = a3;
  -[WCMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_expectsResponse, CFSTR("expectsResponse"), v5.receiver, v5.super_class);

}

- (WCMessageRequest)initWithCoder:(id)a3
{
  id v4;
  WCMessageRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WCMessageRequest;
  v5 = -[WCMessage initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_expectsResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("expectsResponse"));

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
  const char *v10;
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
  if (-[WCMessage isDictionaryMessage](self, "isDictionaryMessage"))
    v10 = "YES";
  else
    v10 = "NO";
  if (-[WCMessageRequest expectsResponse](self, "expectsResponse"))
    v11 = "YES";
  else
    v11 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, pairingID: %@, identifier: %@, dataLength: %lu, isDictionary:%s, expectsResponse: %s>"), v5, self, v6, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCMessageRequest;
  return -[WCMessage isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCMessageRequest;
  return -[WCMessage hash](&v3, sel_hash);
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

@end
