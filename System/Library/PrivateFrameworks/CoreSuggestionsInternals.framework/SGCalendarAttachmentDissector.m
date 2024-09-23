@implementation SGCalendarAttachmentDissector

- (SGCalendarAttachmentDissector)init
{
  SGCalendarAttachmentDissector *v2;
  uint64_t v3;
  SGAccountsAdapter *accountsAdapter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGCalendarAttachmentDissector;
  v2 = -[SGCalendarAttachmentDissector init](&v6, sel_init);
  if (v2)
  {
    +[SGAccountsAdapter sharedInstance](SGAccountsAdapter, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    accountsAdapter = v2->_accountsAdapter;
    v2->_accountsAdapter = (SGAccountsAdapter *)v3;

  }
  return v2;
}

- (id)downloadedCalendarAttachmentsFrom:(id)a3
{
  return (id)sgFilter();
}

- (BOOL)shouldIgnoreEntity:(id)a3
{
  int v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = objc_msgSend(a3, "hasEventEnrichment");
  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "Ignoring attachments because a structured event already found", v6, 2u);
    }

  }
  return v3;
}

- (BOOL)hasCalendarAccountForOneOf:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[SGAccountsAdapter hasCalendarAccount:](self->_accountsAdapter, "hasCalendarAccount:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (SGMEventICSSourceType_)accountTypeFor:(id)a3
{
  id v3;
  unint64_t *v4;
  SGMEventICSSourceType_ v5;
  char v7;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("@icloud.com")) & 1) != 0
    || (objc_msgSend(v3, "containsString:", CFSTR("@me.com")) & 1) != 0
    || (objc_msgSend(v3, "containsString:", CFSTR("@mac.com")) & 1) != 0)
  {
    v4 = (unint64_t *)MEMORY[0x1E0D19C28];
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("@gmail.com")) & 1) != 0
         || (objc_msgSend(v3, "containsString:", CFSTR("@googlemail.com")) & 1) != 0
         || (objc_msgSend(v3, "containsString:", CFSTR("@google.com")) & 1) != 0)
  {
    v4 = (unint64_t *)MEMORY[0x1E0D19C20];
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("@yahoo.com")) & 1) != 0
         || (objc_msgSend(v3, "containsString:", CFSTR("@yahoo.co.uk")) & 1) != 0
         || (objc_msgSend(v3, "containsString:", CFSTR("@ymail.com")) & 1) != 0
         || (objc_msgSend(v3, "containsString:", CFSTR("@sbcglobal.net")) & 1) != 0
         || (objc_msgSend(v3, "containsString:", CFSTR("@rocketmail.com")) & 1) != 0)
  {
    v4 = (unint64_t *)MEMORY[0x1E0D19C40];
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("@outlook.com")) & 1) != 0
         || (objc_msgSend(v3, "containsString:", CFSTR("@hotmail.com")) & 1) != 0)
  {
    v4 = (unint64_t *)MEMORY[0x1E0D19C30];
  }
  else
  {
    v7 = objc_msgSend(v3, "containsString:", CFSTR("@hotmail.co.uk"));
    v4 = (unint64_t *)MEMORY[0x1E0D19C30];
    if ((v7 & 1) == 0 && !objc_msgSend(v3, "containsString:", CFSTR("@rocketmaill.com")))
      v4 = (unint64_t *)MEMORY[0x1E0D19C38];
  }
  v5.var0 = *v4;

  return v5;
}

