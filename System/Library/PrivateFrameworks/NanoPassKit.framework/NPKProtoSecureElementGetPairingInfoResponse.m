@implementation NPKProtoSecureElementGetPairingInfoResponse

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasCryptogram
{
  return self->_cryptogram != 0;
}

- (BOOL)hasChallengeResponse
{
  return self->_challengeResponse != 0;
}

- (void)setAuthRandomSet:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_authRandomSet = a3;
}

- (void)setHasAuthRandomSet:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthRandomSet
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
  v8.super_class = (Class)NPKProtoSecureElementGetPairingInfoResponse;
  -[NPKProtoSecureElementGetPairingInfoResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSecureElementGetPairingInfoResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pending"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_authRandomSet);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("authRandomSet"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSecureElementGetPairingInfoResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_cryptogram)
    PBDataWriterWriteDataField();
  if (self->_challengeResponse)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[25] = self->_pending;
    v4[28] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[26] = self->_success;
    v4[28] |= 4u;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_authRandomSet;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[25] = self->_pending;
    v5[28] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v5[26] = self->_success;
    v5[28] |= 4u;
  }
  v8 = -[NSData copyWithZone:](self->_cryptogram, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v8;

  v10 = -[NSData copyWithZone:](self->_challengeResponse, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[24] = self->_authRandomSet;
    v6[28] |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *cryptogram;
  NSData *challengeResponse;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_24;
    if (self->_pending)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_24;
    if (self->_success)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_24;
  }
  cryptogram = self->_cryptogram;
  if ((unint64_t)cryptogram | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](cryptogram, "isEqual:"))
    goto LABEL_24;
  challengeResponse = self->_challengeResponse;
  if ((unint64_t)challengeResponse | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](challengeResponse, "isEqual:"))
      goto LABEL_24;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_authRandomSet)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_24;
      }
      else if (*((_BYTE *)v4 + 24))
      {
        goto LABEL_24;
      }
      v7 = 1;
      goto LABEL_25;
    }
LABEL_24:
    v7 = 0;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_pending;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_success;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSData hash](self->_cryptogram, "hash");
  v6 = -[NSData hash](self->_challengeResponse, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_authRandomSet;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  char v5;
  _BYTE *v6;

  v4 = a3;
  v5 = v4[28];
  if ((v5 & 2) != 0)
  {
    self->_pending = v4[25];
    *(_BYTE *)&self->_has |= 2u;
    v5 = v4[28];
  }
  if ((v5 & 4) != 0)
  {
    self->_success = v4[26];
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoSecureElementGetPairingInfoResponse setCryptogram:](self, "setCryptogram:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoSecureElementGetPairingInfoResponse setChallengeResponse:](self, "setChallengeResponse:");
    v4 = v6;
  }
  if ((v4[28] & 1) != 0)
  {
    self->_authRandomSet = v4[24];
    *(_BYTE *)&self->_has |= 1u;
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

- (BOOL)authRandomSet
{
  return self->_authRandomSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cryptogram, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
}

@end
