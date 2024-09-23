@implementation CKDPRecordFieldValueEncryptedValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_stringListValues, 0);
  objc_storeStrong((id *)&self->_referenceValue, 0);
  objc_storeStrong((id *)&self->_locationValue, 0);
  objc_storeStrong((id *)&self->_locationListValues, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dateListValues, 0);
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordFieldValueEncryptedValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  NSMutableArray *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  NSMutableArray *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  const char *v21;
  NSMutableArray *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  const char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_dateValue)
    PBDataWriterWriteSubmessage();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  if (self->_locationValue)
    PBDataWriterWriteSubmessage();
  if (self->_referenceValue)
    PBDataWriterWriteSubmessage();
  if (self->_signedListValues.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v6;
    }
    while (v6 < self->_signedListValues.count);
  }
  if (self->_doubleListValues.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v7;
    }
    while (v7 < self->_doubleListValues.count);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = self->_dateListValues;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v37, (uint64_t)v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v37, (uint64_t)v43, 16);
    }
    while (v11);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = self->_stringListValues;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v33, (uint64_t)v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v21, (uint64_t)&v33, (uint64_t)v42, 16);
    }
    while (v18);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = self->_locationListValues;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v29, (uint64_t)v41, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage();
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v28, (uint64_t)&v29, (uint64_t)v41, 16);
    }
    while (v25);
  }

}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPRecordFieldValueEncryptedValue;
  -[CKDPRecordFieldValueEncryptedValue dealloc](&v3, sel_dealloc);
}

- (NSMutableArray)stringListValues
{
  return self->_stringListValues;
}

- (CKDPDate)dateValue
{
  return self->_dateValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (void)addStringListValue:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSMutableArray *stringListValues;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  stringListValues = self->_stringListValues;
  v9 = (char *)v4;
  if (!stringListValues)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_stringListValues;
    self->_stringListValues = v7;

    v4 = v9;
    stringListValues = self->_stringListValues;
  }
  objc_msgSend_addObject_(stringListValues, v4, (uint64_t)v4, v5);

}

- (void)setStringListValues:(id)a3
{
  objc_storeStrong((id *)&self->_stringListValues, a3);
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
}

- (void)setSignedValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_signedValue = a3;
}

- (void)setHasSignedValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignedValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCkDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ckDoubleValue = a3;
}

- (void)setHasCkDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCkDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasLocationValue
{
  return self->_locationValue != 0;
}

- (BOOL)hasReferenceValue
{
  return self->_referenceValue != 0;
}

- (unint64_t)signedListValuesCount
{
  return self->_signedListValues.count;
}

- (int64_t)signedListValues
{
  return self->_signedListValues.list;
}

- (void)clearSignedListValues
{
  PBRepeatedInt64Clear();
}

- (void)addSignedListValue:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)signedListValueAtIndex:(unint64_t)a3
{
  uint64_t v3;
  $A58966F474337DCABE012981F76706F5 *p_signedListValues;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  p_signedListValues = &self->_signedListValues;
  count = self->_signedListValues.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), v3, a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, (uint64_t)v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v11, v12, v13, v14);

  }
  return p_signedListValues->list[a3];
}

- (void)setSignedListValues:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)doubleListValuesCount
{
  return self->_doubleListValues.count;
}

- (double)doubleListValues
{
  return self->_doubleListValues.list;
}

- (void)clearDoubleListValues
{
  PBRepeatedDoubleClear();
}

- (void)addDoubleListValue:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)doubleListValueAtIndex:(unint64_t)a3
{
  uint64_t v3;
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_doubleListValues;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  p_doubleListValues = &self->_doubleListValues;
  count = self->_doubleListValues.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), v3, a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, (uint64_t)v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v11, v12, v13, v14);

  }
  return p_doubleListValues->list[a3];
}

- (void)setDoubleListValues:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (void)clearDateListValues
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_removeAllObjects(self->_dateListValues, a2, v2, v3);
}

