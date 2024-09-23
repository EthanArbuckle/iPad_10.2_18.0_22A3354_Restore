@implementation LIGHTHOUSE_BITACORA_PROTOScheduleStatus

- (void)setScheduled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_scheduled = a3;
}

- (void)setHasScheduled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScheduled
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOScheduleStatus;
  -[LIGHTHOUSE_BITACORA_PROTOScheduleStatus description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("%@ %@"), v11, v12, v4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, self->_scheduled, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v9, v11, (uint64_t)v10, (uint64_t)CFSTR("scheduled"), v12);

  }
  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOScheduleStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)a3 + 8) = self->_scheduled;
    *((_BYTE *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  result = (id)objc_msgSend_init(v9, v10, v11, v12, v13);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_scheduled;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8))
    goto LABEL_4;
  v9 = (v4[12] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      v9 = 0;
      goto LABEL_5;
    }
    if (self->_scheduled)
    {
      if (!v4[8])
        goto LABEL_4;
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    v9 = 1;
  }
LABEL_5:

  return v9;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_scheduled;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_scheduled = *((_BYTE *)a3 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

@end
