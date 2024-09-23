@implementation RbData

- (void)setQos:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_qos = a3;
}

- (void)setHasQos:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasQos
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRb:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rb = a3;
}

- (void)setHasRb:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRb
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setUlDataBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_ulDataBytes = a3;
}

- (void)setHasUlDataBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasUlDataBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDlDataBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_dlDataBytes = a3;
}

- (void)setHasDlDataBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDlDataBytes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUlDiscardSduBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_ulDiscardSduBytes = a3;
}

- (void)setHasUlDiscardSduBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasUlDiscardSduBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setUlDiscardBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_ulDiscardBytes = a3;
}

- (void)setHasUlDiscardBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasUlDiscardBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDlCtrlPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_dlCtrlPdus = a3;
}

- (void)setHasDlCtrlPdus:(BOOL)a3
{
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasDlCtrlPdus
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDlTotalPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dlTotalPdus = a3;
}

- (void)setHasDlTotalPdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDlTotalPdus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDlHcPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dlHcPdus = a3;
}

- (void)setHasDlHcPdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDlHcPdus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHcDecFailPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hcDecFailPdus = a3;
}

- (void)setHasHcDecFailPdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHcDecFailPdus
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setUlLastXSecTotalPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_ulLastXSecTotalPdus = a3;
}

- (void)setHasUlLastXSecTotalPdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUlLastXSecTotalPdus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setUlLastXSecTotalBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_ulLastXSecTotalBytes = a3;
}

- (void)setHasUlLastXSecTotalBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUlLastXSecTotalBytes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setUlLastXSecDiscardBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_ulLastXSecDiscardBytes = a3;
}

- (void)setHasUlLastXSecDiscardBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasUlLastXSecDiscardBytes
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setUlLastXSecDiscardPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_ulLastXSecDiscardPdus = a3;
}

- (void)setHasUlLastXSecDiscardPdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUlLastXSecDiscardPdus
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setDlHcEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_dlHcEnabled = a3;
}

- (void)setHasDlHcEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasDlHcEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (int)rlcMode
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_rlcMode;
  else
    return 1;
}

- (void)setRlcMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rlcMode = a3;
}

- (void)setHasRlcMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRlcMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)rlcModeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("AM");
  if (a3 == 2)
    v3 = CFSTR("UM");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsRlcMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AM")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("UM")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setUlDiscardSdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_ulDiscardSdus = a3;
}

- (void)setHasUlDiscardSdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUlDiscardSdus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setUlDiscardPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_ulDiscardPdus = a3;
}

- (void)setHasUlDiscardPdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasUlDiscardPdus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setUlTotalPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_ulTotalPdus = a3;
}

- (void)setHasUlTotalPdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasUlTotalPdus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setDlLastXSecTotalPdus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlLastXSecTotalPdus = a3;
}

- (void)setHasDlLastXSecTotalPdus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlLastXSecTotalPdus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDlLastXSecTotalBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlLastXSecTotalBytes = a3;
}

- (void)setHasDlLastXSecTotalBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($25FB206A76DD1BFE56952B17F1432168)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlLastXSecTotalBytes
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RbData;
  v3 = -[RbData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RbData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $25FB206A76DD1BFE56952B17F1432168 has;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int rlcMode;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_qos));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("qos"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rb));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rb"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulDataBytes));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ul_data_bytes"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlDataBytes));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("dl_data_bytes"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulDiscardSduBytes));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ul_discard_sdu_bytes"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulDiscardBytes));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ul_discard_bytes"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlCtrlPdus));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("dl_ctrl_pdus"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlTotalPdus));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dl_total_pdus"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlHcPdus));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("dl_hc_pdus"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hcDecFailPdus));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("hc_dec_fail_pdus"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulLastXSecTotalPdus));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ul_last_x_sec_total_pdus"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulLastXSecTotalBytes));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("ul_last_x_sec_total_bytes"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulLastXSecDiscardBytes));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("ul_last_x_sec_discard_bytes"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulLastXSecDiscardPdus));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ul_last_x_sec_discard_pdus"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_dlHcEnabled));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("dl_hc_enabled"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_39:
  rlcMode = self->_rlcMode;
  if (rlcMode == 1)
  {
    v23 = CFSTR("AM");
  }
  else if (rlcMode == 2)
  {
    v23 = CFSTR("UM");
  }
  else
  {
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rlcMode));
  }
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("rlc_mode"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulDiscardSdus));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("ul_discard_sdus"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulDiscardPdus));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("ul_discard_pdus"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
LABEL_48:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlLastXSecTotalPdus));
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("dl_last_x_sec_total_pdus"));

    if ((*(_DWORD *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_22;
  }
LABEL_47:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulTotalPdus));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("ul_total_pdus"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
    goto LABEL_48;
LABEL_21:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_22:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlLastXSecTotalBytes));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dl_last_x_sec_total_bytes"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003AE58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $25FB206A76DD1BFE56952B17F1432168 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_qos, 1);
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_rb, 2);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v5, self->_ulDataBytes, 3);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field(v5, self->_dlDataBytes, 4);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(v5, self->_ulDiscardSduBytes, 5);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v5, self->_ulDiscardBytes, 6);
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(v5, self->_dlCtrlPdus, 7);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(v5, self->_dlTotalPdus, 8);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v5, self->_dlHcPdus, 9);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v5, self->_hcDecFailPdus, 10);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v5, self->_ulLastXSecTotalPdus, 11);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field(v5, self->_ulLastXSecTotalBytes, 12);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v5, self->_ulLastXSecDiscardBytes, 13);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v5, self->_ulLastXSecDiscardPdus, 14);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField(v5, self->_dlHcEnabled, 15);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field(v5, self->_rlcMode, 16);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v5, self->_ulDiscardSdus, 18);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v5, self->_ulDiscardPdus, 19);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
LABEL_43:
    PBDataWriterWriteUint32Field(v5, self->_dlLastXSecTotalPdus, 28);
    if ((*(_DWORD *)&self->_has & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v5, self->_ulTotalPdus, 20);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
    goto LABEL_43;
LABEL_21:
  if ((*(_BYTE *)&has & 8) != 0)
LABEL_22:
    PBDataWriterWriteUint32Field(v5, self->_dlLastXSecTotalBytes, 29);
LABEL_23:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $25FB206A76DD1BFE56952B17F1432168 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v4[9] = self->_qos;
    v4[23] |= 0x80u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_rb;
  v4[23] |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v4[12] = self->_ulDataBytes;
  v4[23] |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v4[3] = self->_dlDataBytes;
  v4[23] |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v4[15] = self->_ulDiscardSduBytes;
  v4[23] |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v4[13] = self->_ulDiscardBytes;
  v4[23] |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v4[2] = self->_dlCtrlPdus;
  v4[23] |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v4[7] = self->_dlTotalPdus;
  v4[23] |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  v4[4] = self->_dlHcPdus;
  v4[23] |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  v4[8] = self->_hcDecFailPdus;
  v4[23] |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  v4[20] = self->_ulLastXSecTotalPdus;
  v4[23] |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  v4[19] = self->_ulLastXSecTotalBytes;
  v4[23] |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v4[17] = self->_ulLastXSecDiscardBytes;
  v4[23] |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v4[18] = self->_ulLastXSecDiscardPdus;
  v4[23] |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)v4 + 88) = self->_dlHcEnabled;
  v4[23] |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  v4[11] = self->_rlcMode;
  v4[23] |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  v4[16] = self->_ulDiscardSdus;
  v4[23] |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  v4[14] = self->_ulDiscardPdus;
  v4[23] |= 0x1000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
LABEL_43:
    v4[6] = self->_dlLastXSecTotalPdus;
    v4[23] |= 0x10u;
    if ((*(_DWORD *)&self->_has & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  v4[21] = self->_ulTotalPdus;
  v4[23] |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
    goto LABEL_43;
LABEL_21:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_22:
    v4[5] = self->_dlLastXSecTotalBytes;
    v4[23] |= 8u;
  }
LABEL_23:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $25FB206A76DD1BFE56952B17F1432168 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *((_DWORD *)result + 9) = self->_qos;
    *((_DWORD *)result + 23) |= 0x80u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_rb;
  *((_DWORD *)result + 23) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 12) = self->_ulDataBytes;
  *((_DWORD *)result + 23) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 3) = self->_dlDataBytes;
  *((_DWORD *)result + 23) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 15) = self->_ulDiscardSduBytes;
  *((_DWORD *)result + 23) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 13) = self->_ulDiscardBytes;
  *((_DWORD *)result + 23) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 2) = self->_dlCtrlPdus;
  *((_DWORD *)result + 23) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 7) = self->_dlTotalPdus;
  *((_DWORD *)result + 23) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 4) = self->_dlHcPdus;
  *((_DWORD *)result + 23) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 8) = self->_hcDecFailPdus;
  *((_DWORD *)result + 23) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 20) = self->_ulLastXSecTotalPdus;
  *((_DWORD *)result + 23) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 19) = self->_ulLastXSecTotalBytes;
  *((_DWORD *)result + 23) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 17) = self->_ulLastXSecDiscardBytes;
  *((_DWORD *)result + 23) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 18) = self->_ulLastXSecDiscardPdus;
  *((_DWORD *)result + 23) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)result + 88) = self->_dlHcEnabled;
  *((_DWORD *)result + 23) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 11) = self->_rlcMode;
  *((_DWORD *)result + 23) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 16) = self->_ulDiscardSdus;
  *((_DWORD *)result + 23) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 14) = self->_ulDiscardPdus;
  *((_DWORD *)result + 23) |= 0x1000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 21) = self->_ulTotalPdus;
  *((_DWORD *)result + 23) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 8) == 0)
      return result;
    goto LABEL_22;
  }
