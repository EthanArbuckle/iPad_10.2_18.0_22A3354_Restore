@implementation CKDPDistributedTimestampsVersionVector

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPDistributedTimestampsVersionVector;
  -[CKDPDistributedTimestampsVersionVector dealloc](&v3, sel_dealloc);
}

- (unint64_t)clockValuesCount
{
  return self->_clockValues.count;
}

- (unint64_t)clockValues
{
  return self->_clockValues.list;
}

- (void)clearClockValues
{
  PBRepeatedUInt64Clear();
}

- (void)addClockValues:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)clockValuesAtIndex:(unint64_t)a3
{
  uint64_t v3;
  $D9041E0417540B7714261C3B5E8BB314 *p_clockValues;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  p_clockValues = &self->_clockValues;
  count = self->_clockValues.count;
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
  return p_clockValues->list[a3];
}

- (void)setClockValues:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)clockValueLengthsCount
{
  return self->_clockValueLengths.count;
}

- (unint64_t)clockValueLengths
{
  return self->_clockValueLengths.list;
}

- (void)clearClockValueLengths
{
  PBRepeatedUInt64Clear();
}

- (void)addClockValueLengths:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)clockValueLengthsAtIndex:(unint64_t)a3
{
  uint64_t v3;
  $D9041E0417540B7714261C3B5E8BB314 *p_clockValueLengths;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  p_clockValueLengths = &self->_clockValueLengths;
  count = self->_clockValueLengths.count;
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
  return p_clockValueLengths->list[a3];
}

- (void)setClockValueLengths:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)stateValuesCount
{
  return self->_stateValues.count;
}

- (int)stateValues
{
  return self->_stateValues.list;
}

- (void)clearStateValues
{
  PBRepeatedInt32Clear();
}

- (void)addStateValues:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)stateValuesAtIndex:(unint64_t)a3
{
  uint64_t v3;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_stateValues;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  p_stateValues = &self->_stateValues;
  count = self->_stateValues.count;
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
  return p_stateValues->list[a3];
}

- (void)setStateValues:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)stateValuesAsString:(int)a3
{
  uint64_t v3;

  if (a3 < 9)
    return off_1E1F64B78[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStateValues:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("unknown"), v5) & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("regular"), v7) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("regularPresent"), v10) & 1) != 0)
  {
    v8 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("regularTombstoned"), v12) & 1) != 0)
  {
    v8 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("regularMissing"), v14) & 1) != 0)
  {
    v8 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("lwwPerModifier"), v16) & 1) != 0)
  {
    v8 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("lwwPerModifierPresent"), v18) & 1) != 0)
  {
    v8 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("lwwPerModifierTombstoned"), v20) & 1) != 0)
  {
    v8 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v21, (uint64_t)CFSTR("lwwPerModifierMissing"), v22))
  {
    v8 = 8;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)stateValueLengthsCount
{
  return self->_stateValueLengths.count;
}

- (unsigned)stateValueLengths
{
  return self->_stateValueLengths.list;
}

- (void)clearStateValueLengths
{
  PBRepeatedUInt32Clear();
}

- (void)addStateValueLengths:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)stateValueLengthsAtIndex:(unint64_t)a3
{
  uint64_t v3;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_stateValueLengths;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  p_stateValueLengths = &self->_stateValueLengths;
  count = self->_stateValueLengths.count;
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
  return p_stateValueLengths->list[a3];
}

