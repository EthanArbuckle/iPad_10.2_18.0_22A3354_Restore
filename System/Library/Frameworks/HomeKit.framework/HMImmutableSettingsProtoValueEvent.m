@implementation HMImmutableSettingsProtoValueEvent

- (BOOL)hasStringValueEvent
{
  return self->_stringValueEvent != 0;
}

- (void)setStringValueEvent:(id)a3
{
  HMImmutableSettingsProtoStringValueEvent *v4;
  HMImmutableSettingsProtoStringValueEvent *stringValueEvent;

  v4 = (HMImmutableSettingsProtoStringValueEvent *)a3;
  -[HMImmutableSettingsProtoValueEvent clearOneofValuesForSettingValueEvent](self, "clearOneofValuesForSettingValueEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingValueEvent = 1;
  stringValueEvent = self->_stringValueEvent;
  self->_stringValueEvent = v4;

}

- (BOOL)hasIntegerValueEvent
{
  return self->_integerValueEvent != 0;
}

- (void)setIntegerValueEvent:(id)a3
{
  HMImmutableSettingsProtoIntegerValueEvent *v4;
  HMImmutableSettingsProtoIntegerValueEvent *integerValueEvent;

  v4 = (HMImmutableSettingsProtoIntegerValueEvent *)a3;
  -[HMImmutableSettingsProtoValueEvent clearOneofValuesForSettingValueEvent](self, "clearOneofValuesForSettingValueEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingValueEvent = 2;
  integerValueEvent = self->_integerValueEvent;
  self->_integerValueEvent = v4;

}

- (BOOL)hasBoolValueEvent
{
  return self->_BOOLValueEvent != 0;
}

- (void)setBoolValueEvent:(id)a3
{
  HMImmutableSettingsProtoBoolValueEvent *v4;
  HMImmutableSettingsProtoBoolValueEvent *BOOLValueEvent;

  v4 = (HMImmutableSettingsProtoBoolValueEvent *)a3;
  -[HMImmutableSettingsProtoValueEvent clearOneofValuesForSettingValueEvent](self, "clearOneofValuesForSettingValueEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingValueEvent = 3;
  BOOLValueEvent = self->_BOOLValueEvent;
  self->_BOOLValueEvent = v4;

}

- (BOOL)hasLanguageValueEvent
{
  return self->_languageValueEvent != 0;
}

- (void)setLanguageValueEvent:(id)a3
{
  HMImmutableSettingsProtoLanguageValueEvent *v4;
  HMImmutableSettingsProtoLanguageValueEvent *languageValueEvent;

  v4 = (HMImmutableSettingsProtoLanguageValueEvent *)a3;
  -[HMImmutableSettingsProtoValueEvent clearOneofValuesForSettingValueEvent](self, "clearOneofValuesForSettingValueEvent");
  *(_BYTE *)&self->_has |= 1u;
  self->_settingValueEvent = 4;
  languageValueEvent = self->_languageValueEvent;
  self->_languageValueEvent = v4;

}

- (int)settingValueEvent
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_settingValueEvent;
  else
    return 0;
}

- (void)setSettingValueEvent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_settingValueEvent = a3;
}

- (void)setHasSettingValueEvent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSettingValueEvent
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)settingValueEventAsString:(int)a3
{
  if (a3 < 5)
    return off_1E3AB4230[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSettingValueEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("stringValueEvent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("integerValueEvent")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOLValueEvent")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("languageValueEvent")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForSettingValueEvent
{
  HMImmutableSettingsProtoStringValueEvent *stringValueEvent;
  HMImmutableSettingsProtoIntegerValueEvent *integerValueEvent;
  HMImmutableSettingsProtoBoolValueEvent *BOOLValueEvent;
  HMImmutableSettingsProtoLanguageValueEvent *languageValueEvent;

  *(_BYTE *)&self->_has &= ~1u;
  self->_settingValueEvent = 0;
  stringValueEvent = self->_stringValueEvent;
  self->_stringValueEvent = 0;

  integerValueEvent = self->_integerValueEvent;
  self->_integerValueEvent = 0;

  BOOLValueEvent = self->_BOOLValueEvent;
  self->_BOOLValueEvent = 0;

  languageValueEvent = self->_languageValueEvent;
  self->_languageValueEvent = 0;

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
  v8.super_class = (Class)HMImmutableSettingsProtoValueEvent;
  -[HMImmutableSettingsProtoValueEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoValueEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HMImmutableSettingsProtoStringValueEvent *stringValueEvent;
  void *v5;
  HMImmutableSettingsProtoIntegerValueEvent *integerValueEvent;
  void *v7;
  HMImmutableSettingsProtoBoolValueEvent *BOOLValueEvent;
  void *v9;
  HMImmutableSettingsProtoLanguageValueEvent *languageValueEvent;
  void *v11;
  uint64_t settingValueEvent;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  stringValueEvent = self->_stringValueEvent;
  if (stringValueEvent)
  {
    -[HMImmutableSettingsProtoStringValueEvent dictionaryRepresentation](stringValueEvent, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("stringValueEvent"));

  }
  integerValueEvent = self->_integerValueEvent;
  if (integerValueEvent)
  {
    -[HMImmutableSettingsProtoIntegerValueEvent dictionaryRepresentation](integerValueEvent, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("integerValueEvent"));

  }
  BOOLValueEvent = self->_BOOLValueEvent;
  if (BOOLValueEvent)
  {
    -[HMImmutableSettingsProtoBoolValueEvent dictionaryRepresentation](BOOLValueEvent, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("BOOLValueEvent"));

  }
  languageValueEvent = self->_languageValueEvent;
  if (languageValueEvent)
  {
    -[HMImmutableSettingsProtoLanguageValueEvent dictionaryRepresentation](languageValueEvent, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("languageValueEvent"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    settingValueEvent = self->_settingValueEvent;
    if (settingValueEvent >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_settingValueEvent);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E3AB4230[settingValueEvent];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("SettingValueEvent"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMImmutableSettingsProtoValueEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_stringValueEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_integerValueEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_BOOLValueEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_languageValueEvent)
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
    v4[8] = self->_settingValueEvent;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v5 = v4;
  if (self->_stringValueEvent)
  {
    objc_msgSend(v4, "setStringValueEvent:");
    v4 = v5;
  }
  if (self->_integerValueEvent)
  {
    objc_msgSend(v5, "setIntegerValueEvent:");
    v4 = v5;
  }
  if (self->_BOOLValueEvent)
  {
    objc_msgSend(v5, "setBoolValueEvent:");
    v4 = v5;
  }
  if (self->_languageValueEvent)
  {
    objc_msgSend(v5, "setLanguageValueEvent:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_settingValueEvent;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[HMImmutableSettingsProtoStringValueEvent copyWithZone:](self->_stringValueEvent, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[HMImmutableSettingsProtoIntegerValueEvent copyWithZone:](self->_integerValueEvent, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[HMImmutableSettingsProtoBoolValueEvent copyWithZone:](self->_BOOLValueEvent, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[HMImmutableSettingsProtoLanguageValueEvent copyWithZone:](self->_languageValueEvent, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HMImmutableSettingsProtoStringValueEvent *stringValueEvent;
  HMImmutableSettingsProtoIntegerValueEvent *integerValueEvent;
  HMImmutableSettingsProtoBoolValueEvent *BOOLValueEvent;
  HMImmutableSettingsProtoLanguageValueEvent *languageValueEvent;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_settingValueEvent != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  stringValueEvent = self->_stringValueEvent;
  if ((unint64_t)stringValueEvent | *((_QWORD *)v4 + 5)
    && !-[HMImmutableSettingsProtoStringValueEvent isEqual:](stringValueEvent, "isEqual:"))
  {
    goto LABEL_15;
  }
  integerValueEvent = self->_integerValueEvent;
  if ((unint64_t)integerValueEvent | *((_QWORD *)v4 + 2))
  {
    if (!-[HMImmutableSettingsProtoIntegerValueEvent isEqual:](integerValueEvent, "isEqual:"))
      goto LABEL_15;
  }
  BOOLValueEvent = self->_BOOLValueEvent;
  if ((unint64_t)BOOLValueEvent | *((_QWORD *)v4 + 1))
  {
    if (!-[HMImmutableSettingsProtoBoolValueEvent isEqual:](BOOLValueEvent, "isEqual:"))
      goto LABEL_15;
  }
  languageValueEvent = self->_languageValueEvent;
  if ((unint64_t)languageValueEvent | *((_QWORD *)v4 + 3))
    v9 = -[HMImmutableSettingsProtoLanguageValueEvent isEqual:](languageValueEvent, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_settingValueEvent;
  else
    v3 = 0;
  v4 = -[HMImmutableSettingsProtoStringValueEvent hash](self->_stringValueEvent, "hash") ^ v3;
  v5 = -[HMImmutableSettingsProtoIntegerValueEvent hash](self->_integerValueEvent, "hash");
  v6 = v4 ^ v5 ^ -[HMImmutableSettingsProtoBoolValueEvent hash](self->_BOOLValueEvent, "hash");
  return v6 ^ -[HMImmutableSettingsProtoLanguageValueEvent hash](self->_languageValueEvent, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HMImmutableSettingsProtoStringValueEvent *stringValueEvent;
  uint64_t v7;
  HMImmutableSettingsProtoIntegerValueEvent *integerValueEvent;
  uint64_t v9;
  HMImmutableSettingsProtoBoolValueEvent *BOOLValueEvent;
  uint64_t v11;
  HMImmutableSettingsProtoLanguageValueEvent *languageValueEvent;
  uint64_t v13;
  _QWORD *v14;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_settingValueEvent = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  stringValueEvent = self->_stringValueEvent;
  v7 = v5[5];
  v14 = v5;
  if (stringValueEvent)
  {
    if (!v7)
      goto LABEL_9;
    -[HMImmutableSettingsProtoStringValueEvent mergeFrom:](stringValueEvent, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[HMImmutableSettingsProtoValueEvent setStringValueEvent:](self, "setStringValueEvent:");
  }
  v5 = v14;
LABEL_9:
  integerValueEvent = self->_integerValueEvent;
  v9 = v5[2];
  if (integerValueEvent)
  {
    if (!v9)
      goto LABEL_15;
    -[HMImmutableSettingsProtoIntegerValueEvent mergeFrom:](integerValueEvent, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[HMImmutableSettingsProtoValueEvent setIntegerValueEvent:](self, "setIntegerValueEvent:");
  }
  v5 = v14;
LABEL_15:
  BOOLValueEvent = self->_BOOLValueEvent;
  v11 = v5[1];
  if (BOOLValueEvent)
  {
    if (!v11)
      goto LABEL_21;
    -[HMImmutableSettingsProtoBoolValueEvent mergeFrom:](BOOLValueEvent, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[HMImmutableSettingsProtoValueEvent setBoolValueEvent:](self, "setBoolValueEvent:");
  }
  v5 = v14;
LABEL_21:
  languageValueEvent = self->_languageValueEvent;
  v13 = v5[3];
  if (languageValueEvent)
  {
    if (v13)
    {
      -[HMImmutableSettingsProtoLanguageValueEvent mergeFrom:](languageValueEvent, "mergeFrom:");
LABEL_26:
      v5 = v14;
    }
  }
  else if (v13)
  {
    -[HMImmutableSettingsProtoValueEvent setLanguageValueEvent:](self, "setLanguageValueEvent:");
    goto LABEL_26;
  }

}

- (HMImmutableSettingsProtoStringValueEvent)stringValueEvent
{
  return self->_stringValueEvent;
}

- (HMImmutableSettingsProtoIntegerValueEvent)integerValueEvent
{
  return self->_integerValueEvent;
}

- (HMImmutableSettingsProtoBoolValueEvent)BOOLValueEvent
{
  return self->_BOOLValueEvent;
}

- (HMImmutableSettingsProtoLanguageValueEvent)languageValueEvent
{
  return self->_languageValueEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValueEvent, 0);
  objc_storeStrong((id *)&self->_languageValueEvent, 0);
  objc_storeStrong((id *)&self->_integerValueEvent, 0);
  objc_storeStrong((id *)&self->_BOOLValueEvent, 0);
}

@end
