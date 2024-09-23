@implementation _INPBAddTasksIntent

- (void)setContactEventTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_contactEventTrigger, a3);
}

- (BOOL)hasContactEventTrigger
{
  return self->_contactEventTrigger != 0;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (BOOL)hasIntent
{
  return self->_intent != 0;
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
    return off_1E228D2D8[a3];
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

- (void)setTargetTaskList:(id)a3
{
  objc_storeStrong((id *)&self->_targetTaskList, a3);
}

- (BOOL)hasTargetTaskList
{
  return self->_targetTaskList != 0;
}

- (void)setTargetTaskListMembers:(id)a3
{
  NSArray *v4;
  NSArray *targetTaskListMembers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  targetTaskListMembers = self->_targetTaskListMembers;
  self->_targetTaskListMembers = v4;

}

- (void)clearTargetTaskListMembers
{
  -[NSArray removeAllObjects](self->_targetTaskListMembers, "removeAllObjects");
}

- (void)addTargetTaskListMembers:(id)a3
{
  id v4;
  NSArray *targetTaskListMembers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  targetTaskListMembers = self->_targetTaskListMembers;
  v8 = v4;
  if (!targetTaskListMembers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_targetTaskListMembers;
    self->_targetTaskListMembers = v6;

    v4 = v8;
    targetTaskListMembers = self->_targetTaskListMembers;
  }
  -[NSArray addObject:](targetTaskListMembers, "addObject:", v4);

}

- (unint64_t)targetTaskListMembersCount
{
  return -[NSArray count](self->_targetTaskListMembers, "count");
}

- (id)targetTaskListMembersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_targetTaskListMembers, "objectAtIndexedSubscript:", a3);
}

- (void)setTaskReference:(int)a3
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
    self->_taskReference = a3;
  }
}

- (BOOL)hasTaskReference
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTaskReference:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
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

- (void)setTaskTitles:(id)a3
{
  NSArray *v4;
  NSArray *taskTitles;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  taskTitles = self->_taskTitles;
  self->_taskTitles = v4;

}

- (void)clearTaskTitles
{
  -[NSArray removeAllObjects](self->_taskTitles, "removeAllObjects");
}

- (void)addTaskTitles:(id)a3
{
  id v4;
  NSArray *taskTitles;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  taskTitles = self->_taskTitles;
  v8 = v4;
  if (!taskTitles)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_taskTitles;
    self->_taskTitles = v6;

    v4 = v8;
    taskTitles = self->_taskTitles;
  }
  -[NSArray addObject:](taskTitles, "addObject:", v4);

}

- (unint64_t)taskTitlesCount
{
  return -[NSArray count](self->_taskTitles, "count");
}