- (void)setStateValueLengths:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
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
  v13.super_class = (Class)CKDPDistributedTimestampsVersionVector;
  -[CKDPDistributedTimestampsVersionVector description](&v13, sel_description);
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
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_stateValues;
  unint64_t count;
  const char *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  const char *v21;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt64NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, (uint64_t)CFSTR("clockValues"));

  PBRepeatedUInt64NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, (uint64_t)CFSTR("clockValueLengths"));

  p_stateValues = &self->_stateValues;
  count = self->_stateValues.count;
  if (count)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v10, count, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_stateValues.count)
    {
      v17 = 0;
      do
      {
        v18 = p_stateValues->list[v17];
        if (v18 >= 9)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("(unknown: %i)"), v15, p_stateValues->list[v17]);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E1F64B78[v18];
        }
        objc_msgSend_addObject_(v16, v14, (uint64_t)v19, v15);

        ++v17;
      }
      while (v17 < self->_stateValues.count);
    }
    objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v16, (uint64_t)CFSTR("stateValues"));

  }
  PBRepeatedUInt32NSArray();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v21, (uint64_t)v20, (uint64_t)CFSTR("stateValueLengths"));

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDistributedTimestampsVersionVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_stateValueLengths;
  unint64_t v9;

  v4 = a3;
  if (self->_clockValues.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clockValues.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v5;
      }
      while (v5 < self->_clockValues.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_clockValueLengths.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clockValueLengths.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_clockValueLengths.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_stateValues.count)
  {
    PBDataWriterPlaceMark();
    if (self->_stateValues.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_stateValues.count);
    }
    PBDataWriterRecallMark();
  }
  p_stateValueLengths = &self->_stateValueLengths;
  if (p_stateValueLengths->count)
  {
    PBDataWriterPlaceMark();
    if (p_stateValueLengths->count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < p_stateValueLengths->count);
    }
    PBDataWriterRecallMark();
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  id v57;

  v57 = a3;
  if (objc_msgSend_clockValuesCount(self, v4, v5, v6))
  {
    objc_msgSend_clearClockValues(v57, v7, v8, v9);
    v13 = objc_msgSend_clockValuesCount(self, v10, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        v16 = objc_msgSend_clockValuesAtIndex_(self, v7, i, v9);
        objc_msgSend_addClockValues_(v57, v17, v16, v18);
      }
    }
  }
  if (objc_msgSend_clockValueLengthsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearClockValueLengths(v57, v19, v20, v21);
    v25 = objc_msgSend_clockValueLengthsCount(self, v22, v23, v24);
    if (v25)
    {
      v26 = v25;
      for (j = 0; j != v26; ++j)
      {
        v28 = objc_msgSend_clockValueLengthsAtIndex_(self, v19, j, v21);
        objc_msgSend_addClockValueLengths_(v57, v29, v28, v30);
      }
    }
  }
  if (objc_msgSend_stateValuesCount(self, v19, v20, v21))
  {
    objc_msgSend_clearStateValues(v57, v31, v32, v33);
    v37 = objc_msgSend_stateValuesCount(self, v34, v35, v36);
    if (v37)
    {
      v38 = v37;
      for (k = 0; k != v38; ++k)
      {
        v40 = objc_msgSend_stateValuesAtIndex_(self, v31, k, v33);
        objc_msgSend_addStateValues_(v57, v41, v40, v42);
      }
    }
  }
  if (objc_msgSend_stateValueLengthsCount(self, v31, v32, v33))
  {
    objc_msgSend_clearStateValueLengths(v57, v43, v44, v45);
    v49 = objc_msgSend_stateValueLengthsCount(self, v46, v47, v48);
    if (v49)
    {
      v52 = v49;
      for (m = 0; m != v52; ++m)
      {
        v54 = objc_msgSend_stateValueLengthsAtIndex_(self, v50, m, v51);
        objc_msgSend_addStateValueLengths_(v57, v55, v54, v56);
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3, v6);
  v11 = (void *)objc_msgSend_init(v7, v8, v9, v10);
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  char IsEqual;

  v3 = a3;
  v4 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v3, v5, v4, v6)
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedInt32IsEqual())
  {
    IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = PBRepeatedUInt64Hash();
  v3 = PBRepeatedUInt64Hash() ^ v2;
  v4 = PBRepeatedInt32Hash();
  return v3 ^ v4 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  id v42;

  v42 = a3;
  v7 = objc_msgSend_clockValuesCount(v42, v4, v5, v6);
  if (v7)
  {
    v11 = v7;
    for (i = 0; i != v11; ++i)
    {
      v13 = objc_msgSend_clockValuesAtIndex_(v42, v8, i, v10);
      objc_msgSend_addClockValues_(self, v14, v13, v15);
    }
  }
  v16 = objc_msgSend_clockValueLengthsCount(v42, v8, v9, v10);
  if (v16)
  {
    v20 = v16;
    for (j = 0; j != v20; ++j)
    {
      v22 = objc_msgSend_clockValueLengthsAtIndex_(v42, v17, j, v19);
      objc_msgSend_addClockValueLengths_(self, v23, v22, v24);
    }
  }
  v25 = objc_msgSend_stateValuesCount(v42, v17, v18, v19);
  if (v25)
  {
    v29 = v25;
    for (k = 0; k != v29; ++k)
    {
      v31 = objc_msgSend_stateValuesAtIndex_(v42, v26, k, v28);
      objc_msgSend_addStateValues_(self, v32, v31, v33);
    }
  }
  v34 = objc_msgSend_stateValueLengthsCount(v42, v26, v27, v28);
  if (v34)
  {
    v37 = v34;
    for (m = 0; m != v37; ++m)
    {
      v39 = objc_msgSend_stateValueLengthsAtIndex_(v42, v35, m, v36);
      objc_msgSend_addStateValueLengths_(self, v40, v39, v41);
    }
  }

}

@end
