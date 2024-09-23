@implementation _INPBTask

- (void)setContactEventTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_contactEventTrigger, a3);
}

- (BOOL)hasContactEventTrigger
{
  return self->_contactEventTrigger != 0;
}

- (void)setCreatedDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_createdDateTime, a3);
}

- (BOOL)hasCreatedDateTime
{
  return self->_createdDateTime != 0;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setModifiedDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedDateTime, a3);
}

- (BOOL)hasModifiedDateTime
{
  return self->_modifiedDateTime != 0;
}

- (void)setParentIdentifier:(id)a3
{
  NSString *v4;
  NSString *parentIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  parentIdentifier = self->_parentIdentifier;
  self->_parentIdentifier = v4;

}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
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
    return *(&off_1E228FAD8 + a3);
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

- (void)setTaskReference:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_taskReference = a3;
  }
}

- (BOOL)hasTaskReference
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTaskReference:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)taskReferenceAsString:(int)a3
{
  if (!a3)
    return CFSTR("CURRENT_ACTIVITY");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTaskReference:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("CURRENT_ACTIVITY"));
  return 0;
}

- (void)setTaskType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_taskType = a3;
  }
}

- (BOOL)hasTaskType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTaskType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)taskTypeAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("UNKNOWN_TASK_TYPE");
    case 20:
      return CFSTR("COMPLETABLE");
    case 10:
      v3 = CFSTR("NOT_COMPLETABLE");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsTaskType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TASK_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_COMPLETABLE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETABLE")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTemporalEventTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, a3);
}

