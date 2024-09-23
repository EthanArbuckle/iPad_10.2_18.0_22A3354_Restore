@implementation _INPBReportIncidentIntentResponse

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setSupportedTypes:(id)a3
{
  NSArray *v4;
  NSArray *supportedTypes;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  supportedTypes = self->_supportedTypes;
  self->_supportedTypes = v4;

}

- (void)clearSupportedTypes
{
  -[NSArray removeAllObjects](self->_supportedTypes, "removeAllObjects");
}

- (void)addSupportedType:(id)a3
{
  id v4;
  NSArray *supportedTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  supportedTypes = self->_supportedTypes;
  v8 = v4;
  if (!supportedTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_supportedTypes;
    self->_supportedTypes = v6;

    v4 = v8;
    supportedTypes = self->_supportedTypes;
  }
  -[NSArray addObject:](supportedTypes, "addObject:", v4);

}

- (unint64_t)supportedTypesCount
{
  return -[NSArray count](self->_supportedTypes, "count");
}

- (id)supportedTypeAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_supportedTypes, "objectAtIndexedSubscript:", a3);
}

- (void)setTransportTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)transportTypes
{
  return self->_transportTypes.list;
}

- (void)clearTransportTypes
{
  PBRepeatedInt32Clear();
}

- (void)addTransportType:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)transportTypesCount
{
  return self->_transportTypes.count;
}

- (int)transportTypeAtIndex:(unint64_t)a3
{
  return self->_transportTypes.list[a3];
}

- (id)transportTypesAsString:(int)a3
{
  if (a3 < 6)
    return off_1E22951C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CYCLING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReportIncidentIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_transportTypes;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBReportIncidentIntentResponse location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBReportIncidentIntentResponse location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_supportedTypes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  p_transportTypes = &self->_transportTypes;
  if (p_transportTypes->count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < p_transportTypes->count);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBReportIncidentIntentResponse clearTransportTypes](self, "clearTransportTypes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBReportIncidentIntentResponse;
  -[_INPBReportIncidentIntentResponse dealloc](&v3, sel_dealloc);
}

- (_INPBReportIncidentIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBReportIncidentIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBReportIncidentIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBReportIncidentIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBReportIncidentIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBReportIncidentIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBReportIncidentIntentResponse *v5;
  id v6;
  void *v7;

  v5 = -[_INPBReportIncidentIntentResponse init](+[_INPBReportIncidentIntentResponse allocWithZone:](_INPBReportIncidentIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  -[_INPBReportIncidentIntentResponse setLocation:](v5, "setLocation:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_supportedTypes, "copyWithZone:", a3);
  -[_INPBReportIncidentIntentResponse setSupportedTypes:](v5, "setSupportedTypes:", v7);

  PBRepeatedInt32Copy();
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
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBReportIncidentIntentResponse location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBReportIncidentIntentResponse location](self, "location");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBReportIncidentIntentResponse location](self, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBReportIncidentIntentResponse supportedTypes](self, "supportedTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBReportIncidentIntentResponse supportedTypes](self, "supportedTypes");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      IsEqual = PBRepeatedInt32IsEqual();
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBReportIncidentIntentResponse supportedTypes](self, "supportedTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "supportedTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  IsEqual = 0;
LABEL_13:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_INPBLocation hash](self->_location, "hash");
  v4 = -[NSArray hash](self->_supportedTypes, "hash") ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBReportIncidentIntentResponse location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("location"));

  if (-[NSArray count](self->_supportedTypes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_supportedTypes;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("supportedType"));
  }
  if (self->_transportTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBReportIncidentIntentResponse transportTypesCount](self, "transportTypesCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBReportIncidentIntentResponse transportTypesCount](self, "transportTypesCount"))
    {
      v14 = 0;
      do
      {
        v15 = self->_transportTypes.list[v14];
        if (v15 >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportTypes.list[v14]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E22951C0[v15];
        }
        objc_msgSend(v13, "addObject:", v16);

        ++v14;
      }
      while (v14 < -[_INPBReportIncidentIntentResponse transportTypesCount](self, "transportTypesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("transportType"));

  }
  return v3;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (NSArray)supportedTypes
{
  return self->_supportedTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (Class)supportedTypeType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
