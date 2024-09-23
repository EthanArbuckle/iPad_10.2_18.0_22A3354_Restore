@implementation SGMIBiomeEventReducer

+ (void)updateSummaryDict:(id)a3 fetchedUnreadMessages:(id)a4 event:(id)a5 timestamp:(double)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1C3BD4F6C]();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("app_launch"), CFSTR("app_resume"), 0);
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v11, "eventName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v15)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v65 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "updateWithAppLaunchAtTime:", a6);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v18);
    }

  }
  objc_msgSend(v11, "messageId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v11, "messageId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("<%@>"), v24);

    objc_msgSend(v9, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = (void *)objc_opt_new();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, v25);

    }
    objc_msgSend(v11, "eventName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("message_fetched"));

    if (v29)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "updateWithMessageFetchedEventAtTime:", a6);

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v31 = v10;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v61 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "incrementNumberOfMoreRecentUnreadMessageAtFirstViewTime");

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        }
        while (v33);
      }

      objc_msgSend(v31, "addObject:", v25);
      goto LABEL_39;
    }
    objc_msgSend(v11, "eventName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("message_view_start"));

    if (v38)
    {
      if (objc_msgSend(v10, "containsObject:", v25))
        objc_msgSend(v10, "removeObject:", v25);
      objc_msgSend(v9, "objectForKeyedSubscript:", v25);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "updateWithViewStartAtTime:unreadMessageCount:", objc_msgSend(v10, "count"), a6);

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v40 = v10;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v57 != v43)
              objc_enumerationMutation(v40);
            objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "incrementNumberOfMailsViewedBeforeSinceAvailable");

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        }
        while (v42);
      }
      goto LABEL_38;
    }
    objc_msgSend(v11, "eventName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("message_view_end"));

    if (v47)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v25);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "payload");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "updateWithViewEndWithPayload:", v48);
    }
    else
    {
      objc_msgSend(v11, "eventName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("read_changed"));

      if (v50)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v25);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "payload");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "updateWithReadChangedEventWithPayload:", v48);
      }
      else
      {
        objc_msgSend(v11, "eventName");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("flag_changed"));

        if (v52)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v25);
          v40 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "updateWithFlagChangedEvent");
          goto LABEL_38;
        }
        objc_msgSend(v11, "eventName");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("message_moved"));

        objc_msgSend(v9, "objectForKeyedSubscript:", v25);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v55;
        if (!v54)
        {
          objc_msgSend(v55, "updateWithEvent:eventTimestamp:", v11, a6);
          goto LABEL_38;
        }
        objc_msgSend(v11, "payload");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "updateWithMessageMovedEventWithPayload:", v48);
      }
    }

LABEL_38:
LABEL_39:

  }
}

@end
