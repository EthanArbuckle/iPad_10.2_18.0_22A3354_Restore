@implementation CHRecentCall

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (BOOL)isJunk
{
  return -[CHRecentCall junkConfidence](self, "junkConfidence") > 1;
}

- (id)coalescedCallWithCall:(id)a3 usingStrategy:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CHRecentCall canCoalesceWithCall:withStrategy:](self, "canCoalesceWithCall:withStrategy:", v6, a4))
  {
    objc_msgSend(v6, "callOccurrences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    v10 = (void *)-[CHRecentCall copy](self, "copy");
    -[CHRecentCall callOccurrencesArrayByAddingCallOccurrencesFromArray:](self, "callOccurrencesArrayByAddingCallOccurrencesFromArray:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCallOccurrences:", v11);

    v12 = 1;
    objc_msgSend(v10, "setMultiCall:", 1);
    objc_msgSend(v10, "setUnreadCount:", objc_msgSend(v10, "unreadCount") + objc_msgSend(v6, "unreadCount"));
    if ((objc_msgSend(v10, "hasMessage") & 1) == 0)
      v12 = objc_msgSend(v6, "hasMessage");
    objc_msgSend(v10, "setHasMessage:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canCoalesceWithCall:(id)a3 withStrategy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("kCHCoalescingStrategyRecents")))
  {
    if (!-[CHRecentCall canCoalesceSyncWithRecentsStrategyWithCall:](self, "canCoalesceSyncWithRecentsStrategyWithCall:", v6))
    {
LABEL_9:
      v13 = 0;
      goto LABEL_10;
    }
  }
  else if (!objc_msgSend(v7, "isEqualToString:", CFSTR("kCHCoalescingStrategyCollapseIfEqual"))
         || !-[CHRecentCall canCoalesceRemoteParticipantHandlesFromCall:](self, "canCoalesceRemoteParticipantHandlesFromCall:", v6))
  {
    goto LABEL_9;
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logHandleForDomain:", "CHRecentCall");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[CHRecentCall uniqueId](self, "uniqueId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "%@ can coalesce with %@ using %@", (uint8_t *)&v15, 0x20u);

  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)canCoalesceRemoteParticipantHandlesFromCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  _BYTE v72[10];
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CHRecentCall hasMessage](self, "hasMessage") && !objc_msgSend(v4, "hasMessage"))
  {
    -[CHRecentCall isoCountryCode](self, "isoCountryCode");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isoCountryCode");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (v13 | v14) == 0;
    if (v14)
      v15 = objc_msgSend((id)v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
    {
      v16 = -[CHRecentCall callerIdIsBlocked](self, "callerIdIsBlocked");
      if (v16 != objc_msgSend(v4, "callerIdIsBlocked"))
      {
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logHandleForDomain:", "CHRecentCall");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v18;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        -[CHRecentCall uniqueId](self, "uniqueId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uniqueId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 138544130;
        v68 = v19;
        v69 = 2114;
        v70 = v20;
        v71 = 1026;
        *(_DWORD *)v72 = -[CHRecentCall callerIdIsBlocked](self, "callerIdIsBlocked");
        *(_WORD *)&v72[4] = 1026;
        *(_DWORD *)&v72[6] = objc_msgSend(v4, "callerIdIsBlocked");
        _os_log_impl(&dword_1B3FA4000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: callerID block statuses are not the same. self.callerIdIsBlocked: %{public}d, otherCall.callerIdIsBlocked: %{public}d", (uint8_t *)&v67, 0x22u);
LABEL_23:

        goto LABEL_24;
      }
      -[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      objc_msgSend(v4, "remoteParticipantHandles");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v26 == v28)
      {
        if (v26 != 1)
        {
          if (!v26)
          {
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "logHandleForDomain:", "CHRecentCall");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v30;
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
              goto LABEL_24;
            -[CHRecentCall uniqueId](self, "uniqueId");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "uniqueId");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 138544130;
            v68 = v8;
            v69 = 2114;
            v70 = v9;
            v71 = 2048;
            *(_QWORD *)v72 = 0;
            *(_WORD *)&v72[8] = 2048;
            v73 = 0;
            v10 = "%{public}@ cannot coalesce with %{public}@: calls don't have any remote participants. self.remoteParti"
                  "cipantHandles.count: %lu, otherCall.remoteParticipantHandles.count: %lu";
            v11 = v7;
            v12 = 42;
            goto LABEL_6;
          }
          -[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count");

          if (v50 < 2)
            goto LABEL_45;
          -[CHRecentCall notificationThreadIdentifier](self, "notificationThreadIdentifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "notificationThreadIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v51, "isEqualToString:", v52);

          if ((v53 & 1) == 0)
            goto LABEL_45;
LABEL_43:
          v35 = 1;
          goto LABEL_26;
        }
        -[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "anyObject");
        v7 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "remoteParticipantHandles");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "anyObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject value](v7, "value");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "length"))
        {
          objc_msgSend(v39, "value");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "length");

          if (v42)
          {
            objc_msgSend(v39, "normalizedValue");
            v43 = objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              v44 = (void *)v43;
              objc_msgSend(v39, "normalizedValue");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v45, "length"))
              {
                -[NSObject normalizedValue](v7, "normalizedValue");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "normalizedValue");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v46, "isEqualToString:", v47);

                if (v48)
                {

                  goto LABEL_43;
                }
              }
              else
              {

              }
            }
            objc_msgSend(v39, "value");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v61, "length"))
            {
              -[NSObject value](v7, "value");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "value");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = objc_msgSend(v62, "isEqualToString:", v63);

              if ((v64 & 1) != 0)
                goto LABEL_43;
            }
            else
            {

            }
LABEL_45:
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "logHandleForDomain:", "CHRecentCall");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v66;
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
              goto LABEL_24;
            -[CHRecentCall notificationThreadIdentifier](self, "notificationThreadIdentifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "notificationThreadIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 138543618;
            v68 = v8;
            v69 = 2114;
            v70 = v9;
            v10 = "%{public}@ cannot coalesce with %{public}@: Handle hashes are not the same";
            goto LABEL_5;
          }
        }
        else
        {

        }
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "logHandleForDomain:", "CHRecentCall");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = v55;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          -[CHRecentCall uniqueId](self, "uniqueId");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "uniqueId");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "remoteParticipantHandles");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 138544130;
          v68 = v57;
          v69 = 2114;
          v70 = v58;
          v71 = 2112;
          *(_QWORD *)v72 = v59;
          *(_WORD *)&v72[8] = 2112;
          v73 = (uint64_t)v60;
          _os_log_impl(&dword_1B3FA4000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: One or both calls have a remoteParticipantHandle with length 0. self.remoteParticipantHandles: %@, otherCall.remoteParticipantHandles: %@", (uint8_t *)&v67, 0x2Au);

        }
        goto LABEL_25;
      }
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logHandleForDomain:", "CHRecentCall");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v32;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      -[CHRecentCall uniqueId](self, "uniqueId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v23, "count");
      objc_msgSend(v4, "remoteParticipantHandles");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 138544130;
      v68 = v19;
      v69 = 2114;
      v70 = v20;
      v71 = 2048;
      *(_QWORD *)v72 = v33;
      *(_WORD *)&v72[8] = 2048;
      v73 = objc_msgSend(v34, "count");
      _os_log_impl(&dword_1B3FA4000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: remote participant counts are different. self.remoteParticipantHandles.count: %lu, otherCall.remoteParticipantHandles.count: %lu", (uint8_t *)&v67, 0x2Au);

    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logHandleForDomain:", "CHRecentCall");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v22;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      -[CHRecentCall uniqueId](self, "uniqueId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHRecentCall isoCountryCode](self, "isoCountryCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "isoCountryCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 138544130;
      v68 = v19;
      v69 = 2114;
      v70 = v20;
      v71 = 2114;
      *(_QWORD *)v72 = v23;
      *(_WORD *)&v72[8] = 2114;
      v73 = (uint64_t)v24;
      _os_log_impl(&dword_1B3FA4000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: ISO codes are not the same. self.isoCountryCode: %{public}@, otherCall.isoCountryCode: %{public}@", (uint8_t *)&v67, 0x2Au);

    }
    goto LABEL_23;
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logHandleForDomain:", "CHRecentCall");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CHRecentCall uniqueId](self, "uniqueId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 138543618;
    v68 = v8;
    v69 = 2114;
    v70 = v9;
    v10 = "%{public}@ cannot coalesce with %{public}@: Both calls have messages";
LABEL_5:
    v11 = v7;
    v12 = 22;
LABEL_6:
    _os_log_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v67, v12);

  }
LABEL_24:

LABEL_25:
  v35 = 0;
LABEL_26:

  return v35;
}

- (BOOL)hasMessage
{
  return self->_hasMessage;
}

