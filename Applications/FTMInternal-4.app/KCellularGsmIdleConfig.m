@implementation KCellularGsmIdleConfig

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setArfcnBcch:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_arfcnBcch = a3;
}

- (void)setHasArfcnBcch:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasArfcnBcch
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMcc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasMnc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasLac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setCi:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_ci = a3;
}

- (void)setHasCi:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setBsic:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_bsic = a3;
}

- (void)setHasBsic:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasBsic
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDtxFromBs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_dtxFromBs = a3;
}

- (void)setHasDtxFromBs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDtxFromBs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRadioLinkTimeout:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_radioLinkTimeout = a3;
}

- (void)setHasRadioLinkTimeout:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasRadioLinkTimeout
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMultibRep:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_multibRep = a3;
}

- (void)setHasMultibRep:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMultibRep
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setGsmBand:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_gsmBand = a3;
}

- (void)setHasGsmBand:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasGsmBand
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAccessTech:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_accessTech = a3;
}

- (void)setHasAccessTech:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAccessTech
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTypeOfCurChan:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_typeOfCurChan = a3;
}

- (void)setHasTypeOfCurChan:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTypeOfCurChan
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setMsTxpwr:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_msTxpwr = a3;
}

- (void)setHasMsTxpwr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMsTxpwr
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setRxAccMin:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_rxAccMin = a3;
}

- (void)setHasRxAccMin:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasRxAccMin
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setCbq:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_cbq = a3;
}

- (void)setHasCbq:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCbq
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCba:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_cba = a3;
}

- (void)setHasCba:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCba
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setC2Valid:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_c2Valid = a3;
}

- (void)setHasC2Valid:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasC2Valid
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCrOffset:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_crOffset = a3;
}

- (void)setHasCrOffset:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCrOffset
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTmpOffset:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_tmpOffset = a3;
}

- (void)setHasTmpOffset:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasTmpOffset
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setPenaltyT:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_penaltyT = a3;
}

- (void)setHasPenaltyT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasPenaltyT
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setT3212:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= (unint64_t)&_mh_execute_header;
  self->_t3212 = a3;
}

- (void)setHasT3212:(BOOL)a3
{
  const mach_header_64 *v3;

  v3 = &_mh_execute_header;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | (unint64_t)v3);
}

- (BOOL)hasT3212
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setAcc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_acc = a3;
}

- (void)setHasAcc:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAcc
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBsPaMfrms:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_bsPaMfrms = a3;
}

- (void)setHasBsPaMfrms:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBsPaMfrms
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCsPagemode:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_csPagemode = a3;
}

- (void)setHasCsPagemode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCsPagemode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMaxRetransCs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_maxRetransCs = a3;
}

- (void)setHasMaxRetransCs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMaxRetransCs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setEmergCallAllowed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_emergCallAllowed = a3;
}

- (void)setHasEmergCallAllowed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasEmergCallAllowed
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setAttachAllowed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_attachAllowed = a3;
}

- (void)setHasAttachAllowed:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAttachAllowed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHalfRateSupported:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_halfRateSupported = a3;
}

- (void)setHasHalfRateSupported:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasHalfRateSupported
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSi78Broadcast:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_si78Broadcast = a3;
}

- (void)setHasSi78Broadcast:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasSi78Broadcast
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setCbchSupported:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_cbchSupported = a3;
}

- (void)setHasCbchSupported:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCbchSupported
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setReestAllowed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_reestAllowed = a3;
}

- (void)setHasReestAllowed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasReestAllowed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setEcsc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_ecsc = a3;
}

- (void)setHasEcsc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasEcsc
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSi2TerNeeded:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_si2TerNeeded = a3;
}

