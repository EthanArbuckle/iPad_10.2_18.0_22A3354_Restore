@implementation INTask

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[INTask title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (INTask)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INTask;
  return -[INTask init](&v3, sel_init);
}

- (INTask)initWithTitle:(INSpeakableString *)title status:(INTaskStatus)status taskType:(INTaskType)taskType spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier priority:(INTaskPriority)priority
{
  INSpeakableString *v17;
  INSpatialEventTrigger *v18;
  INTemporalEventTrigger *v19;
  NSDateComponents *v20;
  NSDateComponents *v21;
  NSString *v22;
  INTask *v23;
  uint64_t v24;
  INSpeakableString *v25;
  uint64_t v26;
  INSpatialEventTrigger *v27;
  uint64_t v28;
  INTemporalEventTrigger *v29;
  uint64_t v30;
  NSDateComponents *v31;
  uint64_t v32;
  NSDateComponents *v33;
  uint64_t v34;
  NSString *v35;
  objc_super v37;

  v17 = title;
  v18 = spatialEventTrigger;
  v19 = temporalEventTrigger;
  v20 = createdDateComponents;
  v21 = modifiedDateComponents;
  v22 = identifier;
  v37.receiver = self;
  v37.super_class = (Class)INTask;
  v23 = -[INTask init](&v37, sel_init);
  if (v23)
  {
    v24 = -[INSpeakableString copy](v17, "copy");
    v25 = v23->_title;
    v23->_title = (INSpeakableString *)v24;

    v23->_status = status;
    v26 = -[INSpatialEventTrigger copy](v18, "copy");
    v27 = v23->_spatialEventTrigger;
    v23->_spatialEventTrigger = (INSpatialEventTrigger *)v26;

    v28 = -[INTemporalEventTrigger copy](v19, "copy");
    v29 = v23->_temporalEventTrigger;
    v23->_temporalEventTrigger = (INTemporalEventTrigger *)v28;

    v30 = -[NSDateComponents copy](v20, "copy");
    v31 = v23->_createdDateComponents;
    v23->_createdDateComponents = (NSDateComponents *)v30;

    v32 = -[NSDateComponents copy](v21, "copy");
    v33 = v23->_modifiedDateComponents;
    v23->_modifiedDateComponents = (NSDateComponents *)v32;

    v34 = -[NSString copy](v22, "copy");
    v35 = v23->_identifier;
    v23->_identifier = (NSString *)v34;

    v23->_taskType = taskType;
    v23->_priority = priority;
  }

  return v23;
}

- (INTask)initWithTitle:(id)a3 status:(int64_t)a4 taskType:(int64_t)a5 spatialEventTrigger:(id)a6 temporalEventTrigger:(id)a7 createdDateComponents:(id)a8 modifiedDateComponents:(id)a9 identifier:(id)a10 priority:(int64_t)a11 contactEventTrigger:(id)a12 taskReference:(int64_t)a13 parentIdentifier:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  INTask *v26;
  uint64_t v27;
  INSpeakableString *title;
  uint64_t v29;
  INSpatialEventTrigger *spatialEventTrigger;
  uint64_t v31;
  INTemporalEventTrigger *temporalEventTrigger;
  uint64_t v33;
  NSDateComponents *createdDateComponents;
  uint64_t v35;
  NSDateComponents *modifiedDateComponents;
  uint64_t v37;
  NSString *identifier;
  uint64_t v39;
  INContactEventTrigger *contactEventTrigger;
  uint64_t v41;
  NSString *parentIdentifier;
  id v45;
  objc_super v46;

  v45 = a3;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a12;
  v25 = a14;
  v46.receiver = self;
  v46.super_class = (Class)INTask;
  v26 = -[INTask init](&v46, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v45, "copy");
    title = v26->_title;
    v26->_title = (INSpeakableString *)v27;

    v26->_status = a4;
    v29 = objc_msgSend(v19, "copy");
    spatialEventTrigger = v26->_spatialEventTrigger;
    v26->_spatialEventTrigger = (INSpatialEventTrigger *)v29;

    v31 = objc_msgSend(v20, "copy");
    temporalEventTrigger = v26->_temporalEventTrigger;
    v26->_temporalEventTrigger = (INTemporalEventTrigger *)v31;

    v33 = objc_msgSend(v21, "copy");
    createdDateComponents = v26->_createdDateComponents;
    v26->_createdDateComponents = (NSDateComponents *)v33;

    v35 = objc_msgSend(v22, "copy");
    modifiedDateComponents = v26->_modifiedDateComponents;
    v26->_modifiedDateComponents = (NSDateComponents *)v35;

    v37 = objc_msgSend(v23, "copy");
    identifier = v26->_identifier;
    v26->_identifier = (NSString *)v37;

    v26->_taskType = a5;
    v26->_priority = a11;
    v39 = objc_msgSend(v24, "copy");
    contactEventTrigger = v26->_contactEventTrigger;
    v26->_contactEventTrigger = (INContactEventTrigger *)v39;

    v26->_taskReference = a13;
    v41 = objc_msgSend(v25, "copy");
    parentIdentifier = v26->_parentIdentifier;
    v26->_parentIdentifier = (NSString *)v41;

  }
  return v26;
}

