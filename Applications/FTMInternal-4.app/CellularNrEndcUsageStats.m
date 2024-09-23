@implementation CellularNrEndcUsageStats

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

- (void)setMcgTput:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_mcgTput = a3;
}

- (void)setHasMcgTput:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMcgTput
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScgTput:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_scgTput = a3;
}

- (void)setHasScgTput:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScgTput
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasDrbConfig
{
  return self->_drbConfig != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setMcgDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_mcgDuration = a3;
}

- (void)setHasMcgDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMcgDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setScgDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_scgDuration = a3;
}

- (void)setHasScgDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasScgDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)deployment
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_deployment;
  else
    return 0;
}

- (void)setDeployment:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeployment
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)deploymentAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("DEPLOYMENT_SA");
  if (a3 == 1)
    v3 = CFSTR("DEPLOYMENT_NSA");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsDeployment:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEPLOYMENT_SA")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DEPLOYMENT_NSA"));

  return v4;
}

- (void)setReleaseTech:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_releaseTech = a3;
}

- (void)setHasReleaseTech:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasReleaseTech
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrEndcUsageStats;
  v3 = -[CellularNrEndcUsageStats description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrEndcUsageStats dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  DrbConfig *drbConfig;
  void *v7;
  __int16 v8;
  void *v9;
  NSData *plmn;
  __int16 v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int deployment;
  __CFString *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcgTput));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("mcg_tput"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scgTput));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("scg_tput"));

  }
LABEL_5:
  drbConfig = self->_drbConfig;
  if (drbConfig)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DrbConfig dictionaryRepresentation](drbConfig, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("drb_config"));

  }
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("subs_id"));

    v8 = (__int16)self->_has;
    if ((v8 & 0x10) == 0)
    {
LABEL_9:
      if ((v8 & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v8 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("num_subs"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ps_pref"));

  }
LABEL_11:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v11 = (__int16)self->_has;
  if ((v11 & 4) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcgDuration));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("mcg_duration"));

    v11 = (__int16)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_15:
      if ((v11 & 2) == 0)
        goto LABEL_16;
LABEL_27:
      deployment = self->_deployment;
      if (deployment)
      {
        if (deployment == 1)
          v21 = CFSTR("DEPLOYMENT_NSA");
        else
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deployment));
      }
      else
      {
        v21 = CFSTR("DEPLOYMENT_SA");
      }
      objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("deployment"));

      if ((*(_WORD *)&self->_has & 0x40) != 0)
        goto LABEL_17;
      return v3;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scgDuration));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("scg_duration"));

  v11 = (__int16)self->_has;
  if ((v11 & 2) != 0)
    goto LABEL_27;
LABEL_16:
  if ((v11 & 0x40) != 0)
  {
LABEL_17:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_releaseTech));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("release_tech"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007EA6C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  DrbConfig *drbConfig;
  __int16 v6;
  NSData *plmn;
  __int16 v8;
  id v9;

  v9 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v9, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v9, self->_mcgTput, 3);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field(v9, self->_scgTput, 4);
LABEL_5:
  drbConfig = self->_drbConfig;
  if (drbConfig)
    PBDataWriterWriteSubmessage(v9, drbConfig, 5);
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_subsId, 6);
    v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field(v9, self->_numSubs, 7);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field(v9, self->_psPref, 8);
LABEL_11:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v9, plmn, 9);
  v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_mcgDuration, 10);
    v8 = (__int16)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_15:
      if ((v8 & 2) == 0)
        goto LABEL_16;
LABEL_27:
      PBDataWriterWriteInt32Field(v9, self->_deployment, 12);
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field(v9, self->_scgDuration, 11);
  v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
    goto LABEL_27;
LABEL_16:
  if ((v8 & 0x40) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field(v9, self->_releaseTech, 13);
LABEL_18:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  _QWORD *v8;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 38) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_mcgTput;
  *((_WORD *)v4 + 38) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 17) = self->_scgTput;
    *((_WORD *)v4 + 38) |= 0x100u;
  }
LABEL_5:
  v8 = v4;
  if (self->_drbConfig)
  {
    objc_msgSend(v4, "setDrbConfig:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_subsId;
    *((_WORD *)v4 + 38) |= 0x200u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 10) = self->_numSubs;
  *((_WORD *)v4 + 38) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 14) = self->_psPref;
    *((_WORD *)v4 + 38) |= 0x20u;
  }
