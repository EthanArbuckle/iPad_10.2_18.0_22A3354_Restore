@implementation _DKChangeSet

- (_DKChangeSet)initWithEventsToAdd:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  return -[_DKChangeSet initWithEventsToAdd:eventIDsToDelete:deviceIdentifier:sequenceNumber:startDate:endDate:type:](self, "initWithEventsToAdd:eventIDsToDelete:deviceIdentifier:sequenceNumber:startDate:endDate:type:", a3, 0, a4, a5, a6, a7, CFSTR("addition"));
}

- (_DKChangeSet)initWithEventIDsToDelete:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  return -[_DKChangeSet initWithEventsToAdd:eventIDsToDelete:deviceIdentifier:sequenceNumber:startDate:endDate:type:](self, "initWithEventsToAdd:eventIDsToDelete:deviceIdentifier:sequenceNumber:startDate:endDate:type:", 0, a3, a4, a5, a6, a7, CFSTR("deletion"));
}

- (_DKChangeSet)initWithEventsToAdd:(id)a3 eventIDsToDelete:(id)a4 deviceIdentifier:(id)a5 sequenceNumber:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  _DKChangeSet *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v11, "count");
  v14 = CFSTR("deletion");
  if (!v13)
    v14 = CFSTR("addition");
  v15 = -[_DKChangeSet initWithEventsToAdd:eventIDsToDelete:deviceIdentifier:sequenceNumber:startDate:endDate:type:](self, "initWithEventsToAdd:eventIDsToDelete:deviceIdentifier:sequenceNumber:startDate:endDate:type:", v12, v11, v10, a6, 0, 0, v14);

  return v15;
}

- (_DKChangeSet)initWithEventsToAdd:(id)a3 eventIDsToDelete:(id)a4 deviceIdentifier:(id)a5 sequenceNumber:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 type:(id)a9
{
  id v15;
  id v16;
  id v17;
  _DKChangeSet *v18;
  _DKChangeSet *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)_DKChangeSet;
  v18 = -[_DKChangeSet init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventsToAdd, a3);
    objc_storeStrong((id *)&v19->_eventIDsToDelete, a4);
    objc_storeStrong((id *)&v19->_deviceIdentifier, a5);
    v19->_sequenceNumber = a6;
    objc_storeStrong((id *)&v19->_startDate, a7);
    objc_storeStrong((id *)&v19->_endDate, a8);
    objc_storeStrong((id *)&v19->_type, a9);
  }

  return v19;
}

+ (id)_createFromData:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _DKPRChangeSet *v15;
  void *v16;
  void *v17;
  const __CFString *v18;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[_DKPRChangeSet initWithData:]([_DKPRChangeSet alloc], "initWithData:", v14);

  +[_DKChangeSet fromPBCodable:](_DKChangeSet, "fromPBCodable:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDeviceIdentifier:", v13);

  objc_msgSend(v16, "setSequenceNumber:", a5);
  objc_msgSend(v16, "setStartDate:", v12);

  objc_msgSend(v16, "setEndDate:", v11);
  objc_msgSend(v16, "eventIDsToDelete");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
    v18 = CFSTR("deletion");
  else
    v18 = CFSTR("addition");
  objc_msgSend(v16, "setType:", v18);

  return v16;
}

+ (id)createFromData:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "_createFromData:deviceIdentifier:sequenceNumber:startDate:endDate:", a3, a4, a5, 0, 0);
}

- (id)asData
{
  void *v2;
  void *v3;

  -[_DKChangeSet toPBCodable](self, "toPBCodable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSUUID *deviceIdentifier;
  NSDate *startDate;
  NSDate *endDate;
  void *v10;
  _BOOL4 v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  NSUUID *v15;
  NSDate *v16;
  NSDate *v17;
  void *v18;

  if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("addition")))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceNumber);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    deviceIdentifier = self->_deviceIdentifier;
    startDate = self->_startDate;
    endDate = self->_endDate;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_eventsToAdd, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:{ sequenceNumber=%@; deviceIdentifier=%@; startDate=%@; endDate=%@; eventsToAdd.count=%@; eventsToAdd=%@; }"),
      v5,
      v6,
      deviceIdentifier,
      startDate,
      endDate,
      v10,
      self->_eventsToAdd);
  }
  else
  {
    v11 = -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("deletion"));
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceNumber);
    v14 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v14;
    v15 = self->_deviceIdentifier;
    v16 = self->_startDate;
    v17 = self->_endDate;
    if (!v11)
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:{ sequenceNumber=%@; deviceIdentifier=%@; startDate=%@; endDate=%@; type=%@; }"),
        v5,
        v14,
        v15,
        v16,
        self->_endDate,
        self->_type);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_eventIDsToDelete, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:{ sequenceNumber=%@; deviceIdentifier=%@; startDate=%@; endDate=%@; eventIDsToDelete.count=%@; eventIDsToDelete=%@; }"),
      v5,
      v6,
      v15,
      v16,
      v17,
      v10,
      self->_eventIDsToDelete);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v18;
}

