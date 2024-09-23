@implementation EKICSImporter

+ (id)allowedImportFileTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.ical.ics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.ical.vcs"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.ical.backup-package"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_createImportHandle
{
  if (_createImportHandle_onceToken != -1)
    dispatch_once(&_createImportHandle_onceToken, &__block_literal_global_36);
}

void __36__EKICSImporter__createImportHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(ekSubSystem, "ICSImport");
  v1 = (void *)EKICSImportHandle;
  EKICSImportHandle = (uint64_t)v0;

}

- (EKICSImporter)initWithFilePaths:(id)a3 eventStore:(id)a4 options:(unint64_t)a5
{
  return (EKICSImporter *)-[EKICSImporter _initWithFilePaths:eventStore:calendar:options:](self, "_initWithFilePaths:eventStore:calendar:options:", a3, a4, 0, a5);
}

- (EKICSImporter)initWithFilePaths:(id)a3 calendar:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  EKICSImporter *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "eventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EKICSImporter _initWithFilePaths:eventStore:calendar:options:](self, "_initWithFilePaths:eventStore:calendar:options:", v9, v10, v8, a5);

  return v11;
}

- (id)_initWithFilePaths:(id)a3 eventStore:(id)a4 calendar:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  EKICSImporter *v14;
  EKICSImporter *v15;
  uint64_t v16;
  NSMutableDictionary *nonITIPFiles;
  uint64_t v18;
  NSMutableDictionary *iTIPFiles;
  uint64_t v20;
  NSMutableDictionary *iCalFilesToImport;
  uint64_t v22;
  NSMutableSet *existingEventIDs;
  uint64_t v24;
  NSMutableArray *vCalFilesToImport;
  uint64_t v26;
  NSMapTable *calendarToITIPFiles;
  NSError *importError;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)EKICSImporter;
  v14 = -[EKICSImporter init](&v30, sel_init);
  v15 = v14;
  if (v14)
  {
    -[EKICSImporter _createImportHandle](v14, "_createImportHandle");
    objc_storeStrong((id *)&v15->_importFilePaths, a3);
    objc_storeStrong((id *)&v15->_calendar, a5);
    objc_storeStrong((id *)&v15->_eventStore, a4);
    v15->_options = a6;
    v16 = objc_opt_new();
    nonITIPFiles = v15->_nonITIPFiles;
    v15->_nonITIPFiles = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    iTIPFiles = v15->_iTIPFiles;
    v15->_iTIPFiles = (NSMutableDictionary *)v18;

    v20 = objc_opt_new();
    iCalFilesToImport = v15->_iCalFilesToImport;
    v15->_iCalFilesToImport = (NSMutableDictionary *)v20;

    v22 = objc_opt_new();
    existingEventIDs = v15->_existingEventIDs;
    v15->_existingEventIDs = (NSMutableSet *)v22;

    v24 = objc_opt_new();
    vCalFilesToImport = v15->_vCalFilesToImport;
    v15->_vCalFilesToImport = (NSMutableArray *)v24;

    v26 = objc_opt_new();
    calendarToITIPFiles = v15->_calendarToITIPFiles;
    v15->_calendarToITIPFiles = (NSMapTable *)v26;

    importError = v15->_importError;
    v15->_importError = 0;

  }
  return v15;
}

- (void)asyncImportWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.EventKit.ICSImporter", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__EKICSImporter_asyncImportWithCompletion___block_invoke;
  v8[3] = &unk_1E4784E18;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __43__EKICSImporter_asyncImportWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAsynchronous:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_importWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)syncImportWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[EKICSImporter setAsynchronous:](self, "setAsynchronous:", 0);
  -[EKICSImporter _importWithCompletion:](self, "_importWithCompletion:", v4);

}

- (void)_importWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  -[EKICSImporter setImportProgressAsIndeterminate](self, "setImportProgressAsIndeterminate");
  -[EKICSImporter setCompletionCallback:](self, "setCompletionCallback:", v4);

  -[EKICSImporter importFilePaths](self, "importFilePaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKICSImporter _separateFilesForImport:](self, "_separateFilesForImport:", v5);

  if (v6)
  {
    if (v6 != 2)
    {
      if (v6 != 1)
        return;
      v7 = EKICSImportHandle;
      if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "We completed the import during the file separation phase.", v11, 2u);
      }
      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
      -[EKICSImporter _importWithCompletion:].cold.1();
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if (!-[EKICSImporter importICalFiles](self, "importICalFiles"))
    goto LABEL_11;
  if (!-[NSMutableArray count](self->_importedItems, "count"))
  {
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
      -[EKICSImporter _importWithCompletion:].cold.2();
    -[EKICSImporter importError](self, "importError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKICSImporter setImportError:](self, "setImportError:", v10);

    }
    goto LABEL_11;
  }
LABEL_8:
  v8 = 1;
LABEL_12:
  -[EKICSImporter callCompletionWithSuccess:](self, "callCompletionWithSuccess:", v8);
}

- (BOOL)importICalFiles
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)EKICSImportHandle;
  if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[EKICSImporter iCalFilesToImport](self, "iCalFilesToImport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSImporter vCalFilesToImport](self, "vCalFilesToImport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSImporter calendar](self, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A2318000, v4, OS_LOG_TYPE_DEFAULT, "Importing iCal files (%@) and vCal files (%@) to calendar %@", (uint8_t *)&v11, 0x20u);

  }
  v9 = -[EKICSImporter _separateICalFilesForITIP](self, "_separateICalFilesForITIP");
  if (v9)
  {
    v9 = -[EKICSImporter _sortFilesByImportCalendar](self, "_sortFilesByImportCalendar");
    if (v9)
    {
      v9 = -[EKICSImporter _doImportFiles](self, "_doImportFiles");
      if (v9)
      {
        -[EKICSImporter callImportDroppedRemindersCallbackIfThereWereReminders](self, "callImportDroppedRemindersCallbackIfThereWereReminders");
        LOBYTE(v9) = 1;
      }
    }
  }
  return v9;
}