- (void)setHasSi2TerNeeded:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSi2TerNeeded
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasSubsId
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularGsmIdleConfig;
  v3 = -[KCellularGsmIdleConfig description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularGsmIdleConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has;
  void *v5;
  id v6;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_arfcnBcch));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("arfcn_bcch"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("mcc"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mnc"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("lac"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ci));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ci"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bsic));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("bsic"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dtxFromBs));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("dtx_from_bs"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_radioLinkTimeout));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("radio_link_timeout"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_multibRep));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("multib_rep"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_gsmBand));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("gsm_band"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_accessTech));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("access_tech"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_typeOfCurChan));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("type_of_cur_chan"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msTxpwr));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("ms_txpwr"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rxAccMin));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("rx_acc_min"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cbq));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("cbq"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cba));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("cba"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_c2Valid));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("c2_valid"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_crOffset));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("cr_offset"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tmpOffset));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("tmp_offset"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_penaltyT));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("penalty_t"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_t3212));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("t3212"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_acc));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("acc"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bsPaMfrms));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("bs_pa_mfrms"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_csPagemode));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("cs_pagemode"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxRetransCs));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("max_retrans_cs"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_emergCallAllowed));
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("emerg_call_allowed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_66;
  }
LABEL_65:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_attachAllowed));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("attach_allowed"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_31;
    goto LABEL_67;
  }
LABEL_66:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_halfRateSupported));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("half_rate_supported"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_32;
    goto LABEL_68;
  }
LABEL_67:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_si78Broadcast));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("si_7_8_broadcast"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_69;
  }
LABEL_68:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cbchSupported));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("cbch_supported"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_34;
    goto LABEL_70;
  }
LABEL_69:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_reestAllowed));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("reest_allowed"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_35;
LABEL_71:
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_si2TerNeeded));
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("si_2_ter_needed"));

    if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_70:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ecsc));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("ecsc"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
    goto LABEL_71;
LABEL_35:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_36:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
LABEL_37:
  v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100072654((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $2B3023E7572ED387A2CBD1C46DAF5B75 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_timestamp, 1);
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_arfcnBcch, 2);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v5, self->_mcc, 3);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v5, self->_mnc, 4);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v5, self->_lac, 5);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field(v5, self->_ci, 6);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field(v5, self->_bsic, 7);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field(v5, self->_dtxFromBs, 8);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field(v5, self->_radioLinkTimeout, 9);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field(v5, self->_multibRep, 10);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field(v5, self->_gsmBand, 11);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field(v5, self->_accessTech, 12);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field(v5, self->_typeOfCurChan, 13);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field(v5, self->_msTxpwr, 14);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field(v5, self->_rxAccMin, 15);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field(v5, self->_cbq, 16);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field(v5, self->_cba, 17);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field(v5, self->_c2Valid, 18);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field(v5, self->_crOffset, 19);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field(v5, self->_tmpOffset, 20);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field(v5, self->_penaltyT, 21);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field(v5, self->_t3212, 22);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field(v5, self->_acc, 23);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field(v5, self->_bsPaMfrms, 24);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field(v5, self->_csPagemode, 25);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field(v5, self->_maxRetransCs, 26);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field(v5, self->_emergCallAllowed, 27);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field(v5, self->_attachAllowed, 28);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_31;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field(v5, self->_halfRateSupported, 29);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_32;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field(v5, self->_si78Broadcast, 30);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field(v5, self->_cbchSupported, 31);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_34;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field(v5, self->_reestAllowed, 32);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_35;
LABEL_71:
    PBDataWriterWriteUint32Field(v5, self->_si2TerNeeded, 34);
    if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_70:
  PBDataWriterWriteUint32Field(v5, self->_ecsc, 33);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
    goto LABEL_71;
