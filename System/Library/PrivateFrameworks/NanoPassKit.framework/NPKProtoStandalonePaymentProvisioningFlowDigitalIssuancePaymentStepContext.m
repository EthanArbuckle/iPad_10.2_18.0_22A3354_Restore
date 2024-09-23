@implementation NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext

- (BOOL)hasProduct
{
  return self->_product != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  product = self->_product;
  if (product)
  {
    -[NPKProtoStandalonePaymentSetupProduct dictionaryRepresentation](product, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("product"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_product)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  NPKProtoStandalonePaymentSetupProduct *product;

  product = self->_product;
  if (product)
    objc_msgSend(a3, "setProduct:", product);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandalonePaymentSetupProduct copyWithZone:](self->_product, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandalonePaymentSetupProduct *product;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    product = self->_product;
    if ((unint64_t)product | v4[1])
      v6 = -[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NPKProtoStandalonePaymentSetupProduct hash](self->_product, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandalonePaymentSetupProduct *product;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  product = self->_product;
  v6 = v4[1];
  if (product)
  {
    if (v6)
    {
      v7 = v4;
      -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext setProduct:](self, "setProduct:");
    goto LABEL_6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
}

@end