- (BOOL)_sortFilesByImportCalendar
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  int v16;
  id v17;
  EKICSImporter *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  char v42;
  void *v43;
  BOOL v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  BOOL v66;
  int v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t k;
  uint64_t v75;
  void *v76;
  void *v77;
  NSMapTable **p_calendarToVCalFiles;
  void *v79;
  void *v80;
  void *v81;
  int v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  uint64_t (**v88)(_QWORD, _QWORD);
  void *v89;
  void *v90;
  id obj;
  id *p_calendarToITIPFiles;
  uint64_t v94;
  NSMapTable **p_calendarToICalFiles;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  _QWORD v114[6];
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t v117[4];
  uint64_t v118;
  _BYTE v119[128];
  uint8_t v120[128];
  __int128 buf;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  -[EKICSImporter calendar](self, "calendar");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = EKICSImportHandle;
  v3 = os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT);
  if (v90)
  {
    if (v3)
    {
      v4 = v2;
      objc_msgSend(v90, "objectID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1A2318000, v4, OS_LOG_TYPE_DEFAULT, "Importing files to user-specified calendar with identifier(%@)", (uint8_t *)&buf, 0xCu);

    }
    v6 = (void *)MEMORY[0x1E0D0C318];
    -[EKICSImporter iTIPFiles](self, "iTIPFiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addArray:withKey:toStrongTableOfArrays:", v8, v90, &self->_calendarToITIPFiles);

    v9 = (void *)MEMORY[0x1E0D0C318];
    -[EKICSImporter nonITIPFiles](self, "nonITIPFiles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addArray:withKey:toStrongTableOfArrays:", v11, v90, &self->_calendarToICalFiles);

    v12 = (void *)MEMORY[0x1E0D0C318];
    -[EKICSImporter vCalFilesToImport](self, "vCalFilesToImport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addArray:withKey:toStrongTableOfArrays:", v13, v90, &self->_calendarToVCalFiles);

    goto LABEL_5;
  }
  if (v3)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "No destination calendar provided.  Will attempt to choose appropriate calendars.", (uint8_t *)&buf, 2u);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__10;
  v124 = __Block_byref_object_dispose__10;
  v125 = 0;
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __43__EKICSImporter__sortFilesByImportCalendar__block_invoke;
  v114[3] = &unk_1E4786058;
  v114[4] = self;
  v114[5] = &buf;
  v88 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v114);
  -[EKICSImporter iTIPFiles](self, "iTIPFiles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  p_calendarToITIPFiles = (id *)&self->_calendarToITIPFiles;
  v16 = ((uint64_t (**)(_QWORD, void *))v88)[2](v88, v15);

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 10, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSImporter setImportError:](self, "setImportError:", v58);

    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
      -[EKICSImporter _sortFilesByImportCalendar].cold.3();
    goto LABEL_90;
  }
  v17 = *p_calendarToITIPFiles;
  v18 = self;
  if (*p_calendarToITIPFiles)
  {
    v113 = 0;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    obj = v17;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
    if (v19)
    {
      v94 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v110 != v94)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
          objc_msgSend(v21, "source");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "constraints");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "requiresOutgoingInvitationsInDefaultCalendar");

          if (v24)
          {
            objc_msgSend(v22, "calendarsForEntityType:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v26 = v25;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
            if (v27)
            {
              v28 = *(_QWORD *)v106;
LABEL_18:
              v29 = 0;
              while (1)
              {
                if (*(_QWORD *)v106 != v28)
                  objc_enumerationMutation(v26);
                v30 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v29);
                if ((objc_msgSend(v30, "isDefaultSchedulingCalendar") & 1) != 0)
                  break;
                if (v27 == ++v29)
                {
                  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
                  if (v27)
                    goto LABEL_18;
                  goto LABEL_24;
                }
              }
              v31 = v30;

              if (!v31)
                goto LABEL_29;
              objc_msgSend(*p_calendarToITIPFiles, "objectForKey:", v21);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D0C318], "addArray:withKey:toStrongTableOfArrays:", v32, v31, p_calendarToITIPFiles);
              objc_msgSend(v31, "objectID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v33, "isEqual:", v34);

              if ((v35 & 1) == 0)
                objc_msgSend(MEMORY[0x1E0D0C318], "addObject:toArray:", v21, &v113);

            }
            else
            {
LABEL_24:

LABEL_29:
              v36 = EKICSImportHandle;
              if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v117 = 138412290;
                v118 = (uint64_t)v22;
                _os_log_error_impl(&dword_1A2318000, v36, OS_LOG_TYPE_ERROR, "%@ doesn't have a default calendar to put the items into.", v117, 0xCu);
              }
            }

          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
      }
      while (v19);
    }

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v37 = v113;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v102;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v102 != v39)
            objc_enumerationMutation(v37);
          objc_msgSend(*p_calendarToITIPFiles, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j));
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
      }
      while (v38);
    }

    v18 = self;
  }
  -[EKICSImporter nonITIPFiles](v18, "nonITIPFiles");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  p_calendarToICalFiles = &v18->_calendarToICalFiles;
  v42 = ((uint64_t (**)(_QWORD, void *))v88)[2](v88, v41);

  if ((v42 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 10, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSImporter setImportError:](self, "setImportError:", v59);

    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
      -[EKICSImporter _sortFilesByImportCalendar].cold.2();
    goto LABEL_90;
  }
  -[EKICSImporter vCalFilesToImport](self, "vCalFilesToImport");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count") == 0;

  if (!v44)
  {
    v45 = (void *)MEMORY[0x1E0D0C318];
    -[EKICSImporter vCalFilesToImport](self, "vCalFilesToImport");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addArray:toArray:", v46, *((_QWORD *)&buf + 1) + 40);

  }
  if (!objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
    goto LABEL_89;
  -[EKICSImporter selectCalendar](self, "selectCalendar");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47 == 0;

  v49 = EKICSImportHandle;
  if (v48)
  {
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v117 = 0;
      _os_log_impl(&dword_1A2318000, v49, OS_LOG_TYPE_DEFAULT, "We don't know what calendar to import some files to and we don't have a callback for Calendar selection.  Bailing.", v117, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 3, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSImporter setImportError:](self, "setImportError:", v60);

    goto LABEL_90;
  }
  v50 = (id)EKICSImportHandle;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
    *(_DWORD *)v117 = 134217984;
    v118 = v51;
    _os_log_impl(&dword_1A2318000, v50, OS_LOG_TYPE_DEFAULT, "No destination calendar provided. We need to ask the user what calendar to import to for %lu files.", v117, 0xCu);
  }

  v52 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  -[EKICSImporter iTIPFiles](self, "iTIPFiles");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKICSImporter nonITIPFiles](self, "nonITIPFiles");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKICSImporter infoForNewCalendarForFiles:forITIPFiles:nonITIPFiles:](self, "infoForNewCalendarForFiles:forITIPFiles:nonITIPFiles:", v52, v53, v54);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v89)
  {
    v86 = 0;
    v87 = 0;
LABEL_62:
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "firstObject", v55);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "lastPathComponent");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringByDeletingPathExtension");
    v64 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)v64;
    goto LABEL_63;
  }
  objc_msgSend(v89, "x_apple_calendar_color");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56)
  {
    objc_msgSend(v56, "red");
    objc_msgSend(v57, "green");
    objc_msgSend(v57, "blue");
    CalColorStringRepresentation();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v86 = 0;
  }
  objc_msgSend(v89, "x_wr_calname");
  v61 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "x_wr_caldesc");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (void *)v61;
  if (!v61)
    goto LABEL_62;
