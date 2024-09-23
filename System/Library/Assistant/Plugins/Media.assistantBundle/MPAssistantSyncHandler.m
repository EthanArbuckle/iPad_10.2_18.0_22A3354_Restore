@implementation MPAssistantSyncHandler

- (MPAssistantSyncHandler)init
{
  MPAssistantSyncHandler *v2;
  uint64_t v3;
  MPMediaLibrary *library;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPAssistantSyncHandler;
  v2 = -[MPAssistantSyncHandler init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
    v3 = objc_claimAutoreleasedReturnValue();
    library = v2->_library;
    v2->_library = (MPMediaLibrary *)v3;

    objc_msgSend(MEMORY[0x1E0CC2438], "setFilteringDisabled:", 1);
  }
  return v2;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  __CFString *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  BOOL *p_resetSync;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  OS_dispatch_semaphore *v29;
  OS_dispatch_semaphore *changeEnumerationSemaphore;
  OS_dispatch_semaphore *v31;
  OS_dispatch_semaphore *resultProcessingSemaphore;
  void *v33;
  _QWORD v34[5];
  __CFString *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  v10 = a4;
  v11 = a6;
  _MPLogCategoryAssistant();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v37 = (uint64_t)v9;
    v38 = 2114;
    v39 = (uint64_t)v10;
    _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_DEFAULT, "Sync Handler (begin): anchor: %{private}@, validity: %{public}@", buf, 0x16u);
  }

  if (self->_abortSync)
  {
    _MPLogCategoryAssistant();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_ERROR, "Sync Handler (enumeration): sync already ended", buf, 2u);
    }
    goto LABEL_28;
  }
  -[MPMediaLibrary _syncValidity](self->_library, "_syncValidity");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = -[MPMediaLibrary currentEntityRevision](self->_library, "currentEntityRevision");
  -[MPMediaLibrary valueForDatabaseProperty:](self->_library, "valueForDatabaseProperty:", CFSTR("ForceSiriResetSync"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if ((-[NSObject isEqualToString:](v13, "isEqualToString:", v10) & 1) != 0)
  {
    if (v14 >= -[__CFString longLongValue](v9, "longLongValue"))
    {
      if (!v16)
      {
        p_resetSync = &self->_resetSync;
        if (!self->_resetSync)
          goto LABEL_16;
        goto LABEL_15;
      }
      _MPLogCategoryAssistant();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "Sync Handler (validity): forced reset";
        v20 = v17;
        v21 = OS_LOG_TYPE_DEFAULT;
        v22 = 2;
        goto LABEL_13;
      }
    }
    else
    {
      _MPLogCategoryAssistant();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = -[__CFString longLongValue](v9, "longLongValue");
        *(_DWORD *)buf = 134218240;
        v37 = v14;
        v38 = 2048;
        v39 = v18;
        v19 = "Sync Handler (validity): (db revision = %lli, anchor = %lli)";
LABEL_12:
        v20 = v17;
        v21 = OS_LOG_TYPE_ERROR;
        v22 = 22;
LABEL_13:
        _os_log_impl(&dword_1CC97B000, v20, v21, v19, buf, v22);
      }
    }
  }
  else
  {
    _MPLogCategoryAssistant();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v37 = (uint64_t)v13;
      v38 = 2114;
      v39 = (uint64_t)v10;
      v19 = "Sync Handler (validity): (libraryValidity:%{public}@ != siriValidity:%{public}@)";
      goto LABEL_12;
    }
  }

  objc_msgSend(v11, "resetWithValidity:", v13);
  self->_resetSync = 1;
  p_resetSync = &self->_resetSync;
  v9 = CFSTR("0");
