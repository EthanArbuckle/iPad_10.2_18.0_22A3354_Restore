@implementation FCCKPRecord

- (FCCKPDateStatistics)timeStatistics
{
  return self->_timeStatistics;
}

- (FCCKPRecordType)type
{
  return self->_type;
}

- (FCCKPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (BOOL)hasTimeStatistics
{
  return self->_timeStatistics != 0;
}

- (NSMutableArray)fields
{
  return self->_fields;
}

- (NSString)etag
{
  return self->_etag;
}

- (NSMutableArray)conflictLoserEtags
{
  return self->_conflictLoserEtags;
}

- (void)addFields:(id)a3
{
  id v4;
  NSMutableArray *fields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fields = self->_fields;
  v8 = v4;
  if (!fields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fields;
    self->_fields = v6;

    v4 = v8;
    fields = self->_fields;
  }
  -[NSMutableArray addObject:](fields, "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_timeStatistics, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedByDevice, 0);
  objc_storeStrong((id *)&self->_modifiedBy, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasCreatedBy
{
  return self->_createdBy != 0;
}

- (void)clearFields
{
  -[NSMutableArray removeAllObjects](self->_fields, "removeAllObjects");
}

- (unint64_t)fieldsCount
{
  return -[NSMutableArray count](self->_fields, "count");
}

- (id)fieldsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fields, "objectAtIndex:", a3);
}

+ (Class)fieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasModifiedBy
{
  return self->_modifiedBy != 0;
}

- (void)clearConflictLoserEtags
{
  -[NSMutableArray removeAllObjects](self->_conflictLoserEtags, "removeAllObjects");
}

- (void)addConflictLoserEtags:(id)a3
{
  id v4;
  NSMutableArray *conflictLoserEtags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  conflictLoserEtags = self->_conflictLoserEtags;
  v8 = v4;
  if (!conflictLoserEtags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_conflictLoserEtags;
    self->_conflictLoserEtags = v6;

    v4 = v8;
    conflictLoserEtags = self->_conflictLoserEtags;
  }
  -[NSMutableArray addObject:](conflictLoserEtags, "addObject:", v4);

}

- (unint64_t)conflictLoserEtagsCount
{
  return -[NSMutableArray count](self->_conflictLoserEtags, "count");
}

- (id)conflictLoserEtagsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_conflictLoserEtags, "objectAtIndex:", a3);
}

