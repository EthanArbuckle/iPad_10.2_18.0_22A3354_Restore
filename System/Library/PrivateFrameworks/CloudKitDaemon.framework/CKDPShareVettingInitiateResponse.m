@implementation CKDPShareVettingInitiateResponse

- (int)vettingError
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_vettingError;
  else
    return 1;
}

- (void)setVettingError:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_vettingError = a3;
}

- (void)setHasVettingError:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVettingError
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)vettingErrorAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E7836758[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVettingError:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("isVettedToCaller")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("isVettedToOther")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("isLimitExceeded")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("serverError")) & 1) != 0)
  {
    v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("loginRequired")))
  {
    v6 = 5;
  }
  else
  {
    v6 = 1;
  }

  return v6;
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
  v11.super_class = (Class)CKDPShareVettingInitiateResponse;
  -[CKDPShareVettingInitiateResponse description](&v11, sel_description);
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
  void *v5;
  unsigned int v6;
  __CFString *v7;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = self->_vettingError - 1;
    if (v6 >= 5)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_vettingError);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E7836758[v6];
    }
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, CFSTR("vettingError"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBC712C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_vettingError;
    *((_BYTE *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id result;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  result = (id)objc_msgSend_init(v7, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_vettingError;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_6;
  v7 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_vettingError == *((_DWORD *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v7 = 0;
  }
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_vettingError;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_vettingError = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

@end
