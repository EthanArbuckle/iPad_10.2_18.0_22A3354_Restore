@implementation NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext

- (BOOL)hasTermsURL
{
  return self->_termsURL != 0;
}

- (void)setAllowNonSecureHTTP:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_allowNonSecureHTTP = a3;
}

- (void)setHasAllowNonSecureHTTP:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowNonSecureHTTP
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *termsURL;
  void *v6;
  NPKProtoStandalonePaymentSetupProduct *product;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  termsURL = self->_termsURL;
  if (termsURL)
    objc_msgSend(v3, "setObject:forKey:", termsURL, CFSTR("termsURL"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowNonSecureHTTP);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("allowNonSecureHTTP"));

  }
  product = self->_product;
  if (product)
  {
    -[NPKProtoStandalonePaymentSetupProduct dictionaryRepresentation](product, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("product"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_termsURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_termsURL)
  {
    objc_msgSend(v4, "setTermsURL:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_allowNonSecureHTTP;
    v4[28] |= 1u;
  }
  if (self->_product)
  {
    objc_msgSend(v5, "setProduct:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_termsURL, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_allowNonSecureHTTP;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[NPKProtoStandalonePaymentSetupProduct copyWithZone:](self->_product, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *termsURL;
  char v6;
  NPKProtoStandalonePaymentSetupProduct *product;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  termsURL = self->_termsURL;
  if ((unint64_t)termsURL | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](termsURL, "isEqual:"))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_allowNonSecureHTTP)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  product = self->_product;
  if ((unint64_t)product | *((_QWORD *)v4 + 1))
    v6 = -[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:");
  else
    v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_termsURL, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_allowNonSecureHTTP;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NPKProtoStandalonePaymentSetupProduct hash](self->_product, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  NPKProtoStandalonePaymentSetupProduct *product;
  uint64_t v6;
  BOOL *v7;

  v4 = (BOOL *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext setTermsURL:](self, "setTermsURL:");
    v4 = v7;
  }
  if (v4[28])
  {
    self->_allowNonSecureHTTP = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  product = self->_product;
  v6 = *((_QWORD *)v4 + 1);
  if (product)
  {
    if (v6)
    {
      -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext setProduct:](self, "setProduct:");
    goto LABEL_10;
  }

}

- (NSString)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_storeStrong((id *)&self->_termsURL, a3);
}

- (BOOL)allowNonSecureHTTP
{
  return self->_allowNonSecureHTTP;
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
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
