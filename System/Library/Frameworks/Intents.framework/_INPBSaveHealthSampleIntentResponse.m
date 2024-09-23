@implementation _INPBSaveHealthSampleIntentResponse

- (void)setDefaultUnit:(id)a3
{
  objc_storeStrong((id *)&self->_defaultUnit, a3);
}

- (BOOL)hasDefaultUnit
{
  return self->_defaultUnit != 0;
}

- (void)setPunchoutUrl:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutUrl, a3);
}

- (BOOL)hasPunchoutUrl
{
  return self->_punchoutUrl != 0;
}

- (void)setRecordDate:(id)a3
{
  objc_storeStrong((id *)&self->_recordDate, a3);
}

- (BOOL)hasRecordDate
{
  return self->_recordDate != 0;
}

- (void)setSampleUuids:(id)a3
{
  NSArray *v4;
  NSArray *sampleUuids;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  sampleUuids = self->_sampleUuids;
  self->_sampleUuids = v4;

}

- (void)clearSampleUuids
{
  -[NSArray removeAllObjects](self->_sampleUuids, "removeAllObjects");
}

- (void)addSampleUuids:(id)a3
{
  id v4;
  NSArray *sampleUuids;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  sampleUuids = self->_sampleUuids;
  v8 = v4;
  if (!sampleUuids)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sampleUuids;
    self->_sampleUuids = v6;

    v4 = v8;
    sampleUuids = self->_sampleUuids;
  }
  -[NSArray addObject:](sampleUuids, "addObject:", v4);

}

- (unint64_t)sampleUuidsCount
{
  return -[NSArray count](self->_sampleUuids, "count");
}

- (id)sampleUuidsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_sampleUuids, "objectAtIndexedSubscript:", a3);
}

- (void)setUserProvidedUnit:(id)a3
{
  objc_storeStrong((id *)&self->_userProvidedUnit, a3);
}

- (BOOL)hasUserProvidedUnit
{
  return self->_userProvidedUnit != 0;
}

- (void)setValuesDefaultUnits:(id)a3
{
  NSArray *v4;
  NSArray *valuesDefaultUnits;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  valuesDefaultUnits = self->_valuesDefaultUnits;
  self->_valuesDefaultUnits = v4;

}

- (void)clearValuesDefaultUnits
{
  -[NSArray removeAllObjects](self->_valuesDefaultUnits, "removeAllObjects");
}

- (void)addValuesDefaultUnit:(id)a3
{
  id v4;
  NSArray *valuesDefaultUnits;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  valuesDefaultUnits = self->_valuesDefaultUnits;
  v8 = v4;
  if (!valuesDefaultUnits)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_valuesDefaultUnits;
    self->_valuesDefaultUnits = v6;

    v4 = v8;
    valuesDefaultUnits = self->_valuesDefaultUnits;
  }
  -[NSArray addObject:](valuesDefaultUnits, "addObject:", v4);

}

- (unint64_t)valuesDefaultUnitsCount
{
  return -[NSArray count](self->_valuesDefaultUnits, "count");
}

- (id)valuesDefaultUnitAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_valuesDefaultUnits, "objectAtIndexedSubscript:", a3);
}

- (void)setValuesUserProvidedUnits:(id)a3
{
  NSArray *v4;
  NSArray *valuesUserProvidedUnits;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  valuesUserProvidedUnits = self->_valuesUserProvidedUnits;
  self->_valuesUserProvidedUnits = v4;

}

- (void)clearValuesUserProvidedUnits
{
  -[NSArray removeAllObjects](self->_valuesUserProvidedUnits, "removeAllObjects");
}

- (void)addValuesUserProvidedUnit:(id)a3
{
  id v4;
  NSArray *valuesUserProvidedUnits;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  valuesUserProvidedUnits = self->_valuesUserProvidedUnits;
  v8 = v4;
  if (!valuesUserProvidedUnits)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_valuesUserProvidedUnits;
    self->_valuesUserProvidedUnits = v6;

    v4 = v8;
    valuesUserProvidedUnits = self->_valuesUserProvidedUnits;
  }
  -[NSArray addObject:](valuesUserProvidedUnits, "addObject:", v4);

}