LABEL_63:
  v100 = 0;
  v84 = v55;
  -[EKICSImporter selectCalendarWithTitle:color:description:error:](self, "selectCalendarWithTitle:color:description:error:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0;
  if (v85)
    v66 = 1;
  else
    v66 = v65 == 0;
  v67 = !v66;
  v83 = v67;
  if (v66)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 3, 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKICSImporter setImportError:](self, "setImportError:", v81);

    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
      -[EKICSImporter _sortFilesByImportCalendar].cold.1();
  }
  else
  {
    v68 = (id)EKICSImportHandle;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v65, "objectID");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v117 = 138412290;
      v118 = (uint64_t)v69;
      _os_log_impl(&dword_1A2318000, v68, OS_LOG_TYPE_DEFAULT, "User selected calendar: UID( %@)", v117, 0xCu);

    }
    v70 = EKICSImportHandle;
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v117 = 138412290;
      v118 = (uint64_t)v65;
      _os_log_impl(&dword_1A2318000, v70, OS_LOG_TYPE_DEFAULT, "User selected calendar %@", v117, 0xCu);
    }
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v71 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v96, v115, 16);
    if (v72)
    {
      v73 = *(_QWORD *)v97;
      do
      {
        for (k = 0; k != v72; ++k)
        {
          if (*(_QWORD *)v97 != v73)
            objc_enumerationMutation(v71);
          v75 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * k);
          -[EKICSImporter iTIPFiles](self, "iTIPFiles");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectForKeyedSubscript:", v75);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          p_calendarToVCalFiles = &self->_calendarToITIPFiles;
          if (!v77)
          {
            -[EKICSImporter nonITIPFiles](self, "nonITIPFiles");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "objectForKeyedSubscript:", v75);
            v80 = (void *)objc_claimAutoreleasedReturnValue();

            if (v80)
              p_calendarToVCalFiles = p_calendarToICalFiles;
            else
              p_calendarToVCalFiles = &self->_calendarToVCalFiles;
          }
          objc_msgSend(MEMORY[0x1E0D0C318], "addItem:withKey:toStrongTableOfArrays:", v75, v65, p_calendarToVCalFiles);
        }
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v96, v115, 16);
      }
      while (v72);
    }

  }
  if (!v83)
  {
LABEL_90:

    _Block_object_dispose(&buf, 8);
    v14 = 0;
    goto LABEL_91;
  }
LABEL_89:

  _Block_object_dispose(&buf, 8);
LABEL_5:
  v14 = 1;
LABEL_91:

  return v14;
}

uint64_t __43__EKICSImporter__sortFilesByImportCalendar__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_findCalendarForExistingEvent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(MEMORY[0x1E0D0C318], "addItem:withKey:toStrongTableOfArrays:", v10, v12, a3);
        else
          objc_msgSend(MEMORY[0x1E0D0C318], "addObject:toArray:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return 1;
}

- (id)infoForNewCalendarForFiles:(id)a3 forITIPFiles:(id)a4 nonITIPFiles:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = a4;
  v27 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v31;
    v12 = v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          objc_msgSend(v27, "objectForKeyedSubscript:", v14);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;

        if (v18)
          v19 = v10 == 0;
        else
          v19 = 0;
        if (v19)
        {
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v18, "calendar");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "components");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v35;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v35 != v24)
                  objc_enumerationMutation(v21);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {

                  objc_msgSend(v18, "calendar");
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_24;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
              if (v23)
                continue;
              break;
            }
          }

          v10 = 0;
LABEL_24:
          v12 = v28;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v12 = v28;
  }

  return v10;
}

- (id)_getImportedCalendarItems
{
  return self->_importedItems;
}

- (unint64_t)_separateFilesForImport:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  EKICSImporter *v26;
  id v27;
  uint64_t v28;
  NSMutableDictionary **p_iCalFilesToImport;
  NSMutableArray **p_vCalFilesToImport;
  uint8_t buf[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v26 = self;
    v27 = v4;
    p_iCalFilesToImport = &self->_iCalFilesToImport;
    p_vCalFilesToImport = &self->_vCalFilesToImport;
    v8 = 0x1E0C99000uLL;
    v9 = 0x1E0DDB000uLL;
LABEL_3:
    v10 = 0;
    v28 = v6;
    while (1)
    {
      if (*(_QWORD *)v33 != v7)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isPathToBackupFile"))
        break;
      if (objc_msgSend(v11, "isPathToICalData"))
      {
        objc_msgSend(*(id *)(v8 + 3408), "dataWithContentsOfFile:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 2080)), "initWithData:options:error:", v12, 0, 0);
        objc_msgSend(v13, "calendar");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v9;
        if (v14)
        {
          v16 = (void *)v14;
          objc_msgSend(MEMORY[0x1E0D0C318], "setValue:withKey:inDictionary:", v13, v11, p_iCalFilesToImport);

          v9 = v15;
        }
        else
        {
          v17 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 2080)), "initWithData:options:error:", v12, 1, 0);
          objc_msgSend(v17, "calendar");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "version");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("1.0"));

          v21 = EKICSImportHandle;
          if (!v20)
          {
            if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
              -[EKICSImporter _separateFilesForImport:].cold.3();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 0, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKICSImporter setImportError:](v26, "setImportError:", v24);

            v22 = 2;
            v4 = v27;
