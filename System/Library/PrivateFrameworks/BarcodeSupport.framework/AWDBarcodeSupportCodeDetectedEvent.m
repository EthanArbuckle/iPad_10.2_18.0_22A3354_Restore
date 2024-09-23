@implementation AWDBarcodeSupportCodeDetectedEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)clientType
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_clientType;
  else
    return 0;
}

- (void)setClientType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_clientType = a3;
}

- (void)setHasClientType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasClientType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)clientTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24D787190[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsClientType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODECLIENTTYPE_OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODECLIENTTYPE_NOTIFICATION_SERVICE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODECLIENTTYPE_SAFARI")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)barcodeDataType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_barcodeDataType;
  else
    return 0;
}

- (void)setBarcodeDataType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_barcodeDataType = a3;
}

- (void)setHasBarcodeDataType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBarcodeDataType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)barcodeDataTypeAsString:(int)a3
{
  if (a3 < 0xC)
    return off_24D7871A8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBarcodeDataType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_INVALID")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_URL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_CONTACT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_EMAIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_TELEPHONE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_MESSAGE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_LOCATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_EVENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_WIFI")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_HOMEKIT_URL")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_STRING")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEDATATYPE_OTHER")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDetectionTimeMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_detectionTimeMs = a3;
}

- (void)setHasDetectionTimeMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDetectionTimeMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)invalidBarcodeDataType
{
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    return self->_invalidBarcodeDataType;
  else
    return 0;
}

- (void)setInvalidBarcodeDataType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_invalidBarcodeDataType = a3;
}

- (void)setHasInvalidBarcodeDataType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasInvalidBarcodeDataType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)invalidBarcodeDataTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_24D787208[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInvalidBarcodeDataType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_URL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_CONTACT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_EMAIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_TELEPHONE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_MESSAGE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_LOCATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_EVENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_WIFI")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INVALIDBARCODEDATATYPE_HOMEKIT_URL")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)barcodeURLType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_barcodeURLType;
  else
    return 0;
}

- (void)setBarcodeURLType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_barcodeURLType = a3;
}

- (void)setHasBarcodeURLType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasBarcodeURLType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)barcodeURLTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24D787258[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBarcodeURLType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEURLTYPE_NON_APPLINK")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEURLTYPE_SINGLE_APPLINK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEURLTYPE_MULTIPLE_APPLINKS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)appLinkPreferredOpenStrategy
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_appLinkPreferredOpenStrategy;
  else
    return 0;
}

- (void)setAppLinkPreferredOpenStrategy:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_appLinkPreferredOpenStrategy = a3;
}

- (void)setHasAppLinkPreferredOpenStrategy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAppLinkPreferredOpenStrategy
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)appLinkPreferredOpenStrategyAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_SAFARI");
  if (a3 == 1)
  {
    v3 = CFSTR("BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_APP");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAppLinkPreferredOpenStrategy:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_SAFARI")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_APP"));

  return v4;
}

- (int)barcodeSourceType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_barcodeSourceType;
  else
    return 1;
}

- (void)setBarcodeSourceType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_barcodeSourceType = a3;
}