- (void)addDateListValue:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSMutableArray *dateListValues;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  dateListValues = self->_dateListValues;
  v9 = (char *)v4;
  if (!dateListValues)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_dateListValues;
    self->_dateListValues = v7;

    v4 = v9;
    dateListValues = self->_dateListValues;
  }
  objc_msgSend_addObject_(dateListValues, v4, (uint64_t)v4, v5);

}

- (unint64_t)dateListValuesCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_dateListValues, a2, v2, v3);
}

- (id)dateListValueAtIndex:(unint64_t)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectAtIndex_(self->_dateListValues, a2, a3, v3);
}

+ (Class)dateListValueType
{
  return (Class)objc_opt_class();
}

- (void)clearStringListValues
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_removeAllObjects(self->_stringListValues, a2, v2, v3);
}

- (unint64_t)stringListValuesCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_stringListValues, a2, v2, v3);
}

- (id)stringListValueAtIndex:(unint64_t)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectAtIndex_(self->_stringListValues, a2, a3, v3);
}

+ (Class)stringListValueType
{
  return (Class)objc_opt_class();
}

- (void)clearLocationListValues
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_removeAllObjects(self->_locationListValues, a2, v2, v3);
}

- (void)addLocationListValue:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSMutableArray *locationListValues;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  locationListValues = self->_locationListValues;
  v9 = (char *)v4;
  if (!locationListValues)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_locationListValues;
    self->_locationListValues = v7;

    v4 = v9;
    locationListValues = self->_locationListValues;
  }
  objc_msgSend_addObject_(locationListValues, v4, (uint64_t)v4, v5);

}

- (unint64_t)locationListValuesCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_locationListValues, a2, v2, v3);
}

- (id)locationListValueAtIndex:(unint64_t)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectAtIndex_(self->_locationListValues, a2, a3, v3);
}