- (id)enrichmentsFromData:(id)a3 inDocument:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SGMEventICSSourceType_ v41;
  void *v42;
  void *v43;
  SGMEventICSSourceType_ v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v60;
  id obj;
  void *v62;
  __CFString *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  _QWORD v67[5];
  uint8_t buf[8];
  uint8_t *v69;
  uint64_t v70;
  char v71;
  char v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v9 = a4;
  v60 = a5;
  v57 = a6;
  v62 = (void *)objc_opt_new();
  v58 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v66 = v9;
  objc_msgSend(v9, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v74;
    v56 = *MEMORY[0x1E0D19D90];
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v74 != v64)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v66, "calendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentForKey:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
LABEL_40:

      objc_autoreleasePoolPop(v13);
      if (v65 == ++v11)
      {
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
        if (v65)
          goto LABEL_3;
        goto LABEL_42;
      }
    }
    v16 = objc_msgSend(v15, "method");
    if (!v16)
    {
      objc_msgSend(v66, "calendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "method");

    }
    if (v16 > 2)
    {
LABEL_39:
      if ((unint64_t)objc_msgSend(v62, "count") > 0xA)
      {

        objc_autoreleasePoolPop(v13);
        v52 = 0;
        goto LABEL_44;
      }
      goto LABEL_40;
    }
    v72 = 1;
    objc_msgSend(v66, "calendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enrichmentWithParentEntity:withCalendar:withCorrectnessFlag:", v57, v18, &v72);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "uid");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = &stru_1E7DB83A8;
    if (v20)
      v22 = (__CFString *)v20;
    v63 = v22;

    if (v19)
    {
      if ((objc_msgSend(v58, "containsObject:", v63) & 1) == 0)
      {
        sgLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEBUG, "Found event", buf, 2u);
        }

        objc_msgSend(v62, "addObject:", v19);
        objc_msgSend(v58, "addObject:", v63);
        *(_QWORD *)buf = 0;
        v69 = buf;
        v70 = 0x2020000000;
        v71 = 0;
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __91__SGCalendarAttachmentDissector_enrichmentsFromData_inDocument_parentMessage_parentEntity___block_invoke;
        v67[3] = &unk_1E7DABC38;
        v67[4] = buf;
        objc_msgSend(MEMORY[0x1E0CAA078], "sg_usingSharedStoreForReadingOnly:", v67);
        objc_msgSend(v19, "timeRange");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "startTimeZone");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "name");
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (!v27)
        {
          v28 = CFSTR("floating");
          if (v69[24])
            v28 = 0;
        }
        v29 = v28;

        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "timezoneIdentifier:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addTag:", v30);

        }
        if (!v72)
          objc_msgSend(v54, "setValue:forKey:", v29, v63);
        objc_msgSend(v60, "accountHandles");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(getMailAccountClass(), "activeAccounts");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        if (v32 && v33)
        {
          objc_msgSend(getMailAccountClass(), "accountContainingEmailAddress:", v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v35 && objc_msgSend(v35, "sourceIsManaged"))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "managedSourceAccount:", CFSTR("MCAccountIsManaged"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addTag:", v37);

          }
        }
        objc_msgSend(MEMORY[0x1E0D197F0], "icsAttachmentData:", v55);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addTag:", v38);

        _Block_object_dispose(buf, 8);
        goto LABEL_37;
      }
      if (!objc_msgSend(v58, "containsObject:", v63))
      {
LABEL_37:

        if (v16 == 2)
        {
          objc_msgSend(v60, "author");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "sg_emailAddress");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41.var0 = (unint64_t)-[SGCalendarAttachmentDissector accountTypeFor:](self, "accountTypeFor:", v40);

          objc_msgSend(v60, "accountHandles");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44.var0 = (unint64_t)-[SGCalendarAttachmentDissector accountTypeFor:](self, "accountTypeFor:", v43);

          v45 = (void *)objc_opt_new();
          objc_msgSend(v45, "setSource:", v41.var0);
          objc_msgSend(v45, "setRecipient:", v44.var0);
          objc_msgSend(v60, "accountHandles");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setAccountSetup:", -[SGCalendarAttachmentDissector hasCalendarAccountForOneOf:](self, "hasCalendarAccountForOneOf:", v46));

          objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "trackScalarForMessage:", v45);

          v48 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v45, "key");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v48, "initWithFormat:", CFSTR("%@.%@"), v56, v49);

          objc_msgSend(v45, "dictionaryRepresentation");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

        }
        goto LABEL_39;
      }
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEBUG, "Ignoring event that has the same UID as another event in the same ics attachment.", buf, 2u);
      }
    }
    else
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "Failed to parse event from ics attachment.", buf, 2u);
      }
    }

    goto LABEL_37;
  }
LABEL_42:

  v52 = v62;
LABEL_44:

  return v52;
}

