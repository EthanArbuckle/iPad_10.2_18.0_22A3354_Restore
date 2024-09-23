@implementation IDSQRProtoPluginControlResponse

- (void)setPluginParticipantId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pluginParticipantId = a3;
}

- (void)setHasPluginParticipantId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPluginParticipantId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPluginServerCertHostname
{
  return self->_pluginServerCertHostname != 0;
}

- (BOOL)hasPluginServerCertOid
{
  return self->_pluginServerCertOid != 0;
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
  v13.super_class = (Class)IDSQRProtoPluginControlResponse;
  -[IDSQRProtoPluginControlResponse description](&v13, sel_description);
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
  const char *v5;
  void *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  NSString *pluginServerCertHostname;
  NSString *pluginServerCertOid;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_pluginParticipantId, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, v10, CFSTR("plugin_participant_id"));

  }
  pluginServerCertHostname = self->_pluginServerCertHostname;
  if (pluginServerCertHostname)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)pluginServerCertHostname, v7, CFSTR("plugin_server_cert_hostname"));
  pluginServerCertOid = self->_pluginServerCertOid;
  if (pluginServerCertOid)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)pluginServerCertOid, v7, CFSTR("plugin_server_cert_oid"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPluginControlResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_pluginServerCertHostname)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_pluginServerCertOid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  const char *v5;
  double v6;
  NSString *pluginServerCertHostname;
  NSString *pluginServerCertOid;
  _QWORD *v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_pluginParticipantId;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  pluginServerCertHostname = self->_pluginServerCertHostname;
  v9 = v4;
  if (pluginServerCertHostname)
  {
    objc_msgSend_setPluginServerCertHostname_(v4, v5, (uint64_t)pluginServerCertHostname, v6);
    v4 = v9;
  }
  pluginServerCertOid = self->_pluginServerCertOid;
  if (pluginServerCertOid)
  {
    objc_msgSend_setPluginServerCertOid_(v9, v5, (uint64_t)pluginServerCertOid, v6);
    v4 = v9;
  }

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
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  void *v21;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v12 + 8) = self->_pluginParticipantId;
    *(_BYTE *)(v12 + 32) |= 1u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_pluginServerCertHostname, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[2];
  v15[2] = v16;

  v20 = objc_msgSend_copyWithZone_(self->_pluginServerCertOid, v18, (uint64_t)a3, v19);
  v21 = (void *)v15[3];
  v15[3] = v20;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSString *pluginServerCertHostname;
  uint64_t v11;
  NSString *pluginServerCertOid;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_pluginParticipantId != v4[1])
      goto LABEL_11;
  }
  else if ((v4[4] & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  pluginServerCertHostname = self->_pluginServerCertHostname;
  v11 = v4[2];
  if ((unint64_t)pluginServerCertHostname | v11
    && !objc_msgSend_isEqual_(pluginServerCertHostname, v8, v11, v9))
  {
    goto LABEL_11;
  }
  pluginServerCertOid = self->_pluginServerCertOid;
  v13 = v4[3];
  if ((unint64_t)pluginServerCertOid | v13)
    isEqual = objc_msgSend_isEqual_(pluginServerCertOid, v8, v13, v9);
  else
    isEqual = 1;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  unint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_pluginParticipantId;
  else
    v5 = 0;
  v6 = objc_msgSend_hash(self->_pluginServerCertHostname, a2, v2, v3) ^ v5;
  return v6 ^ objc_msgSend_hash(self->_pluginServerCertOid, v7, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  if ((v4[4] & 1) != 0)
  {
    self->_pluginParticipantId = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = v4[2];
  v9 = v4;
  if (v7)
  {
    objc_msgSend_setPluginServerCertHostname_(self, v5, v7, v6);
    v4 = v9;
  }
  v8 = v4[3];
  if (v8)
  {
    objc_msgSend_setPluginServerCertOid_(self, v5, v8, v6);
    v4 = v9;
  }

}

- (unint64_t)pluginParticipantId
{
  return self->_pluginParticipantId;
}

- (NSString)pluginServerCertHostname
{
  return self->_pluginServerCertHostname;
}

- (void)setPluginServerCertHostname:(id)a3
{
  objc_storeStrong((id *)&self->_pluginServerCertHostname, a3);
}

- (NSString)pluginServerCertOid
{
  return self->_pluginServerCertOid;
}

- (void)setPluginServerCertOid:(id)a3
{
  objc_storeStrong((id *)&self->_pluginServerCertOid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginServerCertOid, 0);
  objc_storeStrong((id *)&self->_pluginServerCertHostname, 0);
}

@end