LABEL_30:

            goto LABEL_31;
          }
          v4 = v27;
          if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A2318000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to open version 1.0 .ics file.  Will treat it as a vcs file and import.", buf, 2u);
          }
          objc_msgSend(MEMORY[0x1E0D0C318], "addObject:toArray:", v11, p_vCalFilesToImport);

          v6 = v28;
          v8 = 0x1E0C99000;
          v9 = 0x1E0DDB000;
        }
      }
      else if (objc_msgSend(v11, "isPathToVCalData"))
      {
        objc_msgSend(MEMORY[0x1E0D0C318], "addObject:toArray:", v11, p_vCalFilesToImport);
      }
      if (v6 == ++v10)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 2
      && os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKICSImporter _separateFilesForImport:].cold.2();
    }
    -[EKICSImporter importFoundBackupFile](v26, "importFoundBackupFile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKICSImporter importFoundBackupFile:](v26, "importFoundBackupFile:", v12);
      v22 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
        -[EKICSImporter _separateFilesForImport:].cold.1();
      v22 = 2;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKICSImporter setImportError:](v26, "setImportError:", v12);
    }
    goto LABEL_30;
  }
LABEL_18:
  v22 = 0;
LABEL_31:

  return v22;
}

- (BOOL)_separateICalFilesForITIP
{
  EKICSImporter *v2;
  unint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  unsigned int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSMutableDictionary **v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int isKindOfClass;
  void *v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSMutableDictionary **p_iTIPFiles;
  NSMutableArray **p_filesWithReminders;
  NSMutableDictionary *obj;
  EKICSImporter *v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableDictionary **p_nonITIPFiles;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v2 = self;
  v47 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_iCalFilesToImport;
  v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v37;
    p_filesWithReminders = &v2->_filesWithReminders;
    p_iTIPFiles = &v2->_iTIPFiles;
    p_nonITIPFiles = &v2->_nonITIPFiles;
    v3 = 0x1E0D0C000uLL;
    v31 = v2;
    while (2)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v2->_iCalFilesToImport, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "calendar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 0, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKICSImporter setImportError:](v2, "setImportError:", v24);

          v25 = EKICSImportHandle;
          if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v5;
            _os_log_impl(&dword_1A2318000, v25, OS_LOG_TYPE_DEFAULT, "File %@ has no VCALENDAR.", buf, 0xCu);
          }
          goto LABEL_35;
        }
        v8 = -[EKICSImporter countReminders:](v2, "countReminders:", v7);
        if (v8 >= 1)
        {
          v9 = v8;
          objc_msgSend(*(id *)(v3 + 792), "addObject:toArray:", v5, p_filesWithReminders);
          v2->_droppedReminderCount += v9;
        }
        if (objc_msgSend(v7, "method") == 1 || !objc_msgSend(v7, "method"))
        {
          v35 = v6;
          v13 = EKICSImportHandle;
          if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v5;
            _os_log_impl(&dword_1A2318000, v13, OS_LOG_TYPE_DEFAULT, "File %@ has method PUBLISH or NONE.", buf, 0xCu);
          }
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v7, "components");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
          if (v15)
          {
            v16 = v15;
            v17 = 0;
            v18 = *(_QWORD *)v41;
LABEL_17:
            v19 = 0;
            while (1)
            {
              if (*(_QWORD *)v41 != v18)
                objc_enumerationMutation(v14);
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & v17 & 1) != 0)
                break;
              v17 |= isKindOfClass;
              if (v16 == ++v19)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
                if (v16)
                  goto LABEL_17;

                v12 = p_nonITIPFiles;
                v6 = v35;
                v2 = v31;
                v3 = 0x1E0D0C000;
                if ((v17 & 1) == 0)
                  goto LABEL_26;
                goto LABEL_28;
              }
            }
          }

          v2 = v31;
          v6 = v35;
          v3 = 0x1E0D0C000uLL;
LABEL_26:
          -[EKICSImporter makeDecision](v2, "makeDecision");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = p_nonITIPFiles;
          if (v21)
          {
            v22 = -[EKICSImporter shouldImportContinueGivenDecision:eventsAffected:](v2, "shouldImportContinueGivenDecision:eventsAffected:", 0, 1, p_nonITIPFiles);
            v12 = p_nonITIPFiles;
            if (!v22)
            {
              -[EKICSImporter setNumInvalidEvents:](v2, "setNumInvalidEvents:", -[EKICSImporter numInvalidEvents](v2, "numInvalidEvents") + 1);
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 5, 0);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKICSImporter setImportError:](v2, "setImportError:", v26);

              if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
                -[EKICSImporter _separateICalFilesForITIP].cold.1();
LABEL_35:

              v23 = 0;
              goto LABEL_36;
            }
          }
        }
        else
        {
          v10 = EKICSImportHandle;
          v11 = os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT);
          v12 = p_iTIPFiles;
          if (v11)
          {
            *(_DWORD *)buf = 138412290;
            v46 = v5;
            _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_DEFAULT, "File %@ is an iTIP message.", buf, 0xCu);
            v12 = p_iTIPFiles;
          }
        }
LABEL_28:
        objc_msgSend(*(id *)(v3 + 792), "setValue:withKey:inDictionary:", v6, v5, v12);

      }
      v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v33)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_36:

  return v23;
}