- (void)_dissectMessage:(id)a3 entity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  SGCalendarAttachmentDissector *v39;
  void *v40;
  NSObject *obj;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v39 = self;
  if (!-[SGCalendarAttachmentDissector shouldIgnoreEntity:](self, "shouldIgnoreEntity:", v7))
  {
    if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEvents") & 1) != 0)
    {
      objc_msgSend(v6, "attachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGCalendarAttachmentDissector downloadedCalendarAttachmentsFrom:](self, "downloadedCalendarAttachmentsFrom:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v38 = v6;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "attachments");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v51 = objc_msgSend(v35, "count");
        v52 = 2048;
        v53 = -[NSObject count](v9, "count");
        _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "Message with %lu attachments (%lu downloaded ics)", buf, 0x16u);

        v6 = v38;
      }

      if (-[NSObject count](v9, "count"))
      {
        v37 = v7;
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        obj = v9;
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = 0;
          v40 = 0;
          v42 = *(_QWORD *)v46;
          while (1)
          {
            v15 = 0;
            v16 = v13;
            do
            {
              if (*(_QWORD *)v46 != v42)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
              v18 = (void *)MEMORY[0x1C3BD4F6C]();
              v19 = objc_alloc(MEMORY[0x1E0C99D50]);
              objc_msgSend(v17, "path");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = 0;
              v13 = (void *)objc_msgSend(v19, "initWithContentsOfFile:options:error:", v20, 1, &v44);
              v21 = v44;

              if (v21 || !v13)
              {
                sgLogHandle();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v17, "path");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v51 = (uint64_t)v31;
                  v52 = 2112;
                  v53 = (uint64_t)v21;
                  _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "Error when reading attachment at %@:\n%@", buf, 0x16u);

                }
LABEL_25:

LABEL_26:
                goto LABEL_27;
              }
              v22 = objc_alloc(MEMORY[0x1E0DDB820]);
              v43 = 0;
              v23 = (void *)objc_msgSend(v22, "initWithData:options:error:", v13, 0, &v43);
              v21 = v43;

              if (v21 || !v23)
              {
                sgLogHandle();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v17, "path");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v51 = (uint64_t)v32;
                  v52 = 2112;
                  v53 = (uint64_t)v21;
                  _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "Error when instantiating ICSDocument for attachment at %@:\n%@", buf, 0x16u);

                }
                v14 = v23;
                goto LABEL_25;
              }
              objc_msgSend(v23, "calendar");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "calscale");
              v25 = objc_claimAutoreleasedReturnValue();
              if (!v25
                || (v26 = (void *)v25,
                    objc_msgSend(v24, "calscale"),
                    v27 = (void *)objc_claimAutoreleasedReturnValue(),
                    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("GREGORIAN")),
                    v27,
                    v26,
                    v28))
              {
                v6 = v38;
                -[SGCalendarAttachmentDissector enrichmentsFromData:inDocument:parentMessage:parentEntity:](v39, "enrichmentsFromData:inDocument:parentMessage:parentEntity:", v13, v23, v38, v37, v36);
                v21 = (id)objc_claimAutoreleasedReturnValue();
                if (!v21
                  || (v29 = objc_msgSend(v36, "count"), (unint64_t)(objc_msgSend(v21, "count") + v29) >= 0xB))
                {

                  objc_autoreleasePoolPop(v18);
                  v9 = obj;

                  v34 = v36;
                  v7 = v37;
                  goto LABEL_37;
                }
                objc_msgSend(v36, "addObjectsFromArray:", v21);
                v40 = v24;
                v14 = v23;
                goto LABEL_26;
              }
              v40 = v24;
              v14 = v23;
LABEL_27:
              objc_autoreleasePoolPop(v18);
              ++v15;
              v16 = v13;
            }
            while (v12 != v15);
            v33 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            v12 = v33;
            if (!v33)
              goto LABEL_36;
          }
        }
        v13 = 0;
        v14 = 0;
        v40 = 0;
LABEL_36:
        v9 = obj;

        v34 = v36;
        v7 = v37;
        objc_msgSend(v37, "addEnrichments:", v36);
        v24 = v40;
        v23 = v14;
        v6 = v38;
LABEL_37:

      }
    }
    else
    {
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "Skipping calendar attachment dissector: detectStructuredEvents is OFF", buf, 2u);
      }
    }

  }
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGCalendarAttachmentDissector _dissectMessage:entity:](self, "_dissectMessage:entity:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGCalendarAttachmentDissector _dissectMessage:entity:](self, "_dissectMessage:entity:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
}

void __91__SGCalendarAttachmentDissector_enrichmentsFromData_inDocument_parentMessage_parentEntity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "defaultCalendarForNewEvents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "isEqualToString:", CFSTR("Gmail"));

}

uint64_t __67__SGCalendarAttachmentDissector_downloadedCalendarAttachmentsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isCalendarMimeType"))
    v3 = objc_msgSend(v2, "isDownloadedLocally");
  else
    v3 = 0;

  return v3;
}

+ (id)baseAttachmentFrom:(id)a3 includingEvents:(id)a4 withRanges:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[6];
  _QWORD v20[3];
  char v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[4];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_retainAutorelease(v7);
  objc_msgSend(v10, "bytes");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3010000000;
  v19[4] = 0;
  v19[5] = 0;
  v19[3] = "";
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__4569;
  v17[4] = __Block_byref_object_dispose__4570;
  v18 = 0;
  v14 = (id)objc_opt_new();
  v15 = v11;
  v16 = v9;
  _PASEnumerateSimpleLinesInUTF8Data();
  v12 = v14;

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  return v12;
}

