@implementation NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext

- (BOOL)hasRemoteCredential
{
  return self->_remoteCredential != 0;
}

- (BOOL)hasCredential
{
  return self->_credential != 0;
}

- (void)setAllowsAddingDifferentCard:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_allowsAddingDifferentCard = a3;
}

- (void)setHasAllowsAddingDifferentCard:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsAddingDifferentCard
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *manualEntryStepContext;
  void *v5;
  NPKProtoStandalonePaymentRemoteCredential *remoteCredential;
  void *v7;
  NPKProtoStandalonePaymentCredentialUnion *credential;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  manualEntryStepContext = self->_manualEntryStepContext;
  if (manualEntryStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext dictionaryRepresentation](manualEntryStepContext, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("manualEntryStepContext"));

  }
  remoteCredential = self->_remoteCredential;
  if (remoteCredential)
  {
    -[NPKProtoStandalonePaymentRemoteCredential dictionaryRepresentation](remoteCredential, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("remoteCredential"));

  }
  credential = self->_credential;
  if (credential)
  {
    -[NPKProtoStandalonePaymentCredentialUnion dictionaryRepresentation](credential, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("credential"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsAddingDifferentCard);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("allowsAddingDifferentCard"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_manualEntryStepContext)
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_remoteCredential)
    PBDataWriterWriteSubmessage();
  if (self->_credential)
    PBDataWriterWriteSubmessage();
  v5 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;

  v4 = a3;
  objc_msgSend(v4, "setManualEntryStepContext:", self->_manualEntryStepContext);
  if (self->_remoteCredential)
    objc_msgSend(v4, "setRemoteCredential:");
  if (self->_credential)
    objc_msgSend(v4, "setCredential:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_allowsAddingDifferentCard;
    v4[36] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext copyWithZone:](self->_manualEntryStepContext, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NPKProtoStandalonePaymentRemoteCredential copyWithZone:](self->_remoteCredential, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NPKProtoStandalonePaymentCredentialUnion copyWithZone:](self->_credential, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_allowsAddingDifferentCard;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *manualEntryStepContext;
  NPKProtoStandalonePaymentRemoteCredential *remoteCredential;
  NPKProtoStandalonePaymentCredentialUnion *credential;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  manualEntryStepContext = self->_manualEntryStepContext;
  if ((unint64_t)manualEntryStepContext | *((_QWORD *)v4 + 2))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext isEqual:](manualEntryStepContext, "isEqual:"))goto LABEL_10;
  }
  remoteCredential = self->_remoteCredential;
  if ((unint64_t)remoteCredential | *((_QWORD *)v4 + 3))
  {
    if (!-[NPKProtoStandalonePaymentRemoteCredential isEqual:](remoteCredential, "isEqual:"))
      goto LABEL_10;
  }
  credential = self->_credential;
  if ((unint64_t)credential | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoStandalonePaymentCredentialUnion isEqual:](credential, "isEqual:"))
      goto LABEL_10;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    if (self->_allowsAddingDifferentCard)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_10;
    }
    v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext hash](self->_manualEntryStepContext, "hash");
  v4 = -[NPKProtoStandalonePaymentRemoteCredential hash](self->_remoteCredential, "hash");
  v5 = -[NPKProtoStandalonePaymentCredentialUnion hash](self->_credential, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_allowsAddingDifferentCard;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *manualEntryStepContext;
  uint64_t v6;
  NPKProtoStandalonePaymentRemoteCredential *remoteCredential;
  uint64_t v8;
  NPKProtoStandalonePaymentCredentialUnion *credential;
  uint64_t v10;
  id v11;

  v4 = a3;
  manualEntryStepContext = self->_manualEntryStepContext;
  v6 = *((_QWORD *)v4 + 2);
  v11 = v4;
  if (manualEntryStepContext)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext mergeFrom:](manualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext setManualEntryStepContext:](self, "setManualEntryStepContext:");
  }
  v4 = v11;
LABEL_7:
  remoteCredential = self->_remoteCredential;
  v8 = *((_QWORD *)v4 + 3);
  if (remoteCredential)
  {
    if (!v8)
      goto LABEL_13;
    -[NPKProtoStandalonePaymentRemoteCredential mergeFrom:](remoteCredential, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext setRemoteCredential:](self, "setRemoteCredential:");
  }
  v4 = v11;
LABEL_13:
  credential = self->_credential;
  v10 = *((_QWORD *)v4 + 1);
  if (credential)
  {
    if (!v10)
      goto LABEL_19;
    -[NPKProtoStandalonePaymentCredentialUnion mergeFrom:](credential, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext setCredential:](self, "setCredential:");
  }
  v4 = v11;
LABEL_19:
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_allowsAddingDifferentCard = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext)manualEntryStepContext
{
  return self->_manualEntryStepContext;
}

- (void)setManualEntryStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_manualEntryStepContext, a3);
}

- (NPKProtoStandalonePaymentRemoteCredential)remoteCredential
{
  return self->_remoteCredential;
}

- (void)setRemoteCredential:(id)a3
{
  objc_storeStrong((id *)&self->_remoteCredential, a3);
}

- (NPKProtoStandalonePaymentCredentialUnion)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (BOOL)allowsAddingDifferentCard
{
  return self->_allowsAddingDifferentCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_manualEntryStepContext, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext.m", 166, "self->_manualEntryStepContext != nil");
}

@end
