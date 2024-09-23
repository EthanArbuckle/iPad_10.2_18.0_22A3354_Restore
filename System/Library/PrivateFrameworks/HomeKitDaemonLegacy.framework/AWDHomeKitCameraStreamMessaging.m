@implementation AWDHomeKitCameraStreamMessaging

- (void)setReceivedNegotiationRequest:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_receivedNegotiationRequest = a3;
}

- (void)setHasReceivedNegotiationRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReceivedNegotiationRequest
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSentNegotiationRequest:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sentNegotiationRequest = a3;
}

- (void)setHasSentNegotiationRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSentNegotiationRequest
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSentNegotiationResponse:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_sentNegotiationResponse = a3;
}

- (void)setHasSentNegotiationResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSentNegotiationResponse
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setReceivedStartRequest:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_receivedStartRequest = a3;
}

- (void)setHasReceivedStartRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReceivedStartRequest
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSentStartRequest:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_sentStartRequest = a3;
}

- (void)setHasSentStartRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSentStartRequest
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSentStartResponse:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_sentStartResponse = a3;
}

- (void)setHasSentStartResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSentStartResponse
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSentConnSetup:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sentConnSetup = a3;
}

- (void)setHasSentConnSetup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSentConnSetup
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setReceivedConnSetup:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_receivedConnSetup = a3;
}

- (void)setHasReceivedConnSetup:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReceivedConnSetup
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitCameraStreamMessaging;
  -[AWDHomeKitCameraStreamMessaging description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraStreamMessaging dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_receivedNegotiationRequest);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("receivedNegotiationRequest"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sentNegotiationRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sentNegotiationRequest"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sentNegotiationResponse);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sentNegotiationResponse"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_receivedStartRequest);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("receivedStartRequest"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sentStartRequest);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sentStartRequest"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sentConnSetup);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("sentConnSetup"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sentStartResponse);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sentStartResponse"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_receivedConnSetup);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("receivedConnSetup"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitCameraStreamMessagingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 1) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field();
LABEL_10:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_receivedNegotiationRequest;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_sentNegotiationRequest;
  *((_BYTE *)v4 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v4[7] = self->_sentNegotiationResponse;
  *((_BYTE *)v4 + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v4[4] = self->_receivedStartRequest;
  *((_BYTE *)v4 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v4[8] = self->_sentStartRequest;
  *((_BYTE *)v4 + 40) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    v4[5] = self->_sentConnSetup;
    *((_BYTE *)v4 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  v4[9] = self->_sentStartResponse;
  *((_BYTE *)v4 + 40) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    v4[2] = self->_receivedConnSetup;
    *((_BYTE *)v4 + 40) |= 1u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_receivedNegotiationRequest;
    *((_BYTE *)result + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_sentNegotiationRequest;
  *((_BYTE *)result + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_sentNegotiationResponse;
  *((_BYTE *)result + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 4) = self->_receivedStartRequest;
  *((_BYTE *)result + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 8) = self->_sentStartRequest;
  *((_BYTE *)result + 40) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_sentStartResponse;
  *((_BYTE *)result + 40) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_sentConnSetup;
  *((_BYTE *)result + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 2) = self->_receivedConnSetup;
  *((_BYTE *)result + 40) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_receivedNegotiationRequest != *((_DWORD *)v4 + 3))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) == 0 || self->_sentNegotiationRequest != *((_DWORD *)v4 + 6))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x20) == 0 || self->_sentNegotiationResponse != *((_DWORD *)v4 + 7))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_receivedStartRequest != *((_DWORD *)v4 + 4))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x40) == 0 || self->_sentStartRequest != *((_DWORD *)v4 + 8))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x40) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x80) == 0 || self->_sentStartResponse != *((_DWORD *)v4 + 9))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x80) != 0)
  {
LABEL_41:
    v5 = 0;
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_sentConnSetup != *((_DWORD *)v4 + 5))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_41;
  }
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_receivedConnSetup != *((_DWORD *)v4 + 2))
      goto LABEL_41;
    v5 = 1;
  }
LABEL_42:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_receivedNegotiationRequest;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_sentNegotiationRequest;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_sentNegotiationResponse;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_receivedStartRequest;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_sentStartRequest;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_sentStartResponse;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_sentConnSetup;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_receivedConnSetup;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_receivedNegotiationRequest = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_sentNegotiationRequest = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_sentNegotiationResponse = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_receivedStartRequest = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_sentStartRequest = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
LABEL_17:
    self->_sentConnSetup = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 40) & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_sentStartResponse = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v5 & 1) != 0)
  {
LABEL_9:
    self->_receivedConnSetup = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_10:

}

- (unsigned)receivedNegotiationRequest
{
  return self->_receivedNegotiationRequest;
}

- (unsigned)sentNegotiationRequest
{
  return self->_sentNegotiationRequest;
}

- (unsigned)sentNegotiationResponse
{
  return self->_sentNegotiationResponse;
}

- (unsigned)receivedStartRequest
{
  return self->_receivedStartRequest;
}

- (unsigned)sentStartRequest
{
  return self->_sentStartRequest;
}

- (unsigned)sentStartResponse
{
  return self->_sentStartResponse;
}

- (unsigned)sentConnSetup
{
  return self->_sentConnSetup;
}

- (unsigned)receivedConnSetup
{
  return self->_receivedConnSetup;
}

@end