+ (int64_t)replaceTzid:(id)a3 inDocument:(id)a4 fromOriginal:(id)a5 withBaseLength:(unint64_t)a6 withEventRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  NSUInteger v14;
  void *v15;
  int64_t v16;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  length = a7.length;
  location = a7.location;
  v11 = a3;
  v12 = a4;
  v13 = objc_retainAutorelease(a5);
  v14 = objc_msgSend(v13, "bytes") + location;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v14, length, 0);
  objc_msgSend(v13, "length");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v18 = v11;
  v19 = v12;
  _PASEnumerateSimpleLinesInUTF8Data();
  v16 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v16;
}

+ (id)splitAttachment:(id)a3 intoEvents:(id)a4 withTimezones:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v38;
  id obj;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t);
  void *v63;
  id v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v47 = a5;
  v9 = objc_retainAutorelease(v7);
  v46 = objc_msgSend(v9, "bytes");
  v45 = v9;
  v41 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "baseAttachmentFrom:includingEvents:withRanges:", v9, v8, v41);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v10, "length");
  v11 = v10;
  objc_msgSend(v11, "appendBytes:length:", "END:VCALENDAR\n", 14);
  v38 = (id)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v8;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
  if (v42)
  {
    v12 = 0;
    v40 = *(_QWORD *)v53;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(obj);
        v43 = v13;
        v14 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v13);
        objc_msgSend(v41, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
        v17 = v44;
        if (v16)
        {
          v18 = v16;
          v19 = *(_QWORD *)v49;
          v17 = v44;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v49 != v19)
                objc_enumerationMutation(v15);
              v21 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "rangeValue");
              v23 = v22;
              objc_msgSend(v11, "replaceBytesInRange:withBytes:length:", v17, v12, v46 + v21, v22);
              objc_msgSend(v47, "objectForKeyedSubscript:", v14);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
                v17 += objc_msgSend((id)objc_opt_class(), "replaceTzid:inDocument:fromOriginal:withBaseLength:withEventRange:", v24, v11, v45, v17, v21, v23);
              v17 += v23;

              v12 = 0;
            }
            v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
            v12 = 0;
          }
          while (v18);
        }
        if (v15 && objc_msgSend(v15, "count"))
        {
          v25 = v11;
          v26 = (void *)objc_opt_new();
          v60 = MEMORY[0x1E0C809B0];
          v61 = 3221225472;
          v62 = __removeAttachments_block_invoke;
          v63 = &unk_1E7DA9B18;
          v27 = v25;
          v64 = v27;
          v28 = v26;
          v65 = v28;
          _PASEnumerateSimpleLinesInUTF8Data();
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          objc_msgSend(v28, "reverseObjectEnumerator");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v57;
            do
            {
              for (j = 0; j != v31; ++j)
              {
                if (*(_QWORD *)v57 != v32)
                  objc_enumerationMutation(v29);
                v34 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "rangeValue");
                objc_msgSend(v27, "replaceBytesInRange:withBytes:length:", v34, v35, ", 0);
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
            }
            while (v31);
          }

          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v27, 4);
          objc_msgSend(v38, "addObject:", v36);

        }
        v12 = v17 - v44;

        v13 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    }
    while (v42);
  }

  return v38;
}

uint64_t __99__SGCalendarAttachmentDissector_replaceTzid_inDocument_fromOriginal_withBaseLength_withEventRange___block_invoke(uint64_t a1, uint64_t a2, size_t a3)
{
  size_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  BOOL v12;
  char *v13;
  char *v14;
  id v15;
  char *v16;
  void *v17;
  char *v18;
  char *v19;
  int64_t v20;
  char *v21;
  const char *v22;
  size_t v23;

  v6 = a2 + a3;
  if (a2 + a3 >= *(_QWORD *)(a1 + 56)
    || (result = 0, v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + v6), v8 != 9) && v8 != 32)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = strlen(replaceTzid_inDocument_fromOriginal_withBaseLength_withEventRange__datelines[v9]);
      v12 = v11 <= (int)a3
         && strncmp((const char *)(*(_QWORD *)(a1 + 64) + (int)a2), replaceTzid_inDocument_fromOriginal_withBaseLength_withEventRange__datelines[v9], v11) == 0;
      v10 |= v12;
      ++v9;
    }
    while (v9 != 6);
    if ((v10 & 1) == 0)
      return 1;
    v13 = strnstr((const char *)(*(_QWORD *)(a1 + 64) + a2), "TZID=", a3);
    if (v13)
    {
      v14 = v13;
      v15 = *(id *)(a1 + 32);
      v16 = v14 + 5;
    }
    else
    {
      v17 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(CFSTR(";TZID="), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v17);
      v16 = strnstr((const char *)(*(_QWORD *)(a1 + 64) + a2), ":", a3);
      if (!v16)
      {
LABEL_15:

        return 1;
      }
    }
    v18 = &v16[-*(_QWORD *)(a1 + 64)];
    v19 = strnstr(v16, ":", v6 - (_QWORD)v18);
    if (v19)
    {
      v20 = v19 - v16;
      v21 = &v18[*(_QWORD *)(a1 + 72) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)];
      v15 = objc_retainAutorelease(v15);
      v22 = (const char *)objc_msgSend(v15, "UTF8String");
      v23 = strlen(v22);
      objc_msgSend(*(id *)(a1 + 40), "replaceBytesInRange:withBytes:length:", v21, v20, v22, v23);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v23 - v20;
    }
    goto LABEL_15;
  }
  return result;
}

