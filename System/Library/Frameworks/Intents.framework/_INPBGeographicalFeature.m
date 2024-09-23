@implementation _INPBGeographicalFeature

- (void)setGeographicalFeatureDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *geographicalFeatureDescriptors;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
  self->_geographicalFeatureDescriptors = v4;

}

- (void)clearGeographicalFeatureDescriptors
{
  -[NSArray removeAllObjects](self->_geographicalFeatureDescriptors, "removeAllObjects");
}

- (void)addGeographicalFeatureDescriptors:(id)a3
{
  id v4;
  NSArray *geographicalFeatureDescriptors;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
  v8 = v4;
  if (!geographicalFeatureDescriptors)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_geographicalFeatureDescriptors;
    self->_geographicalFeatureDescriptors = v6;

    v4 = v8;
    geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
  }
  -[NSArray addObject:](geographicalFeatureDescriptors, "addObject:", v4);

}

- (unint64_t)geographicalFeatureDescriptorsCount
{
  return -[NSArray count](self->_geographicalFeatureDescriptors, "count");
}

- (id)geographicalFeatureDescriptorsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_geographicalFeatureDescriptors, "objectAtIndexedSubscript:", a3);
}

- (void)setGeographicalFeatureType:(id)a3
{
  objc_storeStrong((id *)&self->_geographicalFeatureType, a3);
}

- (BOOL)hasGeographicalFeatureType
{
  return self->_geographicalFeatureType != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGeographicalFeatureReadFrom(self, (uint64_t)a3);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_geographicalFeatureDescriptors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[_INPBGeographicalFeature geographicalFeatureType](self, "geographicalFeatureType", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBGeographicalFeature geographicalFeatureType](self, "geographicalFeatureType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBGeographicalFeature)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGeographicalFeature *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGeographicalFeature *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGeographicalFeature *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGeographicalFeature initWithData:](self, "initWithData:", v6);

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
  -[_INPBGeographicalFeature data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGeographicalFeature *v5;
  void *v6;
  id v7;

  v5 = -[_INPBGeographicalFeature init](+[_INPBGeographicalFeature allocWithZone:](_INPBGeographicalFeature, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_geographicalFeatureDescriptors, "copyWithZone:", a3);
  -[_INPBGeographicalFeature setGeographicalFeatureDescriptors:](v5, "setGeographicalFeatureDescriptors:", v6);

  v7 = -[_INPBString copyWithZone:](self->_geographicalFeatureType, "copyWithZone:", a3);
  -[_INPBGeographicalFeature setGeographicalFeatureType:](v5, "setGeographicalFeatureType:", v7);

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBGeographicalFeature geographicalFeatureDescriptors](self, "geographicalFeatureDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geographicalFeatureDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBGeographicalFeature geographicalFeatureDescriptors](self, "geographicalFeatureDescriptors");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBGeographicalFeature geographicalFeatureDescriptors](self, "geographicalFeatureDescriptors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geographicalFeatureDescriptors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBGeographicalFeature geographicalFeatureType](self, "geographicalFeatureType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geographicalFeatureType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBGeographicalFeature geographicalFeatureType](self, "geographicalFeatureType");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBGeographicalFeature geographicalFeatureType](self, "geographicalFeatureType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geographicalFeatureType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_geographicalFeatureDescriptors, "hash");
  return -[_INPBString hash](self->_geographicalFeatureType, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_geographicalFeatureDescriptors, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_geographicalFeatureDescriptors;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("geographicalFeatureDescriptors"));
  }
  -[_INPBGeographicalFeature geographicalFeatureType](self, "geographicalFeatureType", (_QWORD)v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("geographicalFeatureType"));

  return v3;
}

- (NSArray)geographicalFeatureDescriptors
{
  return self->_geographicalFeatureDescriptors;
}

- (_INPBString)geographicalFeatureType
{
  return self->_geographicalFeatureType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geographicalFeatureType, 0);
  objc_storeStrong((id *)&self->_geographicalFeatureDescriptors, 0);
}

+ (Class)geographicalFeatureDescriptorsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
