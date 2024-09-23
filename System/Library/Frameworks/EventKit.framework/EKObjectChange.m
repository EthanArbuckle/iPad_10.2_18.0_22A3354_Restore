@implementation EKObjectChange

- (EKObjectChange)initWithChangeProperties:(id)a3
{
  id v4;
  EKObjectChange *v5;
  uint64_t v6;
  EKObjectID *changedObjectID;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKObjectChange;
  v5 = -[EKObjectChange init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("record"));
    v6 = objc_claimAutoreleasedReturnValue();
    changedObjectID = v5->_changedObjectID;
    v5->_changedObjectID = (EKObjectID *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_changeType = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ROWID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_changeID = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequence_number"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sequenceNumber = objc_msgSend(v10, "integerValue");

  }
  return v5;
}

+ (id)CADObjectChangeIDsFromEKObjectChanges:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "changedObjectID", (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "databaseID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

        }
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAE8]), "initWithEntityType:changeID:", objc_msgSend((id)objc_opt_class(), "entityType"), objc_msgSend(v10, "changeID"));
        objc_msgSend(v14, "addObject:", v16);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)objectChangesInStore:(id)a3 resultHandler:(id)a4
{
  objc_msgSend(a1, "objectChangesOfType:inStore:resultHandler:", 0, a3, a4);
}

+ (void)objectChangesInSource:(id)a3 resultHandler:(id)a4
{
  objc_msgSend(a1, "objectChangesOfType:inSource:resultHandler:", 0, a3, a4);
}

+ (void)objectChangesInCalendar:(id)a3 resultHandler:(id)a4
{
  objc_msgSend(a1, "objectChangesOfType:inCalendar:resultHandler:", 0, a3, a4);
}

+ (void)objectChangesOfType:(id)a3 inStore:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "processFetchResults:", a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "CADOperationProxySync");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CADDatabaseFetchObjectChangesForEntityTypes:insideObject:reply:", v9, 0, v12);

}

+ (void)objectChangesOfType:(id)a3 inSource:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "processFetchResults:", a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CADOperationProxySync");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "CADDatabaseFetchObjectChangesForEntityTypes:insideObject:reply:", v9, v13, v14);
}

+ (void)objectChangesOfType:(id)a3 inCalendar:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "processFetchResults:", a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CADOperationProxySync");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "CADDatabaseFetchObjectChangesForEntityTypes:insideObject:reply:", v9, v13, v14);
}

+ (void)fetchObjectChangesInStore:(id)a3 resultHandler:(id)a4
{
  objc_msgSend(a1, "fetchChangesToObjectsOfTypes:inStore:resultHandler:", 0, a3, a4);
}

+ (void)fetchObjectChangesInSource:(id)a3 resultHandler:(id)a4
{
  objc_msgSend(a1, "fetchChangesToObjectsOfTypes:inSource:resultHandler:", 0, a3, a4);
}

+ (void)fetchObjectChangesInCalendar:(id)a3 resultHandler:(id)a4
{
  objc_msgSend(a1, "fetchChangesToObjectsOfTypes:inCalendar:resultHandler:", 0, a3, a4);
}

+ (void)fetchChangesToObjectsOfTypes:(id)a3 inStore:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__EKObjectChange_fetchChangesToObjectsOfTypes_inStore_resultHandler___block_invoke;
  v12[3] = &unk_1E4786148;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "objectChangesOfType:inStore:resultHandler:", a3, v11, v12);

}

void __69__EKObjectChange_fetchChangesToObjectsOfTypes_inStore_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "recordSequenceTokenForLegacyClients:", v10);
  v8 = *(_QWORD *)(a1 + 40);
  if (v10)
    v9 = (int)objc_msgSend(v10, "legacyToken");
  else
    v9 = -1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9, v7);

}

+ (void)fetchChangesToObjectsOfTypes:(id)a3 inSource:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__EKObjectChange_fetchChangesToObjectsOfTypes_inSource_resultHandler___block_invoke;
  v12[3] = &unk_1E4786148;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "objectChangesOfType:inSource:resultHandler:", a3, v11, v12);

}

void __70__EKObjectChange_fetchChangesToObjectsOfTypes_inSource_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
    objc_msgSend(v8, "legacyToken");
  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordSequenceTokenForLegacyClients:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)fetchChangesToObjectsOfTypes:(id)a3 inCalendar:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__EKObjectChange_fetchChangesToObjectsOfTypes_inCalendar_resultHandler___block_invoke;
  v12[3] = &unk_1E4786148;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "objectChangesOfType:inCalendar:resultHandler:", a3, v11, v12);

}

void __72__EKObjectChange_fetchChangesToObjectsOfTypes_inCalendar_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordSequenceTokenForLegacyClients:", v11);

  v9 = *(_QWORD *)(a1 + 40);
  if (v11)
    v10 = (int)objc_msgSend(v11, "legacyToken");
  else
    v10 = -1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10, v7);

}

+ (id)processFetchResults:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__EKObjectChange_processFetchResults___block_invoke;
  v7[3] = &unk_1E4786170;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A85849D4](v7);

  return v5;
}

