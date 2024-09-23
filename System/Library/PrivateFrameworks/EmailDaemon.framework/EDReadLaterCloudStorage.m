@implementation EDReadLaterCloudStorage

- (EDReadLaterCloudStorage)initWithMutableDictionary:(id)a3 hookRegistry:(id)a4
{
  id v8;
  id v9;
  EDReadLaterCloudStorage *v10;
  EDReadLaterCloudStorage *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDReadLaterCloudStorage.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v14.receiver = self;
  v14.super_class = (Class)EDReadLaterCloudStorage;
  v10 = -[EDReadLaterCloudStorage init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_persistentDictionary, a3);
    objc_storeStrong((id *)&v11->_hookRegistry, a4);
    objc_msgSend(v9, "registerMessageChangeHookResponder:", v11);
  }

  return v11;
}

- (EDReadLaterCloudStorage)initWithHookRegistry:(id)a3
{
  id v4;
  void *v5;
  EDReadLaterCloudStorage *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E398]), "initWithIdentifier:encrypted:delegate:", CFSTR("com.apple.mail.remindMe"), 0, self);
  v6 = -[EDReadLaterCloudStorage initWithMutableDictionary:hookRegistry:](self, "initWithMutableDictionary:hookRegistry:", v5, v4);

  return v6;
}

- (void)addEntryForMessage:(id)a3 date:(id)a4
{
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = a4;
  v46 = v6;
  -[EDReadLaterCloudStorage _keyForMessage:](self, "_keyForMessage:", v6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend(v44, "timeIntervalSince1970");
    v8 = v7;
    EDRemindMeLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6;
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_msgSend(v10, "globalMessageID");
      objc_msgSend(v10, "subject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ef_publicDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "readLater");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ef_publicDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<id=%lld, subject=%@, displayDate=%@, readLater=%@>"), v12, v14, v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543874;
      v50 = v18;
      v51 = 2114;
      v52 = v45;
      v53 = 2048;
      v54 = v8;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Adding entry for message: %{public}@, key: %{public}@, date: %f", buf, 0x20u);

    }
    objc_msgSend(v46, "messageIDHeader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ec_messageIDSubstring");
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc(MEMORY[0x1E0C99E08]);
    v47 = EDReadLaterCloudStorageDictionaryKeyDate;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithDictionary:", v23);

    if (v20)
    {
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v20, EDReadLaterCloudStorageDictionaryKeyMessageID);
    }
    else
    {
      EDRemindMeLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = v46;
        v36 = (void *)MEMORY[0x1E0CB3940];
        v37 = objc_msgSend(v35, "globalMessageID");
        objc_msgSend(v35, "subject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "ef_publicDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "displayDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "readLater");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "ef_publicDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("<id=%lld, subject=%@, displayDate=%@, readLater=%@>"), v37, v43, v42, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v50 = v41;
        _os_log_error_impl(&dword_1D2F2C000, v34, OS_LOG_TYPE_ERROR, "Unable to find message ID for message: %{public}@", buf, 0xCu);

      }
    }
    -[EMMutableDictionaryProtocol setObject:forKey:](self->_persistentDictionary, "setObject:forKey:", v24, v45);

  }
  else
  {
    EDRemindMeLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v25 = v6;
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = objc_msgSend(v25, "globalMessageID");
      objc_msgSend(v25, "subject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "ef_publicDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "displayDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "readLater");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "ef_publicDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("<id=%lld, subject=%@, displayDate=%@, readLater=%@>"), v27, v29, v30, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v50 = v33;
      _os_log_error_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_ERROR, "Unable to find key for message: %{public}@", buf, 0xCu);

    }
  }

}

- (void)updateDisplayDateForMessage:(id)a3 displayDate:(id)a4
{
  double v6;
  double v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  double v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v53 = a4;
  -[EDReadLaterCloudStorage _keyForMessage:](self, "_keyForMessage:", v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_msgSend(v53, "timeIntervalSince1970");
    v7 = v6;
    objc_msgSend(v52, "dateReceived");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToDate:", v53);

    EDRemindMeLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v49 = v9;
      v11 = v52;
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_msgSend(v11, "globalMessageID");
      objc_msgSend(v11, "subject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ef_publicDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "readLater");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ef_publicDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<id=%lld, subject=%@, displayDate=%@, readLater=%@>"), v13, v15, v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138544130;
      v56 = v19;
      v57 = 2114;
      v58 = v54;
      v59 = 2048;
      v60 = v7;
      v61 = 1024;
      v62 = v49;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Updating display date for message: %{public}@, key: %{public}@, date: %f isDisplayDateDateReceived:%{BOOL}d", buf, 0x26u);

    }
    -[EMMutableDictionaryProtocol objectForKey:](self->_persistentDictionary, "objectForKey:", v54);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v20);
      -[NSObject objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", EDReadLaterCloudStorageDictionaryKeyDisplayDate);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        EDRemindMeLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = v52;
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = objc_msgSend(v24, "globalMessageID");
          objc_msgSend(v24, "subject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "ef_publicDescription");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "displayDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "readLater");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "ef_publicDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("<id=%lld, subject=%@, displayDate=%@, readLater=%@>"), v26, v50, v48, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543874;
          v56 = v22;
          v57 = 2114;
          v58 = v29;
          v59 = 2114;
          v60 = *(double *)&v54;
          _os_log_error_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_ERROR, "An existing display date (%{public}@) already exists for message: %{public}@, key: %{public}@", buf, 0x20u);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
        v23 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, EDReadLaterCloudStorageDictionaryKeyDisplayDate);
      }

      -[EMMutableDictionaryProtocol setObject:forKey:](self->_persistentDictionary, "setObject:forKey:", v21, v54);
    }
    else
    {
      EDRemindMeLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v39 = v52;
        v40 = (void *)MEMORY[0x1E0CB3940];
        v41 = objc_msgSend(v39, "globalMessageID");
        objc_msgSend(v39, "subject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "ef_publicDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "displayDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "readLater");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "ef_publicDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("<id=%lld, subject=%@, displayDate=%@, readLater=%@>"), v41, v42, v43, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543618;
        v56 = v46;
        v57 = 2114;
        v58 = v54;
        _os_log_error_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_ERROR, "No value found for message: %{public}@, key: %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    EDRemindMeLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v30 = v52;
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = objc_msgSend(v30, "globalMessageID");
      objc_msgSend(v30, "subject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ef_publicDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "displayDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "readLater");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "ef_publicDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("<id=%lld, subject=%@, displayDate=%@, readLater=%@>"), v32, v34, v35, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v56 = v38;
      _os_log_error_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_ERROR, "Unable to find key to update display date for message: %{public}@", buf, 0xCu);

    }
  }

}

