@implementation CDBAttachmentMigrator

+ (void)migrateWithLegacyCalendarDataContainer:(id)a3 calendarDataContainerProvider:(id)a4 database:(CalDatabase *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "migrateDataClassProtectionForAttachmentsInLegacyCalendarDataContainer:", v9);
  objc_msgSend(MEMORY[0x1E0D0C258], "legacyAttachmentContainerWithBaseURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_moveAttachmentsFromLegacyAttachmentContainer:calendarDataContainerProvider:database:", v10, v8, a5);
  if ((CalDatabaseSave((uint64_t)a5) & 1) == 0)
  {
    v11 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A5CCB000, v11, OS_LOG_TYPE_ERROR, "Could not save database.", v12, 2u);
    }
  }

}

+ (void)_moveAttachmentsFromLegacyAttachmentContainer:(id)a3 calendarDataContainerProvider:(id)a4 database:(CalDatabase *)a5
{
  id v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (const __CFArray *)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)a5);
  if (v9)
  {
    v10 = v9;
    Count = CFArrayGetCount(v9);
    if (Count >= 1)
    {
      v12 = Count;
      for (i = 0; i != v12; ++i)
        objc_msgSend(a1, "_moveAttachmentsForStore:fromLegacyAttachmentContainer:calendarDataContainerProvider:database:", CFArrayGetValueAtIndex(v10, i), v14, v8, a5);
    }
    CFRelease(v10);
  }

}

+ (void)_moveAttachmentsForStore:(void *)a3 fromLegacyAttachmentContainer:(id)a4 calendarDataContainerProvider:(id)a5 database:(CalDatabase *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  char v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void *)CalStoreCopyUUID((uint64_t)a3);
  if (v12)
  {
    objc_msgSend(v10, "URLByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      v28 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v49 = v12;
        v50 = 2112;
        v51 = v10;
        _os_log_impl(&dword_1A5CCB000, v28, OS_LOG_TYPE_ERROR, "Could not get attachment container for store. store uuid = %{public}@, legacy attachment container = %@", buf, 0x16u);
      }
      goto LABEL_40;
    }
    objc_msgSend(v13, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v29 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v49 = v12;
        v50 = 2112;
        v51 = v10;
        _os_log_impl(&dword_1A5CCB000, v29, OS_LOG_TYPE_INFO, "Could not get attachment container path for store. store uuid = %{public}@, legacy attachment container = %@", buf, 0x16u);
      }
      goto LABEL_39;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    if ((objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v15, &v47) & 1) != 0)
    {
      if (v47)
      {
        objc_msgSend(v11, "containerForAccountIdentifier:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0D0C258], "attachmentContainerWithBaseURL:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v44 = v17;
            objc_msgSend(v18, "URLByAppendingPathComponent:", v12);
            v20 = objc_claimAutoreleasedReturnValue();
            v45 = (void *)v20;
            if (v20)
            {
              v21 = v20;
              v43 = v19;
              v46 = 0;
              v22 = objc_msgSend(a1, "_createNewContainerIfNeeded:error:", v20, &v46);
              v42 = v46;
              if ((v22 & 1) != 0)
              {
                v23 = v21;
                v17 = v44;
                objc_msgSend(a1, "_infoForAttachmentsInLegacyAttachmentContainerForStore:newAttachmentContainerForStore:newCalendarDataContainer:database:", v14, v23, v44, a6);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(a1, "_moveAttachmentsWithInfo:error:");
                v40 = 0;
                if ((v24 & 1) != 0)
                {
                  objc_msgSend(a1, "_updateLocalRelativeURLForAttachmentsWithInfo:database:", v41, a6);
                  objc_msgSend(a1, "_setFileSizeForAttachmentsWithInfo:database:", v41, a6);
                  v25 = v42;
                  v19 = v43;
                }
                else
                {
                  v39 = CDBLogHandle;
                  v25 = v42;
                  v19 = v43;
                  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138413058;
                    v49 = v40;
                    v50 = 2112;
                    v51 = v14;
                    v52 = 2112;
                    v53 = v43;
                    v54 = 2112;
                    v55 = v41;
                    _os_log_impl(&dword_1A5CCB000, v39, OS_LOG_TYPE_ERROR, "Could not move attachments for store. error = %@, legacy attachment container for store = %@, new attachment container = %@, attachment info = %@", buf, 0x2Au);
                  }
                }

              }
              else
              {
                v38 = CDBLogHandle;
                v19 = v43;
                v17 = v44;
                v25 = v42;
                if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v49 = v42;
                  v50 = 2112;
                  v51 = v45;
                  _os_log_impl(&dword_1A5CCB000, v38, OS_LOG_TYPE_ERROR, "Could not create new attachment container for store if needed. error = %@, new attachment container for store = %@", buf, 0x16u);
                }
              }

            }
            else
            {
              v37 = CDBLogHandle;
              if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v49 = v12;
                v50 = 2112;
                v51 = 0;
                _os_log_impl(&dword_1A5CCB000, v37, OS_LOG_TYPE_ERROR, "Could not get new attachment container for store. store uuid = %{public}@, new attachment container = %@", buf, 0x16u);
              }
            }

          }
          else
          {
            v36 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v49 = v12;
              v50 = 2112;
              v51 = v17;
              _os_log_impl(&dword_1A5CCB000, v36, OS_LOG_TYPE_ERROR, "Could not get new attachment container. store uuid = %{public}@, new calendar data container = %@", buf, 0x16u);
            }
          }

        }
        else
        {
          v35 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v12;
            _os_log_impl(&dword_1A5CCB000, v35, OS_LOG_TYPE_ERROR, "Could not get new calendar data container. store uuid = %{public}@", buf, 0xCu);
          }
        }

        goto LABEL_38;
      }
      v34 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v49 = v12;
        v50 = 2112;
        v51 = v15;
        v31 = "Legacy attachment container for store is not a directory. store uuid = %{public}@, legacy attachment conta"
              "iner for store path = %@";
        v32 = v34;
        v33 = OS_LOG_TYPE_ERROR;
        goto LABEL_22;
      }
    }
    else
    {
      v30 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v49 = v12;
        v50 = 2112;
        v51 = v15;
        v31 = "Legacy attachment container for store does not exist. store uuid = %{public}@, legacy attachment container"
              " for store path = %@";
        v32 = v30;
        v33 = OS_LOG_TYPE_INFO;
LABEL_22:
        _os_log_impl(&dword_1A5CCB000, v32, v33, v31, buf, 0x16u);
      }
    }
