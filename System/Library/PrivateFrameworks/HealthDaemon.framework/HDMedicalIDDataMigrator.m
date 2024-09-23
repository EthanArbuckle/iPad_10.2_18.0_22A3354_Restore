@implementation HDMedicalIDDataMigrator

+ (BOOL)migrateMedicalIDDataIfNeeded:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  ABAddressBookRef v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  ABAddressBookRef v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  CFErrorRef v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "schemaVersion") > 3)
  {
    v24 = 0;
    goto LABEL_36;
  }
  switch(objc_msgSend(v4, "schemaVersion"))
  {
    case 0:
      v5 = v4;
      objc_opt_self();
      objc_msgSend(v5, "setBloodType:", 0);

      goto LABEL_5;
    case 1:
LABEL_5:
      v6 = v4;
      objc_opt_self();
      objc_msgSend(v6, "emergencyContacts");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "count"))
        goto LABEL_15;
      error = 0;
      v8 = ABAddressBookCreateWithOptions(0, &error);
      if (!v8)
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v33 = 2;
          v34 = 2114;
          v35 = error;
          goto LABEL_38;
        }
LABEL_34:

        goto LABEL_35;
      }
      v9 = v8;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = v7;
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "_migrateToSchemaVersion:withAddressBook:", 2, v9, (_QWORD)v27);
          }
          v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        }
        while (v11);
      }

      CFRelease(v9);
LABEL_15:

LABEL_16:
      v6 = v4;
      objc_opt_self();
      objc_msgSend(v6, "emergencyContacts");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        error = 0;
        v14 = ABAddressBookCreateWithOptions(0, &error);
        if (v14)
        {
          v15 = v14;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v7 = v7;
          v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v28 != v18)
                  objc_enumerationMutation(v7);
                objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "_migrateToSchemaVersion:withAddressBook:", 3, v15);
              }
              v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
            }
            while (v17);
          }

          CFRelease(v15);
          goto LABEL_26;
        }
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v33 = 3;
          v34 = 2114;
          v35 = error;
LABEL_38:
          _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "Error creating address book in migrating emergency contacts to version %ld: %{public}@", buf, 0x16u);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
LABEL_26:

LABEL_27:
      v20 = v4;
      objc_opt_self();
      objc_msgSend(v20, "birthdate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "hk_dateOfBirthDateComponentsWithDate:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setGregorianBirthday:", v23);
      }

      objc_msgSend(v20, "setSchemaVersion:", 4);
LABEL_35:
      v24 = 1;
LABEL_36:

      return v24;
    case 2:
      goto LABEL_16;
    case 3:
      goto LABEL_27;
    default:
      goto LABEL_35;
  }
}

@end
