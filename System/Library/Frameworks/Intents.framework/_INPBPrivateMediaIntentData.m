@implementation _INPBPrivateMediaIntentData

- (void)setAsrConfidenceLevel:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_asrConfidenceLevel = a3;
  }
}

- (BOOL)hasAsrConfidenceLevel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAsrConfidenceLevel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)asrConfidenceLevelAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 19)
  {
    if (a3 == 20)
      return CFSTR("MEDIUM");
    if (a3 == 30)
      return CFSTR("HIGH");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("UNKNOWN_CONFIDENCE_LEVEL");
  if (a3 != 10)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("LOW");
  return v3;
}

- (int)StringAsAsrConfidenceLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONFIDENCE_LEVEL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIUM")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH")))
  {
    v4 = 30;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAsrConfidenceScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_asrConfidenceScore = a3;
}

- (BOOL)hasAsrConfidenceScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAsrConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setFallbackUsername:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackUsername, a3);
}

- (BOOL)hasFallbackUsername
{
  return self->_fallbackUsername != 0;
}

- (void)setHomeAutomationEntityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_homeAutomationEntityProvider, a3);
}

- (BOOL)hasHomeAutomationEntityProvider
{
  return self->_homeAutomationEntityProvider != 0;
}

- (void)setIsAppAttributionRequired:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isAppAttributionRequired = a3;
}

- (BOOL)hasIsAppAttributionRequired
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsAppAttributionRequired:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setIsAppCorrection:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isAppCorrection = a3;
}

- (BOOL)hasIsAppCorrection
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsAppCorrection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setNlConfidenceLevel:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xEF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x10;
    self->_nlConfidenceLevel = a3;
  }
}

- (BOOL)hasNlConfidenceLevel
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasNlConfidenceLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)nlConfidenceLevelAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 19)
  {
    if (a3 == 20)
      return CFSTR("MEDIUM");
    if (a3 == 30)
      return CFSTR("HIGH");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("UNKNOWN_CONFIDENCE_LEVEL");
  if (a3 != 10)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("LOW");
  return v3;
}

- (int)StringAsNlConfidenceLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONFIDENCE_LEVEL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIUM")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH")))
  {
    v4 = 30;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNlConfidenceScore:(float)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_nlConfidenceScore = a3;
}

- (BOOL)hasNlConfidenceScore
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasNlConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)setProxiedThirdPartyAppInfo:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedThirdPartyAppInfo, a3);
}

- (BOOL)hasProxiedThirdPartyAppInfo
{
  return self->_proxiedThirdPartyAppInfo != 0;
}

- (void)setResolvedSharedUserID:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedSharedUserID, a3);
}

- (BOOL)hasResolvedSharedUserID
{
  return self->_resolvedSharedUserID != 0;
}

- (void)setSpeakerIDInfo:(id)a3
{
  objc_storeStrong((id *)&self->_speakerIDInfo, a3);
}

- (BOOL)hasSpeakerIDInfo
{
  return self->_speakerIDInfo != 0;
}

- (void)setUseDialogMemoryForAttribution:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_useDialogMemoryForAttribution = a3;
}

- (BOOL)hasUseDialogMemoryForAttribution
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasUseDialogMemoryForAttribution:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)setWholeHouseAudioMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_wholeHouseAudioMetadata, a3);
}