+ (Class)locationListValueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKDPRecordFieldValueEncryptedValue;
  -[CKDPRecordFieldValueEncryptedValue description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  CKDPDate *dateValue;
  void *v15;
  const char *v16;
  NSString *stringValue;
  CKDPLocationCoordinate *locationValue;
  void *v19;
  const char *v20;
  CKDPRecordReference *referenceValue;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  NSMutableArray *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  NSMutableArray *stringListValues;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  NSMutableArray *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v5, self->_signedValue, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, (uint64_t)CFSTR("signedValue"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, self->_ckDoubleValue);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, (uint64_t)CFSTR("ckDoubleValue"));

  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    objc_msgSend_dictionaryRepresentation(dateValue, v5, v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v16, (uint64_t)v15, (uint64_t)CFSTR("dateValue"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setObject_forKey_(v8, v5, (uint64_t)stringValue, (uint64_t)CFSTR("stringValue"));
  locationValue = self->_locationValue;
  if (locationValue)
  {
    objc_msgSend_dictionaryRepresentation(locationValue, v5, (uint64_t)stringValue, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v19, (uint64_t)CFSTR("locationValue"));

  }
  referenceValue = self->_referenceValue;
  if (referenceValue)
  {
    objc_msgSend_dictionaryRepresentation(referenceValue, v5, (uint64_t)stringValue, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v23, (uint64_t)v22, (uint64_t)CFSTR("referenceValue"));

  }
  PBRepeatedInt64NSArray();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v25, (uint64_t)v24, (uint64_t)CFSTR("signedListValue"));

  PBRepeatedDoubleNSArray();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v27, (uint64_t)v26, (uint64_t)CFSTR("doubleListValue"));

  if (objc_msgSend_count(self->_dateListValues, v28, v29, v30))
  {
    v33 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v37 = objc_msgSend_count(self->_dateListValues, v34, v35, v36);
    v40 = (void *)objc_msgSend_initWithCapacity_(v33, v38, v37, v39);
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v41 = self->_dateListValues;
    v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v81, (uint64_t)v86, 16);
    if (v43)
    {
      v47 = v43;
      v48 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v82 != v48)
            objc_enumerationMutation(v41);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v81 + 1) + 8 * i), v44, v45, v46);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v40, v51, (uint64_t)v50, v52);

        }
        v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v81, (uint64_t)v86, 16);
      }
      while (v47);
    }

    objc_msgSend_setObject_forKey_(v8, v53, (uint64_t)v40, (uint64_t)CFSTR("dateListValue"));
  }
  stringListValues = self->_stringListValues;
  if (stringListValues)
    objc_msgSend_setObject_forKey_(v8, v31, (uint64_t)stringListValues, (uint64_t)CFSTR("stringListValue"));
  if (objc_msgSend_count(self->_locationListValues, v31, (uint64_t)stringListValues, v32))
  {
    v55 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v59 = objc_msgSend_count(self->_locationListValues, v56, v57, v58);
    v62 = (void *)objc_msgSend_initWithCapacity_(v55, v60, v59, v61);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v63 = self->_locationListValues;
    v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v77, (uint64_t)v85, 16);
    if (v65)
    {
      v69 = v65;
      v70 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(_QWORD *)v78 != v70)
            objc_enumerationMutation(v63);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v77 + 1) + 8 * j), v66, v67, v68, (_QWORD)v77);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v62, v73, (uint64_t)v72, v74);

        }
        v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v77, (uint64_t)v85, 16);
      }
      while (v69);
    }

    objc_msgSend_setObject_forKey_(v8, v75, (uint64_t)v62, (uint64_t)CFSTR("locationListValue"));
  }
  return v8;
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  char has;
  CKDPDate *dateValue;
  NSString *stringValue;
  CKDPLocationCoordinate *locationValue;
  CKDPRecordReference *referenceValue;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  void *v71;
  const char *v72;
  uint64_t v73;
  id v74;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_signedValue;
    *((_BYTE *)v4 + 128) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[7] = *(_QWORD *)&self->_ckDoubleValue;
    *((_BYTE *)v4 + 128) |= 1u;
  }
  dateValue = self->_dateValue;
  v74 = v4;
  if (dateValue)
    objc_msgSend_setDateValue_(v4, v5, (uint64_t)dateValue, v6);
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setStringValue_(v74, v5, (uint64_t)stringValue, v6);
  locationValue = self->_locationValue;
  if (locationValue)
    objc_msgSend_setLocationValue_(v74, v5, (uint64_t)locationValue, v6);
  referenceValue = self->_referenceValue;
  if (referenceValue)
    objc_msgSend_setReferenceValue_(v74, v5, (uint64_t)referenceValue, v6);
  if (objc_msgSend_signedListValuesCount(self, v5, (uint64_t)referenceValue, v6))
  {
    objc_msgSend_clearSignedListValues(v74, v12, v13, v14);
    v18 = objc_msgSend_signedListValuesCount(self, v15, v16, v17);
    if (v18)
    {
      v19 = v18;
      for (i = 0; i != v19; ++i)
      {
        v21 = objc_msgSend_signedListValueAtIndex_(self, v12, i, v14);
        objc_msgSend_addSignedListValue_(v74, v22, v21, v23);
      }
    }
  }
  if (objc_msgSend_doubleListValuesCount(self, v12, v13, v14))
  {
    objc_msgSend_clearDoubleListValues(v74, v24, v25, v26);
    v30 = objc_msgSend_doubleListValuesCount(self, v27, v28, v29);
    if (v30)
    {
      v31 = v30;
      for (j = 0; j != v31; ++j)
      {
        objc_msgSend_doubleListValueAtIndex_(self, v24, j, v26);
        objc_msgSend_addDoubleListValue_(v74, v33, v34, v35);
      }
    }
  }
  if (objc_msgSend_dateListValuesCount(self, v24, v25, v26))
  {
    objc_msgSend_clearDateListValues(v74, v36, v37, v38);
    v42 = objc_msgSend_dateListValuesCount(self, v39, v40, v41);
    if (v42)
    {
      v43 = v42;
      for (k = 0; k != v43; ++k)
      {
        objc_msgSend_dateListValueAtIndex_(self, v36, k, v38);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addDateListValue_(v74, v46, (uint64_t)v45, v47);

      }
    }
  }
  if (objc_msgSend_stringListValuesCount(self, v36, v37, v38))
  {
    objc_msgSend_clearStringListValues(v74, v48, v49, v50);
    v54 = objc_msgSend_stringListValuesCount(self, v51, v52, v53);
    if (v54)
    {
      v55 = v54;
      for (m = 0; m != v55; ++m)
      {
        objc_msgSend_stringListValueAtIndex_(self, v48, m, v50);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addStringListValue_(v74, v58, (uint64_t)v57, v59);

      }
    }
  }
  if (objc_msgSend_locationListValuesCount(self, v48, v49, v50))
  {
    objc_msgSend_clearLocationListValues(v74, v60, v61, v62);
    v66 = objc_msgSend_locationListValuesCount(self, v63, v64, v65);
    if (v66)
    {
      v69 = v66;
      for (n = 0; n != v69; ++n)
      {
        objc_msgSend_locationListValueAtIndex_(self, v67, n, v68);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addLocationListValue_(v74, v72, (uint64_t)v71, v73);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  char has;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  const char *v40;
  uint64_t v41;
  NSMutableArray *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  const char *v51;
  uint64_t v52;
  NSMutableArray *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  void *v61;
  const char *v62;
  uint64_t v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v12 + 64) = self->_signedValue;
    *(_BYTE *)(v12 + 128) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v12 + 56) = self->_ckDoubleValue;
    *(_BYTE *)(v12 + 128) |= 1u;
  }
  v17 = objc_msgSend_copyWithZone_(self->_dateValue, v13, (uint64_t)a3, v14);
  v18 = (void *)v15[10];
  v15[10] = v17;

  v21 = objc_msgSend_copyWithZone_(self->_stringValue, v19, (uint64_t)a3, v20);
  v22 = (void *)v15[15];
  v15[15] = v21;

  v25 = objc_msgSend_copyWithZone_(self->_locationValue, v23, (uint64_t)a3, v24);
  v26 = (void *)v15[12];
  v15[12] = v25;

  v29 = objc_msgSend_copyWithZone_(self->_referenceValue, v27, (uint64_t)a3, v28);
  v30 = (void *)v15[13];
  v15[13] = v29;

  PBRepeatedInt64Copy();
  PBRepeatedDoubleCopy();
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v31 = self->_dateListValues;
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v73, (uint64_t)v79, 16);
  if (v33)
  {
    v36 = v33;
    v37 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v74 != v37)
          objc_enumerationMutation(v31);
        v39 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v73 + 1) + 8 * i), v34, (uint64_t)a3, v35);
        objc_msgSend_addDateListValue_(v15, v40, (uint64_t)v39, v41);

      }
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v73, (uint64_t)v79, 16);
    }
    while (v36);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v42 = self->_stringListValues;
  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v69, (uint64_t)v78, 16);
  if (v44)
  {
    v47 = v44;
    v48 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v70 != v48)
          objc_enumerationMutation(v42);
        v50 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v69 + 1) + 8 * j), v45, (uint64_t)a3, v46);
        objc_msgSend_addStringListValue_(v15, v51, (uint64_t)v50, v52);

      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v69, (uint64_t)v78, 16);
    }
    while (v47);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v53 = self->_locationListValues;
  v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v65, (uint64_t)v77, 16);
  if (v55)
  {
    v58 = v55;
    v59 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v58; ++k)
      {
        if (*(_QWORD *)v66 != v59)
          objc_enumerationMutation(v53);
        v61 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v65 + 1) + 8 * k), v56, (uint64_t)a3, v57, (_QWORD)v65);
        objc_msgSend_addLocationListValue_(v15, v62, (uint64_t)v61, v63);

      }
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v65, (uint64_t)v77, 16);
    }
    while (v58);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKDPDate *dateValue;
  uint64_t v11;
  NSString *stringValue;
  uint64_t v13;
  CKDPLocationCoordinate *locationValue;
  uint64_t v15;
  CKDPRecordReference *referenceValue;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSMutableArray *dateListValues;
  uint64_t v21;
  NSMutableArray *stringListValues;
  uint64_t v23;
  NSMutableArray *locationListValues;
  uint64_t v25;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[16] & 2) == 0 || self->_signedValue != v4[8])
      goto LABEL_28;
  }
  else if ((v4[16] & 2) != 0)
  {
LABEL_28:
    isEqual = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[16] & 1) == 0 || self->_ckDoubleValue != *((double *)v4 + 7))
      goto LABEL_28;
  }
  else if ((v4[16] & 1) != 0)
  {
    goto LABEL_28;
  }
  dateValue = self->_dateValue;
  v11 = v4[10];
  if ((unint64_t)dateValue | v11 && !objc_msgSend_isEqual_(dateValue, v8, v11, v9))
    goto LABEL_28;
  stringValue = self->_stringValue;
  v13 = v4[15];
  if ((unint64_t)stringValue | v13)
  {
    if (!objc_msgSend_isEqual_(stringValue, v8, v13, v9))
      goto LABEL_28;
  }
  locationValue = self->_locationValue;
  v15 = v4[12];
  if ((unint64_t)locationValue | v15)
  {
    if (!objc_msgSend_isEqual_(locationValue, v8, v15, v9))
      goto LABEL_28;
  }
  referenceValue = self->_referenceValue;
  v17 = v4[13];
  if ((unint64_t)referenceValue | v17)
  {
    if (!objc_msgSend_isEqual_(referenceValue, v8, v17, v9))
      goto LABEL_28;
  }
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_28;
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_28;
  dateListValues = self->_dateListValues;
  v21 = v4[9];
  if ((unint64_t)dateListValues | v21)
  {
    if (!objc_msgSend_isEqual_(dateListValues, v18, v21, v19))
      goto LABEL_28;
  }
  stringListValues = self->_stringListValues;
  v23 = v4[14];
  if ((unint64_t)stringListValues | v23)
  {
    if (!objc_msgSend_isEqual_(stringListValues, v18, v23, v19))
      goto LABEL_28;
  }
  locationListValues = self->_locationListValues;
  v25 = v4[11];
  if ((unint64_t)locationListValues | v25)
    isEqual = objc_msgSend_isEqual_(locationListValues, v18, v25, v19);
  else
    isEqual = 1;