LABEL_38:

LABEL_39:
LABEL_40:

    goto LABEL_41;
  }
  v26 = (void *)CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v27 = v26;
    *(_DWORD *)buf = 67109120;
    LODWORD(v49) = CalStoreGetUID();
    _os_log_impl(&dword_1A5CCB000, v27, OS_LOG_TYPE_ERROR, "Could not get account persistent id for store. store uid = %d", buf, 8u);

  }
LABEL_41:

}

+ (void)_updateLocalRelativeURLForAttachmentsWithInfo:(id)a3 database:(CalDatabase *)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__CDBAttachmentMigrator__updateLocalRelativeURLForAttachmentsWithInfo_database___block_invoke;
  v4[3] = &__block_descriptor_48_e44_v32__0__NSString_8__CDBAttachmentInfo_16_B24l;
  v4[4] = a1;
  v4[5] = a4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __80__CDBAttachmentMigrator__updateLocalRelativeURLForAttachmentsWithInfo_database___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "localRelativePath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setLocalRelativePathForAttachmentUUID:localRelativePath:database:", v5, v6, *(_QWORD *)(a1 + 40));

}

+ (void)_setLocalRelativePathForAttachmentUUID:(id)a3 localRelativePath:(id)a4 database:(CalDatabase *)a5
{
  id v7;
  id v8;
  CFTypeRef v9;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = CalDatabaseCopyAttachmentFileWithUUID((os_unfair_lock_s *)a5, (uint64_t)v7);
  if (v9)
  {
    v10 = v9;
    CalAttachmentFileSetLocalRelativePath((uint64_t)v9);
    CFRelease(v10);
  }
  else
  {
    v11 = (void *)CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      objc_msgSend(v8, "stringByDeletingPathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1A5CCB000, v12, OS_LOG_TYPE_ERROR, "Could not get attachment. attachment uuid = %{public}@, local relative path = %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }

}

+ (void)_setFileSizeForAttachmentsWithInfo:(id)a3 database:(CalDatabase *)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__CDBAttachmentMigrator__setFileSizeForAttachmentsWithInfo_database___block_invoke;
  v4[3] = &__block_descriptor_48_e44_v32__0__NSString_8__CDBAttachmentInfo_16_B24l;
  v4[4] = a1;
  v4[5] = a4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __69__CDBAttachmentMigrator__setFileSizeForAttachmentsWithInfo_database___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setFileSizeForAttachmentUUID:attachmentURL:database:", v5, v6, *(_QWORD *)(a1 + 40));

}

+ (void)_setFileSizeForAttachmentUUID:(id)a3 attachmentURL:(id)a4 database:(CalDatabase *)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  CFTypeRef v14;
  const void *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1A5CCB000, v10, OS_LOG_TYPE_INFO, "Setting file size for attachment uuid = %{public}@, attachment url = %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0D0C258], "getFileSizeForPath:fileManager:error:", v9, v11, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v12)
    {
      v14 = CalDatabaseCopyAttachmentFileWithUUID((os_unfair_lock_s *)a5, (uint64_t)v7);
      if (v14)
      {
        v15 = v14;
        CalAttachmentFileSetFileSize((uint64_t)v14);
        CFRelease(v15);
LABEL_12:

        goto LABEL_13;
      }
      v16 = CDBLogHandle;
      if (!os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 138543874;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v12;
      v17 = "Could not get attachment. attachment uuid = %{public}@, attachment path = %@, file size = %@";
    }
    else
    {
      v16 = CDBLogHandle;
      if (!os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 138412802;
      v20 = v13;
      v21 = 2114;
      v22 = v7;
      v23 = 2112;
      v24 = v9;
      v17 = "Could not get file size. error = %@, attachment uuid = %{public}@, attachment path = %@";
    }
    _os_log_impl(&dword_1A5CCB000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
    goto LABEL_12;
  }
LABEL_13:

}

+ (BOOL)_moveAttachmentsWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CDBAttachmentMigrator__moveAttachmentsWithInfo_error___block_invoke;
  v9[3] = &unk_1E4F850B0;
  v9[5] = &v16;
  v9[6] = a1;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v11[5]);
  v7 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __56__CDBAttachmentMigrator__moveAttachmentsWithInfo_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  char v8;
  id obj;

  v6 = (void *)a1[6];
  v7 = *(_QWORD *)(a1[4] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "_moveAttachmentWithInfo:error:", a3, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (BOOL)_moveAttachmentWithInfo:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "legacyURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "moveItemAtURL:toURL:error:", v6, v7, a4);

  return (char)a4;
}