- (BOOL)canCoalesceSyncWithRecentsStrategyWithCall:(id)a3
{
  id v4;
  _BOOL4 v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  BOOL v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CHRecentCall callStatus](self, "callStatus") == 8;
  if (((v5 ^ (objc_msgSend(v4, "callStatus") != 8)) & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logHandleForDomain:", "CHRecentCall");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v22;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    -[CHRecentCall uniqueId](self, "uniqueId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", -[CHRecentCall callStatus](self, "callStatus"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", objc_msgSend(v4, "callStatus"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138544130;
    v49 = v24;
    v50 = 2114;
    v51 = v25;
    v52 = 2114;
    v53 = v26;
    v54 = 2114;
    v55 = v27;
    v28 = "%{public}@ cannot coalesce with %{public}@: Call status doesn't match. MyStatus: %{public}@, OtherStatus: %{public}@";
    goto LABEL_21;
  }
  v6 = -[CHRecentCall mediaType](self, "mediaType");
  if (v6 != objc_msgSend(v4, "mediaType"))
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logHandleForDomain:", "CHRecentCall");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v30;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    -[CHRecentCall uniqueId](self, "uniqueId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall callMediaTypeAsString:](CHRecentCall, "callMediaTypeAsString:", -[CHRecentCall mediaType](self, "mediaType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall callMediaTypeAsString:](CHRecentCall, "callMediaTypeAsString:", objc_msgSend(v4, "mediaType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138544130;
    v49 = v24;
    v50 = 2114;
    v51 = v25;
    v52 = 2114;
    v53 = v26;
    v54 = 2114;
    v55 = v27;
    v28 = "%{public}@ cannot coalesce with %{public}@: Call media type does not match. MyMediaType: %{public}@, OtherMedi"
          "aType: %{public}@";
    goto LABEL_21;
  }
  v7 = -[CHRecentCall ttyType](self, "ttyType");
  if (v7 != objc_msgSend(v4, "ttyType"))
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logHandleForDomain:", "CHRecentCall");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v32;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    -[CHRecentCall uniqueId](self, "uniqueId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall callTTYTypeAsString:](CHRecentCall, "callTTYTypeAsString:", -[CHRecentCall ttyType](self, "ttyType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall callTTYTypeAsString:](CHRecentCall, "callTTYTypeAsString:", objc_msgSend(v4, "ttyType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138544130;
    v49 = v24;
    v50 = 2114;
    v51 = v25;
    v52 = 2114;
    v53 = v26;
    v54 = 2114;
    v55 = v27;
    v28 = "%{public}@ cannot coalesce with %{public}@: Call TTY type does not match. MyTTYType: %{public}@, OtherTTYType: %{public}@";
LABEL_21:
    _os_log_impl(&dword_1B3FA4000, v23, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v48, 0x2Au);

LABEL_22:
    goto LABEL_23;
  }
  -[CHRecentCall date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isSameDayAsDate:", v9);

  if ((v10 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logHandleForDomain:", "CHRecentCall");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v35;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    -[CHRecentCall uniqueId](self, "uniqueId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138543618;
    v49 = v26;
    v50 = 2114;
    v51 = v36;
    _os_log_impl(&dword_1B3FA4000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: Calls happened on different dates.", (uint8_t *)&v48, 0x16u);

    goto LABEL_22;
  }
  -[CHRecentCall serviceProvider](self, "serviceProvider");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceProvider");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (v11 | v12) == 0;
  if (v12)
    v13 = objc_msgSend((id)v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "logHandleForDomain:", "CHRecentCall");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v38;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    -[CHRecentCall uniqueId](self, "uniqueId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall serviceProvider](self, "serviceProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceProvider");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138544130;
    v49 = v39;
    v50 = 2114;
    v51 = v40;
    v52 = 2114;
    v53 = v41;
    v54 = 2114;
    v55 = v42;
    v43 = "%{public}@ cannot coalesce with %{public}@: Call service provider does not match. MyServiceProvider: %{public}"
          "@, OtherServiceProvider: %{public}@";
LABEL_33:
    _os_log_impl(&dword_1B3FA4000, v23, OS_LOG_TYPE_DEFAULT, v43, (uint8_t *)&v48, 0x2Au);

    goto LABEL_23;
  }
  -[CHRecentCall localParticipantUUID](self, "localParticipantUUID");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localParticipantUUID");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (v14 | v15) == 0;
  if (v15)
    v16 = objc_msgSend((id)v14, "isEqual:", v15);

  if ((v16 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "logHandleForDomain:", "CHRecentCall");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v45;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    -[CHRecentCall uniqueId](self, "uniqueId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall localParticipantUUID](self, "localParticipantUUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localParticipantUUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138544130;
    v49 = v39;
    v50 = 2114;
    v51 = v40;
    v52 = 2114;
    v53 = v41;
    v54 = 2114;
    v55 = v42;
    v43 = "%{public}@ cannot coalesce with %{public}@: Call UUIDs are not the same. MyLocalParticipantUUID: %{public}@, O"
          "therLocalParticipantUUID: %{public}@";
    goto LABEL_33;
  }
  -[CHRecentCall blockedByExtension](self, "blockedByExtension");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockedByExtension");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (v17 | v18) == 0;
  if (v18)
    v19 = objc_msgSend((id)v17, "isEqual:", v18);

  if ((v19 & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "logHandleForDomain:", "CHRecentCall");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v47;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[CHRecentCall uniqueId](self, "uniqueId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHRecentCall blockedByExtension](self, "blockedByExtension");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "blockedByExtension");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138544130;
      v49 = v39;
      v50 = 2114;
      v51 = v40;
      v52 = 2114;
      v53 = v41;
      v54 = 2114;
      v55 = v42;
      v43 = "%{public}@ cannot coalesce with %{public}@: Call blockedByExtensions are not the same. MyBlockedByExtension:"
            " %{public}@, OtherBlockedByExtension: %{public}@";
      goto LABEL_33;
    }
LABEL_23:

    v20 = 0;
    goto LABEL_24;
  }
  v20 = -[CHRecentCall canCoalesceRemoteParticipantHandlesFromCall:](self, "canCoalesceRemoteParticipantHandlesFromCall:", v4);
LABEL_24:

  return v20;
}

- (NSString)callerIdForDisplay
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CHPhoneNumber *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *v14;
  NSString *callerIdFormatted;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "CHRecentCall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall addressBookRecordId].cold.4(a2);

  -[CHRecentCall validRemoteParticipantHandles](self, "validRemoteParticipantHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSString length](self->_callerIdFormatted, "length"))
  {
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (objc_msgSend(v8, "type") == 2)
      {
        v10 = [CHPhoneNumber alloc];
        objc_msgSend(v8, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CHRecentCall isoCountryCode](self, "isoCountryCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CHPhoneNumber initWithDigits:isoCountryCode:](v10, "initWithDigits:isoCountryCode:", v11, v12);

        -[NSString formattedRepresentation](v13, "formattedRepresentation");
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        callerIdFormatted = self->_callerIdFormatted;
        self->_callerIdFormatted = v14;

        if (!self->_callerIdFormatted)
        {
          objc_msgSend(v8, "value");
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          v17 = self->_callerIdFormatted;
          self->_callerIdFormatted = v16;

        }
      }
      else
      {
        objc_msgSend(v8, "value");
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        v13 = self->_callerIdFormatted;
        self->_callerIdFormatted = v18;
      }

    }
  }
  v19 = self->_callerIdFormatted;

  return v19;
}

- (int64_t)countOfExcludedHandles
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isTemporary") & 1) != 0 || objc_msgSend(v8, "isPseudonym"))
          ++v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)validRemoteParticipantHandles
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isTemporary", (_QWORD)v12) & 1) != 0 || objc_msgSend(v9, "isPseudonym"))
          objc_msgSend(v3, "removeObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (NSSet)remoteParticipantHandles
{
  NSString *v3;
  int64_t v4;
  int64_t v5;
  CHHandle *v6;
  NSSet *v7;
  NSSet *remoteParticipantHandles;

  if (!-[NSSet count](self->_remoteParticipantHandles, "count") && -[NSString length](self->_callerId, "length"))
  {
    v3 = self->_callerId;
    if (-[NSString length](v3, "length"))
    {
      v4 = +[CHHandle handleTypeForValue:](CHHandle, "handleTypeForValue:", v3);
      if (v4)
      {
        v5 = v4;
        if (-[NSString length](v3, "length"))
        {
          v6 = -[CHHandle initWithType:value:]([CHHandle alloc], "initWithType:value:", v5, v3);
          v7 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, 0);
          remoteParticipantHandles = self->_remoteParticipantHandles;
          self->_remoteParticipantHandles = v7;

        }
      }
    }

  }
  return self->_remoteParticipantHandles;
}

- (void)updateTTYAndMediaType
{
  if (!self->_mediaType)
    self->_mediaType = +[CHRecentCall mediaTypeForCallCategory:](CHRecentCall, "mediaTypeForCallCategory:", self->_callCategory);
  self->_ttyType = +[CHRecentCall ttyTypeForCallCategory:](CHRecentCall, "ttyTypeForCallCategory:", self->_callCategory);
}

+ (int64_t)ttyTypeForCallCategory:(unsigned int)a3
{
  if ((a3 & 8) != 0)
    return 2;
  else
    return (a3 & 4) != 0;
}

- (CHRecentCall)init
{
  CHRecentCall *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *uniqueId;
  NSUUID *conversationID;
  NSSet *emergencyMediaItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHRecentCall;
  v2 = -[CHRecentCall init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    uniqueId = v2->_uniqueId;
    v2->_uniqueId = (NSString *)v5;

    v2->_callType = 0x80000000;
    *(_WORD *)&v2->_read = 1;
    v2->_duration = 0.0;
    v2->_callStatus = 0;
    v2->_callerIdAvailability = 0;
    v2->_verificationStatus = 0;
    v2->_mediaType = 0;
    v2->_ttyType = 0;
    conversationID = v2->_conversationID;
    v2->_handleType = 0;
    v2->_conversationID = 0;

    v2->_autoAnsweredReason = 0;
    emergencyMediaItems = v2->_emergencyMediaItems;
    v2->_emergencyMediaItems = 0;

    *(_WORD *)&v2->_usedEmergencyVideoStreaming = 0;
    v2->_callDirectoryIdentityType = 0;
    v2->_screenSharingType = 0;
  }
  return v2;
}

- (void)setHasMessage:(BOOL)a3
{
  self->_hasMessage = a3;
}

- (void)setCallOccurrences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setVerificationStatus:(int64_t)a3
{
  self->_verificationStatus = a3;
}

- (void)setUniqueId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setRemoteParticipantHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setRead:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t v6;

  if (self->_read != a3)
  {
    v3 = a3;
    self->_read = a3;
    v5 = -[CHRecentCall unreadCount](self, "unreadCount");
    if (v3)
      v6 = v5 - 1;
    else
      v6 = v5 + 1;
    -[CHRecentCall setUnreadCount:](self, "setUnreadCount:", v6);
  }
}

- (void)setParticipantGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_participantGroupUUID, a3);
}

- (void)setOutgoingLocalParticipantUUID:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingLocalParticipantUUID, a3);
}

- (void)setName:(id)a3
{
  void *v4;
  id v5;
  NSString **p_name;
  NSString *name;
  id v8;
  unint64_t v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "length"))
    v4 = v12;
  else
    v4 = 0;
  v5 = v4;
  name = self->_name;
  p_name = &self->_name;
  v8 = name;
  v9 = (unint64_t)v5;
  v10 = (void *)v9;
  if ((unint64_t)v8 | v9)
  {
    if (v9)
    {
      v11 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)p_name, v4);
  }
LABEL_10:

}

- (void)setLocalParticipantUUID:(id)a3
{
  objc_storeStrong((id *)&self->_localParticipantUUID, a3);
}

- (void)setJunkIdentificationCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setJunkConfidence:(int64_t)a3
{
  self->_junkConfidence = a3;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (void)setFilteredOutReason:(id)a3
{
  objc_storeStrong((id *)&self->_filteredOutReason, a3);
}

- (void)setDuration:(double)a3
{
  double v3;

  v3 = fmax(a3, 0.0);
  if (self->_duration != v3)
    self->_duration = v3;
}

- (void)setDisconnectedCause:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectedCause, a3);
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void)setConversationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setCallerIdAvailability:(unsigned int)a3
{
  if (self->_callerIdAvailability != a3)
  {
    self->_callerIdAvailability = a3;
    -[CHRecentCall setCallerIdIsBlocked:](self, "setCallerIdIsBlocked:", a3 == 1);
  }
}

- (void)setCallerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setCallType:(unsigned int)a3
{
  uint64_t v3;
  NSString *v5;
  NSString *serviceProvider;

  v3 = *(_QWORD *)&a3;
  self->_callType = a3;
  if (!self->_serviceProvider)
  {
    +[CHRecentCall serviceProviderForCallType:](CHRecentCall, "serviceProviderForCallType:", *(_QWORD *)&a3);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    serviceProvider = self->_serviceProvider;
    self->_serviceProvider = v5;

  }
  if (!self->_callCategory)
    self->_callCategory = +[CHRecentCall categoryForCallType:](CHRecentCall, "categoryForCallType:", v3);
  -[CHRecentCall updateTTYAndMediaType](self, "updateTTYAndMediaType");
}

- (void)setCallStatus:(unsigned int)a3
{
  self->_callStatus = a3;
}

- (void)setCallCategory:(unsigned int)a3
{
  uint64_t v3;
  void *v5;

  if (self->_callCategory != a3)
  {
    v3 = *(_QWORD *)&a3;
    self->_callCategory = a3;
    -[CHRecentCall serviceProvider](self, "serviceProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_callType = +[CHRecentCall getCallTypeForCategory:andServiceProvider:](CHRecentCall, "getCallTypeForCategory:andServiceProvider:", v3, v5);

    -[CHRecentCall updateTTYAndMediaType](self, "updateTTYAndMediaType");
  }
}

- (void)setServiceProvider:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  NSString *v9;
  NSString *serviceProvider;
  unsigned int v11;
  id v12;

  v4 = a3;
  v5 = self->_serviceProvider;
  v6 = (unint64_t)v4;
  v7 = (void *)v6;
  if (v6 | v5)
  {
    v12 = (id)v6;
    if (v6)
    {
      v8 = objc_msgSend((id)v5, "isEqualToString:", v6);

      v7 = v12;
      if (v8)
        goto LABEL_7;
    }
    else
    {

      v7 = 0;
    }
    v9 = (NSString *)objc_msgSend(v7, "copy");
    serviceProvider = self->_serviceProvider;
    self->_serviceProvider = v9;

    self->_callCategory = +[CHRecentCall categoryForMediaType:andTTYType:](CHRecentCall, "categoryForMediaType:andTTYType:", -[CHRecentCall mediaType](self, "mediaType"), -[CHRecentCall ttyType](self, "ttyType"));
    v11 = +[CHRecentCall getCallTypeForCategory:andServiceProvider:](CHRecentCall, "getCallTypeForCategory:andServiceProvider:", -[CHRecentCall callCategory](self, "callCategory"), v12);
    v7 = v12;
    self->_callType = v11;
  }
LABEL_7:

}

