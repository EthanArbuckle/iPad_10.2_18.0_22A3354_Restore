@implementation NPKProtoSecureElementSetNewAuthRandomResponse

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCryptogram
{
  return self->_cryptogram != 0;
}

- (BOOL)hasChallengeResponse
{
  return self->_challengeResponse != 0;
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
  v8.super_class = (Class)NPKProtoSecureElementSetNewAuthRandomResponse;
  -[NPKProtoSecureElementSetNewAuthRandomResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSecureElementSetNewAuthRandomResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSData *cryptogram;
  NSData *challengeResponse;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pending"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_success);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("success"));

  }
  cryptogram = self->_cryptogram;
  if (cryptogram)
    objc_msgSend(v3, "setObject:forKey:", cryptogram, CFSTR("cryptogram"));
  challengeResponse = self->_challengeResponse;
  if (challengeResponse)
    objc_msgSend(v3, "setObject:forKey:", challengeResponse, CFSTR("challengeResponse"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSecureElementSetNewAuthRandomResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_cryptogram)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_challengeResponse)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[24] = self->_pending;
    v4[28] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[25] = self->_success;
    v4[28] |= 2u;
  }
  v6 = v4;
  if (self->_cryptogram)
  {
    objc_msgSend(v4, "setCryptogram:");
    v4 = v6;
  }
  if (self->_challengeResponse)
  {
    objc_msgSend(v6, "setChallengeResponse:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[24] = self->_pending;
    v5[28] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[25] = self->_success;
    v5[28] |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_cryptogram, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = -[NSData copyWithZone:](self->_challengeResponse, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *cryptogram;
  NSData *challengeResponse;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_22;
    if (self->_pending)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) != 0)
    {
      if (self->_success)
      {
        if (!*((_BYTE *)v4 + 25))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_18;
    }
LABEL_22:
    v7 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 28) & 2) != 0)
    goto LABEL_22;
LABEL_18:
  cryptogram = self->_cryptogram;
  if ((unint64_t)cryptogram | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](cryptogram, "isEqual:"))
    goto LABEL_22;
  challengeResponse = self->_challengeResponse;
  if ((unint64_t)challengeResponse | *((_QWORD *)v4 + 1))
    v7 = -[NSData isEqual:](challengeResponse, "isEqual:");
  else
    v7 = 1;
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_pending;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_success;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSData hash](self->_cryptogram, "hash");
  return v5 ^ -[NSData hash](self->_challengeResponse, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  char v5;
  _BYTE *v6;

  v4 = a3;
  v5 = v4[28];
  if ((v5 & 1) != 0)
  {
    self->_pending = v4[24];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[28];
  }
  if ((v5 & 2) != 0)
  {
    self->_success = v4[25];
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoSecureElementSetNewAuthRandomResponse setCryptogram:](self, "setCryptogram:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoSecureElementSetNewAuthRandomResponse setChallengeResponse:](self, "setChallengeResponse:");
    v4 = v6;
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (BOOL)success
{
  return self->_success;
}

- (NSData)cryptogram
{
  return self->_cryptogram;
}

- (void)setCryptogram:(id)a3
{
  objc_storeStrong((id *)&self->_cryptogram, a3);
}

- (NSData)challengeResponse
{
  return self->_challengeResponse;
}

- (void)setChallengeResponse:(id)a3
{
  objc_storeStrong((id *)&self->_challengeResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cryptogram, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
}

@end