- (INTask)initWithTitle:(INSpeakableString *)title status:(INTaskStatus)status taskType:(INTaskType)taskType spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier
{
  return -[INTask initWithTitle:status:taskType:spatialEventTrigger:temporalEventTrigger:createdDateComponents:modifiedDateComponents:identifier:priority:contactEventTrigger:taskReference:parentIdentifier:](self, "initWithTitle:status:taskType:spatialEventTrigger:temporalEventTrigger:createdDateComponents:modifiedDateComponents:identifier:priority:contactEventTrigger:taskReference:parentIdentifier:", title, status, taskType, spatialEventTrigger, temporalEventTrigger, createdDateComponents, modifiedDateComponents, identifier, 0, 0, 0, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  NSUInteger v18;

  v3 = -[INSpeakableString hash](self->_title, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[INSpatialEventTrigger hash](self->_spatialEventTrigger, "hash");
  v7 = v5 ^ v6 ^ -[INTemporalEventTrigger hash](self->_temporalEventTrigger, "hash");
  v8 = -[NSDateComponents hash](self->_createdDateComponents, "hash");
  v9 = v8 ^ -[NSDateComponents hash](self->_modifiedDateComponents, "hash");
  v10 = v9 ^ -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_taskType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7 ^ v10 ^ objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_priority);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  v15 = v14 ^ -[INContactEventTrigger hash](self->_contactEventTrigger, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_taskReference);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12 ^ v15 ^ objc_msgSend(v16, "hash");
  v18 = v17 ^ -[NSString hash](self->_parentIdentifier, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  INTask *v4;
  INTask *v5;
  INSpeakableString *title;
  INSpatialEventTrigger *spatialEventTrigger;
  INTemporalEventTrigger *temporalEventTrigger;
  NSDateComponents *createdDateComponents;
  NSDateComponents *modifiedDateComponents;
  NSString *identifier;
  INContactEventTrigger *contactEventTrigger;
  NSString *parentIdentifier;
  BOOL v14;

  v4 = (INTask *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      title = self->_title;
      v14 = 0;
      if ((title == v5->_title || -[INSpeakableString isEqual:](title, "isEqual:")) && self->_status == v5->_status)
      {
        spatialEventTrigger = self->_spatialEventTrigger;
        if (spatialEventTrigger == v5->_spatialEventTrigger
          || -[INSpatialEventTrigger isEqual:](spatialEventTrigger, "isEqual:"))
        {
          temporalEventTrigger = self->_temporalEventTrigger;
          if (temporalEventTrigger == v5->_temporalEventTrigger
            || -[INTemporalEventTrigger isEqual:](temporalEventTrigger, "isEqual:"))
          {
            createdDateComponents = self->_createdDateComponents;
            if (createdDateComponents == v5->_createdDateComponents
              || -[NSDateComponents isEqual:](createdDateComponents, "isEqual:"))
            {
              modifiedDateComponents = self->_modifiedDateComponents;
              if (modifiedDateComponents == v5->_modifiedDateComponents
                || -[NSDateComponents isEqual:](modifiedDateComponents, "isEqual:"))
              {
                identifier = self->_identifier;
                if ((identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
                  && self->_taskType == v5->_taskType
                  && self->_priority == v5->_priority)
                {
                  contactEventTrigger = self->_contactEventTrigger;
                  if ((contactEventTrigger == v5->_contactEventTrigger
                     || -[INContactEventTrigger isEqual:](contactEventTrigger, "isEqual:"))
                    && self->_taskReference == v5->_taskReference)
                  {
                    parentIdentifier = self->_parentIdentifier;
                    if (parentIdentifier == v5->_parentIdentifier
                      || -[NSString isEqual:](parentIdentifier, "isEqual:"))
                    {
                      v14 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (INTask)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  INTask *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("status"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spatialEventTrigger"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("temporalEventTrigger"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDateComponents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedDateComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("taskType"));
  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("priority"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactEventTrigger"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("taskReference"));
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("parentIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[INTask initWithTitle:status:taskType:spatialEventTrigger:temporalEventTrigger:createdDateComponents:modifiedDateComponents:identifier:priority:contactEventTrigger:taskReference:parentIdentifier:](self, "initWithTitle:status:taskType:spatialEventTrigger:temporalEventTrigger:createdDateComponents:modifiedDateComponents:identifier:priority:contactEventTrigger:taskReference:parentIdentifier:", v23, v22, v10, v21, v20, v4, v5, v9, v11, v12, v13, v17);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spatialEventTrigger, CFSTR("spatialEventTrigger"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_temporalEventTrigger, CFSTR("temporalEventTrigger"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdDateComponents, CFSTR("createdDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modifiedDateComponents, CFSTR("modifiedDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_taskType, CFSTR("taskType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactEventTrigger, CFSTR("contactEventTrigger"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_taskReference, CFSTR("taskReference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parentIdentifier, CFSTR("parentIdentifier"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int64_t status;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t taskType;
  const __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  int64_t priority;
  const __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_title);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("title"));

  status = self->_status;
  v10 = CFSTR("unknown");
  if (status == 2)
    v10 = CFSTR("completed");
  if (status == 1)
    v11 = CFSTR("notCompleted");
  else
    v11 = (__CFString *)v10;
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("status"));

  objc_msgSend(v6, "encodeObject:", self->_spatialEventTrigger);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("spatialEventTrigger"));

  objc_msgSend(v6, "encodeObject:", self->_temporalEventTrigger);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("temporalEventTrigger"));

  objc_msgSend(v6, "encodeObject:", self->_createdDateComponents);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("createdDateComponents"));

  objc_msgSend(v6, "encodeObject:", self->_modifiedDateComponents);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("modifiedDateComponents"));

  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("identifier"));

  taskType = self->_taskType;
  v19 = CFSTR("unknown");
  if (taskType == 2)
    v19 = CFSTR("completable");
  if (taskType == 1)
    v20 = CFSTR("notCompletable");
  else
    v20 = (__CFString *)v19;
  v21 = v20;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, CFSTR("taskType"));

  priority = self->_priority;
  v23 = CFSTR("unknown");
  if (priority == 2)
    v23 = CFSTR("flagged");
  if (priority == 1)
    v24 = CFSTR("notFlagged");
  else
    v24 = (__CFString *)v23;
  v25 = v24;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, CFSTR("priority"));

  objc_msgSend(v6, "encodeObject:", self->_contactEventTrigger);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v26, CFSTR("contactEventTrigger"));

  if (self->_taskReference == 1)
    v27 = CFSTR("currentActivity");
  else
    v27 = CFSTR("unknown");
  v28 = v27;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v28, CFSTR("taskReference"));

  objc_msgSend(v6, "encodeObject:", self->_parentIdentifier);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v29, CFSTR("parentIdentifier"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INTask descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INTask;
  -[INTask description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTask _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t title;
  uint64_t spatialEventTrigger;
  uint64_t temporalEventTrigger;
  NSDateComponents *createdDateComponents;
  uint64_t v7;
  NSDateComponents *modifiedDateComponents;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  void *v12;
  void *v13;
  INContactEventTrigger *contactEventTrigger;
  void *v15;
  void *v16;
  NSString *parentIdentifier;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[12];
  _QWORD v32[14];

  v32[12] = *MEMORY[0x1E0C80C00];
  title = (uint64_t)self->_title;
  v30 = title;
  v31[0] = CFSTR("title");
  if (!title)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    title = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)title;
  v32[0] = title;
  v31[1] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v29;
  v31[2] = CFSTR("spatialEventTrigger");
  spatialEventTrigger = (uint64_t)self->_spatialEventTrigger;
  v28 = spatialEventTrigger;
  if (!spatialEventTrigger)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    spatialEventTrigger = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)spatialEventTrigger;
  v32[2] = spatialEventTrigger;
  v31[3] = CFSTR("temporalEventTrigger");
  temporalEventTrigger = (uint64_t)self->_temporalEventTrigger;
  v27 = temporalEventTrigger;
  if (!temporalEventTrigger)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    temporalEventTrigger = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)temporalEventTrigger;
  v32[3] = temporalEventTrigger;
  v31[4] = CFSTR("createdDateComponents");
  createdDateComponents = self->_createdDateComponents;
  v7 = (uint64_t)createdDateComponents;
  if (!createdDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v7;
  v32[4] = v7;
  v31[5] = CFSTR("modifiedDateComponents");
  modifiedDateComponents = self->_modifiedDateComponents;
  v9 = (uint64_t)modifiedDateComponents;
  if (!modifiedDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v9;
  v32[5] = v9;
  v31[6] = CFSTR("identifier");
  identifier = self->_identifier;
  v11 = (uint64_t)identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v11;
  v32[6] = v11;
  v31[7] = CFSTR("taskType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_taskType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v12;
  v31[8] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_priority);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v13;
  v31[9] = CFSTR("contactEventTrigger");
  contactEventTrigger = self->_contactEventTrigger;
  v15 = contactEventTrigger;
  if (!contactEventTrigger)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[9] = v15;
  v31[10] = CFSTR("taskReference");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_taskReference);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v16;
  v31[11] = CFSTR("parentIdentifier");
  parentIdentifier = self->_parentIdentifier;
  v18 = parentIdentifier;
  if (!parentIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[11] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 12);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (!parentIdentifier)

  if (!contactEventTrigger)
  if (identifier)
  {
    if (modifiedDateComponents)
      goto LABEL_23;
LABEL_32:

    if (createdDateComponents)
      goto LABEL_24;
    goto LABEL_33;
  }

  if (!modifiedDateComponents)
    goto LABEL_32;
LABEL_23:
  if (createdDateComponents)
    goto LABEL_24;
LABEL_33:

LABEL_24:
  if (!v27)

  if (!v28)
  if (!v30)

  return v26;
}

- (INSpeakableString)title
{
  return self->_title;
}

- (INTaskStatus)status
{
  return self->_status;
}

- (INSpatialEventTrigger)spatialEventTrigger
{
  return self->_spatialEventTrigger;
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (NSDateComponents)createdDateComponents
{
  return self->_createdDateComponents;
}

- (NSDateComponents)modifiedDateComponents
{
  return self->_modifiedDateComponents;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (INTaskType)taskType
{
  return self->_taskType;
}

- (INTaskPriority)priority
{
  return self->_priority;
}

- (INContactEventTrigger)contactEventTrigger
{
  return self->_contactEventTrigger;
}

- (int64_t)taskReference
{
  return self->_taskReference;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_contactEventTrigger, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedDateComponents, 0);
  objc_storeStrong((id *)&self->_createdDateComponents, 0);
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_spatialEventTrigger, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("status"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = INTaskStatusWithString(v11);

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("spatialEventTrigger"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("temporalEventTrigger"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v14, v15);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("createdDateComponents"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modifiedDateComponents"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("taskType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = INTaskTypeWithString(v23);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("priority"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = INTaskPriorityWithString(v25);

    v27 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("contactEventTrigger"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("taskReference"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("currentActivity"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("parentIdentifier"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend([v39 alloc], "initWithTitle:status:taskType:spatialEventTrigger:temporalEventTrigger:createdDateComponents:modifiedDateComponents:identifier:priority:contactEventTrigger:taskReference:parentIdentifier:", v38, v37, v24, v35, v36, v18, v21, v22, v26, v29, v31, v32);

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (INTask)initWithTitle:(id)a3 status:(int64_t)a4 taskType:(int64_t)a5 spatialEventTrigger:(id)a6 temporalEventTrigger:(id)a7 createdDateComponents:(id)a8 modifiedDateComponents:(id)a9 identifier:(id)a10 contactEventTrigger:(id)a11 taskReference:(int64_t)a12
{
  return -[INTask initWithTitle:status:taskType:spatialEventTrigger:temporalEventTrigger:createdDateComponents:modifiedDateComponents:identifier:priority:contactEventTrigger:taskReference:parentIdentifier:](self, "initWithTitle:status:taskType:spatialEventTrigger:temporalEventTrigger:createdDateComponents:modifiedDateComponents:identifier:priority:contactEventTrigger:taskReference:parentIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11, a12, 0);
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INTask contactEventTrigger](self, "contactEventTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_cacheableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  if (objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INTask contactEventTrigger](self, "contactEventTrigger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

}

@end