LABEL_35:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
LABEL_36:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 127);
LABEL_37:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    v4[19] |= 1uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_arfcnBcch;
  v4[19] |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 24) = self->_mcc;
  v4[19] |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 25) = self->_mnc;
  v4[19] |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 22) = self->_lac;
  v4[19] |= 0x80000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 14) = self->_ci;
  v4[19] |= 0x800uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 9) = self->_bsic;
  v4[19] |= 0x40uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 17) = self->_dtxFromBs;
  v4[19] |= 0x4000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 29) = self->_radioLinkTimeout;
  v4[19] |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 27) = self->_multibRep;
  v4[19] |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 20) = self->_gsmBand;
  v4[19] |= 0x20000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 5) = self->_accessTech;
  v4[19] |= 4uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 37) = self->_typeOfCurChan;
  v4[19] |= 0x400000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 26) = self->_msTxpwr;
  v4[19] |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 31) = self->_rxAccMin;
  v4[19] |= 0x10000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 13) = self->_cbq;
  v4[19] |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 11) = self->_cba;
  v4[19] |= 0x100uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 10) = self->_c2Valid;
  v4[19] |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 15) = self->_crOffset;
  v4[19] |= 0x1000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 36) = self->_tmpOffset;
  v4[19] |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 28) = self->_penaltyT;
  v4[19] |= 0x2000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 35) = self->_t3212;
  v4[19] |= (unint64_t)&_mh_execute_header;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 4) = self->_acc;
  v4[19] |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 8) = self->_bsPaMfrms;
  v4[19] |= 0x20uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 16) = self->_csPagemode;
  v4[19] |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 23) = self->_maxRetransCs;
  v4[19] |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 19) = self->_emergCallAllowed;
  v4[19] |= 0x10000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 7) = self->_attachAllowed;
  v4[19] |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_31;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 21) = self->_halfRateSupported;
  v4[19] |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_32;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 33) = self->_si78Broadcast;
  v4[19] |= 0x40000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 12) = self->_cbchSupported;
  v4[19] |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_34;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 30) = self->_reestAllowed;
  v4[19] |= 0x8000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_35;
LABEL_71:
    *((_DWORD *)v4 + 32) = self->_si2TerNeeded;
    v4[19] |= 0x20000000uLL;
    if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_70:
  *((_DWORD *)v4 + 18) = self->_ecsc;
  v4[19] |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
    goto LABEL_71;
LABEL_35:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_36:
    *((_DWORD *)v4 + 34) = self->_subsId;
    v4[19] |= 0x80000000uLL;
  }
LABEL_37:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has;
  _QWORD *v6;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    v4[19] |= 1uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_arfcnBcch;
  v4[19] |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 24) = self->_mcc;
  v4[19] |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 25) = self->_mnc;
  v4[19] |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 22) = self->_lac;
  v4[19] |= 0x80000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 14) = self->_ci;
  v4[19] |= 0x800uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 9) = self->_bsic;
  v4[19] |= 0x40uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 17) = self->_dtxFromBs;
  v4[19] |= 0x4000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 29) = self->_radioLinkTimeout;
  v4[19] |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 27) = self->_multibRep;
  v4[19] |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 20) = self->_gsmBand;
  v4[19] |= 0x20000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 5) = self->_accessTech;
  v4[19] |= 4uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 37) = self->_typeOfCurChan;
  v4[19] |= 0x400000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 26) = self->_msTxpwr;
  v4[19] |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 31) = self->_rxAccMin;
  v4[19] |= 0x10000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 13) = self->_cbq;
  v4[19] |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 11) = self->_cba;
  v4[19] |= 0x100uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 10) = self->_c2Valid;
  v4[19] |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 15) = self->_crOffset;
  v4[19] |= 0x1000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 36) = self->_tmpOffset;
  v4[19] |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 28) = self->_penaltyT;
  v4[19] |= 0x2000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 35) = self->_t3212;
  v4[19] |= (unint64_t)&_mh_execute_header;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 4) = self->_acc;
  v4[19] |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 8) = self->_bsPaMfrms;
  v4[19] |= 0x20uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 16) = self->_csPagemode;
  v4[19] |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 23) = self->_maxRetransCs;
  v4[19] |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 19) = self->_emergCallAllowed;
  v4[19] |= 0x10000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 7) = self->_attachAllowed;
  v4[19] |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_31;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 21) = self->_halfRateSupported;
  v4[19] |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_32;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 33) = self->_si78Broadcast;
  v4[19] |= 0x40000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 12) = self->_cbchSupported;
  v4[19] |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_34;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 30) = self->_reestAllowed;
  v4[19] |= 0x8000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_35;
LABEL_71:
    *((_DWORD *)v4 + 32) = self->_si2TerNeeded;
    v4[19] |= 0x20000000uLL;
    if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_70:
  *((_DWORD *)v4 + 18) = self->_ecsc;
  v4[19] |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
    goto LABEL_71;
LABEL_35:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_36:
    *((_DWORD *)v4 + 34) = self->_subsId;
    v4[19] |= 0x80000000uLL;
  }