- (void)removeEntryForMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDReadLaterCloudStorage _keyForMessage:](self, "_keyForMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  EDRemindMeLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v4;
    v7 = v4;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_msgSend(v7, "globalMessageID");
    objc_msgSend(v7, "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "readLater");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ef_publicDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<id=%lld, subject=%@, displayDate=%@, readLater=%@>"), v9, v10, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138543618;
    v18 = v14;
    v19 = 2114;
    v20 = v5;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Removing entry for message: %{public}@, key: %{public}@", buf, 0x16u);

    v4 = v16;
  }

  -[EMMutableDictionaryProtocol removeObjectForKey:](self->_persistentDictionary, "removeObjectForKey:", v5);
}

- (id)cloudStorageReadLaterDateForMessage:(id)a3 displayDate:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[EDReadLaterCloudStorage _keyForMessage:](self, "_keyForMessage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMutableDictionaryProtocol objectForKey:](self->_persistentDictionary, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a4)
    {
      -[EDReadLaterCloudStorage _dateFromDictionary:forKey:](self, "_dateFromDictionary:forKey:", v8, EDReadLaterCloudStorageDictionaryKeyDisplayDate);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[EDReadLaterCloudStorage _dateFromDictionary:forKey:](self, "_dateFromDictionary:forKey:", v8, EDReadLaterCloudStorageDictionaryKeyDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_keyForMessage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "messageIDHeaderHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v4, "int64Value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!a5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15);
          if (v9)
            -[EDReadLaterCloudStorage addEntryForMessage:date:](self, "addEntryForMessage:date:", v16, v9);
          else
            -[EDReadLaterCloudStorage removeEntryForMessage:](self, "removeEntryForMessage:", v16, (_QWORD)v17);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!a4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "displayDate", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDReadLaterCloudStorage updateDisplayDateForMessage:displayDate:](self, "updateDisplayDateForMessage:displayDate:", v13, v14);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (id)_dateFromDictionary:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if ((objc_msgSend(v5, "isEqualToString:", EDReadLaterCloudStorageDictionaryKeyDisplayDate) & 1) == 0)
  {
    objc_msgSend(v9, "ef_dateWithTruncatedSeconds");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }

  return v9;
}

- (void)persistedDictionaryDidChangeRemotelyWithChangedItems:(id)a3 deletedItems:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  v12 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__EDReadLaterCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke;
  v14[3] = &unk_1E94A0158;
  v14[4] = self;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __93__EDReadLaterCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke_2;
  v13[3] = &unk_1E94A0180;
  v13[4] = self;
  objc_msgSend(v6, "ef_compactMap:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDReadLaterCloudStorage hookRegistry](self, "hookRegistry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remindMeCloudStorageChangedWithAddedOrChangedItems:deletedItems:", v9, v10);

}

void __93__EDReadLaterCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  EDReadLaterCloudStorageChangeElement *v9;
  id v10;

  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_messageHashForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v10;
    objc_msgSend(*(id *)(a1 + 32), "_dateFromDictionary:forKey:", v6, EDReadLaterCloudStorageDictionaryKeyDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_dateFromDictionary:forKey:", v6, EDReadLaterCloudStorageDictionaryKeyDisplayDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && v7)
    {
      v9 = -[EDReadLaterCloudStorageChangeElement initWithMessageID:readLaterDate:displayDate:]([EDReadLaterCloudStorageChangeElement alloc], "initWithMessageID:readLaterDate:displayDate:", v5, v7, v8);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);

    }
  }

}

id __93__EDReadLaterCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_messageHashForKey:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_messageHashForKey:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (_messageHashForKey__onceToken != -1)
    dispatch_once(&_messageHashForKey__onceToken, &__block_literal_global_53);
  objc_msgSend((id)_messageHashForKey__formatter, "numberFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithHash:", v5);

  return v6;
}

uint64_t __46__EDReadLaterCloudStorage__messageHashForKey___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_messageHashForKey__formatter;
  _messageHashForKey__formatter = (uint64_t)v0;

  return objc_msgSend((id)_messageHashForKey__formatter, "setNumberStyle:", 1);
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_persistentDictionary, 0);
}

@end