- (BOOL)_message:(id)a3 hasNewSelfOrganizedEventForCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKICSImporter _findCalendarForExistingEvent:](self, "_findCalendarForExistingEvent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "organizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "ownerIdentityAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_msgSend(v7, "ownerIdentityEmail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emailAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) == 0)
    {
      objc_msgSend(v7, "ownerIdentityPhoneNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "phoneNumber");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v20, "isEqualToString:", v21);

      goto LABEL_10;
    }
LABEL_8:
    v16 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)_doITIPFileImport
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[NSMapTable count](self->_calendarToITIPFiles, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[EKICSImporter calendarToITIPFiles](self, "calendarToITIPFiles");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v19)
    {
      v18 = *(_QWORD *)v26;
      v3 = *MEMORY[0x1E0D0BEA8] | *MEMORY[0x1E0D0BE90];
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(obj);
          v20 = v4;
          v5 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v4);
          -[EKICSImporter calendarToITIPFiles](self, "calendarToITIPFiles");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v22;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v22 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[EKICSImporter eventStore](self, "eventStore");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "importICSData:intoCalendar:options:", v13, v5, v3 | self->_options);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (v15)
                  -[NSMutableArray addObjectsFromArray:](self->_importedItems, "addObjectsFromArray:", v15);

                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v10);
          }

          v4 = v20 + 1;
        }
        while (v20 + 1 != v19);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v19);
    }

  }
  return 0;
}

- (BOOL)_doImportFiles
{
  NSMutableArray *v3;
  NSMutableArray *importedItems;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t m;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t ii;
  id obj;
  id obja;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  EKICSImporter *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint8_t v92[128];
  uint8_t buf[4];
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  importedItems = self->_importedItems;
  self->_importedItems = v3;

  if (!-[EKICSImporter _doITIPFileImport](self, "_doITIPFileImport"))
  {
    -[EKICSImporter iTIPFiles](self, "iTIPFiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)EKICSImportHandle;
      if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        -[EKICSImporter iTIPFiles](self, "iTIPFiles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v94 = v9;
        _os_log_impl(&dword_1A2318000, v8, OS_LOG_TYPE_DEFAULT, "We did not import the iTip files [%@].", buf, 0xCu);

      }
    }
  }
  -[EKICSImporter calendarToVCalFiles](self, "calendarToVCalFiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v61 = self;
  if (!v11)
    goto LABEL_34;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[EKICSImporter calendarToVCalFiles](self, "calendarToVCalFiles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
  if (v59)
  {
    v57 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v84 != v57)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
        -[EKICSImporter calendarToVCalFiles](self, "calendarToVCalFiles");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v80;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v80 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                objc_msgSend(v13, "addObject:", v23);
                objc_msgSend(v12, "addObject:", v15);
              }

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
          }
          while (v20);
        }

        self = v61;
      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
    }
    while (v59);
  }

  -[EKICSImporter eventStore](self, "eventStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  objc_msgSend(v24, "importVCSData:intoCalendars:error:", v13, v12, &v78);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v78;

  if (!v25)
  {
    if (v26)
    {
      -[EKICSImporter setImportError:](self, "setImportError:", v26);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 10, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKICSImporter setImportError:](self, "setImportError:", v27);

    }
  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v28 = v25;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v75;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v75 != v31)
          objc_enumerationMutation(v28);
        -[NSMutableArray addObjectsFromArray:](self->_importedItems, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    }
    while (v30);
  }

  if (v25)
  {
LABEL_34:
    -[EKICSImporter calendarToICalFiles](self, "calendarToICalFiles");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v34);
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v34);
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      -[EKICSImporter calendarToICalFiles](self, "calendarToICalFiles");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
      if (v60)
      {
        v58 = *(_QWORD *)v71;
        do
        {
          for (m = 0; m != v60; ++m)
          {
            if (*(_QWORD *)v71 != v58)
              objc_enumerationMutation(obja);
            v38 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * m);
            -[EKICSImporter calendarToICalFiles](self, "calendarToICalFiles");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKey:", v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v41 = v40;
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v88, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v67;
              do
              {
                for (n = 0; n != v43; ++n)
                {
                  if (*(_QWORD *)v67 != v44)
                    objc_enumerationMutation(v41);
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * n));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v46)
                  {
                    objc_msgSend(v36, "addObject:", v46);
                    objc_msgSend(v35, "addObject:", v38);
                  }

                }
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v88, 16);
              }
              while (v43);
            }

            self = v61;
          }
          v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
        }
        while (v60);
      }

      -[EKICSImporter eventStore](self, "eventStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "importICSData:intoCalendars:options:", v36, v35, *MEMORY[0x1E0D0BE90] | self->_options);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v25) = v47 != 0;
      if (!v47)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 10, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKICSImporter setImportError:](self, "setImportError:", v48);

      }
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v49 = v47;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v63;
        do
        {
          for (ii = 0; ii != v51; ++ii)
          {
            if (*(_QWORD *)v63 != v52)
              objc_enumerationMutation(v49);
            -[NSMutableArray addObjectsFromArray:](self->_importedItems, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * ii));
          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
        }
        while (v51);
      }

    }
    else
    {
      LOBYTE(v25) = 1;
    }
  }
  return (char)v25;
}

- (id)_existingEventFromICSEvent:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D0C490];
  objc_msgSend(v6, "recurrence_id");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v9;
  if (v10)
  {
    objc_msgSend(v6, "recurrence_id");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = COERCE_DOUBLE(CalCreateDateTimeFromICSDate());

    CalDateTimeRelease();
  }
  if (v11 != v9 && v11 != 0.0)
  {
    CalGetRecurrenceUIDFromRealUID();
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  if (!objc_msgSend(v8, "length"))
  {
    v18 = 0;
    goto LABEL_12;
  }
  -[EKEventStore eventsWithExternalIdentifier:inCalendars:](self->_eventStore, "eventsWithExternalIdentifier:inCalendars:", v8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKICSImporter _findBestEventFromEvents:](self, "_findBestEventFromEvents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[EKICSImporter existingEventIDs](self, "existingEventIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    v18 = v15;
  }
  else
  {
    objc_msgSend(v6, "recurrence_id");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v18 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v6, "uid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v21, "length"))
    {
      v18 = 0;
      v8 = v21;
      goto LABEL_10;
    }
    -[EKEventStore eventsWithExternalIdentifier:inCalendars:](self->_eventStore, "eventsWithExternalIdentifier:inCalendars:", v21, 0);
    v22 = objc_claimAutoreleasedReturnValue();

    -[EKICSImporter _findBestEventFromEvents:](self, "_findBestEventFromEvents:", v22);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v21;
    v14 = (void *)v22;
  }

LABEL_10:
LABEL_12:

  return v18;
}