LABEL_15:
  -[MPMediaLibrary deleteDatabaseProperty:](self->_library, "deleteDatabaseProperty:", CFSTR("ForceSiriResetSync"));
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isMediaEntitySyncDisabled");

  if (v25)
  {
    v26 = -[__CFString intValue](v9, "intValue");
    _MPLogCategoryAssistant();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CC97B000, v27, OS_LOG_TYPE_DEFAULT, "Sync Handler (validity): media entity sync disabled - resetting", buf, 2u);
      }

      *p_resetSync = 1;
      objc_msgSend(v11, "resetWithValidity:", v13);

      v9 = CFSTR("0");
    }
    else
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CC97B000, v27, OS_LOG_TYPE_DEFAULT, "Sync Handler (validity): media entity sync disabled - ignoring sync", buf, 2u);
      }

      self->_abortSync = 1;
    }
  }
  v29 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  changeEnumerationSemaphore = self->_changeEnumerationSemaphore;
  self->_changeEnumerationSemaphore = v29;

  v31 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  resultProcessingSemaphore = self->_resultProcessingSemaphore;
  self->_resultProcessingSemaphore = v31;

  objc_msgSend((id)objc_opt_class(), "_widthLimitedOperationQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1CC9A59B4;
  v34[3] = &unk_1E88E39C8;
  v34[4] = self;
  v9 = v9;
  v35 = v9;
  objc_msgSend(v33, "addOperationWithBlock:", v34);

LABEL_28:
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  __int128 v11;
  NSObject *v12;
  void *v13;
  _MPMediaLibraryEntityChange *nextChange;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  __int128 v26;
  uint8_t buf[4];
  NSObject *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_abortSync)
  {
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Sync Handler (get): sync already ended", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isMediaEntitySyncDisabled");

    if ((v10 & 1) != 0)
    {
      _MPLogCategoryAssistant();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_DEFAULT, "Sync Handler (get): media entity sync disabled - resetting anchor", buf, 2u);
      }

      objc_msgSend(v7, "setObject:", 0);
      objc_msgSend(v7, "setPostAnchor:", CFSTR("0"));
    }
    else
    {
      *(_QWORD *)&v11 = 138543362;
      v26 = v11;
      while (1)
      {
        v13 = (void *)MEMORY[0x1D17B04C8]();
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_changeEnumerationSemaphore);
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultProcessingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        if (self->_abortSync)
          break;
        nextChange = self->_nextChange;
        if (nextChange)
        {
          v15 = nextChange;
          -[NSObject entity](v15, "entity");
          v16 = objc_claimAutoreleasedReturnValue();
          -[NSObject anchor](v15, "anchor");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = -[NSObject deletionType](v15, "deletionType");
          if (self->_deleteNextChange)
          {
            self->_deleteNextChange = 0;
LABEL_27:
            v23 = 1;
            -[NSObject SAMPMediaEntityRepresentationUsingIdentifierType:](v16, "SAMPMediaEntityRepresentationUsingIdentifierType:", 1, v26);
            v19 = objc_claimAutoreleasedReturnValue();
LABEL_28:
            objc_msgSend(v7, "setPostAnchor:", v17, v26);
            objc_msgSend(v7, "setIsDelete:", v23);
            objc_msgSend(v7, "setObject:", v19);
            _MPLogCategoryAssistant();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              v25 = -[NSObject persistentID](v16, "persistentID");
              *(_DWORD *)buf = 138543618;
              v28 = v17;
              v29 = 2048;
              v30 = v25;
              _os_log_impl(&dword_1CC97B000, v24, OS_LOG_TYPE_DEBUG, "Sync Handler (get): revision %{public}@, pid %lld", buf, 0x16u);
            }

            goto LABEL_31;
          }
          if (v18)
            goto LABEL_27;
          if ((sub_1CC9A579C(v16) & 1) != 0)
          {
            -[NSObject SAMPMediaEntityRepresentationUsingIdentifierType:](v16, "SAMPMediaEntityRepresentationUsingIdentifierType:", 1);
            v19 = objc_claimAutoreleasedReturnValue();
            -[NSObject title](v19, "title");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "length");

            if (v21)
            {
              v23 = 0;
              goto LABEL_28;
            }
            _MPLogCategoryAssistant();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              v28 = v19;
              _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_DEFAULT, "Sync Handler (get): no title %{public}@", buf, 0xCu);
            }

          }
          else
          {
            _MPLogCategoryAssistant();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              v28 = v16;
              _os_log_impl(&dword_1CC97B000, v19, OS_LOG_TYPE_DEFAULT, "Sync Handler (get): not for Assistant %{public}@", buf, 0xCu);
            }
          }

        }
        objc_autoreleasePoolPop(v13);
        if (!self->_nextChange)
          goto LABEL_32;
      }
      _MPLogCategoryAssistant();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_ERROR, "Sync Handler (get): aborted", buf, 2u);
      }
LABEL_31:

      objc_autoreleasePoolPop(v13);
    }
  }
LABEL_32:

}

- (void)syncDidEnd
{
  NSObject *v3;
  uint8_t v4[16];

  _MPLogCategoryAssistant();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CC97B000, v3, OS_LOG_TYPE_DEFAULT, "Sync Handler (end): sync ended", v4, 2u);
  }

  *(_WORD *)&self->_resetSync = 256;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultProcessingSemaphore);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_changeEnumerationSemaphore);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextChange, 0);
  objc_storeStrong((id *)&self->_resultProcessingSemaphore, 0);
  objc_storeStrong((id *)&self->_changeEnumerationSemaphore, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

+ (id)_widthLimitedOperationQueue
{
  if (qword_1ED8AFDE0 != -1)
    dispatch_once(&qword_1ED8AFDE0, &unk_1E88E39E8);
  return (id)qword_1ED8AFDE8;
}

@end