+ (unsigned)getCallTypeForCategory:(unsigned int)a3 andServiceProvider:(id)a4
{
  char v4;
  id v5;
  void *v6;
  int *v7;
  unsigned int v8;

  v4 = a3;
  v5 = a4;
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Telephony")) & 1) != 0)
    {
      v7 = &kCHCallTypeNormal;
      goto LABEL_10;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.FaceTime")) & 1) != 0)
    {
      v7 = &kCHCallTypeFaceTimeAudio;
      goto LABEL_10;
    }
  }
  if ((v4 & 2) != 0 && (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.FaceTime")) & 1) != 0)
    v7 = &kCHCallTypeFaceTimeVideo;
  else
    v7 = &kCHCallTypeNone;
LABEL_10:
  v8 = *v7;

  return v8;
}

- (void)setBytesOfDataUsed:(id)a3
{
  objc_storeStrong((id *)&self->_bytesOfDataUsed, a3);
}

- (unsigned)callCategory
{
  return self->_callCategory;
}

+ (int64_t)mediaTypeForCallCategory:(unsigned int)a3
{
  if ((a3 & 2) != 0)
    return 2;
  else
    return (a3 & 1) != 0;
}

+ (unsigned)categoryForMediaType:(int64_t)a3 andTTYType:(int64_t)a4
{
  int *v4;
  unsigned int result;
  int *v6;

  if (a3 == 2)
  {
    v4 = &kCHCallCategoryVideo;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = &kCHCallCategoryAudio;
LABEL_5:
    result = *v4;
    goto LABEL_7;
  }
  result = 0;
LABEL_7:
  if (a4 == 1)
  {
    v6 = &kCHCallCategoryTTYDirect;
  }
  else
  {
    if (a4 != 2)
      return result;
    v6 = &kCHCallCategoryTTYRelay;
  }
  result |= *v6;
  return result;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CHRecentCall callStatus](self, "callStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kCHCallOccurrenceCallStatusKey"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CHRecentCall duration](self, "duration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("kCHCallOccurrenceDurationKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CHRecentCall mediaType](self, "mediaType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("kCHCallOccurrenceMediaTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CHRecentCall ttyType](self, "ttyType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kCHCallOccurrenceTTYTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CHRecentCall verificationStatus](self, "verificationStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("kCHCallOccurrenceVerificationStatusKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CHRecentCall callType](self, "callType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("kCHCallOccurrenceCallTypeKey"));

  -[CHRecentCall bytesOfDataUsed](self, "bytesOfDataUsed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("kCHCallOccurrenceDataUsageKey"));
  -[CHRecentCall date](self, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("kCHCallOccurrenceDateKey"));
  -[CHRecentCall serviceProvider](self, "serviceProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("kCHCallOccurrenceServiceProviderKey"));
  -[CHRecentCall uniqueId](self, "uniqueId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("kCHCallOccurrenceUniqueIdKey"));
  if (-[CHRecentCall wasEmergencyCall](self, "wasEmergencyCall"))
  {
    v28 = 0u;
    v29 = 0u;
    v15 = -[CHRecentCall usedEmergencyVideoStreaming](self, "usedEmergencyVideoStreaming");
    v30 = 0u;
    v31 = 0u;
    -[CHRecentCall emergencyMediaItems](self, "emergencyMediaItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    v27 = v11;
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v16);
          v22 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "emergencyMediaType");
          if (v22 == 1)
          {
            ++v15;
          }
          else if (!v22)
          {
            ++v19;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("kCHCallOccurrenceEmergencyVideosCountKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("kCHCallOccurrenceEmergencyImagesCountKey"));

    v11 = v27;
  }
  v25 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v25;
}

- (int64_t)verificationStatus
{
  return self->_verificationStatus;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  const __CFString *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("--------------------------\n"));
  -[CHRecentCall uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Identifier: %@\n"), v4);

  -[CHRecentCall name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[CHRecentCall name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Name: %@\n"), v7);

  }
  -[CHRecentCall imageURL](self, "imageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CHRecentCall imageURL](self, "imageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Image URL: %@\n"), v9);

  }
  -[CHRecentCall junkIdentificationCategory](self, "junkIdentificationCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CHRecentCall junkIdentificationCategory](self, "junkIdentificationCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Junk identification category: %@\n"), v11);

  }
  -[CHRecentCall localParticipantUUID](self, "localParticipantUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Local Participant UUID: %@\n"), v12);

  -[CHRecentCall outgoingLocalParticipantUUID](self, "outgoingLocalParticipantUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Outgoing Local Participant UUID: %@\n"), v13);

  -[CHRecentCall participantGroupUUID](self, "participantGroupUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Participant Group UUID: %@\n"), v14);

  objc_msgSend(v3, "appendFormat:", CFSTR("Remote Participant Handles: %@\n"), self->_remoteParticipantHandles);
  +[CHRecentCall callMediaTypeAsString:](CHRecentCall, "callMediaTypeAsString:", -[CHRecentCall mediaType](self, "mediaType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Call Media Type: %@\n"), v15);

  +[CHRecentCall callTTYTypeAsString:](CHRecentCall, "callTTYTypeAsString:", -[CHRecentCall ttyType](self, "ttyType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Call TTY Type: %@\n"), v16);

  +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", -[CHRecentCall callType](self, "callType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Call Type: %@\n"), v17);

  +[CHRecentCall callHandleTypeAsString:](CHRecentCall, "callHandleTypeAsString:", self->_handleType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Handle Type: %@\n"), v18);

  -[CHRecentCall serviceProvider](self, "serviceProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Call Service Provider: %@\n"), v19);

  +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", -[CHRecentCall callStatus](self, "callStatus"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Call Status: %@\n"), v20);

  -[CHRecentCall date](self, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Date: %@\n"), v21);

  -[CHRecentCall duration](self, "duration");
  objc_msgSend(v3, "appendFormat:", CFSTR("Duration: %f\n"), v22);
  CHCallerIdAvailabilityAsString(self->_callerIdAvailability);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Caller Id Availability: %@\n"), v23);

  objc_msgSend(v3, "appendFormat:", CFSTR("Caller Id Blocked?: %d\n"), -[CHRecentCall callerIdIsBlocked](self, "callerIdIsBlocked"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Caller Name: %@\n"), self->_callerName);
  objc_msgSend(v3, "appendFormat:", CFSTR("Caller Id Label: %@\n"), self->_callerIdLabel);
  objc_msgSend(v3, "appendFormat:", CFSTR("Caller Id Location: %@\n"), self->_callerIdLocation);
  -[CHRecentCall bytesOfDataUsed](self, "bytesOfDataUsed");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Bytes of data used: %@\n"), v24);

  -[CHRecentCall isoCountryCode](self, "isoCountryCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Country Code (ISO): %@\n"), v25);

  objc_msgSend(v3, "appendFormat:", CFSTR("Read: %d\n"), self->_read);
  objc_msgSend(v3, "appendFormat:", CFSTR("Emergency media items: %@\n"), self->_emergencyMediaItems);
  objc_msgSend(v3, "appendFormat:", CFSTR("Used emergency video streaming: %d\n"), self->_usedEmergencyVideoStreaming);
  objc_msgSend(v3, "appendFormat:", CFSTR("Was emergency call: %d\n"), self->_wasEmergencyCall);
  -[CHRecentCall disconnectedCause](self, "disconnectedCause");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Disconnect Cause: %@\n"), v26);

  -[CHRecentCall filteredOutReason](self, "filteredOutReason");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Filtered Out Reason: %@\n"), v27);

  objc_msgSend(MEMORY[0x1E0CB3940], "ch_stringWithCHRecentCallJunkConfidence:", -[CHRecentCall junkConfidence](self, "junkConfidence"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Junk Confidence: %@\n"), v28);

  objc_msgSend(v3, "appendFormat:", CFSTR("Address Book Id: %@\n"), self->_contactIdentifier);
  v29 = -[CHRecentCall multiCall](self, "multiCall");
  v30 = CFSTR("No");
  if (v29)
    v30 = CFSTR("Yes");
  objc_msgSend(v3, "appendFormat:", CFSTR("Multi-Call: %@\n"), v30);
  -[CHRecentCall callOccurrences](self, "callOccurrences");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32 >= 2)
  {
    -[CHRecentCall callOccurrencesAsString](self, "callOccurrencesAsString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Call Occurrences: %@\n"), v33);

  }
  -[CHRecentCall blockedByExtension](self, "blockedByExtension");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[CHRecentCall blockedByExtension](self, "blockedByExtension");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Blocked by extension: %@\n"), v35);

  }
  if (-[CHRecentCall callDirectoryIdentityType](self, "callDirectoryIdentityType"))
  {
    +[CHRecentCall callDirectoryIdentificationTypeAsString:](CHRecentCall, "callDirectoryIdentificationTypeAsString:", -[CHRecentCall callDirectoryIdentityType](self, "callDirectoryIdentityType"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("CallDirectory Identity Type: %@\n"), v36);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("Unread count: %lu\n"), -[CHRecentCall unreadCount](self, "unreadCount"));
  objc_msgSend(MEMORY[0x1E0CB3940], "ch_stringWithCHRecentCallVerificationStatus:", self->_verificationStatus);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Verification Status: %@\n"), v37);

  objc_msgSend(v3, "appendFormat:", CFSTR("Has associated message: %d\n"), self->_hasMessage);
  objc_msgSend(v3, "appendFormat:", CFSTR("Auto answered reason: %ld\n"), self->_autoAnsweredReason);
  objc_msgSend(v3, "appendFormat:", CFSTR("Conversation ID: %@\n"), self->_conversationID);
  objc_msgSend(v3, "appendFormat:", CFSTR("Screen sharing type: %ld\n"), self->_screenSharingType);
  objc_msgSend(v3, "appendFormat:", CFSTR("--------------------------\n"));
  return v3;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)serviceProvider
{
  return self->_serviceProvider;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (unsigned)callStatus
{
  return self->_callStatus;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSUUID)participantGroupUUID
{
  return self->_participantGroupUUID;
}

- (NSUUID)localParticipantUUID
{
  return self->_localParticipantUUID;
}

- (NSString)name
{
  return self->_name;
}

- (double)duration
{
  return self->_duration;
}

- (unsigned)callType
{
  return self->_callType;
}

- (NSNumber)bytesOfDataUsed
{
  return self->_bytesOfDataUsed;
}

- (unint64_t)numberOfOccurrences
{
  void *v2;
  unint64_t v3;

  -[CHRecentCall callOccurrences](self, "callOccurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 <= 1)
    return 1;
  else
    return v3;
}

- (NSArray)callOccurrences
{
  return self->_callOccurrences;
}

- (NSUUID)outgoingLocalParticipantUUID
{
  NSUUID **p_outgoingLocalParticipantUUID;
  NSUUID *v4;
  NSUUID *outgoingLocalParticipantUUID;

  outgoingLocalParticipantUUID = self->_outgoingLocalParticipantUUID;
  p_outgoingLocalParticipantUUID = &self->_outgoingLocalParticipantUUID;
  v4 = outgoingLocalParticipantUUID;
  if (!outgoingLocalParticipantUUID)
  {
    objc_storeStrong((id *)p_outgoingLocalParticipantUUID, self->_localParticipantUUID);
    v4 = self->_outgoingLocalParticipantUUID;
  }
  return v4;
}

- (BOOL)callerIdIsBlocked
{
  return self->_callerIdIsBlocked;
}

- (int64_t)junkConfidence
{
  return self->_junkConfidence;
}

+ (id)callStatusAsString:(unsigned int)a3
{
  switch(a3)
  {
    case 1u:
      return CFSTR("kCallStatusConnectedIncoming");
    case 2u:
      return CFSTR("kCallStatusConnectedOutgoing");
    case 4u:
      return CFSTR("kCallStatusAnsweredElsewhere");
    case 8u:
      return CFSTR("kCallStatusMissed");
    case 0x10u:
      return CFSTR("kCallStatusCancelled");
    case 7u:
      return CFSTR("kCallStatusConnected");
    case 0x1Fu:
      return CFSTR("kCallStatusAll");
    case 0xFFFFFFF7:
      return CFSTR("kCallStatusAllButMissed");
  }
  return CFSTR("Unknown");
}

+ (id)callTypeAsString:(unsigned int)a3
{
  switch(a3)
  {
    case 1u:
      return CFSTR("kCallTypeNormal");
    case 2u:
      return CFSTR("kCallTypeVoicemail");
    case 4u:
      return CFSTR("kCallTypeVOIP");
    case 8u:
      return CFSTR("kCallTypeFaceTimeVideo");
    case 0x10u:
      return CFSTR("kCallTypeFaceTimeAudio");
    case 0xFFFFFFFF:
      return CFSTR("kCallTypeAll");
    case 7u:
      return CFSTR("kCallTypeTelephony");
    case 0x18u:
      return CFSTR("kCallTypeFaceTime");
  }
  return CFSTR("Unknown");
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (BOOL)multiCall
{
  return self->_multiCall;
}

- (NSString)junkIdentificationCategory
{
  return self->_junkIdentificationCategory;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSNumber)filteredOutReason
{
  return self->_filteredOutReason;
}

- (NSNumber)disconnectedCause
{
  return self->_disconnectedCause;
}

+ (id)callTTYTypeAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E6747260 + a3);
}

+ (id)callMediaTypeAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E6747248 + a3);
}

+ (id)callHandleTypeAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E6747278 + a3 - 1);
}

- (void)setCallerIdLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setCallerIdIsBlocked:(BOOL)a3
{
  self->_callerIdIsBlocked = a3;
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unreadCount = a3;
}

- (void)setMultiCall:(BOOL)a3
{
  self->_multiCall = a3;
}

- (id)callOccurrencesArrayByAddingCallOccurrencesFromArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CHRecentCall callOccurrences](self, "callOccurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[CHRecentCall dictionaryRepresentation](self, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_82);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CHRecentCall *v5;
  uint64_t v6;
  NSNumber *bytesOfDataUsed;
  uint64_t v8;
  NSString *callerName;
  uint64_t v10;
  NSArray *callOccurrences;
  uint64_t v12;
  NSString *contactIdentifier;
  uint64_t v14;
  CNContact *contactRef;
  uint64_t v16;
  NSDate *date;
  uint64_t v18;
  NSNumber *disconnectedCause;
  uint64_t v20;
  NSNumber *filteredOutReason;
  uint64_t v22;
  NSURL *imageURL;
  uint64_t v24;
  NSString *isoCountryCode;
  uint64_t v26;
  NSString *junkIdentificationCategory;
  uint64_t v28;
  NSUUID *localParticipantUUID;
  uint64_t v30;
  NSString *mobileCountryCode;
  uint64_t v32;
  NSString *mobileNetworkCode;
  uint64_t v34;
  NSString *name;
  uint64_t v36;
  NSUUID *outgoingLocalParticipantUUID;
  uint64_t v38;
  NSUUID *participantGroupUUID;
  uint64_t v40;
  NSSet *remoteParticipantHandles;
  uint64_t v42;
  NSString *serviceProvider;
  uint64_t v44;
  NSNumber *timeToEstablish;
  uint64_t v46;
  NSString *uniqueId;
  uint64_t v48;
  NSUUID *conversationID;
  uint64_t v50;
  NSSet *emergencyMediaItems;
  uint64_t v52;
  NSString *addressBookRecordId;
  uint64_t v54;
  NSString *callerId;
  uint64_t v56;
  NSString *callerIdFormatted;
  uint64_t v58;
  NSString *callerIdLabel;
  uint64_t v60;
  NSString *callerIdLocation;
  uint64_t v62;
  NSString *devicePhoneId;

  v5 = -[CHRecentCall init](+[CHRecentCall allocWithZone:](CHRecentCall, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_bytesOfDataUsed, "copyWithZone:", a3);
  bytesOfDataUsed = v5->_bytesOfDataUsed;
  v5->_bytesOfDataUsed = (NSNumber *)v6;

  v8 = -[NSString copyWithZone:](self->_callerName, "copyWithZone:", a3);
  callerName = v5->_callerName;
  v5->_callerName = (NSString *)v8;

  v10 = -[NSArray copyWithZone:](self->_callOccurrences, "copyWithZone:", a3);
  callOccurrences = v5->_callOccurrences;
  v5->_callOccurrences = (NSArray *)v10;

  v5->_callStatus = self->_callStatus;
  v12 = -[NSString copyWithZone:](self->_contactIdentifier, "copyWithZone:", a3);
  contactIdentifier = v5->_contactIdentifier;
  v5->_contactIdentifier = (NSString *)v12;

  v14 = -[CNContact copyWithZone:](self->_contactRef, "copyWithZone:", a3);
  contactRef = v5->_contactRef;
  v5->_contactRef = (CNContact *)v14;

  v16 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  date = v5->_date;
  v5->_date = (NSDate *)v16;

  v18 = -[NSNumber copyWithZone:](self->_disconnectedCause, "copyWithZone:", a3);
  disconnectedCause = v5->_disconnectedCause;
  v5->_disconnectedCause = (NSNumber *)v18;

  v5->_duration = self->_duration;
  v20 = -[NSNumber copyWithZone:](self->_filteredOutReason, "copyWithZone:", a3);
  filteredOutReason = v5->_filteredOutReason;
  v5->_filteredOutReason = (NSNumber *)v20;

  v22 = -[NSURL copyWithZone:](self->_imageURL, "copyWithZone:", a3);
  imageURL = v5->_imageURL;
  v5->_imageURL = (NSURL *)v22;

  v24 = -[NSString copyWithZone:](self->_isoCountryCode, "copyWithZone:", a3);
  isoCountryCode = v5->_isoCountryCode;
  v5->_isoCountryCode = (NSString *)v24;

  v5->_junkConfidence = self->_junkConfidence;
  v26 = -[NSString copyWithZone:](self->_junkIdentificationCategory, "copyWithZone:", a3);
  junkIdentificationCategory = v5->_junkIdentificationCategory;
  v5->_junkIdentificationCategory = (NSString *)v26;

  v28 = -[NSUUID copyWithZone:](self->_localParticipantUUID, "copyWithZone:", a3);
  localParticipantUUID = v5->_localParticipantUUID;
  v5->_localParticipantUUID = (NSUUID *)v28;

  v5->_mediaType = self->_mediaType;
  v30 = -[NSString copyWithZone:](self->_mobileCountryCode, "copyWithZone:", a3);
  mobileCountryCode = v5->_mobileCountryCode;
  v5->_mobileCountryCode = (NSString *)v30;

  v32 = -[NSString copyWithZone:](self->_mobileNetworkCode, "copyWithZone:", a3);
  mobileNetworkCode = v5->_mobileNetworkCode;
  v5->_mobileNetworkCode = (NSString *)v32;

  v5->_multiCall = self->_multiCall;
  v34 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v34;

  v36 = -[NSUUID copyWithZone:](self->_outgoingLocalParticipantUUID, "copyWithZone:", a3);
  outgoingLocalParticipantUUID = v5->_outgoingLocalParticipantUUID;
  v5->_outgoingLocalParticipantUUID = (NSUUID *)v36;

  v38 = -[NSUUID copyWithZone:](self->_participantGroupUUID, "copyWithZone:", a3);
  participantGroupUUID = v5->_participantGroupUUID;
  v5->_participantGroupUUID = (NSUUID *)v38;

  v5->_read = self->_read;
  v40 = -[NSSet copyWithZone:](self->_remoteParticipantHandles, "copyWithZone:", a3);
  remoteParticipantHandles = v5->_remoteParticipantHandles;
  v5->_remoteParticipantHandles = (NSSet *)v40;

  v42 = -[NSString copyWithZone:](self->_serviceProvider, "copyWithZone:", a3);
  serviceProvider = v5->_serviceProvider;
  v5->_serviceProvider = (NSString *)v42;

  v44 = -[NSNumber copyWithZone:](self->_timeToEstablish, "copyWithZone:", a3);
  timeToEstablish = v5->_timeToEstablish;
  v5->_timeToEstablish = (NSNumber *)v44;

  v5->_ttyType = self->_ttyType;
  v46 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  uniqueId = v5->_uniqueId;
  v5->_uniqueId = (NSString *)v46;

  v5->_unreadCount = self->_unreadCount;
  v5->_verificationStatus = self->_verificationStatus;
  v5->_hasMessage = self->_hasMessage;
  v48 = -[NSUUID copyWithZone:](self->_conversationID, "copyWithZone:", a3);
  conversationID = v5->_conversationID;
  v5->_conversationID = (NSUUID *)v48;

  v5->_autoAnsweredReason = self->_autoAnsweredReason;
  v50 = -[NSSet copyWithZone:](self->_emergencyMediaItems, "copyWithZone:", a3);
  emergencyMediaItems = v5->_emergencyMediaItems;
  v5->_emergencyMediaItems = (NSSet *)v50;

  v5->_usedEmergencyVideoStreaming = self->_usedEmergencyVideoStreaming;
  v5->_wasEmergencyCall = self->_wasEmergencyCall;
  v5->_callDirectoryIdentityType = self->_callDirectoryIdentityType;
  v5->_screenSharingType = self->_screenSharingType;
  v52 = -[NSString copyWithZone:](self->_addressBookRecordId, "copyWithZone:", a3);
  addressBookRecordId = v5->_addressBookRecordId;
  v5->_addressBookRecordId = (NSString *)v52;

  v54 = -[NSString copyWithZone:](self->_callerId, "copyWithZone:", a3);
  callerId = v5->_callerId;
  v5->_callerId = (NSString *)v54;

  v5->_callerIdAvailability = self->_callerIdAvailability;
  v56 = -[NSString copyWithZone:](self->_callerIdFormatted, "copyWithZone:", a3);
  callerIdFormatted = v5->_callerIdFormatted;
  v5->_callerIdFormatted = (NSString *)v56;

  v5->_callerIdIsBlocked = self->_callerIdIsBlocked;
  v58 = -[NSString copyWithZone:](self->_callerIdLabel, "copyWithZone:", a3);
  callerIdLabel = v5->_callerIdLabel;
  v5->_callerIdLabel = (NSString *)v58;

  v60 = -[NSString copyWithZone:](self->_callerIdLocation, "copyWithZone:", a3);
  callerIdLocation = v5->_callerIdLocation;
  v5->_callerIdLocation = (NSString *)v60;

  v62 = -[NSString copyWithZone:](self->_devicePhoneId, "copyWithZone:", a3);
  devicePhoneId = v5->_devicePhoneId;
  v5->_devicePhoneId = (NSString *)v62;

  v5->_handleType = self->_handleType;
  v5->_callType = objc_msgSend((id)objc_opt_class(), "getCallTypeForCategory:andServiceProvider:", self->_callCategory, self->_serviceProvider);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CHRecentCall *v4;
  BOOL v5;

  v4 = (CHRecentCall *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CHRecentCall isEqualToRecentCall:](self, "isEqualToRecentCall:", v4);
  }

  return v5;
}