LABEL_37:
  v6 = v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_177;
  has = self->_has;
  v7 = *((_QWORD *)v4 + 19);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_177;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_177:
    v8 = 0;
    goto LABEL_178;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_arfcnBcch != *((_DWORD *)v4 + 6))
      goto LABEL_177;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_mcc != *((_DWORD *)v4 + 24))
      goto LABEL_177;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_mnc != *((_DWORD *)v4 + 25))
      goto LABEL_177;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_lac != *((_DWORD *)v4 + 22))
      goto LABEL_177;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_ci != *((_DWORD *)v4 + 14))
      goto LABEL_177;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_bsic != *((_DWORD *)v4 + 9))
      goto LABEL_177;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_dtxFromBs != *((_DWORD *)v4 + 17))
      goto LABEL_177;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_radioLinkTimeout != *((_DWORD *)v4 + 29))
      goto LABEL_177;
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_multibRep != *((_DWORD *)v4 + 27))
      goto LABEL_177;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_gsmBand != *((_DWORD *)v4 + 20))
      goto LABEL_177;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_accessTech != *((_DWORD *)v4 + 5))
      goto LABEL_177;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_typeOfCurChan != *((_DWORD *)v4 + 37))
      goto LABEL_177;
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_msTxpwr != *((_DWORD *)v4 + 26))
      goto LABEL_177;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_rxAccMin != *((_DWORD *)v4 + 31))
      goto LABEL_177;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_cbq != *((_DWORD *)v4 + 13))
      goto LABEL_177;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_cba != *((_DWORD *)v4 + 11))
      goto LABEL_177;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_c2Valid != *((_DWORD *)v4 + 10))
      goto LABEL_177;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_crOffset != *((_DWORD *)v4 + 15))
      goto LABEL_177;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_tmpOffset != *((_DWORD *)v4 + 36))
      goto LABEL_177;
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_penaltyT != *((_DWORD *)v4 + 28))
      goto LABEL_177;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_t3212 != *((_DWORD *)v4 + 35))
      goto LABEL_177;
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_acc != *((_DWORD *)v4 + 4))
      goto LABEL_177;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_bsPaMfrms != *((_DWORD *)v4 + 8))
      goto LABEL_177;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_csPagemode != *((_DWORD *)v4 + 16))
      goto LABEL_177;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_maxRetransCs != *((_DWORD *)v4 + 23))
      goto LABEL_177;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_emergCallAllowed != *((_DWORD *)v4 + 19))
      goto LABEL_177;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_attachAllowed != *((_DWORD *)v4 + 7))
      goto LABEL_177;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_halfRateSupported != *((_DWORD *)v4 + 21))
      goto LABEL_177;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_si78Broadcast != *((_DWORD *)v4 + 33))
      goto LABEL_177;
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_cbchSupported != *((_DWORD *)v4 + 12))
      goto LABEL_177;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_reestAllowed != *((_DWORD *)v4 + 30))
      goto LABEL_177;
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_ecsc != *((_DWORD *)v4 + 18))
      goto LABEL_177;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_si2TerNeeded != *((_DWORD *)v4 + 32))
      goto LABEL_177;
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_subsId != *((_DWORD *)v4 + 34))
      goto LABEL_177;
    v8 = 1;
  }
  else
  {
    v8 = (int)v7 >= 0;
  }
LABEL_178:

  return v8;
}

