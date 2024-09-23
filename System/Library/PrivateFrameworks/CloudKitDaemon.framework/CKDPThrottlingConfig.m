@implementation CKDPThrottlingConfig

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasCriteria
{
  return self->_criteria != 0;
}

- (BOOL)hasRateLimit
{
  return self->_rateLimit != 0;
}

- (void)setTtlSec:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ttlSec = a3;
}

- (void)setHasTtlSec:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTtlSec
{
  return *(_BYTE *)&self->_has & 1;
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
  v11.super_class = (Class)CKDPThrottlingConfig;
  -[CKDPThrottlingConfig description](&v11, sel_description);
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
  void *v4;
  const char *v5;
  void *v6;
  NSString *label;
  CKDPThrottlingConfigCriteria *criteria;
  void *v9;
  const char *v10;
  CKDPThrottlingConfigRateLimit *rateLimit;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  label = self->_label;
  if (label)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)label, CFSTR("label"));
  criteria = self->_criteria;
  if (criteria)
  {
    objc_msgSend_dictionaryRepresentation(criteria, v5, (uint64_t)label);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("criteria"));

  }
  rateLimit = self->_rateLimit;
  if (rateLimit)
  {
    objc_msgSend_dictionaryRepresentation(rateLimit, v5, (uint64_t)label);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("rateLimit"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, self->_ttlSec);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("ttlSec"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAD1480((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_criteria)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rateLimit)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *label;
  CKDPThrottlingConfigCriteria *criteria;
  CKDPThrottlingConfigRateLimit *rateLimit;
  id v9;

  v4 = a3;
  label = self->_label;
  v9 = v4;
  if (label)
  {
    objc_msgSend_setLabel_(v4, v5, (uint64_t)label);
    v4 = v9;
  }
  criteria = self->_criteria;
  if (criteria)
  {
    objc_msgSend_setCriteria_(v9, v5, (uint64_t)criteria);
    v4 = v9;
  }
  rateLimit = self->_rateLimit;
  if (rateLimit)
  {
    objc_msgSend_setRateLimit_(v9, v5, (uint64_t)rateLimit);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_ttlSec;
    *((_BYTE *)v4 + 36) |= 1u;
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
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_label, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_criteria, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_rateLimit, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_ttlSec;
    *(_BYTE *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *label;
  uint64_t v9;
  CKDPThrottlingConfigCriteria *criteria;
  uint64_t v11;
  CKDPThrottlingConfigRateLimit *rateLimit;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_12;
  label = self->_label;
  v9 = v4[2];
  if ((unint64_t)label | v9)
  {
    if (!objc_msgSend_isEqual_(label, v7, v9))
      goto LABEL_12;
  }
  criteria = self->_criteria;
  v11 = v4[1];
  if ((unint64_t)criteria | v11)
  {
    if (!objc_msgSend_isEqual_(criteria, v7, v11))
      goto LABEL_12;
  }
  rateLimit = self->_rateLimit;
  v13 = v4[3];
  if ((unint64_t)rateLimit | v13)
  {
    if (!objc_msgSend_isEqual_(rateLimit, v7, v13))
      goto LABEL_12;
  }
  v14 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_ttlSec == *((_DWORD *)v4 + 8))
    {
      v14 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v14 = 0;
  }
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend_hash(self->_label, a2, v2);
  v7 = objc_msgSend_hash(self->_criteria, v5, v6);
  v10 = objc_msgSend_hash(self->_rateLimit, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_ttlSec;
  else
    v11 = 0;
  return v7 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  CKDPThrottlingConfigCriteria *criteria;
  uint64_t v7;
  CKDPThrottlingConfigRateLimit *rateLimit;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 2);
  v10 = v4;
  if (v5)
  {
    objc_msgSend_setLabel_(self, (const char *)v4, v5);
    v4 = v10;
  }
  criteria = self->_criteria;
  v7 = *((_QWORD *)v4 + 1);
  if (criteria)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(criteria, (const char *)v4, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_setCriteria_(self, (const char *)v4, v7);
  }
  v4 = v10;
LABEL_9:
  rateLimit = self->_rateLimit;
  v9 = *((_QWORD *)v4 + 3);
  if (rateLimit)
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_mergeFrom_(rateLimit, (const char *)v4, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_setRateLimit_(self, (const char *)v4, v9);
  }
  v4 = v10;
LABEL_15:
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_ttlSec = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CKDPThrottlingConfigCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_criteria, a3);
}

- (CKDPThrottlingConfigRateLimit)rateLimit
{
  return self->_rateLimit;
}

- (void)setRateLimit:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimit, a3);
}

- (int)ttlSec
{
  return self->_ttlSec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimit, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
}

@end
