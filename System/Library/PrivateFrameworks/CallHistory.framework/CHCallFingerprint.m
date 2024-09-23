@implementation CHCallFingerprint

+ (BOOL)doCallTypesMatch:(id)a3 :(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "mediaType");
  if (v7 == objc_msgSend(v6, "mediaType") && (v8 = objc_msgSend(v5, "ttyType"), v8 == objc_msgSend(v6, "ttyType")))
  {
    objc_msgSend(v5, "serviceProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)doHandlesMatch:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "remoteParticipantHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v6, "remoteParticipantHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 == v10
    && (objc_msgSend(v5, "remoteParticipantHandles"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v12))
  {
    objc_msgSend(v5, "notificationThreadIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationThreadIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)doesCall:(id)a3 matchWith:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  BOOL v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "uniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v5, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;

    if (+[CHCallFingerprint doCallTypesMatch::](CHCallFingerprint, "doCallTypesMatch::", v5, v6))
    {
      v15 = +[CHCallFingerprint doHandlesMatch:with:](CHCallFingerprint, "doHandlesMatch:with:", v5, v6);
      v10 = fabs(v14) <= 5.0 && v15;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (id)matchCallWithFingerprint:(id)a3 usingDatabase:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "uniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchObjectWithUniqueId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v5, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "remoteParticipantHandles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "date");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          -[NSObject dateByAddingTimeInterval:](v13, "dateByAddingTimeInterval:", -5.0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject dateByAddingTimeInterval:](v14, "dateByAddingTimeInterval:", 5.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[CHRecentCall predicateForCallsBetweenStartDate:endDate:](CHRecentCall, "predicateForCallsBetweenStartDate:endDate:", v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v17);

        }
        v18 = objc_msgSend(v5, "mediaType");
        if (v18)
        {
          +[CHRecentCall predicateForCallsWithMediaType:](CHRecentCall, "predicateForCallsWithMediaType:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        objc_msgSend(v5, "serviceProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          +[CHRecentCall predicateForCallsWithServiceProvider:](CHRecentCall, "predicateForCallsWithServiceProvider:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

        }
        v56 = v20;
        v22 = objc_msgSend(v5, "ttyType");
        if (v22)
        {
          +[CHRecentCall predicateForCallsWithTTYType:](CHRecentCall, "predicateForCallsWithTTYType:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v23);

        }
        objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
        v24 = objc_claimAutoreleasedReturnValue();
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logHandleForDomain:", "Fingerprint");
        v26 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v58 = v24;
          _os_log_impl(&dword_1B3FA4000, v26, OS_LOG_TYPE_DEFAULT, "Fetching local call record using predicate %{public}@", buf, 0xCu);
        }

        v55 = (void *)v24;
        objc_msgSend(v6, "fetchObjectsWithPredicate:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logHandleForDomain:", "Fingerprint");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = v30;
        v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v32)
          {
            v33 = objc_msgSend(v27, "count");
            objc_msgSend(v5, "uniqueId");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v58 = v33;
            v59 = 2114;
            v60 = (uint64_t)v34;
            _os_log_impl(&dword_1B3FA4000, v31, OS_LOG_TYPE_DEFAULT, "Found %lu calls matching %{public}@ in local data store", buf, 0x16u);

          }
          if (!objc_msgSend(v27, "count"))
          {
            v8 = 0;
LABEL_36:

            goto LABEL_37;
          }
          objc_msgSend(v5, "remoteParticipantHandles");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "allObjects");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[CHRecentCall predicateForCallsWithRemoteParticipantHandles:](CHRecentCall, "predicateForCallsWithRemoteParticipantHandles:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "filteredArrayUsingPredicate:", v37);
          v31 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v31, "count"))
          {
            -[NSObject objectAtIndexedSubscript:](v31, "objectAtIndexedSubscript:", 0);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "logHandleForDomain:", "Fingerprint");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = v39;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v8, "uniqueId");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "uniqueId");
              v41 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v58 = (uint64_t)v54;
              v59 = 2114;
              v60 = v41;
              v42 = (void *)v41;
              _os_log_impl(&dword_1B3FA4000, v40, OS_LOG_TYPE_DEFAULT, "Fingerprint matched local call %{public}@ with remote call %{public}@", buf, 0x16u);

            }
          }
          else
          {
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "logHandleForDomain:", "Fingerprint");
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = v51;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v5, "uniqueId");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v58 = (uint64_t)v52;
              _os_log_impl(&dword_1B3FA4000, v40, OS_LOG_TYPE_DEFAULT, "Did not find filtered caller ID result matching call %{public}@", buf, 0xCu);

            }
            v8 = 0;
          }
          v20 = v56;

        }
        else
        {
          if (v32)
          {
            objc_msgSend(v5, "uniqueId");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v58 = (uint64_t)v49;
            _os_log_impl(&dword_1B3FA4000, v31, OS_LOG_TYPE_DEFAULT, "Could not find fingerprinted call %{public}@ in local data store", buf, 0xCu);

          }
          v8 = 0;
          v37 = v31;
        }

        goto LABEL_36;
      }
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "logHandleForDomain:", "Fingerprint");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v48;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "uniqueId");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = (uint64_t)v45;
        v46 = "Ignoring fingerprinted call %{public}@ without remote participant handles";
        goto LABEL_25;
      }
    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "logHandleForDomain:", "Fingerprint");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v44;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "uniqueId");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = (uint64_t)v45;
        v46 = "Ignoring fingerprinted call %{public}@ without a date";
LABEL_25:
        _os_log_impl(&dword_1B3FA4000, v14, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);

      }
    }
    v8 = 0;
    v12 = v14;
LABEL_37:

  }
  return v8;
}

@end