- (unint64_t)valuesUserProvidedUnitsCount
{
  return -[NSArray count](self->_valuesUserProvidedUnits, "count");
}

- (id)valuesUserProvidedUnitAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_valuesUserProvidedUnits, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSaveHealthSampleIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBSaveHealthSampleIntentResponse defaultUnit](self, "defaultUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSaveHealthSampleIntentResponse defaultUnit](self, "defaultUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSaveHealthSampleIntentResponse punchoutUrl](self, "punchoutUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSaveHealthSampleIntentResponse punchoutUrl](self, "punchoutUrl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSaveHealthSampleIntentResponse recordDate](self, "recordDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBSaveHealthSampleIntentResponse recordDate](self, "recordDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = self->_sampleUuids;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v13);
  }

  -[_INPBSaveHealthSampleIntentResponse userProvidedUnit](self, "userProvidedUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBSaveHealthSampleIntentResponse userProvidedUnit](self, "userProvidedUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = self->_valuesDefaultUnits;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v20);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self->_valuesUserProvidedUnits;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v29;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage();
        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v25);
  }

}

- (_INPBSaveHealthSampleIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSaveHealthSampleIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSaveHealthSampleIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSaveHealthSampleIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSaveHealthSampleIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSaveHealthSampleIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSaveHealthSampleIntentResponse *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v5 = -[_INPBSaveHealthSampleIntentResponse init](+[_INPBSaveHealthSampleIntentResponse allocWithZone:](_INPBSaveHealthSampleIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_defaultUnit, "copyWithZone:", a3);
  -[_INPBSaveHealthSampleIntentResponse setDefaultUnit:](v5, "setDefaultUnit:", v6);

  v7 = -[_INPBString copyWithZone:](self->_punchoutUrl, "copyWithZone:", a3);
  -[_INPBSaveHealthSampleIntentResponse setPunchoutUrl:](v5, "setPunchoutUrl:", v7);

  v8 = -[_INPBDateTimeRange copyWithZone:](self->_recordDate, "copyWithZone:", a3);
  -[_INPBSaveHealthSampleIntentResponse setRecordDate:](v5, "setRecordDate:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_sampleUuids, "copyWithZone:", a3);
  -[_INPBSaveHealthSampleIntentResponse setSampleUuids:](v5, "setSampleUuids:", v9);

  v10 = -[_INPBString copyWithZone:](self->_userProvidedUnit, "copyWithZone:", a3);
  -[_INPBSaveHealthSampleIntentResponse setUserProvidedUnit:](v5, "setUserProvidedUnit:", v10);

  v11 = (void *)-[NSArray copyWithZone:](self->_valuesDefaultUnits, "copyWithZone:", a3);
  -[_INPBSaveHealthSampleIntentResponse setValuesDefaultUnits:](v5, "setValuesDefaultUnits:", v11);

  v12 = (void *)-[NSArray copyWithZone:](self->_valuesUserProvidedUnits, "copyWithZone:", a3);
  -[_INPBSaveHealthSampleIntentResponse setValuesUserProvidedUnits:](v5, "setValuesUserProvidedUnits:", v12);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[_INPBSaveHealthSampleIntentResponse defaultUnit](self, "defaultUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBSaveHealthSampleIntentResponse defaultUnit](self, "defaultUnit");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSaveHealthSampleIntentResponse defaultUnit](self, "defaultUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBSaveHealthSampleIntentResponse punchoutUrl](self, "punchoutUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBSaveHealthSampleIntentResponse punchoutUrl](self, "punchoutUrl");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSaveHealthSampleIntentResponse punchoutUrl](self, "punchoutUrl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutUrl");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBSaveHealthSampleIntentResponse recordDate](self, "recordDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBSaveHealthSampleIntentResponse recordDate](self, "recordDate");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSaveHealthSampleIntentResponse recordDate](self, "recordDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBSaveHealthSampleIntentResponse sampleUuids](self, "sampleUuids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampleUuids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBSaveHealthSampleIntentResponse sampleUuids](self, "sampleUuids");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBSaveHealthSampleIntentResponse sampleUuids](self, "sampleUuids");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampleUuids");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBSaveHealthSampleIntentResponse userProvidedUnit](self, "userProvidedUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userProvidedUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBSaveHealthSampleIntentResponse userProvidedUnit](self, "userProvidedUnit");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBSaveHealthSampleIntentResponse userProvidedUnit](self, "userProvidedUnit");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userProvidedUnit");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBSaveHealthSampleIntentResponse valuesDefaultUnits](self, "valuesDefaultUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuesDefaultUnits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBSaveHealthSampleIntentResponse valuesDefaultUnits](self, "valuesDefaultUnits");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBSaveHealthSampleIntentResponse valuesDefaultUnits](self, "valuesDefaultUnits");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valuesDefaultUnits");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBSaveHealthSampleIntentResponse valuesUserProvidedUnits](self, "valuesUserProvidedUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuesUserProvidedUnits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSaveHealthSampleIntentResponse valuesUserProvidedUnits](self, "valuesUserProvidedUnits");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[_INPBSaveHealthSampleIntentResponse valuesUserProvidedUnits](self, "valuesUserProvidedUnits");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valuesUserProvidedUnits");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if ((v41 & 1) != 0)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v42 = 0;