+ (Class)conflictLoserEtagsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasModifiedByDevice
{
  return self->_modifiedByDevice != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecord;
  -[FCCKPRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *etag;
  FCCKPRecordIdentifier *recordIdentifier;
  void *v7;
  FCCKPRecordType *type;
  void *v9;
  FCCKPIdentifier *createdBy;
  void *v11;
  FCCKPDateStatistics *timeStatistics;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  FCCKPIdentifier *modifiedBy;
  void *v22;
  NSMutableArray *conflictLoserEtags;
  NSString *modifiedByDevice;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  etag = self->_etag;
  if (etag)
    objc_msgSend(v3, "setObject:forKey:", etag, CFSTR("etag"));
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    -[FCCKPRecordIdentifier dictionaryRepresentation](recordIdentifier, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("recordIdentifier"));

  }
  type = self->_type;
  if (type)
  {
    -[FCCKPRecordType dictionaryRepresentation](type, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("type"));

  }
  createdBy = self->_createdBy;
  if (createdBy)
  {
    -[FCCKPIdentifier dictionaryRepresentation](createdBy, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("createdBy"));

  }
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
  {
    -[FCCKPDateStatistics dictionaryRepresentation](timeStatistics, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timeStatistics"));

  }
  if (-[NSMutableArray count](self->_fields, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_fields, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = self->_fields;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("fields"));
  }
  modifiedBy = self->_modifiedBy;
  if (modifiedBy)
  {
    -[FCCKPIdentifier dictionaryRepresentation](modifiedBy, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("modifiedBy"));

  }
  conflictLoserEtags = self->_conflictLoserEtags;
  if (conflictLoserEtags)
    objc_msgSend(v4, "setObject:forKey:", conflictLoserEtags, CFSTR("conflictLoserEtags"));
  modifiedByDevice = self->_modifiedByDevice;
  if (modifiedByDevice)
    objc_msgSend(v4, "setObject:forKey:", modifiedByDevice, CFSTR("modifiedByDevice"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_etag)
    PBDataWriterWriteStringField();
  if (self->_recordIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_type)
    PBDataWriterWriteSubmessage();
  if (self->_createdBy)
    PBDataWriterWriteSubmessage();
  if (self->_timeStatistics)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_fields;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (self->_modifiedBy)
    PBDataWriterWriteSubmessage();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_conflictLoserEtags;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_modifiedByDevice)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
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
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_etag, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[FCCKPRecordIdentifier copyWithZone:](self->_recordIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v10 = -[FCCKPRecordType copyWithZone:](self->_type, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  v12 = -[FCCKPIdentifier copyWithZone:](self->_createdBy, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[FCCKPDateStatistics copyWithZone:](self->_timeStatistics, "copyWithZone:", a3);
  v15 = (void *)v5[8];
  v5[8] = v14;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = self->_fields;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addFields:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v18);
  }

  v22 = -[FCCKPIdentifier copyWithZone:](self->_modifiedBy, "copyWithZone:", a3);
  v23 = (void *)v5[5];
  v5[5] = v22;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = self->_conflictLoserEtags;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v34;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v28), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend(v5, "addConflictLoserEtags:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v26);
  }

  v30 = -[NSString copyWithZone:](self->_modifiedByDevice, "copyWithZone:", a3);
  v31 = (void *)v5[6];
  v5[6] = v30;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *etag;
  FCCKPRecordIdentifier *recordIdentifier;
  FCCKPRecordType *type;
  FCCKPIdentifier *createdBy;
  FCCKPDateStatistics *timeStatistics;
  NSMutableArray *fields;
  FCCKPIdentifier *modifiedBy;
  NSMutableArray *conflictLoserEtags;
  NSString *modifiedByDevice;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  etag = self->_etag;
  if ((unint64_t)etag | v4[3])
  {
    if (!-[NSString isEqual:](etag, "isEqual:"))
      goto LABEL_20;
  }
  if (((recordIdentifier = self->_recordIdentifier, !((unint64_t)recordIdentifier | v4[7]))
     || -[FCCKPRecordIdentifier isEqual:](recordIdentifier, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[9])) || -[FCCKPRecordType isEqual:](type, "isEqual:"))
    && ((createdBy = self->_createdBy, !((unint64_t)createdBy | v4[2]))
     || -[FCCKPIdentifier isEqual:](createdBy, "isEqual:"))
    && ((timeStatistics = self->_timeStatistics, !((unint64_t)timeStatistics | v4[8]))
     || -[FCCKPDateStatistics isEqual:](timeStatistics, "isEqual:"))
    && ((fields = self->_fields, !((unint64_t)fields | v4[4]))
     || -[NSMutableArray isEqual:](fields, "isEqual:"))
    && ((modifiedBy = self->_modifiedBy, !((unint64_t)modifiedBy | v4[5]))
     || -[FCCKPIdentifier isEqual:](modifiedBy, "isEqual:"))
    && ((conflictLoserEtags = self->_conflictLoserEtags, !((unint64_t)conflictLoserEtags | v4[1]))
     || -[NSMutableArray isEqual:](conflictLoserEtags, "isEqual:")))
  {
    modifiedByDevice = self->_modifiedByDevice;
    if ((unint64_t)modifiedByDevice | v4[6])
      v14 = -[NSString isEqual:](modifiedByDevice, "isEqual:");
    else
      v14 = 1;
  }
  else
  {
LABEL_20:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_etag, "hash");
  v4 = -[FCCKPRecordIdentifier hash](self->_recordIdentifier, "hash") ^ v3;
  v5 = -[FCCKPRecordType hash](self->_type, "hash");
  v6 = v4 ^ v5 ^ -[FCCKPIdentifier hash](self->_createdBy, "hash");
  v7 = -[FCCKPDateStatistics hash](self->_timeStatistics, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_fields, "hash");
  v9 = v6 ^ v8 ^ -[FCCKPIdentifier hash](self->_modifiedBy, "hash");
  v10 = -[NSMutableArray hash](self->_conflictLoserEtags, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_modifiedByDevice, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  FCCKPRecordIdentifier *recordIdentifier;
  void *v6;
  FCCKPRecordType *type;
  uint64_t v8;
  FCCKPIdentifier *createdBy;
  void *v10;
  FCCKPDateStatistics *timeStatistics;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  FCCKPIdentifier *modifiedBy;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[FCCKPRecord setEtag:](self, "setEtag:");
  recordIdentifier = self->_recordIdentifier;
  v6 = (void *)*((_QWORD *)v4 + 7);
  if (recordIdentifier)
  {
    if (v6)
      -[FCCKPRecordIdentifier mergeFrom:]((uint64_t)recordIdentifier, v6);
  }
  else if (v6)
  {
    -[FCCKPRecord setRecordIdentifier:](self, "setRecordIdentifier:", *((_QWORD *)v4 + 7));
  }
  type = self->_type;
  v8 = *((_QWORD *)v4 + 9);
  if (type)
  {
    if (v8)
      -[FCCKPRecordType mergeFrom:](type, "mergeFrom:");
  }
  else if (v8)
  {
    -[FCCKPRecord setType:](self, "setType:");
  }
  createdBy = self->_createdBy;
  v10 = (void *)*((_QWORD *)v4 + 2);
  if (createdBy)
  {
    if (v10)
      -[FCCKPIdentifier mergeFrom:]((uint64_t)createdBy, v10);
  }
  else if (v10)
  {
    -[FCCKPRecord setCreatedBy:](self, "setCreatedBy:", *((_QWORD *)v4 + 2));
  }
  timeStatistics = self->_timeStatistics;
  v12 = (void *)*((_QWORD *)v4 + 8);
  if (timeStatistics)
  {
    if (v12)
      -[FCCKPDateStatistics mergeFrom:]((uint64_t)timeStatistics, v12);
  }
  else if (v12)
  {
    -[FCCKPRecord setTimeStatistics:](self, "setTimeStatistics:", *((_QWORD *)v4 + 8));
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = *((id *)v4 + 4);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        -[FCCKPRecord addFields:](self, "addFields:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v15);
  }

  modifiedBy = self->_modifiedBy;
  v19 = (void *)*((_QWORD *)v4 + 5);
  if (modifiedBy)
  {
    if (v19)
      -[FCCKPIdentifier mergeFrom:]((uint64_t)modifiedBy, v19);
  }
  else if (v19)
  {
    -[FCCKPRecord setModifiedBy:](self, "setModifiedBy:", *((_QWORD *)v4 + 5));
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = *((id *)v4 + 1);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[FCCKPRecord addConflictLoserEtags:](self, "addConflictLoserEtags:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v22);
  }

  if (*((_QWORD *)v4 + 6))
    -[FCCKPRecord setModifiedByDevice:](self, "setModifiedByDevice:");

}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (void)setRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordIdentifier, a3);
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (FCCKPIdentifier)createdBy
{
  return self->_createdBy;
}

- (void)setCreatedBy:(id)a3
{
  objc_storeStrong((id *)&self->_createdBy, a3);
}

- (void)setTimeStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_timeStatistics, a3);
}

- (void)setFields:(id)a3
{
  objc_storeStrong((id *)&self->_fields, a3);
}

- (FCCKPIdentifier)modifiedBy
{
  return self->_modifiedBy;
}

- (void)setModifiedBy:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedBy, a3);
}

- (void)setConflictLoserEtags:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLoserEtags, a3);
}

- (NSString)modifiedByDevice
{
  return self->_modifiedByDevice;
}

- (void)setModifiedByDevice:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedByDevice, a3);
}

@end
