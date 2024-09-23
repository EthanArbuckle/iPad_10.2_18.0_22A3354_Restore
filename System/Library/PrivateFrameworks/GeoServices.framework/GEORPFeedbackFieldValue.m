@implementation GEORPFeedbackFieldValue

- (GEORPFeedbackFieldValue)init
{
  GEORPFeedbackFieldValue *v2;
  GEORPFeedbackFieldValue *v3;
  GEORPFeedbackFieldValue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackFieldValue;
  v2 = -[GEORPFeedbackFieldValue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackFieldValue)initWithData:(id)a3
{
  GEORPFeedbackFieldValue *v3;
  GEORPFeedbackFieldValue *v4;
  GEORPFeedbackFieldValue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackFieldValue;
  v3 = -[GEORPFeedbackFieldValue initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)fieldValueType
{
  os_unfair_lock_s *p_readerLock;
  $DFFB4F96B55397D28D7190630BF467E9 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 1) != 0)
    return self->_fieldValueType;
  else
    return 0;
}

- (void)setFieldValueType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400001u;
  self->_fieldValueType = a3;
}

- (void)setHasFieldValueType:(BOOL)a3
{
  self->_flags = ($DFFB4F96B55397D28D7190630BF467E9)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x400000);
}

- (BOOL)hasFieldValueType
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)fieldValueTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x16 && ((0x3FFEFFu >> a3) & 1) != 0)
  {
    v3 = off_1E1C0E9E0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsFieldValueType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_FIELD_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_SINGLE_SELECT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_MULTI_SELECT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_TEXT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_TEXT_LIST")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_DATE_TIME")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_COORDINATE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_BOOLEAN")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_LONG")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_ULONG")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_INT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_UINT")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_DOUBLE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_FLOAT")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_HOURS")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_TILE_FEATURE_INFO")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_AMENITIES")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_ULONG_LIST")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_ROUTE_STEP")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_TRANSIT_LINE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FIELD_PHOTOS")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSingleSelectField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 201) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSingleSelectField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasSingleSelectField
{
  -[GEORPFeedbackFieldValue _readSingleSelectField]((uint64_t)self);
  return self->_singleSelectField != 0;
}

- (GEORPFeedbackSingleSelectField)singleSelectField
{
  -[GEORPFeedbackFieldValue _readSingleSelectField]((uint64_t)self);
  return self->_singleSelectField;
}

- (void)setSingleSelectField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x404000u;
  objc_storeStrong((id *)&self->_singleSelectField, a3);
}

- (void)_readMultiSelectField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 201) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMultiSelectField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasMultiSelectField
{
  -[GEORPFeedbackFieldValue _readMultiSelectField]((uint64_t)self);
  return self->_multiSelectField != 0;
}

- (GEORPFeedbackMultiSelectField)multiSelectField
{
  -[GEORPFeedbackFieldValue _readMultiSelectField]((uint64_t)self);
  return self->_multiSelectField;
}

- (void)setMultiSelectField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400800u;
  objc_storeStrong((id *)&self->_multiSelectField, a3);
}

- (void)_readTextField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 201) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTextField
{
  -[GEORPFeedbackFieldValue _readTextField]((uint64_t)self);
  return self->_textField != 0;
}

- (GEORPFeedbackTextField)textField
{
  -[GEORPFeedbackFieldValue _readTextField]((uint64_t)self);
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x408000u;
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void)_readTextListField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 202) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextListField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTextListField
{
  -[GEORPFeedbackFieldValue _readTextListField]((uint64_t)self);
  return self->_textListField != 0;
}

- (GEORPFeedbackTextListField)textListField
{
  -[GEORPFeedbackFieldValue _readTextListField]((uint64_t)self);
  return self->_textListField;
}

- (void)setTextListField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x410000u;
  objc_storeStrong((id *)&self->_textListField, a3);
}

- (void)_readDateTimeField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 200) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDateTimeField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasDateTimeField
{
  -[GEORPFeedbackFieldValue _readDateTimeField]((uint64_t)self);
  return self->_dateTimeField != 0;
}

- (GEORPFeedbackTimestamp)dateTimeField
{
  -[GEORPFeedbackFieldValue _readDateTimeField]((uint64_t)self);
  return self->_dateTimeField;
}

- (void)setDateTimeField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400010u;
  objc_storeStrong((id *)&self->_dateTimeField, a3);
}

- (void)_readLocationField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 201) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasLocationField
{
  -[GEORPFeedbackFieldValue _readLocationField]((uint64_t)self);
  return self->_locationField != 0;
}

- (GEORPFeedbackCoordinateField)locationField
{
  -[GEORPFeedbackFieldValue _readLocationField]((uint64_t)self);
  return self->_locationField;
}

- (void)setLocationField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400200u;
  objc_storeStrong((id *)&self->_locationField, a3);
}

- (void)_readBooleanField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 200) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBooleanField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasBooleanField
{
  -[GEORPFeedbackFieldValue _readBooleanField]((uint64_t)self);
  return self->_BOOLeanField != 0;
}

- (GEORPFeedbackBooleanField)BOOLeanField
{
  -[GEORPFeedbackFieldValue _readBooleanField]((uint64_t)self);
  return self->_BOOLeanField;
}

- (void)setBooleanField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400008u;
  objc_storeStrong((id *)&self->_BOOLeanField, a3);
}

- (void)_readLongField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 201) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLongField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasLongField
{
  -[GEORPFeedbackFieldValue _readLongField]((uint64_t)self);
  return self->_longField != 0;
}

- (GEORPFeedbackLongField)longField
{
  -[GEORPFeedbackFieldValue _readLongField]((uint64_t)self);
  return self->_longField;
}

- (void)setLongField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400400u;
  objc_storeStrong((id *)&self->_longField, a3);
}

- (void)_readUlongField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 202) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUlongField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasUlongField
{
  -[GEORPFeedbackFieldValue _readUlongField]((uint64_t)self);
  return self->_ulongField != 0;
}

- (GEORPFeedbackULongField)ulongField
{
  -[GEORPFeedbackFieldValue _readUlongField]((uint64_t)self);
  return self->_ulongField;
}

- (void)setUlongField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x500000u;
  objc_storeStrong((id *)&self->_ulongField, a3);
}

- (void)_readIntField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 201) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIntField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasIntField
{
  -[GEORPFeedbackFieldValue _readIntField]((uint64_t)self);
  return self->_intField != 0;
}

- (GEORPFeedbackIntField)intField
{
  -[GEORPFeedbackFieldValue _readIntField]((uint64_t)self);
  return self->_intField;
}

- (void)setIntField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400100u;
  objc_storeStrong((id *)&self->_intField, a3);
}

- (void)_readUintField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 202) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUintField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasUintField
{
  -[GEORPFeedbackFieldValue _readUintField]((uint64_t)self);
  return self->_uintField != 0;
}

- (GEORPFeedbackUIntField)uintField
{
  -[GEORPFeedbackFieldValue _readUintField]((uint64_t)self);
  return self->_uintField;
}

- (void)setUintField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x480000u;
  objc_storeStrong((id *)&self->_uintField, a3);
}

- (void)_readDoubleField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 200) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDoubleField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasDoubleField
{
  -[GEORPFeedbackFieldValue _readDoubleField]((uint64_t)self);
  return self->_doubleField != 0;
}

- (GEORPFeedbackDoubleField)doubleField
{
  -[GEORPFeedbackFieldValue _readDoubleField]((uint64_t)self);
  return self->_doubleField;
}

