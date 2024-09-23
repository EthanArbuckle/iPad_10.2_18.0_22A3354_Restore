@implementation SGStorageReminder

- (SGStorageReminder)initWithRecordId:(id)a3 duplicateKey:(id)a4 sourceKey:(id)a5 origin:(id)a6 dueDate:(id)a7 dueLocationType:(unsigned __int8)a8 dueLocation:(id)a9 dueLocationTrigger:(unsigned __int8)a10 title:(id)a11 reminderStatus:(unsigned __int8)a12 contactIdentifier:(id)a13 creationDate:(id)a14
{
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SGStorageReminder *v28;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id obj;
  id v35;
  void *v36;
  unsigned int v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v37 = a8;
  v43 = a3;
  obj = a4;
  v42 = a4;
  v35 = a5;
  v39 = a5;
  v20 = a6;
  v38 = a7;
  v21 = a9;
  v22 = a11;
  v41 = a13;
  v40 = a14;
  v36 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStorageReminder.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  objc_msgSend(v20, "universalURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", &stru_1E7DB83A8);
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "externalKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStorageReminder.m"), 47, CFSTR("SGStorageReminder failed to create sourceURL from %@"), v32);

      v23 = 0;
    }
  }
  objc_msgSend(v21, "convertToLocationWithId:origin:", v43, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "pseudoReminderKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "serialize");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "serialize");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44.receiver = self;
  v44.super_class = (Class)SGStorageReminder;
  LOBYTE(v33) = a10;
  v28 = -[SGReminder initWithRecordId:origin:title:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:opaqueKey:uniqueKey:contactIdentifier:creationDate:](&v44, sel_initWithRecordId_origin_title_dueDateComponents_dueLocationType_dueLocation_dueLocationTrigger_sourceURL_reminderStatus_opaqueKey_uniqueKey_contactIdentifier_creationDate_, v43, v20, v36, v38, v37, v24, v33, v23, a12, v26, v27, v41, v40);

  if (v28)
  {
    objc_storeStrong((id *)&v28->_duplicateKey, obj);
    objc_storeStrong((id *)&v28->_sourceKey, v35);
    objc_storeStrong((id *)&v28->_dueStorageLocation, a9);
  }

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  SGStorageReminder *v4;
  SGStorageReminder *v5;
  BOOL v6;

  v4 = (SGStorageReminder *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGStorageReminder isEqualToStorageReminder:](self, "isEqualToStorageReminder:", v5);

  return v6;
}

- (BOOL)isEqualToStorageReminder:(id)a3
{
  id *v4;
  SGDuplicateKey *duplicateKey;
  SGDuplicateKey *v6;
  SGDuplicateKey *v7;
  SGDuplicateKey *v8;
  BOOL v9;
  NSString *sourceKey;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  char v15;
  SGStorageLocation *v16;
  SGStorageLocation *v17;
  objc_super v19;

  v4 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)SGStorageReminder;
  if (!-[SGReminder isEqual:](&v19, sel_isEqual_, v4))
    goto LABEL_8;
  duplicateKey = self->_duplicateKey;
  v6 = (SGDuplicateKey *)v4[12];
  if (duplicateKey == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = duplicateKey;
    v9 = -[SGDuplicateKey isEqual:](v8, "isEqual:", v7);

    if (!v9)
      goto LABEL_8;
  }
  sourceKey = self->_sourceKey;
  v11 = (NSString *)v4[14];
  if (sourceKey == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = sourceKey;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
    {
LABEL_8:
      v15 = 0;
      goto LABEL_14;
    }
  }
  v16 = self->_dueStorageLocation;
  v17 = v16;
  if (v16 == v4[13])
    v15 = 1;
  else
    v15 = -[SGStorageLocation isEqual:](v16, "isEqual:");

LABEL_14:
  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGStorageReminder;
  v3 = -[SGReminder hash](&v6, sel_hash);
  v4 = -[SGDuplicateKey hash](self->_duplicateKey, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_sourceKey, "hash") - v4 + 32 * v4;
}

