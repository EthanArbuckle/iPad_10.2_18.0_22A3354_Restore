@implementation FCCKPRequestOperationHeader

- (void)setLocale:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 176), a2);
}

- (void)setDeviceSoftwareVersion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 160), a2);
}

- (void)setDeviceLibraryVersion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 152), a2);
}

- (void)setDeviceLibraryName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 144), a2);
}

- (void)setDeviceHardwareVersion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 128), a2);
}

- (void)setApplicationContainer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setApplicationBundle:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIDContainerID, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_mmcsProtocolVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_deviceSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceLibraryVersion, 0);
  objc_storeStrong((id *)&self->_deviceLibraryName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceHardwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceHardwareID, 0);
  objc_storeStrong((id *)&self->_deviceFlowControlKey, 0);
  objc_storeStrong((id *)&self->_deviceAssignedName, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationContainer, 0);
  objc_storeStrong((id *)&self->_applicationBundle, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_applicationContainer)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_applicationBundle)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_applicationVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
  }
  if (self->_deviceIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_deviceSoftwareVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_deviceHardwareVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_deviceLibraryName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_deviceLibraryVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_deviceFlowControlKey)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
    v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_25:
      if ((v6 & 0x80) == 0)
        goto LABEL_26;
      goto LABEL_55;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteUint64Field();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_26:
    if ((v6 & 8) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_55:
  PBDataWriterWriteFloatField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_27:
    PBDataWriterWriteUint64Field();
    v4 = v8;
  }
LABEL_28:
  if (self->_locale)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_mmcsProtocolVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_clientChangeToken)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  if (self->_deviceAssignedName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_deviceHardwareID)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_userIDContainerID)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_operationGroupName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }

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
  v8.super_class = (Class)FCCKPRequestOperationHeader;
  -[FCCKPRequestOperationHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRequestOperationHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *applicationContainer;
  NSString *applicationBundle;
  NSString *applicationVersion;
  __int16 has;
  void *v10;
  void *v11;
  FCCKPIdentifier *deviceIdentifier;
  void *v13;
  NSString *deviceSoftwareVersion;
  NSString *deviceHardwareVersion;
  NSString *deviceLibraryName;
  NSString *deviceLibraryVersion;
  NSString *deviceFlowControlKey;
  __int16 v19;
  void *v20;
  FCCKPLocale *locale;
  void *v22;
  NSString *mmcsProtocolVersion;
  void *v24;
  NSData *clientChangeToken;
  NSString *deviceAssignedName;
  NSString *deviceHardwareID;
  void *v28;
  NSString *userIDContainerID;
  void *v30;
  NSString *operationGroupName;
  __int16 v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  applicationContainer = self->_applicationContainer;
  if (applicationContainer)
    objc_msgSend(v3, "setObject:forKey:", applicationContainer, CFSTR("applicationContainer"));
  applicationBundle = self->_applicationBundle;
  if (applicationBundle)
    objc_msgSend(v5, "setObject:forKey:", applicationBundle, CFSTR("applicationBundle"));
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
    objc_msgSend(v5, "setObject:forKey:", applicationVersion, CFSTR("applicationVersion"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_applicationConfigVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("applicationConfigVersion"));

    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_globalConfigVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("globalConfigVersion"));

  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    -[FCCKPIdentifier dictionaryRepresentation](deviceIdentifier, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("deviceIdentifier"));

  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  if (deviceSoftwareVersion)
    objc_msgSend(v5, "setObject:forKey:", deviceSoftwareVersion, CFSTR("deviceSoftwareVersion"));
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if (deviceHardwareVersion)
    objc_msgSend(v5, "setObject:forKey:", deviceHardwareVersion, CFSTR("deviceHardwareVersion"));
  deviceLibraryName = self->_deviceLibraryName;
  if (deviceLibraryName)
    objc_msgSend(v5, "setObject:forKey:", deviceLibraryName, CFSTR("deviceLibraryName"));
  deviceLibraryVersion = self->_deviceLibraryVersion;
  if (deviceLibraryVersion)
    objc_msgSend(v5, "setObject:forKey:", deviceLibraryVersion, CFSTR("deviceLibraryVersion"));
  deviceFlowControlKey = self->_deviceFlowControlKey;
  if (deviceFlowControlKey)
    objc_msgSend(v5, "setObject:forKey:", deviceFlowControlKey, CFSTR("deviceFlowControlKey"));
  v19 = (__int16)self->_has;
  if ((v19 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_deviceFlowControlBudget);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("deviceFlowControlBudget"));

    v19 = (__int16)self->_has;
    if ((v19 & 4) == 0)
    {
LABEL_25:
      if ((v19 & 0x80) == 0)
        goto LABEL_26;
      goto LABEL_55;
    }
  }
  else if ((v19 & 4) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_deviceFlowControlBudgetCap);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v37, CFSTR("deviceFlowControlBudgetCap"));

  v19 = (__int16)self->_has;
  if ((v19 & 0x80) == 0)
  {
LABEL_26:
    if ((v19 & 8) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_55:
  *(float *)&v4 = self->_deviceFlowControlRegeneration;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v38, CFSTR("deviceFlowControlRegeneration"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_deviceProtocolVersion);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("deviceProtocolVersion"));

  }