- (void)setDoubleField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400020u;
  objc_storeStrong((id *)&self->_doubleField, a3);
}

- (void)_readFloatField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 200) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFloatField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasFloatField
{
  -[GEORPFeedbackFieldValue _readFloatField]((uint64_t)self);
  return self->_floatField != 0;
}

- (GEORPFeedbackFloatField)floatField
{
  -[GEORPFeedbackFieldValue _readFloatField]((uint64_t)self);
  return self->_floatField;
}

- (void)setFloatField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400040u;
  objc_storeStrong((id *)&self->_floatField, a3);
}

- (void)_readHoursFields
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 200) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHoursFields_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (NSMutableArray)hoursFields
{
  -[GEORPFeedbackFieldValue _readHoursFields]((uint64_t)self);
  return self->_hoursFields;
}

- (void)setHoursFields:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *hoursFields;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
  hoursFields = self->_hoursFields;
  self->_hoursFields = v4;

}

- (void)clearHoursFields
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
  -[NSMutableArray removeAllObjects](self->_hoursFields, "removeAllObjects");
}

- (void)addHoursField:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackFieldValue _readHoursFields]((uint64_t)self);
  -[GEORPFeedbackFieldValue _addNoFlagsHoursField:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
}

- (void)_addNoFlagsHoursField:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)hoursFieldsCount
{
  -[GEORPFeedbackFieldValue _readHoursFields]((uint64_t)self);
  return -[NSMutableArray count](self->_hoursFields, "count");
}

- (id)hoursFieldAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackFieldValue _readHoursFields]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_hoursFields, "objectAtIndex:", a3);
}

+ (Class)hoursFieldType
{
  return (Class)objc_opt_class();
}

- (void)_readTileFeatureInfoField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 202) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileFeatureInfoField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTileFeatureInfoField
{
  -[GEORPFeedbackFieldValue _readTileFeatureInfoField]((uint64_t)self);
  return self->_tileFeatureInfoField != 0;
}

- (GEORPFeedbackTileFeatureInfo)tileFeatureInfoField
{
  -[GEORPFeedbackFieldValue _readTileFeatureInfoField]((uint64_t)self);
  return self->_tileFeatureInfoField;
}

- (void)setTileFeatureInfoField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x420000u;
  objc_storeStrong((id *)&self->_tileFeatureInfoField, a3);
}

- (void)_readAmenitiesField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 200) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAmenitiesField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasAmenitiesField
{
  -[GEORPFeedbackFieldValue _readAmenitiesField]((uint64_t)self);
  return self->_amenitiesField != 0;
}

- (GEORPAmenityCorrections)amenitiesField
{
  -[GEORPFeedbackFieldValue _readAmenitiesField]((uint64_t)self);
  return self->_amenitiesField;
}

- (void)setAmenitiesField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400002u;
  objc_storeStrong((id *)&self->_amenitiesField, a3);
}

- (void)_readUlongListField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 202) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUlongListField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasUlongListField
{
  -[GEORPFeedbackFieldValue _readUlongListField]((uint64_t)self);
  return self->_ulongListField != 0;
}

- (GEORPFeedbackULongListField)ulongListField
{
  -[GEORPFeedbackFieldValue _readUlongListField]((uint64_t)self);
  return self->_ulongListField;
}

- (void)setUlongListField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x600000u;
  objc_storeStrong((id *)&self->_ulongListField, a3);
}

- (void)_readRouteStepField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 201) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteStepField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasRouteStepField
{
  -[GEORPFeedbackFieldValue _readRouteStepField]((uint64_t)self);
  return self->_routeStepField != 0;
}

- (GEORPFeedbackRouteStep)routeStepField
{
  -[GEORPFeedbackFieldValue _readRouteStepField]((uint64_t)self);
  return self->_routeStepField;
}

- (void)setRouteStepField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x402000u;
  objc_storeStrong((id *)&self->_routeStepField, a3);
}

- (void)_readTransitLineField
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 202) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitLineField_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTransitLineField
{
  -[GEORPFeedbackFieldValue _readTransitLineField]((uint64_t)self);
  return self->_transitLineField != 0;
}

- (GEORPFeedbackTransitLine)transitLineField
{
  -[GEORPFeedbackFieldValue _readTransitLineField]((uint64_t)self);
  return self->_transitLineField;
}

- (void)setTransitLineField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x440000u;
  objc_storeStrong((id *)&self->_transitLineField, a3);
}

- (void)_readPhotoMetadatas
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 201) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoMetadatas_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (NSMutableArray)photoMetadatas
{
  -[GEORPFeedbackFieldValue _readPhotoMetadatas]((uint64_t)self);
  return self->_photoMetadatas;
}

- (void)setPhotoMetadatas:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *photoMetadatas;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
  photoMetadatas = self->_photoMetadatas;
  self->_photoMetadatas = v4;

}

- (void)clearPhotoMetadatas
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
  -[NSMutableArray removeAllObjects](self->_photoMetadatas, "removeAllObjects");
}

- (void)addPhotoMetadata:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackFieldValue _readPhotoMetadatas]((uint64_t)self);
  -[GEORPFeedbackFieldValue _addNoFlagsPhotoMetadata:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
}

- (void)_addNoFlagsPhotoMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)photoMetadatasCount
{
  -[GEORPFeedbackFieldValue _readPhotoMetadatas]((uint64_t)self);
  return -[NSMutableArray count](self->_photoMetadatas, "count");
}

- (id)photoMetadataAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackFieldValue _readPhotoMetadatas]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_photoMetadatas, "objectAtIndex:", a3);
}

+ (Class)photoMetadataType
{
  return (Class)objc_opt_class();
}

- (void)_readAnnotations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 200) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnotations_tags_289);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasAnnotations
{
  -[GEORPFeedbackFieldValue _readAnnotations]((uint64_t)self);
  return self->_annotations != 0;
}

