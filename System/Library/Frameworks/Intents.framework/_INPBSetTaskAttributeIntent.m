@implementation _INPBSetTaskAttributeIntent

- (void)setContactEventTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_contactEventTrigger, a3);
}

- (BOOL)hasContactEventTrigger
{
  return self->_contactEventTrigger != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setPriority:(int)a3
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
    self->_priority = a3;
  }
}

- (BOOL)hasPriority
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPriority:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)priorityAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2288E78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPriority:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PRIORITY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FLAGGED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FLAGGED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSpatialEventTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_spatialEventTrigger, a3);
}

- (BOOL)hasSpatialEventTrigger
{
  return self->_spatialEventTrigger != 0;
}

- (void)setStatus:(int)a3
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
    self->_status = a3;
  }
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("UNKNOWN_STATUS");
    case 20:
      return CFSTR("COMPLETED");
    case 10:
      v3 = CFSTR("NOT_COMPLETED");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_STATUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_COMPLETED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTargetTask:(id)a3
{
  objc_storeStrong((id *)&self->_targetTask, a3);
}

- (BOOL)hasTargetTask
{
  return self->_targetTask != 0;
}

- (void)setTaskTitle:(id)a3
{
  objc_storeStrong((id *)&self->_taskTitle, a3);
}

- (BOOL)hasTaskTitle
{
  return self->_taskTitle != 0;
}

- (void)setTemporalEventTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, a3);
}