- (NSArray)eventsToAdd
{
  return self->_eventsToAdd;
}

- (void)setEventsToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_eventsToAdd, a3);
}

- (NSArray)eventIDsToDelete
{
  return self->_eventIDsToDelete;
}

- (void)setEventIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_eventIDsToDelete, a3);
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_eventIDsToDelete, 0);
  objc_storeStrong((id *)&self->_eventsToAdd, 0);
}

- (id)toPBCodable
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _DKPRChangeSet *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[_DKChangeSet eventsToAdd](self, "eventsToAdd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

  }
  else
  {
    -[_DKChangeSet eventIDsToDelete](self, "eventIDsToDelete");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      return 0;
  }
  -[_DKChangeSet eventIDsToDelete](self, "eventIDsToDelete");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = objc_alloc_init(_DKPRChangeSet);
  v9 = (void *)MEMORY[0x1E0C99DE8];
  if (v7)
  {
    -[_DKChangeSet eventIDsToDelete](self, "eventIDsToDelete");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[_DKChangeSet eventIDsToDelete](self, "eventIDsToDelete", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v14);
    }

    -[_DKPRChangeSet setDeleteEventIDs:]((uint64_t)v8, v11);
  }
  else
  {
    -[_DKChangeSet eventsToAdd](self, "eventsToAdd");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[_DKChangeSet eventsToAdd](self, "eventsToAdd");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "toPBCodable");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v21);
    }

    -[_DKPRChangeSet setEvents:]((uint64_t)v8, v11);
  }

  return v8;
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[_DKPRChangeSet events]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {

    }
    else
    {
      -[_DKPRChangeSet deleteEventIDs]((uint64_t)v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (!v8)
      {
        v6 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    -[_DKPRChangeSet deleteEventIDs]((uint64_t)v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = (void *)MEMORY[0x1E0C99DE8];
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[_DKPRChangeSet deleteEventIDs]((uint64_t)v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v30;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v17);
            v19 = objc_alloc(MEMORY[0x1E0CB3A28]);
            v20 = (void *)objc_msgSend(v19, "initWithUUIDString:", v18, (_QWORD)v29);
            objc_msgSend(v12, "addObject:", v20);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v15);
      }

      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setEventIDsToDelete:", v12);
    }
    else
    {
      -[_DKPRChangeSet events]((uint64_t)v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v21, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[_DKPRChangeSet events]((uint64_t)v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v34;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v34 != v25)
              objc_enumerationMutation(v22);
            +[_DKEvent fromPBCodable:](_DKEvent, "fromPBCodable:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v26));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v27);

            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v24);
      }

      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setEventsToAdd:", v12);
    }

    goto LABEL_24;
  }
  v6 = 0;
LABEL_25:

  return v6;
}

