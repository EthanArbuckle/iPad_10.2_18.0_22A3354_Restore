@implementation CKDPZoneCapabilities

- (void)setAtomicSaves:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_atomicSaves = a3;
}

- (void)setHasAtomicSaves:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAtomicSaves
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFetchChanges:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_fetchChanges = a3;
}

- (void)setHasFetchChanges:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFetchChanges
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCkql:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_ckql = a3;
}

- (void)setHasCkql:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCkql
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)sharingType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_sharingType;
  else
    return 1;
}

- (void)setSharingType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sharingType = a3;
}

- (void)setHasSharingType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSharingType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)sharingTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7836B38[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSharingType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("none")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("hierarchical")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("zoneWide")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)setZoneSharing:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_zoneSharing = a3;
}

- (void)setHasZoneSharing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasZoneSharing
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHierarchicalSharing:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_hierarchicalSharing = a3;
}

- (void)setHasHierarchicalSharing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHierarchicalSharing
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v11.super_class = (Class)CKDPZoneCapabilities;
  -[CKDPZoneCapabilities description](&v11, sel_description);
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
  char has;
  void *v7;
  const char *v8;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  unsigned int v16;
  __CFString *v17;
  void *v18;
  const char *v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_atomicSaves);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, CFSTR("atomicSaves"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_fetchChanges);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, CFSTR("fetchChanges"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_ckql);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, CFSTR("ckql"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_16:
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_zoneSharing);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, CFSTR("zoneSharing"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v5;
    goto LABEL_7;
  }
LABEL_12:
  v16 = self->_sharingType - 1;
  if (v16 >= 3)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_sharingType);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E7836B38[v16];
  }
  objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v17, CFSTR("sharingType"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_16;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_hierarchicalSharing);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, CFSTR("hierarchicalSharing"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBD7050((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_atomicSaves;
    v4[20] |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[14] = self->_fetchChanges;
  v4[20] |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4[13] = self->_ckql;
  v4[20] |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    v4[16] = self->_zoneSharing;
    v4[20] |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_DWORD *)v4 + 2) = self->_sharingType;
  v4[20] |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v4[15] = self->_hierarchicalSharing;
    v4[20] |= 0x10u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id result;
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  result = (id)objc_msgSend_init(v7, v8, v9);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 12) = self->_atomicSaves;
    *((_BYTE *)result + 20) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 14) = self->_fetchChanges;
  *((_BYTE *)result + 20) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)result + 13) = self->_ckql;
  *((_BYTE *)result + 20) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 2) = self->_sharingType;
  *((_BYTE *)result + 20) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_BYTE *)result + 16) = self->_zoneSharing;
  *((_BYTE *)result + 20) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_7:
  *((_BYTE *)result + 15) = self->_hierarchicalSharing;
  *((_BYTE *)result + 20) |= 0x10u;
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
    goto LABEL_41;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_41;
    if (self->_atomicSaves)
    {
      if (!*((_BYTE *)v4 + 12))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 8) == 0)
      goto LABEL_41;
    if (self->_fetchChanges)
    {
      if (!*((_BYTE *)v4 + 14))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 14))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_41;
    if (self->_ckql)
    {
      if (!*((_BYTE *)v4 + 13))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 13))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_sharingType != *((_DWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x20) == 0)
      goto LABEL_41;
    if (self->_zoneSharing)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  v7 = (*((_BYTE *)v4 + 20) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x10) != 0)
    {
      if (self->_hierarchicalSharing)
      {
        if (!*((_BYTE *)v4 + 15))
          goto LABEL_41;
      }
      else if (*((_BYTE *)v4 + 15))
      {
        goto LABEL_41;
      }
      v7 = 1;
      goto LABEL_42;
    }
LABEL_41:
    v7 = 0;
  }
LABEL_42:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_atomicSaves;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_fetchChanges;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_ckql;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_sharingType;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_zoneSharing;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_hierarchicalSharing;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_atomicSaves = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 20);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_fetchChanges = *((_BYTE *)v4 + 14);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_ckql = *((_BYTE *)v4 + 13);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    self->_zoneSharing = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 0x20u;
    if ((*((_BYTE *)v4 + 20) & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_sharingType = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    self->_hierarchicalSharing = *((_BYTE *)v4 + 15);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_8:

}

- (BOOL)atomicSaves
{
  return self->_atomicSaves;
}

- (BOOL)fetchChanges
{
  return self->_fetchChanges;
}

- (BOOL)ckql
{
  return self->_ckql;
}

- (BOOL)zoneSharing
{
  return self->_zoneSharing;
}

- (BOOL)hierarchicalSharing
{
  return self->_hierarchicalSharing;
}

@end
