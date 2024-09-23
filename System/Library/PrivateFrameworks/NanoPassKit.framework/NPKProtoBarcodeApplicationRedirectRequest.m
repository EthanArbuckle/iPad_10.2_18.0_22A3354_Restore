@implementation NPKProtoBarcodeApplicationRedirectRequest

- (BOOL)hasPassData
{
  return self->_passData != 0;
}

- (BOOL)hasTransactionData
{
  return self->_transactionData != 0;
}

- (BOOL)hasAppLaunchToken
{
  return self->_appLaunchToken != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoBarcodeApplicationRedirectRequest;
  -[NPKProtoBarcodeApplicationRedirectRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoBarcodeApplicationRedirectRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *passData;
  NSData *transactionData;
  NSString *appLaunchToken;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passData = self->_passData;
  if (passData)
    objc_msgSend(v3, "setObject:forKey:", passData, CFSTR("passData"));
  transactionData = self->_transactionData;
  if (transactionData)
    objc_msgSend(v4, "setObject:forKey:", transactionData, CFSTR("transactionData"));
  appLaunchToken = self->_appLaunchToken;
  if (appLaunchToken)
    objc_msgSend(v4, "setObject:forKey:", appLaunchToken, CFSTR("appLaunchToken"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoBarcodeApplicationRedirectRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_passData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_transactionData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_appLaunchToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_passData)
  {
    objc_msgSend(v4, "setPassData:");
    v4 = v5;
  }
  if (self->_transactionData)
  {
    objc_msgSend(v5, "setTransactionData:");
    v4 = v5;
  }
  if (self->_appLaunchToken)
  {
    objc_msgSend(v5, "setAppLaunchToken:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_passData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_transactionData, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_appLaunchToken, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *passData;
  NSData *transactionData;
  NSString *appLaunchToken;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((passData = self->_passData, !((unint64_t)passData | v4[2]))
     || -[NSData isEqual:](passData, "isEqual:"))
    && ((transactionData = self->_transactionData, !((unint64_t)transactionData | v4[3]))
     || -[NSData isEqual:](transactionData, "isEqual:")))
  {
    appLaunchToken = self->_appLaunchToken;
    if ((unint64_t)appLaunchToken | v4[1])
      v8 = -[NSString isEqual:](appLaunchToken, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_passData, "hash");
  v4 = -[NSData hash](self->_transactionData, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_appLaunchToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[NPKProtoBarcodeApplicationRedirectRequest setPassData:](self, "setPassData:");
  if (v4[3])
    -[NPKProtoBarcodeApplicationRedirectRequest setTransactionData:](self, "setTransactionData:");
  if (v4[1])
    -[NPKProtoBarcodeApplicationRedirectRequest setAppLaunchToken:](self, "setAppLaunchToken:");

}

- (NSData)passData
{
  return self->_passData;
}

- (void)setPassData:(id)a3
{
  objc_storeStrong((id *)&self->_passData, a3);
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (void)setTransactionData:(id)a3
{
  objc_storeStrong((id *)&self->_transactionData, a3);
}

- (NSString)appLaunchToken
{
  return self->_appLaunchToken;
}

- (void)setAppLaunchToken:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunchToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_appLaunchToken, 0);
}

@end