- (void)setPhoneBookManager:(id)a3
{
  objc_storeStrong((id *)&self->_phoneBookManager, a3);
}

+ (id)predicateForCallsWithStatusRead:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("read == %d"), a3);
}

+ (id)predicateForCallsWithServiceProvider:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("service_provider = %@"), a3);
}

+ (id)predicateForCallsWithMediaType:(int64_t)a3
{
  int v3;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = a3 == 1;
  if (v3 == 1 || v3 == 2)
    objc_msgSend(a1, "predicateForCallsWithCategory:");
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForCallsWithCategory:(unsigned int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(call_category & %d) = %d"), *(_QWORD *)&a3, *(_QWORD *)&a3);
}

+ (id)predicateForCallsWithTTYType:(int64_t)a3
{
  int v3;

  if (a3 == 2)
  {
    v3 = 8;
  }
  else if (a3 == 1)
  {
    v3 = 4;
  }
  else
  {
    v3 = 0;
  }
  if (v3 == 4 || v3 == 8)
    objc_msgSend(a1, "predicateForCallsWithCategory:");
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __69__CHRecentCall_callOccurrencesArrayByAddingCallOccurrencesFromArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceDateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v5, "compare:", v6);
  else
    v7 = 1;

  return v7;
}

- (INInteraction)interaction
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v9;

  -[CHRecentCall uniqueId](self, "uniqueId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CBD9A8], "ch_interactionForIdentifier:error:", v2, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    ch_framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CHRecentCall(Intents) interaction].cold.1((uint64_t)v2, (uint64_t)v5, v7);

  }
  return (INInteraction *)v3;
}

