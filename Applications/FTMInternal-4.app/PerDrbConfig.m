@implementation PerDrbConfig

- (void)setDrbId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_drbId = a3;
}

- (void)setHasDrbId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDrbId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (int)ulRlcPath
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_ulRlcPath;
  else
    return 0;
}

- (void)setUlRlcPath:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_ulRlcPath = a3;
}

- (void)setHasUlRlcPath:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasUlRlcPath
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)ulRlcPathAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025E700[a3];
}

- (int)StringAsUlRlcPath:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RB_PATH_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RB_PATH_LTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RB_PATH_NR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RB_PATH_LTE_AND_NR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setUlDataSplitThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ulDataSplitThreshold = a3;
}

- (void)setHasUlDataSplitThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasUlDataSplitThreshold
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setUlPdcpDuplication:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_ulPdcpDuplication = a3;
}

- (void)setHasUlPdcpDuplication:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUlPdcpDuplication
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setUlRohcEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_ulRohcEnabled = a3;
}

- (void)setHasUlRohcEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUlRohcEnabled
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setUlIntegrityEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_ulIntegrityEnabled = a3;
}

- (void)setHasUlIntegrityEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUlIntegrityEnabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setUlCipheringEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_ulCipheringEnabled = a3;
}

- (void)setHasUlCipheringEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasUlCipheringEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setUlMoreThanOneRlcPresent:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_ulMoreThanOneRlcPresent = a3;
}

- (void)setHasUlMoreThanOneRlcPresent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUlMoreThanOneRlcPresent
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)dlRlcPath
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_dlRlcPath;
  else
    return 0;
}

- (void)setDlRlcPath:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_dlRlcPath = a3;
}

- (void)setHasDlRlcPath:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDlRlcPath
{
  return *(_WORD *)&self->_has & 1;
}

- (id)dlRlcPathAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025E700[a3];
}

- (int)StringAsDlRlcPath:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RB_PATH_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RB_PATH_LTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RB_PATH_NR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RB_PATH_LTE_AND_NR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDlRohcEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_dlRohcEnabled = a3;
}

- (void)setHasDlRohcEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDlRohcEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDlIntegrityEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_dlIntegrityEnabled = a3;
}

- (void)setHasDlIntegrityEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDlIntegrityEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDlCipheringEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dlCipheringEnabled = a3;
}

- (void)setHasDlCipheringEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDlCipheringEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PerDrbConfig;
  v3 = -[PerDrbConfig description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PerDrbConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  uint64_t ulRlcPath;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t dlRlcPath;
  __CFString *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drbId));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("drb_id"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  ulRlcPath = self->_ulRlcPath;
  if (ulRlcPath >= 4)
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ulRlcPath));
  else
    v9 = off_10025E700[ulRlcPath];
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ul_rlc_path"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulDataSplitThreshold));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ul_data_split_threshold"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ulPdcpDuplication));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ul_pdcp_duplication"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ulRohcEnabled));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ul_rohc_enabled"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ulIntegrityEnabled));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ul_integrity_enabled"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ulCipheringEnabled));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ul_ciphering_enabled"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ulMoreThanOneRlcPresent));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ul_more_than_one_rlc_present"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_26:
  dlRlcPath = self->_dlRlcPath;
  if (dlRlcPath >= 4)
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dlRlcPath));
  else
    v17 = off_10025E700[dlRlcPath];
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("dl_rlc_path"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
LABEL_31:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_dlIntegrityEnabled));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("dl_integrity_enabled"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_30:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_dlRohcEnabled));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("dl_rohc_enabled"));

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_31;
LABEL_12:
  if ((has & 0x10) != 0)
  {
LABEL_13:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_dlCipheringEnabled));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dl_ciphering_enabled"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000A380((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_drbId, 1);
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_ulRlcPath, 2);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v5, self->_ulDataSplitThreshold, 3);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField(v5, self->_ulPdcpDuplication, 4);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField(v5, self->_ulRohcEnabled, 5);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField(v5, self->_ulIntegrityEnabled, 6);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField(v5, self->_ulCipheringEnabled, 7);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField(v5, self->_ulMoreThanOneRlcPresent, 8);
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field(v5, self->_dlRlcPath, 9);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
LABEL_25:
    PBDataWriterWriteBOOLField(v5, self->_dlIntegrityEnabled, 11);
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteBOOLField(v5, self->_dlRohcEnabled, 10);
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x10) != 0)
LABEL_13:
    PBDataWriterWriteBOOLField(v5, self->_dlCipheringEnabled, 12);
LABEL_14:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_drbId;
    *((_WORD *)v4 + 16) |= 2u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_ulRlcPath;
  *((_WORD *)v4 + 16) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v4[4] = self->_ulDataSplitThreshold;
  *((_WORD *)v4 + 16) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)v4 + 30) = self->_ulPdcpDuplication;
  *((_WORD *)v4 + 16) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v4 + 31) = self->_ulRohcEnabled;
  *((_WORD *)v4 + 16) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v4 + 28) = self->_ulIntegrityEnabled;
  *((_WORD *)v4 + 16) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)v4 + 27) = self->_ulCipheringEnabled;
  *((_WORD *)v4 + 16) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)v4 + 29) = self->_ulMoreThanOneRlcPresent;
  *((_WORD *)v4 + 16) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v4[2] = self->_dlRlcPath;
  *((_WORD *)v4 + 16) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
