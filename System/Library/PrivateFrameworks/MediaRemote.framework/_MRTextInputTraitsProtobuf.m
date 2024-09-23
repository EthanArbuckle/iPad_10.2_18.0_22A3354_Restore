@implementation _MRTextInputTraitsProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRTextInputTraitsProtobuf;
  -[_MRTextInputTraitsProtobuf dealloc](&v3, sel_dealloc);
}

- (int)autocapitalizationType
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_autocapitalizationType;
  else
    return 0;
}

- (void)setAutocapitalizationType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_autocapitalizationType = a3;
}

- (void)setHasAutocapitalizationType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAutocapitalizationType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)autocapitalizationTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30C5DA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAutocapitalizationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Words")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sentences")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AllCharacters")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)keyboardType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_keyboardType;
  else
    return 0;
}

- (void)setKeyboardType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_keyboardType = a3;
}

- (void)setHasKeyboardType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasKeyboardType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)keyboardTypeAsString:(int)a3
{
  if (a3 < 0xD)
    return off_1E30C5DC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKeyboardType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASCIICapable")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NumbersAndPunctuation")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NumberPad")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PhonePad")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NamePhonePad")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAddress")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DecimalPad")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Twitter")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WebSearch")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Alphabet")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PasscodePad")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)returnKeyType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_returnKeyType;
  else
    return 0;
}

- (void)setReturnKeyType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_returnKeyType = a3;
}

- (void)setHasReturnKeyType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasReturnKeyType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)returnKeyTypeAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E30C5E28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReturnKeyType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Go")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Google")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Join")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Next")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Route")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Search")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Send")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Yahoo")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Done")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmergencyCall")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Continue")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAutocorrection:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_autocorrection = a3;
}

- (void)setHasAutocorrection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAutocorrection
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSpellchecking:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_spellchecking = a3;
}

- (void)setHasSpellchecking:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSpellchecking
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEnablesReturnKeyAutomatically:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_enablesReturnKeyAutomatically = a3;
}

- (void)setHasEnablesReturnKeyAutomatically:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEnablesReturnKeyAutomatically
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_secureTextEntry = a3;
}

- (void)setHasSecureTextEntry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSecureTextEntry
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setValidTextRangeLocation:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_validTextRangeLocation = a3;
}

- (void)setHasValidTextRangeLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasValidTextRangeLocation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setValidTextRangeLength:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_validTextRangeLength = a3;
}

- (void)setHasValidTextRangeLength:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasValidTextRangeLength
{
  return *(_WORD *)&self->_has & 1;
}

- (unint64_t)pINEntrySeparatorIndexesCount
{
  return self->_pINEntrySeparatorIndexes.count;
}

- (unint64_t)pINEntrySeparatorIndexes
{
  return self->_pINEntrySeparatorIndexes.list;
}

- (void)clearPINEntrySeparatorIndexes
{
  PBRepeatedUInt64Clear();
}

- (void)addPINEntrySeparatorIndexes:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)pINEntrySeparatorIndexesAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_pINEntrySeparatorIndexes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_pINEntrySeparatorIndexes = &self->_pINEntrySeparatorIndexes;
  count = self->_pINEntrySeparatorIndexes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_pINEntrySeparatorIndexes->list[a3];
}

- (void)setPINEntrySeparatorIndexes:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
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
  v8.super_class = (Class)_MRTextInputTraitsProtobuf;
  -[_MRTextInputTraitsProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRTextInputTraitsProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  uint64_t autocapitalizationType;
  __CFString *v6;
  uint64_t keyboardType;
  __CFString *v8;
  uint64_t returnKeyType;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    autocapitalizationType = self->_autocapitalizationType;
    if (autocapitalizationType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_autocapitalizationType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E30C5DA0[autocapitalizationType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("autocapitalizationType"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  keyboardType = self->_keyboardType;
  if (keyboardType >= 0xD)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_keyboardType);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E30C5DC0[keyboardType];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("keyboardType"));

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    returnKeyType = self->_returnKeyType;
    if (returnKeyType >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_returnKeyType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E30C5E28[returnKeyType];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("returnKeyType"));

    has = (__int16)self->_has;
  }
LABEL_17:
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autocorrection);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("autocorrection"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_19:
      if ((has & 0x40) == 0)
        goto LABEL_20;
      goto LABEL_27;
    }
  }
  else if ((has & 0x100) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spellchecking);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("spellchecking"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_20:
    if ((has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enablesReturnKeyAutomatically);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("enablesReturnKeyAutomatically"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_21:
    if ((has & 2) == 0)
      goto LABEL_22;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_validTextRangeLocation);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("validTextRangeLocation"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_secureTextEntry);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("secureTextEntry"));

  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_29;
LABEL_22:
  if ((has & 1) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_validTextRangeLength);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("validTextRangeLength"));

  }
LABEL_24:
  PBRepeatedUInt64NSArray();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("PINEntrySeparatorIndexes"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTextInputTraitsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  $D9041E0417540B7714261C3B5E8BB314 *p_pINEntrySeparatorIndexes;
  unint64_t v7;
  id v8;

  v4 = a3;
  has = (__int16)self->_has;
  v8 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_10:
    PBDataWriterWriteUint64Field();
    v4 = v8;
  }