- (_DKChangeSet)initWithManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _DKChangeSet *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  objc_msgSend(v4, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToNumber:", &unk_1E272B0E0);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "version");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToNumber:", &unk_1E272B0F8);

    if (v13)
    {
      v14 = (void *)objc_opt_class();
      objc_msgSend(v4, "changeSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataFromCompressedChangeSet:", v15);
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_6;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DKChangeSet(CoreData) initWithManagedObject:].cold.1(v10, v21, v22, v23, v24, v25, v26, v27);
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DKChangeSet(CoreData) initWithManagedObject:].cold.2(v4, v10);
    }
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "changeSet");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
LABEL_6:
    v16 = (void *)objc_opt_class();
    objc_msgSend(v4, "sequenceNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");
    objc_msgSend(v4, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createFromData:deviceIdentifier:sequenceNumber:startDate:endDate:", v10, v7, v18, v19, v20);
    v11 = (_DKChangeSet *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    goto LABEL_13;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (id)dataFromCompressedChangeSet:(id)a3
{
  id v3;
  _DKPRCompressedChangeSet *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  size_t v9;
  uint8_t *v10;
  id v11;
  const uint8_t *v12;
  void *v13;
  size_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v25;

  v3 = a3;
  v4 = -[_DKPRCompressedChangeSet initWithData:]([_DKPRCompressedChangeSet alloc], "initWithData:", v3);

  if (!-[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v4))
    goto LABEL_6;
  -[_DKPRCompressedChangeSet compressedData]((uint64_t)v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[_DKPRCompressedChangeSet compressedData]((uint64_t)v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        !v8))
  {
LABEL_6:
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[_DKChangeSet(CoreData) dataFromCompressedChangeSet:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    goto LABEL_9;
  }
  v9 = -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v4) + 32;
  v10 = (uint8_t *)malloc_type_malloc(v9, 0xB9AB5C42uLL);
  -[_DKPRCompressedChangeSet compressedData]((uint64_t)v4);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const uint8_t *)objc_msgSend(v11, "bytes");
  -[_DKPRCompressedChangeSet compressedData]((uint64_t)v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = compression_decode_buffer(v10, v9, v12, objc_msgSend(v13, "length"), 0, COMPRESSION_LZFSE);

  if (v14 != -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v4))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[_DKChangeSet(CoreData) dataFromCompressedChangeSet:].cold.2(v14, (uint64_t)v4, v25);

    free(v10);
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

+ (id)additionChangeSetEntityName
{
  return CFSTR("AdditionChangeSet");
}

+ (id)deletionChangeSetEntityName
{
  return CFSTR("DeletionChangeSet");
}

- (id)insertInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  size_t v9;
  uint8_t *v10;
  id v11;
  size_t v12;
  size_t v13;
  _DKPRCompressedChangeSet *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DKChangeSet asData](self, "asData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_14;
  -[_DKChangeSet eventsToAdd](self, "eventsToAdd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") && (unint64_t)objc_msgSend(v5, "length") >= 0x401)
  {

  }
  else
  {
    -[_DKChangeSet eventIDsToDelete](self, "eventIDsToDelete");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {

      goto LABEL_14;
    }
    v8 = objc_msgSend(v5, "length");

    if (v8 < 0x801)
    {
LABEL_14:
      v16 = 0;
      goto LABEL_15;
    }
  }
  v9 = objc_msgSend(v5, "length");
  v10 = (uint8_t *)malloc_type_malloc(v9, 0xCE4F8FAuLL);
  v11 = objc_retainAutorelease(v5);
  v12 = compression_encode_buffer(v10, v9, (const uint8_t *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 0, COMPRESSION_LZFSE);
  if (!v12 || (v13 = v12, v12 >= objc_msgSend(v11, "length")))
  {
    free(v10);
    goto LABEL_14;
  }
  v14 = objc_alloc_init(_DKPRCompressedChangeSet);
  -[_DKPRCompressedChangeSet setUncompressedLength:]((uint64_t)v14, objc_msgSend(v11, "length"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRCompressedChangeSet setCompressedData:]((uint64_t)v14, v15);

  -[_DKPRCompressedChangeSet data](v14, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[_DKChangeSet eventIDsToDelete](self, "eventIDsToDelete");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "count"))
        v30 = CFSTR("Deletion");
      else
        v30 = CFSTR("Addition");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v30;
      v36 = 2112;
      v37 = v31;
      v38 = 2112;
      v39 = v32;
      _os_log_debug_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEBUG, "%@ change set compressed to %@ (from %@)", buf, 0x20u);

    }
  }
LABEL_15:
  -[_DKChangeSet eventIDsToDelete](self, "eventIDsToDelete");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
    +[_DKChangeSet deletionChangeSetEntityName](_DKChangeSet, "deletionChangeSetEntityName");
  else
    +[_DKChangeSet additionChangeSetEntityName](_DKChangeSet, "additionChangeSetEntityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", v19, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v16)
    v22 = v16;
  else
    v22 = v5;
  if (v16)
    v23 = &unk_1E272B0F8;
  else
    v23 = &unk_1E272B0E0;
  objc_msgSend(v20, "setChangeSet:", v22);
  -[_DKChangeSet deviceIdentifier](self, "deviceIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDeviceIdentifier:", v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKChangeSet sequenceNumber](self, "sequenceNumber"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSequenceNumber:", v26);

  -[_DKChangeSet startDate](self, "startDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStartDate:", v27);

  -[_DKChangeSet endDate](self, "endDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setEndDate:", v28);

  objc_msgSend(v21, "setVersion:", v23);
  objc_msgSend(v4, "insertObject:", v21);

  return v21;
}

@end
