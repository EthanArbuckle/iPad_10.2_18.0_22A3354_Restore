@implementation NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext

- (BOOL)hasProduct
{
  return self->_product != 0;
}

- (void)setAllowsReaderModeEntry:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_allowsReaderModeEntry = a3;
}

- (void)setHasAllowsReaderModeEntry:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsReaderModeEntry
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandalonePaymentSetupProduct *product;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  product = self->_product;
  if (product)
  {
    -[NPKProtoStandalonePaymentSetupProduct dictionaryRepresentation](product, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("product"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsReaderModeEntry);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("allowsReaderModeEntry"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_product)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if (self->_product)
  {
    v5 = v4;
    objc_msgSend(v4, "setProduct:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_allowsReaderModeEntry;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandalonePaymentSetupProduct copyWithZone:](self->_product, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_allowsReaderModeEntry;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentSetupProduct *product;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  product = self->_product;
  if ((unint64_t)product | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:"))
      goto LABEL_6;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
    if (self->_allowsReaderModeEntry)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_6;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_6;
    }
    v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[NPKProtoStandalonePaymentSetupProduct hash](self->_product, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_allowsReaderModeEntry;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentSetupProduct *product;
  uint64_t v6;
  id v7;

  v4 = a3;
  product = self->_product;
  v6 = *((_QWORD *)v4 + 1);
  if (product)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext setProduct:](self, "setProduct:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_allowsReaderModeEntry = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NPKProtoStandalonePaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (BOOL)allowsReaderModeEntry
{
  return self->_allowsReaderModeEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
}

@end