- (id)_findBestEventFromEvents:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_24;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v18;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      objc_msgSend(v9, "calendar", (_QWORD)v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "allowsContentModifications"))
      {
        objc_msgSend(v10, "source");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEnabledForEvents") & 1) == 0)
          goto LABEL_10;
        objc_msgSend(v10, "source");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isDelegate"))
        {

LABEL_10:
          goto LABEL_11;
        }
        if (objc_msgSend(v10, "sharingStatus") == 2)
        {
          v13 = objc_msgSend(v10, "allowsScheduling");

          if (!v13)
            goto LABEL_11;
        }
        else
        {

        }
        if ((objc_msgSend(v9, "isSelfOrganized") & 1) != 0)
        {
          v15 = v9;

          v6 = v15;
          goto LABEL_24;
        }
        if (!v6)
          v6 = v9;
      }
LABEL_11:

      ++v8;
    }
    while (v5 != v8);
    v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    v5 = v14;
  }
  while (v14);
LABEL_24:

  return v6;
}

- (id)_findCalendarForExistingEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKICSImporter eventFromDocument:](self, "eventFromDocument:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKICSImporter _existingEventFromICSEvent:calendar:](self, "_existingEventFromICSEvent:calendar:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = EKICSImportHandle;
    v10 = os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = v9;
        objc_msgSend(v8, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEFAULT, "Importing pre-existing event.  Will stay on current calendar: objectID(%@)", (uint8_t *)&v14, 0xCu);

      }
    }
    else if (v10)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "Importing a pre-existing event but there were no eligible writeable calendars.", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isAnyAttendeeAddressFrom:(id)a3 organizer:(id)a4 equivalentTo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__EKICSImporter__isAnyAttendeeAddressFrom_organizer_equivalentTo___block_invoke;
    v23[3] = &unk_1E4786080;
    v24 = v9;
    v11 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v23);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          if ((v11[2](v11, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i)) & 1) != 0)
          {

            goto LABEL_13;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v14)
          continue;
        break;
      }
    }

    if ((((uint64_t (**)(_QWORD, id))v11)[2](v11, v8) & 1) != 0)
LABEL_13:
      v17 = 1;
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __66__EKICSImporter__isAnyAttendeeAddressFrom_organizer_equivalentTo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "compareToLocalURL:", v5) & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v4, "emailAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v6, "cal_isEquivalentToEmailAddress:", v7);

    if ((v6 & 1) == 0)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v4, "phoneNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v9, "cal_isEquivalentToPhoneNumber:", v10);

      if ((v9 & 1) != 0)
        goto LABEL_5;
LABEL_7:
      v8 = 0;
      goto LABEL_8;
    }
  }

LABEL_5:
  v8 = 1;
LABEL_8:

  return v8;
}

- (id)_matchingAttendeeAddressesFrom:(id)a3 organizer:(id)a4 inSource:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "ownerAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v13);
  }

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __67__EKICSImporter__matchingAttendeeAddressesFrom_organizer_inSource___block_invoke;
  v33[3] = &unk_1E47860A8;
  v17 = v10;
  v34 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v33);
  v32 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v18[2](v18, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(MEMORY[0x1E0D0C318], "addObject:toSet:", v24, &v32, (_QWORD)v28);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v21);
  }

  ((void (**)(_QWORD, id))v18)[2](v18, v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(MEMORY[0x1E0D0C318], "addObject:toSet:", v25, &v32);
  v26 = v32;

  return v26;
}

id __67__EKICSImporter__matchingAttendeeAddressesFrom_organizer_inSource___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (!v4)
    goto LABEL_19;
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v10)
  {
    v14 = 1;
    goto LABEL_18;
  }
  v11 = v10;
  v12 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v9);
      v2 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (objc_msgSend(v6, "compareToLocalURL:", v2, (_QWORD)v17))
      {
        objc_msgSend(v6, "absoluteString");
        v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
        v2 = v15;
        v14 = 0;
        goto LABEL_18;
      }
      if (objc_msgSend(v2, "cal_isEquivalentToEmailAddress:", v7))
      {
        v15 = v7;
        goto LABEL_17;
      }
      if (objc_msgSend(v2, "cal_isEquivalentToPhoneNumber:", v8))
      {
        v15 = v8;
        goto LABEL_17;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    v14 = 1;
    if (v11)
      continue;
    break;
  }
LABEL_18:

  if (v14)
LABEL_19:
    v2 = 0;

  return v2;
}

- (id)eventFromDocument:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentForKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "componentOccurrencesForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v14, "count"))
      {

        v6 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)EKICSImportHandle;
      if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v16 = 138412290;
        v17 = (id)objc_opt_class();
        v9 = v17;
        _os_log_impl(&dword_1A2318000, v8, OS_LOG_TYPE_DEFAULT, "Expected an event but got %@", (uint8_t *)&v16, 0xCu);

      }
      v10 = 0;
      goto LABEL_15;
    }
LABEL_14:
    v6 = v6;
    v10 = v6;
LABEL_15:

    goto LABEL_16;
  }
  v11 = (void *)EKICSImportHandle;
  if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v16 = 134217984;
    v17 = (id)objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A2318000, v12, OS_LOG_TYPE_DEFAULT, "ICS calendar expected to contain a single item, but instead it contained %lu", (uint8_t *)&v16, 0xCu);

  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (int)countReminders:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "componentKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "componentForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v7 += objc_opt_isKindOfClass() & 1;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)callbackQueue
{
  OS_dispatch_queue *async_queue;
  OS_dispatch_queue *v3;
  id v4;

  async_queue = self->_async_queue;
  if (async_queue)
  {
    v3 = async_queue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
  }
  return v3;
}