LABEL_29:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  double ckDoubleValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_signedValue;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  ckDoubleValue = self->_ckDoubleValue;
  v7 = -ckDoubleValue;
  if (ckDoubleValue >= 0.0)
    v7 = self->_ckDoubleValue;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  v11 = v10 ^ v5 ^ objc_msgSend_hash(self->_dateValue, a2, v2, v3);
  v15 = objc_msgSend_hash(self->_stringValue, v12, v13, v14);
  v19 = v11 ^ v15 ^ objc_msgSend_hash(self->_locationValue, v16, v17, v18);
  v23 = objc_msgSend_hash(self->_referenceValue, v20, v21, v22);
  v24 = v23 ^ PBRepeatedInt64Hash();
  v25 = v19 ^ v24 ^ PBRepeatedDoubleHash();
  v29 = objc_msgSend_hash(self->_dateListValues, v26, v27, v28);
  v33 = v29 ^ objc_msgSend_hash(self->_stringListValues, v30, v31, v32);
  return v25 ^ v33 ^ objc_msgSend_hash(self->_locationListValues, v34, v35, v36);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  char v8;
  CKDPDate *dateValue;
  uint64_t v10;
  uint64_t v11;
  CKDPLocationCoordinate *locationValue;
  uint64_t v13;
  CKDPRecordReference *referenceValue;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  id v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = v4;
  v8 = *((_BYTE *)v4 + 128);
  if ((v8 & 2) != 0)
  {
    self->_signedValue = *((_QWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v4 + 128);
  }
  if ((v8 & 1) != 0)
  {
    self->_ckDoubleValue = *((double *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
  }
  dateValue = self->_dateValue;
  v10 = *((_QWORD *)v7 + 10);
  if (dateValue)
  {
    if (v10)
      objc_msgSend_mergeFrom_(dateValue, v5, v10, v6);
  }
  else if (v10)
  {
    objc_msgSend_setDateValue_(self, v5, v10, v6);
  }
  v11 = *((_QWORD *)v7 + 15);
  if (v11)
    objc_msgSend_setStringValue_(self, v5, v11, v6);
  locationValue = self->_locationValue;
  v13 = *((_QWORD *)v7 + 12);
  if (locationValue)
  {
    if (v13)
      objc_msgSend_mergeFrom_(locationValue, v5, v13, v6);
  }
  else if (v13)
  {
    objc_msgSend_setLocationValue_(self, v5, v13, v6);
  }
  referenceValue = self->_referenceValue;
  v15 = *((_QWORD *)v7 + 13);
  if (referenceValue)
  {
    if (v15)
      objc_msgSend_mergeFrom_(referenceValue, v5, v15, v6);
  }
  else if (v15)
  {
    objc_msgSend_setReferenceValue_(self, v5, v15, v6);
  }
  v16 = objc_msgSend_signedListValuesCount(v7, v5, v15, v6);
  if (v16)
  {
    v20 = v16;
    for (i = 0; i != v20; ++i)
    {
      v22 = objc_msgSend_signedListValueAtIndex_(v7, v17, i, v19);
      objc_msgSend_addSignedListValue_(self, v23, v22, v24);
    }
  }
  v25 = objc_msgSend_doubleListValuesCount(v7, v17, v18, v19);
  if (v25)
  {
    v28 = v25;
    for (j = 0; j != v28; ++j)
    {
      objc_msgSend_doubleListValueAtIndex_(v7, v26, j, v27);
      objc_msgSend_addDoubleListValue_(self, v30, v31, v32);
    }
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v33 = *((id *)v7 + 9);
  v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v65, (uint64_t)v71, 16);
  if (v35)
  {
    v38 = v35;
    v39 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v66 != v39)
          objc_enumerationMutation(v33);
        objc_msgSend_addDateListValue_(self, v36, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k), v37);
      }
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v65, (uint64_t)v71, 16);
    }
    while (v38);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v41 = *((id *)v7 + 14);
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v61, (uint64_t)v70, 16);
  if (v43)
  {
    v46 = v43;
    v47 = *(_QWORD *)v62;
    do
    {
      for (m = 0; m != v46; ++m)
      {
        if (*(_QWORD *)v62 != v47)
          objc_enumerationMutation(v41);
        objc_msgSend_addStringListValue_(self, v44, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * m), v45);
      }
      v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v61, (uint64_t)v70, 16);
    }
    while (v46);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v49 = *((id *)v7 + 11);
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v57, (uint64_t)v69, 16);
  if (v51)
  {
    v54 = v51;
    v55 = *(_QWORD *)v58;
    do
    {
      for (n = 0; n != v54; ++n)
      {
        if (*(_QWORD *)v58 != v55)
          objc_enumerationMutation(v49);
        objc_msgSend_addLocationListValue_(self, v52, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * n), v53, (_QWORD)v57);
      }
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v57, (uint64_t)v69, 16);
    }
    while (v54);
  }

}

- (int64_t)signedValue
{
  return self->_signedValue;
}

- (double)ckDoubleValue
{
  return self->_ckDoubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (CKDPLocationCoordinate)locationValue
{
  return self->_locationValue;
}

- (void)setLocationValue:(id)a3
{
  objc_storeStrong((id *)&self->_locationValue, a3);
}

- (CKDPRecordReference)referenceValue
{
  return self->_referenceValue;
}

- (void)setReferenceValue:(id)a3
{
  objc_storeStrong((id *)&self->_referenceValue, a3);
}

- (NSMutableArray)dateListValues
{
  return self->_dateListValues;
}

- (void)setDateListValues:(id)a3
{
  objc_storeStrong((id *)&self->_dateListValues, a3);
}

- (NSMutableArray)locationListValues
{
  return self->_locationListValues;
}

- (void)setLocationListValues:(id)a3
{
  objc_storeStrong((id *)&self->_locationListValues, a3);
}

@end