LABEL_28:
  locale = self->_locale;
  if (locale)
  {
    -[FCCKPLocale dictionaryRepresentation](locale, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("locale"));

  }
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  if (mmcsProtocolVersion)
    objc_msgSend(v5, "setObject:forKey:", mmcsProtocolVersion, CFSTR("mmcsProtocolVersion"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_applicationContainerEnvironment);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("applicationContainerEnvironment"));

  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
    objc_msgSend(v5, "setObject:forKey:", clientChangeToken, CFSTR("clientChangeToken"));
  deviceAssignedName = self->_deviceAssignedName;
  if (deviceAssignedName)
    objc_msgSend(v5, "setObject:forKey:", deviceAssignedName, CFSTR("deviceAssignedName"));
  deviceHardwareID = self->_deviceHardwareID;
  if (deviceHardwareID)
    objc_msgSend(v5, "setObject:forKey:", deviceHardwareID, CFSTR("deviceHardwareID"));
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_targetDatabase);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("targetDatabase"));

  }
  userIDContainerID = self->_userIDContainerID;
  if (userIDContainerID)
    objc_msgSend(v5, "setObject:forKey:", userIDContainerID, CFSTR("userIDContainerID"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_isolationLevel);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("isolationLevel"));

  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
    objc_msgSend(v5, "setObject:forKey:", operationGroupName, CFSTR("operationGroupName"));
  v32 = (__int16)self->_has;
  if ((v32 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_operationGroupQuantity);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("operationGroupQuantity"));

    v32 = (__int16)self->_has;
  }
  if ((v32 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deviceSoftwareIsAppleInternal);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("deviceSoftwareIsAppleInternal"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRequestOperationHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int16 has;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int16 v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __int16 v40;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_applicationContainer, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_applicationBundle, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_applicationVersion, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_applicationConfigVersion;
    *(_WORD *)(v5 + 220) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_globalConfigVersion;
    *(_WORD *)(v5 + 220) |= 0x10u;
  }
  v13 = -[FCCKPIdentifier copyWithZone:](self->_deviceIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v13;

  v15 = -[NSString copyWithZone:](self->_deviceSoftwareVersion, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v15;

  v17 = -[NSString copyWithZone:](self->_deviceHardwareVersion, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v17;

  v19 = -[NSString copyWithZone:](self->_deviceLibraryName, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v19;

  v21 = -[NSString copyWithZone:](self->_deviceLibraryVersion, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v21;

  v23 = -[NSString copyWithZone:](self->_deviceFlowControlKey, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v23;

  v25 = (__int16)self->_has;
  if ((v25 & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_deviceFlowControlBudget;
    *(_WORD *)(v5 + 220) |= 2u;
    v25 = (__int16)self->_has;
    if ((v25 & 4) == 0)
    {
LABEL_7:
      if ((v25 & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((v25 & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v5 + 24) = self->_deviceFlowControlBudgetCap;
  *(_WORD *)(v5 + 220) |= 4u;
  v25 = (__int16)self->_has;
  if ((v25 & 0x80) == 0)
  {
LABEL_8:
    if ((v25 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_23:
  *(float *)(v5 + 112) = self->_deviceFlowControlRegeneration;
  *(_WORD *)(v5 + 220) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    *(_QWORD *)(v5 + 32) = self->_deviceProtocolVersion;
    *(_WORD *)(v5 + 220) |= 8u;
  }
LABEL_10:
  v26 = -[FCCKPLocale copyWithZone:](self->_locale, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v26;

  v28 = -[NSString copyWithZone:](self->_mmcsProtocolVersion, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v28;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_applicationContainerEnvironment;
    *(_WORD *)(v5 + 220) |= 0x40u;
  }
  v30 = -[NSData copyWithZone:](self->_clientChangeToken, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v30;

  v32 = -[NSString copyWithZone:](self->_deviceAssignedName, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v32;

  v34 = -[NSString copyWithZone:](self->_deviceHardwareID, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v34;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 200) = self->_targetDatabase;
    *(_WORD *)(v5 + 220) |= 0x200u;
  }
  v36 = -[NSString copyWithZone:](self->_userIDContainerID, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v36;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_isolationLevel;
    *(_WORD *)(v5 + 220) |= 0x100u;
  }
  v38 = -[NSString copyWithZone:](self->_operationGroupName, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v38;

  v40 = (__int16)self->_has;
  if ((v40 & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_operationGroupQuantity;
    *(_WORD *)(v5 + 220) |= 0x20u;
    v40 = (__int16)self->_has;
  }
  if ((v40 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 216) = self->_deviceSoftwareIsAppleInternal;
    *(_WORD *)(v5 + 220) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *applicationContainer;
  NSString *applicationBundle;
  NSString *applicationVersion;
  __int16 has;
  __int16 v9;
  FCCKPIdentifier *deviceIdentifier;
  NSString *deviceSoftwareVersion;
  NSString *deviceHardwareVersion;
  NSString *deviceLibraryName;
  NSString *deviceLibraryVersion;
  NSString *deviceFlowControlKey;
  __int16 v16;
  __int16 v17;
  FCCKPLocale *locale;
  NSString *mmcsProtocolVersion;
  __int16 v20;
  NSData *clientChangeToken;
  NSString *deviceAssignedName;
  NSString *deviceHardwareID;
  __int16 v24;
  __int16 v25;
  NSString *userIDContainerID;
  NSString *operationGroupName;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_89;
  applicationContainer = self->_applicationContainer;
  if ((unint64_t)applicationContainer | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](applicationContainer, "isEqual:"))
      goto LABEL_89;
  }
  applicationBundle = self->_applicationBundle;
  if ((unint64_t)applicationBundle | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](applicationBundle, "isEqual:"))
      goto LABEL_89;
  }
  applicationVersion = self->_applicationVersion;
  if ((unint64_t)applicationVersion | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](applicationVersion, "isEqual:"))
      goto LABEL_89;
  }
  has = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 110);
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_applicationConfigVersion != *((_QWORD *)v4 + 1))
      goto LABEL_89;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_globalConfigVersion != *((_QWORD *)v4 + 5))
      goto LABEL_89;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_89;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((_QWORD *)v4 + 17)
    && !-[FCCKPIdentifier isEqual:](deviceIdentifier, "isEqual:"))
  {
    goto LABEL_89;
  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  if ((unint64_t)deviceSoftwareVersion | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](deviceSoftwareVersion, "isEqual:"))
      goto LABEL_89;
  }
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if ((unint64_t)deviceHardwareVersion | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](deviceHardwareVersion, "isEqual:"))
      goto LABEL_89;
  }
  deviceLibraryName = self->_deviceLibraryName;
  if ((unint64_t)deviceLibraryName | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](deviceLibraryName, "isEqual:"))
      goto LABEL_89;
  }
  deviceLibraryVersion = self->_deviceLibraryVersion;
  if ((unint64_t)deviceLibraryVersion | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](deviceLibraryVersion, "isEqual:"))
      goto LABEL_89;
  }
  deviceFlowControlKey = self->_deviceFlowControlKey;
  if ((unint64_t)deviceFlowControlKey | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](deviceFlowControlKey, "isEqual:"))
      goto LABEL_89;
  }
  v16 = (__int16)self->_has;
  v17 = *((_WORD *)v4 + 110);
  if ((v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_deviceFlowControlBudget != *((_QWORD *)v4 + 2))
      goto LABEL_89;
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_89;
  }
  if ((v16 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_deviceFlowControlBudgetCap != *((_QWORD *)v4 + 3))
      goto LABEL_89;
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_89;
  }
  if ((v16 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_deviceFlowControlRegeneration != *((float *)v4 + 28))
      goto LABEL_89;
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_89;
  }
  if ((v16 & 8) != 0)
  {
    if ((v17 & 8) == 0 || self->_deviceProtocolVersion != *((_QWORD *)v4 + 4))
      goto LABEL_89;
  }
  else if ((v17 & 8) != 0)
  {
    goto LABEL_89;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 22) && !-[FCCKPLocale isEqual:](locale, "isEqual:"))
    goto LABEL_89;
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  if ((unint64_t)mmcsProtocolVersion | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](mmcsProtocolVersion, "isEqual:"))
      goto LABEL_89;
  }
  v20 = *((_WORD *)v4 + 110);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_applicationContainerEnvironment != *((_DWORD *)v4 + 18))
      goto LABEL_89;
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_89;
  }
  clientChangeToken = self->_clientChangeToken;
  if ((unint64_t)clientChangeToken | *((_QWORD *)v4 + 11)
    && !-[NSData isEqual:](clientChangeToken, "isEqual:"))
  {
    goto LABEL_89;
  }
  deviceAssignedName = self->_deviceAssignedName;
  if ((unint64_t)deviceAssignedName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](deviceAssignedName, "isEqual:"))
      goto LABEL_89;
  }
  deviceHardwareID = self->_deviceHardwareID;
  if ((unint64_t)deviceHardwareID | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](deviceHardwareID, "isEqual:"))
      goto LABEL_89;
  }
  v24 = (__int16)self->_has;
  v25 = *((_WORD *)v4 + 110);
  if ((v24 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x200) == 0 || self->_targetDatabase != *((_DWORD *)v4 + 50))
      goto LABEL_89;
  }
  else if ((*((_WORD *)v4 + 110) & 0x200) != 0)
  {
    goto LABEL_89;
  }
  userIDContainerID = self->_userIDContainerID;
  if ((unint64_t)userIDContainerID | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](userIDContainerID, "isEqual:"))
      goto LABEL_89;
    v24 = (__int16)self->_has;
    v25 = *((_WORD *)v4 + 110);
  }
  if ((v24 & 0x100) != 0)
  {
    if ((v25 & 0x100) == 0 || self->_isolationLevel != *((_DWORD *)v4 + 42))
      goto LABEL_89;
  }
  else if ((v25 & 0x100) != 0)
  {
    goto LABEL_89;
  }
  operationGroupName = self->_operationGroupName;
  if ((unint64_t)operationGroupName | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](operationGroupName, "isEqual:"))
      goto LABEL_89;
    v24 = (__int16)self->_has;
    v25 = *((_WORD *)v4 + 110);
  }
  if ((v24 & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0 || self->_operationGroupQuantity != *((_QWORD *)v4 + 6))
      goto LABEL_89;
  }
  else if ((v25 & 0x20) != 0)
  {
    goto LABEL_89;
  }
  if ((v24 & 0x400) != 0)
  {
    if ((v25 & 0x400) != 0)
    {
      if (self->_deviceSoftwareIsAppleInternal)
      {
        if (!*((_BYTE *)v4 + 216))
          goto LABEL_89;
      }
      else if (*((_BYTE *)v4 + 216))
      {
        goto LABEL_89;
      }
      v28 = 1;
      goto LABEL_90;
    }
LABEL_89:
    v28 = 0;
    goto LABEL_90;
  }
  v28 = (v25 & 0x400) == 0;