- (NSDateInterval)interactionDateInterval
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v11;

  -[CHRecentCall date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[CHRecentCall duration](self, "duration"), v4 >= 0.0)
    && (v5 = v4,
        -[CHRecentCall timeToEstablish](self, "timeToEstablish"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "doubleValue"),
        v8 = v7,
        v6,
        v8 >= 0.0))
  {
    objc_msgSend(v3, "dateByAddingTimeInterval:", -v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v11, v5 + v8);

  }
  else
  {
    v9 = 0;
  }

  return (NSDateInterval *)v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)coalesceWithCall:(id)a3 withStrategy:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandleForDomain:", "CHRecentCall");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[CHRecentCall uniqueId](self, "uniqueId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138544130;
    v29 = v12;
    v30 = 2114;
    v31 = v13;
    v32 = 2114;
    v33 = (uint64_t)v14;
    v34 = 2112;
    v35 = v8;
    _os_log_impl(&dword_1B3FA4000, v11, OS_LOG_TYPE_DEFAULT, "==> %{public}@ %{public}@ %{public}@ with %@", (uint8_t *)&v28, 0x2Au);

  }
  v15 = -[CHRecentCall canCoalesceWithCall:withStrategy:](self, "canCoalesceWithCall:withStrategy:", v7, v8);
  if (v15)
  {
    objc_msgSend(v7, "callOccurrences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall callOccurrencesArrayByAddingCallOccurrencesFromArray:](self, "callOccurrencesArrayByAddingCallOccurrencesFromArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall setCallOccurrences:](self, "setCallOccurrences:", v17);

    -[CHRecentCall setUnreadCount:](self, "setUnreadCount:", -[CHRecentCall unreadCount](self, "unreadCount") + objc_msgSend(v7, "unreadCount"));
    v18 = 1;
    -[CHRecentCall setMultiCall:](self, "setMultiCall:", 1);
    if (!-[CHRecentCall hasMessage](self, "hasMessage"))
      v18 = objc_msgSend(v7, "hasMessage");
    -[CHRecentCall setHasMessage:](self, "setHasMessage:", v18);
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logHandleForDomain:", "CHRecentCall");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v20;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[CHRecentCall uniqueId](self, "uniqueId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueId");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v28 = 138544386;
    v26 = CFSTR("NO");
    v29 = v22;
    if (v15)
      v26 = CFSTR("YES");
    v30 = 2114;
    v31 = v23;
    v32 = 2114;
    v33 = v24;
    v34 = 2114;
    v35 = v8;
    v36 = 2114;
    v37 = v26;
    _os_log_impl(&dword_1B3FA4000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ %{public}@ with %{public}@ = %{public}@", (uint8_t *)&v28, 0x34u);

  }
  return v15;
}

- (void)setTimeToEstablish:(id)a3
{
  double v4;
  id v5;
  NSNumber **p_timeToEstablish;
  NSNumber *timeToEstablish;
  id v8;
  unint64_t v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "doubleValue");
  if (v4 <= 0.0)
    v5 = 0;
  else
    v5 = v12;
  timeToEstablish = self->_timeToEstablish;
  p_timeToEstablish = &self->_timeToEstablish;
  v8 = timeToEstablish;
  v9 = (unint64_t)v5;
  v10 = (void *)v9;
  if (v9 | (unint64_t)v8)
  {
    if (v9)
    {
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)p_timeToEstablish, v5);
  }
LABEL_10:

}

- (void)fetchAndSetContactIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSString *v12;
  NSString *v13;
  NSString *contactIdentifier;
  CNContact *v15;
  CNContact *contactRef;
  void *v17;
  NSObject *v18;
  NSString *v19;
  CNContact *v20;
  NSString *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSString *v31;
  int v32;
  NSString *v33;
  __int16 v34;
  CNContact *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[CHRecentCall callerId](self, "callerId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    +[CHSharedAddressBook get](CHSharedAddressBook, "get");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall callerId](self, "callerId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchAddressBookInfoFromCacheForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logHandleForDomain:", "CHRecentCall");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        -[CHRecentCall callerId](self, "callerId");
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        v32 = 138412290;
        v33 = v12;
        _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Address book information for %@ found in our cache, using it", (uint8_t *)&v32, 0xCu);

      }
      objc_msgSend(v7, "valueForKey:", CFSTR("kCHABCacheCNContactIdKey"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      contactIdentifier = self->_contactIdentifier;
      self->_contactIdentifier = v13;

      objc_msgSend(v7, "valueForKey:", CFSTR("kCHABCacheCNContactRefKey"));
      v15 = (CNContact *)objc_claimAutoreleasedReturnValue();
      contactRef = self->_contactRef;
      self->_contactRef = v15;

      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logHandleForDomain:", "CHRecentCall");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_contactIdentifier;
        v20 = self->_contactRef;
        v32 = 138412546;
        v33 = v19;
        v34 = 2048;
        v35 = v20;
        _os_log_impl(&dword_1B3FA4000, v18, OS_LOG_TYPE_DEFAULT, "Got CNContact Id: %@, CNContact Pointer: %p from the cache.", (uint8_t *)&v32, 0x16u);
      }
    }
    else
    {
      if (v11)
      {
        -[CHRecentCall callerId](self, "callerId");
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        v32 = 138412290;
        v33 = v21;
        _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Address book information for %@ not found in our cache, looking it up", (uint8_t *)&v32, 0xCu);

      }
      v22 = -[CHRecentCall callerIdIsEmailAddress](self, "callerIdIsEmailAddress");
      -[CHRecentCall phoneBookManager](self, "phoneBookManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHRecentCall callerId](self, "callerId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHRecentCall isoCountryCode](self, "isoCountryCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "getRecordId:countryCode:isEmail:", v24, v25, v22);
      v18 = objc_claimAutoreleasedReturnValue();

      -[NSObject valueForKey:](v18, "valueForKey:", CFSTR("kCHABCacheCNContactIdKey"));
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      v27 = self->_contactIdentifier;
      self->_contactIdentifier = v26;

      -[CHRecentCall callerId](self, "callerId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertAddressBookInfoIntoCache:forKey:", v18, v28);

    }
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "logHandleForDomain:", "CHRecentCall");
  v30 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = self->_contactIdentifier;
    v32 = 138412290;
    v33 = v31;
    _os_log_impl(&dword_1B3FA4000, v30, OS_LOG_TYPE_DEFAULT, "Fetched addressbook record id and multi value id. CNContact Id: %@.", (uint8_t *)&v32, 0xCu);
  }

}

- (void)fetchAndSetFullContact
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSString *v14;
  void *v15;
  NSObject *v16;
  NSString *contactIdentifier;
  CNContact *contactRef;
  NSString *v19;
  void *v20;
  CNContact *v21;
  CNContact *v22;
  void *v23;
  void *v24;
  CNContact *v25;
  CNContact *v26;
  int v27;
  NSString *v28;
  __int16 v29;
  CNContact *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[CHRecentCall callerId](self, "callerId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    +[CHSharedAddressBook get](CHSharedAddressBook, "get");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall callerId](self, "callerId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchAddressBookInfoFromCacheForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "valueForKey:", CFSTR("kCHABCacheCNContactRefKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CHRecentCall callerIdIsEmailAddress](self, "callerIdIsEmailAddress");
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logHandleForDomain:", "CHRecentCall");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v13)
      {
        -[CHRecentCall callerId](self, "callerId");
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v14;
        _os_log_impl(&dword_1B3FA4000, v12, OS_LOG_TYPE_DEFAULT, "Full contact information for %@ found in our cache, using it", (uint8_t *)&v27, 0xCu);

      }
      objc_storeStrong((id *)&self->_contactRef, v8);
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logHandleForDomain:", "CHRecentCall");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        contactIdentifier = self->_contactIdentifier;
        contactRef = self->_contactRef;
        v27 = 138412546;
        v28 = contactIdentifier;
        v29 = 2048;
        v30 = contactRef;
        _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "Got CNContact Id: %@, CNContact Pointer: %p from the cache.", (uint8_t *)&v27, 0x16u);
      }
    }
    else
    {
      if (v13)
      {
        -[CHRecentCall callerId](self, "callerId");
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v19;
        _os_log_impl(&dword_1B3FA4000, v12, OS_LOG_TYPE_DEFAULT, "Full contact information for %@ not found in our cache, looking it up", (uint8_t *)&v27, 0xCu);

      }
      -[CHRecentCall contactIdentifier](self, "contactIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v16, "length"))
      {
        -[CHRecentCall phoneBookManager](self, "phoneBookManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fetchFullCNContactForContactIdentifier:isEmail:", v16, v9);
        v21 = (CNContact *)objc_claimAutoreleasedReturnValue();
        v22 = self->_contactRef;
        self->_contactRef = v21;

      }
      if (!self->_contactRef
        || (v23 = (void *)objc_msgSend(v7, "mutableCopy"),
            objc_msgSend(v23, "setObject:forKey:", self->_contactRef, CFSTR("kCHABCacheCNContactRefKey")),
            -[CHRecentCall callerId](self, "callerId"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "insertAddressBookInfoIntoCache:forKey:", v23, v24),
            v24,
            v23,
            !self->_contactRef))
      {
        v25 = (CNContact *)objc_alloc_init(MEMORY[0x1E0C97200]);
        v26 = self->_contactRef;
        self->_contactRef = v25;

      }
    }

  }
}

- (NSString)contactIdentifier
{
  NSString *contactIdentifier;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  contactIdentifier = self->_contactIdentifier;
  if (!contactIdentifier)
  {
    -[CHRecentCall fetchAndSetContactIdentifier](self, "fetchAndSetContactIdentifier");
    contactIdentifier = self->_contactIdentifier;
  }
  if (!-[NSString isEqualToString:](contactIdentifier, "isEqualToString:", CFSTR("kCNContactInfoNotFound")))
    return self->_contactIdentifier;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "CHRecentCall");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "CNContact was searched before and not found. Don't need to look agian. Return nil.", v7, 2u);
  }

  return (NSString *)0;
}

- (CNContact)contactRef
{
  CNContact *contactRef;

  contactRef = self->_contactRef;
  if (!contactRef)
  {
    -[CHRecentCall fetchAndSetFullContact](self, "fetchAndSetFullContact");
    contactRef = self->_contactRef;
  }
  return contactRef;
}

