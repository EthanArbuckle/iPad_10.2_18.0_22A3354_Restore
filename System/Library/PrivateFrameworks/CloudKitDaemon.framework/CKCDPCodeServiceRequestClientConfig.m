@implementation CKCDPCodeServiceRequestClientConfig

- (int)serviceType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_serviceType;
  else
    return 1;
}

- (void)setServiceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serviceType = a3;
}

- (void)setHasServiceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServiceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)serviceTypeAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_1E78385D8[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsServiceType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PUSH")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("DATABASE")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("CONTENT")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("CALDAV")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("ESCROWPROXY")) & 1) != 0)
  {
    v6 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("QUOTA")))
  {
    v6 = 6;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasConfig
{
  return self->_config != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestClientConfig;
  -[CKCDPCodeServiceRequestClientConfig description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  CKCDPCodeServiceRequestServiceClientConfig *config;
  void *v10;
  const char *v11;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = self->_serviceType - 1;
    if (v7 >= 6)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_serviceType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E78385D8[v7];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v8, CFSTR("serviceType"));

  }
  config = self->_config;
  if (config)
  {
    objc_msgSend_dictionaryRepresentation(config, v4, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("config"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC5AD44((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_config)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  CKCDPCodeServiceRequestServiceClientConfig *config;
  _DWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_serviceType;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  config = self->_config;
  if (config)
  {
    v7 = v4;
    objc_msgSend_setConfig_(v4, v5, (uint64_t)config);
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_serviceType;
    *(_BYTE *)(v10 + 20) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_config, v11, (uint64_t)a3);
  v14 = (void *)v12[1];
  v12[1] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKCDPCodeServiceRequestServiceClientConfig *config;
  uint64_t v9;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_serviceType != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    isEqual = 0;
    goto LABEL_10;
  }
  config = self->_config;
  v9 = v4[1];
  if ((unint64_t)config | v9)
    isEqual = objc_msgSend_isEqual_(config, v7, v9);
  else
    isEqual = 1;
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_serviceType;
  else
    v3 = 0;
  return objc_msgSend_hash(self->_config, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  CKCDPCodeServiceRequestServiceClientConfig *config;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[5] & 1) != 0)
  {
    self->_serviceType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  config = self->_config;
  v7 = v5[1];
  if (config)
  {
    if (v7)
    {
      v8 = v5;
      objc_msgSend_mergeFrom_(config, (const char *)v5, v7);
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    objc_msgSend_setConfig_(self, (const char *)v5, v7);
    goto LABEL_8;
  }

}

- (CKCDPCodeServiceRequestServiceClientConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
