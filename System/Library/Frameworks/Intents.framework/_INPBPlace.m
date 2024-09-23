@implementation _INPBPlace

- (void)setPersonalPlaceType:(int)a3
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
    self->_personalPlaceType = a3;
  }
}

- (BOOL)hasPersonalPlaceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPersonalPlaceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)personalPlaceTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 2)
    return CFSTR("HOME");
  if (a3 == 3)
  {
    v3 = CFSTR("WORK");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPersonalPlaceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("WORK")))
      v4 = 3;
    else
      v4 = 2;
  }

  return v4;
}

- (void)setPlaceDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *placeDescriptors;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  placeDescriptors = self->_placeDescriptors;
  self->_placeDescriptors = v4;

}

- (void)clearPlaceDescriptors
{
  -[NSArray removeAllObjects](self->_placeDescriptors, "removeAllObjects");
}

- (void)addPlaceDescriptors:(id)a3
{
  id v4;
  NSArray *placeDescriptors;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  placeDescriptors = self->_placeDescriptors;
  v8 = v4;
  if (!placeDescriptors)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_placeDescriptors;
    self->_placeDescriptors = v6;

    v4 = v8;
    placeDescriptors = self->_placeDescriptors;
  }
  -[NSArray addObject:](placeDescriptors, "addObject:", v4);

}

- (unint64_t)placeDescriptorsCount
{
  return -[NSArray count](self->_placeDescriptors, "count");
}

- (id)placeDescriptorsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_placeDescriptors, "objectAtIndexedSubscript:", a3);
}

- (void)setPlaceSubType:(id)a3
{
  objc_storeStrong((id *)&self->_placeSubType, a3);
}

- (BOOL)hasPlaceSubType
{
  return self->_placeSubType != 0;
}

- (void)setPlaceType:(id)a3
{
  objc_storeStrong((id *)&self->_placeType, a3);
}

- (BOOL)hasPlaceType
{
  return self->_placeType != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlaceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBPlace hasPersonalPlaceType](self, "hasPersonalPlaceType"))
    PBDataWriterWriteInt32Field();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_placeDescriptors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[_INPBPlace placeSubType](self, "placeSubType", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBPlace placeSubType](self, "placeSubType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPlace placeType](self, "placeType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBPlace placeType](self, "placeType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBPlace)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPlace *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPlace *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPlace *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPlace initWithData:](self, "initWithData:", v6);

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
  -[_INPBPlace data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPlace *v5;
  void *v6;
  id v7;
  id v8;

  v5 = -[_INPBPlace init](+[_INPBPlace allocWithZone:](_INPBPlace, "allocWithZone:"), "init");
  if (-[_INPBPlace hasPersonalPlaceType](self, "hasPersonalPlaceType"))
    -[_INPBPlace setPersonalPlaceType:](v5, "setPersonalPlaceType:", -[_INPBPlace personalPlaceType](self, "personalPlaceType"));
  v6 = (void *)-[NSArray copyWithZone:](self->_placeDescriptors, "copyWithZone:", a3);
  -[_INPBPlace setPlaceDescriptors:](v5, "setPlaceDescriptors:", v6);

  v7 = -[_INPBString copyWithZone:](self->_placeSubType, "copyWithZone:", a3);
  -[_INPBPlace setPlaceSubType:](v5, "setPlaceSubType:", v7);

  v8 = -[_INPBString copyWithZone:](self->_placeType, "copyWithZone:", a3);
  -[_INPBPlace setPlaceType:](v5, "setPlaceType:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int personalPlaceType;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
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
  v5 = -[_INPBPlace hasPersonalPlaceType](self, "hasPersonalPlaceType");
  if (v5 != objc_msgSend(v4, "hasPersonalPlaceType"))
    goto LABEL_21;
  if (-[_INPBPlace hasPersonalPlaceType](self, "hasPersonalPlaceType"))
  {
    if (objc_msgSend(v4, "hasPersonalPlaceType"))
    {
      personalPlaceType = self->_personalPlaceType;
      if (personalPlaceType != objc_msgSend(v4, "personalPlaceType"))
        goto LABEL_21;
    }
  }
  -[_INPBPlace placeDescriptors](self, "placeDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBPlace placeDescriptors](self, "placeDescriptors");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBPlace placeDescriptors](self, "placeDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBPlace placeSubType](self, "placeSubType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeSubType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBPlace placeSubType](self, "placeSubType");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBPlace placeSubType](self, "placeSubType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeSubType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBPlace placeType](self, "placeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBPlace placeType](self, "placeType");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBPlace placeType](self, "placeType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeType");
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
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if (-[_INPBPlace hasPersonalPlaceType](self, "hasPersonalPlaceType"))
    v3 = 2654435761 * self->_personalPlaceType;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_placeDescriptors, "hash") ^ v3;
  v5 = -[_INPBString hash](self->_placeSubType, "hash");
  return v4 ^ v5 ^ -[_INPBString hash](self->_placeType, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  if (-[_INPBPlace hasPersonalPlaceType](self, "hasPersonalPlaceType"))
  {
    v4 = -[_INPBPlace personalPlaceType](self, "personalPlaceType");
    if ((_DWORD)v4 == 2)
    {
      v5 = CFSTR("HOME");
    }
    else if ((_DWORD)v4 == 3)
    {
      v5 = CFSTR("WORK");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("personalPlaceType"));

  }
  if (-[NSArray count](self->_placeDescriptors, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_placeDescriptors;
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

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("placeDescriptors"));
  }
  -[_INPBPlace placeSubType](self, "placeSubType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("placeSubType"));

  -[_INPBPlace placeType](self, "placeType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("placeType"));

  return v3;
}

- (int)personalPlaceType
{
  return self->_personalPlaceType;
}

- (NSArray)placeDescriptors
{
  return self->_placeDescriptors;
}

- (_INPBString)placeSubType
{
  return self->_placeSubType;
}

- (_INPBString)placeType
{
  return self->_placeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeType, 0);
  objc_storeStrong((id *)&self->_placeSubType, 0);
  objc_storeStrong((id *)&self->_placeDescriptors, 0);
}

+ (Class)placeDescriptorsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