- (NSString)addressBookRecordId
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSString **p_addressBookRecordId;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "CHRecentCall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall addressBookRecordId].cold.4(a2);

  p_addressBookRecordId = &self->_addressBookRecordId;
  if (self->_addressBookRecordId)
  {
    v8 = 0;
  }
  else
  {
    -[CHRecentCall fetchAndSetContactIdentifier](self, "fetchAndSetContactIdentifier");
    -[CHRecentCall contactRef](self, "contactRef");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      objc_storeStrong((id *)p_addressBookRecordId, CFSTR("kCNContactInfoNotFound"));
  }
  if (-[NSString isEqualToString:](*p_addressBookRecordId, "isEqualToString:", CFSTR("kCNContactInfoNotFound")))
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logHandleForDomain:", "CHRecentCall");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CHRecentCall addressBookRecordId].cold.2(v10);

    v11 = 0;
  }
  else
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v8, "iOSLegacyIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *p_addressBookRecordId;
      *p_addressBookRecordId = (NSString *)v12;

      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logHandleForDomain:", "CHRecentCall");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[CHRecentCall addressBookRecordId].cold.3();

    }
    v11 = *p_addressBookRecordId;
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logHandleForDomain:", "CHRecentCall");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall addressBookRecordId].cold.1();

  return v11;
}

- (BOOL)callerIdIsEmailAddress
{
  return -[CHRecentCall handleType](self, "handleType") == 3;
}

- (NSString)callerNetworkFirstName
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  -[CHRecentCall name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(" "));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v2, "substringToIndex:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (!objc_msgSend(v4, "length"))
  {

    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)callerNetworkSecondName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[CHRecentCall name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(" "));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || (v5 = v3 + v4, v3 + v4 >= (unint64_t)objc_msgSend(v2, "length")))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v2, "substringFromIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v6, "length"))
  {

    v6 = 0;
  }

  return (NSString *)v6;
}

- (int64_t)handleType
{
  void *v3;
  int64_t v4;

  if (self->_handleType)
    return self->_handleType;
  -[CHRecentCall callerId](self, "callerId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CHHandle handleTypeForValue:](CHHandle, "handleTypeForValue:", v3);

  return v4;
}

- (NSString)callerName
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *callerName;
  void *v12;
  NSObject *v13;
  NSString *v14;
  NSString *v15;
  NSString **p_callerName;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v21[16];
  uint8_t buf[16];

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandleForDomain:", "CHRecentCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall callerName].cold.2();

  if (!self->_callerName)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logHandleForDomain:", "CHRecentCall");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v7, OS_LOG_TYPE_DEFAULT, "Caller name is null. Look in AddressBook for a name", buf, 2u);
    }

    -[CHRecentCall phoneBookManager](self, "phoneBookManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall contactRef](self, "contactRef");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getPersonsNameForContact:", v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    callerName = self->_callerName;
    self->_callerName = v10;

    if (!self->_callerName)
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logHandleForDomain:", "CHRecentCall");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1B3FA4000, v13, OS_LOG_TYPE_DEFAULT, "AddressBook did not have a caller name for this caller id. Setting it to network sent name.", v21, 2u);
      }

      -[CHRecentCall name](self, "name");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = self->_callerName;
      self->_callerName = v14;

    }
  }
  p_callerName = &self->_callerName;
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logHandleForDomain:", "CHRecentCall");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall callerName].cold.1();

  return *p_callerName;
}

- (id)getLocalizedString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logHandleForDomain:", "CHRecentCall");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall getLocalizedString:].cold.2();

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandleForDomain:", "CHRecentCall");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall getLocalizedString:].cold.1(v5);

  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, CFSTR("Default Value"), CFSTR("CallHistory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)callerNameForDisplay
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  -[CHRecentCall callerName](self, "callerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logHandleForDomain:", "CHRecentCall");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Caller name is nil, let's use caller id formatted", buf, 2u);
    }

    -[CHRecentCall callerIdForDisplay](self, "callerIdForDisplay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v3, "length"))
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logHandleForDomain:", "CHRecentCall");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B3FA4000, v7, OS_LOG_TYPE_DEFAULT, "Caller id and caller name are nil, call is blocked or unknown", v14, 2u);
    }

    if (-[CHRecentCall callerIdIsBlocked](self, "callerIdIsBlocked"))
      v8 = CFSTR("BLOCKED_CALLER");
    else
      v8 = CFSTR("UNKNOWN_CALLER");
    -[CHRecentCall getLocalizedString:](self, "getLocalizedString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logHandleForDomain:", "CHRecentCall");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall callerNameForDisplay].cold.1();

  return v3;
}

- (NSString)callerIdLabel
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSString **p_callerIdLabel;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *callerIdLabel;
  void *v13;
  void *v14;
  NSObject *v15;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "CHRecentCall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall addressBookRecordId].cold.4(a2);

  p_callerIdLabel = &self->_callerIdLabel;
  if (!self->_callerIdLabel)
  {
    -[CHRecentCall phoneBookManager](self, "phoneBookManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall contactRef](self, "contactRef");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall callerId](self, "callerId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getLocalizedCallerIdLabelForContact:forCallerId:withCallerIdIsEmail:", v9, v10, -[CHRecentCall callerIdIsEmailAddress](self, "callerIdIsEmailAddress"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    callerIdLabel = self->_callerIdLabel;
    self->_callerIdLabel = v11;

  }
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logHandleForDomain:", "CHRecentCall");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CHRecentCall callerName].cold.1();

  return *p_callerIdLabel;
}

- (NSString)localizedBlockedByExtensionName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CHRecentCall blockedByExtension](self, "blockedByExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35D8];
    -[CHRecentCall blockedByExtension](self, "blockedByExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionWithIdentifier:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_plugIn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedContainingName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

+ (id)getLocationForCallerId:(id)a3 andIsoCountryCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    getSharedGEOPhoneNumberResolver();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v9 = *MEMORY[0x1E0D27918];
      v35[0] = *MEMORY[0x1E0D27920];
      v35[1] = v9;
      v36[0] = v5;
      v36[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = *MEMORY[0x1E0D27920];
      v34 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v10;
    objc_msgSend(v8, "addObject:", v10);
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__3;
    v31 = __Block_byref_object_dispose__3;
    v32 = 0;
    v13 = dispatch_semaphore_create(0);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke;
    v23 = &unk_1E6747228;
    v24 = v5;
    v26 = &v27;
    v14 = v13;
    v25 = v14;
    dispatch_get_global_queue(0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolvePhoneNumbers:handler:queue:", v8, &v20, v15);

    v16 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v14, v16))
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance", v20, v21, v22, v23, v24, v25, v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logHandleForDomain:", "CHRecentCall");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[CHRecentCall getLocationForCallerId:andIsoCountryCode:].cold.1(v18);

    }
    v11 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke_2;
  v6[3] = &unk_1E6747200;
  v7 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v8 = v5;
  objc_msgSend(a2, "enumerateResolutionsUsingBlock:", v6);

}

void __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v9))
  {
    if (v11)
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logHandleForDomain:", "CHRecentCall");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke_2_cold_1();

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = CFSTR("<<RecentsNumberLocationNotFound>>");
    }
    else
    {
      objc_msgSend(v10, "locationName");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;
    }

    *a5 = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (NSString)callerIdLocation
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *callerIdLocation;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "CHRecentCall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall callerId](self, "callerId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    callerIdLocation = self->_callerIdLocation;
    v16 = 138543874;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = callerIdLocation;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "==> %{public}@. Current location info for %@ is %@", (uint8_t *)&v16, 0x20u);

  }
  v10 = self->_callerIdLocation;
  if (!v10)
  {
    -[CHRecentCall callerId](self, "callerId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall isoCountryCode](self, "isoCountryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall getLocationForCallerId:andIsoCountryCode:](CHRecentCall, "getLocationForCallerId:andIsoCountryCode:", v11, v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = self->_callerIdLocation;
    self->_callerIdLocation = v13;

    v10 = self->_callerIdLocation;
  }
  if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("<<RecentsNumberLocationNotFound>>")))
    return (NSString *)0;
  else
    return self->_callerIdLocation;
}

- (id)callerIdSubStringForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CHRecentCall callerIdLabel](self, "callerIdLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CHRecentCall callerIdLocation](self, "callerIdLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[CHRecentCall getLocalizedString:](self, "getLocalizedString:", CFSTR("UNKNOWN_LABEL"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v6;

  }
  return v3;
}

- (BOOL)wasAutoAnswered
{
  return -[CHRecentCall autoAnsweredReason](self, "autoAnsweredReason") != 0;
}

- (id)callOccurrencesAsString
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[CHRecentCall callOccurrences](self, "callOccurrences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\tMerged Call %lu:\n"), v5);
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceUniqueIdKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceUniqueIdKey"), v7);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceCallTypeKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", objc_msgSend(v8, "unsignedIntegerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceCallTypeKey"), v9);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceCallStatusKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", objc_msgSend(v10, "unsignedIntegerValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceCallStatusKey"), v11);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceDurationKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceDurationKey"), v12);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceDateKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceDateKey"), v13);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceDataUsageKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceDataUsageKey"), v14);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceServiceProviderKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceServiceProviderKey"), v15);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceMediaTypeKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHRecentCall callMediaTypeAsString:](CHRecentCall, "callMediaTypeAsString:", objc_msgSend(v16, "unsignedIntegerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceMediaTypeKey"), v17);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceTTYTypeKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHRecentCall callTTYTypeAsString:](CHRecentCall, "callTTYTypeAsString:", objc_msgSend(v18, "unsignedIntegerValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceTTYTypeKey"), v19);
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCHCallOccurrenceVerificationStatusKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ch_stringWithCHRecentCallVerificationStatus:", objc_msgSend(v21, "unsignedIntegerValue"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "appendFormat:", CFSTR("\t{%@, %@}\n"), CFSTR("kCHCallOccurrenceVerificationStatusKey"), v22);
      ++v5;
    }
    while (v5 < objc_msgSend(v4, "count"));
  }

  return v3;
}

