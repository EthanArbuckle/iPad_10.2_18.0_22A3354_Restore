@implementation IMContactStoreChangeHistoryEventsHandler

- (void)visitDropEverythingEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[IMContactStoreChangeHistoryEventsHandler setReceivedDropEverythingEvent:](self, "setReceivedDropEverythingEvent:", 1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Handling a Drop everything change history event", v8, 2u);
    }

  }
  +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleDropEverythingEvent");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__mainThreadPostNotificationName:object:", IMCSChangeHistoryDropEverythingEventNotification, self);

}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Handling a Add Contact change history event", v7, 2u);
    }

  }
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMContactStoreChangeHistoryEventsHandler processContactChangeEventForContact:ofEventType:](self, "processContactChangeEventForContact:ofEventType:", v6, 1);

}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Handling a Delete Contact change history event", buf, 2u);
    }

  }
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v6, CFSTR("__kIMCSChangeHistoryContactIdentifierKey"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__mainThreadPostNotificationName:object:userInfo:", IMCSChangeHistoryDeleteContactEventNotification, self, v7);

}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Handling a Update Contact change history event", v7, 2u);
    }

  }
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMContactStoreChangeHistoryEventsHandler processContactChangeEventForContact:ofEventType:](self, "processContactChangeEventForContact:ofEventType:", v6, 2);

}

- (void)processContactChangeEventForContact:(id)a3 ofEventType:(unint64_t)a4
{
  id v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  __int128 v43;
  id obj;
  uint64_t v45;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v50 = v4;
    +[IMContactStore IDsFromCNContact:](IMContactStore, "IDsFromCNContact:", v4);
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (!v48)
    {
      v49 = 0;
      goto LABEL_61;
    }
    v49 = 0;
    v45 = *(_QWORD *)v61;
    *(_QWORD *)&v5 = 138412290;
    v43 = v5;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v61 != v45)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v51 = v6;
        v8 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v6);
        +[IMContactStore sharedInstance](IMContactStore, "sharedInstance", v43);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "getContactForID:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v8;
        v12 = MEMORY[0x1A1AE7D10]();
        if (v10)
          v13 = 0;
        else
          v13 = v12;
        if (v13 != 1)
        {
          v20 = v11;
          goto LABEL_49;
        }
        +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleIDsForCNID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        if (!v18)
        {

          v20 = v11;
LABEL_28:
          if ((objc_msgSend(v20, "hasPrefix:", CFSTR("+")) & 1) != 0)
          {
            v10 = 0;
          }
          else
          {
            +[IMContactStore IDWithCurrentLocaleITUCode:](IMContactStore, "IDWithCurrentLocaleITUCode:", v20);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v43;
                v66 = v27;
                _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "Re-attempting to lookup cache with ID & ITU: %@", buf, 0xCu);
              }

            }
            +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "getAllKeysFromIDToCNContactMap");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v31 = v30;
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            if (v32)
            {
              v33 = *(_QWORD *)v53;
LABEL_36:
              v34 = 0;
              while (1)
              {
                if (*(_QWORD *)v53 != v33)
                  objc_enumerationMutation(v31);
                v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v34);
                if (objc_msgSend(v35, "isEqualToString:", v27))
                  break;
                objc_msgSend(CFSTR("+"), "stringByAppendingString:", v20);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v35, "isEqualToString:", v36);

                if (v37)
                {
                  objc_msgSend(CFSTR("+"), "stringByAppendingString:", v20);
                  v39 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_46;
                }
                if (v32 == ++v34)
                {
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                  if (v32)
                    goto LABEL_36;
                  goto LABEL_43;
                }
              }
              v39 = v35;
LABEL_46:
              v38 = v39;

              goto LABEL_47;
            }
LABEL_43:
            v38 = v20;
