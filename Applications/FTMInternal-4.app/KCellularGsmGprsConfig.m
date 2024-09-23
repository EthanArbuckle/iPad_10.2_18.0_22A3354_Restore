@implementation KCellularGsmGprsConfig

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setGprsSup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_gprsSup = a3;
}

- (void)setHasGprsSup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasGprsSup
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRac:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rac = a3;
}

- (void)setHasRac:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRac
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSpPgCy:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_spPgCy = a3;
}

- (void)setHasSpPgCy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSpPgCy
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setNco:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_nco = a3;
}

- (void)setHasNco:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNco
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNom:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_nom = a3;
}

- (void)setHasNom:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNom
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCrHyst:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_crHyst = a3;
}

- (void)setHasCrHyst:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCrHyst
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAccThr:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accThr = a3;
}

- (void)setHasAccThr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccThr
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setExtUplTbfSupported:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_extUplTbfSupported = a3;
}

- (void)setHasExtUplTbfSupported:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasExtUplTbfSupported
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPriorityClass:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_priorityClass = a3;
}

- (void)setHasPriorityClass:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPriorityClass
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCellBarAccess2:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cellBarAccess2 = a3;
}

- (void)setHasCellBarAccess2:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCellBarAccess2
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularGsmGprsConfig;
  v3 = -[KCellularGsmGprsConfig description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularGsmGprsConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_gprsSup));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("gprs_sup"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rac));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rac"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_spPgCy));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sp_pg_cy"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nco));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("nco"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nom));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("nom"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_crHyst));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cr_hyst"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_accThr));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("acc_thr"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_extUplTbfSupported));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ext_upl_tbf_supported"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
LABEL_25:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellBarAccess2));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("cell_bar_access_2"));

    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_24:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_priorityClass));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("priority_class"));

  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x100) != 0)
  {
LABEL_13:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100098580((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField(v5, self->_gprsSup, 2);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v5, self->_rac, 3);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField(v5, self->_spPgCy, 4);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(v5, self->_nco, 5);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v5, self->_nom, 6);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(v5, self->_crHyst, 7);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field(v5, self->_accThr, 8);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField(v5, self->_extUplTbfSupported, 9);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
LABEL_25:
    PBDataWriterWriteUint32Field(v5, self->_cellBarAccess2, 11);
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v5, self->_priorityClass, 10);
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x100) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
LABEL_14:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 49) = self->_gprsSup;
  *((_WORD *)v4 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 10) = self->_rac;
  *((_WORD *)v4 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)v4 + 50) = self->_spPgCy;
  *((_WORD *)v4 + 26) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 7) = self->_nco;
  *((_WORD *)v4 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 8) = self->_nom;
  *((_WORD *)v4 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 6) = self->_crHyst;
  *((_WORD *)v4 + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 4) = self->_accThr;
  *((_WORD *)v4 + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)v4 + 48) = self->_extUplTbfSupported;
  *((_WORD *)v4 + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
LABEL_25:
    *((_DWORD *)v4 + 5) = self->_cellBarAccess2;
    *((_WORD *)v4 + 26) |= 4u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  *((_DWORD *)v4 + 9) = self->_priorityClass;
  *((_WORD *)v4 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x100) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_WORD *)v4 + 26) |= 0x100u;
  }
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 49) = self->_gprsSup;
  *((_WORD *)result + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_rac;
  *((_WORD *)result + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)result + 50) = self->_spPgCy;
  *((_WORD *)result + 26) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_nco;
  *((_WORD *)result + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 8) = self->_nom;
  *((_WORD *)result + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_crHyst;
  *((_WORD *)result + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 4) = self->_accThr;
  *((_WORD *)result + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)result + 48) = self->_extUplTbfSupported;
  *((_WORD *)result + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 9) = self->_priorityClass;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 5) = self->_cellBarAccess2;
  *((_WORD *)result + 26) |= 4u;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    return result;
LABEL_13:
  *((_DWORD *)result + 11) = self->_subsId;
  *((_WORD *)result + 26) |= 0x100u;
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
    goto LABEL_71;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 26);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_71;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0)
      goto LABEL_71;
    if (self->_gprsSup)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_rac != *((_DWORD *)v4 + 10))
      goto LABEL_71;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x800) == 0)
      goto LABEL_71;
    if (self->_spPgCy)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x800) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_nco != *((_DWORD *)v4 + 7))
      goto LABEL_71;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_nom != *((_DWORD *)v4 + 8))
      goto LABEL_71;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_crHyst != *((_DWORD *)v4 + 6))
      goto LABEL_71;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_accThr != *((_DWORD *)v4 + 4))
      goto LABEL_71;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    {
      if (self->_extUplTbfSupported)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_71;
        goto LABEL_56;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_56;
    }
LABEL_71:
    v8 = 0;
    goto LABEL_72;
  }
  if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    goto LABEL_71;
LABEL_56:
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_priorityClass != *((_DWORD *)v4 + 9))
      goto LABEL_71;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_cellBarAccess2 != *((_DWORD *)v4 + 5))
      goto LABEL_71;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 11))
      goto LABEL_71;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 0x100) == 0;
  }
LABEL_72:

  return v8;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
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
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_gprsSup;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_rac;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_spPgCy;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_nco;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_nom;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_crHyst;
    if ((has & 2) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_accThr;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_extUplTbfSupported;
    if ((has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_priorityClass;
    if ((has & 4) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_13;
LABEL_25:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  v12 = 0;
  if ((has & 4) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761 * self->_cellBarAccess2;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_gprsSup = *((_BYTE *)v4 + 49);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_rac = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x800) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_spPgCy = *((_BYTE *)v4 + 50);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_nco = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_nom = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_crHyst = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_accThr = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_extUplTbfSupported = *((_BYTE *)v4 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0)
      goto LABEL_12;
LABEL_25:
    self->_cellBarAccess2 = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 4u;
    if ((*((_WORD *)v4 + 26) & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  self->_priorityClass = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v5 & 0x100) != 0)
  {
LABEL_13:
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_14:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)gprsSup
{
  return self->_gprsSup;
}

- (unsigned)rac
{
  return self->_rac;
}

- (BOOL)spPgCy
{
  return self->_spPgCy;
}

- (unsigned)nco
{
  return self->_nco;
}

- (unsigned)nom
{
  return self->_nom;
}

- (unsigned)crHyst
{
  return self->_crHyst;
}

- (unsigned)accThr
{
  return self->_accThr;
}

- (BOOL)extUplTbfSupported
{
  return self->_extUplTbfSupported;
}

- (unsigned)priorityClass
{
  return self->_priorityClass;
}

- (unsigned)cellBarAccess2
{
  return self->_cellBarAccess2;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
