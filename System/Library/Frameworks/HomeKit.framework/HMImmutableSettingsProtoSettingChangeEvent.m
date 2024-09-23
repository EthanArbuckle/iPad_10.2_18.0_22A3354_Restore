@implementation HMImmutableSettingsProtoSettingChangeEvent

- (BOOL)hasKeyPath
{
  return self->_keyPath != 0;
}

- (void)setReadOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_readOnly = a3;
}

- (void)setHasReadOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReadOnly
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasStringSetting
{
  return self->_stringSetting != 0;
}

- (void)setStringSetting:(id)a3
{
  HMImmutableSettingsProtoStringSettingEvent *v4;
  HMImmutableSettingsProtoStringSettingEvent *stringSetting;

  v4 = (HMImmutableSettingsProtoStringSettingEvent *)a3;
  -[HMImmutableSettingsProtoSettingChangeEvent clearOneofValuesForSettingChangeEvent](self, "clearOneofValuesForSettingChangeEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingChangeEvent = 1;
  stringSetting = self->_stringSetting;
  self->_stringSetting = v4;

}

- (BOOL)hasBoundedIntegerSetting
{
  return self->_boundedIntegerSetting != 0;
}

- (void)setBoundedIntegerSetting:(id)a3
{
  HMImmutableSettingsProtoBoundedIntegerSettingEvent *v4;
  HMImmutableSettingsProtoBoundedIntegerSettingEvent *boundedIntegerSetting;

  v4 = (HMImmutableSettingsProtoBoundedIntegerSettingEvent *)a3;
  -[HMImmutableSettingsProtoSettingChangeEvent clearOneofValuesForSettingChangeEvent](self, "clearOneofValuesForSettingChangeEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingChangeEvent = 2;
  boundedIntegerSetting = self->_boundedIntegerSetting;
  self->_boundedIntegerSetting = v4;

}

- (BOOL)hasBoolSetting
{
  return self->_BOOLSetting != 0;
}

- (void)setBoolSetting:(id)a3
{
  HMImmutableSettingsProtoBoolSettingEvent *v4;
  HMImmutableSettingsProtoBoolSettingEvent *BOOLSetting;

  v4 = (HMImmutableSettingsProtoBoolSettingEvent *)a3;
  -[HMImmutableSettingsProtoSettingChangeEvent clearOneofValuesForSettingChangeEvent](self, "clearOneofValuesForSettingChangeEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingChangeEvent = 3;
  BOOLSetting = self->_BOOLSetting;
  self->_BOOLSetting = v4;

}

- (BOOL)hasLanguageSetting
{
  return self->_languageSetting != 0;
}

- (void)setLanguageSetting:(id)a3
{
  HMImmutableSettingsProtoLanguageSettingEvent *v4;
  HMImmutableSettingsProtoLanguageSettingEvent *languageSetting;

  v4 = (HMImmutableSettingsProtoLanguageSettingEvent *)a3;
  -[HMImmutableSettingsProtoSettingChangeEvent clearOneofValuesForSettingChangeEvent](self, "clearOneofValuesForSettingChangeEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingChangeEvent = 4;
  languageSetting = self->_languageSetting;
  self->_languageSetting = v4;

}

- (BOOL)hasAvailableLanguages
{
  return self->_availableLanguages != 0;
}

- (void)setAvailableLanguages:(id)a3
{
  HMImmutableSettingsProtoAvailableLanguageListEvent *v4;
  HMImmutableSettingsProtoAvailableLanguageListEvent *availableLanguages;

  v4 = (HMImmutableSettingsProtoAvailableLanguageListEvent *)a3;
  -[HMImmutableSettingsProtoSettingChangeEvent clearOneofValuesForSettingChangeEvent](self, "clearOneofValuesForSettingChangeEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingChangeEvent = 5;
  availableLanguages = self->_availableLanguages;
  self->_availableLanguages = v4;

}

- (int)settingChangeEvent
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_settingChangeEvent;
  else
    return 0;
}

- (void)setSettingChangeEvent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_settingChangeEvent = a3;
}

- (void)setHasSettingChangeEvent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSettingChangeEvent
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)settingChangeEventAsString:(int)a3
{
  if (a3 < 6)
    return off_1E3AB4BA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSettingChangeEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("stringSetting")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("boundedIntegerSetting")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOLSetting")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("languageSetting")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("availableLanguages")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForSettingChangeEvent
{
  HMImmutableSettingsProtoStringSettingEvent *stringSetting;
  HMImmutableSettingsProtoBoundedIntegerSettingEvent *boundedIntegerSetting;
  HMImmutableSettingsProtoBoolSettingEvent *BOOLSetting;
  HMImmutableSettingsProtoLanguageSettingEvent *languageSetting;
  HMImmutableSettingsProtoAvailableLanguageListEvent *availableLanguages;

  *(_BYTE *)&self->_has &= ~1u;
  self->_settingChangeEvent = 0;
  stringSetting = self->_stringSetting;
  self->_stringSetting = 0;

  boundedIntegerSetting = self->_boundedIntegerSetting;
  self->_boundedIntegerSetting = 0;

  BOOLSetting = self->_BOOLSetting;
  self->_BOOLSetting = 0;

  languageSetting = self->_languageSetting;
  self->_languageSetting = 0;

  availableLanguages = self->_availableLanguages;
  self->_availableLanguages = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMImmutableSettingsProtoSettingChangeEvent;
  -[HMImmutableSettingsProtoSettingChangeEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoSettingChangeEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *keyPath;
  void *v6;
  HMImmutableSettingsProtoStringSettingEvent *stringSetting;
  void *v8;
  HMImmutableSettingsProtoBoundedIntegerSettingEvent *boundedIntegerSetting;
  void *v10;
  HMImmutableSettingsProtoBoolSettingEvent *BOOLSetting;
  void *v12;
  HMImmutableSettingsProtoLanguageSettingEvent *languageSetting;
  void *v14;
  HMImmutableSettingsProtoAvailableLanguageListEvent *availableLanguages;
  void *v16;
  uint64_t settingChangeEvent;
  __CFString *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  keyPath = self->_keyPath;
  if (keyPath)
    objc_msgSend(v3, "setObject:forKey:", keyPath, CFSTR("keyPath"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_readOnly);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("readOnly"));

  }
  stringSetting = self->_stringSetting;
  if (stringSetting)
  {
    -[HMImmutableSettingsProtoStringSettingEvent dictionaryRepresentation](stringSetting, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("stringSetting"));

  }
  boundedIntegerSetting = self->_boundedIntegerSetting;
  if (boundedIntegerSetting)
  {
    -[HMImmutableSettingsProtoBoundedIntegerSettingEvent dictionaryRepresentation](boundedIntegerSetting, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("boundedIntegerSetting"));

  }
  BOOLSetting = self->_BOOLSetting;
  if (BOOLSetting)
  {
    -[HMImmutableSettingsProtoBoolSettingEvent dictionaryRepresentation](BOOLSetting, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("BOOLSetting"));

  }
  languageSetting = self->_languageSetting;
  if (languageSetting)
  {
    -[HMImmutableSettingsProtoLanguageSettingEvent dictionaryRepresentation](languageSetting, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("languageSetting"));

  }
  availableLanguages = self->_availableLanguages;
  if (availableLanguages)
  {
    -[HMImmutableSettingsProtoAvailableLanguageListEvent dictionaryRepresentation](availableLanguages, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("availableLanguages"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    settingChangeEvent = self->_settingChangeEvent;
    if (settingChangeEvent >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_settingChangeEvent);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E3AB4BA0[settingChangeEvent];
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("SettingChangeEvent"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMImmutableSettingsProtoSettingChangeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_keyPath)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_stringSetting)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_boundedIntegerSetting)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_BOOLSetting)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_languageSetting)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_availableLanguages)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_settingChangeEvent;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  v5 = v4;
  if (self->_keyPath)
  {
    objc_msgSend(v4, "setKeyPath:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_readOnly;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  if (self->_stringSetting)
  {
    objc_msgSend(v5, "setStringSetting:");
    v4 = v5;
  }
  if (self->_boundedIntegerSetting)
  {
    objc_msgSend(v5, "setBoundedIntegerSetting:");
    v4 = v5;
  }
  if (self->_BOOLSetting)
  {
    objc_msgSend(v5, "setBoolSetting:");
    v4 = v5;
  }
  if (self->_languageSetting)
  {
    objc_msgSend(v5, "setLanguageSetting:");
    v4 = v5;
  }
  if (self->_availableLanguages)
  {
    objc_msgSend(v5, "setAvailableLanguages:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_settingChangeEvent;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_keyPath, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 64) = self->_readOnly;
    *(_BYTE *)(v6 + 68) |= 2u;
  }
  v9 = -[HMImmutableSettingsProtoStringSettingEvent copyWithZone:](self->_stringSetting, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v9;

  v11 = -[HMImmutableSettingsProtoBoundedIntegerSettingEvent copyWithZone:](self->_boundedIntegerSetting, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v11;

  v13 = -[HMImmutableSettingsProtoBoolSettingEvent copyWithZone:](self->_BOOLSetting, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v13;

  v15 = -[HMImmutableSettingsProtoLanguageSettingEvent copyWithZone:](self->_languageSetting, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v15;

  v17 = -[HMImmutableSettingsProtoAvailableLanguageListEvent copyWithZone:](self->_availableLanguages, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v17;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *keyPath;
  HMImmutableSettingsProtoStringSettingEvent *stringSetting;
  HMImmutableSettingsProtoBoundedIntegerSettingEvent *boundedIntegerSetting;
  HMImmutableSettingsProtoBoolSettingEvent *BOOLSetting;
  HMImmutableSettingsProtoLanguageSettingEvent *languageSetting;
  HMImmutableSettingsProtoAvailableLanguageListEvent *availableLanguages;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 68);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_settingChangeEvent != *((_DWORD *)v4 + 12))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_28;
  }
  keyPath = self->_keyPath;
  if ((unint64_t)keyPath | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](keyPath, "isEqual:"))
      goto LABEL_28;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_readOnly)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_28;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_18;
    }
LABEL_28:
    v13 = 0;
    goto LABEL_29;
  }
  if ((v6 & 2) != 0)
    goto LABEL_28;
LABEL_18:
  stringSetting = self->_stringSetting;
  if ((unint64_t)stringSetting | *((_QWORD *)v4 + 7)
    && !-[HMImmutableSettingsProtoStringSettingEvent isEqual:](stringSetting, "isEqual:"))
  {
    goto LABEL_28;
  }
  boundedIntegerSetting = self->_boundedIntegerSetting;
  if ((unint64_t)boundedIntegerSetting | *((_QWORD *)v4 + 3))
  {
    if (!-[HMImmutableSettingsProtoBoundedIntegerSettingEvent isEqual:](boundedIntegerSetting, "isEqual:"))
      goto LABEL_28;
  }
  BOOLSetting = self->_BOOLSetting;
  if ((unint64_t)BOOLSetting | *((_QWORD *)v4 + 2))
  {
    if (!-[HMImmutableSettingsProtoBoolSettingEvent isEqual:](BOOLSetting, "isEqual:"))
      goto LABEL_28;
  }
  languageSetting = self->_languageSetting;
  if ((unint64_t)languageSetting | *((_QWORD *)v4 + 5))
  {
    if (!-[HMImmutableSettingsProtoLanguageSettingEvent isEqual:](languageSetting, "isEqual:"))
      goto LABEL_28;
  }
  availableLanguages = self->_availableLanguages;
  if ((unint64_t)availableLanguages | *((_QWORD *)v4 + 1))
    v13 = -[HMImmutableSettingsProtoAvailableLanguageListEvent isEqual:](availableLanguages, "isEqual:");
  else
    v13 = 1;
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_settingChangeEvent;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_keyPath, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_readOnly;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[HMImmutableSettingsProtoStringSettingEvent hash](self->_stringSetting, "hash");
  v7 = -[HMImmutableSettingsProtoBoundedIntegerSettingEvent hash](self->_boundedIntegerSetting, "hash");
  v8 = v7 ^ -[HMImmutableSettingsProtoBoolSettingEvent hash](self->_BOOLSetting, "hash");
  v9 = v6 ^ v8 ^ -[HMImmutableSettingsProtoLanguageSettingEvent hash](self->_languageSetting, "hash");
  return v9 ^ -[HMImmutableSettingsProtoAvailableLanguageListEvent hash](self->_availableLanguages, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _BYTE *v5;
  HMImmutableSettingsProtoStringSettingEvent *stringSetting;
  uint64_t v7;
  HMImmutableSettingsProtoBoundedIntegerSettingEvent *boundedIntegerSetting;
  uint64_t v9;
  HMImmutableSettingsProtoBoolSettingEvent *BOOLSetting;
  uint64_t v11;
  HMImmutableSettingsProtoLanguageSettingEvent *languageSetting;
  uint64_t v13;
  HMImmutableSettingsProtoAvailableLanguageListEvent *availableLanguages;
  uint64_t v15;
  _DWORD *v16;

  v4 = a3;
  v5 = v4;
  if ((v4[17] & 1) != 0)
  {
    self->_settingChangeEvent = v4[12];
    *(_BYTE *)&self->_has |= 1u;
  }
  v16 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[HMImmutableSettingsProtoSettingChangeEvent setKeyPath:](self, "setKeyPath:");
    v5 = v16;
  }
  if ((v5[68] & 2) != 0)
  {
    self->_readOnly = v5[64];
    *(_BYTE *)&self->_has |= 2u;
  }
  stringSetting = self->_stringSetting;
  v7 = *((_QWORD *)v5 + 7);
  if (stringSetting)
  {
    if (!v7)
      goto LABEL_13;
    -[HMImmutableSettingsProtoStringSettingEvent mergeFrom:](stringSetting, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[HMImmutableSettingsProtoSettingChangeEvent setStringSetting:](self, "setStringSetting:");
  }
  v5 = v16;
LABEL_13:
  boundedIntegerSetting = self->_boundedIntegerSetting;
  v9 = *((_QWORD *)v5 + 3);
  if (boundedIntegerSetting)
  {
    if (!v9)
      goto LABEL_19;
    -[HMImmutableSettingsProtoBoundedIntegerSettingEvent mergeFrom:](boundedIntegerSetting, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[HMImmutableSettingsProtoSettingChangeEvent setBoundedIntegerSetting:](self, "setBoundedIntegerSetting:");
  }
  v5 = v16;
LABEL_19:
  BOOLSetting = self->_BOOLSetting;
  v11 = *((_QWORD *)v5 + 2);
  if (BOOLSetting)
  {
    if (!v11)
      goto LABEL_25;
    -[HMImmutableSettingsProtoBoolSettingEvent mergeFrom:](BOOLSetting, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_25;
    -[HMImmutableSettingsProtoSettingChangeEvent setBoolSetting:](self, "setBoolSetting:");
  }
  v5 = v16;
LABEL_25:
  languageSetting = self->_languageSetting;
  v13 = *((_QWORD *)v5 + 5);
  if (languageSetting)
  {
    if (!v13)
      goto LABEL_31;
    -[HMImmutableSettingsProtoLanguageSettingEvent mergeFrom:](languageSetting, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_31;
    -[HMImmutableSettingsProtoSettingChangeEvent setLanguageSetting:](self, "setLanguageSetting:");
  }
  v5 = v16;
LABEL_31:
  availableLanguages = self->_availableLanguages;
  v15 = *((_QWORD *)v5 + 1);
  if (availableLanguages)
  {
    if (v15)
    {
      -[HMImmutableSettingsProtoAvailableLanguageListEvent mergeFrom:](availableLanguages, "mergeFrom:");
LABEL_36:
      v5 = v16;
    }
  }
  else if (v15)
  {
    -[HMImmutableSettingsProtoSettingChangeEvent setAvailableLanguages:](self, "setAvailableLanguages:");
    goto LABEL_36;
  }

}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_keyPath, a3);
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (HMImmutableSettingsProtoStringSettingEvent)stringSetting
{
  return self->_stringSetting;
}

- (HMImmutableSettingsProtoBoundedIntegerSettingEvent)boundedIntegerSetting
{
  return self->_boundedIntegerSetting;
}

- (HMImmutableSettingsProtoBoolSettingEvent)BOOLSetting
{
  return self->_BOOLSetting;
}

- (HMImmutableSettingsProtoLanguageSettingEvent)languageSetting
{
  return self->_languageSetting;
}

- (HMImmutableSettingsProtoAvailableLanguageListEvent)availableLanguages
{
  return self->_availableLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringSetting, 0);
  objc_storeStrong((id *)&self->_languageSetting, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_boundedIntegerSetting, 0);
  objc_storeStrong((id *)&self->_BOOLSetting, 0);
  objc_storeStrong((id *)&self->_availableLanguages, 0);
}

@end