LABEL_11:
  if (self->_plmn)
  {
    objc_msgSend(v8, "setPlmn:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_mcgDuration;
    *((_WORD *)v4 + 38) |= 4u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_15:
      if ((v7 & 2) == 0)
        goto LABEL_16;
LABEL_27:
      *((_DWORD *)v4 + 4) = self->_deployment;
      *((_WORD *)v4 + 38) |= 2u;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 16) = self->_scgDuration;
  *((_WORD *)v4 + 38) |= 0x80u;
  v7 = (__int16)self->_has;
  if ((v7 & 2) != 0)
    goto LABEL_27;
LABEL_16:
  if ((v7 & 0x40) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 15) = self->_releaseTech;
    *((_WORD *)v4 + 38) |= 0x40u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  __int16 has;
  id v8;
  void *v9;
  __int16 v10;
  id v11;
  void *v12;
  __int16 v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 38) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 9) = self->_mcgTput;
  *((_WORD *)v5 + 38) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 17) = self->_scgTput;
    *((_WORD *)v5 + 38) |= 0x100u;
  }
LABEL_5:
  v8 = -[DrbConfig copyWithZone:](self->_drbConfig, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    *((_DWORD *)v6 + 18) = self->_subsId;
    *((_WORD *)v6 + 38) |= 0x200u;
    v10 = (__int16)self->_has;
    if ((v10 & 0x10) == 0)
    {
LABEL_7:
      if ((v10 & 0x20) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v6 + 10) = self->_numSubs;
  *((_WORD *)v6 + 38) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 14) = self->_psPref;
    *((_WORD *)v6 + 38) |= 0x20u;
  }
LABEL_9:
  v11 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v12 = (void *)v6[6];
  v6[6] = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_mcgDuration;
    *((_WORD *)v6 + 38) |= 4u;
    v13 = (__int16)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_11:
      if ((v13 & 2) == 0)
        goto LABEL_12;
LABEL_23:
      *((_DWORD *)v6 + 4) = self->_deployment;
      *((_WORD *)v6 + 38) |= 2u;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        return v6;
      goto LABEL_13;
    }
  }
  else if ((v13 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v6 + 16) = self->_scgDuration;
  *((_WORD *)v6 + 38) |= 0x80u;
  v13 = (__int16)self->_has;
  if ((v13 & 2) != 0)
    goto LABEL_23;
LABEL_12:
  if ((v13 & 0x40) != 0)
  {
LABEL_13:
    *((_DWORD *)v6 + 15) = self->_releaseTech;
    *((_WORD *)v6 + 38) |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  DrbConfig *drbConfig;
  __int16 v9;
  NSData *plmn;
  __int16 v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_58;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 38);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_58;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_mcgTput != *((_DWORD *)v4 + 9))
      goto LABEL_58;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_scgTput != *((_DWORD *)v4 + 17))
      goto LABEL_58;
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_58;
  }
  drbConfig = self->_drbConfig;
  if ((unint64_t)drbConfig | *((_QWORD *)v4 + 3))
  {
    if (!-[DrbConfig isEqual:](drbConfig, "isEqual:"))
      goto LABEL_58;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 38);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x200) == 0 || self->_subsId != *((_DWORD *)v4 + 18))
      goto LABEL_58;
  }
  else if ((*((_WORD *)v4 + 38) & 0x200) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_numSubs != *((_DWORD *)v4 + 10))
      goto LABEL_58;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_psPref != *((_DWORD *)v4 + 14))
      goto LABEL_58;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_58;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 6))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      has = (__int16)self->_has;
      goto LABEL_38;
    }
LABEL_58:
    v12 = 0;
    goto LABEL_59;
  }
LABEL_38:
  v11 = *((_WORD *)v4 + 38);
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_mcgDuration != *((_DWORD *)v4 + 8))
      goto LABEL_58;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_scgDuration != *((_DWORD *)v4 + 16))
      goto LABEL_58;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_deployment != *((_DWORD *)v4 + 4))
      goto LABEL_58;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_releaseTech != *((_DWORD *)v4 + 15))
      goto LABEL_58;
    v12 = 1;
  }
  else
  {
    v12 = (v11 & 0x40) == 0;
  }
