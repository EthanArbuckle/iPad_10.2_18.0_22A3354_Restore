@implementation CNUICoreContactEditingSession

- (CNUICoreContactEditingSession)init
{
  CNUICoreContactEditingSession *v2;
  uint64_t v3;
  CNUICoreContactScratchpad *contactsAdded;
  uint64_t v5;
  CNUICoreContactScratchpad *contactsUpdated;
  uint64_t v7;
  CNUICoreContactScratchpad *contactsRemoved;
  CNUICoreContactEditingSession *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNUICoreContactEditingSession;
  v2 = -[CNUICoreContactEditingSession init](&v11, sel_init);
  if (v2)
  {
    +[CNUICoreContactScratchpad emptyScratchpad](CNUICoreContactScratchpad, "emptyScratchpad");
    v3 = objc_claimAutoreleasedReturnValue();
    contactsAdded = v2->_contactsAdded;
    v2->_contactsAdded = (CNUICoreContactScratchpad *)v3;

    +[CNUICoreContactScratchpad emptyScratchpad](CNUICoreContactScratchpad, "emptyScratchpad");
    v5 = objc_claimAutoreleasedReturnValue();
    contactsUpdated = v2->_contactsUpdated;
    v2->_contactsUpdated = (CNUICoreContactScratchpad *)v5;

    +[CNUICoreContactScratchpad emptyScratchpad](CNUICoreContactScratchpad, "emptyScratchpad");
    v7 = objc_claimAutoreleasedReturnValue();
    contactsRemoved = v2->_contactsRemoved;
    v2->_contactsRemoved = (CNUICoreContactScratchpad *)v7;

    v9 = v2;
  }

  return v2;
}

- (BOOL)inProgress
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v3 = *MEMORY[0x1E0D13840];
  -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v5))
  {
    -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v7))
    {
      -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allContacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v9) ^ 1;

    }
    else
    {
      LOBYTE(v10) = 1;
    }

  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)addContacts:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_11 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_11, &__block_literal_global_66);
    v5 = CNGuardOSLog_cn_once_object_0_11;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_11, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactEditingSession addContacts:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        switch(-[CNUICoreContactEditingSession editingStateOfContact:](self, "editingStateOfContact:", v18, (_QWORD)v24))
        {
          case 1:
            -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v18;
            v20 = (void *)MEMORY[0x1E0C99D20];
            v21 = &v31;
            goto LABEL_15;
          case 2:
            -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v18;
            v20 = (void *)MEMORY[0x1E0C99D20];
            v21 = &v30;
LABEL_15:
            objc_msgSend(v20, "arrayWithObjects:count:", v21, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scratchpadByAddingContacts:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsAdded:](self, "setContactsAdded:", v23);
            goto LABEL_17;
          case 3:
            -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scratchpadByAddingContacts:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsUpdated:](self, "setContactsUpdated:", v23);
            goto LABEL_17;
          case 4:
            -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scratchpadByRemovingContacts:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsRemoved:](self, "setContactsRemoved:", v23);
LABEL_17:

            break;
          default:
            break;
        }
        -[CNUICoreContactEditingSession verifyConsistencyOfEditingSessionForContact:](self, "verifyConsistencyOfEditingSessionForContact:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }

}

- (int64_t)editingStateOfContact:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int64_t v9;
  int64_t result;
  int v11;
  int v12;
  int64_t v13;
  int64_t v14;

  v4 = a3;
  v5 = -[CNUICoreContactEditingSession isContactUnseen:](self, "isContactUnseen:", v4);
  v6 = -[CNUICoreContactEditingSession wasContactAdded:](self, "wasContactAdded:", v4);
  v7 = -[CNUICoreContactEditingSession wasContactUpdated:](self, "wasContactUpdated:", v4);
  v8 = -[CNUICoreContactEditingSession wasContactRemoved:](self, "wasContactRemoved:", v4);

  if (v5 && !v6)
  {
    if (v8)
    {
      v9 = 1;
      if (!v5)
        v9 = 2;
      if (v7)
        result = v9;
      else
        result = 5;
      if (!v7 || v5)
        return result;
LABEL_26:
      v14 = 4;
      if (!v8)
        v14 = 0;
      if (v7)
        return 3;
      else
        return v14;
    }
    goto LABEL_20;
  }
  v11 = v5 || !v6;
  if (((v11 | v8) & 1) == 0)
  {
LABEL_20:
    if (v7)
      return 5;
LABEL_22:
    if (v5)
      result = 1;
    else
      result = 2;
    if (v5 || v6)
      return result;
    goto LABEL_26;
  }
  if ((v5 || !v6) && v8 && !v7)
    goto LABEL_22;
  v12 = v11 & v8 | !v7;
  v13 = 1;
  if (!v5)
    v13 = 2;
  if (v12)
    result = 5;
  else
    result = v13;
  if (((v12 | (v5 || v6)) & 1) == 0)
    goto LABEL_26;
  return result;
}