- (BOOL)hasWholeHouseAudioMetadata
{
  return self->_wholeHouseAudioMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _INPBPrivateMediaIntentDataReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  id v17;

  v17 = a3;
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceLevel](self, "hasAsrConfidenceLevel"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceScore](self, "hasAsrConfidenceScore"))
    PBDataWriterWriteFloatField();
  -[_INPBPrivateMediaIntentData fallbackUsername](self, "fallbackUsername");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBPrivateMediaIntentData fallbackUsername](self, "fallbackUsername");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPrivateMediaIntentData homeAutomationEntityProvider](self, "homeAutomationEntityProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBPrivateMediaIntentData homeAutomationEntityProvider](self, "homeAutomationEntityProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPrivateMediaIntentData hasIsAppAttributionRequired](self, "hasIsAppAttributionRequired"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPrivateMediaIntentData hasIsAppCorrection](self, "hasIsAppCorrection"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceLevel](self, "hasNlConfidenceLevel"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceScore](self, "hasNlConfidenceScore"))
    PBDataWriterWriteFloatField();
  -[_INPBPrivateMediaIntentData proxiedThirdPartyAppInfo](self, "proxiedThirdPartyAppInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBPrivateMediaIntentData proxiedThirdPartyAppInfo](self, "proxiedThirdPartyAppInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPrivateMediaIntentData resolvedSharedUserID](self, "resolvedSharedUserID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBPrivateMediaIntentData resolvedSharedUserID](self, "resolvedSharedUserID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPrivateMediaIntentData speakerIDInfo](self, "speakerIDInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBPrivateMediaIntentData speakerIDInfo](self, "speakerIDInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPrivateMediaIntentData hasUseDialogMemoryForAttribution](self, "hasUseDialogMemoryForAttribution"))
    PBDataWriterWriteBOOLField();
  -[_INPBPrivateMediaIntentData wholeHouseAudioMetadata](self, "wholeHouseAudioMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v17;
  if (v14)
  {
    -[_INPBPrivateMediaIntentData wholeHouseAudioMetadata](self, "wholeHouseAudioMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v15 = v17;
  }

}

- (_INPBPrivateMediaIntentData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPrivateMediaIntentData *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPrivateMediaIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPrivateMediaIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPrivateMediaIntentData initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBPrivateMediaIntentData data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPrivateMediaIntentData *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = -[_INPBPrivateMediaIntentData init](+[_INPBPrivateMediaIntentData allocWithZone:](_INPBPrivateMediaIntentData, "allocWithZone:"), "init");
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceLevel](self, "hasAsrConfidenceLevel"))
    -[_INPBPrivateMediaIntentData setAsrConfidenceLevel:](v5, "setAsrConfidenceLevel:", -[_INPBPrivateMediaIntentData asrConfidenceLevel](self, "asrConfidenceLevel"));
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceScore](self, "hasAsrConfidenceScore"))
  {
    -[_INPBPrivateMediaIntentData asrConfidenceScore](self, "asrConfidenceScore");
    -[_INPBPrivateMediaIntentData setAsrConfidenceScore:](v5, "setAsrConfidenceScore:");
  }
  v6 = -[_INPBString copyWithZone:](self->_fallbackUsername, "copyWithZone:", a3);
  -[_INPBPrivateMediaIntentData setFallbackUsername:](v5, "setFallbackUsername:", v6);

  v7 = -[_INPBHomeAutomationEntityProvider copyWithZone:](self->_homeAutomationEntityProvider, "copyWithZone:", a3);
  -[_INPBPrivateMediaIntentData setHomeAutomationEntityProvider:](v5, "setHomeAutomationEntityProvider:", v7);

  if (-[_INPBPrivateMediaIntentData hasIsAppAttributionRequired](self, "hasIsAppAttributionRequired"))
    -[_INPBPrivateMediaIntentData setIsAppAttributionRequired:](v5, "setIsAppAttributionRequired:", -[_INPBPrivateMediaIntentData isAppAttributionRequired](self, "isAppAttributionRequired"));
  if (-[_INPBPrivateMediaIntentData hasIsAppCorrection](self, "hasIsAppCorrection"))
    -[_INPBPrivateMediaIntentData setIsAppCorrection:](v5, "setIsAppCorrection:", -[_INPBPrivateMediaIntentData isAppCorrection](self, "isAppCorrection"));
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceLevel](self, "hasNlConfidenceLevel"))
    -[_INPBPrivateMediaIntentData setNlConfidenceLevel:](v5, "setNlConfidenceLevel:", -[_INPBPrivateMediaIntentData nlConfidenceLevel](self, "nlConfidenceLevel"));
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceScore](self, "hasNlConfidenceScore"))
  {
    -[_INPBPrivateMediaIntentData nlConfidenceScore](self, "nlConfidenceScore");
    -[_INPBPrivateMediaIntentData setNlConfidenceScore:](v5, "setNlConfidenceScore:");
  }
  v8 = -[_INPBAppIdentifier copyWithZone:](self->_proxiedThirdPartyAppInfo, "copyWithZone:", a3);
  -[_INPBPrivateMediaIntentData setProxiedThirdPartyAppInfo:](v5, "setProxiedThirdPartyAppInfo:", v8);

  v9 = -[_INPBString copyWithZone:](self->_resolvedSharedUserID, "copyWithZone:", a3);
  -[_INPBPrivateMediaIntentData setResolvedSharedUserID:](v5, "setResolvedSharedUserID:", v9);

  v10 = -[_INPBSpeakerIDInfo copyWithZone:](self->_speakerIDInfo, "copyWithZone:", a3);
  -[_INPBPrivateMediaIntentData setSpeakerIDInfo:](v5, "setSpeakerIDInfo:", v10);

  if (-[_INPBPrivateMediaIntentData hasUseDialogMemoryForAttribution](self, "hasUseDialogMemoryForAttribution"))
    -[_INPBPrivateMediaIntentData setUseDialogMemoryForAttribution:](v5, "setUseDialogMemoryForAttribution:", -[_INPBPrivateMediaIntentData useDialogMemoryForAttribution](self, "useDialogMemoryForAttribution"));
  v11 = -[_INPBWholeHouseAudioMetadata copyWithZone:](self->_wholeHouseAudioMetadata, "copyWithZone:", a3);
  -[_INPBPrivateMediaIntentData setWholeHouseAudioMetadata:](v5, "setWholeHouseAudioMetadata:", v11);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int asrConfidenceLevel;
  int v7;
  float asrConfidenceScore;
  float v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int isAppAttributionRequired;
  int v24;
  int isAppCorrection;
  int v26;
  int nlConfidenceLevel;
  int v28;
  float nlConfidenceScore;
  float v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int useDialogMemoryForAttribution;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  BOOL v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_60;
  v5 = -[_INPBPrivateMediaIntentData hasAsrConfidenceLevel](self, "hasAsrConfidenceLevel");
  if (v5 != objc_msgSend(v4, "hasAsrConfidenceLevel"))
    goto LABEL_60;
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceLevel](self, "hasAsrConfidenceLevel"))
  {
    if (objc_msgSend(v4, "hasAsrConfidenceLevel"))
    {
      asrConfidenceLevel = self->_asrConfidenceLevel;
      if (asrConfidenceLevel != objc_msgSend(v4, "asrConfidenceLevel"))
        goto LABEL_60;
    }
  }
  v7 = -[_INPBPrivateMediaIntentData hasAsrConfidenceScore](self, "hasAsrConfidenceScore");
  if (v7 != objc_msgSend(v4, "hasAsrConfidenceScore"))
    goto LABEL_60;
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceScore](self, "hasAsrConfidenceScore"))
  {
    if (objc_msgSend(v4, "hasAsrConfidenceScore"))
    {
      asrConfidenceScore = self->_asrConfidenceScore;
      objc_msgSend(v4, "asrConfidenceScore");
      if (asrConfidenceScore != v9)
        goto LABEL_60;
    }
  }
  -[_INPBPrivateMediaIntentData fallbackUsername](self, "fallbackUsername");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fallbackUsername");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_59;
  -[_INPBPrivateMediaIntentData fallbackUsername](self, "fallbackUsername");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPrivateMediaIntentData fallbackUsername](self, "fallbackUsername");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fallbackUsername");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_60;
  }
  else
  {

  }
  -[_INPBPrivateMediaIntentData homeAutomationEntityProvider](self, "homeAutomationEntityProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationEntityProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_59;
  -[_INPBPrivateMediaIntentData homeAutomationEntityProvider](self, "homeAutomationEntityProvider");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBPrivateMediaIntentData homeAutomationEntityProvider](self, "homeAutomationEntityProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeAutomationEntityProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_60;
  }
  else
  {

  }
  v22 = -[_INPBPrivateMediaIntentData hasIsAppAttributionRequired](self, "hasIsAppAttributionRequired");
  if (v22 != objc_msgSend(v4, "hasIsAppAttributionRequired"))
    goto LABEL_60;
  if (-[_INPBPrivateMediaIntentData hasIsAppAttributionRequired](self, "hasIsAppAttributionRequired"))
  {
    if (objc_msgSend(v4, "hasIsAppAttributionRequired"))
    {
      isAppAttributionRequired = self->_isAppAttributionRequired;
      if (isAppAttributionRequired != objc_msgSend(v4, "isAppAttributionRequired"))
        goto LABEL_60;
    }
  }
  v24 = -[_INPBPrivateMediaIntentData hasIsAppCorrection](self, "hasIsAppCorrection");
  if (v24 != objc_msgSend(v4, "hasIsAppCorrection"))
    goto LABEL_60;
  if (-[_INPBPrivateMediaIntentData hasIsAppCorrection](self, "hasIsAppCorrection"))
  {
    if (objc_msgSend(v4, "hasIsAppCorrection"))
    {
      isAppCorrection = self->_isAppCorrection;
      if (isAppCorrection != objc_msgSend(v4, "isAppCorrection"))
        goto LABEL_60;
    }
  }
  v26 = -[_INPBPrivateMediaIntentData hasNlConfidenceLevel](self, "hasNlConfidenceLevel");
  if (v26 != objc_msgSend(v4, "hasNlConfidenceLevel"))
    goto LABEL_60;
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceLevel](self, "hasNlConfidenceLevel"))
  {
    if (objc_msgSend(v4, "hasNlConfidenceLevel"))
    {
      nlConfidenceLevel = self->_nlConfidenceLevel;
      if (nlConfidenceLevel != objc_msgSend(v4, "nlConfidenceLevel"))
        goto LABEL_60;
    }
  }
  v28 = -[_INPBPrivateMediaIntentData hasNlConfidenceScore](self, "hasNlConfidenceScore");
  if (v28 != objc_msgSend(v4, "hasNlConfidenceScore"))
    goto LABEL_60;
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceScore](self, "hasNlConfidenceScore"))
  {
    if (objc_msgSend(v4, "hasNlConfidenceScore"))
    {
      nlConfidenceScore = self->_nlConfidenceScore;
      objc_msgSend(v4, "nlConfidenceScore");
      if (nlConfidenceScore != v30)
        goto LABEL_60;
    }
  }
  -[_INPBPrivateMediaIntentData proxiedThirdPartyAppInfo](self, "proxiedThirdPartyAppInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxiedThirdPartyAppInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_59;
  -[_INPBPrivateMediaIntentData proxiedThirdPartyAppInfo](self, "proxiedThirdPartyAppInfo");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_INPBPrivateMediaIntentData proxiedThirdPartyAppInfo](self, "proxiedThirdPartyAppInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxiedThirdPartyAppInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_60;
  }
  else
  {

  }
  -[_INPBPrivateMediaIntentData resolvedSharedUserID](self, "resolvedSharedUserID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedSharedUserID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_59;
  -[_INPBPrivateMediaIntentData resolvedSharedUserID](self, "resolvedSharedUserID");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_INPBPrivateMediaIntentData resolvedSharedUserID](self, "resolvedSharedUserID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedSharedUserID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_60;
  }
  else
  {

  }
  -[_INPBPrivateMediaIntentData speakerIDInfo](self, "speakerIDInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakerIDInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_59;
  -[_INPBPrivateMediaIntentData speakerIDInfo](self, "speakerIDInfo");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_INPBPrivateMediaIntentData speakerIDInfo](self, "speakerIDInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speakerIDInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_60;
  }
  else
  {

  }
  v46 = -[_INPBPrivateMediaIntentData hasUseDialogMemoryForAttribution](self, "hasUseDialogMemoryForAttribution");
  if (v46 != objc_msgSend(v4, "hasUseDialogMemoryForAttribution"))
    goto LABEL_60;
  if (-[_INPBPrivateMediaIntentData hasUseDialogMemoryForAttribution](self, "hasUseDialogMemoryForAttribution"))
  {
    if (objc_msgSend(v4, "hasUseDialogMemoryForAttribution"))
    {
      useDialogMemoryForAttribution = self->_useDialogMemoryForAttribution;
      if (useDialogMemoryForAttribution != objc_msgSend(v4, "useDialogMemoryForAttribution"))
        goto LABEL_60;
    }
  }
  -[_INPBPrivateMediaIntentData wholeHouseAudioMetadata](self, "wholeHouseAudioMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wholeHouseAudioMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[_INPBPrivateMediaIntentData wholeHouseAudioMetadata](self, "wholeHouseAudioMetadata");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48)
    {

LABEL_63:
      v53 = 1;
      goto LABEL_61;
    }
    v49 = (void *)v48;
    -[_INPBPrivateMediaIntentData wholeHouseAudioMetadata](self, "wholeHouseAudioMetadata");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wholeHouseAudioMetadata");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if ((v52 & 1) != 0)
      goto LABEL_63;
  }
  else
  {
LABEL_59:

  }