- (id)taskTitlesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_taskTitles, "objectAtIndexedSubscript:", a3);
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
  return _INPBAddTasksIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
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
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBAddTasksIntent contactEventTrigger](self, "contactEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBAddTasksIntent contactEventTrigger](self, "contactEventTrigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAddTasksIntent intent](self, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBAddTasksIntent intent](self, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAddTasksIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBAddTasksIntent intentMetadata](self, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBAddTasksIntent hasPriority](self, "hasPriority"))
    PBDataWriterWriteInt32Field();
  -[_INPBAddTasksIntent spatialEventTrigger](self, "spatialEventTrigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBAddTasksIntent spatialEventTrigger](self, "spatialEventTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAddTasksIntent targetTaskList](self, "targetTaskList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBAddTasksIntent targetTaskList](self, "targetTaskList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = self->_targetTaskListMembers;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v17);
  }

  if (-[_INPBAddTasksIntent hasTaskReference](self, "hasTaskReference"))
    PBDataWriterWriteInt32Field();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_taskTitles;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v22);
  }

  -[_INPBAddTasksIntent temporalEventTrigger](self, "temporalEventTrigger", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[_INPBAddTasksIntent temporalEventTrigger](self, "temporalEventTrigger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBAddTasksIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAddTasksIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAddTasksIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAddTasksIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAddTasksIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBAddTasksIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAddTasksIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v5 = -[_INPBAddTasksIntent init](+[_INPBAddTasksIntent allocWithZone:](_INPBAddTasksIntent, "allocWithZone:"), "init");
  v6 = -[_INPBContactEventTrigger copyWithZone:](self->_contactEventTrigger, "copyWithZone:", a3);
  -[_INPBAddTasksIntent setContactEventTrigger:](v5, "setContactEventTrigger:", v6);

  v7 = -[_INPBIntent copyWithZone:](self->_intent, "copyWithZone:", a3);
  -[_INPBAddTasksIntent setIntent:](v5, "setIntent:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBAddTasksIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  if (-[_INPBAddTasksIntent hasPriority](self, "hasPriority"))
    -[_INPBAddTasksIntent setPriority:](v5, "setPriority:", -[_INPBAddTasksIntent priority](self, "priority"));
  v9 = -[_INPBSpatialEventTrigger copyWithZone:](self->_spatialEventTrigger, "copyWithZone:", a3);
  -[_INPBAddTasksIntent setSpatialEventTrigger:](v5, "setSpatialEventTrigger:", v9);

  v10 = -[_INPBTaskList copyWithZone:](self->_targetTaskList, "copyWithZone:", a3);
  -[_INPBAddTasksIntent setTargetTaskList:](v5, "setTargetTaskList:", v10);

  v11 = (void *)-[NSArray copyWithZone:](self->_targetTaskListMembers, "copyWithZone:", a3);
  -[_INPBAddTasksIntent setTargetTaskListMembers:](v5, "setTargetTaskListMembers:", v11);

  if (-[_INPBAddTasksIntent hasTaskReference](self, "hasTaskReference"))
    -[_INPBAddTasksIntent setTaskReference:](v5, "setTaskReference:", -[_INPBAddTasksIntent taskReference](self, "taskReference"));
  v12 = (void *)-[NSArray copyWithZone:](self->_taskTitles, "copyWithZone:", a3);
  -[_INPBAddTasksIntent setTaskTitles:](v5, "setTaskTitles:", v12);

  v13 = -[_INPBTemporalEventTrigger copyWithZone:](self->_temporalEventTrigger, "copyWithZone:", a3);
  -[_INPBAddTasksIntent setTemporalEventTrigger:](v5, "setTemporalEventTrigger:", v13);

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
  int v22;
  int priority;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  int taskReference;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  BOOL v51;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  -[_INPBAddTasksIntent contactEventTrigger](self, "contactEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[_INPBAddTasksIntent contactEventTrigger](self, "contactEventTrigger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAddTasksIntent contactEventTrigger](self, "contactEventTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactEventTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_50;
  }
  else
  {

  }
  -[_INPBAddTasksIntent intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[_INPBAddTasksIntent intent](self, "intent");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAddTasksIntent intent](self, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_50;
  }
  else
  {

  }
  -[_INPBAddTasksIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[_INPBAddTasksIntent intentMetadata](self, "intentMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBAddTasksIntent intentMetadata](self, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_50;
  }
  else
  {

  }
  v22 = -[_INPBAddTasksIntent hasPriority](self, "hasPriority");
  if (v22 != objc_msgSend(v4, "hasPriority"))
    goto LABEL_50;
  if (-[_INPBAddTasksIntent hasPriority](self, "hasPriority"))
  {
    if (objc_msgSend(v4, "hasPriority"))
    {
      priority = self->_priority;
      if (priority != objc_msgSend(v4, "priority"))
        goto LABEL_50;
    }
  }
  -[_INPBAddTasksIntent spatialEventTrigger](self, "spatialEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spatialEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[_INPBAddTasksIntent spatialEventTrigger](self, "spatialEventTrigger");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBAddTasksIntent spatialEventTrigger](self, "spatialEventTrigger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spatialEventTrigger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_50;
  }
  else
  {

  }
  -[_INPBAddTasksIntent targetTaskList](self, "targetTaskList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetTaskList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[_INPBAddTasksIntent targetTaskList](self, "targetTaskList");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBAddTasksIntent targetTaskList](self, "targetTaskList");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetTaskList");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_50;
  }
  else
  {

  }
  -[_INPBAddTasksIntent targetTaskListMembers](self, "targetTaskListMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetTaskListMembers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[_INPBAddTasksIntent targetTaskListMembers](self, "targetTaskListMembers");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBAddTasksIntent targetTaskListMembers](self, "targetTaskListMembers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetTaskListMembers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_50;
  }
  else
  {

  }
  v39 = -[_INPBAddTasksIntent hasTaskReference](self, "hasTaskReference");
  if (v39 != objc_msgSend(v4, "hasTaskReference"))
    goto LABEL_50;
  if (-[_INPBAddTasksIntent hasTaskReference](self, "hasTaskReference"))
  {
    if (objc_msgSend(v4, "hasTaskReference"))
    {
      taskReference = self->_taskReference;
      if (taskReference != objc_msgSend(v4, "taskReference"))
        goto LABEL_50;
    }
  }
  -[_INPBAddTasksIntent taskTitles](self, "taskTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[_INPBAddTasksIntent taskTitles](self, "taskTitles");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_INPBAddTasksIntent taskTitles](self, "taskTitles");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskTitles");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_50;
  }
  else
  {

  }
  -[_INPBAddTasksIntent temporalEventTrigger](self, "temporalEventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporalEventTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAddTasksIntent temporalEventTrigger](self, "temporalEventTrigger");
    v46 = objc_claimAutoreleasedReturnValue();
    if (!v46)
    {

LABEL_53:
      v51 = 1;
      goto LABEL_51;
    }
    v47 = (void *)v46;
    -[_INPBAddTasksIntent temporalEventTrigger](self, "temporalEventTrigger");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporalEventTrigger");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if ((v50 & 1) != 0)
      goto LABEL_53;
  }
  else
  {
LABEL_49:

  }
LABEL_50:
  v51 = 0;
LABEL_51:

  return v51;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = -[_INPBContactEventTrigger hash](self->_contactEventTrigger, "hash");
  v4 = -[_INPBIntent hash](self->_intent, "hash");
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBAddTasksIntent hasPriority](self, "hasPriority"))
    v6 = 2654435761 * self->_priority;
  else
    v6 = 0;
  v7 = -[_INPBSpatialEventTrigger hash](self->_spatialEventTrigger, "hash");
  v8 = -[_INPBTaskList hash](self->_targetTaskList, "hash");
  v9 = -[NSArray hash](self->_targetTaskListMembers, "hash");
  if (-[_INPBAddTasksIntent hasTaskReference](self, "hasTaskReference"))
    v10 = 2654435761 * self->_taskReference;
  else
    v10 = 0;
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v12 = v10 ^ -[NSArray hash](self->_taskTitles, "hash");
  return v11 ^ v12 ^ -[_INPBTemporalEventTrigger hash](self->_temporalEventTrigger, "hash");
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
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBAddTasksIntent contactEventTrigger](self, "contactEventTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactEventTrigger"));

  -[_INPBAddTasksIntent intent](self, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intent"));

  -[_INPBAddTasksIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  if (-[_INPBAddTasksIntent hasPriority](self, "hasPriority"))
  {
    v10 = -[_INPBAddTasksIntent priority](self, "priority");
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E228D2D8[v10];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("priority"));

  }
  -[_INPBAddTasksIntent spatialEventTrigger](self, "spatialEventTrigger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("spatialEventTrigger"));

  -[_INPBAddTasksIntent targetTaskList](self, "targetTaskList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("targetTaskList"));

  if (-[NSArray count](self->_targetTaskListMembers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v17 = self->_targetTaskListMembers;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v21), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("targetTaskListMembers"));
  }
  if (-[_INPBAddTasksIntent hasTaskReference](self, "hasTaskReference"))
  {
    v23 = -[_INPBAddTasksIntent taskReference](self, "taskReference");
    if ((_DWORD)v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = CFSTR("CURRENT_ACTIVITY");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("taskReference"));

  }
  if (-[NSArray count](self->_taskTitles, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = self->_taskTitles;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v30), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("taskTitles"));
  }
  -[_INPBAddTasksIntent temporalEventTrigger](self, "temporalEventTrigger");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dictionaryRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("temporalEventTrigger"));

  return v3;
}

- (_INPBContactEventTrigger)contactEventTrigger
{
  return self->_contactEventTrigger;
}

- (_INPBIntent)intent
{
  return self->_intent;
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

- (_INPBTaskList)targetTaskList
{
  return self->_targetTaskList;
}

- (NSArray)targetTaskListMembers
{
  return self->_targetTaskListMembers;
}

- (int)taskReference
{
  return self->_taskReference;
}

- (NSArray)taskTitles
{
  return self->_taskTitles;
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_taskTitles, 0);
  objc_storeStrong((id *)&self->_targetTaskListMembers, 0);
  objc_storeStrong((id *)&self->_targetTaskList, 0);
  objc_storeStrong((id *)&self->_spatialEventTrigger, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_contactEventTrigger, 0);
}

+ (Class)targetTaskListMembersType
{
  return (Class)objc_opt_class();
}

+ (Class)taskTitlesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