- (id)description
{
  id v3;
  void *v4;
  SGDuplicateKey *duplicateKey;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGReminder title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  duplicateKey = self->_duplicateKey;
  -[SGReminder dueDateComponents](self, "dueDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReminder dueLocation](self, "dueLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19928], "describeReminderStatus:", -[SGReminder reminderStatus](self, "reminderStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGStorageReminder title:%@ dupKey:%@ dueDate:%@ dueLocation: %@ reminderStatus: %@>"), v4, duplicateKey, v6, v7, v8);

  return v9;
}

- (id)toReminder
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc(MEMORY[0x1E0D19928]);
  -[SGObject recordId](self, "recordId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGObject origin](self, "origin");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReminder title](self, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReminder dueDateComponents](self, "dueDateComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SGReminder dueLocationType](self, "dueLocationType");
  -[SGReminder dueLocation](self, "dueLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SGReminder dueLocationTrigger](self, "dueLocationTrigger");
  -[SGReminder sourceURL](self, "sourceURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGReminder reminderStatus](self, "reminderStatus");
  -[SGReminder opaqueKey](self, "opaqueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageReminder duplicateKey](self, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReminder contactIdentifier](self, "contactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReminder creationDate](self, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = v6;
  LOBYTE(v13) = v5;
  v18 = (id)objc_msgSend(v3, "initWithRecordId:origin:title:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:opaqueKey:uniqueKey:contactIdentifier:creationDate:", v4, v21, v20, v19, v17, v16, v13, v15, v14, v7, v9, v10, v11);

  return v18;
}

- (int64_t)commitWithStore:(id)a3
{
  return objc_msgSend(a3, "commitStorageReminder:", self);
}

- (id)loggingIdentifier
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  if (self->_duplicateKey)
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu"), -[SGDuplicateKey hash](self->_duplicateKey, "hash"));
  else
    v2 = &stru_1E7DB83A8;
  if ((unint64_t)-[__CFString length](v2, "length") > 0xC)
  {
    -[__CFString substringWithRange:](v2, "substringWithRange:", 0, 12);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (SGDuplicateKey)duplicateKey
{
  return self->_duplicateKey;
}

- (SGStorageLocation)dueStorageLocation
{
  return self->_dueStorageLocation;
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_dueStorageLocation, 0);
  objc_storeStrong((id *)&self->_duplicateKey, 0);
}

+ (id)storageReminderFromRecordId:(id)a3 store:(id)a4
{
  return (id)objc_msgSend(a4, "getReminderWithRecordId:", a3);
}

+ (id)storageReminderFromEntity:(id)a3 store:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0D198C8];
  v9 = a4;
  objc_msgSend(v7, "duplicateKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originForDuplicateKey:sourceKey:store:", v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGStorageReminder.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

  }
  objc_msgSend(a1, "storageReminderFromEntity:origin:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)storageReminderFromDuplicateKey:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  SGStorageLocation *v29;
  SGStorageReminder *v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  SGStorageLocation *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  unsigned int v47;
  SGStorageReminder *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "getReminderWithDuplicateKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordId");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceKey");
  v52 = v7;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D198C8], "originForDuplicateKey:sourceKey:store:", v7);
  v10 = objc_claimAutoreleasedReturnValue();

  v49 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGStorageReminder.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

  }
  objc_msgSend(v9, "dueLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "dueLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v12, "locationType");

    v42 = [SGStorageLocation alloc];
    objc_msgSend(v9, "dueLocation");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "label");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dueLocation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dueLocation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "airportCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dueLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "latitude");
    v17 = v16;
    objc_msgSend(v9, "dueLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "longitude");
    v20 = v19;
    objc_msgSend(v9, "dueLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accuracy");
    v23 = v22;
    objc_msgSend(v9, "dueLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "quality");
    v26 = v25;
    objc_msgSend(v9, "dueLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](v42, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v43, v41, v13, v14, v28, v17, v20, v23, v26);

  }
  else
  {
    v29 = 0;
  }
  v30 = [SGStorageReminder alloc];
  objc_msgSend(v9, "dueDateComponents");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v9, "dueLocationType");
  v32 = objc_msgSend(v9, "dueLocationTrigger");
  objc_msgSend(v9, "title");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v9, "reminderStatus");
  objc_msgSend(v9, "contactIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "creationDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v40) = v34;
  LOBYTE(v39) = v32;
  v48 = -[SGStorageReminder initWithRecordId:duplicateKey:sourceKey:origin:dueDate:dueLocationType:dueLocation:dueLocationTrigger:title:reminderStatus:contactIdentifier:creationDate:](v30, "initWithRecordId:duplicateKey:sourceKey:origin:dueDate:dueLocationType:dueLocation:dueLocationTrigger:title:reminderStatus:contactIdentifier:creationDate:", v51, v52, v50, v49, v31, v47, v29, v39, v33, v40, v35, v36);

  return v48;
}

