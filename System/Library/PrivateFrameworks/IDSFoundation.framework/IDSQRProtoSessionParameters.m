@implementation IDSQRProtoSessionParameters

- (BOOL)hasQrAccessToken
{
  return self->_qrAccessToken != 0;
}

- (BOOL)hasSoftwareVersion
{
  return self->_softwareVersion != 0;
}

- (void)setParticipantCapabilities:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_participantCapabilities = a3;
}

- (void)setHasParticipantCapabilities:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantCapabilities
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWebParticipantCapabilities:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_webParticipantCapabilities = a3;
}

- (void)setHasWebParticipantCapabilities:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWebParticipantCapabilities
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setServiceId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_serviceId = a3;
}

- (void)setHasServiceId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServiceId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoSessionParameters;
  -[IDSQRProtoSessionParameters description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  NSData *qrAccessToken;
  NSString *softwareVersion;
  char has;
  void *v12;
  const char *v13;
  double v14;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  qrAccessToken = self->_qrAccessToken;
  if (qrAccessToken)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)qrAccessToken, v7, CFSTR("qr_access_token"));
  softwareVersion = self->_softwareVersion;
  if (softwareVersion)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)softwareVersion, v7, CFSTR("software_version"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, self->_webParticipantCapabilities, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v19, v21, CFSTR("web_participant_capabilities"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v8;
    goto LABEL_8;
  }
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, self->_participantCapabilities, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, v18, CFSTR("participant_capabilities"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_serviceId, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, v14, CFSTR("service_id"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionParametersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_qrAccessToken)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_softwareVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteUint64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_9:

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  NSData *qrAccessToken;
  NSString *softwareVersion;
  char has;
  id v10;

  v4 = a3;
  qrAccessToken = self->_qrAccessToken;
  v10 = v4;
  if (qrAccessToken)
  {
    objc_msgSend_setQrAccessToken_(v4, v5, (uint64_t)qrAccessToken, v6);
    v4 = v10;
  }
  softwareVersion = self->_softwareVersion;
  if (softwareVersion)
  {
    objc_msgSend_setSoftwareVersion_(v10, v5, (uint64_t)softwareVersion, v6);
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_QWORD *)v4 + 2) = self->_webParticipantCapabilities;
    *((_BYTE *)v4 + 48) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_QWORD *)v4 + 1) = self->_participantCapabilities;
  *((_BYTE *)v4 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 8) = self->_serviceId;
    *((_BYTE *)v4 + 48) |= 4u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  void *v20;
  char has;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_qrAccessToken, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v15;

  v19 = objc_msgSend_copyWithZone_(self->_softwareVersion, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v19;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v12 + 16) = self->_webParticipantCapabilities;
    *(_BYTE *)(v12 + 48) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v12;
    goto LABEL_4;
  }
  *(_QWORD *)(v12 + 8) = self->_participantCapabilities;
  *(_BYTE *)(v12 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v12 + 32) = self->_serviceId;
    *(_BYTE *)(v12 + 48) |= 4u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSData *qrAccessToken;
  uint64_t v11;
  NSString *softwareVersion;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_20;
  qrAccessToken = self->_qrAccessToken;
  v11 = v4[3];
  if ((unint64_t)qrAccessToken | v11)
  {
    if (!objc_msgSend_isEqual_(qrAccessToken, v8, v11, v9))
      goto LABEL_20;
  }
  softwareVersion = self->_softwareVersion;
  v13 = v4[5];
  if ((unint64_t)softwareVersion | v13)
  {
    if (!objc_msgSend_isEqual_(softwareVersion, v8, v13, v9))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[6] & 1) == 0 || self->_participantCapabilities != v4[1])
      goto LABEL_20;
  }
  else if ((v4[6] & 1) != 0)
  {
LABEL_20:
    v14 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[6] & 2) == 0 || self->_webParticipantCapabilities != v4[2])
      goto LABEL_20;
  }
  else if ((v4[6] & 2) != 0)
  {
    goto LABEL_20;
  }
  v14 = (v4[6] & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[6] & 4) == 0 || self->_serviceId != *((_DWORD *)v4 + 8))
      goto LABEL_20;
    v14 = 1;
  }
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend_hash(self->_qrAccessToken, a2, v2, v3);
  v9 = objc_msgSend_hash(self->_softwareVersion, v6, v7, v8);
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v12 = 0;
    return v9 ^ v5 ^ v10 ^ v11 ^ v12;
  }
  v10 = 2654435761u * self->_participantCapabilities;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v11 = 2654435761u * self->_webParticipantCapabilities;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v12 = 2654435761 * self->_serviceId;
  return v9 ^ v5 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;

  v4 = a3;
  v7 = *((_QWORD *)v4 + 3);
  v10 = v4;
  if (v7)
  {
    objc_msgSend_setQrAccessToken_(self, v5, v7, v6);
    v4 = v10;
  }
  v8 = *((_QWORD *)v4 + 5);
  if (v8)
  {
    objc_msgSend_setSoftwareVersion_(self, v5, v8, v6);
    v4 = v10;
  }
  v9 = *((_BYTE *)v4 + 48);
  if ((v9 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0)
      goto LABEL_7;
LABEL_11:
    self->_webParticipantCapabilities = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 48) & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_participantCapabilities = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v9 = *((_BYTE *)v4 + 48);
  if ((v9 & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v9 & 4) != 0)
  {
LABEL_8:
    self->_serviceId = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_9:

}

- (NSData)qrAccessToken
{
  return self->_qrAccessToken;
}

- (void)setQrAccessToken:(id)a3
{
  objc_storeStrong((id *)&self->_qrAccessToken, a3);
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_softwareVersion, a3);
}

- (unint64_t)participantCapabilities
{
  return self->_participantCapabilities;
}

- (unint64_t)webParticipantCapabilities
{
  return self->_webParticipantCapabilities;
}

- (unsigned)serviceId
{
  return self->_serviceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_qrAccessToken, 0);
}

@end