- (GEORPFeedbackFieldAnnotations)annotations
{
  -[GEORPFeedbackFieldValue _readAnnotations]((uint64_t)self);
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400004u;
  objc_storeStrong((id *)&self->_annotations, a3);
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
  v8.super_class = (Class)GEORPFeedbackFieldValue;
  -[GEORPFeedbackFieldValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackFieldValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFieldValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  void *v79;
  id v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  const __CFString *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  const __CFString *v105;
  id v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t j;
  void *v113;
  id v114;
  const __CFString *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 200) & 1) != 0)
  {
    v5 = *(int *)(a1 + 196);
    if (v5 < 0x16 && ((0x3FFEFFu >> v5) & 1) != 0)
    {
      v6 = off_1E1C0E9E0[v5];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 196));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v7 = CFSTR("fieldValueType");
    else
      v7 = CFSTR("field_value_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "singleSelectField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("singleSelectField");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("single_select_field");
    }
    v12 = v10;

    objc_msgSend(v4, "setObject:forKey:", v12, v11);
  }

  objc_msgSend((id)a1, "multiSelectField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("multiSelectField");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("multi_select_field");
    }
    v17 = v15;

    objc_msgSend(v4, "setObject:forKey:", v17, v16);
  }

  objc_msgSend((id)a1, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("textField");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("text_field");
    }
    v22 = v20;

    objc_msgSend(v4, "setObject:forKey:", v22, v21);
  }

  objc_msgSend((id)a1, "textListField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("textListField");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("text_list_field");
    }
    v27 = v25;

    objc_msgSend(v4, "setObject:forKey:", v27, v26);
  }

  objc_msgSend((id)a1, "dateTimeField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("dateTimeField");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("date_time_field");
    }
    v32 = v30;

    objc_msgSend(v4, "setObject:forKey:", v32, v31);
  }

  objc_msgSend((id)a1, "locationField");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("locationField");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("location_field");
    }
    v37 = v35;

    objc_msgSend(v4, "setObject:forKey:", v37, v36);
  }

  objc_msgSend((id)a1, "BOOLeanField");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v38, "jsonRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("BOOLeanField");
    }
    else
    {
      objc_msgSend(v38, "dictionaryRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("BOOLean_field");
    }
    v42 = v40;

    objc_msgSend(v4, "setObject:forKey:", v42, v41);
  }

  objc_msgSend((id)a1, "longField");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v43, "jsonRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("longField");
    }
    else
    {
      objc_msgSend(v43, "dictionaryRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("long_field");
    }
    v47 = v45;

    objc_msgSend(v4, "setObject:forKey:", v47, v46);
  }

  objc_msgSend((id)a1, "ulongField");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v48, "jsonRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = CFSTR("ulongField");
    }
    else
    {
      objc_msgSend(v48, "dictionaryRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = CFSTR("ulong_field");
    }
    v52 = v50;

    objc_msgSend(v4, "setObject:forKey:", v52, v51);
  }

  objc_msgSend((id)a1, "intField");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v53, "jsonRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("intField");
    }
    else
    {
      objc_msgSend(v53, "dictionaryRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("int_field");
    }
    v57 = v55;

    objc_msgSend(v4, "setObject:forKey:", v57, v56);
  }

  objc_msgSend((id)a1, "uintField");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v58, "jsonRepresentation");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("uintField");
    }
    else
    {
      objc_msgSend(v58, "dictionaryRepresentation");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("uint_field");
    }
    v62 = v60;

    objc_msgSend(v4, "setObject:forKey:", v62, v61);
  }

  objc_msgSend((id)a1, "doubleField");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v63)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v63, "jsonRepresentation");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = CFSTR("doubleField");
    }
    else
    {
      objc_msgSend(v63, "dictionaryRepresentation");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = CFSTR("double_field");
    }
    v67 = v65;

    objc_msgSend(v4, "setObject:forKey:", v67, v66);
  }

  objc_msgSend((id)a1, "floatField");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v68, "jsonRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("floatField");
    }
    else
    {
      objc_msgSend(v68, "dictionaryRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("float_field");
    }
    v72 = v70;

    objc_msgSend(v4, "setObject:forKey:", v72, v71);
  }

  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v74 = *(id *)(a1 + 64);
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v126;
      do
      {
        for (i = 0; i != v76; ++i)
        {
          if (*(_QWORD *)v126 != v77)
            objc_enumerationMutation(v74);
          v79 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v79, "jsonRepresentation");
          else
            objc_msgSend(v79, "dictionaryRepresentation");
          v80 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v73, "addObject:", v80);
        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
      }
      while (v76);
    }

    if (a2)
      v81 = CFSTR("hoursField");
    else
      v81 = CFSTR("hours_field");
    objc_msgSend(v4, "setObject:forKey:", v73, v81);

  }
  objc_msgSend((id)a1, "tileFeatureInfoField");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (v82)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v82, "jsonRepresentation");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = CFSTR("tileFeatureInfoField");
    }
    else
    {
      objc_msgSend(v82, "dictionaryRepresentation");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = CFSTR("tile_feature_info_field");
    }
    v86 = v84;

    objc_msgSend(v4, "setObject:forKey:", v86, v85);
  }

  objc_msgSend((id)a1, "amenitiesField");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v87, "jsonRepresentation");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = CFSTR("amenitiesField");
    }
    else
    {
      objc_msgSend(v87, "dictionaryRepresentation");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = CFSTR("amenities_field");
    }
    v91 = v89;

    objc_msgSend(v4, "setObject:forKey:", v91, v90);
  }

  objc_msgSend((id)a1, "ulongListField");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v92;
  if (v92)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v92, "jsonRepresentation");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = CFSTR("ulongListField");
    }
    else
    {
      objc_msgSend(v92, "dictionaryRepresentation");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = CFSTR("ulong_list_field");
    }
    v96 = v94;

    objc_msgSend(v4, "setObject:forKey:", v96, v95);
  }

  objc_msgSend((id)a1, "routeStepField");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97;
  if (v97)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v97, "jsonRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("routeStepField");
    }
    else
    {
      objc_msgSend(v97, "dictionaryRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("route_step_field");
    }
    v101 = v99;

    objc_msgSend(v4, "setObject:forKey:", v101, v100);
  }

  objc_msgSend((id)a1, "transitLineField");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102;
  if (v102)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v102, "jsonRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("transitLineField");
    }
    else
    {
      objc_msgSend(v102, "dictionaryRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("transit_line_field");
    }
    v106 = v104;

    objc_msgSend(v4, "setObject:forKey:", v106, v105);
  }

  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v108 = *(id *)(a1 + 104);
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
    if (v109)
    {
      v110 = v109;
      v111 = *(_QWORD *)v122;
      do
      {
        for (j = 0; j != v110; ++j)
        {
          if (*(_QWORD *)v122 != v111)
            objc_enumerationMutation(v108);
          v113 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v113, "jsonRepresentation");
          else
            objc_msgSend(v113, "dictionaryRepresentation");
          v114 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v107, "addObject:", v114);
        }
        v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
      }
      while (v110);
    }

    if (a2)
      v115 = CFSTR("photoMetadata");
    else
      v115 = CFSTR("photo_metadata");
    objc_msgSend(v4, "setObject:forKey:", v107, v115);

  }
  objc_msgSend((id)a1, "annotations");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v116;
  if (v116)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v116, "jsonRepresentation");
    else
      objc_msgSend(v116, "dictionaryRepresentation");
    v118 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v118, CFSTR("annotations"));
  }

  v119 = v4;
  return v119;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFieldValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackFieldValue)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFieldValue *)-[GEORPFeedbackFieldValue _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEORPFeedbackSingleSelectField *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEORPFeedbackMultiSelectField *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEORPFeedbackTextField *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEORPFeedbackTextListField *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  GEORPFeedbackTimestamp *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEORPFeedbackCoordinateField *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  GEORPFeedbackBooleanField *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEORPFeedbackLongField *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  GEORPFeedbackULongField *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  GEORPFeedbackIntField *v57;
  uint64_t v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  GEORPFeedbackUIntField *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  GEORPFeedbackDoubleField *v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  GEORPFeedbackFloatField *v72;
  uint64_t v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  uint64_t v82;
  GEORPFeedbackBusinessHours *v83;
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  GEORPFeedbackTileFeatureInfo *v88;
  uint64_t v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  GEORPAmenityCorrections *v93;
  uint64_t v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  GEORPFeedbackULongListField *v98;
  uint64_t v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  GEORPFeedbackRouteStep *v103;
  uint64_t v104;
  void *v105;
  const __CFString *v106;
  void *v107;
  GEORPFeedbackTransitLine *v108;
  uint64_t v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t j;
  uint64_t v118;
  GEORPFeedbackPhotoMetadata *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  GEORPFeedbackFieldAnnotations *v123;
  uint64_t v124;
  void *v125;
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_238;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_238;
  if (a3)
    v6 = CFSTR("fieldValueType");
  else
    v6 = CFSTR("field_value_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_FIELD_TYPE")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_SINGLE_SELECT")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_MULTI_SELECT")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_TEXT")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_TEXT_LIST")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_DATE_TIME")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_COORDINATE")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_BOOLEAN")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_LONG")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_ULONG")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_INT")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_UINT")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_DOUBLE")) & 1) != 0)
    {
      v9 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_FLOAT")) & 1) != 0)
    {
      v9 = 14;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_HOURS")) & 1) != 0)
    {
      v9 = 15;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_TILE_FEATURE_INFO")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_AMENITIES")) & 1) != 0)
    {
      v9 = 17;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_ULONG_LIST")) & 1) != 0)
    {
      v9 = 18;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_ROUTE_STEP")) & 1) != 0)
    {
      v9 = 19;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_TRANSIT_LINE")) & 1) != 0)
    {
      v9 = 20;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("FIELD_PHOTOS")))
    {
      v9 = 21;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_53;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_53:
    objc_msgSend(a1, "setFieldValueType:", v9);
  }

  if (a3)
    v10 = CFSTR("singleSelectField");
  else
    v10 = CFSTR("single_select_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEORPFeedbackSingleSelectField alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEORPFeedbackSingleSelectField initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEORPFeedbackSingleSelectField initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setSingleSelectField:", v13);

  }
  if (a3)
    v15 = CFSTR("multiSelectField");
  else
    v15 = CFSTR("multi_select_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [GEORPFeedbackMultiSelectField alloc];
    if ((a3 & 1) != 0)
      v18 = -[GEORPFeedbackMultiSelectField initWithJSON:](v17, "initWithJSON:", v16);
    else
      v18 = -[GEORPFeedbackMultiSelectField initWithDictionary:](v17, "initWithDictionary:", v16);
    v19 = (void *)v18;
    objc_msgSend(a1, "setMultiSelectField:", v18);

  }
  if (a3)
    v20 = CFSTR("textField");
  else
    v20 = CFSTR("text_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEORPFeedbackTextField alloc];
    if ((a3 & 1) != 0)
      v23 = -[GEORPFeedbackTextField initWithJSON:](v22, "initWithJSON:", v21);
    else
      v23 = -[GEORPFeedbackTextField initWithDictionary:](v22, "initWithDictionary:", v21);
    v24 = (void *)v23;
    objc_msgSend(a1, "setTextField:", v23);

  }
  if (a3)
    v25 = CFSTR("textListField");
  else
    v25 = CFSTR("text_list_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEORPFeedbackTextListField alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEORPFeedbackTextListField initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEORPFeedbackTextListField initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setTextListField:", v28);

  }
  if (a3)
    v30 = CFSTR("dateTimeField");
  else
    v30 = CFSTR("date_time_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEORPFeedbackTimestamp alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEORPFeedbackTimestamp initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEORPFeedbackTimestamp initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setDateTimeField:", v33);

  }
  if (a3)
    v35 = CFSTR("locationField");
  else
    v35 = CFSTR("location_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = [GEORPFeedbackCoordinateField alloc];
    if ((a3 & 1) != 0)
      v38 = -[GEORPFeedbackCoordinateField initWithJSON:](v37, "initWithJSON:", v36);
    else
      v38 = -[GEORPFeedbackCoordinateField initWithDictionary:](v37, "initWithDictionary:", v36);
    v39 = (void *)v38;
    objc_msgSend(a1, "setLocationField:", v38);

  }
  if (a3)
    v40 = CFSTR("BOOLeanField");
  else
    v40 = CFSTR("BOOLean_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEORPFeedbackBooleanField alloc];
    if ((a3 & 1) != 0)
      v43 = -[GEORPFeedbackBooleanField initWithJSON:](v42, "initWithJSON:", v41);
    else
      v43 = -[GEORPFeedbackBooleanField initWithDictionary:](v42, "initWithDictionary:", v41);
    v44 = (void *)v43;
    objc_msgSend(a1, "setBooleanField:", v43);

  }
  if (a3)
    v45 = CFSTR("longField");
  else
    v45 = CFSTR("long_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = [GEORPFeedbackLongField alloc];
    if ((a3 & 1) != 0)
      v48 = -[GEORPFeedbackLongField initWithJSON:](v47, "initWithJSON:", v46);
    else
      v48 = -[GEORPFeedbackLongField initWithDictionary:](v47, "initWithDictionary:", v46);
    v49 = (void *)v48;
    objc_msgSend(a1, "setLongField:", v48);

  }
  if (a3)
    v50 = CFSTR("ulongField");
  else
    v50 = CFSTR("ulong_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEORPFeedbackULongField alloc];
    if ((a3 & 1) != 0)
      v53 = -[GEORPFeedbackULongField initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEORPFeedbackULongField initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(a1, "setUlongField:", v53);

  }
  if (a3)
    v55 = CFSTR("intField");
  else
    v55 = CFSTR("int_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = [GEORPFeedbackIntField alloc];
    if ((a3 & 1) != 0)
      v58 = -[GEORPFeedbackIntField initWithJSON:](v57, "initWithJSON:", v56);
    else
      v58 = -[GEORPFeedbackIntField initWithDictionary:](v57, "initWithDictionary:", v56);
    v59 = (void *)v58;
    objc_msgSend(a1, "setIntField:", v58);

  }
  if (a3)
    v60 = CFSTR("uintField");
  else
    v60 = CFSTR("uint_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = [GEORPFeedbackUIntField alloc];
    if ((a3 & 1) != 0)
      v63 = -[GEORPFeedbackUIntField initWithJSON:](v62, "initWithJSON:", v61);
    else
      v63 = -[GEORPFeedbackUIntField initWithDictionary:](v62, "initWithDictionary:", v61);
    v64 = (void *)v63;
    objc_msgSend(a1, "setUintField:", v63);

  }
  if (a3)
    v65 = CFSTR("doubleField");
  else
    v65 = CFSTR("double_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = [GEORPFeedbackDoubleField alloc];
    if ((a3 & 1) != 0)
      v68 = -[GEORPFeedbackDoubleField initWithJSON:](v67, "initWithJSON:", v66);
    else
      v68 = -[GEORPFeedbackDoubleField initWithDictionary:](v67, "initWithDictionary:", v66);
    v69 = (void *)v68;
    objc_msgSend(a1, "setDoubleField:", v68);

  }
  if (a3)
    v70 = CFSTR("floatField");
  else
    v70 = CFSTR("float_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = [GEORPFeedbackFloatField alloc];
    if ((a3 & 1) != 0)
      v73 = -[GEORPFeedbackFloatField initWithJSON:](v72, "initWithJSON:", v71);
    else
      v73 = -[GEORPFeedbackFloatField initWithDictionary:](v72, "initWithDictionary:", v71);
    v74 = (void *)v73;
    objc_msgSend(a1, "setFloatField:", v73);

  }
  if (a3)
    v75 = CFSTR("hoursField");
  else
    v75 = CFSTR("hours_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v127 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v77 = v76;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v132, v137, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v133;
      do
      {
        for (i = 0; i != v79; ++i)
        {
          if (*(_QWORD *)v133 != v80)
            objc_enumerationMutation(v77);
          v82 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v83 = [GEORPFeedbackBusinessHours alloc];
            if ((a3 & 1) != 0)
              v84 = -[GEORPFeedbackBusinessHours initWithJSON:](v83, "initWithJSON:", v82);
            else
              v84 = -[GEORPFeedbackBusinessHours initWithDictionary:](v83, "initWithDictionary:", v82);
            v85 = (void *)v84;
            objc_msgSend(a1, "addHoursField:", v84);

          }
        }
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v132, v137, 16);
      }
      while (v79);
    }

    v5 = v127;
  }

  if (a3)
    v86 = CFSTR("tileFeatureInfoField");
  else
    v86 = CFSTR("tile_feature_info_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = [GEORPFeedbackTileFeatureInfo alloc];
    if ((a3 & 1) != 0)
      v89 = -[GEORPFeedbackTileFeatureInfo initWithJSON:](v88, "initWithJSON:", v87);
    else
      v89 = -[GEORPFeedbackTileFeatureInfo initWithDictionary:](v88, "initWithDictionary:", v87);
    v90 = (void *)v89;
    objc_msgSend(a1, "setTileFeatureInfoField:", v89);

  }
  if (a3)
    v91 = CFSTR("amenitiesField");
  else
    v91 = CFSTR("amenities_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v93 = [GEORPAmenityCorrections alloc];
    if ((a3 & 1) != 0)
      v94 = -[GEORPAmenityCorrections initWithJSON:](v93, "initWithJSON:", v92);
    else
      v94 = -[GEORPAmenityCorrections initWithDictionary:](v93, "initWithDictionary:", v92);
    v95 = (void *)v94;
    objc_msgSend(a1, "setAmenitiesField:", v94);

  }
  if (a3)
    v96 = CFSTR("ulongListField");
  else
    v96 = CFSTR("ulong_list_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v98 = [GEORPFeedbackULongListField alloc];
    if ((a3 & 1) != 0)
      v99 = -[GEORPFeedbackULongListField initWithJSON:](v98, "initWithJSON:", v97);
    else
      v99 = -[GEORPFeedbackULongListField initWithDictionary:](v98, "initWithDictionary:", v97);
    v100 = (void *)v99;
    objc_msgSend(a1, "setUlongListField:", v99);

  }
  if (a3)
    v101 = CFSTR("routeStepField");
  else
    v101 = CFSTR("route_step_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v103 = [GEORPFeedbackRouteStep alloc];
    if ((a3 & 1) != 0)
      v104 = -[GEORPFeedbackRouteStep initWithJSON:](v103, "initWithJSON:", v102);
    else
      v104 = -[GEORPFeedbackRouteStep initWithDictionary:](v103, "initWithDictionary:", v102);
    v105 = (void *)v104;
    objc_msgSend(a1, "setRouteStepField:", v104);

  }
  if (a3)
    v106 = CFSTR("transitLineField");
  else
    v106 = CFSTR("transit_line_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v108 = [GEORPFeedbackTransitLine alloc];
    if ((a3 & 1) != 0)
      v109 = -[GEORPFeedbackTransitLine initWithJSON:](v108, "initWithJSON:", v107);
    else
      v109 = -[GEORPFeedbackTransitLine initWithDictionary:](v108, "initWithDictionary:", v107);
    v110 = (void *)v109;
    objc_msgSend(a1, "setTransitLineField:", v109);

  }
  if (a3)
    v111 = CFSTR("photoMetadata");
  else
    v111 = CFSTR("photo_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v113 = v112;
    v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
    if (v114)
    {
      v115 = v114;
      v116 = *(_QWORD *)v129;
      do
      {
        for (j = 0; j != v115; ++j)
        {
          if (*(_QWORD *)v129 != v116)
            objc_enumerationMutation(v113);
          v118 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v119 = [GEORPFeedbackPhotoMetadata alloc];
            if ((a3 & 1) != 0)
              v120 = -[GEORPFeedbackPhotoMetadata initWithJSON:](v119, "initWithJSON:", v118);
            else
              v120 = -[GEORPFeedbackPhotoMetadata initWithDictionary:](v119, "initWithDictionary:", v118);
            v121 = (void *)v120;
            objc_msgSend(a1, "addPhotoMetadata:", v120);

          }
        }
        v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
      }
      while (v115);
    }

    v5 = v127;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("annotations"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = [GEORPFeedbackFieldAnnotations alloc];
    if ((a3 & 1) != 0)
      v124 = -[GEORPFeedbackFieldAnnotations initWithJSON:](v123, "initWithJSON:", v122);
    else
      v124 = -[GEORPFeedbackFieldAnnotations initWithDictionary:](v123, "initWithDictionary:", v122);
    v125 = (void *)v124;
    objc_msgSend(a1, "setAnnotations:", v124);

  }
  a1 = a1;

