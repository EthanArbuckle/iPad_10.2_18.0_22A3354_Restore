@implementation NPKProtoSignDataResponse

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

- (BOOL)hasSignedData
{
  return self->_signedData != 0;
}

- (BOOL)hasCertsBytes
{
  return self->_certsBytes != 0;
}

- (BOOL)hasSignatureInfoBytes
{
  return self->_signatureInfoBytes != 0;
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
  v8.super_class = (Class)NPKProtoSignDataResponse;
  -[NPKProtoSignDataResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSignDataResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *signedData;
  NSData *certsBytes;
  NSData *signatureInfoBytes;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pending"));

  }
  signedData = self->_signedData;
  if (signedData)
    objc_msgSend(v3, "setObject:forKey:", signedData, CFSTR("signedData"));
  certsBytes = self->_certsBytes;
  if (certsBytes)
    objc_msgSend(v3, "setObject:forKey:", certsBytes, CFSTR("certsBytes"));
  signatureInfoBytes = self->_signatureInfoBytes;
  if (signatureInfoBytes)
    objc_msgSend(v3, "setObject:forKey:", signatureInfoBytes, CFSTR("signatureInfoBytes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSignDataResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_signedData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_certsBytes)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_signatureInfoBytes)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_pending;
    v4[36] |= 1u;
  }
  v5 = v4;
  if (self->_signedData)
  {
    objc_msgSend(v4, "setSignedData:");
    v4 = v5;
  }
  if (self->_certsBytes)
  {
    objc_msgSend(v5, "setCertsBytes:");
    v4 = v5;
  }
  if (self->_signatureInfoBytes)
  {
    objc_msgSend(v5, "setSignatureInfoBytes:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_pending;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_signedData, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSData copyWithZone:](self->_certsBytes, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSData copyWithZone:](self->_signatureInfoBytes, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *signedData;
  NSData *certsBytes;
  NSData *signatureInfoBytes;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0)
    {
      if (self->_pending)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_16;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
    goto LABEL_16;
LABEL_10:
  signedData = self->_signedData;
  if ((unint64_t)signedData | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](signedData, "isEqual:"))
    goto LABEL_16;
  certsBytes = self->_certsBytes;
  if ((unint64_t)certsBytes | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](certsBytes, "isEqual:"))
      goto LABEL_16;
  }
  signatureInfoBytes = self->_signatureInfoBytes;
  if ((unint64_t)signatureInfoBytes | *((_QWORD *)v4 + 2))
    v8 = -[NSData isEqual:](signatureInfoBytes, "isEqual:");
  else
    v8 = 1;
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_pending;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_signedData, "hash") ^ v3;
  v5 = -[NSData hash](self->_certsBytes, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_signatureInfoBytes, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[36] & 1) != 0)
  {
    self->_pending = v4[32];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoSignDataResponse setSignedData:](self, "setSignedData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoSignDataResponse setCertsBytes:](self, "setCertsBytes:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoSignDataResponse setSignatureInfoBytes:](self, "setSignatureInfoBytes:");
    v4 = v5;
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
  objc_storeStrong((id *)&self->_signedData, a3);
}

- (NSData)certsBytes
{
  return self->_certsBytes;
}

- (void)setCertsBytes:(id)a3
{
  objc_storeStrong((id *)&self->_certsBytes, a3);
}

- (NSData)signatureInfoBytes
{
  return self->_signatureInfoBytes;
}

- (void)setSignatureInfoBytes:(id)a3
{
  objc_storeStrong((id *)&self->_signatureInfoBytes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_signatureInfoBytes, 0);
  objc_storeStrong((id *)&self->_certsBytes, 0);
}

@end