+ (id)callCategoryAsString:(unsigned int)a3
{
  char v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  if ((a3 & 2) != 0)
  {
    maybeAppendStringWithSeparator(&stru_1E6747850, CFSTR("kCHCallCategoryVideo"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E6747850;
  }
  if ((v3 & 1) != 0)
  {
    maybeAppendStringWithSeparator(v4, CFSTR("kCHCallCategoryAudio"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if ((v3 & 4) != 0)
  {
    maybeAppendStringWithSeparator(v4, CFSTR("kCHCallCategoryTTYDirect"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v6;
  }
  if ((v3 & 8) != 0)
  {
    maybeAppendStringWithSeparator(v4, CFSTR("kCHCallCategoryTTYRelay"));
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v7;
  }
  if (!-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("Unknown");
  }
  return v4;
}

+ (id)callDirectoryIdentificationTypeAsString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("CHCallDirectoryIdentityTypeBusiness");
  if (a3 == 1)
    return CFSTR("CHCallDirectoryIdentityTypePerson");
  else
    return (id)v3;
}

- (void)setMediaType:(int64_t)a3
{
  uint64_t v4;
  id v5;

  if (self->_mediaType != a3)
  {
    self->_mediaType = a3;
    self->_callCategory = +[CHRecentCall categoryForMediaType:andTTYType:](CHRecentCall, "categoryForMediaType:andTTYType:", -[CHRecentCall mediaType](self, "mediaType"), -[CHRecentCall ttyType](self, "ttyType"));
    v4 = -[CHRecentCall callCategory](self, "callCategory");
    -[CHRecentCall serviceProvider](self, "serviceProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    self->_callType = +[CHRecentCall getCallTypeForCategory:andServiceProvider:](CHRecentCall, "getCallTypeForCategory:andServiceProvider:", v4, v5);

  }
}

- (void)setTtyType:(int64_t)a3
{
  uint64_t v4;
  id v5;

  if (self->_ttyType != a3)
  {
    self->_ttyType = a3;
    self->_callCategory = +[CHRecentCall categoryForMediaType:andTTYType:](CHRecentCall, "categoryForMediaType:andTTYType:", -[CHRecentCall mediaType](self, "mediaType"), -[CHRecentCall ttyType](self, "ttyType"));
    v4 = -[CHRecentCall callCategory](self, "callCategory");
    -[CHRecentCall serviceProvider](self, "serviceProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    self->_callType = +[CHRecentCall getCallTypeForCategory:andServiceProvider:](CHRecentCall, "getCallTypeForCategory:andServiceProvider:", v4, v5);

  }
}

+ (unsigned)categoryForCallType:(unsigned int)a3
{
  if (a3 == 8)
    return 2;
  return a3 == 16 || a3 == 1;
}

+ (id)serviceProviderForCallType:(unsigned int)a3
{
  __CFString **v4;

  if (a3 == 16 || a3 == 8)
  {
    v4 = kCHServiceProviderFaceTime;
    return *v4;
  }
  if (a3 == 1)
  {
    v4 = kCHServiceProviderTelephony;
    return *v4;
  }
  return 0;
}

- (void)fixCallTypeInfo
{
  NSString *v3;
  NSString *serviceProvider;
  uint64_t v5;
  void *v6;

  if (!self->_callCategory)
    self->_callCategory = +[CHRecentCall categoryForCallType:](CHRecentCall, "categoryForCallType:", -[CHRecentCall callType](self, "callType"));
  if (!self->_serviceProvider)
  {
    +[CHRecentCall serviceProviderForCallType:](CHRecentCall, "serviceProviderForCallType:", -[CHRecentCall callType](self, "callType"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    serviceProvider = self->_serviceProvider;
    self->_serviceProvider = v3;

  }
  if (self->_callType == 0x80000000)
  {
    v5 = -[CHRecentCall callCategory](self, "callCategory");
    -[CHRecentCall serviceProvider](self, "serviceProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_callType = +[CHRecentCall getCallTypeForCategory:andServiceProvider:](CHRecentCall, "getCallTypeForCategory:andServiceProvider:", v5, v6);

  }
  -[CHRecentCall updateTTYAndMediaType](self, "updateTTYAndMediaType");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueId;
  id v5;
  uint64_t callerIdAvailability;
  void *v7;
  NSURL *imageURL;
  void *v9;
  NSUUID *localParticipantUUID;
  void *v11;
  NSString *name;
  void *v13;
  NSUUID *outgoingLocalParticipantUUID;
  void *v15;
  NSUUID *participantGroupUUID;
  void *v17;
  NSSet *remoteParticipantHandles;
  void *v19;
  int64_t verificationStatus;
  void *v21;
  int64_t junkConfidence;
  void *v23;
  NSString *junkIdentificationCategory;
  void *v25;
  NSNumber *disconnectedCause;
  void *v27;
  NSSet *emergencyMediaItems;
  void *v29;
  _BOOL8 usedEmergencyVideoStreaming;
  void *v31;
  _BOOL8 wasEmergencyCall;
  void *v33;
  unint64_t screenSharingType;
  id v35;

  uniqueId = self->_uniqueId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueId, CFSTR("uniqueId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callerId, CFSTR("callerId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_callType, CFSTR("callType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_callStatus, CFSTR("callStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mediaType, CFSTR("mediaType"));
  callerIdAvailability = self->_callerIdAvailability;
  NSStringFromSelector(sel_callerIdAvailability);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", callerIdAvailability, v7);

  objc_msgSend(v5, "encodeBool:forKey:", self->_read, CFSTR("read"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_unreadCount, CFSTR("unreadCount"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_bytesOfDataUsed, CFSTR("bytesOfDataUsed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mobileCountryCode, CFSTR("mobileCountryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mobileNetworkCode, CFSTR("mobileNetworkCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_devicePhoneId, CFSTR("devicePhoneId"));
  imageURL = self->_imageURL;
  NSStringFromSelector(sel_imageURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", imageURL, v9);

  objc_msgSend(v5, "encodeObject:forKey:", self->_isoCountryCode, CFSTR("isoCountryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callerIdLocation, CFSTR("callerIdLocation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_callCategory, CFSTR("callCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceProvider, CFSTR("serviceRadar"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_handleType, CFSTR("handleType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeToEstablish, CFSTR("timeToEstablish"));
  localParticipantUUID = self->_localParticipantUUID;
  NSStringFromSelector(sel_localParticipantUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", localParticipantUUID, v11);

  name = self->_name;
  NSStringFromSelector(sel_name);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", name, v13);

  outgoingLocalParticipantUUID = self->_outgoingLocalParticipantUUID;
  NSStringFromSelector(sel_outgoingLocalParticipantUUID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", outgoingLocalParticipantUUID, v15);

  participantGroupUUID = self->_participantGroupUUID;
  NSStringFromSelector(sel_participantGroupUUID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", participantGroupUUID, v17);

  remoteParticipantHandles = self->_remoteParticipantHandles;
  NSStringFromSelector(sel_remoteParticipantHandles);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", remoteParticipantHandles, v19);

  verificationStatus = self->_verificationStatus;
  NSStringFromSelector(sel_verificationStatus);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", verificationStatus, v21);

  junkConfidence = self->_junkConfidence;
  NSStringFromSelector(sel_junkConfidence);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", junkConfidence, v23);

  junkIdentificationCategory = self->_junkIdentificationCategory;
  NSStringFromSelector(sel_junkIdentificationCategory);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", junkIdentificationCategory, v25);

  objc_msgSend(v5, "encodeBool:forKey:", self->_hasMessage, CFSTR("hasMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationID, CFSTR("conversationID"));
  disconnectedCause = self->_disconnectedCause;
  NSStringFromSelector(sel_disconnectedCause);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", disconnectedCause, v27);

  objc_msgSend(v5, "encodeInteger:forKey:", self->_autoAnsweredReason, CFSTR("autoAnsweredReason"));
  emergencyMediaItems = self->_emergencyMediaItems;
  NSStringFromSelector(sel_emergencyMediaItems);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", emergencyMediaItems, v29);

  usedEmergencyVideoStreaming = self->_usedEmergencyVideoStreaming;
  NSStringFromSelector(sel_usedEmergencyVideoStreaming);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", usedEmergencyVideoStreaming, v31);

  wasEmergencyCall = self->_wasEmergencyCall;
  NSStringFromSelector(sel_wasEmergencyCall);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", wasEmergencyCall, v33);

  screenSharingType = self->_screenSharingType;
  NSStringFromSelector(sel_screenSharingType);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", screenSharingType, v35);

}

- (CHRecentCall)initWithCoder:(id)a3
{
  id v4;
  CHRecentCall *v5;
  uint64_t v6;
  NSString *uniqueId;
  uint64_t v8;
  NSString *callerId;
  uint64_t v10;
  NSDate *date;
  void *v12;
  double v13;
  uint64_t v14;
  NSNumber *bytesOfDataUsed;
  uint64_t v16;
  NSString *mobileCountryCode;
  uint64_t v18;
  NSString *mobileNetworkCode;
  uint64_t v20;
  NSString *devicePhoneId;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSURL *imageURL;
  uint64_t v26;
  NSString *isoCountryCode;
  uint64_t v28;
  NSString *callerIdLocation;
  uint64_t v30;
  NSString *serviceProvider;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSUUID *localParticipantUUID;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSString *name;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSUUID *outgoingLocalParticipantUUID;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSUUID *participantGroupUUID;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSSet *remoteParticipantHandles;
  void *v54;
  void *v55;
  uint64_t v56;
  NSUUID *conversationID;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSSet *emergencyMediaItems;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  NSNumber *timeToEstablish;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSNumber *disconnectedCause;

  v4 = a3;
  v5 = -[CHRecentCall init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueId"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueId = v5->_uniqueId;
    v5->_uniqueId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callerId"));
    v8 = objc_claimAutoreleasedReturnValue();
    callerId = v5->_callerId;
    v5->_callerId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v10 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    v5->_callType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callType"));
    v5->_callStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callStatus"));
    v5->_mediaType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaType"));
    NSStringFromSelector(sel_callerIdAvailability);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_callerIdAvailability = objc_msgSend(v4, "decodeIntegerForKey:", v12);

    v5->_read = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("read"));
    v5->_unreadCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("unreadCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bytesOfDataUsed"));
    v14 = objc_claimAutoreleasedReturnValue();
    bytesOfDataUsed = v5->_bytesOfDataUsed;
    v5->_bytesOfDataUsed = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mobileCountryCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    mobileCountryCode = v5->_mobileCountryCode;
    v5->_mobileCountryCode = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mobileNetworkCode"));
    v18 = objc_claimAutoreleasedReturnValue();
    mobileNetworkCode = v5->_mobileNetworkCode;
    v5->_mobileNetworkCode = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePhoneId"));
    v20 = objc_claimAutoreleasedReturnValue();
    devicePhoneId = v5->_devicePhoneId;
    v5->_devicePhoneId = (NSString *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_imageURL);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isoCountryCode"));
    v26 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callerIdLocation"));
    v28 = objc_claimAutoreleasedReturnValue();
    callerIdLocation = v5->_callerIdLocation;
    v5->_callerIdLocation = (NSString *)v28;

    v5->_callCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceRadar"));
    v30 = objc_claimAutoreleasedReturnValue();
    serviceProvider = v5->_serviceProvider;
    v5->_serviceProvider = (NSString *)v30;

    v32 = objc_opt_class();
    NSStringFromSelector(sel_localParticipantUUID);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    localParticipantUUID = v5->_localParticipantUUID;
    v5->_localParticipantUUID = (NSUUID *)v34;

    v36 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v38;

    v40 = objc_opt_class();
    NSStringFromSelector(sel_outgoingLocalParticipantUUID);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v40, v41);
    v42 = objc_claimAutoreleasedReturnValue();
    outgoingLocalParticipantUUID = v5->_outgoingLocalParticipantUUID;
    v5->_outgoingLocalParticipantUUID = (NSUUID *)v42;

    v44 = objc_opt_class();
    NSStringFromSelector(sel_participantGroupUUID);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v44, v45);
    v46 = objc_claimAutoreleasedReturnValue();
    participantGroupUUID = v5->_participantGroupUUID;
    v5->_participantGroupUUID = (NSUUID *)v46;

    v48 = (void *)MEMORY[0x1E0C99E60];
    v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_remoteParticipantHandles);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    remoteParticipantHandles = v5->_remoteParticipantHandles;
    v5->_remoteParticipantHandles = (NSSet *)v52;

    NSStringFromSelector(sel_verificationStatus);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_verificationStatus = objc_msgSend(v4, "decodeIntegerForKey:", v54);

    NSStringFromSelector(sel_junkConfidence);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_junkConfidence = objc_msgSend(v4, "decodeIntegerForKey:", v55);

    v5->_hasMessage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasMessage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationID"));
    v56 = objc_claimAutoreleasedReturnValue();
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSUUID *)v56;

    v5->_autoAnsweredReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("autoAnsweredReason"));
    v58 = (void *)MEMORY[0x1E0C99E60];
    v59 = objc_opt_class();
    objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_emergencyMediaItems);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v60, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    emergencyMediaItems = v5->_emergencyMediaItems;
    v5->_emergencyMediaItems = (NSSet *)v62;

    NSStringFromSelector(sel_usedEmergencyVideoStreaming);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_usedEmergencyVideoStreaming = objc_msgSend(v4, "decodeBoolForKey:", v64);

    NSStringFromSelector(sel_wasEmergencyCall);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wasEmergencyCall = objc_msgSend(v4, "decodeBoolForKey:", v65);

    NSStringFromSelector(sel_callDirectoryIdentityType);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_callDirectoryIdentityType = objc_msgSend(v4, "decodeIntegerForKey:", v66);

    NSStringFromSelector(sel_screenSharingType);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screenSharingType = objc_msgSend(v4, "decodeIntegerForKey:", v67);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("handleType")))
      v68 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("handleType"));
    else
      v68 = +[CHHandle handleTypeForValue:](CHHandle, "handleTypeForValue:", v5->_callerId);
    v5->_handleType = v68;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeToEstablish"));
    v69 = objc_claimAutoreleasedReturnValue();
    timeToEstablish = v5->_timeToEstablish;
    v5->_timeToEstablish = (NSNumber *)v69;

    v71 = objc_opt_class();
    NSStringFromSelector(sel_disconnectedCause);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v71, v72);
    v73 = objc_claimAutoreleasedReturnValue();
    disconnectedCause = v5->_disconnectedCause;
    v5->_disconnectedCause = (NSNumber *)v73;

    -[CHRecentCall fixCallTypeInfo](v5, "fixCallTypeInfo");
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CHRecentCall uniqueId](self, "uniqueId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToRecentCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;

  v4 = a3;
  -[CHRecentCall uniqueId](self, "uniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (!v8)
    {

      goto LABEL_7;
    }
    v10 = objc_msgSend((id)v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_7;
  }
  v11 = -[CHRecentCall hasMessage](self, "hasMessage");
  if (v11 != objc_msgSend(v4, "hasMessage"))
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v12 = -[CHRecentCall isEquivalentToRecentCall:](self, "isEquivalentToRecentCall:", v4);
LABEL_8:

  return v12;
}

- (BOOL)isEquivalentToRecentCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  -[CHRecentCall outgoingLocalParticipantUUID](self, "outgoingLocalParticipantUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outgoingLocalParticipantUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = (void *)v8;
  if (!(v7 | v8))
    goto LABEL_4;
  if (!v8)
  {
    v15 = 0;
    v12 = (void *)v7;
LABEL_12:

    goto LABEL_13;
  }
  v10 = objc_msgSend((id)v7, "isEqual:", v8);

  if (v10)
  {
LABEL_4:
    v11 = -[CHRecentCall callStatus](self, "callStatus");
    if (v11 == objc_msgSend(v4, "callStatus"))
    {
      -[CHRecentCall bytesOfDataUsed](self, "bytesOfDataUsed");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bytesOfDataUsed");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13 && (v14 = -[CHRecentCall read](self, "read"), v14 == objc_msgSend(v4, "read")))
      {
        -[CHRecentCall callOccurrences](self, "callOccurrences");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        objc_msgSend(v4, "callOccurrences");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v17 == objc_msgSend(v18, "count");

      }
      else
      {
        v15 = 0;
      }

      goto LABEL_12;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)setWasAutoAnswered:(BOOL)a3
{
  self->_wasAutoAnswered = a3;
}

- (NSSet)emergencyMediaItems
{
  return self->_emergencyMediaItems;
}

- (void)setEmergencyMediaItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)usedEmergencyVideoStreaming
{
  return self->_usedEmergencyVideoStreaming;
}

- (void)setUsedEmergencyVideoStreaming:(BOOL)a3
{
  self->_usedEmergencyVideoStreaming = a3;
}

- (BOOL)wasEmergencyCall
{
  return self->_wasEmergencyCall;
}

- (void)setWasEmergencyCall:(BOOL)a3
{
  self->_wasEmergencyCall = a3;
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_screenSharingType = a3;
}

- (BOOL)read
{
  return self->_read;
}

- (unsigned)callerIdAvailability
{
  return self->_callerIdAvailability;
}

- (void)setCallerIdLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)timeToEstablish
{
  return self->_timeToEstablish;
}

- (int64_t)callDirectoryIdentityType
{
  return self->_callDirectoryIdentityType;
}

- (void)setCallDirectoryIdentityType:(int64_t)a3
{
  self->_callDirectoryIdentityType = a3;
}

- (void)setAddressBookRecordId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)addressBookCallerIDMultiValueId
{
  return self->_addressBookCallerIDMultiValueId;
}

- (void)setAddressBookCallerIDMultiValueId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)callerId
{
  return self->_callerId;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)devicePhoneId
{
  return self->_devicePhoneId;
}

- (void)setDevicePhoneId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)mobileCountryCode
{
  return self->_mobileCountryCode;
}

- (void)setMobileCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)mobileNetworkCode
{
  return self->_mobileNetworkCode;
}

- (void)setMobileNetworkCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setContactRef:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)blockedByExtension
{
  return self->_blockedByExtension;
}

- (void)setBlockedByExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (int64_t)autoAnsweredReason
{
  return self->_autoAnsweredReason;
}

- (void)setAutoAnsweredReason:(int64_t)a3
{
  self->_autoAnsweredReason = a3;
}

- (void)setCallerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (CHPhoneBookIOSManager)phoneBookManager
{
  return self->_phoneBookManager;
}

- (void)setCallerIdFormatted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (BOOL)answered
{
  return self->_answered;
}

- (void)setAnswered:(BOOL)a3
{
  self->_answered = a3;
}

- (BOOL)mobileOriginated
{
  return self->_mobileOriginated;
}

- (void)setMobileOriginated:(BOOL)a3
{
  self->_mobileOriginated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerIdFormatted, 0);
  objc_storeStrong((id *)&self->_phoneBookManager, 0);
  objc_storeStrong((id *)&self->_participantGroupUUID, 0);
  objc_storeStrong((id *)&self->_callerName, 0);
  objc_storeStrong((id *)&self->_blockedByExtension, 0);
  objc_storeStrong((id *)&self->_contactRef, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
  objc_storeStrong((id *)&self->_devicePhoneId, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_callerId, 0);
  objc_storeStrong((id *)&self->_addressBookCallerIDMultiValueId, 0);
  objc_storeStrong((id *)&self->_addressBookRecordId, 0);
  objc_storeStrong((id *)&self->_timeToEstablish, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_callOccurrences, 0);
  objc_storeStrong((id *)&self->_callerIdLocation, 0);
  objc_storeStrong((id *)&self->_callerIdLabel, 0);
  objc_storeStrong((id *)&self->_junkIdentificationCategory, 0);
  objc_storeStrong((id *)&self->_filteredOutReason, 0);
  objc_storeStrong((id *)&self->_disconnectedCause, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_bytesOfDataUsed, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_emergencyMediaItems, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_outgoingLocalParticipantUUID, 0);
  objc_storeStrong((id *)&self->_localParticipantUUID, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)predicateForCallsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("date >= %@"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("date <= %@"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

+ (id)predicateForCallsLessThanDate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("date < %@"), a3);
}

+ (id)predicateForCallsWithAnyMediaTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "integerValue", (_QWORD)v16);
        if ((unint64_t)(v11 - 1) <= 1)
        {
          objc_msgSend(a1, "predicateForCallsWithMediaType:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v5, "count") == 1)
      objc_msgSend(v5, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

+ (id)predicateForCallsWithRemoteParticipantCount:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("remoteParticipantHandles.@count = %d"), a3);
}

+ (id)predicateForCallsWithRemoteParticipantHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "normalizedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "normalizedValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleNormalizedValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleType:", objc_msgSend(v4, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForCallsWithRemoteParticipantHandleType:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY remoteParticipantHandles.type = %d"), a3);
}

+ (id)predicateForCallsWithRemoteParticipantHandleValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY remoteParticipantHandles.value ==[c] %@"), a3);
}

+ (id)predicateForCallsWithRemoteParticipantHandleNormalizedValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY remoteParticipantHandles.normalizedValue ==[c] %@"), a3);
}

+ (id)predicateForCallsWithAnyRemoteParticipantHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandle:", v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v31 = a1;
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "type"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

          objc_msgSend(v13, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

          objc_msgSend(v13, "normalizedValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v13, "normalizedValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v17);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "predicateForCallsWithAnyRemoteParticipantHandleTypes:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

    v21 = objc_msgSend(v7, "count");
    objc_msgSend(v6, "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "predicateForCallsWithAnyRemoteParticipantHandleValues:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v21)
    {
      v37[0] = v23;
      objc_msgSend(v7, "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "predicateForCallsWithAnyRemoteParticipantHandleNormalizedValues:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v27 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)v27;
    }
    objc_msgSend(v18, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v32;
  }

  return v28;
}

+ (id)predicateForCallsWithAnyRemoteParticipantHandleTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v11, "integerValue") - 1) <= 2)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v5, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    objc_msgSend(v5, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleType:", objc_msgSend(v13, "integerValue"));
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("ANY remoteParticipantHandles.type IN %@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

LABEL_16:
  return v15;
}

+ (id)predicateForCallsWithAnyRemoteParticipantHandleValues:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if (objc_msgSend(v4, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleValue:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v4, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY remoteParticipantHandles.value IN %@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_7:
  return v8;
}

+ (id)predicateForCallsWithAnyRemoteParticipantHandleNormalizedValues:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if (objc_msgSend(v4, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleNormalizedValue:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v4, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY remoteParticipantHandles.normalizedValue IN %@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_7:
  return v8;
}

+ (id)predicateForCallsWithRemoteParticipantHandles:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHRecentCall predicateForCallsWithRemoteParticipantHandle:](CHRecentCall, "predicateForCallsWithRemoteParticipantHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(remoteParticipantHandles IN %@)"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)predicateForCallsContainingServiceProvider:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("service_provider contains[c] %@"), a3);
}

+ (id)predicateForCallsWithAnyServiceProviders:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(service_provider IN %@)"), v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForCallsWithStatus:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  void *v12;

  v3 = MEMORY[0x1E0C9AAA0];
  if ((a3 & 1) == 1)
    v4 = MEMORY[0x1E0C9AAA0];
  else
    v4 = 0;
  v5 = MEMORY[0x1E0C9AAB0];
  v6 = (~a3 & 8) == 0 || (a3 & 0x10) == 16;
  v7 = (~a3 & 4) == 0 || (~a3 & 8) == 0;
  if ((a3 & 2) == 2)
  {
    v4 = MEMORY[0x1E0C9AAB0];
    v8 = 1;
  }
  else
  {
    v8 = (~a3 & 4) == 0;
  }
  v9 = (a3 & 1) == 1 || v8;
  if (v7)
    v10 = MEMORY[0x1E0C9AAA0];
  else
    v10 = v4;
  if ((a3 & 0x10) == 0x10)
    v10 = MEMORY[0x1E0C9AAB0];
  if ((v6 | v9) != 1 || v10 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v9)
      v5 = 0;
    if (!v6)
      v3 = v5;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(answered = %@) AND (originated = %@)"), v3, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

+ (id)predicateForCallsWithStatusAnswered:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("answered = %d"), a3);
}

+ (id)predicateForCallsWithStatusOriginated:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("originated = %d"), a3);
}