LABEL_25:
    *((_BYTE *)v4 + 25) = self->_dlIntegrityEnabled;
    *((_WORD *)v4 + 16) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  *((_BYTE *)v4 + 26) = self->_dlRohcEnabled;
  *((_WORD *)v4 + 16) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x10) != 0)
  {
LABEL_13:
    *((_BYTE *)v4 + 24) = self->_dlCipheringEnabled;
    *((_WORD *)v4 + 16) |= 0x10u;
  }
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_drbId;
    *((_WORD *)result + 16) |= 2u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_ulRlcPath;
  *((_WORD *)result + 16) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 4) = self->_ulDataSplitThreshold;
  *((_WORD *)result + 16) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)result + 30) = self->_ulPdcpDuplication;
  *((_WORD *)result + 16) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)result + 31) = self->_ulRohcEnabled;
  *((_WORD *)result + 16) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)result + 28) = self->_ulIntegrityEnabled;
  *((_WORD *)result + 16) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)result + 27) = self->_ulCipheringEnabled;
  *((_WORD *)result + 16) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)result + 29) = self->_ulMoreThanOneRlcPresent;
  *((_WORD *)result + 16) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 2) = self->_dlRlcPath;
  *((_WORD *)result + 16) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_BYTE *)result + 26) = self->_dlRohcEnabled;
  *((_WORD *)result + 16) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_BYTE *)result + 25) = self->_dlIntegrityEnabled;
  *((_WORD *)result + 16) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) == 0)
    return result;
LABEL_13:
  *((_BYTE *)result + 24) = self->_dlCipheringEnabled;
  *((_WORD *)result + 16) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_81;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 16);
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_drbId != *((_DWORD *)v4 + 3))
      goto LABEL_81;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_ulRlcPath != *((_DWORD *)v4 + 5))
      goto LABEL_81;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_ulDataSplitThreshold != *((_DWORD *)v4 + 4))
      goto LABEL_81;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 16) & 0x400) == 0)
      goto LABEL_81;
    if (self->_ulPdcpDuplication)
    {
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 30))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 16) & 0x400) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 16) & 0x800) == 0)
      goto LABEL_81;
    if (self->_ulRohcEnabled)
    {
      if (!*((_BYTE *)v4 + 31))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 31))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 16) & 0x800) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 16) & 0x100) == 0)
      goto LABEL_81;
    if (self->_ulIntegrityEnabled)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 16) & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_81;
    if (self->_ulCipheringEnabled)
    {
      if (!*((_BYTE *)v4 + 27))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 27))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 16) & 0x200) == 0)
      goto LABEL_81;
    if (self->_ulMoreThanOneRlcPresent)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 16) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_dlRlcPath != *((_DWORD *)v4 + 2))
      goto LABEL_81;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_81;
    if (self->_dlRohcEnabled)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_81;
    if (self->_dlIntegrityEnabled)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) != 0)
    {
      if (self->_dlCipheringEnabled)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_81;
      }
      else if (*((_BYTE *)v4 + 24))
      {
        goto LABEL_81;
      }
      v8 = 1;
      goto LABEL_82;
    }
LABEL_81:
    v8 = 0;
    goto LABEL_82;
  }
  v8 = (v7 & 0x10) == 0;
LABEL_82:

  return v8;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v3 = 2654435761 * self->_drbId;
    if ((has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_ulRlcPath;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_ulDataSplitThreshold;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_ulPdcpDuplication;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_ulRohcEnabled;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_ulIntegrityEnabled;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_ulCipheringEnabled;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_ulMoreThanOneRlcPresent;
    if ((has & 1) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((has & 1) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_dlRlcPath;
    if ((has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_dlRohcEnabled;
    if ((has & 0x20) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_13;
LABEL_25:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  v12 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761 * self->_dlIntegrityEnabled;
  if ((has & 0x10) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761 * self->_dlCipheringEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_drbId = *((_DWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)v4 + 16);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_ulRlcPath = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_ulDataSplitThreshold = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_ulPdcpDuplication = *((_BYTE *)v4 + 30);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_ulRohcEnabled = *((_BYTE *)v4 + 31);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_ulIntegrityEnabled = *((_BYTE *)v4 + 28);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_ulCipheringEnabled = *((_BYTE *)v4 + 27);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_ulMoreThanOneRlcPresent = *((_BYTE *)v4 + 29);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_dlRlcPath = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
LABEL_25:
    self->_dlIntegrityEnabled = *((_BYTE *)v4 + 25);
    *(_WORD *)&self->_has |= 0x20u;
    if ((*((_WORD *)v4 + 16) & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  self->_dlRohcEnabled = *((_BYTE *)v4 + 26);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 16);
  if ((v5 & 0x20) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v5 & 0x10) != 0)
  {
LABEL_13:
    self->_dlCipheringEnabled = *((_BYTE *)v4 + 24);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_14:

}

- (unsigned)drbId
{
  return self->_drbId;
}

- (unsigned)ulDataSplitThreshold
{
  return self->_ulDataSplitThreshold;
}

- (BOOL)ulPdcpDuplication
{
  return self->_ulPdcpDuplication;
}

- (BOOL)ulRohcEnabled
{
  return self->_ulRohcEnabled;
}

- (BOOL)ulIntegrityEnabled
{
  return self->_ulIntegrityEnabled;
}

- (BOOL)ulCipheringEnabled
{
  return self->_ulCipheringEnabled;
}

- (BOOL)ulMoreThanOneRlcPresent
{
  return self->_ulMoreThanOneRlcPresent;
}

- (BOOL)dlRohcEnabled
{
  return self->_dlRohcEnabled;
}

- (BOOL)dlIntegrityEnabled
{
  return self->_dlIntegrityEnabled;
}

- (BOOL)dlCipheringEnabled
{
  return self->_dlCipheringEnabled;
}

@end