- (unint64_t)hash
{
  $2B3023E7572ED387A2CBD1C46DAF5B75 has;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v38 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 8) != 0)
    {
LABEL_3:
      v37 = 2654435761 * self->_arfcnBcch;
      if ((*(_DWORD *)&has & 0x200000) != 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else
  {
    v38 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_3;
  }
  v37 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_4:
    v36 = 2654435761 * self->_mcc;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    v35 = 2654435761 * self->_mnc;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_6:
    v34 = 2654435761 * self->_lac;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  v34 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_7:
    v33 = 2654435761 * self->_ci;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  v33 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v32 = 2654435761 * self->_bsic;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  v32 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    v31 = 2654435761 * self->_dtxFromBs;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_10:
    v30 = 2654435761 * self->_radioLinkTimeout;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_11:
    v3 = 2654435761 * self->_multibRep;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  v3 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    v4 = 2654435761 * self->_gsmBand;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  v4 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_13:
    v5 = 2654435761 * self->_accessTech;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  v5 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_14:
    v6 = 2654435761 * self->_typeOfCurChan;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_15:
    v7 = 2654435761 * self->_msTxpwr;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_16:
    v8 = 2654435761 * self->_rxAccMin;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_17:
    v9 = 2654435761 * self->_cbq;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_52:
  v9 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_18:
    v10 = 2654435761 * self->_cba;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  v10 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_19:
    v11 = 2654435761 * self->_c2Valid;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_20:
    v12 = 2654435761 * self->_crOffset;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  v12 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_21:
    v13 = 2654435761 * self->_tmpOffset;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_22:
    v14 = 2654435761 * self->_penaltyT;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  v14 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_23:
    v15 = 2654435761 * self->_t3212;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  v15 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_24:
    v16 = 2654435761 * self->_acc;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_25:
    v17 = 2654435761 * self->_bsPaMfrms;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  v17 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_26:
    v18 = 2654435761 * self->_csPagemode;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_27;
    goto LABEL_62;
  }
LABEL_61:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_27:
    v19 = 2654435761 * self->_maxRetransCs;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_28;
    goto LABEL_63;
  }
LABEL_62:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_28:
    v20 = 2654435761 * self->_emergCallAllowed;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_29;
    goto LABEL_64;
  }
LABEL_63:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_29:
    v21 = 2654435761 * self->_attachAllowed;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_30;
    goto LABEL_65;
  }
LABEL_64:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_30:
    v22 = 2654435761 * self->_halfRateSupported;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_31;
    goto LABEL_66;
  }
LABEL_65:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_31:
    v23 = 2654435761 * self->_si78Broadcast;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_32;
    goto LABEL_67;
  }
LABEL_66:
  v23 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_32:
    v24 = 2654435761 * self->_cbchSupported;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_33;
    goto LABEL_68;
  }
LABEL_67:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_33:
    v25 = 2654435761 * self->_reestAllowed;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_34;
    goto LABEL_69;
  }
LABEL_68:
  v25 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_34:
    v26 = 2654435761 * self->_ecsc;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_35;
LABEL_70:
    v27 = 0;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_36;
LABEL_71:
    v28 = 0;
    return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_69:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
    goto LABEL_70;
LABEL_35:
  v27 = 2654435761 * self->_si2TerNeeded;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
    goto LABEL_71;
