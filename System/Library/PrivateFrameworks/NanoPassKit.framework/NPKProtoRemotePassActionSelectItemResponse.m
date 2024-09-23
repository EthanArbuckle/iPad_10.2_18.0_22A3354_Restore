@implementation NPKProtoRemotePassActionSelectItemResponse

- (id)resultAsString:(int)a3
{
  if (a3 < 5)
    return off_24CFE83C8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResult:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Successful")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reject")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Unsupported")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasIncrementCurrency
{
  return self->_incrementCurrency != 0;
}

- (void)setIncrementAmount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_incrementAmount = a3;
}

- (void)setHasIncrementAmount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIncrementAmount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasServiceProviderDataData
{
  return self->_serviceProviderDataData != 0;
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
  v8.super_class = (Class)NPKProtoRemotePassActionSelectItemResponse;
  -[NPKProtoRemotePassActionSelectItemResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionSelectItemResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t v6;
  __CFString *v7;
  NSString *incrementCurrency;
  void *v9;
  NSData *serviceProviderDataData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestUniqueID = self->_requestUniqueID;
  if (requestUniqueID)
    objc_msgSend(v3, "setObject:forKey:", requestUniqueID, CFSTR("requestUniqueID"));
  v6 = self->_result;
  if (v6 >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_result);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_24CFE83C8[v6];
  }
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("result"));

  incrementCurrency = self->_incrementCurrency;
  if (incrementCurrency)
    objc_msgSend(v4, "setObject:forKey:", incrementCurrency, CFSTR("incrementCurrency"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_incrementAmount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("incrementAmount"));

  }
  serviceProviderDataData = self->_serviceProviderDataData;
  if (serviceProviderDataData)
    objc_msgSend(v4, "setObject:forKey:", serviceProviderDataData, CFSTR("serviceProviderDataData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionSelectItemResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_requestUniqueID)
    -[NPKProtoRemotePassActionSelectItemResponse writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_incrementCurrency)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteSint64Field();
  v5 = v6;
  if (self->_serviceProviderDataData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "setRequestUniqueID:", self->_requestUniqueID);
  v4 = v5;
  v5[8] = self->_result;
  if (self->_incrementCurrency)
  {
    objc_msgSend(v5, "setIncrementCurrency:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_incrementAmount;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_serviceProviderDataData)
  {
    objc_msgSend(v5, "setServiceProviderDataData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestUniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 32) = self->_result;
  v8 = -[NSString copyWithZone:](self->_incrementCurrency, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_incrementAmount;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v10 = -[NSData copyWithZone:](self->_serviceProviderDataData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestUniqueID;
  NSString *incrementCurrency;
  NSData *serviceProviderDataData;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  requestUniqueID = self->_requestUniqueID;
  if ((unint64_t)requestUniqueID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](requestUniqueID, "isEqual:"))
      goto LABEL_14;
  }
  if (self->_result != *((_DWORD *)v4 + 8))
    goto LABEL_14;
  incrementCurrency = self->_incrementCurrency;
  if ((unint64_t)incrementCurrency | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](incrementCurrency, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_incrementAmount != *((_QWORD *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  serviceProviderDataData = self->_serviceProviderDataData;
  if ((unint64_t)serviceProviderDataData | *((_QWORD *)v4 + 5))
    v8 = -[NSData isEqual:](serviceProviderDataData, "isEqual:");
  else
    v8 = 1;
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_requestUniqueID, "hash");
  v4 = self->_result;
  v5 = -[NSString hash](self->_incrementCurrency, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_incrementAmount;
  else
    v6 = 0;
  return (2654435761 * v4) ^ v3 ^ v5 ^ v6 ^ -[NSData hash](self->_serviceProviderDataData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoRemotePassActionSelectItemResponse setRequestUniqueID:](self, "setRequestUniqueID:");
    v4 = v5;
  }
  self->_result = *((_DWORD *)v4 + 8);
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoRemotePassActionSelectItemResponse setIncrementCurrency:](self, "setIncrementCurrency:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_incrementAmount = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NPKProtoRemotePassActionSelectItemResponse setServiceProviderDataData:](self, "setServiceProviderDataData:");
    v4 = v5;
  }

}

- (NSString)requestUniqueID
{
  return self->_requestUniqueID;
}

- (void)setRequestUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUniqueID, a3);
}

- (int)result
{
  return self->_result;
}

- (void)setResult:(int)a3
{
  self->_result = a3;
}

- (NSString)incrementCurrency
{
  return self->_incrementCurrency;
}

- (void)setIncrementCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_incrementCurrency, a3);
}

- (int64_t)incrementAmount
{
  return self->_incrementAmount;
}

- (NSData)serviceProviderDataData
{
  return self->_serviceProviderDataData;
}

- (void)setServiceProviderDataData:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderDataData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderDataData, 0);
  objc_storeStrong((id *)&self->_requestUniqueID, 0);
  objc_storeStrong((id *)&self->_incrementCurrency, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionSelectItemResponse writeTo:]", "NPKProtoRemotePassActionSelectItemResponse.m", 141, "nil != self->_requestUniqueID");
}

@end
