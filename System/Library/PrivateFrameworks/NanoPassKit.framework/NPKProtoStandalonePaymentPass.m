@implementation NPKProtoStandalonePaymentPass

- (BOOL)hasPrimaryAccountIdentifier
{
  return self->_primaryAccountIdentifier != 0;
}

- (BOOL)hasPrimaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix != 0;
}

- (BOOL)hasDeviceAccountIdentifier
{
  return self->_deviceAccountIdentifier != 0;
}

- (BOOL)hasDeviceAccountNumberSuffix
{
  return self->_deviceAccountNumberSuffix != 0;
}

- (int)activationState
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_activationState;
  else
    return 100;
}

- (void)setActivationState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activationState = a3;
}

- (void)setHasActivationState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivationState
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)activationStateAsString:(int)a3
{
  __CFString *v3;

  if (a3 <= 119)
  {
    if (a3 == 100)
      return CFSTR("Activated");
    if (a3 == 110)
      return CFSTR("RequiresActivation");
    goto LABEL_14;
  }
  if (a3 == 120)
    return CFSTR("Activating");
  if (a3 == 130)
    return CFSTR("Suspended");
  if (a3 != 140)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("Deactivated");
  return v3;
}

- (int)StringAsActivationState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Activated")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequiresActivation")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Activating")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Suspended")) & 1) != 0)
  {
    v4 = 130;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Deactivated")))
  {
    v4 = 140;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (BOOL)hasDevicePrimaryPaymentApplication
{
  return self->_devicePrimaryPaymentApplication != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentPass;
  -[NPKProtoStandalonePaymentPass description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentPass dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandalonePass *pass;
  void *v5;
  NSString *primaryAccountIdentifier;
  NSString *primaryAccountNumberSuffix;
  NSString *deviceAccountIdentifier;
  NSString *deviceAccountNumberSuffix;
  int activationState;
  __CFString *v11;
  NPKProtoStandalonePaymentApplication *devicePrimaryPaymentApplication;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pass = self->_pass;
  if (pass)
  {
    -[NPKProtoStandalonePass dictionaryRepresentation](pass, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pass"));

  }
  primaryAccountIdentifier = self->_primaryAccountIdentifier;
  if (primaryAccountIdentifier)
    objc_msgSend(v3, "setObject:forKey:", primaryAccountIdentifier, CFSTR("primaryAccountIdentifier"));
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if (primaryAccountNumberSuffix)
    objc_msgSend(v3, "setObject:forKey:", primaryAccountNumberSuffix, CFSTR("primaryAccountNumberSuffix"));
  deviceAccountIdentifier = self->_deviceAccountIdentifier;
  if (deviceAccountIdentifier)
    objc_msgSend(v3, "setObject:forKey:", deviceAccountIdentifier, CFSTR("deviceAccountIdentifier"));
  deviceAccountNumberSuffix = self->_deviceAccountNumberSuffix;
  if (deviceAccountNumberSuffix)
    objc_msgSend(v3, "setObject:forKey:", deviceAccountNumberSuffix, CFSTR("deviceAccountNumberSuffix"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    activationState = self->_activationState;
    if (activationState <= 119)
    {
      if (activationState == 100)
      {
        v11 = CFSTR("Activated");
        goto LABEL_24;
      }
      if (activationState == 110)
      {
        v11 = CFSTR("RequiresActivation");
        goto LABEL_24;
      }
    }
    else
    {
      switch(activationState)
      {
        case 120:
          v11 = CFSTR("Activating");
          goto LABEL_24;
        case 130:
          v11 = CFSTR("Suspended");
          goto LABEL_24;
        case 140:
          v11 = CFSTR("Deactivated");
LABEL_24:
          objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("activationState"));

          goto LABEL_25;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activationState);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_25:
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  if (devicePrimaryPaymentApplication)
  {
    -[NPKProtoStandalonePaymentApplication dictionaryRepresentation](devicePrimaryPaymentApplication, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("devicePrimaryPaymentApplication"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentPassReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_pass)
    -[NPKProtoStandalonePaymentPass writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_primaryAccountIdentifier)
    PBDataWriterWriteStringField();
  if (self->_primaryAccountNumberSuffix)
    PBDataWriterWriteStringField();
  v5 = v6;
  if (self->_deviceAccountIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_deviceAccountNumberSuffix)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
  if (self->_devicePrimaryPaymentApplication)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setPass:", self->_pass);
  if (self->_primaryAccountIdentifier)
    objc_msgSend(v5, "setPrimaryAccountIdentifier:");
  if (self->_primaryAccountNumberSuffix)
    objc_msgSend(v5, "setPrimaryAccountNumberSuffix:");
  v4 = v5;
  if (self->_deviceAccountIdentifier)
  {
    objc_msgSend(v5, "setDeviceAccountIdentifier:");
    v4 = v5;
  }
  if (self->_deviceAccountNumberSuffix)
  {
    objc_msgSend(v5, "setDeviceAccountNumberSuffix:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_activationState;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_devicePrimaryPaymentApplication)
  {
    objc_msgSend(v5, "setDevicePrimaryPaymentApplication:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandalonePass copyWithZone:](self->_pass, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_primaryAccountIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_primaryAccountNumberSuffix, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_deviceAccountIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_deviceAccountNumberSuffix, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_activationState;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v16 = -[NPKProtoStandalonePaymentApplication copyWithZone:](self->_devicePrimaryPaymentApplication, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoStandalonePass *pass;
  NSString *primaryAccountIdentifier;
  NSString *primaryAccountNumberSuffix;
  NSString *deviceAccountIdentifier;
  NSString *deviceAccountNumberSuffix;
  NPKProtoStandalonePaymentApplication *devicePrimaryPaymentApplication;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  pass = self->_pass;
  if ((unint64_t)pass | *((_QWORD *)v4 + 5))
  {
    if (!-[NPKProtoStandalonePass isEqual:](pass, "isEqual:"))
      goto LABEL_19;
  }
  primaryAccountIdentifier = self->_primaryAccountIdentifier;
  if ((unint64_t)primaryAccountIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](primaryAccountIdentifier, "isEqual:"))
      goto LABEL_19;
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if ((unint64_t)primaryAccountNumberSuffix | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](primaryAccountNumberSuffix, "isEqual:"))
      goto LABEL_19;
  }
  deviceAccountIdentifier = self->_deviceAccountIdentifier;
  if ((unint64_t)deviceAccountIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceAccountIdentifier, "isEqual:"))
      goto LABEL_19;
  }
  deviceAccountNumberSuffix = self->_deviceAccountNumberSuffix;
  if ((unint64_t)deviceAccountNumberSuffix | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceAccountNumberSuffix, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_activationState != *((_DWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  if ((unint64_t)devicePrimaryPaymentApplication | *((_QWORD *)v4 + 4))
    v11 = -[NPKProtoStandalonePaymentApplication isEqual:](devicePrimaryPaymentApplication, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NPKProtoStandalonePass hash](self->_pass, "hash");
  v4 = -[NSString hash](self->_primaryAccountIdentifier, "hash");
  v5 = -[NSString hash](self->_primaryAccountNumberSuffix, "hash");
  v6 = -[NSString hash](self->_deviceAccountIdentifier, "hash");
  v7 = -[NSString hash](self->_deviceAccountNumberSuffix, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_activationState;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NPKProtoStandalonePaymentApplication hash](self->_devicePrimaryPaymentApplication, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoStandalonePass *pass;
  uint64_t v6;
  NPKProtoStandalonePaymentApplication *devicePrimaryPaymentApplication;
  uint64_t v8;
  id v9;

  v4 = a3;
  pass = self->_pass;
  v6 = *((_QWORD *)v4 + 5);
  v9 = v4;
  if (pass)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePass mergeFrom:](pass, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentPass setPass:](self, "setPass:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 6))
  {
    -[NPKProtoStandalonePaymentPass setPrimaryAccountIdentifier:](self, "setPrimaryAccountIdentifier:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NPKProtoStandalonePaymentPass setPrimaryAccountNumberSuffix:](self, "setPrimaryAccountNumberSuffix:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoStandalonePaymentPass setDeviceAccountIdentifier:](self, "setDeviceAccountIdentifier:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoStandalonePaymentPass setDeviceAccountNumberSuffix:](self, "setDeviceAccountNumberSuffix:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_activationState = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  v8 = *((_QWORD *)v4 + 4);
  if (devicePrimaryPaymentApplication)
  {
    if (v8)
    {
      -[NPKProtoStandalonePaymentApplication mergeFrom:](devicePrimaryPaymentApplication, "mergeFrom:");
LABEL_22:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[NPKProtoStandalonePaymentPass setDevicePrimaryPaymentApplication:](self, "setDevicePrimaryPaymentApplication:");
    goto LABEL_22;
  }

}

- (NPKProtoStandalonePass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, a3);
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, a3);
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, a3);
}

- (NSString)deviceAccountNumberSuffix
{
  return self->_deviceAccountNumberSuffix;
}

- (void)setDeviceAccountNumberSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAccountNumberSuffix, a3);
}

- (NPKProtoStandalonePaymentApplication)devicePrimaryPaymentApplication
{
  return self->_devicePrimaryPaymentApplication;
}

- (void)setDevicePrimaryPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, 0);
  objc_storeStrong((id *)&self->_deviceAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentPass writeTo:]", "NPKProtoStandalonePaymentPass.m", 210, "self->_pass != nil");
}

@end