LABEL_238:
  return a1;
}

- (GEORPFeedbackFieldValue)initWithJSON:(id)a3
{
  return (GEORPFeedbackFieldValue *)-[GEORPFeedbackFieldValue _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_390;
    else
      v8 = (int *)&readAll__nonRecursiveTag_391;
    GEORPFeedbackFieldValueReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackFieldValueCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFieldValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFieldValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackFieldValueIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackFieldValue readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_singleSelectField)
      PBDataWriterWriteSubmessage();
    if (self->_multiSelectField)
      PBDataWriterWriteSubmessage();
    if (self->_textField)
      PBDataWriterWriteSubmessage();
    if (self->_textListField)
      PBDataWriterWriteSubmessage();
    if (self->_dateTimeField)
      PBDataWriterWriteSubmessage();
    if (self->_locationField)
      PBDataWriterWriteSubmessage();
    if (self->_BOOLeanField)
      PBDataWriterWriteSubmessage();
    if (self->_longField)
      PBDataWriterWriteSubmessage();
    if (self->_ulongField)
      PBDataWriterWriteSubmessage();
    if (self->_intField)
      PBDataWriterWriteSubmessage();
    if (self->_uintField)
      PBDataWriterWriteSubmessage();
    if (self->_doubleField)
      PBDataWriterWriteSubmessage();
    if (self->_floatField)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_hoursFields;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if (self->_tileFeatureInfoField)
      PBDataWriterWriteSubmessage();
    if (self->_amenitiesField)
      PBDataWriterWriteSubmessage();
    if (self->_ulongListField)
      PBDataWriterWriteSubmessage();
    if (self->_routeStepField)
      PBDataWriterWriteSubmessage();
    if (self->_transitLineField)
      PBDataWriterWriteSubmessage();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_photoMetadatas;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_annotations)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackFieldValue _readLocationField]((uint64_t)self);
  return -[GEORPFeedbackCoordinateField hasGreenTeaWithValue:](self->_locationField, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEORPFeedbackFieldValue readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 46) = self->_readerMarkPos;
  *((_DWORD *)v12 + 47) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v12 + 49) = self->_fieldValueType;
    *((_DWORD *)v12 + 50) |= 1u;
  }
  if (self->_singleSelectField)
    objc_msgSend(v12, "setSingleSelectField:");
  if (self->_multiSelectField)
    objc_msgSend(v12, "setMultiSelectField:");
  if (self->_textField)
    objc_msgSend(v12, "setTextField:");
  if (self->_textListField)
    objc_msgSend(v12, "setTextListField:");
  if (self->_dateTimeField)
    objc_msgSend(v12, "setDateTimeField:");
  if (self->_locationField)
    objc_msgSend(v12, "setLocationField:");
  if (self->_BOOLeanField)
    objc_msgSend(v12, "setBooleanField:");
  if (self->_longField)
    objc_msgSend(v12, "setLongField:");
  if (self->_ulongField)
    objc_msgSend(v12, "setUlongField:");
  if (self->_intField)
    objc_msgSend(v12, "setIntField:");
  if (self->_uintField)
    objc_msgSend(v12, "setUintField:");
  if (self->_doubleField)
    objc_msgSend(v12, "setDoubleField:");
  if (self->_floatField)
    objc_msgSend(v12, "setFloatField:");
  if (-[GEORPFeedbackFieldValue hoursFieldsCount](self, "hoursFieldsCount"))
  {
    objc_msgSend(v12, "clearHoursFields");
    v4 = -[GEORPFeedbackFieldValue hoursFieldsCount](self, "hoursFieldsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackFieldValue hoursFieldAtIndex:](self, "hoursFieldAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addHoursField:", v7);

      }
    }
  }
  if (self->_tileFeatureInfoField)
    objc_msgSend(v12, "setTileFeatureInfoField:");
  if (self->_amenitiesField)
    objc_msgSend(v12, "setAmenitiesField:");
  if (self->_ulongListField)
    objc_msgSend(v12, "setUlongListField:");
  if (self->_routeStepField)
    objc_msgSend(v12, "setRouteStepField:");
  if (self->_transitLineField)
    objc_msgSend(v12, "setTransitLineField:");
  if (-[GEORPFeedbackFieldValue photoMetadatasCount](self, "photoMetadatasCount"))
  {
    objc_msgSend(v12, "clearPhotoMetadatas");
    v8 = -[GEORPFeedbackFieldValue photoMetadatasCount](self, "photoMetadatasCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPFeedbackFieldValue photoMetadataAtIndex:](self, "photoMetadataAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addPhotoMetadata:", v11);

      }
    }
  }
  if (self->_annotations)
    objc_msgSend(v12, "setAnnotations:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
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
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  id v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPFeedbackFieldValueReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackFieldValue readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 196) = self->_fieldValueType;
    *(_DWORD *)(v5 + 200) |= 1u;
  }
  v9 = -[GEORPFeedbackSingleSelectField copyWithZone:](self->_singleSelectField, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v9;

  v11 = -[GEORPFeedbackMultiSelectField copyWithZone:](self->_multiSelectField, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v11;

  v13 = -[GEORPFeedbackTextField copyWithZone:](self->_textField, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v13;

  v15 = -[GEORPFeedbackTextListField copyWithZone:](self->_textListField, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v15;

  v17 = -[GEORPFeedbackTimestamp copyWithZone:](self->_dateTimeField, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  v19 = -[GEORPFeedbackCoordinateField copyWithZone:](self->_locationField, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v19;

  v21 = -[GEORPFeedbackBooleanField copyWithZone:](self->_BOOLeanField, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v21;

  v23 = -[GEORPFeedbackLongField copyWithZone:](self->_longField, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v23;

  v25 = -[GEORPFeedbackULongField copyWithZone:](self->_ulongField, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v25;

  v27 = -[GEORPFeedbackIntField copyWithZone:](self->_intField, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v27;

  v29 = -[GEORPFeedbackUIntField copyWithZone:](self->_uintField, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v29;

  v31 = -[GEORPFeedbackDoubleField copyWithZone:](self->_doubleField, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v31;

  v33 = -[GEORPFeedbackFloatField copyWithZone:](self->_floatField, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v33;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v35 = self->_hoursFields;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v62 != v37)
          objc_enumerationMutation(v35);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addHoursField:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v36);
  }

  v40 = -[GEORPFeedbackTileFeatureInfo copyWithZone:](self->_tileFeatureInfoField, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v40;

  v42 = -[GEORPAmenityCorrections copyWithZone:](self->_amenitiesField, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v42;

  v44 = -[GEORPFeedbackULongListField copyWithZone:](self->_ulongListField, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v44;

  v46 = -[GEORPFeedbackRouteStep copyWithZone:](self->_routeStepField, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v46;

  v48 = -[GEORPFeedbackTransitLine copyWithZone:](self->_transitLineField, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v48;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v50 = self->_photoMetadatas;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v58 != v52)
          objc_enumerationMutation(v50);
        v54 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v57);
        objc_msgSend((id)v5, "addPhotoMetadata:", v54);

      }
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v51);
  }

  v55 = -[GEORPFeedbackFieldAnnotations copyWithZone:](self->_annotations, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v55;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  GEORPFeedbackSingleSelectField *singleSelectField;
  GEORPFeedbackMultiSelectField *multiSelectField;
  GEORPFeedbackTextField *textField;
  GEORPFeedbackTextListField *textListField;
  GEORPFeedbackTimestamp *dateTimeField;
  GEORPFeedbackCoordinateField *locationField;
  GEORPFeedbackBooleanField *BOOLeanField;
  GEORPFeedbackLongField *longField;
  GEORPFeedbackULongField *ulongField;
  GEORPFeedbackIntField *intField;
  GEORPFeedbackUIntField *uintField;
  GEORPFeedbackDoubleField *doubleField;
  GEORPFeedbackFloatField *floatField;
  NSMutableArray *hoursFields;
  GEORPFeedbackTileFeatureInfo *tileFeatureInfoField;
  GEORPAmenityCorrections *amenitiesField;
  GEORPFeedbackULongListField *ulongListField;
  GEORPFeedbackRouteStep *routeStepField;
  GEORPFeedbackTransitLine *transitLineField;
  NSMutableArray *photoMetadatas;
  GEORPFeedbackFieldAnnotations *annotations;
  char v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  -[GEORPFeedbackFieldValue readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_fieldValueType != *((_DWORD *)v4 + 49))
      goto LABEL_49;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_49:
    v27 = 0;
    goto LABEL_50;
  }
  singleSelectField = self->_singleSelectField;
  if ((unint64_t)singleSelectField | *((_QWORD *)v4 + 15)
    && !-[GEORPFeedbackSingleSelectField isEqual:](singleSelectField, "isEqual:"))
  {
    goto LABEL_49;
  }
  multiSelectField = self->_multiSelectField;
  if ((unint64_t)multiSelectField | *((_QWORD *)v4 + 12))
  {
    if (!-[GEORPFeedbackMultiSelectField isEqual:](multiSelectField, "isEqual:"))
      goto LABEL_49;
  }
  textField = self->_textField;
  if ((unint64_t)textField | *((_QWORD *)v4 + 16))
  {
    if (!-[GEORPFeedbackTextField isEqual:](textField, "isEqual:"))
      goto LABEL_49;
  }
  textListField = self->_textListField;
  if ((unint64_t)textListField | *((_QWORD *)v4 + 17))
  {
    if (!-[GEORPFeedbackTextListField isEqual:](textListField, "isEqual:"))
      goto LABEL_49;
  }
  dateTimeField = self->_dateTimeField;
  if ((unint64_t)dateTimeField | *((_QWORD *)v4 + 5))
  {
    if (!-[GEORPFeedbackTimestamp isEqual:](dateTimeField, "isEqual:"))
      goto LABEL_49;
  }
  locationField = self->_locationField;
  if ((unint64_t)locationField | *((_QWORD *)v4 + 10))
  {
    if (!-[GEORPFeedbackCoordinateField isEqual:](locationField, "isEqual:"))
      goto LABEL_49;
  }
  BOOLeanField = self->_BOOLeanField;
  if ((unint64_t)BOOLeanField | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPFeedbackBooleanField isEqual:](BOOLeanField, "isEqual:"))
      goto LABEL_49;
  }
  longField = self->_longField;
  if ((unint64_t)longField | *((_QWORD *)v4 + 11))
  {
    if (!-[GEORPFeedbackLongField isEqual:](longField, "isEqual:"))
      goto LABEL_49;
  }
  ulongField = self->_ulongField;
  if ((unint64_t)ulongField | *((_QWORD *)v4 + 21))
  {
    if (!-[GEORPFeedbackULongField isEqual:](ulongField, "isEqual:"))
      goto LABEL_49;
  }
  intField = self->_intField;
  if ((unint64_t)intField | *((_QWORD *)v4 + 9))
  {
    if (!-[GEORPFeedbackIntField isEqual:](intField, "isEqual:"))
      goto LABEL_49;
  }
  uintField = self->_uintField;
  if ((unint64_t)uintField | *((_QWORD *)v4 + 20))
  {
    if (!-[GEORPFeedbackUIntField isEqual:](uintField, "isEqual:"))
      goto LABEL_49;
  }
  doubleField = self->_doubleField;
  if ((unint64_t)doubleField | *((_QWORD *)v4 + 6))
  {
    if (!-[GEORPFeedbackDoubleField isEqual:](doubleField, "isEqual:"))
      goto LABEL_49;
  }
  floatField = self->_floatField;
  if ((unint64_t)floatField | *((_QWORD *)v4 + 7))
  {
    if (!-[GEORPFeedbackFloatField isEqual:](floatField, "isEqual:"))
      goto LABEL_49;
  }
  hoursFields = self->_hoursFields;
  if ((unint64_t)hoursFields | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](hoursFields, "isEqual:"))
      goto LABEL_49;
  }
  tileFeatureInfoField = self->_tileFeatureInfoField;
  if ((unint64_t)tileFeatureInfoField | *((_QWORD *)v4 + 18))
  {
    if (!-[GEORPFeedbackTileFeatureInfo isEqual:](tileFeatureInfoField, "isEqual:"))
      goto LABEL_49;
  }
  amenitiesField = self->_amenitiesField;
  if ((unint64_t)amenitiesField | *((_QWORD *)v4 + 2))
  {
    if (!-[GEORPAmenityCorrections isEqual:](amenitiesField, "isEqual:"))
      goto LABEL_49;
  }
  ulongListField = self->_ulongListField;
  if ((unint64_t)ulongListField | *((_QWORD *)v4 + 22))
  {
    if (!-[GEORPFeedbackULongListField isEqual:](ulongListField, "isEqual:"))
      goto LABEL_49;
  }
  routeStepField = self->_routeStepField;
  if ((unint64_t)routeStepField | *((_QWORD *)v4 + 14))
  {
    if (!-[GEORPFeedbackRouteStep isEqual:](routeStepField, "isEqual:"))
      goto LABEL_49;
  }
  transitLineField = self->_transitLineField;
  if ((unint64_t)transitLineField | *((_QWORD *)v4 + 19))
  {
    if (!-[GEORPFeedbackTransitLine isEqual:](transitLineField, "isEqual:"))
      goto LABEL_49;
  }
  photoMetadatas = self->_photoMetadatas;
  if ((unint64_t)photoMetadatas | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](photoMetadatas, "isEqual:"))
      goto LABEL_49;
  }
  annotations = self->_annotations;
  if ((unint64_t)annotations | *((_QWORD *)v4 + 3))
    v27 = -[GEORPFeedbackFieldAnnotations isEqual:](annotations, "isEqual:");
  else
    v27 = 1;
LABEL_50:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  -[GEORPFeedbackFieldValue readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_fieldValueType;
  else
    v3 = 0;
  v4 = -[GEORPFeedbackSingleSelectField hash](self->_singleSelectField, "hash") ^ v3;
  v5 = -[GEORPFeedbackMultiSelectField hash](self->_multiSelectField, "hash");
  v6 = v4 ^ v5 ^ -[GEORPFeedbackTextField hash](self->_textField, "hash");
  v7 = -[GEORPFeedbackTextListField hash](self->_textListField, "hash");
  v8 = v7 ^ -[GEORPFeedbackTimestamp hash](self->_dateTimeField, "hash");
  v9 = v6 ^ v8 ^ -[GEORPFeedbackCoordinateField hash](self->_locationField, "hash");
  v10 = -[GEORPFeedbackBooleanField hash](self->_BOOLeanField, "hash");
  v11 = v10 ^ -[GEORPFeedbackLongField hash](self->_longField, "hash");
  v12 = v11 ^ -[GEORPFeedbackULongField hash](self->_ulongField, "hash");
  v13 = v9 ^ v12 ^ -[GEORPFeedbackIntField hash](self->_intField, "hash");
  v14 = -[GEORPFeedbackUIntField hash](self->_uintField, "hash");
  v15 = v14 ^ -[GEORPFeedbackDoubleField hash](self->_doubleField, "hash");
  v16 = v15 ^ -[GEORPFeedbackFloatField hash](self->_floatField, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_hoursFields, "hash");
  v18 = v13 ^ v17 ^ -[GEORPFeedbackTileFeatureInfo hash](self->_tileFeatureInfoField, "hash");
  v19 = -[GEORPAmenityCorrections hash](self->_amenitiesField, "hash");
  v20 = v19 ^ -[GEORPFeedbackULongListField hash](self->_ulongListField, "hash");
  v21 = v20 ^ -[GEORPFeedbackRouteStep hash](self->_routeStepField, "hash");
  v22 = v21 ^ -[GEORPFeedbackTransitLine hash](self->_transitLineField, "hash");
  v23 = v22 ^ -[NSMutableArray hash](self->_photoMetadatas, "hash");
  return v18 ^ v23 ^ -[GEORPFeedbackFieldAnnotations hash](self->_annotations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEORPFeedbackSingleSelectField *singleSelectField;
  uint64_t v6;
  GEORPFeedbackMultiSelectField *multiSelectField;
  uint64_t v8;
  GEORPFeedbackTextField *textField;
  uint64_t v10;
  GEORPFeedbackTextListField *textListField;
  uint64_t v12;
  GEORPFeedbackTimestamp *dateTimeField;
  uint64_t v14;
  GEORPFeedbackCoordinateField *locationField;
  uint64_t v16;
  GEORPFeedbackBooleanField *BOOLeanField;
  uint64_t v18;
  GEORPFeedbackLongField *longField;
  uint64_t v20;
  GEORPFeedbackULongField *ulongField;
  uint64_t v22;
  GEORPFeedbackIntField *intField;
  uint64_t v24;
  GEORPFeedbackUIntField *uintField;
  uint64_t v26;
  GEORPFeedbackDoubleField *doubleField;
  uint64_t v28;
  GEORPFeedbackFloatField *floatField;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  GEORPFeedbackTileFeatureInfo *tileFeatureInfoField;
  uint64_t v37;
  GEORPAmenityCorrections *amenitiesField;
  uint64_t v39;
  GEORPFeedbackULongListField *ulongListField;
  uint64_t v41;
  GEORPFeedbackRouteStep *routeStepField;
  uint64_t v43;
  GEORPFeedbackTransitLine *transitLineField;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  GEORPFeedbackFieldAnnotations *annotations;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 200) & 1) != 0)
  {
    self->_fieldValueType = *((_DWORD *)v4 + 49);
    *(_DWORD *)&self->_flags |= 1u;
  }
  singleSelectField = self->_singleSelectField;
  v6 = *((_QWORD *)v4 + 15);
  if (singleSelectField)
  {
    if (v6)
      -[GEORPFeedbackSingleSelectField mergeFrom:](singleSelectField, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPFeedbackFieldValue setSingleSelectField:](self, "setSingleSelectField:");
  }
  multiSelectField = self->_multiSelectField;
  v8 = *((_QWORD *)v4 + 12);
  if (multiSelectField)
  {
    if (v8)
      -[GEORPFeedbackMultiSelectField mergeFrom:](multiSelectField, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEORPFeedbackFieldValue setMultiSelectField:](self, "setMultiSelectField:");
  }
  textField = self->_textField;
  v10 = *((_QWORD *)v4 + 16);
  if (textField)
  {
    if (v10)
      -[GEORPFeedbackTextField mergeFrom:](textField, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEORPFeedbackFieldValue setTextField:](self, "setTextField:");
  }
  textListField = self->_textListField;
  v12 = *((_QWORD *)v4 + 17);
  if (textListField)
  {
    if (v12)
      -[GEORPFeedbackTextListField mergeFrom:](textListField, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEORPFeedbackFieldValue setTextListField:](self, "setTextListField:");
  }
  dateTimeField = self->_dateTimeField;
  v14 = *((_QWORD *)v4 + 5);
  if (dateTimeField)
  {
    if (v14)
      -[GEORPFeedbackTimestamp mergeFrom:](dateTimeField, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEORPFeedbackFieldValue setDateTimeField:](self, "setDateTimeField:");
  }
  locationField = self->_locationField;
  v16 = *((_QWORD *)v4 + 10);
  if (locationField)
  {
    if (v16)
      -[GEORPFeedbackCoordinateField mergeFrom:](locationField, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEORPFeedbackFieldValue setLocationField:](self, "setLocationField:");
  }
  BOOLeanField = self->_BOOLeanField;
  v18 = *((_QWORD *)v4 + 4);
  if (BOOLeanField)
  {
    if (v18)
      -[GEORPFeedbackBooleanField mergeFrom:](BOOLeanField, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEORPFeedbackFieldValue setBooleanField:](self, "setBooleanField:");
  }
  longField = self->_longField;
  v20 = *((_QWORD *)v4 + 11);
  if (longField)
  {
    if (v20)
      -[GEORPFeedbackLongField mergeFrom:](longField, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEORPFeedbackFieldValue setLongField:](self, "setLongField:");
  }
  ulongField = self->_ulongField;
  v22 = *((_QWORD *)v4 + 21);
  if (ulongField)
  {
    if (v22)
      -[GEORPFeedbackULongField mergeFrom:](ulongField, "mergeFrom:");
  }
  else if (v22)
  {
    -[GEORPFeedbackFieldValue setUlongField:](self, "setUlongField:");
  }
  intField = self->_intField;
  v24 = *((_QWORD *)v4 + 9);
  if (intField)
  {
    if (v24)
      -[GEORPFeedbackIntField mergeFrom:](intField, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEORPFeedbackFieldValue setIntField:](self, "setIntField:");
  }
  uintField = self->_uintField;
  v26 = *((_QWORD *)v4 + 20);
  if (uintField)
  {
    if (v26)
      -[GEORPFeedbackUIntField mergeFrom:](uintField, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEORPFeedbackFieldValue setUintField:](self, "setUintField:");
  }
  doubleField = self->_doubleField;
  v28 = *((_QWORD *)v4 + 6);
  if (doubleField)
  {
    if (v28)
      -[GEORPFeedbackDoubleField mergeFrom:](doubleField, "mergeFrom:");
  }
  else if (v28)
  {
    -[GEORPFeedbackFieldValue setDoubleField:](self, "setDoubleField:");
  }
  floatField = self->_floatField;
  v30 = *((_QWORD *)v4 + 7);
  if (floatField)
  {
    if (v30)
      -[GEORPFeedbackFloatField mergeFrom:](floatField, "mergeFrom:");
  }
  else if (v30)
  {
    -[GEORPFeedbackFieldValue setFloatField:](self, "setFloatField:");
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v31 = *((id *)v4 + 8);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(v31);
        -[GEORPFeedbackFieldValue addHoursField:](self, "addHoursField:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v33);
  }

  tileFeatureInfoField = self->_tileFeatureInfoField;
  v37 = *((_QWORD *)v4 + 18);
  if (tileFeatureInfoField)
  {
    if (v37)
      -[GEORPFeedbackTileFeatureInfo mergeFrom:](tileFeatureInfoField, "mergeFrom:");
  }
  else if (v37)
  {
    -[GEORPFeedbackFieldValue setTileFeatureInfoField:](self, "setTileFeatureInfoField:");
  }
  amenitiesField = self->_amenitiesField;
  v39 = *((_QWORD *)v4 + 2);
  if (amenitiesField)
  {
    if (v39)
      -[GEORPAmenityCorrections mergeFrom:](amenitiesField, "mergeFrom:");
  }
  else if (v39)
  {
    -[GEORPFeedbackFieldValue setAmenitiesField:](self, "setAmenitiesField:");
  }
  ulongListField = self->_ulongListField;
  v41 = *((_QWORD *)v4 + 22);
  if (ulongListField)
  {
    if (v41)
      -[GEORPFeedbackULongListField mergeFrom:](ulongListField, "mergeFrom:");
  }
  else if (v41)
  {
    -[GEORPFeedbackFieldValue setUlongListField:](self, "setUlongListField:");
  }
  routeStepField = self->_routeStepField;
  v43 = *((_QWORD *)v4 + 14);
  if (routeStepField)
  {
    if (v43)
      -[GEORPFeedbackRouteStep mergeFrom:](routeStepField, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEORPFeedbackFieldValue setRouteStepField:](self, "setRouteStepField:");
  }
  transitLineField = self->_transitLineField;
  v45 = *((_QWORD *)v4 + 19);
  if (transitLineField)
  {
    if (v45)
      -[GEORPFeedbackTransitLine mergeFrom:](transitLineField, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEORPFeedbackFieldValue setTransitLineField:](self, "setTransitLineField:");
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v46 = *((id *)v4 + 13);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v54 != v49)
          objc_enumerationMutation(v46);
        -[GEORPFeedbackFieldValue addPhotoMetadata:](self, "addPhotoMetadata:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j), (_QWORD)v53);
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v48);
  }

  annotations = self->_annotations;
  v52 = *((_QWORD *)v4 + 3);
  if (annotations)
  {
    if (v52)
      -[GEORPFeedbackFieldAnnotations mergeFrom:](annotations, "mergeFrom:");
  }
  else if (v52)
  {
    -[GEORPFeedbackFieldValue setAnnotations:](self, "setAnnotations:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ulongListField, 0);
  objc_storeStrong((id *)&self->_ulongField, 0);
  objc_storeStrong((id *)&self->_uintField, 0);
  objc_storeStrong((id *)&self->_transitLineField, 0);
  objc_storeStrong((id *)&self->_tileFeatureInfoField, 0);
  objc_storeStrong((id *)&self->_textListField, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_singleSelectField, 0);
  objc_storeStrong((id *)&self->_routeStepField, 0);
  objc_storeStrong((id *)&self->_photoMetadatas, 0);
  objc_storeStrong((id *)&self->_multiSelectField, 0);
  objc_storeStrong((id *)&self->_longField, 0);
  objc_storeStrong((id *)&self->_locationField, 0);
  objc_storeStrong((id *)&self->_intField, 0);
  objc_storeStrong((id *)&self->_hoursFields, 0);
  objc_storeStrong((id *)&self->_floatField, 0);
  objc_storeStrong((id *)&self->_doubleField, 0);
  objc_storeStrong((id *)&self->_dateTimeField, 0);
  objc_storeStrong((id *)&self->_BOOLeanField, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_amenitiesField, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