LABEL_90:

  return v28;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  float deviceFlowControlRegeneration;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;

  v38 = -[NSString hash](self->_applicationContainer, "hash");
  v37 = -[NSString hash](self->_applicationBundle, "hash");
  v36 = -[NSString hash](self->_applicationVersion, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v35 = 2654435761u * self->_applicationConfigVersion;
    if ((has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v35 = 0;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      v34 = 2654435761u * self->_globalConfigVersion;
      goto LABEL_6;
    }
  }
  v34 = 0;
LABEL_6:
  v33 = -[FCCKPIdentifier hash](self->_deviceIdentifier, "hash");
  v32 = -[NSString hash](self->_deviceSoftwareVersion, "hash");
  v31 = -[NSString hash](self->_deviceHardwareVersion, "hash");
  v30 = -[NSString hash](self->_deviceLibraryName, "hash");
  v29 = -[NSString hash](self->_deviceLibraryVersion, "hash");
  v28 = -[NSString hash](self->_deviceFlowControlKey, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 2) == 0)
  {
    v27 = 0;
    if ((v4 & 4) != 0)
      goto LABEL_8;
LABEL_14:
    v26 = 0;
    if ((v4 & 0x80) != 0)
      goto LABEL_9;
LABEL_15:
    v9 = 0;
    goto LABEL_18;
  }
  v27 = 2654435761u * self->_deviceFlowControlBudget;
  if ((v4 & 4) == 0)
    goto LABEL_14;