uint64_t __79__SGCalendarAttachmentDissector_baseAttachmentFrom_includingEvents_withRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  const char *v7;
  int v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  char v24;
  uint64_t v25;
  id *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;

  v6 = *(_QWORD *)(a1 + 104);
  v7 = (const char *)(v6 + a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) += a3;
  if ((int)a3 >= 6)
  {
    if (strncmp(v7, "BEGIN:", 6uLL))
      goto LABEL_7;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(_QWORD *)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v12 + 1;
    if (v12)
      goto LABEL_11;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = a3;
    if (a3 >= 0xF)
    {
      if (!strncmp(v7 + 6, "VTIMEZONE", 9uLL))
      {
        v9 = 0;
        v8 = 0;
        v39 = *(_QWORD *)(a1 + 72);
        goto LABEL_57;
      }
      if (strncmp(v7 + 6, "VEVENT", 6uLL))
      {
        if (!strncmp(v7 + 6, "VCALENDAR", 9uLL))
        {
          v9 = 0;
          v8 = 0;
          --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          goto LABEL_14;
        }
        goto LABEL_11;
      }
    }
    else if (a3 < 0xC || strncmp(v7 + 6, "VEVENT", 6uLL))
    {
      goto LABEL_11;
    }
    v9 = 0;
    v8 = 0;
    v39 = *(_QWORD *)(a1 + 80);
LABEL_57:
    *(_BYTE *)(*(_QWORD *)(v39 + 8) + 24) = 1;
    goto LABEL_14;
  }
  if ((int)a3 <= 3)
  {
    v8 = 0;
    v9 = 0;
    v10 = a1 + 80;
    goto LABEL_22;
  }
LABEL_7:
  if (strncmp(v7, "END:", 4uLL))
  {
LABEL_11:
    v9 = 0;
    v8 = 0;
    goto LABEL_14;
  }
  v9 = a3 >= 0xD && strncmp(v7, "END:VCALENDAR", 0xDuLL) == 0;
  v8 = 1;
LABEL_14:
  v10 = a1 + 80;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) && !strncmp(v7, "UID:", 4uLL))
  {
    v13 = a2 + v6 - 1;
    v14 = MEMORY[0x1E0C80978];
    v15 = a3;
    do
    {
      v16 = v15;
      v17 = *(char *)(v13 + v15);
      if ((v17 & 0x80000000) != 0)
        v18 = __maskrune(v17, 0x4000uLL);
      else
        v18 = *(_DWORD *)(v14 + 4 * v17 + 60) & 0x4000;
      v15 = v16 - 1;
    }
    while (v18);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v7 + 4, v16 - 4, 4);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
LABEL_22:
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  if (*(_BYTE *)(v22 + 24))
    v23 = 0;
  else
    v23 = !v9;
  if (v23)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", v7, a3);
    }
    v24 = v8 ^ 1;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v10 + 8) + 24))
      v24 = 1;
    if ((v24 & 1) == 0 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
    {
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v28 = *(__CFString **)(v25 + 40);
      v26 = (id *)(v25 + 40);
      v27 = v28;
      if (v28)
        v29 = v27;
      else
        v29 = &stru_1E7DB83A8;
      objc_storeStrong(v26, v29);
      if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31)
        {
          objc_msgSend(v31, "addObject:", v30);
        }
        else
        {
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v30, 0);
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v33, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));

        }
      }
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = 0;

    }
    if (v8)
    {
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v37 = *(_QWORD *)(v36 + 24) - 1;
      *(_QWORD *)(v36 + 24) = v37;
      if (!v37)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      }
    }
  }
  else
  {
    *(_BYTE *)(v22 + 24) = 1;
  }
  return 1;
}

@end
