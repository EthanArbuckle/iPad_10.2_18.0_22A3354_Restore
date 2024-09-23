@implementation _INPBWellnessObjectResultValue

- (void)setRecordDate:(id)a3
{
  objc_storeStrong((id *)&self->_recordDate, a3);
}

- (BOOL)hasRecordDate
{
  return self->_recordDate != 0;
}

- (void)setResultType:(int)a3
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
    self->_resultType = a3;
  }
}

- (BOOL)hasResultType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResultType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)resultTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E228FD18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResultType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_RESULT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAW")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AVERAGE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MINIMUM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAXIMUM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIRST")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAST")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABOVE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BELOW")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (void)setValues:(id)a3
{
  NSArray *v4;
  NSArray *values;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  values = self->_values;
  self->_values = v4;

}

- (void)clearValues
{
  -[NSArray removeAllObjects](self->_values, "removeAllObjects");
}

- (void)addValues:(id)a3
{
  id v4;
  NSArray *values;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  values = self->_values;
  v8 = v4;
  if (!values)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_values;
    self->_values = v6;

    v4 = v8;
    values = self->_values;
  }
  -[NSArray addObject:](values, "addObject:", v4);

}

- (unint64_t)valuesCount
{
  return -[NSArray count](self->_values, "count");
}

- (id)valuesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWellnessObjectResultValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBWellnessObjectResultValue recordDate](self, "recordDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBWellnessObjectResultValue recordDate](self, "recordDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBWellnessObjectResultValue hasResultType](self, "hasResultType"))
    PBDataWriterWriteInt32Field();
  -[_INPBWellnessObjectResultValue unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBWellnessObjectResultValue unit](self, "unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_values;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (_INPBWellnessObjectResultValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBWellnessObjectResultValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBWellnessObjectResultValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBWellnessObjectResultValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBWellnessObjectResultValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBWellnessObjectResultValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBWellnessObjectResultValue *v5;
  id v6;
  id v7;
  void *v8;

  v5 = -[_INPBWellnessObjectResultValue init](+[_INPBWellnessObjectResultValue allocWithZone:](_INPBWellnessObjectResultValue, "allocWithZone:"), "init");
  v6 = -[_INPBDateTimeRange copyWithZone:](self->_recordDate, "copyWithZone:", a3);
  -[_INPBWellnessObjectResultValue setRecordDate:](v5, "setRecordDate:", v6);

  if (-[_INPBWellnessObjectResultValue hasResultType](self, "hasResultType"))
    -[_INPBWellnessObjectResultValue setResultType:](v5, "setResultType:", -[_INPBWellnessObjectResultValue resultType](self, "resultType"));
  v7 = -[_INPBString copyWithZone:](self->_unit, "copyWithZone:", a3);
  -[_INPBWellnessObjectResultValue setUnit:](v5, "setUnit:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_values, "copyWithZone:", a3);
  -[_INPBWellnessObjectResultValue setValues:](v5, "setValues:", v8);

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
  int v12;
  int resultType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[_INPBWellnessObjectResultValue recordDate](self, "recordDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBWellnessObjectResultValue recordDate](self, "recordDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBWellnessObjectResultValue recordDate](self, "recordDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_21;
  }
  else
  {

  }
  v12 = -[_INPBWellnessObjectResultValue hasResultType](self, "hasResultType");
  if (v12 != objc_msgSend(v4, "hasResultType"))
    goto LABEL_21;
  if (-[_INPBWellnessObjectResultValue hasResultType](self, "hasResultType"))
  {
    if (objc_msgSend(v4, "hasResultType"))
    {
      resultType = self->_resultType;
      if (resultType != objc_msgSend(v4, "resultType"))
        goto LABEL_21;
    }
  }
  -[_INPBWellnessObjectResultValue unit](self, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBWellnessObjectResultValue unit](self, "unit");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBWellnessObjectResultValue unit](self, "unit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBWellnessObjectResultValue values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBWellnessObjectResultValue values](self, "values");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBWellnessObjectResultValue values](self, "values");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "values");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[_INPBDateTimeRange hash](self->_recordDate, "hash");
  if (-[_INPBWellnessObjectResultValue hasResultType](self, "hasResultType"))
    v4 = 2654435761 * self->_resultType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[_INPBString hash](self->_unit, "hash");
  return v5 ^ v6 ^ -[NSArray hash](self->_values, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBWellnessObjectResultValue recordDate](self, "recordDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("recordDate"));

  if (-[_INPBWellnessObjectResultValue hasResultType](self, "hasResultType"))
  {
    v6 = -[_INPBWellnessObjectResultValue resultType](self, "resultType");
    if (v6 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228FD18[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("resultType"));

  }
  -[_INPBWellnessObjectResultValue unit](self, "unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("unit"));

  if (-[NSArray count](self->_values, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_values;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("values"));
  }
  return v3;
}

- (_INPBDateTimeRange)recordDate
{
  return self->_recordDate;
}

- (int)resultType
{
  return self->_resultType;
}

- (_INPBString)unit
{
  return self->_unit;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
}

+ (Class)valuesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