LABEL_8:
  v26 = 2654435761u * self->_deviceFlowControlBudgetCap;
  if ((v4 & 0x80) == 0)
    goto LABEL_15;
LABEL_9:
  deviceFlowControlRegeneration = self->_deviceFlowControlRegeneration;
  v6 = -deviceFlowControlRegeneration;
  if (deviceFlowControlRegeneration >= 0.0)
    v6 = self->_deviceFlowControlRegeneration;
  v7 = floorf(v6 + 0.5);
  v8 = (float)(v6 - v7) * 1.8447e19;
  v9 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabsf(v8);
  }
LABEL_18:
  v25 = v9;
  if ((v4 & 8) != 0)
    v24 = 2654435761u * self->_deviceProtocolVersion;
  else
    v24 = 0;
  v23 = -[FCCKPLocale hash](self->_locale, "hash");
  v21 = -[NSString hash](self->_mmcsProtocolVersion, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v10 = 2654435761 * self->_applicationContainerEnvironment;
  else
    v10 = 0;
  v11 = -[NSData hash](self->_clientChangeToken, "hash", v21);
  v12 = -[NSString hash](self->_deviceAssignedName, "hash");
  v13 = -[NSString hash](self->_deviceHardwareID, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v14 = 2654435761 * self->_targetDatabase;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_userIDContainerID, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v16 = 2654435761 * self->_isolationLevel;
  else
    v16 = 0;
  v17 = -[NSString hash](self->_operationGroupName, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v18 = 2654435761u * self->_operationGroupQuantity;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_32;
LABEL_34:
    v19 = 0;
    return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_34;
LABEL_32:
  v19 = 2654435761 * self->_deviceSoftwareIsAppleInternal;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)setOperationGroupName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 192), a2);
}

@end