- (void)setHasBarcodeSourceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBarcodeSourceType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)barcodeSourceTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("BARCODESOURCETYPE_QR");
  if (a3 == 2)
  {
    v3 = CFSTR("BARCODESOURCETYPE_OTHER");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsBarcodeSourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODESOURCETYPE_QR")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("BARCODESOURCETYPE_OTHER")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDBarcodeSupportCodeDetectedEvent;
  -[AWDBarcodeSupportCodeDetectedEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDBarcodeSupportCodeDetectedEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  uint64_t clientType;
  __CFString *v7;
  uint64_t barcodeDataType;
  __CFString *v9;
  void *v10;
  uint64_t invalidBarcodeDataType;
  __CFString *v12;
  uint64_t barcodeURLType;
  __CFString *v14;
  int appLinkPreferredOpenStrategy;
  __CFString *v16;
  int barcodeSourceType;
  __CFString *v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  clientType = self->_clientType;
  if (clientType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_clientType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_24D787190[clientType];
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("clientType"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_15:
  barcodeDataType = self->_barcodeDataType;
  if (barcodeDataType >= 0xC)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_barcodeDataType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_24D7871A8[barcodeDataType];
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("barcodeDataType"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_detectionTimeMs);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("detection_time_ms"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_20:
  invalidBarcodeDataType = self->_invalidBarcodeDataType;
  if (invalidBarcodeDataType >= 0xA)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_invalidBarcodeDataType);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_24D787208[invalidBarcodeDataType];
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("invalidBarcodeDataType"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_24:
  barcodeURLType = self->_barcodeURLType;
  if (barcodeURLType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_barcodeURLType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24D787258[barcodeURLType];
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("barcodeURLType"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return v3;
    goto LABEL_34;
  }
LABEL_28:
  appLinkPreferredOpenStrategy = self->_appLinkPreferredOpenStrategy;
  if (appLinkPreferredOpenStrategy)
  {
    if (appLinkPreferredOpenStrategy == 1)
    {
      v16 = CFSTR("BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_APP");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_appLinkPreferredOpenStrategy);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v16 = CFSTR("BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_SAFARI");
  }
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("appLinkPreferredOpenStrategy"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_34:
    barcodeSourceType = self->_barcodeSourceType;
    if (barcodeSourceType == 1)
    {
      v18 = CFSTR("BARCODESOURCETYPE_QR");
    }
    else if (barcodeSourceType == 2)
    {
      v18 = CFSTR("BARCODESOURCETYPE_OTHER");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_barcodeSourceType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("barcodeSourceType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBarcodeSupportCodeDetectedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x10) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_clientType;
  *((_BYTE *)v4 + 48) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v4 + 7) = self->_barcodeDataType;
  *((_BYTE *)v4 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v4[1] = self->_detectionTimeMs;
  *((_BYTE *)v4 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 11) = self->_invalidBarcodeDataType;
  *((_BYTE *)v4 + 48) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_17:
    *((_DWORD *)v4 + 6) = self->_appLinkPreferredOpenStrategy;
    *((_BYTE *)v4 + 48) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *((_DWORD *)v4 + 9) = self->_barcodeURLType;
  *((_BYTE *)v4 + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 8) = self->_barcodeSourceType;
    *((_BYTE *)v4 + 48) |= 0x10u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_timestamp;
    *((_BYTE *)result + 48) |= 2u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_clientType;
  *((_BYTE *)result + 48) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_barcodeDataType;
  *((_BYTE *)result + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 1) = self->_detectionTimeMs;
  *((_BYTE *)result + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_invalidBarcodeDataType;
  *((_BYTE *)result + 48) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_barcodeURLType;
  *((_BYTE *)result + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 6) = self->_appLinkPreferredOpenStrategy;
  *((_BYTE *)result + 48) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 8) = self->_barcodeSourceType;
  *((_BYTE *)result + 48) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x40) == 0 || self->_clientType != *((_DWORD *)v4 + 10))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x40) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_barcodeDataType != *((_DWORD *)v4 + 7))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_detectionTimeMs != *((_QWORD *)v4 + 1))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x80) == 0 || self->_invalidBarcodeDataType != *((_DWORD *)v4 + 11))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x80) != 0)
  {
LABEL_41:
    v5 = 0;
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x20) == 0 || self->_barcodeURLType != *((_DWORD *)v4 + 9))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_appLinkPreferredOpenStrategy != *((_DWORD *)v4 + 6))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_41;
  }
  v5 = (*((_BYTE *)v4 + 48) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0 || self->_barcodeSourceType != *((_DWORD *)v4 + 8))
      goto LABEL_41;
    v5 = 1;
  }
LABEL_42:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_clientType;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_12;
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
    v4 = 2654435761 * self->_barcodeDataType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_detectionTimeMs;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_invalidBarcodeDataType;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_barcodeURLType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_appLinkPreferredOpenStrategy;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_barcodeSourceType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_clientType = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_barcodeDataType = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_detectionTimeMs = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_invalidBarcodeDataType = *((_DWORD *)v4 + 11);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
LABEL_17:
    self->_appLinkPreferredOpenStrategy = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_barcodeURLType = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 4) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v5 & 0x10) != 0)
  {
LABEL_9:
    self->_barcodeSourceType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_10:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)detectionTimeMs
{
  return self->_detectionTimeMs;
}

@end