+ (id)_infoForAttachmentsInLegacyAttachmentContainerForStore:(id)a3 newAttachmentContainerForStore:(id)a4 newCalendarDataContainer:(id)a5 database:(CalDatabase *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  BOOL v23;
  void *v24;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v10;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0;
  v27 = v13;
  objc_msgSend(v13, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v10, 0, 4, &v35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v35;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v30 = 0;
        objc_msgSend(a1, "_attachmentInfoForLegacyAttachmentURL:newAttachmentContainerForStore:newCalendarDataContainer:database:attachmentUUID:", v20, v11, v12, a6, &v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v30;
        if (v22)
          v23 = v21 == 0;
        else
          v23 = 1;
        if (!v23)
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v21, v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v17);
  }

  v24 = (void *)objc_msgSend(v29, "copy");
  return v24;
}

+ (id)_attachmentInfoForLegacyAttachmentURL:(id)a3 newAttachmentContainerForStore:(id)a4 newCalendarDataContainer:(id)a5 database:(CalDatabase *)a6 attachmentUUID:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  CFTypeRef v21;
  void *v22;
  void *v23;
  CDBAttachmentInfo *v24;
  NSObject *v25;
  NSObject *v26;
  int v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v11, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      v24 = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v16, "stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_retainAutorelease(v18);
      *a7 = v20;
      v21 = CalDatabaseCopyAttachmentFileWithUUID((os_unfair_lock_s *)a6, (uint64_t)v20);
      if (v21)
      {
        CFRelease(v21);
        objc_msgSend(v12, "URLByAppendingPathComponent:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0D0C258], "localRelativePathForLocalAbsoluteURL:localBaseURL:", v22, v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = -[CDBAttachmentInfo initWithLegacyURL:url:localRelativePath:]([CDBAttachmentInfo alloc], "initWithLegacyURL:url:localRelativePath:", v11, v22, v23);
          }
          else
          {
            v26 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              v28 = 138412802;
              v29 = v20;
              v30 = 2112;
              v31 = v22;
              v32 = 2112;
              v33 = v13;
              _os_log_impl(&dword_1A5CCB000, v26, OS_LOG_TYPE_ERROR, "Could not get new attachment local relative path. attachment uuid = %@ new attachment url = %@, new calendar data container = %@", (uint8_t *)&v28, 0x20u);
            }
            v24 = 0;
          }

        }
        else
        {
          v24 = 0;
        }

        goto LABEL_19;
      }
      v25 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        v28 = 138412290;
        v29 = v20;
        _os_log_impl(&dword_1A5CCB000, v25, OS_LOG_TYPE_INFO, "Could not get attachment for file name = %@", (uint8_t *)&v28, 0xCu);
      }
    }
    v24 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v24 = 0;
LABEL_21:

  return v24;
}

+ (BOOL)_createNewContainerIfNeeded:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  char v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    LOBYTE(v12) = 0;
    if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v12))
      v8 = v12 == 0;
    else
      v8 = 1;
    if (v8)
      v10 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, a4);
    else
      v10 = 1;
  }
  else
  {
    v9 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1A5CCB000, v9, OS_LOG_TYPE_ERROR, "New container path is nil. new attachment container = %@", (uint8_t *)&v12, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

+ (void)migrateDataClassProtectionForAttachmentsInLegacyCalendarDataContainer:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5CCB000, v4, OS_LOG_TYPE_INFO, "Fixing up dataclass protection for calendar attachments", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D0C258], "legacyAttachmentContainerWithBaseURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v18 = v5;
    v19 = v3;
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumeratorAtPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v7, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          if (objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v14, &v20))
            v15 = v20 == 0;
          else
            v15 = 0;
          if (v15)
          {
            v16 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v14;
              _os_log_impl(&dword_1A5CCB000, v16, OS_LOG_TYPE_INFO, "Setting dataclass protection for attachment: %@", buf, 0xCu);
            }
            CalAttachmentFileSetDataProtection(v14);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v11);
    }

    v6 = v18;
    v3 = v19;
  }
  else
  {
    v17 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5CCB000, v17, OS_LOG_TYPE_ERROR, "Could not get legacy attachment container", buf, 2u);
    }
  }

}

@end
