@implementation MEEncodedOutgoingMessage

- (MEEncodedOutgoingMessage)initWithRawData:(NSData *)rawData isSigned:(BOOL)isSigned isEncrypted:(BOOL)isEncrypted
{
  NSData *v9;
  MEEncodedOutgoingMessage *v10;
  MEEncodedOutgoingMessage *v11;
  objc_super v13;

  v9 = rawData;
  v13.receiver = self;
  v13.super_class = (Class)MEEncodedOutgoingMessage;
  v10 = -[MEEncodedOutgoingMessage init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isSigned = isSigned;
    v10->_isEncrypted = isEncrypted;
    objc_storeStrong((id *)&v10->_rawData, rawData);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEEncodedOutgoingMessage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MEEncodedOutgoingMessage *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isSigned"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isEncrypted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_rawData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MEEncodedOutgoingMessage initWithRawData:isSigned:isEncrypted:](self, "initWithRawData:isSigned:isEncrypted:", v7, v5, v6);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[MEEncodedOutgoingMessage isSigned](self, "isSigned"), CFSTR("EFPropertyKey_isSigned"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MEEncodedOutgoingMessage isEncrypted](self, "isEncrypted"), CFSTR("EFPropertyKey_isEncrypted"));
  -[MEEncodedOutgoingMessage rawData](self, "rawData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_rawData"));

}

- (BOOL)isEqual:(id)a3
{
  MEEncodedOutgoingMessage *v4;
  MEEncodedOutgoingMessage *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  void *v10;

  v4 = (MEEncodedOutgoingMessage *)a3;
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
      v6 = -[MEEncodedOutgoingMessage isSigned](self, "isSigned");
      if (v6 == -[MEEncodedOutgoingMessage isSigned](v5, "isSigned")
        && (v7 = -[MEEncodedOutgoingMessage isEncrypted](self, "isEncrypted"),
            v7 == -[MEEncodedOutgoingMessage isEncrypted](v5, "isEncrypted")))
      {
        -[MEEncodedOutgoingMessage rawData](self, "rawData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MEEncodedOutgoingMessage rawData](v5, "rawData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (BOOL)isSigned
{
  return self->_isSigned;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end
