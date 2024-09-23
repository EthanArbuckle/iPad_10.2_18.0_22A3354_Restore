@implementation _INPBSpatialEventTrigger

- (void)setEvent:(int)a3
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
    self->_event = a3;
  }
}

- (BOOL)hasEvent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEvent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)eventAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("UNKNOWN_SPATIAL_EVENT");
    case 20:
      return CFSTR("DEPART");
    case 10:
      v3 = CFSTR("ARRIVE");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SPATIAL_EVENT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEPART")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setMobileSpace:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_mobileSpace = a3;
  }
}

- (BOOL)hasMobileSpace
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMobileSpace:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)mobileSpaceAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN_MOBILE_SPACE");
  if (a3 == 1)
  {
    v3 = CFSTR("CAR");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsMobileSpace:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MOBILE_SPACE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CAR"));

  return v4;
}

- (void)setSuggestedValues:(id)a3
{
  NSArray *v4;
  NSArray *suggestedValues;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  suggestedValues = self->_suggestedValues;
  self->_suggestedValues = v4;

}

- (void)clearSuggestedValues
{
  -[NSArray removeAllObjects](self->_suggestedValues, "removeAllObjects");
}

- (void)addSuggestedValues:(id)a3
{
  id v4;
  NSArray *suggestedValues;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  suggestedValues = self->_suggestedValues;
  v8 = v4;
  if (!suggestedValues)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestedValues;
    self->_suggestedValues = v6;

    v4 = v8;
    suggestedValues = self->_suggestedValues;
  }
  -[NSArray addObject:](suggestedValues, "addObject:", v4);

}

- (unint64_t)suggestedValuesCount
{
  return -[NSArray count](self->_suggestedValues, "count");
}

- (id)suggestedValuesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_suggestedValues, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSpatialEventTriggerReadFrom(self, (uint64_t)a3);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBSpatialEventTrigger hasEvent](self, "hasEvent"))
    PBDataWriterWriteInt32Field();
  -[_INPBSpatialEventTrigger location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSpatialEventTrigger location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSpatialEventTrigger hasMobileSpace](self, "hasMobileSpace"))
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_suggestedValues;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (_INPBSpatialEventTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSpatialEventTrigger *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSpatialEventTrigger *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSpatialEventTrigger *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSpatialEventTrigger initWithData:](self, "initWithData:", v6);

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
  -[_INPBSpatialEventTrigger data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSpatialEventTrigger *v5;
  id v6;
  void *v7;

  v5 = -[_INPBSpatialEventTrigger init](+[_INPBSpatialEventTrigger allocWithZone:](_INPBSpatialEventTrigger, "allocWithZone:"), "init");
  if (-[_INPBSpatialEventTrigger hasEvent](self, "hasEvent"))
    -[_INPBSpatialEventTrigger setEvent:](v5, "setEvent:", -[_INPBSpatialEventTrigger event](self, "event"));
  v6 = -[_INPBLocationValue copyWithZone:](self->_location, "copyWithZone:", a3);
  -[_INPBSpatialEventTrigger setLocation:](v5, "setLocation:", v6);

  if (-[_INPBSpatialEventTrigger hasMobileSpace](self, "hasMobileSpace"))
    -[_INPBSpatialEventTrigger setMobileSpace:](v5, "setMobileSpace:", -[_INPBSpatialEventTrigger mobileSpace](self, "mobileSpace"));
  v7 = (void *)-[NSArray copyWithZone:](self->_suggestedValues, "copyWithZone:", a3);
  -[_INPBSpatialEventTrigger setSuggestedValues:](v5, "setSuggestedValues:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int event;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int mobileSpace;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  v5 = -[_INPBSpatialEventTrigger hasEvent](self, "hasEvent");
  if (v5 != objc_msgSend(v4, "hasEvent"))
    goto LABEL_20;
  if (-[_INPBSpatialEventTrigger hasEvent](self, "hasEvent"))
  {
    if (objc_msgSend(v4, "hasEvent"))
    {
      event = self->_event;
      if (event != objc_msgSend(v4, "event"))
        goto LABEL_20;
    }
  }
  -[_INPBSpatialEventTrigger location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_19;
  -[_INPBSpatialEventTrigger location](self, "location");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBSpatialEventTrigger location](self, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_20;
  }
  else
  {

  }
  v14 = -[_INPBSpatialEventTrigger hasMobileSpace](self, "hasMobileSpace");
  if (v14 != objc_msgSend(v4, "hasMobileSpace"))
    goto LABEL_20;
  if (-[_INPBSpatialEventTrigger hasMobileSpace](self, "hasMobileSpace"))
  {
    if (objc_msgSend(v4, "hasMobileSpace"))
    {
      mobileSpace = self->_mobileSpace;
      if (mobileSpace != objc_msgSend(v4, "mobileSpace"))
        goto LABEL_20;
    }
  }
  -[_INPBSpatialEventTrigger suggestedValues](self, "suggestedValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBSpatialEventTrigger suggestedValues](self, "suggestedValues");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {

LABEL_23:
      v21 = 1;
      goto LABEL_21;
    }
    v17 = (void *)v16;
    -[_INPBSpatialEventTrigger suggestedValues](self, "suggestedValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestedValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v21 = 0;
LABEL_21:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (-[_INPBSpatialEventTrigger hasEvent](self, "hasEvent"))
    v3 = 2654435761 * self->_event;
  else
    v3 = 0;
  v4 = -[_INPBLocationValue hash](self->_location, "hash");
  if (-[_INPBSpatialEventTrigger hasMobileSpace](self, "hasMobileSpace"))
    v5 = 2654435761 * self->_mobileSpace;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_suggestedValues, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
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
  if (-[_INPBSpatialEventTrigger hasEvent](self, "hasEvent"))
  {
    v4 = -[_INPBSpatialEventTrigger event](self, "event");
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 == 20)
      {
        v5 = CFSTR("DEPART");
      }
      else if ((_DWORD)v4 == 10)
      {
        v5 = CFSTR("ARRIVE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("UNKNOWN_SPATIAL_EVENT");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("event"));

  }
  -[_INPBSpatialEventTrigger location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("location"));

  if (-[_INPBSpatialEventTrigger hasMobileSpace](self, "hasMobileSpace"))
  {
    v8 = -[_INPBSpatialEventTrigger mobileSpace](self, "mobileSpace");
    if ((_DWORD)v8)
    {
      if ((_DWORD)v8 == 1)
      {
        v9 = CFSTR("CAR");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = CFSTR("UNKNOWN_MOBILE_SPACE");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mobileSpace"));

  }
  if (-[NSArray count](self->_suggestedValues, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_suggestedValues;
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

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("suggestedValues"));
  }
  return v3;
}

- (int)event
{
  return self->_event;
}

- (_INPBLocationValue)location
{
  return self->_location;
}

- (int)mobileSpace
{
  return self->_mobileSpace;
}

- (NSArray)suggestedValues
{
  return self->_suggestedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedValues, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (Class)suggestedValuesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