- (void)callCompletionWithSuccess:(BOOL)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;
  BOOL v16;

  -[EKICSImporter _getImportedCalendarItems](self, "_getImportedCalendarItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKICSImporter numInvalidEvents](self, "numInvalidEvents");
  -[EKICSImporter importError](self, "importError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    v8 = (void *)EKICSImportHandle;
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
      -[EKICSImporter callCompletionWithSuccess:].cold.1(v8, self, (uint64_t)v7);
  }
  -[EKICSImporter completionCallback](self, "completionCallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__EKICSImporter_callCompletionWithSuccess___block_invoke;
    v12[3] = &unk_1E47860D0;
    v12[4] = self;
    v16 = a3;
    v13 = v5;
    v15 = v6;
    v14 = v7;
    v10 = (void (**)(_QWORD))MEMORY[0x1A85849D4](v12);
    if (-[EKICSImporter asynchronous](self, "asynchronous"))
    {
      -[EKICSImporter callbackQueue](self, "callbackQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_sync(v11, v10);

    }
    else
    {
      v10[2](v10);
    }
    -[EKICSImporter setCompletionCallback:](self, "setCompletionCallback:", 0);

  }
}

void __43__EKICSImporter_callCompletionWithSuccess___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionCallback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (id)selectCalendarWithTitle:(id)a3 color:(id)a4 description:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD);
  NSObject *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  EKICSImporter *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__10;
  v38 = __Block_byref_object_dispose__10;
  v39 = 0;
  -[EKICSImporter selectCalendar](self, "selectCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__10;
    v32 = __Block_byref_object_dispose__10;
    v33 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __65__EKICSImporter_selectCalendarWithTitle_color_description_error___block_invoke;
    v21 = &unk_1E47860F8;
    v26 = &v34;
    v22 = self;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    v27 = &v28;
    v14 = (void (**)(_QWORD))MEMORY[0x1A85849D4](&v18);
    if (-[EKICSImporter asynchronous](self, "asynchronous", v18, v19, v20, v21, v22))
    {
      -[EKICSImporter callbackQueue](self, "callbackQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_sync(v15, v14);

    }
    else
    {
      v14[2](v14);
    }
    if (a6)
      *a6 = objc_retainAutorelease((id)v29[5]);

    _Block_object_dispose(&v28, 8);
  }
  v16 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v16;
}

void __65__EKICSImporter_selectCalendarWithTitle_color_description_error___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "selectCalendar");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v6 + 40);
  ((void (**)(_QWORD, uint64_t, uint64_t, uint64_t, id *))v2)[2](v2, v3, v4, v5, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)importFoundBackupFile:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  EKICSImporter *v12;
  id v13;

  v4 = a3;
  -[EKICSImporter importFoundBackupFile](self, "importFoundBackupFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __39__EKICSImporter_importFoundBackupFile___block_invoke;
    v11 = &unk_1E47853B0;
    v12 = self;
    v13 = v4;
    v6 = (void (**)(_QWORD))MEMORY[0x1A85849D4](&v8);
    if (-[EKICSImporter asynchronous](self, "asynchronous", v8, v9, v10, v11, v12))
    {
      -[EKICSImporter callbackQueue](self, "callbackQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_sync(v7, v6);

    }
    else
    {
      v6[2](v6);
    }

  }
}

void __39__EKICSImporter_importFoundBackupFile___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "importFoundBackupFile");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)setImportProgressAsIndeterminate
{
  void *v3;
  void *v4;
  dispatch_queue_t queue;

  -[EKICSImporter importSetProgressAsIndeterminate](self, "importSetProgressAsIndeterminate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[EKICSImporter asynchronous](self, "asynchronous"))
    {
      -[EKICSImporter callbackQueue](self, "callbackQueue");
      queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
      -[EKICSImporter importSetProgressAsIndeterminate](self, "importSetProgressAsIndeterminate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_sync(queue, v4);

    }
    else
    {
      -[EKICSImporter importSetProgressAsIndeterminate](self, "importSetProgressAsIndeterminate");
      queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
      ((void (*)(void))queue[2].isa)();
    }

  }
}

- (BOOL)shouldImportContinueGivenDecision:(int)a3 eventsAffected:(unint64_t)a4
{
  void *v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  char v10;
  _QWORD v12[7];
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[EKICSImporter makeDecision](self, "makeDecision");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__EKICSImporter_shouldImportContinueGivenDecision_eventsAffected___block_invoke;
    v12[3] = &unk_1E4786120;
    v12[4] = self;
    v12[5] = &v14;
    v12[6] = a4;
    v13 = a3;
    v8 = (void (**)(_QWORD))MEMORY[0x1A85849D4](v12);
    if (-[EKICSImporter asynchronous](self, "asynchronous"))
    {
      -[EKICSImporter callbackQueue](self, "callbackQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_sync(v9, v8);

    }
    else
    {
      v8[2](v8);
    }

  }
  v10 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v10;
}

void __66__EKICSImporter_shouldImportContinueGivenDecision_eventsAffected___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "makeDecision");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*((uint64_t (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));

}

- (void)callImportDroppedRemindersCallbackIfThereWereReminders
{
  void *v3;
  unint64_t droppedReminderCount;
  void (**v5)(_QWORD);
  NSObject *v6;
  _QWORD v7[5];

  -[EKICSImporter importDroppedReminders](self, "importDroppedReminders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    droppedReminderCount = self->_droppedReminderCount;

    if (droppedReminderCount)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __71__EKICSImporter_callImportDroppedRemindersCallbackIfThereWereReminders__block_invoke;
      v7[3] = &unk_1E4785078;
      v7[4] = self;
      v5 = (void (**)(_QWORD))MEMORY[0x1A85849D4](v7);
      if (-[EKICSImporter asynchronous](self, "asynchronous"))
      {
        -[EKICSImporter callbackQueue](self, "callbackQueue");
        v6 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v6, v5);

      }
      else
      {
        v5[2](v5);
      }

    }
  }
}

void __71__EKICSImporter_callImportDroppedRemindersCallbackIfThereWereReminders__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "importDroppedReminders");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));

}

- (NSError)importError
{
  return self->_importError;
}

- (void)setImportError:(id)a3
{
  objc_storeStrong((id *)&self->_importError, a3);
}