LABEL_47:

            +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "getContactForID:", v38);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = v38;
          }
          goto LABEL_48;
        }
        v10 = 0;
        v19 = *(_QWORD *)v57;
        v20 = v11;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v57 != v19)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            if (objc_msgSend(v22, "containsString:", v20))
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v66 = v22;
                  v67 = 2112;
                  v68 = v11;
                  _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Re-attempting to lookup cache with ID: %@. Previous ID was %@", buf, 0x16u);
                }

              }
              v24 = v22;

              +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "getContactForID:", v24);
              v26 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v26;
              v20 = v24;
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        }
        while (v18);

        if (!v10)
          goto LABEL_28;
LABEL_48:

LABEL_49:
        -[IMContactStoreChangeHistoryEventsHandler processChangeEventForContact:contactFromCache:eventType:handleID:](self, "processChangeEventForContact:contactFromCache:eventType:handleID:", v50, v10, a4, v20);
        if (objc_msgSend(v20, "length"))
        {
          v41 = v49;
          if (!v49)
            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v49 = v41;
          objc_msgSend(v41, "addObject:", v20);
        }

        v6 = v51 + 1;
      }
      while (v51 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      if (!v48)
      {
LABEL_61:

        -[IMContactStoreChangeHistoryEventsHandler postNotificationForCNContact:eventType:handleIDsToProcess:](self, "postNotificationForCNContact:eventType:handleIDsToProcess:", v50, a4, v49);
        v4 = v50;
        goto LABEL_62;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v42, OS_LOG_TYPE_INFO, "Invalid Contact, not handling contact change event.", buf, 2u);
    }

  }
LABEL_62:

}

- (void)processChangeEventForContact:(id)a3 contactFromCache:(id)a4 eventType:(unint64_t)a5 handleID:(id)a6
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v33 = a4;
  v10 = a6;
  v11 = v10;
  if (a5 == 2)
  {
    v31 = v10;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v31;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Removing contact for ID %@ from Contact Store cache and adding the new one.", buf, 0xCu);
      }

    }
    +[IMContactStore sharedInstance](IMContactStore, "sharedInstance", v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "replaceContact:withID:", v9, v32);

    +[IMContactStore IDsFromCNContact:](IMContactStore, "IDsFromCNContact:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore IDsFromCNContact:](IMContactStore, "IDsFromCNContact:", v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    v22 = objc_msgSend(v21, "count");
    if (v22 > objc_msgSend(v19, "count"))
    {
      objc_msgSend(v21, "removeObjectsInArray:", v19);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "replaceWithMutableContactForID:", v27);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v24);
      }

    }
    v11 = v32;
  }
  else if (a5 == 1)
  {
    v12 = +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v33);
    v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v33);
          v16 = CFSTR("NO");
          if (v15)
            v16 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          v40 = v11;
          v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Not prcoessing add event for ID already known to us %@. isAKnownContact:%@", buf, 0x16u);
        }

      }
    }
    else
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v11;
          _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "Removing contact for ID %@ from Contact Store cache and adding the new one.", buf, 0xCu);
        }

      }
      +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "replaceContact:withID:", v9, v11);

    }
  }

}

- (void)postNotificationForCNContact:(id)a3 eventType:(unint64_t)a4 handleIDsToProcess:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  __CFString **v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v9, "count");
  if (v8 && v10)
  {
    if (a4 == 1)
    {
      v11 = &IMCSChangeHistoryAddContactEventNotification;
    }
    else
    {
      if (a4 != 2)
      {
        v13 = 0;
        v14 = 0;
        goto LABEL_13;
      }
      v11 = &IMCSChangeHistoryUpdateContactEventNotification;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, CFSTR("__kIMCSChangeHistoryHandleIDsKey"), v8, CFSTR("__kIMCSChangeHistoryContactKey"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *v11;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "__mainThreadPostNotificationName:object:userInfo:", v14, self, v13);

    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "No handleIDs to process or invalid CNContact.", buf, 2u);
    }

  }
LABEL_14:

}

- (BOOL)receivedDropEverythingEvent
{
  return self->_receivedDropEverythingEvent;
}

- (void)setReceivedDropEverythingEvent:(BOOL)a3
{
  self->_receivedDropEverythingEvent = a3;
}

@end
