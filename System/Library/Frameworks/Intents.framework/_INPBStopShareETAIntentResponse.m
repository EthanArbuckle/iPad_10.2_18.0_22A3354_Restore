@implementation _INPBStopShareETAIntentResponse

- (void)setMediums:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)mediums
{
  return self->_mediums.list;
}

- (void)clearMediums
{
  PBRepeatedInt32Clear();
}

- (void)addMedium:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)mediumsCount
{
  return self->_mediums.count;
}

- (int)mediumAtIndex:(unint64_t)a3
{
  return self->_mediums.list[a3];
}

- (id)mediumsAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E2294438 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMediums:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IDS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMESSAGE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SMS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRecipients:(id)a3
{
  NSArray *v4;
  NSArray *recipients;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  recipients = self->_recipients;
  self->_recipients = v4;

}

- (void)clearRecipients
{
  -[NSArray removeAllObjects](self->_recipients, "removeAllObjects");
}

- (void)addRecipient:(id)a3
{
  id v4;
  NSArray *recipients;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  recipients = self->_recipients;
  v8 = v4;
  if (!recipients)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recipients;
    self->_recipients = v6;

    v4 = v8;
    recipients = self->_recipients;
  }
  -[NSArray addObject:](recipients, "addObject:", v4);

}

- (unint64_t)recipientsCount
{
  return -[NSArray count](self->_recipients, "count");
}

- (id)recipientAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_recipients, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStopShareETAIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_mediums.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_mediums.count);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_recipients;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBStopShareETAIntentResponse clearMediums](self, "clearMediums");
  v3.receiver = self;
  v3.super_class = (Class)_INPBStopShareETAIntentResponse;
  -[_INPBStopShareETAIntentResponse dealloc](&v3, sel_dealloc);
}

- (_INPBStopShareETAIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStopShareETAIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStopShareETAIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStopShareETAIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStopShareETAIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBStopShareETAIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStopShareETAIntentResponse *v5;
  void *v6;

  v5 = -[_INPBStopShareETAIntentResponse init](+[_INPBStopShareETAIntentResponse allocWithZone:](_INPBStopShareETAIntentResponse, "allocWithZone:"), "init");
  PBRepeatedInt32Copy();
  v6 = (void *)-[NSArray copyWithZone:](self->_recipients, "copyWithZone:", a3);
  -[_INPBStopShareETAIntentResponse setRecipients:](v5, "setRecipients:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && PBRepeatedInt32IsEqual())
  {
    -[_INPBStopShareETAIntentResponse recipients](self, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_INPBStopShareETAIntentResponse recipients](self, "recipients");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_11:
        v13 = 1;
        goto LABEL_9;
      }
      v9 = (void *)v8;
      -[_INPBStopShareETAIntentResponse recipients](self, "recipients");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recipients");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = PBRepeatedInt32Hash();
  return -[NSArray hash](self->_recipients, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mediums.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBStopShareETAIntentResponse mediumsCount](self, "mediumsCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBStopShareETAIntentResponse mediumsCount](self, "mediumsCount"))
    {
      v5 = 0;
      do
      {
        v6 = self->_mediums.list[v5];
        if (v6 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediums.list[v5]);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = *(&off_1E2294438 + v6);
        }
        objc_msgSend(v4, "addObject:", v7);

        ++v5;
      }
      while (v5 < -[_INPBStopShareETAIntentResponse mediumsCount](self, "mediumsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("medium"));

  }
  if (-[NSArray count](self->_recipients, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_recipients;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("recipient"));
  }
  return v3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
}

+ (Class)recipientType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