LABEL_60:
  v53 = 0;
LABEL_61:

  return v53;
}

- (unint64_t)hash
{
  uint64_t v3;
  float asrConfidenceScore;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  float nlConfidenceScore;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceLevel](self, "hasAsrConfidenceLevel"))
    v3 = 2654435761 * self->_asrConfidenceLevel;
  else
    v3 = 0;
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceScore](self, "hasAsrConfidenceScore"))
  {
    asrConfidenceScore = self->_asrConfidenceScore;
    v5 = asrConfidenceScore;
    if (asrConfidenceScore < 0.0)
      v5 = -asrConfidenceScore;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v8 = fmod(v6, 1.84467441e19);
    v9 = 2654435761u * (unint64_t)v8;
    v10 = v9 + (unint64_t)v7;
    if (v7 <= 0.0)
      v10 = 2654435761u * (unint64_t)v8;
    v11 = v9 - (unint64_t)fabs(v7);
    if (v7 < 0.0)
      v12 = v11;
    else
      v12 = v10;
  }
  else
  {
    v12 = 0;
  }
  v13 = -[_INPBString hash](self->_fallbackUsername, "hash");
  v14 = -[_INPBHomeAutomationEntityProvider hash](self->_homeAutomationEntityProvider, "hash");
  if (-[_INPBPrivateMediaIntentData hasIsAppAttributionRequired](self, "hasIsAppAttributionRequired"))
    v15 = 2654435761 * self->_isAppAttributionRequired;
  else
    v15 = 0;
  if (-[_INPBPrivateMediaIntentData hasIsAppCorrection](self, "hasIsAppCorrection"))
    v29 = 2654435761 * self->_isAppCorrection;
  else
    v29 = 0;
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceLevel](self, "hasNlConfidenceLevel"))
    v16 = -[_INPBPrivateMediaIntentData hasNlConfidenceScore](self, "hasNlConfidenceScore", 2654435761 * self->_nlConfidenceLevel);
  else
    v16 = -[_INPBPrivateMediaIntentData hasNlConfidenceScore](self, "hasNlConfidenceScore", 0);
  if (v16)
  {
    nlConfidenceScore = self->_nlConfidenceScore;
    v18 = nlConfidenceScore;
    if (nlConfidenceScore < 0.0)
      v18 = -nlConfidenceScore;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    v22 = v14;
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v21 += (unint64_t)v20;
    }
    else
    {
      v21 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v22 = v14;
    v21 = 0;
  }
  v23 = -[_INPBAppIdentifier hash](self->_proxiedThirdPartyAppInfo, "hash");
  v24 = -[_INPBString hash](self->_resolvedSharedUserID, "hash");
  v25 = -[_INPBSpeakerIDInfo hash](self->_speakerIDInfo, "hash");
  if (-[_INPBPrivateMediaIntentData hasUseDialogMemoryForAttribution](self, "hasUseDialogMemoryForAttribution"))
    v26 = 2654435761 * self->_useDialogMemoryForAttribution;
  else
    v26 = 0;
  return v12 ^ v3 ^ v13 ^ v22 ^ v15 ^ v29 ^ v28 ^ v21 ^ v23 ^ v24 ^ v25 ^ v26 ^ -[_INPBWholeHouseAudioMetadata hash](self->_wholeHouseAudioMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceLevel](self, "hasAsrConfidenceLevel"))
  {
    v4 = -[_INPBPrivateMediaIntentData asrConfidenceLevel](self, "asrConfidenceLevel");
    if ((int)v4 > 19)
    {
      if ((_DWORD)v4 == 20)
      {
        v5 = CFSTR("MEDIUM");
        goto LABEL_12;
      }
      if ((_DWORD)v4 == 30)
      {
        v5 = CFSTR("HIGH");
        goto LABEL_12;
      }
    }
    else
    {
      if (!(_DWORD)v4)
      {
        v5 = CFSTR("UNKNOWN_CONFIDENCE_LEVEL");
        goto LABEL_12;
      }
      if ((_DWORD)v4 == 10)
      {
        v5 = CFSTR("LOW");
LABEL_12:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrConfidenceLevel"));

        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  if (-[_INPBPrivateMediaIntentData hasAsrConfidenceScore](self, "hasAsrConfidenceScore"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBPrivateMediaIntentData asrConfidenceScore](self, "asrConfidenceScore");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("asrConfidenceScore"));

  }
  -[_INPBPrivateMediaIntentData fallbackUsername](self, "fallbackUsername");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("fallbackUsername"));

  -[_INPBPrivateMediaIntentData homeAutomationEntityProvider](self, "homeAutomationEntityProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("homeAutomationEntityProvider"));

  if (-[_INPBPrivateMediaIntentData hasIsAppAttributionRequired](self, "hasIsAppAttributionRequired"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivateMediaIntentData isAppAttributionRequired](self, "isAppAttributionRequired"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isAppAttributionRequired"));

  }
  if (-[_INPBPrivateMediaIntentData hasIsAppCorrection](self, "hasIsAppCorrection"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivateMediaIntentData isAppCorrection](self, "isAppCorrection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isAppCorrection"));

  }
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceLevel](self, "hasNlConfidenceLevel"))
  {
    v14 = -[_INPBPrivateMediaIntentData nlConfidenceLevel](self, "nlConfidenceLevel");
    if ((int)v14 > 19)
    {
      if ((_DWORD)v14 == 20)
      {
        v15 = CFSTR("MEDIUM");
        goto LABEL_30;
      }
      if ((_DWORD)v14 == 30)
      {
        v15 = CFSTR("HIGH");
        goto LABEL_30;
      }
    }
    else
    {
      if (!(_DWORD)v14)
      {
        v15 = CFSTR("UNKNOWN_CONFIDENCE_LEVEL");
        goto LABEL_30;
      }
      if ((_DWORD)v14 == 10)
      {
        v15 = CFSTR("LOW");
LABEL_30:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("nlConfidenceLevel"));

        goto LABEL_31;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
LABEL_31:
  if (-[_INPBPrivateMediaIntentData hasNlConfidenceScore](self, "hasNlConfidenceScore"))
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBPrivateMediaIntentData nlConfidenceScore](self, "nlConfidenceScore");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("nlConfidenceScore"));

  }
  -[_INPBPrivateMediaIntentData proxiedThirdPartyAppInfo](self, "proxiedThirdPartyAppInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("proxiedThirdPartyAppInfo"));

  -[_INPBPrivateMediaIntentData resolvedSharedUserID](self, "resolvedSharedUserID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("resolvedSharedUserID"));

  -[_INPBPrivateMediaIntentData speakerIDInfo](self, "speakerIDInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("speakerIDInfo"));

  if (-[_INPBPrivateMediaIntentData hasUseDialogMemoryForAttribution](self, "hasUseDialogMemoryForAttribution"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivateMediaIntentData useDialogMemoryForAttribution](self, "useDialogMemoryForAttribution"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("useDialogMemoryForAttribution"));

  }
  -[_INPBPrivateMediaIntentData wholeHouseAudioMetadata](self, "wholeHouseAudioMetadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dictionaryRepresentation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("wholeHouseAudioMetadata"));

  return v3;
}

- (int)asrConfidenceLevel
{
  return self->_asrConfidenceLevel;
}

- (float)asrConfidenceScore
{
  return self->_asrConfidenceScore;
}

- (_INPBString)fallbackUsername
{
  return self->_fallbackUsername;
}

- (_INPBHomeAutomationEntityProvider)homeAutomationEntityProvider
{
  return self->_homeAutomationEntityProvider;
}

- (BOOL)isAppAttributionRequired
{
  return self->_isAppAttributionRequired;
}

- (BOOL)isAppCorrection
{
  return self->_isAppCorrection;
}

- (int)nlConfidenceLevel
{
  return self->_nlConfidenceLevel;
}

- (float)nlConfidenceScore
{
  return self->_nlConfidenceScore;
}

- (_INPBAppIdentifier)proxiedThirdPartyAppInfo
{
  return self->_proxiedThirdPartyAppInfo;
}

- (_INPBString)resolvedSharedUserID
{
  return self->_resolvedSharedUserID;
}

- (_INPBSpeakerIDInfo)speakerIDInfo
{
  return self->_speakerIDInfo;
}

- (BOOL)useDialogMemoryForAttribution
{
  return self->_useDialogMemoryForAttribution;
}

- (_INPBWholeHouseAudioMetadata)wholeHouseAudioMetadata
{
  return self->_wholeHouseAudioMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wholeHouseAudioMetadata, 0);
  objc_storeStrong((id *)&self->_speakerIDInfo, 0);
  objc_storeStrong((id *)&self->_resolvedSharedUserID, 0);
  objc_storeStrong((id *)&self->_proxiedThirdPartyAppInfo, 0);
  objc_storeStrong((id *)&self->_homeAutomationEntityProvider, 0);
  objc_storeStrong((id *)&self->_fallbackUsername, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