- (BOOL)hasTemporalEventTrigger
{
  return self->_temporalEventTrigger != 0;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTaskReadFrom(self, (uint64_t)a3);
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
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[_INPBTask contactEventTrigger](self, "contactEventTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBTask contactEventTrigger](self, "contactEventTrigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTask createdDateTime](self, "createdDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBTask createdDateTime](self, "createdDateTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTask identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_INPBTask modifiedDateTime](self, "modifiedDateTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBTask modifiedDateTime](self, "modifiedDateTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTask parentIdentifier](self, "parentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  if (-[_INPBTask hasPriority](self, "hasPriority"))
    PBDataWriterWriteInt32Field();
  -[_INPBTask spatialEventTrigger](self, "spatialEventTrigger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBTask spatialEventTrigger](self, "spatialEventTrigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBTask hasStatus](self, "hasStatus"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBTask hasTaskReference](self, "hasTaskReference"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBTask hasTaskType](self, "hasTaskType"))
    PBDataWriterWriteInt32Field();
  -[_INPBTask temporalEventTrigger](self, "temporalEventTrigger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBTask temporalEventTrigger](self, "temporalEventTrigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTask title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v19;
  if (v16)
  {
    -[_INPBTask title](self, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v17 = v19;
  }

}

- (_INPBTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTask *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTask *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTask *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTask initWithData:](self, "initWithData:", v6);

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
  -[_INPBTask data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTask *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = -[_INPBTask init](+[_INPBTask allocWithZone:](_INPBTask, "allocWithZone:"), "init");
  v6 = -[_INPBContactEventTrigger copyWithZone:](self->_contactEventTrigger, "copyWithZone:", a3);
  -[_INPBTask setContactEventTrigger:](v5, "setContactEventTrigger:", v6);

  v7 = -[_INPBDateTime copyWithZone:](self->_createdDateTime, "copyWithZone:", a3);
  -[_INPBTask setCreatedDateTime:](v5, "setCreatedDateTime:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBTask setIdentifier:](v5, "setIdentifier:", v8);

  v9 = -[_INPBDateTime copyWithZone:](self->_modifiedDateTime, "copyWithZone:", a3);
  -[_INPBTask setModifiedDateTime:](v5, "setModifiedDateTime:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_parentIdentifier, "copyWithZone:", a3);
  -[_INPBTask setParentIdentifier:](v5, "setParentIdentifier:", v10);

  if (-[_INPBTask hasPriority](self, "hasPriority"))
    -[_INPBTask setPriority:](v5, "setPriority:", -[_INPBTask priority](self, "priority"));
  v11 = -[_INPBSpatialEventTrigger copyWithZone:](self->_spatialEventTrigger, "copyWithZone:", a3);
  -[_INPBTask setSpatialEventTrigger:](v5, "setSpatialEventTrigger:", v11);

  if (-[_INPBTask hasStatus](self, "hasStatus"))
    -[_INPBTask setStatus:](v5, "setStatus:", -[_INPBTask status](self, "status"));
  if (-[_INPBTask hasTaskReference](self, "hasTaskReference"))
    -[_INPBTask setTaskReference:](v5, "setTaskReference:", -[_INPBTask taskReference](self, "taskReference"));
  if (-[_INPBTask hasTaskType](self, "hasTaskType"))
    -[_INPBTask setTaskType:](v5, "setTaskType:", -[_INPBTask taskType](self, "taskType"));
  v12 = -[_INPBTemporalEventTrigger copyWithZone:](self->_temporalEventTrigger, "copyWithZone:", a3);
  -[_INPBTask setTemporalEventTrigger:](v5, "setTemporalEventTrigger:", v12);

  v13 = -[_INPBDataString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBTask setTitle:](v5, "setTitle:", v13);

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
  int v32;
  int priority;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  int status;
  int v41;
  int taskReference;
  int v43;
  int taskType;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  BOOL v55;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  -[_INPBTask contactEventTrigger](self, "contactEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBTask contactEventTrigger](self, "contactEventTrigger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBTask contactEventTrigger](self, "contactEventTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactEventTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBTask createdDateTime](self, "createdDateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createdDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBTask createdDateTime](self, "createdDateTime");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBTask createdDateTime](self, "createdDateTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createdDateTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBTask identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBTask identifier](self, "identifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBTask identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBTask modifiedDateTime](self, "modifiedDateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifiedDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBTask modifiedDateTime](self, "modifiedDateTime");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBTask modifiedDateTime](self, "modifiedDateTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifiedDateTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBTask parentIdentifier](self, "parentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBTask parentIdentifier](self, "parentIdentifier");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBTask parentIdentifier](self, "parentIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_58;
  }
  else
  {

  }
  v32 = -[_INPBTask hasPriority](self, "hasPriority");
  if (v32 != objc_msgSend(v4, "hasPriority"))
    goto LABEL_58;
  if (-[_INPBTask hasPriority](self, "hasPriority"))
  {
    if (objc_msgSend(v4, "hasPriority"))
    {
      priority = self->_priority;
      if (priority != objc_msgSend(v4, "priority"))
        goto LABEL_58;
    }
  }
  -[_INPBTask spatialEventTrigger](self, "spatialEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spatialEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBTask spatialEventTrigger](self, "spatialEventTrigger");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBTask spatialEventTrigger](self, "spatialEventTrigger");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spatialEventTrigger");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_58;
  }
  else
  {

  }
  v39 = -[_INPBTask hasStatus](self, "hasStatus");
  if (v39 != objc_msgSend(v4, "hasStatus"))
    goto LABEL_58;
  if (-[_INPBTask hasStatus](self, "hasStatus"))
  {
    if (objc_msgSend(v4, "hasStatus"))
    {
      status = self->_status;
      if (status != objc_msgSend(v4, "status"))
        goto LABEL_58;
    }
  }
  v41 = -[_INPBTask hasTaskReference](self, "hasTaskReference");
  if (v41 != objc_msgSend(v4, "hasTaskReference"))
    goto LABEL_58;
  if (-[_INPBTask hasTaskReference](self, "hasTaskReference"))
  {
    if (objc_msgSend(v4, "hasTaskReference"))
    {
      taskReference = self->_taskReference;
      if (taskReference != objc_msgSend(v4, "taskReference"))
        goto LABEL_58;
    }
  }
  v43 = -[_INPBTask hasTaskType](self, "hasTaskType");
  if (v43 != objc_msgSend(v4, "hasTaskType"))
    goto LABEL_58;
  if (-[_INPBTask hasTaskType](self, "hasTaskType"))
  {
    if (objc_msgSend(v4, "hasTaskType"))
    {
      taskType = self->_taskType;
      if (taskType != objc_msgSend(v4, "taskType"))
        goto LABEL_58;
    }
  }
  -[_INPBTask temporalEventTrigger](self, "temporalEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporalEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_57;
  -[_INPBTask temporalEventTrigger](self, "temporalEventTrigger");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    -[_INPBTask temporalEventTrigger](self, "temporalEventTrigger");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporalEventTrigger");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "isEqual:", v48);

    if (!v49)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBTask title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBTask title](self, "title");
    v50 = objc_claimAutoreleasedReturnValue();
    if (!v50)
    {

LABEL_61:
      v55 = 1;
      goto LABEL_59;
    }
    v51 = (void *)v50;
    -[_INPBTask title](self, "title");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqual:", v53);

    if ((v54 & 1) != 0)
      goto LABEL_61;
  }
  else
  {
LABEL_57:

  }
LABEL_58:
  v55 = 0;
LABEL_59:

  return v55;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;

  v15 = -[_INPBContactEventTrigger hash](self->_contactEventTrigger, "hash");
  v3 = -[_INPBDateTime hash](self->_createdDateTime, "hash");
  v4 = -[NSString hash](self->_identifier, "hash");
  v5 = -[_INPBDateTime hash](self->_modifiedDateTime, "hash");
  v6 = -[NSString hash](self->_parentIdentifier, "hash");
  if (-[_INPBTask hasPriority](self, "hasPriority"))
    v7 = 2654435761 * self->_priority;
  else
    v7 = 0;
  v8 = -[_INPBSpatialEventTrigger hash](self->_spatialEventTrigger, "hash");
  if (-[_INPBTask hasStatus](self, "hasStatus"))
    v9 = 2654435761 * self->_status;
  else
    v9 = 0;
  if (-[_INPBTask hasTaskReference](self, "hasTaskReference"))
    v10 = 2654435761 * self->_taskReference;
  else
    v10 = 0;
  if (-[_INPBTask hasTaskType](self, "hasTaskType"))
    v11 = 2654435761 * self->_taskType;
  else
    v11 = 0;
  v12 = v3 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  v13 = v9 ^ v10 ^ v11 ^ -[_INPBTemporalEventTrigger hash](self->_temporalEventTrigger, "hash");
  return v12 ^ v13 ^ -[_INPBDataString hash](self->_title, "hash");
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
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBTask contactEventTrigger](self, "contactEventTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactEventTrigger"));

  -[_INPBTask createdDateTime](self, "createdDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("createdDateTime"));

  if (self->_identifier)
  {
    -[_INPBTask identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));

  }
  -[_INPBTask modifiedDateTime](self, "modifiedDateTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("modifiedDateTime"));

  if (self->_parentIdentifier)
  {
    -[_INPBTask parentIdentifier](self, "parentIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("parentIdentifier"));

  }
  if (-[_INPBTask hasPriority](self, "hasPriority"))
  {
    v14 = -[_INPBTask priority](self, "priority");
    if (v14 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E228FAD8 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("priority"));

  }
  -[_INPBTask spatialEventTrigger](self, "spatialEventTrigger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("spatialEventTrigger"));

  if (-[_INPBTask hasStatus](self, "hasStatus"))
  {
    v18 = -[_INPBTask status](self, "status");
    if ((_DWORD)v18)
    {
      if ((_DWORD)v18 == 20)
      {
        v19 = CFSTR("COMPLETED");
      }
      else if ((_DWORD)v18 == 10)
      {
        v19 = CFSTR("NOT_COMPLETED");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v19 = CFSTR("UNKNOWN_STATUS");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("status"));

  }
  if (-[_INPBTask hasTaskReference](self, "hasTaskReference"))
  {
    v20 = -[_INPBTask taskReference](self, "taskReference");
    if ((_DWORD)v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("CURRENT_ACTIVITY");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("taskReference"));

  }
  if (-[_INPBTask hasTaskType](self, "hasTaskType"))
  {
    v22 = -[_INPBTask taskType](self, "taskType");
    if ((_DWORD)v22)
    {
      if ((_DWORD)v22 == 20)
      {
        v23 = CFSTR("COMPLETABLE");
      }
      else if ((_DWORD)v22 == 10)
      {
        v23 = CFSTR("NOT_COMPLETABLE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = CFSTR("UNKNOWN_TASK_TYPE");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("taskType"));

  }
  -[_INPBTask temporalEventTrigger](self, "temporalEventTrigger");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryRepresentation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("temporalEventTrigger"));

  -[_INPBTask title](self, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("title"));

  return v3;
}

- (_INPBContactEventTrigger)contactEventTrigger
{
  return self->_contactEventTrigger;
}

- (_INPBDateTime)createdDateTime
{
  return self->_createdDateTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBDateTime)modifiedDateTime
{
  return self->_modifiedDateTime;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
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

- (int)taskReference
{
  return self->_taskReference;
}

- (int)taskType
{
  return self->_taskType;
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (_INPBDataString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_spatialEventTrigger, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedDateTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_createdDateTime, 0);
  objc_storeStrong((id *)&self->_contactEventTrigger, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
