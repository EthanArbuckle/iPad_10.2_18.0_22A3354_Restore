@implementation NPKProtoRemotePassActionEnterValueRequest

- (BOOL)hasPaymentPassActionData
{
  return self->_paymentPassActionData != 0;
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
  v8.super_class = (Class)NPKProtoRemotePassActionEnterValueRequest;
  -[NPKProtoRemotePassActionEnterValueRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnterValueRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestUniqueID;
  NSString *balanceIdentifier;
  NSString *balanceLabel;
  NSString *currentBalanceCurrency;
  void *v9;
  NSData *paymentPassActionData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestUniqueID = self->_requestUniqueID;
  if (requestUniqueID)
    objc_msgSend(v3, "setObject:forKey:", requestUniqueID, CFSTR("requestUniqueID"));
  balanceIdentifier = self->_balanceIdentifier;
  if (balanceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", balanceIdentifier, CFSTR("balanceIdentifier"));
  balanceLabel = self->_balanceLabel;
  if (balanceLabel)
    objc_msgSend(v4, "setObject:forKey:", balanceLabel, CFSTR("balanceLabel"));
  currentBalanceCurrency = self->_currentBalanceCurrency;
  if (currentBalanceCurrency)
    objc_msgSend(v4, "setObject:forKey:", currentBalanceCurrency, CFSTR("currentBalanceCurrency"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_currentBalanceAmount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("currentBalanceAmount"));

  paymentPassActionData = self->_paymentPassActionData;
  if (paymentPassActionData)
    objc_msgSend(v4, "setObject:forKey:", paymentPassActionData, CFSTR("paymentPassActionData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionEnterValueRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_requestUniqueID)
    -[NPKProtoRemotePassActionEnterValueRequest writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_balanceIdentifier)
    -[NPKProtoRemotePassActionEnterValueRequest writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (!self->_balanceLabel)
    -[NPKProtoRemotePassActionEnterValueRequest writeTo:].cold.3();
  PBDataWriterWriteStringField();
  if (!self->_currentBalanceCurrency)
    -[NPKProtoRemotePassActionEnterValueRequest writeTo:].cold.4();
  PBDataWriterWriteStringField();
  PBDataWriterWriteSint64Field();
  if (self->_paymentPassActionData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _QWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "setRequestUniqueID:", self->_requestUniqueID);
  objc_msgSend(v5, "setBalanceIdentifier:", self->_balanceIdentifier);
  objc_msgSend(v5, "setBalanceLabel:", self->_balanceLabel);
  objc_msgSend(v5, "setCurrentBalanceCurrency:", self->_currentBalanceCurrency);
  v4 = v5;
  v5[1] = self->_currentBalanceAmount;
  if (self->_paymentPassActionData)
  {
    objc_msgSend(v5, "setPaymentPassActionData:");
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestUniqueID, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSString copyWithZone:](self->_balanceIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_balanceLabel, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_currentBalanceCurrency, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v5[1] = self->_currentBalanceAmount;
  v14 = -[NSData copyWithZone:](self->_paymentPassActionData, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestUniqueID;
  NSString *balanceIdentifier;
  NSString *balanceLabel;
  NSString *currentBalanceCurrency;
  NSData *paymentPassActionData;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestUniqueID = self->_requestUniqueID, !((unint64_t)requestUniqueID | v4[6]))
     || -[NSString isEqual:](requestUniqueID, "isEqual:"))
    && ((balanceIdentifier = self->_balanceIdentifier, !((unint64_t)balanceIdentifier | v4[2]))
     || -[NSString isEqual:](balanceIdentifier, "isEqual:"))
    && ((balanceLabel = self->_balanceLabel, !((unint64_t)balanceLabel | v4[3]))
     || -[NSString isEqual:](balanceLabel, "isEqual:"))
    && ((currentBalanceCurrency = self->_currentBalanceCurrency, !((unint64_t)currentBalanceCurrency | v4[4]))
     || -[NSString isEqual:](currentBalanceCurrency, "isEqual:"))
    && self->_currentBalanceAmount == v4[1])
  {
    paymentPassActionData = self->_paymentPassActionData;
    if ((unint64_t)paymentPassActionData | v4[5])
      v10 = -[NSData isEqual:](paymentPassActionData, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_requestUniqueID, "hash");
  v4 = -[NSString hash](self->_balanceIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_balanceLabel, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_currentBalanceCurrency, "hash");
  v7 = 2654435761 * self->_currentBalanceAmount;
  return v6 ^ -[NSData hash](self->_paymentPassActionData, "hash") ^ v7;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;

  v4 = (int64_t *)a3;
  if (v4[6])
    -[NPKProtoRemotePassActionEnterValueRequest setRequestUniqueID:](self, "setRequestUniqueID:");
  if (v4[2])
    -[NPKProtoRemotePassActionEnterValueRequest setBalanceIdentifier:](self, "setBalanceIdentifier:");
  if (v4[3])
    -[NPKProtoRemotePassActionEnterValueRequest setBalanceLabel:](self, "setBalanceLabel:");
  if (v4[4])
    -[NPKProtoRemotePassActionEnterValueRequest setCurrentBalanceCurrency:](self, "setCurrentBalanceCurrency:");
  self->_currentBalanceAmount = v4[1];
  if (v4[5])
    -[NPKProtoRemotePassActionEnterValueRequest setPaymentPassActionData:](self, "setPaymentPassActionData:");

}

- (NSString)requestUniqueID
{
  return self->_requestUniqueID;
}

- (void)setRequestUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUniqueID, a3);
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void)setBalanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_balanceIdentifier, a3);
}

- (NSString)balanceLabel
{
  return self->_balanceLabel;
}

- (void)setBalanceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_balanceLabel, a3);
}

- (NSString)currentBalanceCurrency
{
  return self->_currentBalanceCurrency;
}

- (void)setCurrentBalanceCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalanceCurrency, a3);
}

- (int64_t)currentBalanceAmount
{
  return self->_currentBalanceAmount;
}

- (void)setCurrentBalanceAmount:(int64_t)a3
{
  self->_currentBalanceAmount = a3;
}

- (NSData)paymentPassActionData
{
  return self->_paymentPassActionData;
}

- (void)setPaymentPassActionData:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPassActionData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUniqueID, 0);
  objc_storeStrong((id *)&self->_paymentPassActionData, 0);
  objc_storeStrong((id *)&self->_currentBalanceCurrency, 0);
  objc_storeStrong((id *)&self->_balanceLabel, 0);
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueRequest writeTo:]", "NPKProtoRemotePassActionEnterValueRequest.m", 127, "nil != self->_requestUniqueID");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueRequest writeTo:]", "NPKProtoRemotePassActionEnterValueRequest.m", 132, "nil != self->_balanceIdentifier");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueRequest writeTo:]", "NPKProtoRemotePassActionEnterValueRequest.m", 137, "nil != self->_balanceLabel");
}

- (void)writeTo:.cold.4()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueRequest writeTo:]", "NPKProtoRemotePassActionEnterValueRequest.m", 142, "nil != self->_currentBalanceCurrency");
}

@end