+ (id)storageReminderFromEntity:(id)a3 origin:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  SGStorageReminder *v49;
  uint64_t v50;
  void *v51;
  char v52;
  SGStorageReminder *v53;
  id obj;
  id obja;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v46 = a4;
  v47 = v5;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v5, "tags");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v56 = 0;
    v9 = 0;
    v10 = 0;
    v52 = 0;
    v11 = *(_QWORD *)v58;
    v50 = *MEMORY[0x1E0D19D58];
    v48 = *MEMORY[0x1E0D19D48];
    v12 = *MEMORY[0x1E0D19D50];
    v13 = *MEMORY[0x1E0D19D40];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v58 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v15, "isReminderMetadata"))
        {
          objc_msgSend(v15, "reminderMetadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v50);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v17, "unsignedIntegerValue");

          objc_msgSend(v16, "objectForKeyedSubscript:", v48);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v18, "unsignedIntegerValue");

          objc_msgSend(v16, "objectForKeyedSubscript:", v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v19, "unsignedIntegerValue");

          objc_msgSend(v16, "objectForKeyedSubscript:", v13);
          v20 = objc_claimAutoreleasedReturnValue();

          v56 = (void *)v20;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v15, "isEqualToEntityTag:", v21);

          v9 |= v22;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v56 = 0;
    v9 = 0;
    v10 = 0;
    v52 = 0;
  }

  objc_msgSend(v47, "timeRange");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "startDateComponents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 & 1) != 0)
  {
    v25 = (void *)objc_opt_new();

    objc_msgSend(v47, "timeRange");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startDateComponents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "calendar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCalendar:", v28);

    objc_msgSend(v47, "timeRange");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "startDateComponents");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setYear:", objc_msgSend(v30, "year"));

    objc_msgSend(v47, "timeRange");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "startDateComponents");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMonth:", objc_msgSend(v32, "month"));

    objc_msgSend(v47, "timeRange");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "startDateComponents");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDay:", objc_msgSend(v34, "day"));

    obja = v25;
  }
  else
  {
    obja = v24;
  }
  v49 = [SGStorageReminder alloc];
  objc_msgSend(v47, "recordId");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "duplicateKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sourceKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "locations");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "allObjects");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "title");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v47, "creationTimestamp");
  objc_msgSend(v39, "dateWithTimeIntervalSince1970:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v43) = v52;
  LOBYTE(v42) = v10;
  v53 = -[SGStorageReminder initWithRecordId:duplicateKey:sourceKey:origin:dueDate:dueLocationType:dueLocation:dueLocationTrigger:title:reminderStatus:contactIdentifier:creationDate:](v49, "initWithRecordId:duplicateKey:sourceKey:origin:dueDate:dueLocationType:dueLocation:dueLocationTrigger:title:reminderStatus:contactIdentifier:creationDate:", v45, v35, v36, v46, obja, v8, v37, v42, v38, v43, v56, v40);

  return v53;
}

+ (SGStorageReminder)storageReminderWithPrimaryKey:(int64_t)a3 store:(id)a4
{
  return (SGStorageReminder *)objc_msgSend(a4, "getReminder:", a3);
}

@end