LABEL_36:
  v28 = 2654435761 * self->_subsId;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v5 = *((_QWORD *)v4 + 19);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_arfcnBcch = *((_DWORD *)v4 + 6);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x200000) == 0)
  {
LABEL_4:
    if ((v5 & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  self->_mcc = *((_DWORD *)v4 + 24);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x400000) == 0)
  {
LABEL_5:
    if ((v5 & 0x80000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  self->_mnc = *((_DWORD *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x80000) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  self->_lac = *((_DWORD *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  self->_ci = *((_DWORD *)v4 + 14);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  self->_bsic = *((_DWORD *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  self->_dtxFromBs = *((_DWORD *)v4 + 17);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  self->_radioLinkTimeout = *((_DWORD *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  self->_multibRep = *((_DWORD *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x20000) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  self->_gsmBand = *((_DWORD *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  self->_accessTech = *((_DWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  self->_typeOfCurChan = *((_DWORD *)v4 + 37);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x800000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  self->_msTxpwr = *((_DWORD *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  self->_rxAccMin = *((_DWORD *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x400) == 0)
  {
LABEL_17:
    if ((v5 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  self->_cbq = *((_DWORD *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x100) == 0)
  {
LABEL_18:
    if ((v5 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  self->_cba = *((_DWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x80) == 0)
  {
LABEL_19:
    if ((v5 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  self->_c2Valid = *((_DWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x1000) == 0)
  {
LABEL_20:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  self->_crOffset = *((_DWORD *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  self->_tmpOffset = *((_DWORD *)v4 + 36);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  self->_penaltyT = *((_DWORD *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_23:
    if ((v5 & 2) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  self->_t3212 = *((_DWORD *)v4 + 35);
  *(_QWORD *)&self->_has |= (unint64_t)&_mh_execute_header;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 2) == 0)
  {
LABEL_24:
    if ((v5 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  self->_acc = *((_DWORD *)v4 + 4);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x20) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  self->_bsPaMfrms = *((_DWORD *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  self->_csPagemode = *((_DWORD *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x100000) == 0)
  {
LABEL_27:
    if ((v5 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  self->_maxRetransCs = *((_DWORD *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x10000) == 0)
  {
LABEL_28:
    if ((v5 & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  self->_emergCallAllowed = *((_DWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x10) == 0)
  {
LABEL_29:
    if ((v5 & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_66;
  }
LABEL_65:
  self->_attachAllowed = *((_DWORD *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x40000) == 0)
  {
LABEL_30:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_31;
    goto LABEL_67;
  }
LABEL_66:
  self->_halfRateSupported = *((_DWORD *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x200) == 0)
      goto LABEL_32;
    goto LABEL_68;
  }
LABEL_67:
  self->_si78Broadcast = *((_DWORD *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x200) == 0)
  {
LABEL_32:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_69;
  }
LABEL_68:
  self->_cbchSupported = *((_DWORD *)v4 + 12);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x8000) == 0)
      goto LABEL_34;
    goto LABEL_70;
  }
LABEL_69:
  self->_reestAllowed = *((_DWORD *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x8000) == 0)
  {
LABEL_34:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_35;
LABEL_71:
    self->_si2TerNeeded = *((_DWORD *)v4 + 32);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
    if ((*((_QWORD *)v4 + 19) & 0x80000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_70:
  self->_ecsc = *((_DWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *((_QWORD *)v4 + 19);
  if ((v5 & 0x20000000) != 0)
    goto LABEL_71;
LABEL_35:
  if ((v5 & 0x80000000) != 0)
  {
LABEL_36:
    self->_subsId = *((_DWORD *)v4 + 34);
    *(_QWORD *)&self->_has |= 0x80000000uLL;
  }
LABEL_37:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)arfcnBcch
{
  return self->_arfcnBcch;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)ci
{
  return self->_ci;
}

- (unsigned)bsic
{
  return self->_bsic;
}

- (unsigned)dtxFromBs
{
  return self->_dtxFromBs;
}

- (unsigned)radioLinkTimeout
{
  return self->_radioLinkTimeout;
}

- (unsigned)multibRep
{
  return self->_multibRep;
}

- (unsigned)gsmBand
{
  return self->_gsmBand;
}

- (unsigned)accessTech
{
  return self->_accessTech;
}

- (unsigned)typeOfCurChan
{
  return self->_typeOfCurChan;
}

- (unsigned)msTxpwr
{
  return self->_msTxpwr;
}

- (unsigned)rxAccMin
{
  return self->_rxAccMin;
}

- (unsigned)cbq
{
  return self->_cbq;
}

- (unsigned)cba
{
  return self->_cba;
}

- (unsigned)c2Valid
{
  return self->_c2Valid;
}

- (unsigned)crOffset
{
  return self->_crOffset;
}

- (unsigned)tmpOffset
{
  return self->_tmpOffset;
}

- (unsigned)penaltyT
{
  return self->_penaltyT;
}

- (unsigned)t3212
{
  return self->_t3212;
}

- (unsigned)acc
{
  return self->_acc;
}

- (unsigned)bsPaMfrms
{
  return self->_bsPaMfrms;
}

- (unsigned)csPagemode
{
  return self->_csPagemode;
}

- (unsigned)maxRetransCs
{
  return self->_maxRetransCs;
}

- (unsigned)emergCallAllowed
{
  return self->_emergCallAllowed;
}

- (unsigned)attachAllowed
{
  return self->_attachAllowed;
}

- (unsigned)halfRateSupported
{
  return self->_halfRateSupported;
}

- (unsigned)si78Broadcast
{
  return self->_si78Broadcast;
}

- (unsigned)cbchSupported
{
  return self->_cbchSupported;
}

- (unsigned)reestAllowed
{
  return self->_reestAllowed;
}

- (unsigned)ecsc
{
  return self->_ecsc;
}

- (unsigned)si2TerNeeded
{
  return self->_si2TerNeeded;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
