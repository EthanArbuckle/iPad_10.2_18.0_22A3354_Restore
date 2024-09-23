@implementation NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext

- (BOOL)hasLocalizedProgressDescription
{
  return self->_localizedProgressDescription != 0;
}

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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *localizedProgressDescription;
  NPKProtoStandalonePaymentSetupProduct *product;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  localizedProgressDescription = self->_localizedProgressDescription;
  if (localizedProgressDescription)
    objc_msgSend(v3, "setObject:forKey:", localizedProgressDescription, CFSTR("localizedProgressDescription"));
  product = self->_product;
  if (product)
  {
    -[NPKProtoStandalonePaymentSetupProduct dictionaryRepresentation](product, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("product"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_localizedProgressDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_product)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_localizedProgressDescription)
  {
    objc_msgSend(v4, "setLocalizedProgressDescription:");
    v4 = v5;
  }
  if (self->_product)
  {
    objc_msgSend(v5, "setProduct:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_localizedProgressDescription, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NPKProtoStandalonePaymentSetupProduct copyWithZone:](self->_product, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *localizedProgressDescription;
  NPKProtoStandalonePaymentSetupProduct *product;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((localizedProgressDescription = self->_localizedProgressDescription,
         !((unint64_t)localizedProgressDescription | v4[1]))
     || -[NSString isEqual:](localizedProgressDescription, "isEqual:")))
  {
    product = self->_product;
    if ((unint64_t)product | v4[2])
      v7 = -[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_localizedProgressDescription, "hash");
  return -[NPKProtoStandalonePaymentSetupProduct hash](self->_product, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandalonePaymentSetupProduct *product;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext setLocalizedProgressDescription:](self, "setLocalizedProgressDescription:");
    v4 = v7;
  }
  product = self->_product;
  v6 = v4[2];
  if (product)
  {
    if (v6)
    {
      -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext setProduct:](self, "setProduct:");
    goto LABEL_8;
  }

}

- (NSString)localizedProgressDescription
{
  return self->_localizedProgressDescription;
}

- (void)setLocalizedProgressDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedProgressDescription, a3);
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
  objc_storeStrong((id *)&self->_localizedProgressDescription, 0);
}

@end
