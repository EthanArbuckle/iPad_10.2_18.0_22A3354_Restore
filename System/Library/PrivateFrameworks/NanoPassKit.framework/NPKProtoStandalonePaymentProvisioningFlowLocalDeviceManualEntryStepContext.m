@implementation NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *secondaryManualEntryStepContext;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  if (secondaryManualEntryStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext dictionaryRepresentation](secondaryManualEntryStepContext, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("secondaryManualEntryStepContext"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_secondaryManualEntryStepContext)
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setSecondaryManualEntryStepContext:", self->_secondaryManualEntryStepContext);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext copyWithZone:](self->_secondaryManualEntryStepContext, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *secondaryManualEntryStepContext;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
    if ((unint64_t)secondaryManualEntryStepContext | v4[1])
      v6 = -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext isEqual:](secondaryManualEntryStepContext, "isEqual:");
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
  return -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext hash](self->_secondaryManualEntryStepContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *secondaryManualEntryStepContext;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  v6 = v4[1];
  if (secondaryManualEntryStepContext)
  {
    if (v6)
    {
      v7 = v4;
      -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext mergeFrom:](secondaryManualEntryStepContext, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext setSecondaryManualEntryStepContext:](self, "setSecondaryManualEntryStepContext:");
    goto LABEL_6;
  }

}

- (NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext)secondaryManualEntryStepContext
{
  return self->_secondaryManualEntryStepContext;
}

- (void)setSecondaryManualEntryStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryManualEntryStepContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryManualEntryStepContext, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext.m", 86, "self->_secondaryManualEntryStepContext != nil");
}

@end
