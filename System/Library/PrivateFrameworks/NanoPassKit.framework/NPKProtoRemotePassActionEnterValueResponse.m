@implementation NPKProtoRemotePassActionEnterValueResponse

- (id)resultAsString:(int)a3
{
  if (a3 < 5)
    return off_24CFEC500[a3];
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassActionEnterValueResponse;
  -[NPKProtoRemotePassActionEnterValueResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnterValueResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
    v7 = off_24CFEC500[v6];
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
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionEnterValueResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_requestUniqueID)
    -[NPKProtoRemotePassActionEnterValueResponse writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_incrementCurrency)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteSint64Field();

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
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

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
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestUniqueID;
  NSString *incrementCurrency;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  requestUniqueID = self->_requestUniqueID;
  if ((unint64_t)requestUniqueID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](requestUniqueID, "isEqual:"))
      goto LABEL_11;
  }
  if (self->_result != *((_DWORD *)v4 + 8))
    goto LABEL_11;
  incrementCurrency = self->_incrementCurrency;
  if ((unint64_t)incrementCurrency | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](incrementCurrency, "isEqual:"))
      goto LABEL_11;
  }
  v7 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_incrementAmount == *((_QWORD *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_12;
    }
LABEL_11:
    v7 = 0;
  }
LABEL_12:

  return v7;
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
  return (2654435761 * v4) ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoRemotePassActionEnterValueResponse setRequestUniqueID:](self, "setRequestUniqueID:");
    v4 = v5;
  }
  self->_result = *((_DWORD *)v4 + 8);
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoRemotePassActionEnterValueResponse setIncrementCurrency:](self, "setIncrementCurrency:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_incrementAmount = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUniqueID, 0);
  objc_storeStrong((id *)&self->_incrementCurrency, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueResponse writeTo:]", "NPKProtoRemotePassActionEnterValueResponse.m", 126, "nil != self->_requestUniqueID");
}

@end