LABEL_59:

  return v12;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    v4 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761u * self->_timestamp;
  if ((has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_mcgTput;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_scgTput;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[DrbConfig hash](self->_drbConfig, "hash");
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
    v9 = 0;
    if ((v8 & 0x10) != 0)
      goto LABEL_10;
LABEL_13:
    v10 = 0;
    if ((v8 & 0x20) != 0)
      goto LABEL_11;
    goto LABEL_14;
  }
  v9 = 2654435761 * self->_subsId;
  if ((v8 & 0x10) == 0)
    goto LABEL_13;
LABEL_10:
  v10 = 2654435761 * self->_numSubs;
  if ((v8 & 0x20) != 0)
  {
LABEL_11:
    v11 = 2654435761 * self->_psPref;
    goto LABEL_15;
  }
LABEL_14:
  v11 = 0;
LABEL_15:
  v12 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    v14 = 2654435761 * self->_mcgDuration;
    if ((v13 & 0x80) != 0)
    {
LABEL_17:
      v15 = 2654435761 * self->_scgDuration;
      if ((v13 & 2) != 0)
        goto LABEL_18;
LABEL_22:
      v16 = 0;
      if ((v13 & 0x40) != 0)
        goto LABEL_19;
LABEL_23:
      v17 = 0;
      return v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v7 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
    }
  }
  else
  {
    v14 = 0;
    if ((v13 & 0x80) != 0)
      goto LABEL_17;
  }
  v15 = 0;
  if ((v13 & 2) == 0)
    goto LABEL_22;
LABEL_18:
  v16 = 2654435761 * self->_deployment;
  if ((v13 & 0x40) == 0)
    goto LABEL_23;
LABEL_19:
  v17 = 2654435761 * self->_releaseTech;
  return v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v7 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  DrbConfig *drbConfig;
  uint64_t v8;
  __int16 v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 38);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 38);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mcgTput = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
LABEL_4:
    self->_scgTput = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_5:
  drbConfig = self->_drbConfig;
  v8 = *((_QWORD *)v5 + 3);
  v11 = v5;
  if (drbConfig)
  {
    if (!v8)
      goto LABEL_14;
    -[DrbConfig mergeFrom:](drbConfig, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    -[CellularNrEndcUsageStats setDrbConfig:](self, "setDrbConfig:");
  }
  v5 = v11;
LABEL_14:
  v9 = *((_WORD *)v5 + 38);
  if ((v9 & 0x200) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 18);
    *(_WORD *)&self->_has |= 0x200u;
    v9 = *((_WORD *)v5 + 38);
    if ((v9 & 0x10) == 0)
    {
LABEL_16:
      if ((v9 & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  self->_numSubs = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v5 + 38) & 0x20) != 0)
  {
LABEL_17:
    self->_psPref = *((_DWORD *)v5 + 14);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_18:
  if (*((_QWORD *)v5 + 6))
  {
    -[CellularNrEndcUsageStats setPlmn:](self, "setPlmn:");
    v5 = v11;
  }
  v10 = *((_WORD *)v5 + 38);
  if ((v10 & 4) != 0)
  {
    self->_mcgDuration = *((_DWORD *)v5 + 8);
    *(_WORD *)&self->_has |= 4u;
    v10 = *((_WORD *)v5 + 38);
    if ((v10 & 0x80) == 0)
    {
LABEL_22:
      if ((v10 & 2) == 0)
        goto LABEL_23;
LABEL_31:
      self->_deployment = *((_DWORD *)v5 + 4);
      *(_WORD *)&self->_has |= 2u;
      if ((*((_WORD *)v5 + 38) & 0x40) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_22;
  }
  self->_scgDuration = *((_DWORD *)v5 + 16);
  *(_WORD *)&self->_has |= 0x80u;
  v10 = *((_WORD *)v5 + 38);
  if ((v10 & 2) != 0)
    goto LABEL_31;
LABEL_23:
  if ((v10 & 0x40) != 0)
  {
LABEL_24:
    self->_releaseTech = *((_DWORD *)v5 + 15);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_25:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)mcgTput
{
  return self->_mcgTput;
}

- (unsigned)scgTput
{
  return self->_scgTput;
}

- (DrbConfig)drbConfig
{
  return self->_drbConfig;
}

- (void)setDrbConfig:(id)a3
{
  objc_storeStrong((id *)&self->_drbConfig, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (unsigned)mcgDuration
{
  return self->_mcgDuration;
}

- (unsigned)scgDuration
{
  return self->_scgDuration;
}

- (unsigned)releaseTech
{
  return self->_releaseTech;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_drbConfig, 0);
}

@end
