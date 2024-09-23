@implementation CKDPRecordRetrieveChangesResponseShareChange

- (BOOL)hasShareIdentifier
{
  return self->_shareIdentifier != 0;
}

- (int)changeType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_changeType;
  else
    return 1;
}

- (void)setChangeType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)changeTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7835CA8[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChangeType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("idAndEtag")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("fullRecord")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("recordDeleted")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasShare
{
  return self->_share != 0;
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
  v11.super_class = (Class)CKDPRecordRetrieveChangesResponseShareChange;
  -[CKDPRecordRetrieveChangesResponseShareChange description](&v11, sel_description);
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
  CKDPShareIdentifier *shareIdentifier;
  void *v8;
  const char *v9;
  unsigned int v10;
  __CFString *v11;
  CKDPShare *share;
  void *v13;
  const char *v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  shareIdentifier = self->_shareIdentifier;
  if (shareIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(shareIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("shareIdentifier"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = self->_changeType - 1;
    if (v10 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_changeType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E7835CA8[v10];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v11, CFSTR("changeType"));

  }
  share = self->_share;
  if (share)
  {
    objc_msgSend_dictionaryRepresentation(share, v4, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("share"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB91238((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_shareIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_share)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPShareIdentifier *shareIdentifier;
  CKDPShare *share;
  id v8;

  v4 = a3;
  shareIdentifier = self->_shareIdentifier;
  v8 = v4;
  if (shareIdentifier)
  {
    objc_msgSend_setShareIdentifier_(v4, v5, (uint64_t)shareIdentifier);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_changeType;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  share = self->_share;
  if (share)
  {
    objc_msgSend_setShare_(v8, v5, (uint64_t)share);
    v4 = v8;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_shareIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 8) = self->_changeType;
    *(_BYTE *)(v10 + 32) |= 1u;
  }
  v15 = objc_msgSend_copyWithZone_(self->_share, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPShareIdentifier *shareIdentifier;
  uint64_t v9;
  CKDPShare *share;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_11;
  shareIdentifier = self->_shareIdentifier;
  v9 = v4[3];
  if ((unint64_t)shareIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(shareIdentifier, v7, v9))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_changeType != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((v4[4] & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  share = self->_share;
  v11 = v4[2];
  if ((unint64_t)share | v11)
    isEqual = objc_msgSend_isEqual_(share, v7, v11);
  else
    isEqual = 1;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend_hash(self->_shareIdentifier, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_changeType;
  else
    v7 = 0;
  return v7 ^ objc_msgSend_hash(self->_share, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPShareIdentifier *shareIdentifier;
  uint64_t v6;
  CKDPShare *share;
  uint64_t v8;
  id v9;

  v4 = a3;
  shareIdentifier = self->_shareIdentifier;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (shareIdentifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(shareIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setShareIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_changeType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  share = self->_share;
  v8 = *((_QWORD *)v4 + 2);
  if (share)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(share, (const char *)v4, v8);
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setShare_(self, (const char *)v4, v8);
    goto LABEL_14;
  }

}

- (CKDPShareIdentifier)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shareIdentifier, a3);
}

- (CKDPShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end