- (BOOL)isContactUnseen:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsContact:", v4) & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsContact:", v4) & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "containsContact:", v4) ^ 1;

    }
  }

  return v6;
}

- (BOOL)wasContactAdded:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsContact:", v4);

  return v6;
}

- (BOOL)wasContactUpdated:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsContact:", v4);

  return v6;
}

- (BOOL)wasContactRemoved:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsContact:", v4);

  return v6;
}

+ (BOOL)isEdiingStateOfContactValid:(int64_t)a3
{
  BOOL v3;

  if (a3)
    v3 = a3 == 5;
  else
    v3 = 1;
  return !v3;
}

- (void)updateContacts:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_11 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_11, &__block_literal_global_66);
    v5 = CNGuardOSLog_cn_once_object_0_11;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_11, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactEditingSession updateContacts:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        switch(-[CNUICoreContactEditingSession editingStateOfContact:](self, "editingStateOfContact:", v18, (_QWORD)v29))
        {
          case 1:
            -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v18;
            v20 = (void *)MEMORY[0x1E0C99D20];
            v21 = &v37;
            goto LABEL_14;
          case 2:
            -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v18;
            v24 = (void *)MEMORY[0x1E0C99D20];
            v25 = &v36;
            goto LABEL_17;
          case 3:
            -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v18;
            v20 = (void *)MEMORY[0x1E0C99D20];
            v21 = &v35;
LABEL_14:
            objc_msgSend(v20, "arrayWithObjects:count:", v21, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scratchpadByAddingContacts:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsUpdated:](self, "setContactsUpdated:", v23);
            goto LABEL_18;
          case 4:
            -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "scratchpadByRemovingContacts:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsRemoved:](self, "setContactsRemoved:", v28);

            -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v18;
            v24 = (void *)MEMORY[0x1E0C99D20];
            v25 = &v33;
LABEL_17:
            objc_msgSend(v24, "arrayWithObjects:count:", v25, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scratchpadByAddingContacts:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsAdded:](self, "setContactsAdded:", v23);
LABEL_18:

            break;
          default:
            break;
        }
        -[CNUICoreContactEditingSession verifyConsistencyOfEditingSessionForContact:](self, "verifyConsistencyOfEditingSessionForContact:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v15);
  }

}

- (void)removeContacts:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_11 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_11, &__block_literal_global_66);
    v5 = CNGuardOSLog_cn_once_object_0_11;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_11, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactEditingSession removeContacts:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        switch(-[CNUICoreContactEditingSession editingStateOfContact:](self, "editingStateOfContact:", v18, (_QWORD)v27))
        {
          case 1:
            -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v18;
            v20 = (void *)MEMORY[0x1E0C99D20];
            v21 = &v35;
            goto LABEL_16;
          case 2:
            -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scratchpadByRemovingContacts:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsAdded:](self, "setContactsAdded:", v26);
            goto LABEL_17;
          case 3:
            -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "scratchpadByRemovingContacts:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsUpdated:](self, "setContactsUpdated:", v24);

            -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v18;
            v20 = (void *)MEMORY[0x1E0C99D20];
            v21 = &v32;
            goto LABEL_16;
          case 4:
            -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v18;
            v20 = (void *)MEMORY[0x1E0C99D20];
            v21 = &v31;
LABEL_16:
            objc_msgSend(v20, "arrayWithObjects:count:", v21, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scratchpadByAddingContacts:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNUICoreContactEditingSession setContactsRemoved:](self, "setContactsRemoved:", v26);
LABEL_17:

            break;
          default:
            break;
        }
        -[CNUICoreContactEditingSession verifyConsistencyOfEditingSessionForContact:](self, "verifyConsistencyOfEditingSessionForContact:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v15);
  }

}

- (NSArray)addedContacts
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)updatedContacts
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)removedContacts
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)containsAddedContactMatchingContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNUICoreContactEditingSession addedContacts](self, "addedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v8 != 0;

  return (char)v4;
}

- (BOOL)containsUpdatedContactMatchingContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNUICoreContactEditingSession updatedContacts](self, "updatedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v8 != 0;

  return (char)v4;
}

- (BOOL)containsRemovedContactMatchingContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNUICoreContactEditingSession removedContacts](self, "removedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v8 != 0;

  return (char)v4;
}

- (id)addedContactsMatchingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CNUICoreContactEditingSession addedContacts](self, "addedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__CNUICoreContactEditingSession_addedContactsMatchingContacts___block_invoke;
  v10[3] = &unk_1EA603540;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "_cn_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __63__CNUICoreContactEditingSession_addedContactsMatchingContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)updatedContactsMatchingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CNUICoreContactEditingSession updatedContacts](self, "updatedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__CNUICoreContactEditingSession_updatedContactsMatchingContacts___block_invoke;
  v10[3] = &unk_1EA603540;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "_cn_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __65__CNUICoreContactEditingSession_updatedContactsMatchingContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)removedContactsMatchingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CNUICoreContactEditingSession removedContacts](self, "removedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_indexBy:", kCNUICoreContactToIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__CNUICoreContactEditingSession_removedContactsMatchingContacts___block_invoke;
  v10[3] = &unk_1EA603540;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "_cn_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __65__CNUICoreContactEditingSession_removedContactsMatchingContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)generateSaveRequest
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  -[CNUICoreContactEditingSession addedContacts](self, "addedContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke;
  v18[3] = &unk_1EA6038F0;
  v6 = v3;
  v19 = v6;
  objc_msgSend(v4, "_cn_each:", v18);

  -[CNUICoreContactEditingSession updatedContacts](self, "updatedContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke_2;
  v16[3] = &unk_1EA6038F0;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v7, "_cn_each:", v16);

  -[CNUICoreContactEditingSession removedContacts](self, "removedContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke_3;
  v14[3] = &unk_1EA6038F0;
  v10 = v8;
  v15 = v10;
  objc_msgSend(v9, "_cn_each:", v14);

  v11 = v15;
  v12 = v10;

  return v12;
}

void __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "addContact:toContainerWithIdentifier:", v3, 0);

}

void __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "updateContact:", v3);

}

void __52__CNUICoreContactEditingSession_generateSaveRequest__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "deleteContact:", v3);

}

- (id)applyChangesToContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[CNUICoreContactEditingSession removedContacts](self, "removedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_indexBy:", kCNUICoreContactToIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUICoreContactEditingSession updatedContacts](self, "updatedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_indexBy:", kCNUICoreContactToIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__CNUICoreContactEditingSession_applyChangesToContacts___block_invoke;
    v22[3] = &unk_1EA603568;
    v23 = v7;
    v11 = v7;
    objc_msgSend(v4, "_cn_filter:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    v18 = 3221225472;
    v19 = __56__CNUICoreContactEditingSession_applyChangesToContacts___block_invoke_2;
    v20 = &unk_1EA603540;
    v21 = v9;
    v13 = v9;
    objc_msgSend(v12, "_cn_map:", &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreContactEditingSession addedContacts](self, "addedContacts", v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

BOOL __56__CNUICoreContactEditingSession_applyChangesToContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

id __56__CNUICoreContactEditingSession_applyChangesToContacts___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v3;
  v7 = v5;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactEditingSession contactsAdded](self, "contactsAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("contactsAdded"));

  -[CNUICoreContactEditingSession contactsUpdated](self, "contactsUpdated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("contactsUpdated"));

  -[CNUICoreContactEditingSession contactsRemoved](self, "contactsRemoved");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("contactsRemoved"));

  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CNUICoreContactScratchpad)contactsAdded
{
  return self->_contactsAdded;
}

- (void)setContactsAdded:(id)a3
{
  objc_storeStrong((id *)&self->_contactsAdded, a3);
}

- (CNUICoreContactScratchpad)contactsUpdated
{
  return self->_contactsUpdated;
}

- (void)setContactsUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_contactsUpdated, a3);
}

- (CNUICoreContactScratchpad)contactsRemoved
{
  return self->_contactsRemoved;
}

- (void)setContactsRemoved:(id)a3
{
  objc_storeStrong((id *)&self->_contactsRemoved, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsRemoved, 0);
  objc_storeStrong((id *)&self->_contactsUpdated, 0);
  objc_storeStrong((id *)&self->_contactsAdded, 0);
}

- (void)addContacts:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contactsToAdd’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateContacts:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contactsToUpdate’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)removeContacts:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contactsToRemove’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