- (OS_dispatch_queue)async_queue
{
  return self->_async_queue;
}

- (void)setAsync_queue:(id)a3
{
  objc_storeStrong((id *)&self->_async_queue, a3);
}

- (id)selectCalendar
{
  return self->_selectCalendar;
}

- (void)setSelectCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)importFoundBackupFile
{
  return self->_importFoundBackupFile;
}

- (void)setImportFoundBackupFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)importDroppedReminders
{
  return self->_importDroppedReminders;
}

- (void)setImportDroppedReminders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)makeDecision
{
  return self->_makeDecision;
}

- (void)setMakeDecision:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)importSetProgressValue
{
  return self->_importSetProgressValue;
}

- (void)setImportSetProgressValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)importSetProgressAsIndeterminate
{
  return self->_importSetProgressAsIndeterminate;
}

- (void)setImportSetProgressAsIndeterminate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)asynchronous
{
  return self->_asynchronous;
}

- (void)setAsynchronous:(BOOL)a3
{
  self->_asynchronous = a3;
}

- (unint64_t)numInvalidEvents
{
  return self->_numInvalidEvents;
}

- (void)setNumInvalidEvents:(unint64_t)a3
{
  self->_numInvalidEvents = a3;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (NSArray)importFilePaths
{
  return self->_importFilePaths;
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSMutableDictionary)iCalFilesToImport
{
  return self->_iCalFilesToImport;
}

- (void)setICalFilesToImport:(id)a3
{
  objc_storeStrong((id *)&self->_iCalFilesToImport, a3);
}

- (NSMutableArray)vCalFilesToImport
{
  return self->_vCalFilesToImport;
}

- (void)setVCalFilesToImport:(id)a3
{
  objc_storeStrong((id *)&self->_vCalFilesToImport, a3);
}

- (NSMapTable)calendarToICalFiles
{
  return self->_calendarToICalFiles;
}

- (void)setCalendarToICalFiles:(id)a3
{
  objc_storeStrong((id *)&self->_calendarToICalFiles, a3);
}

- (NSMapTable)calendarToITIPFiles
{
  return self->_calendarToITIPFiles;
}

- (void)setCalendarToITIPFiles:(id)a3
{
  objc_storeStrong((id *)&self->_calendarToITIPFiles, a3);
}

- (NSMapTable)calendarToVCalFiles
{
  return self->_calendarToVCalFiles;
}

- (void)setCalendarToVCalFiles:(id)a3
{
  objc_storeStrong((id *)&self->_calendarToVCalFiles, a3);
}

- (NSMutableSet)existingEventIDs
{
  return self->_existingEventIDs;
}

- (void)setExistingEventIDs:(id)a3
{
  objc_storeStrong((id *)&self->_existingEventIDs, a3);
}

- (NSMutableDictionary)iTIPFiles
{
  return self->_iTIPFiles;
}

- (void)setITIPFiles:(id)a3
{
  objc_storeStrong((id *)&self->_iTIPFiles, a3);
}

- (NSMutableDictionary)nonITIPFiles
{
  return self->_nonITIPFiles;
}

- (void)setNonITIPFiles:(id)a3
{
  objc_storeStrong((id *)&self->_nonITIPFiles, a3);
}

- (NSMutableArray)filesWithReminders
{
  return self->_filesWithReminders;
}

- (void)setFilesWithReminders:(id)a3
{
  objc_storeStrong((id *)&self->_filesWithReminders, a3);
}

- (unint64_t)droppedReminderCount
{
  return self->_droppedReminderCount;
}

- (void)setDroppedReminderCount:(unint64_t)a3
{
  self->_droppedReminderCount = a3;
}

- (NSMutableArray)importedItems
{
  return self->_importedItems;
}

- (void)setImportedItems:(id)a3
{
  objc_storeStrong((id *)&self->_importedItems, a3);
}

- (id)completionCallback
{
  return self->_completionCallback;
}

- (void)setCompletionCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionCallback, 0);
  objc_storeStrong((id *)&self->_importedItems, 0);
  objc_storeStrong((id *)&self->_filesWithReminders, 0);
  objc_storeStrong((id *)&self->_nonITIPFiles, 0);
  objc_storeStrong((id *)&self->_iTIPFiles, 0);
  objc_storeStrong((id *)&self->_existingEventIDs, 0);
  objc_storeStrong((id *)&self->_calendarToVCalFiles, 0);
  objc_storeStrong((id *)&self->_calendarToITIPFiles, 0);
  objc_storeStrong((id *)&self->_calendarToICalFiles, 0);
  objc_storeStrong((id *)&self->_vCalFilesToImport, 0);
  objc_storeStrong((id *)&self->_iCalFilesToImport, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_importFilePaths, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong(&self->_importSetProgressAsIndeterminate, 0);
  objc_storeStrong(&self->_importSetProgressValue, 0);
  objc_storeStrong(&self->_makeDecision, 0);
  objc_storeStrong(&self->_importDroppedReminders, 0);
  objc_storeStrong(&self->_importFoundBackupFile, 0);
  objc_storeStrong(&self->_selectCalendar, 0);
  objc_storeStrong((id *)&self->_async_queue, 0);
  objc_storeStrong((id *)&self->_importError, 0);
}

- (void)_importWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "We failed to figure out the different types of files we were trying to import. Aborting import.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_importWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "We 'succeeded' at importing 0 items. Going to treat this as an error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_sortFilesByImportCalendar
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Couldn't handle import for all iTIP files.  Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_separateFilesForImport:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Found a calendar archive to import but no method for restoring from the backup file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_separateFilesForImport:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Found a calendar archive among multiple files to import. Ignoring the other files.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_separateFilesForImport:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Couldn't read calendar data from file \"%@\".  Aborting open.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_separateICalFilesForITIP
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Not importing file \"%@\" because it has either zero or more than one ICSEvent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)callCompletionWithSuccess:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "importFilePaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v8 = 2112;
  v9 = a3;
  _os_log_error_impl(&dword_1A2318000, v5, OS_LOG_TYPE_ERROR, "Import of [%@] failed with error [%@]", v7, 0x16u);

}

@end