LABEL_43:
  *((_DWORD *)result + 6) = self->_dlLastXSecTotalPdus;
  *((_DWORD *)result + 23) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 8) == 0)
    return result;
LABEL_22:
  *((_DWORD *)result + 5) = self->_dlLastXSecTotalBytes;
  *((_DWORD *)result + 23) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $25FB206A76DD1BFE56952B17F1432168 has;
  int v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_110;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 23);
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_qos != *((_DWORD *)v4 + 9))
      goto LABEL_110;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_rb != *((_DWORD *)v4 + 10))
      goto LABEL_110;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_ulDataBytes != *((_DWORD *)v4 + 12))
      goto LABEL_110;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_dlDataBytes != *((_DWORD *)v4 + 3))
      goto LABEL_110;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_ulDiscardSduBytes != *((_DWORD *)v4 + 15))
      goto LABEL_110;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_ulDiscardBytes != *((_DWORD *)v4 + 13))
      goto LABEL_110;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_dlCtrlPdus != *((_DWORD *)v4 + 2))
      goto LABEL_110;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_dlTotalPdus != *((_DWORD *)v4 + 7))
      goto LABEL_110;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_dlHcPdus != *((_DWORD *)v4 + 4))
      goto LABEL_110;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_hcDecFailPdus != *((_DWORD *)v4 + 8))
      goto LABEL_110;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_ulLastXSecTotalPdus != *((_DWORD *)v4 + 20))
      goto LABEL_110;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_ulLastXSecTotalBytes != *((_DWORD *)v4 + 19))
      goto LABEL_110;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_ulLastXSecDiscardBytes != *((_DWORD *)v4 + 17))
      goto LABEL_110;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_ulLastXSecDiscardPdus != *((_DWORD *)v4 + 18))
      goto LABEL_110;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) != 0)
    {
      if (self->_dlHcEnabled)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_110;
        goto LABEL_80;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_80;
    }
LABEL_110:
    v8 = 0;
    goto LABEL_111;
  }
  if ((v7 & 0x100000) != 0)
    goto LABEL_110;
LABEL_80:
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_rlcMode != *((_DWORD *)v4 + 11))
      goto LABEL_110;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_ulDiscardSdus != *((_DWORD *)v4 + 16))
      goto LABEL_110;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_ulDiscardPdus != *((_DWORD *)v4 + 14))
      goto LABEL_110;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_ulTotalPdus != *((_DWORD *)v4 + 21))
      goto LABEL_110;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_dlLastXSecTotalPdus != *((_DWORD *)v4 + 6))
      goto LABEL_110;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dlLastXSecTotalBytes != *((_DWORD *)v4 + 5))
      goto LABEL_110;
    v8 = 1;
  }
  else
  {
    v8 = (*((_DWORD *)v4 + 23) & 8) == 0;
  }
LABEL_111:

  return v8;
}

