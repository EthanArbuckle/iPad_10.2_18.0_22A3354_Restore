@implementation CellularNrRrcState

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)deployment
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_deployment;
  else
    return 0;
}

- (void)setDeployment:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeployment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrRrcState;
  v3 = -[CellularNrRrcState description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrRrcState dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSData *plmn;
  void *v8;
  void *v9;
  int deployment;
  __CFString *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_state));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("state"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_13:
  deployment = self->_deployment;
  if (deployment)
  {
    if (deployment == 1)
      v11 = CFSTR("DEPLOYMENT_NSA");
    else
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deployment));
  }
  else
  {
    v11 = CFSTR("DEPLOYMENT_SA");
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("deployment"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("subs_id"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("num_subs"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ps_pref"));

  }
LABEL_8:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100077A18((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSData *plmn;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v6, self->_timestamp, 1);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v6, self->_state, 2);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field(v6, self->_deployment, 3);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  PBDataWriterWriteUint32Field(v6, self->_numSubs, 12);
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field(v6, self->_psPref, 13);
LABEL_7:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v6, plmn, 14);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint32Field(v6, self->_subsId, 15);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_state;
  *((_BYTE *)v4 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 4) = self->_deployment;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  *((_DWORD *)v4 + 5) = self->_numSubs;
  *((_BYTE *)v4 + 44) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 8) = self->_psPref;
    *((_BYTE *)v4 + 44) |= 8u;
  }
LABEL_7:
  if (self->_plmn)
  {
    v6 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_subsId;
    *((_BYTE *)v4 + 44) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 9) = self->_state;
  *((_BYTE *)v5 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v5 + 4) = self->_deployment;
  *((_BYTE *)v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v5 + 5) = self->_numSubs;
  *((_BYTE *)v5 + 44) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 8) = self->_psPref;
    *((_BYTE *)v5 + 44) |= 8u;
  }
LABEL_7:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_subsId;
    *((_BYTE *)v6 + 44) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSData *plmn;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_34;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0 || self->_state != *((_DWORD *)v4 + 9))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_deployment != *((_DWORD *)v4 + 4))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 8))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_34;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_34:
      v8 = 0;
      goto LABEL_35;
    }
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 44) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 10))
      goto LABEL_34;
    v8 = 1;
  }
LABEL_35:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_state;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_deployment;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_psPref;
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
LABEL_12:
  v8 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v9 = 2654435761 * self->_subsId;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_state = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_deployment = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  self->_numSubs = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
LABEL_6:
    self->_psPref = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[CellularNrRrcState setPlmn:](self, "setPlmn:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x20u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)state
{
  return self->_state;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
