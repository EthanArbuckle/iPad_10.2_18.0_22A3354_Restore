@implementation EKUIFacetimeManager

+ (id)preferredHandleForContact:(id)a3 withDefaultPhoneNumber:(id)a4 emailAddress:(id)a5
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)EKWeakLinkClass();
  v11 = v8;
  v12 = v9;
  objc_msgSend(v7, "phoneNumbers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = v11;
  if (v14)
  {
    objc_msgSend(v7, "phoneNumbers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "emailAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  v21 = v12;
  if (v20)
  {
    objc_msgSend(v7, "emailAddresses");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v15)
  {
    v24 = [v10 alloc];
    v25 = 2;
    v26 = v15;
  }
  else
  {
    if (!v21)
    {
      v27 = 0;
      goto LABEL_10;
    }
    v24 = [v10 alloc];
    v25 = 3;
    v26 = v21;
  }
  v27 = (void *)objc_msgSend(v24, "initWithType:value:", v25, v26);
LABEL_10:

  return v27;
}

+ (id)handlesForParticipants:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v7;
  id v8;

  v3 = a3;
  EKWeakLinkClass();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = v3;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  CalendarFoundationPerformBlockOnSharedContactStore();
  v5 = v8;

  return v5;
}

void __46__EKUIFacetimeManager_handlesForParticipants___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v21 = *MEMORY[0x1E0C967C0];
    v20 = *MEMORY[0x1E0C966A8];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        objc_msgSend(v7, "phoneNumber", v20, v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "emailAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = v8 == 0;
        else
          v10 = 1;
        if (!v10)
        {
LABEL_14:
          v16 = objc_alloc(*(Class *)(a1 + 56));
          v17 = 2;
          v18 = v8;
          goto LABEL_15;
        }
        v28[0] = v21;
        v28[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "contactPredicate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "unifiedContactsMatchingPredicate:keysToFetch:error:", v12, v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "preferredHandleForContact:withDefaultPhoneNumber:emailAddress:", v14, v8, v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            goto LABEL_16;
          if (v8)
            goto LABEL_14;
        }
        else
        {

          if (v8)
            goto LABEL_14;
        }
        if (v9)
        {
          v16 = objc_alloc(*(Class *)(a1 + 56));
          v17 = 3;
          v18 = v9;
LABEL_15:
          v15 = (void *)objc_msgSend(v16, "initWithType:value:", v17, v18);
          if (!v15)
            goto LABEL_17;
LABEL_16:
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

        }
LABEL_17:

        ++v6;
      }
      while (v4 != v6);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v4 = v19;
    }
    while (v19);
  }

}

+ (id)handlesForContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "preferredHandleForContact:withDefaultPhoneNumber:emailAddress:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), 0, 0, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)faceTimeAvailable:(unint64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;

  objc_msgSend((id)EKWeakLinkClass(), "defaultCapabilitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "isFaceTimeAudioAvailable");
  if (objc_msgSend(v5, "isFaceTimeAppAvailable"))
    v7 = objc_msgSend(v5, "isConferencingAvailable") & v6;
  else
    LOBYTE(v7) = 0;

  return v7;
}

+ (BOOL)canFaceTime:(unint64_t)a3 withParticipants:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v6 = a4;
  if (objc_msgSend(a1, "faceTimeAvailable:", a3))
  {
    objc_msgSend(a1, "handlesForParticipants:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = v8 == objc_msgSend(v6, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)canFaceTime:(unint64_t)a3 withContacts:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v6 = a4;
  if (objc_msgSend(a1, "faceTimeAvailable:", a3))
  {
    objc_msgSend(a1, "handlesForContacts:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = v8 == objc_msgSend(v6, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)faceTimeURLForType:(unint64_t)a3 andHandle:(id)a4
{
  id v5;
  objc_class *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (objc_class *)EKWeakLinkClass();
  v7 = (objc_class *)EKWeakLinkClass();
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "faceTimeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend([v7 alloc], "initWithProvider:", v9);
  objc_msgSend(v10, "setHandle:", v5);

  objc_msgSend(v10, "setVideo:", a3 == 1);
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)faceTimeURLForType:(unint64_t)a3 withHandles:(id)a4
{
  id v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_class *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)EKWeakLinkClass();
  v8 = EKWeakLinkClass();
  if (objc_msgSend(v6, "count") != 1)
  {
    v22 = (objc_class *)v8;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v13)
      goto LABEL_15;
    v14 = v13;
    v15 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", sel_initWithHandle_nickname_))
        {
          v18 = objc_msgSend([v7 alloc], "initWithHandle:nickname:", v17, 0);
        }
        else
        {
          if (!-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", sel_initWithHandle_))continue;
          v18 = objc_msgSend([v7 alloc], "initWithHandle:", v17);
        }
        v19 = (void *)v18;
        objc_msgSend(v11, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v14)
      {
LABEL_15:

        v20 = (void *)objc_msgSend([v22 alloc], "initWithRemoteMembers:", v11);
        objc_msgSend(v20, "setVideoEnabled:", 0);
        objc_msgSend(v20, "URL");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
    }
  }
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "faceTimeURLForType:andHandle:", a3, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v10;
}

+ (id)faceTimeURLForType:(unint64_t)a3 withParticipants:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "handlesForParticipants:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "faceTimeURLForType:withHandles:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)faceTimeURLForType:(unint64_t)a3 withContacts:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "handlesForContacts:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "faceTimeURLForType:withHandles:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)startFaceTime:(unint64_t)a3 withParticipants:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a1, "faceTimeURLForType:withParticipants:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:configuration:completionHandler:", v5, 0, &__block_literal_global_62);

}

void __54__EKUIFacetimeManager_startFaceTime_withParticipants___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when FaceTime URL tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

+ (void)startFaceTime:(unint64_t)a3 withContacts:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a1, "faceTimeURLForType:withContacts:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:configuration:completionHandler:", v5, 0, &__block_literal_global_26);

}

void __50__EKUIFacetimeManager_startFaceTime_withContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when FaceTime URL tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

@end