void __38__EKObjectChange_processFetchResults___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  EKSequenceToken *v20;
  unsigned int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if ((_DWORD)a2)
  {
    v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __38__EKObjectChange_processFetchResults___block_invoke_cold_1(v11, a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v21 = a3;
    v12 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          +[EKObjectChange objectChangeWithProperties:](EKObjectChange, "objectChangeWithProperties:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    v19 = *(_QWORD *)(a1 + 32);
    v20 = -[EKSequenceToken initWithCADSequenceToken:]([EKSequenceToken alloc], "initWithCADSequenceToken:", v9);
    (*(void (**)(uint64_t, _QWORD, EKSequenceToken *, void *))(v19 + 16))(v19, v21, v20, v12);

  }
}

+ (void)callClientResultsHandler:(id)a3 changesTruncated:(BOOL)a4 latestToken:(int64_t)a5 changes:(id)a6
{
  (*((void (**)(id, BOOL, int64_t, id))a3 + 2))(a3, a4, a5, a6);
}

- (unint64_t)hash
{
  int64_t changeID;

  changeID = self->_changeID;
  return -[EKObjectID hash](self->_changedObjectID, "hash") ^ changeID;
}

- (BOOL)isEqual:(id)a3
{
  EKObjectChange *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (EKObjectChange *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && self->_changeID == v4->_changeID;
  }

  return v6;
}

- (id)description
{
  uint64_t changeType;
  __CFString *v3;

  changeType = self->_changeType;
  if (changeType > 2)
    v3 = 0;
  else
    v3 = off_1E4786190[changeType];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[<%@: %p>: type=%@, row=%i, seq=%li, changeID=%li]"), objc_opt_class(), self, v3, -[EKObjectID rowID](self->_changedObjectID, "rowID"), self->_sequenceNumber, self->_changeID);
}

+ (int)entityType
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("entityType must be implemented by an EKObjectChange inheriting class."), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise");

  return -1;
}

+ (int64_t)objectType
{
  return (int)objc_msgSend(a1, "entityType");
}

+ (id)objectChangeWithProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __objc2_class *v25;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("record"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("record"));
    v7 = v6;

    v8 = objc_msgSend(v5, "entityType");
    v9 = v8;
    switch((int)v8)
    {
      case -1:
      case 3:
      case 12:
      case 13:
      case 14:
      case 18:
      case 20:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
        goto LABEL_3;
      case 0:
      case 22:
        goto LABEL_8;
      case 1:
        v25 = EKCalendarChange;
        goto LABEL_25;
      case 2:
        v25 = EKEventChange;
        goto LABEL_25;
      case 4:
        v25 = EKAlarmChange;
        goto LABEL_25;
      case 5:
        v25 = EKRecurrenceChange;
        goto LABEL_25;
      case 6:
        v25 = EKSourceChange;
        goto LABEL_25;
      case 7:
        v25 = EKAttendeeChange;
        goto LABEL_25;
      case 8:
        v25 = EKOrganizerChange;
        goto LABEL_25;
      case 9:
        v25 = EKEventActionChange;
        goto LABEL_25;
      case 10:
        v25 = EKExceptionDateChange;
        goto LABEL_25;
      case 11:
        v25 = EKAttachmentChange;
        goto LABEL_25;
      case 15:
        v25 = EKShareeChange;
        goto LABEL_25;
      case 16:
        v25 = EKInviteReplyNotificationChange;
        goto LABEL_25;
      case 17:
        v25 = EKResourceChangeNotificationChange;
        goto LABEL_25;
      case 19:
        v25 = EKSuggestionNotificationChange;
        goto LABEL_25;
      case 21:
        v25 = EKContactChange;
LABEL_25:
        v17 = (void *)objc_msgSend([v25 alloc], "initWithChangeProperties:", v7);
        break;
      default:
        if ((v8 - 100) < 3)
        {
LABEL_3:
          v10 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            +[EKObjectChange objectChangeWithProperties:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
        }
        else
        {
LABEL_8:
          v18 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            +[EKObjectChange objectChangeWithProperties:].cold.1(v9, v18, v19, v20, v21, v22, v23, v24);
        }
        v17 = 0;
        break;
    }

  }
  else
  {
    v17 = 0;
    v7 = v3;
  }

  return v17;
}

- (id)serializedPropertiesForConsumingChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("consumed_entity_class");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EKObjectID entityType](self->_changedObjectID, "entityType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("consumed_entity_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[EKObjectID rowID](self->_changedObjectID, "rowID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("consumed_change_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_changeID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("sequence_number");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sequenceNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (EKObjectID)changedObjectID
{
  return self->_changedObjectID;
}

- (int)changeType
{
  return self->_changeType;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedObjectID, 0);
}

void __38__EKObjectChange_processFetchResults___block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a1;
  objc_msgSend(v3, "errorWithCADResult:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_1A2318000, v4, OS_LOG_TYPE_ERROR, "Error fetching changed object IDs: %@", (uint8_t *)&v6, 0xCu);

}

+ (void)objectChangeWithProperties:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Invalid entity type: %d", a5, a6, a7, a8, 0);
}

+ (void)objectChangeWithProperties:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Unsupported entity type: %d", a5, a6, a7, a8, 0);
}

@end
