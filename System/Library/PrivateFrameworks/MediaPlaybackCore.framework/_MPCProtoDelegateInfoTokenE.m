@implementation _MPCProtoDelegateInfoTokenE

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoDelegateInfoTokenE;
  -[_MPCProtoDelegateInfoTokenE description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoDelegateInfoTokenE dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *playerDelegateInfoData;
  NSString *storefront;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  playerDelegateInfoData = self->_playerDelegateInfoData;
  if (playerDelegateInfoData)
    objc_msgSend(v3, "setObject:forKey:", playerDelegateInfoData, CFSTR("playerDelegateInfoData"));
  storefront = self->_storefront;
  if (storefront)
    objc_msgSend(v4, "setObject:forKey:", storefront, CFSTR("storefront"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_expirationDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("expirationDate"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sessionID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("sessionID"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoDelegateInfoTokenEReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_playerDelegateInfoData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_storefront)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_playerDelegateInfoData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_storefront, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_expirationDate;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_sessionID;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *playerDelegateInfoData;
  NSString *storefront;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  playerDelegateInfoData = self->_playerDelegateInfoData;
  if ((unint64_t)playerDelegateInfoData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](playerDelegateInfoData, "isEqual:"))
      goto LABEL_15;
  }
  storefront = self->_storefront;
  if ((unint64_t)storefront | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](storefront, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_sessionID != *((_QWORD *)v4 + 2))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double expirationDate;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  v3 = -[NSData hash](self->_playerDelegateInfoData, "hash");
  v4 = -[NSString hash](self->_storefront, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    expirationDate = self->_expirationDate;
    v8 = -expirationDate;
    if (expirationDate >= 0.0)
      v8 = self->_expirationDate;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
    v11 = 2654435761u * self->_sessionID;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_playerDelegateInfoData, 0);
}

- (uint64_t)setExpirationDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 40) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setSessionID:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 40) |= 2u;
    *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

- (void)setPlayerDelegateInfoData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setStorefront:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)playerDelegateInfoData
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)storefront
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (double)expirationDate
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)sessionID
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

@end
