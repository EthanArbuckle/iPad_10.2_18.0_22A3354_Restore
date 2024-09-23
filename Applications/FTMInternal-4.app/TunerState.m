@implementation TunerState

- (int)rat
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_rat;
  else
    return 0;
}

- (void)setRat:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRat
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)ratAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = off_10025E610[a3];
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsRat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE_V2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GSM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_HDR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WCDMA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_EHRPD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GW")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WLAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GWL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_UMTS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NR5G")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA_HDR")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTxBand:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_txBand = a3;
}

- (void)setHasTxBand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTxBand
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPortBodypositionFs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_portBodypositionFs = a3;
}

- (void)setHasPortBodypositionFs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPortBodypositionFs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)scenarioDecision
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_scenarioDecision;
  else
    return 0;
}

- (void)setScenarioDecision:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_scenarioDecision = a3;
}

- (void)setHasScenarioDecision:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScenarioDecision
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)scenarioDecisionAsString:(int)a3
{
  if (a3 >= 0xE)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025E690[a3];
}

- (int)StringAsScenarioDecision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE_SPACE_SCENARIO")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATG_UATF_SCENARIO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATA_UATF_SCENARIO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATGA_UATF_SCENARIO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATF_UATH_SCENARIO")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATG_UATH_SCENARIO")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATA_UATH_SCENARIO")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATGA_UATH_SCENARIO")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RHH_SCENARIO")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LHH_SCENARIO")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UHH_SCENARIO")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("E_SCENARIO")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("B_SCENARIO")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("R_SCENARIO")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDeembedVswrMag:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deembedVswrMag = a3;
}

- (void)setHasDeembedVswrMag:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeembedVswrMag
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeembedVswrPhase:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deembedVswrPhase = a3;
}

- (void)setHasDeembedVswrPhase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeembedVswrPhase
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAccessory:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_accessory = a3;
}

- (void)setHasAccessory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccessory
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TunerState;
  v3 = -[TunerState description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TunerState dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t rat;
  __CFString *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t scenarioDecision;
  __CFString *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    rat = self->_rat;
    if (rat < 0x10 && ((0x9FFFu >> rat) & 1) != 0)
      v6 = off_10025E610[rat];
    else
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rat));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("rat"));

    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_txBand));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("tx_band"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_portBodypositionFs));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("port_bodyposition_fs"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_17:
  scenarioDecision = self->_scenarioDecision;
  if (scenarioDecision >= 0xE)
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_scenarioDecision));
  else
    v12 = off_10025E690[scenarioDecision];
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("scenario_decision"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
LABEL_22:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_deembedVswrPhase));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("deembed_vswr_phase"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_21:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_deembedVswrMag));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("deembed_vswr_mag"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_22;
LABEL_12:
  if ((has & 1) != 0)
  {
LABEL_13:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_accessory));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("accessory"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100006128((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_rat, 1);
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_txBand, 2);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field(v5, self->_portBodypositionFs, 3);
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field(v5, self->_scenarioDecision, 4);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteUint32Field(v5, self->_deembedVswrPhase, 6);
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteUint32Field(v5, self->_deembedVswrMag, 5);
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field(v5, self->_accessory, 7);
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[6] = self->_rat;
    *((_BYTE *)v4 + 36) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_txBand;
  *((_BYTE *)v4 + 36) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4[5] = self->_portBodypositionFs;
  *((_BYTE *)v4 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[7] = self->_scenarioDecision;
  *((_BYTE *)v4 + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_15:
    v4[4] = self->_deembedVswrPhase;
    *((_BYTE *)v4 + 36) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v4[3] = self->_deembedVswrMag;
  *((_BYTE *)v4 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    v4[2] = self->_accessory;
    *((_BYTE *)v4 + 36) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_rat;
    *((_BYTE *)result + 36) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_txBand;
  *((_BYTE *)result + 36) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 5) = self->_portBodypositionFs;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_scenarioDecision;
  *((_BYTE *)result + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 3) = self->_deembedVswrMag;
  *((_BYTE *)result + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_deembedVswrPhase;
  *((_BYTE *)result + 36) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 2) = self->_accessory;
  *((_BYTE *)result + 36) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_rat != *((_DWORD *)v4 + 6))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
LABEL_36:
    v6 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x40) == 0 || self->_txBand != *((_DWORD *)v4 + 8))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_portBodypositionFs != *((_DWORD *)v4 + 5))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0 || self->_scenarioDecision != *((_DWORD *)v4 + 7))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_deembedVswrMag != *((_DWORD *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_deembedVswrPhase != *((_DWORD *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_36;
  }
  v6 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_accessory != *((_DWORD *)v4 + 2))
      goto LABEL_36;
    v6 = 1;
  }
LABEL_37:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v2 = 2654435761 * self->_rat;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_txBand;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_portBodypositionFs;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_scenarioDecision;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_deembedVswrMag;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_deembedVswrPhase;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_accessory;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_rat = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_txBand = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_portBodypositionFs = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_scenarioDecision = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
LABEL_15:
    self->_deembedVswrPhase = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_deembedVswrMag = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 1) != 0)
  {
LABEL_8:
    self->_accessory = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_9:

}

- (unsigned)txBand
{
  return self->_txBand;
}

- (unsigned)portBodypositionFs
{
  return self->_portBodypositionFs;
}

- (unsigned)deembedVswrMag
{
  return self->_deembedVswrMag;
}

- (unsigned)deembedVswrPhase
{
  return self->_deembedVswrPhase;
}

- (unsigned)accessory
{
  return self->_accessory;
}

@end