- (unint64_t)hash
{
  $25FB206A76DD1BFE56952B17F1432168 has;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v3 = 2654435761 * self->_qos;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_rb;
      if ((*(_WORD *)&has & 0x400) != 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_ulDataBytes;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  v5 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_dlDataBytes;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  v6 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_ulDiscardSduBytes;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  v7 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_ulDiscardBytes;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  v8 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_dlCtrlPdus;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_dlTotalPdus;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  v10 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_dlHcPdus;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  v11 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_hcDecFailPdus;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_ulLastXSecTotalPdus;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_ulLastXSecTotalBytes;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_ulLastXSecDiscardBytes;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_ulLastXSecDiscardPdus;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_dlHcEnabled;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  v17 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_rlcMode;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  v18 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_ulDiscardSdus;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  v19 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_19:
    v20 = 2654435761 * self->_ulDiscardPdus;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_20:
    v21 = 2654435761 * self->_ulTotalPdus;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_21;
LABEL_42:
    v22 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_22;
LABEL_43:
    v23 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_41:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_42;
LABEL_21:
  v22 = 2654435761 * self->_dlLastXSecTotalPdus;
  if ((*(_BYTE *)&has & 8) == 0)
    goto LABEL_43;
LABEL_22:
  v23 = 2654435761 * self->_dlLastXSecTotalBytes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x80) != 0)
  {
    self->_qos = *((_DWORD *)v4 + 9);
    *(_DWORD *)&self->_has |= 0x80u;
    v5 = *((_DWORD *)v4 + 23);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_rb = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x400) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  self->_ulDataBytes = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  self->_dlDataBytes = *((_DWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  self->_ulDiscardSduBytes = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  self->_ulDiscardBytes = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  self->_dlCtrlPdus = *((_DWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  self->_dlTotalPdus = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  self->_dlHcPdus = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  self->_hcDecFailPdus = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x40000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  self->_ulLastXSecTotalPdus = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x20000) == 0)
  {
LABEL_13:
    if ((v5 & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  self->_ulLastXSecTotalBytes = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x8000) == 0)
  {
LABEL_14:
    if ((v5 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  self->_ulLastXSecDiscardBytes = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x10000) == 0)
  {
LABEL_15:
    if ((v5 & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  self->_ulLastXSecDiscardPdus = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x100000) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  self->_dlHcEnabled = *((_BYTE *)v4 + 88);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  self->_rlcMode = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x4000) == 0)
  {
LABEL_18:
    if ((v5 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  self->_ulDiscardSdus = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x1000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  self->_ulDiscardPdus = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x80000) == 0)
  {
LABEL_20:
    if ((v5 & 0x10) == 0)
      goto LABEL_21;
LABEL_43:
    self->_dlLastXSecTotalPdus = *((_DWORD *)v4 + 6);
    *(_DWORD *)&self->_has |= 0x10u;
    if ((*((_DWORD *)v4 + 23) & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  self->_ulTotalPdus = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 23);
  if ((v5 & 0x10) != 0)
    goto LABEL_43;
LABEL_21:
  if ((v5 & 8) != 0)
  {
LABEL_22:
    self->_dlLastXSecTotalBytes = *((_DWORD *)v4 + 5);
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_23:

}

- (unsigned)qos
{
  return self->_qos;
}

- (unsigned)rb
{
  return self->_rb;
}

- (unsigned)ulDataBytes
{
  return self->_ulDataBytes;
}

- (unsigned)dlDataBytes
{
  return self->_dlDataBytes;
}

- (unsigned)ulDiscardSduBytes
{
  return self->_ulDiscardSduBytes;
}

- (unsigned)ulDiscardBytes
{
  return self->_ulDiscardBytes;
}

- (unsigned)dlCtrlPdus
{
  return self->_dlCtrlPdus;
}

- (unsigned)dlTotalPdus
{
  return self->_dlTotalPdus;
}

- (unsigned)dlHcPdus
{
  return self->_dlHcPdus;
}

- (unsigned)hcDecFailPdus
{
  return self->_hcDecFailPdus;
}

- (unsigned)ulLastXSecTotalPdus
{
  return self->_ulLastXSecTotalPdus;
}

- (unsigned)ulLastXSecTotalBytes
{
  return self->_ulLastXSecTotalBytes;
}

- (unsigned)ulLastXSecDiscardBytes
{
  return self->_ulLastXSecDiscardBytes;
}

- (unsigned)ulLastXSecDiscardPdus
{
  return self->_ulLastXSecDiscardPdus;
}

- (BOOL)dlHcEnabled
{
  return self->_dlHcEnabled;
}

- (unsigned)ulDiscardSdus
{
  return self->_ulDiscardSdus;
}

- (unsigned)ulDiscardPdus
{
  return self->_ulDiscardPdus;
}

- (unsigned)ulTotalPdus
{
  return self->_ulTotalPdus;
}

- (unsigned)dlLastXSecTotalPdus
{
  return self->_dlLastXSecTotalPdus;
}

- (unsigned)dlLastXSecTotalBytes
{
  return self->_dlLastXSecTotalBytes;
}

@end