- (BOOL)hasTemporalEventTrigger
{
  return self->_temporalEventTrigger != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTaskAttributeIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[_INPBSetTaskAttributeIntent contactEventTrigger](self, "contactEventTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetTaskAttributeIntent contactEventTrigger](self, "contactEventTrigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetTaskAttributeIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetTaskAttributeIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetTaskAttributeIntent hasPriority](self, "hasPriority"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetTaskAttributeIntent spatialEventTrigger](self, "spatialEventTrigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSetTaskAttributeIntent spatialEventTrigger](self, "spatialEventTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetTaskAttributeIntent hasStatus](self, "hasStatus"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetTaskAttributeIntent targetTask](self, "targetTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBSetTaskAttributeIntent targetTask](self, "targetTask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetTaskAttributeIntent taskTitle](self, "taskTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBSetTaskAttributeIntent taskTitle](self, "taskTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetTaskAttributeIntent temporalEventTrigger](self, "temporalEventTrigger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v17;
  if (v14)
  {
    -[_INPBSetTaskAttributeIntent temporalEventTrigger](self, "temporalEventTrigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v15 = v17;
  }

}

- (_INPBSetTaskAttributeIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetTaskAttributeIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetTaskAttributeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetTaskAttributeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetTaskAttributeIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetTaskAttributeIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetTaskAttributeIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = -[_INPBSetTaskAttributeIntent init](+[_INPBSetTaskAttributeIntent allocWithZone:](_INPBSetTaskAttributeIntent, "allocWithZone:"), "init");
  v6 = -[_INPBContactEventTrigger copyWithZone:](self->_contactEventTrigger, "copyWithZone:", a3);
  -[_INPBSetTaskAttributeIntent setContactEventTrigger:](v5, "setContactEventTrigger:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetTaskAttributeIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  if (-[_INPBSetTaskAttributeIntent hasPriority](self, "hasPriority"))
    -[_INPBSetTaskAttributeIntent setPriority:](v5, "setPriority:", -[_INPBSetTaskAttributeIntent priority](self, "priority"));
  v8 = -[_INPBSpatialEventTrigger copyWithZone:](self->_spatialEventTrigger, "copyWithZone:", a3);
  -[_INPBSetTaskAttributeIntent setSpatialEventTrigger:](v5, "setSpatialEventTrigger:", v8);

  if (-[_INPBSetTaskAttributeIntent hasStatus](self, "hasStatus"))
    -[_INPBSetTaskAttributeIntent setStatus:](v5, "setStatus:", -[_INPBSetTaskAttributeIntent status](self, "status"));
  v9 = -[_INPBTask copyWithZone:](self->_targetTask, "copyWithZone:", a3);
  -[_INPBSetTaskAttributeIntent setTargetTask:](v5, "setTargetTask:", v9);

  v10 = -[_INPBDataString copyWithZone:](self->_taskTitle, "copyWithZone:", a3);
  -[_INPBSetTaskAttributeIntent setTaskTitle:](v5, "setTaskTitle:", v10);

  v11 = -[_INPBTemporalEventTrigger copyWithZone:](self->_temporalEventTrigger, "copyWithZone:", a3);
  -[_INPBSetTaskAttributeIntent setTemporalEventTrigger:](v5, "setTemporalEventTrigger:", v11);

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
  int v17;
  int priority;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  int status;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  BOOL v41;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[_INPBSetTaskAttributeIntent contactEventTrigger](self, "contactEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_39;
  -[_INPBSetTaskAttributeIntent contactEventTrigger](self, "contactEventTrigger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetTaskAttributeIntent contactEventTrigger](self, "contactEventTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactEventTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_40;
  }
  else
  {

  }
  -[_INPBSetTaskAttributeIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_39;
  -[_INPBSetTaskAttributeIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSetTaskAttributeIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_40;
  }
  else
  {

  }
  v17 = -[_INPBSetTaskAttributeIntent hasPriority](self, "hasPriority");
  if (v17 != objc_msgSend(v4, "hasPriority"))
    goto LABEL_40;
  if (-[_INPBSetTaskAttributeIntent hasPriority](self, "hasPriority"))
  {
    if (objc_msgSend(v4, "hasPriority"))
    {
      priority = self->_priority;
      if (priority != objc_msgSend(v4, "priority"))
        goto LABEL_40;
    }
  }
  -[_INPBSetTaskAttributeIntent spatialEventTrigger](self, "spatialEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spatialEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_39;
  -[_INPBSetTaskAttributeIntent spatialEventTrigger](self, "spatialEventTrigger");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBSetTaskAttributeIntent spatialEventTrigger](self, "spatialEventTrigger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spatialEventTrigger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_40;
  }
  else
  {

  }
  v24 = -[_INPBSetTaskAttributeIntent hasStatus](self, "hasStatus");
  if (v24 != objc_msgSend(v4, "hasStatus"))
    goto LABEL_40;
  if (-[_INPBSetTaskAttributeIntent hasStatus](self, "hasStatus"))
  {
    if (objc_msgSend(v4, "hasStatus"))
    {
      status = self->_status;
      if (status != objc_msgSend(v4, "status"))
        goto LABEL_40;
    }
  }
  -[_INPBSetTaskAttributeIntent targetTask](self, "targetTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_39;
  -[_INPBSetTaskAttributeIntent targetTask](self, "targetTask");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBSetTaskAttributeIntent targetTask](self, "targetTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetTask");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_40;
  }
  else
  {

  }
  -[_INPBSetTaskAttributeIntent taskTitle](self, "taskTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_39;
  -[_INPBSetTaskAttributeIntent taskTitle](self, "taskTitle");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_INPBSetTaskAttributeIntent taskTitle](self, "taskTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskTitle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_40;
  }
  else
  {

  }
  -[_INPBSetTaskAttributeIntent temporalEventTrigger](self, "temporalEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporalEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetTaskAttributeIntent temporalEventTrigger](self, "temporalEventTrigger");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
    {

LABEL_43:
      v41 = 1;
      goto LABEL_41;
    }
    v37 = (void *)v36;
    -[_INPBSetTaskAttributeIntent temporalEventTrigger](self, "temporalEventTrigger");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporalEventTrigger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if ((v40 & 1) != 0)
      goto LABEL_43;
  }
  else
  {
LABEL_39:

  }
LABEL_40:
  v41 = 0;
LABEL_41:

  return v41;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[_INPBContactEventTrigger hash](self->_contactEventTrigger, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBSetTaskAttributeIntent hasPriority](self, "hasPriority"))
    v5 = 2654435761 * self->_priority;
  else
    v5 = 0;
  v6 = -[_INPBSpatialEventTrigger hash](self->_spatialEventTrigger, "hash");
  if (-[_INPBSetTaskAttributeIntent hasStatus](self, "hasStatus"))
    v7 = 2654435761 * self->_status;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[_INPBTask hash](self->_targetTask, "hash");
  v10 = v8 ^ v9 ^ -[_INPBDataString hash](self->_taskTitle, "hash");
  return v10 ^ -[_INPBTemporalEventTrigger hash](self->_temporalEventTrigger, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSetTaskAttributeIntent contactEventTrigger](self, "contactEventTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactEventTrigger"));

  -[_INPBSetTaskAttributeIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  if (-[_INPBSetTaskAttributeIntent hasPriority](self, "hasPriority"))
  {
    v8 = -[_INPBSetTaskAttributeIntent priority](self, "priority");
    if (v8 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E2288E78[v8];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("priority"));

  }
  -[_INPBSetTaskAttributeIntent spatialEventTrigger](self, "spatialEventTrigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("spatialEventTrigger"));

  if (-[_INPBSetTaskAttributeIntent hasStatus](self, "hasStatus"))
  {
    v12 = -[_INPBSetTaskAttributeIntent status](self, "status");
    if ((_DWORD)v12)
    {
      if ((_DWORD)v12 == 20)
      {
        v13 = CFSTR("COMPLETED");
      }
      else if ((_DWORD)v12 == 10)
      {
        v13 = CFSTR("NOT_COMPLETED");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = CFSTR("UNKNOWN_STATUS");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("status"));

  }
  -[_INPBSetTaskAttributeIntent targetTask](self, "targetTask");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("targetTask"));

  -[_INPBSetTaskAttributeIntent taskTitle](self, "taskTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("taskTitle"));

  -[_INPBSetTaskAttributeIntent temporalEventTrigger](self, "temporalEventTrigger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("temporalEventTrigger"));

  return v3;
}

- (_INPBContactEventTrigger)contactEventTrigger
{
  return self->_contactEventTrigger;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)priority
{
  return self->_priority;
}

- (_INPBSpatialEventTrigger)spatialEventTrigger
{
  return self->_spatialEventTrigger;
}

- (int)status
{
  return self->_status;
}

- (_INPBTask)targetTask
{
  return self->_targetTask;
}

- (_INPBDataString)taskTitle
{
  return self->_taskTitle;
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_taskTitle, 0);
  objc_storeStrong((id *)&self->_targetTask, 0);
  objc_storeStrong((id *)&self->_spatialEventTrigger, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_contactEventTrigger, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
