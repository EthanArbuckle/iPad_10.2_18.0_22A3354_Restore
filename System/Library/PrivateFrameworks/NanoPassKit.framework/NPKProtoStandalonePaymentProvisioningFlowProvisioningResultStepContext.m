@implementation NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext

- (void)setCardAdded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cardAdded = a3;
}

- (void)setHasCardAdded:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCardAdded
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasError
{
  return self->_error != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NPKProtoStandaloneError *error;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cardAdded);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("cardAdded"));

  }
  error = self->_error;
  if (error)
  {
    -[NPKProtoStandaloneError dictionaryRepresentation](error, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("error"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContextReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
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
    v4[16] = self->_cardAdded;
    v4[20] |= 1u;
  }
  if (self->_error)
  {
    v5 = v4;
    objc_msgSend(v4, "setError:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_cardAdded;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NPKProtoStandaloneError copyWithZone:](self->_error, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NPKProtoStandaloneError *error;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_cardAdded)
      {
        if (*((_BYTE *)v4 + 16))
          goto LABEL_12;
      }
      else if (!*((_BYTE *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
    v5 = -[NPKProtoStandaloneError isEqual:](error, "isEqual:");
  else
    v5 = 1;
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_cardAdded;
  else
    v2 = 0;
  return -[NPKProtoStandaloneError hash](self->_error, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  NPKProtoStandaloneError *error;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_cardAdded = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }
  error = self->_error;
  v7 = v5[1];
  if (error)
  {
    if (v7)
    {
      v8 = v5;
      -[NPKProtoStandaloneError mergeFrom:](error, "mergeFrom:");
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext setError:](self, "setError:");
    goto LABEL_8;
  }

}

- (BOOL)cardAdded
{
  return self->_cardAdded;
}

- (NPKProtoStandaloneError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
