@implementation NPKProtoStandaloneCreditAccountCredential

- (BOOL)hasPaymentPass
{
  return self->_paymentPass != 0;
}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (void)setCurrentBalance:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_currentBalance = a3;
}

- (void)setHasCurrentBalance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentBalance
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCreditLimit:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creditLimit = a3;
}

- (void)setHasCreditLimit:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreditLimit
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
  v8.super_class = (Class)NPKProtoStandaloneCreditAccountCredential;
  -[NPKProtoStandaloneCreditAccountCredential description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneCreditAccountCredential dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandalonePaymentCredential *paymentCredential;
  void *v5;
  NPKProtoStandalonePaymentPass *paymentPass;
  void *v7;
  NSString *currencyCode;
  char has;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  paymentCredential = self->_paymentCredential;
  if (paymentCredential)
  {
    -[NPKProtoStandalonePaymentCredential dictionaryRepresentation](paymentCredential, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("paymentCredential"));

  }
  paymentPass = self->_paymentPass;
  if (paymentPass)
  {
    -[NPKProtoStandalonePaymentPass dictionaryRepresentation](paymentPass, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("paymentPass"));

  }
  currencyCode = self->_currencyCode;
  if (currencyCode)
    objc_msgSend(v3, "setObject:forKey:", currencyCode, CFSTR("currencyCode"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_currentBalance);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("currentBalance"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_creditLimit);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("creditLimit"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneCreditAccountCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_paymentCredential)
    -[NPKProtoStandaloneCreditAccountCredential writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_paymentPass)
    PBDataWriterWriteSubmessage();
  if (self->_currencyCode)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
  }

}

- (void)copyTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setPaymentCredential:", self->_paymentCredential);
  if (self->_paymentPass)
    objc_msgSend(v5, "setPaymentPass:");
  if (self->_currencyCode)
    objc_msgSend(v5, "setCurrencyCode:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_currentBalance;
    *((_BYTE *)v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_creditLimit;
    *((_BYTE *)v5 + 48) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandalonePaymentCredential copyWithZone:](self->_paymentCredential, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NPKProtoStandalonePaymentPass copyWithZone:](self->_paymentPass, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_currentBalance;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creditLimit;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentCredential *paymentCredential;
  NPKProtoStandalonePaymentPass *paymentPass;
  NSString *currencyCode;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  paymentCredential = self->_paymentCredential;
  if ((unint64_t)paymentCredential | *((_QWORD *)v4 + 4))
  {
    if (!-[NPKProtoStandalonePaymentCredential isEqual:](paymentCredential, "isEqual:"))
      goto LABEL_17;
  }
  paymentPass = self->_paymentPass;
  if ((unint64_t)paymentPass | *((_QWORD *)v4 + 5))
  {
    if (!-[NPKProtoStandalonePaymentPass isEqual:](paymentPass, "isEqual:"))
      goto LABEL_17;
  }
  currencyCode = self->_currencyCode;
  if ((unint64_t)currencyCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](currencyCode, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_currentBalance != *((double *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_creditLimit != *((double *)v4 + 1))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  char has;
  unint64_t v7;
  double currentBalance;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double creditLimit;
  double v14;
  long double v15;
  double v16;

  v3 = -[NPKProtoStandalonePaymentCredential hash](self->_paymentCredential, "hash");
  v4 = -[NPKProtoStandalonePaymentPass hash](self->_paymentPass, "hash");
  v5 = -[NSString hash](self->_currencyCode, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    currentBalance = self->_currentBalance;
    v9 = -currentBalance;
    if (currentBalance >= 0.0)
      v9 = self->_currentBalance;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 1) != 0)
  {
    creditLimit = self->_creditLimit;
    v14 = -creditLimit;
    if (creditLimit >= 0.0)
      v14 = self->_creditLimit;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentCredential *paymentCredential;
  uint64_t v6;
  NPKProtoStandalonePaymentPass *paymentPass;
  uint64_t v8;
  char v9;
  id v10;

  v4 = a3;
  paymentCredential = self->_paymentCredential;
  v6 = *((_QWORD *)v4 + 4);
  v10 = v4;
  if (paymentCredential)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentCredential mergeFrom:](paymentCredential, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandaloneCreditAccountCredential setPaymentCredential:](self, "setPaymentCredential:");
  }
  v4 = v10;
LABEL_7:
  paymentPass = self->_paymentPass;
  v8 = *((_QWORD *)v4 + 5);
  if (paymentPass)
  {
    if (!v8)
      goto LABEL_13;
    -[NPKProtoStandalonePaymentPass mergeFrom:](paymentPass, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[NPKProtoStandaloneCreditAccountCredential setPaymentPass:](self, "setPaymentPass:");
  }
  v4 = v10;
LABEL_13:
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoStandaloneCreditAccountCredential setCurrencyCode:](self, "setCurrencyCode:");
    v4 = v10;
  }
  v9 = *((_BYTE *)v4 + 48);
  if ((v9 & 2) != 0)
  {
    self->_currentBalance = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v9 = *((_BYTE *)v4 + 48);
  }
  if ((v9 & 1) != 0)
  {
    self->_creditLimit = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NPKProtoStandalonePaymentCredential)paymentCredential
{
  return self->_paymentCredential;
}

- (void)setPaymentCredential:(id)a3
{
  objc_storeStrong((id *)&self->_paymentCredential, a3);
}

- (NPKProtoStandalonePaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (double)currentBalance
{
  return self->_currentBalance;
}

- (double)creditLimit
{
  return self->_creditLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandaloneCreditAccountCredential writeTo:]", "NPKProtoStandaloneCreditAccountCredential.m", 177, "self->_paymentCredential != nil");
}

@end
