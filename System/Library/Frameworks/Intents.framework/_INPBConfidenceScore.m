@implementation _INPBConfidenceScore

- (void)setAggregateScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_aggregateScore = a3;
}

- (BOOL)hasAggregateScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAggregateScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setComponents:(id)a3
{
  NSArray *v4;
  NSArray *components;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  components = self->_components;
  self->_components = v4;

}

- (void)clearComponents
{
  -[NSArray removeAllObjects](self->_components, "removeAllObjects");
}

- (void)addComponents:(id)a3
{
  id v4;
  NSArray *components;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  components = self->_components;
  v8 = v4;
  if (!components)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_components;
    self->_components = v6;

    v4 = v8;
    components = self->_components;
  }
  -[NSArray addObject:](components, "addObject:", v4);

}

- (unint64_t)componentsCount
{
  return -[NSArray count](self->_components, "count");
}

- (id)componentsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_components, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _INPBConfidenceScoreReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBConfidenceScore hasAggregateScore](self, "hasAggregateScore"))
    PBDataWriterWriteFloatField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_components;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (_INPBConfidenceScore)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBConfidenceScore *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBConfidenceScore *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBConfidenceScore *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBConfidenceScore initWithData:](self, "initWithData:", v6);

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
  -[_INPBConfidenceScore data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBConfidenceScore *v5;
  void *v6;

  v5 = -[_INPBConfidenceScore init](+[_INPBConfidenceScore allocWithZone:](_INPBConfidenceScore, "allocWithZone:"), "init");
  if (-[_INPBConfidenceScore hasAggregateScore](self, "hasAggregateScore"))
  {
    -[_INPBConfidenceScore aggregateScore](self, "aggregateScore");
    -[_INPBConfidenceScore setAggregateScore:](v5, "setAggregateScore:");
  }
  v6 = (void *)-[NSArray copyWithZone:](self->_components, "copyWithZone:", a3);
  -[_INPBConfidenceScore setComponents:](v5, "setComponents:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  float aggregateScore;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBConfidenceScore hasAggregateScore](self, "hasAggregateScore");
    if (v5 == objc_msgSend(v4, "hasAggregateScore"))
    {
      if (!-[_INPBConfidenceScore hasAggregateScore](self, "hasAggregateScore")
        || !objc_msgSend(v4, "hasAggregateScore")
        || (aggregateScore = self->_aggregateScore, objc_msgSend(v4, "aggregateScore"), aggregateScore == v7))
      {
        -[_INPBConfidenceScore components](self, "components");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "components");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if ((v8 == 0) != (v9 != 0))
        {
          -[_INPBConfidenceScore components](self, "components");
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
          {

LABEL_14:
            v16 = 1;
            goto LABEL_12;
          }
          v12 = (void *)v11;
          -[_INPBConfidenceScore components](self, "components");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "components");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if ((v15 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (unint64_t)hash
{
  float aggregateScore;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if (-[_INPBConfidenceScore hasAggregateScore](self, "hasAggregateScore"))
  {
    aggregateScore = self->_aggregateScore;
    v4 = aggregateScore;
    if (aggregateScore < 0.0)
      v4 = -aggregateScore;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0)
        v7 += (unint64_t)v6;
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    v7 = 0;
  }
  return -[NSArray hash](self->_components, "hash") ^ v7;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBConfidenceScore hasAggregateScore](self, "hasAggregateScore"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBConfidenceScore aggregateScore](self, "aggregateScore");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aggregateScore"));

  }
  if (-[NSArray count](self->_components, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_components;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("components"));
  }
  return v3;
}

- (float)aggregateScore
{
  return self->_aggregateScore;
}

- (NSArray)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

+ (Class)componentsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