LABEL_11:
  p_pINEntrySeparatorIndexes = &self->_pINEntrySeparatorIndexes;
  if (p_pINEntrySeparatorIndexes->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v8;
      ++v7;
    }
    while (v7 < p_pINEntrySeparatorIndexes->count);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v4[12] = self->_autocapitalizationType;
    *((_WORD *)v4 + 32) |= 4u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_keyboardType;
  *((_WORD *)v4 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v4[14] = self->_returnKeyType;
  *((_WORD *)v4 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v4 + 60) = self->_autocorrection;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v4 + 63) = self->_spellchecking;
  *((_WORD *)v4 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)v4 + 61) = self->_enablesReturnKeyAutomatically;
  *((_WORD *)v4 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
LABEL_23:
    *((_QWORD *)v4 + 5) = self->_validTextRangeLocation;
    *((_WORD *)v4 + 32) |= 2u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_22:
  *((_BYTE *)v4 + 62) = self->_secureTextEntry;
  *((_WORD *)v4 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_23;
LABEL_9:
  if ((has & 1) != 0)
  {
LABEL_10:
    *((_QWORD *)v4 + 4) = self->_validTextRangeLength;
    *((_WORD *)v4 + 32) |= 1u;
  }
LABEL_11:
  v9 = v4;
  if (-[_MRTextInputTraitsProtobuf pINEntrySeparatorIndexesCount](self, "pINEntrySeparatorIndexesCount"))
  {
    objc_msgSend(v9, "clearPINEntrySeparatorIndexes");
    v6 = -[_MRTextInputTraitsProtobuf pINEntrySeparatorIndexesCount](self, "pINEntrySeparatorIndexesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addPINEntrySeparatorIndexes:", -[_MRTextInputTraitsProtobuf pINEntrySeparatorIndexesAtIndex:](self, "pINEntrySeparatorIndexesAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  __int16 has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v4 + 48) = self->_autocapitalizationType;
    *(_WORD *)(v4 + 64) |= 4u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 52) = self->_keyboardType;
  *(_WORD *)(v4 + 64) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v4 + 56) = self->_returnKeyType;
  *(_WORD *)(v4 + 64) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *(_BYTE *)(v4 + 60) = self->_autocorrection;
  *(_WORD *)(v4 + 64) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *(_BYTE *)(v4 + 63) = self->_spellchecking;
  *(_WORD *)(v4 + 64) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *(_BYTE *)(v4 + 61) = self->_enablesReturnKeyAutomatically;
  *(_WORD *)(v4 + 64) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
LABEL_19:
    *(_QWORD *)(v4 + 40) = self->_validTextRangeLocation;
    *(_WORD *)(v4 + 64) |= 2u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  *(_BYTE *)(v4 + 62) = self->_secureTextEntry;
  *(_WORD *)(v4 + 64) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 1) != 0)
  {
LABEL_10:
    *(_QWORD *)(v4 + 32) = self->_validTextRangeLength;
    *(_WORD *)(v4 + 64) |= 1u;
  }
LABEL_11:
  PBRepeatedUInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_60;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 32);
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_autocapitalizationType != *((_DWORD *)v4 + 12))
      goto LABEL_60;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_keyboardType != *((_DWORD *)v4 + 13))
      goto LABEL_60;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_returnKeyType != *((_DWORD *)v4 + 14))
      goto LABEL_60;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_60;
    if (self->_autocorrection)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_60;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0)
      goto LABEL_60;
    if (self->_spellchecking)
    {
      if (!*((_BYTE *)v4 + 63))
        goto LABEL_60;
    }
    else if (*((_BYTE *)v4 + 63))
    {
      goto LABEL_60;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_60;
    if (self->_enablesReturnKeyAutomatically)
    {
      if (!*((_BYTE *)v4 + 61))
        goto LABEL_60;
    }
    else if (*((_BYTE *)v4 + 61))
    {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_secureTextEntry)
      {
        if (!*((_BYTE *)v4 + 62))
          goto LABEL_60;
        goto LABEL_49;
      }
      if (!*((_BYTE *)v4 + 62))
        goto LABEL_49;
    }
LABEL_60:
    IsEqual = 0;
    goto LABEL_61;
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_60;
LABEL_49:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_validTextRangeLocation != *((_QWORD *)v4 + 5))
      goto LABEL_60;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_validTextRangeLength != *((_QWORD *)v4 + 4))
      goto LABEL_60;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_60;
  }
  IsEqual = PBRepeatedUInt64IsEqual();
LABEL_61:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v3 = 2654435761 * self->_autocapitalizationType;
    if ((has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_keyboardType;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_returnKeyType;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_autocorrection;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_spellchecking;
    if ((has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_enablesReturnKeyAutomatically;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_secureTextEntry;
    if ((has & 2) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((has & 1) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ PBRepeatedUInt64Hash();
  }
LABEL_17:
  v9 = 0;
  if ((has & 2) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761u * self->_validTextRangeLocation;
  if ((has & 1) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761u * self->_validTextRangeLength;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_autocapitalizationType = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
    v5 = *((_WORD *)v4 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_keyboardType = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_returnKeyType = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_autocorrection = *((_BYTE *)v4 + 60);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_spellchecking = *((_BYTE *)v4 + 63);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_enablesReturnKeyAutomatically = *((_BYTE *)v4 + 61);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_secureTextEntry = *((_BYTE *)v4 + 62);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_22:
  self->_validTextRangeLocation = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 32) & 1) != 0)
  {
LABEL_10:
    self->_validTextRangeLength = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_11:
  v9 = v4;
  v6 = objc_msgSend(v4, "pINEntrySeparatorIndexesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[_MRTextInputTraitsProtobuf addPINEntrySeparatorIndexes:](self, "addPINEntrySeparatorIndexes:", objc_msgSend(v9, "pINEntrySeparatorIndexesAtIndex:", i));
  }

}

- (BOOL)autocorrection
{
  return self->_autocorrection;
}

- (BOOL)spellchecking
{
  return self->_spellchecking;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return self->_enablesReturnKeyAutomatically;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (unint64_t)validTextRangeLocation
{
  return self->_validTextRangeLocation;
}

- (unint64_t)validTextRangeLength
{
  return self->_validTextRangeLength;
}

@end