LABEL_38:

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[_INPBString hash](self->_defaultUnit, "hash");
  v4 = -[_INPBString hash](self->_punchoutUrl, "hash") ^ v3;
  v5 = -[_INPBDateTimeRange hash](self->_recordDate, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_sampleUuids, "hash");
  v7 = -[_INPBString hash](self->_userProvidedUnit, "hash");
  v8 = v7 ^ -[NSArray hash](self->_valuesDefaultUnits, "hash");
  return v6 ^ v8 ^ -[NSArray hash](self->_valuesUserProvidedUnits, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSaveHealthSampleIntentResponse defaultUnit](self, "defaultUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("defaultUnit"));

  -[_INPBSaveHealthSampleIntentResponse punchoutUrl](self, "punchoutUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("punchoutUrl"));

  -[_INPBSaveHealthSampleIntentResponse recordDate](self, "recordDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("recordDate"));

  if (-[NSArray count](self->_sampleUuids, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v11 = self->_sampleUuids;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v43;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v15), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("sampleUuids"));
  }
  -[_INPBSaveHealthSampleIntentResponse userProvidedUnit](self, "userProvidedUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("userProvidedUnit"));

  if (-[NSArray count](self->_valuesDefaultUnits, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v20 = self->_valuesDefaultUnits;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v39;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v24), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("valuesDefaultUnit"));
  }
  if (-[NSArray count](self->_valuesUserProvidedUnits, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = self->_valuesUserProvidedUnits;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v35;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v31), "dictionaryRepresentation", (_QWORD)v34);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

          ++v31;
        }
        while (v29 != v31);
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v29);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("valuesUserProvidedUnit"));
  }
  return v3;
}

- (_INPBString)defaultUnit
{
  return self->_defaultUnit;
}

- (_INPBString)punchoutUrl
{
  return self->_punchoutUrl;
}

- (_INPBDateTimeRange)recordDate
{
  return self->_recordDate;
}

- (NSArray)sampleUuids
{
  return self->_sampleUuids;
}

- (_INPBString)userProvidedUnit
{
  return self->_userProvidedUnit;
}

- (NSArray)valuesDefaultUnits
{
  return self->_valuesDefaultUnits;
}

- (NSArray)valuesUserProvidedUnits
{
  return self->_valuesUserProvidedUnits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesUserProvidedUnits, 0);
  objc_storeStrong((id *)&self->_valuesDefaultUnits, 0);
  objc_storeStrong((id *)&self->_userProvidedUnit, 0);
  objc_storeStrong((id *)&self->_sampleUuids, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
  objc_storeStrong((id *)&self->_punchoutUrl, 0);
  objc_storeStrong((id *)&self->_defaultUnit, 0);
}

+ (Class)sampleUuidsType
{
  return (Class)objc_opt_class();
}

+ (Class)valuesDefaultUnitType
{
  return (Class)objc_opt_class();
}

+ (Class)valuesUserProvidedUnitType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