+ (id)predicateForCallsWithStatusJunk:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("junkConfidence >= %d");
  else
    v3 = CFSTR("junkConfidence < %d");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForCallsWithAnyTTYTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "integerValue", (_QWORD)v16);
        if ((unint64_t)(v11 - 1) <= 1)
        {
          objc_msgSend(a1, "predicateForCallsWithTTYType:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v5, "count") == 1)
      objc_msgSend(v5, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

+ (id)predicateForCallsWithUniqueID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("unique_id = %@"), a3);
}

+ (id)predicateForCallsWithAnyUniqueIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if (objc_msgSend(v4, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForCallsWithUniqueID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v4, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("(unique_id IN %@)"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_7:
  return v8;
}

- (NSString)notificationThreadIdentifier
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v5 ^= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hash");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)addressBookRecordId
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1B3FA4000, v2, v3, "==> %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)callerName
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_4_0();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "remoteParticipantHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1B3FA4000, v3, v4, "==> %{public}@:%@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_2();
}

- (void)getLocalizedString:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "resourcePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1B3FA4000, v2, v3, "ClassBundle: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)getLocalizedString:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resourcePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1B3FA4000, v2, v3, "MainBundle: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_2();
}

- (void)callerNameForDisplay
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1B3FA4000, v2, v3, "<== %{public}@ = %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_2();
}

+ (void)getLocationForCallerId:(os_log_t)log andIsoCountryCode:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_ERROR, "Timeout occured waiting for GeoServices to return location!", v1, 2u);
}

void __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  v3 = v0;
  _os_log_error_impl(&dword_1B3FA4000, v1, OS_LOG_TYPE_ERROR, "Could not get location information for phone number %@ error: %{public}@", v2, 0x16u);
}

@end
