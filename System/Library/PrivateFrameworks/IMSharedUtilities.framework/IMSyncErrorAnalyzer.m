@implementation IMSyncErrorAnalyzer

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E2882AC;
  block[3] = &unk_1E3FB6278;
  block[4] = a1;
  if (qword_1ECFC74B8 != -1)
    dispatch_once(&qword_1ECFC74B8, block);
  return (id)qword_1ECFC7580;
}

- (BOOL)_isCKErrorPartialFailure:(id)a3
{
  return objc_msgSend(a3, "code") == 2;
}

- (id)_errorsFromPartialError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0C94940]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)CKPartialError:(id)a3 onlyHasErrorCodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[IMSyncErrorAnalyzer _isCKErrorPartialFailure:](self, "_isCKErrorPartialFailure:", v6)
    && objc_msgSend(v7, "count"))
  {
    -[IMSyncErrorAnalyzer _errorsFromPartialError:](self, "_errorsFromPartialError:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "code"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v7, "containsObject:", v13))
            v11 = 0;

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v9);
      v14 = v11 & 1;
    }
    else
    {
      v14 = 1;
    }

  }
  else
  {
    if (v6 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "******** IMDCKUtilities not a partial error %@", buf, 0xCu);
      }

    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)CKPartialError:(id)a3 hasErrorCode:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = -[IMSyncErrorAnalyzer _isCKErrorPartialFailure:](self, "_isCKErrorPartialFailure:", v6);
  if (!v7 || !v8)
    goto LABEL_7;
  -[IMSyncErrorAnalyzer _errorsFromPartialError:](self, "_errorsFromPartialError:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != 1)
  {

    goto LABEL_7;
  }
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "code");
  v12 = objc_msgSend(v7, "integerValue");

  if (v11 != v12)
  {
LABEL_7:
    v14 = objc_msgSend(v6, "code");
    v13 = v14 == objc_msgSend(v7, "integerValue");
    goto LABEL_8;
  }
  v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)errorIndicatesZoneNotCreated:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  if (v4)
  {
    IMSingleObjectArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v4, v5))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C947D8]))
        v6 = objc_msgSend(v4, "code") == 26;
      else
        v6 = 0;

    }
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Messages.ChatSyncErrorDomain")))
    {
      v9 = objc_msgSend(v4, "code");

      if (v9 == 1)
        v6 = 1;
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Messages.MessageSyncErrorDomain")))
    {
      v11 = objc_msgSend(v4, "code");

      if (v11 == 1)
        v6 = 1;
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.IMCore.IMDCKAttachmentSyncController")))
    {
      v13 = objc_msgSend(v4, "code");

      if (!v13)
        v6 = 1;
    }
    else
    {

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesZoneNotFound:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      v6 = objc_msgSend(v4, "code") == 26;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesUserDeletedZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v7)
    goto LABEL_7;
  IMSingleObjectArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v5, v8))
  {
    v9 = objc_msgSend(v5, "code");

    if (v9 == 28)
      goto LABEL_6;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }

LABEL_6:
  v10 = 1;
LABEL_8:

  return v10;
}

- (BOOL)errorIndicatesDeviceConditionsDontAllowSync:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Messages.MessageSyncErrorDomain")))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 2)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Messages.ChatSyncErrorDomain")))
  {
    v7 = objc_msgSend(v3, "code");

    if (v7 == 3)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(v3, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.IMCore.IMDCKAttachmentSyncController")))
  {

    goto LABEL_13;
  }
  v9 = objc_msgSend(v3, "code");

  if (v9 != 4)
  {
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)errorIndicatesMaxAttemptsFailed:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Messages.ChatSyncErrorDomain")))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 6)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.IMCore.IMDCKAttachmentSyncController")))
  {

    goto LABEL_9;
  }
  v7 = objc_msgSend(v3, "code");

  if (v7 != 1)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
LABEL_7:
  v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)errorIndicatesQuotaExceeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMSyncErrorAnalyzer _isCKErrorPartialFailure:](self, "_isCKErrorPartialFailure:", v4))
  {
    -[IMSyncErrorAnalyzer _errorsFromPartialError:](self, "_errorsFromPartialError:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "code") == 25)
            v7 = 1;
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
      LOBYTE(v6) = v7 & 1;
    }
  }
  else
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    {

      LOBYTE(v6) = 0;
      goto LABEL_16;
    }
    LOBYTE(v6) = objc_msgSend(v4, "code") == 25;
  }

LABEL_16:
  return v6;
}

- (BOOL)errorIndicatesTokenWasExpired:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMSyncErrorAnalyzer _isCKErrorPartialFailure:](self, "_isCKErrorPartialFailure:", v4))
  {
    -[IMSyncErrorAnalyzer _errorsFromPartialError:](self, "_errorsFromPartialError:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "code") == 21)
            v7 = 1;
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
      LOBYTE(v6) = v7 & 1;
    }
  }
  else
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    {

      LOBYTE(v6) = 0;
      goto LABEL_16;
    }
    LOBYTE(v6) = objc_msgSend(v4, "code") == 21;
  }

LABEL_16:
  return v6;
}

- (BOOL)errorIndicatesBatchFailure:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      v6 = objc_msgSend(v4, "code") == 22;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesRecordWasArchived:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      v6 = objc_msgSend(v4, "code") == 100 || objc_msgSend(v4, "code") == 2050;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesDuplicateRecordWasFound:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]) && objc_msgSend(v4, "code") == 12)
    {
      objc_msgSend(v4, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v4, "userInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *MEMORY[0x1E0C947C8];
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C947C8]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v4, "userInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsString:", CFSTR("You can't save the same record twice"));

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)errorIndicatesRecordWasAlreadyChanged:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      v6 = objc_msgSend(v4, "code") == 14;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesAssetWasNotAvailable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      v6 = objc_msgSend(v4, "code") == 35;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesItemWasUnknown:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
      v6 = objc_msgSend(v4, "code") == 11;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesBatchSizeFailure:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C94B20]);

    if (v7)
    {
      objc_msgSend(v3, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8])
                && objc_msgSend(v3, "code") == 27
                && objc_msgSend(v5, "code") == 1020;

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)errorIndicatesRecordSizeFailure:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C94B20]);

    if (v7)
    {
      objc_msgSend(v3, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8])
                && objc_msgSend(v3, "code") == 27
                && objc_msgSend(v5, "code") == 2023;

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)acceptableErrorCodeWhileDeleting:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E3FFE450, &unk_1E3FFE468, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !v4
    || -[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v4, v5)
    || objc_msgSend(v4, "code") == 26
    || objc_msgSend(v4, "code") == 28;

  return v6;
}

- (id)extractRecordIDsDeletedFromCKPartialError:(id)a3
{
  id v4;
  __CFArray *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4 && -[IMSyncErrorAnalyzer _isCKErrorPartialFailure:](self, "_isCKErrorPartialFailure:", v4))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v9)
      goto LABEL_19;
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "code") == 26)
        {
          if (!v5)
            goto LABEL_17;
LABEL_15:
          objc_msgSend(v13, "recordName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v13, "recordName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            CFArrayAppendValue(v5, v17);

          }
          goto LABEL_17;
        }
        if (objc_msgSend(v14, "code") == 28 && v5 != 0)
          goto LABEL_15;
LABEL_17:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v10)
      {
LABEL_19:

        break;
      }
    }
  }

  return v5;
}

- (id)extractRecordIDsNotFoundFromCKPartialError:(id)a3
{
  id v4;
  __CFArray *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4 && -[IMSyncErrorAnalyzer _isCKErrorPartialFailure:](self, "_isCKErrorPartialFailure:", v4))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "code") == 11 && v5 != 0)
          {
            objc_msgSend(v13, "recordName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v13, "recordName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              CFArrayAppendValue(v5, v17);

            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (BOOL)errorIndicatesIdentityWasLost:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {

    goto LABEL_5;
  }
  if (objc_msgSend(v4, "code") != 112)
  {
    v7 = -[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v4, &unk_1E3FFEE88);

    if (v7)
      goto LABEL_7;
LABEL_5:
    v6 = 0;
    goto LABEL_12;
  }

LABEL_7:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "********** Encryption identiy missing error ***********", v10, 2u);
    }

  }
  v6 = 1;
LABEL_12:

  return v6;
}

- (BOOL)errorIndicatesDeviceDoesNotHaveKeysToSync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint8_t *v9;
  BOOL v10;
  NSObject *v11;
  __int16 v13;
  __int16 v14;
  uint8_t buf[2];
  uint8_t v16[16];

  v4 = a3;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "domain"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]),
        v6,
        (v7 & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Error does not indicate device is missing TLK", v16, 2u);
      }

    }
    goto LABEL_15;
  }
  if (!-[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v5, &unk_1E3FFEEA0)&& objc_msgSend(v5, "code") != 111)
  {
    if (-[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v5, &unk_1E3FFEEB8)|| objc_msgSend(v5, "code") == 110)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_10;
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_9;
      v14 = 0;
      v9 = (uint8_t *)&v14;
      goto LABEL_8;
    }
    if (-[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v5, &unk_1E3FFEED0)|| objc_msgSend(v5, "code") == 112)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_10;
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_9;
      v13 = 0;
      v9 = (uint8_t *)&v13;
      goto LABEL_8;
    }
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v9 = buf;
LABEL_8:
    _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Error indicates missing TLKs.", v9, 2u);
    goto LABEL_9;
  }
LABEL_10:
  v10 = 1;
LABEL_16:

  return v10;
}

- (unint64_t)calculateDelay:(unint64_t)a3 forAttempt:(unint64_t)a4 maxInterval:(unint64_t)a5
{
  double v6;

  v6 = exp2((double)a4) * (double)a3;
  if (v6 >= (double)a5)
    return (unint64_t)(double)a5;
  return (unint64_t)v6;
}

- (int64_t)responseForError:(id)a3 attempt:(unint64_t)a4 retryInterval:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  int v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  unint64_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  BOOL v53;
  NSObject *v54;
  int v55;
  unint64_t v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "responseForError should not be called with nil error", (uint8_t *)&v55, 2u);
    }

  }
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C947D8];
  v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v12)
  {
    objc_msgSend(v8, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.Messages.MiC"));

    if (v16)
    {
      v17 = 1;
      switch(objc_msgSend(v8, "code"))
      {
        case 0:
          goto LABEL_36;
        case 2:
          v17 = 4;
          break;
        case 3:
          v17 = 5;
          break;
        case 4:
          v17 = 258;
          break;
        case 7:
          v17 = 259;
          break;
        default:
          goto LABEL_91;
      }
      goto LABEL_91;
    }
    objc_msgSend(v8, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("kCFErrorDomainCFNetwork"));

    if ((v23 & 1) != 0
      || (objc_msgSend(v8, "domain"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
          v24,
          (v25 & 1) != 0))
    {
      v17 = 2;
      goto LABEL_91;
    }
    objc_msgSend(v8, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

    if ((v28 & 1) != 0)
      goto LABEL_36;
    objc_msgSend(v8, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("FileTransferFileURLRetrievalErrorDomain"));

    if (v30)
    {
      if (objc_msgSend(v8, "code") == 10)
        v17 = 8;
      else
        v17 = 7;
    }
    else
    {
      objc_msgSend(v8, "domain");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("FileTransferErrorDomain"));

      if ((v37 & 1) == 0)
      {
        if (-[IMSyncErrorAnalyzer errorIndicatesZoneNotCreated:](self, "errorIndicatesZoneNotCreated:", v8)
          && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            v55 = 138412290;
            v56 = (unint64_t)v8;
            _os_log_impl(&dword_19E239000, v50, OS_LOG_TYPE_INFO, "Error: zone creation failed %@, is not recoverable", (uint8_t *)&v55, 0xCu);
          }

        }
        if (!-[IMSyncErrorAnalyzer errorIndicatesDeviceConditionsDontAllowSync:](self, "errorIndicatesDeviceConditionsDontAllowSync:", v8))
        {
          if (-[IMSyncErrorAnalyzer errorIndicatesMaxAttemptsFailed:](self, "errorIndicatesMaxAttemptsFailed:", v8)
            && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              v55 = 138412290;
              v56 = (unint64_t)v8;
              _os_log_impl(&dword_19E239000, v54, OS_LOG_TYPE_INFO, "Error: exceeded attempts %@, is not recoverable", (uint8_t *)&v55, 0xCu);
            }

          }
          v17 = 1;
          goto LABEL_91;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            v55 = 138412290;
            v56 = (unint64_t)v8;
            _os_log_impl(&dword_19E239000, v51, OS_LOG_TYPE_INFO, "Error: Conditions no longer good for sync %@, is not recoverable, will defer to DAS if possible", (uint8_t *)&v55, 0xCu);
          }

        }
LABEL_36:
        v17 = 3;
        goto LABEL_91;
      }
      v17 = 9;
    }
LABEL_91:
    v44 = -[IMSyncErrorAnalyzer calculateDelay:forAttempt:maxInterval:](self, "calculateDelay:forAttempt:maxInterval:", 15, a4, 300);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v55 = 138412802;
        v56 = (unint64_t)v8;
        v57 = 2048;
        v58 = v44;
        v59 = 2048;
        v60 = a4;
        _os_log_impl(&dword_19E239000, v47, OS_LOG_TYPE_INFO, "No retry interval found for error %@, calculated interval %lu for attempt %lu", (uint8_t *)&v55, 0x20u);
      }

    }
    goto LABEL_95;
  }
  if (objc_msgSend(v8, "code") == 2)
  {
    -[IMSyncErrorAnalyzer _errorsFromPartialError:](self, "_errorsFromPartialError:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v14;
    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v8, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v8, "code");
  v17 = 1;
  if (v20 > 110)
  {
    if (v20 <= 130)
    {
      if (v20 == 111)
      {
        v17 = 5;
      }
      else if (v20 == 112)
      {
        v17 = 6;
      }
    }
    else if ((unint64_t)(v20 - 131) >= 2)
    {
      if (v20 == 140)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v55 = 138412290;
            v56 = (unint64_t)v8;
            _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Error: Low Disk Space %@, is not recoverable", (uint8_t *)&v55, 0xCu);
          }
LABEL_73:

        }
LABEL_79:
        v17 = 1;
      }
    }
    else
    {
LABEL_25:
      v17 = 3;
    }
  }
  else
  {
    switch(v20)
    {
      case 1:
      case 25:
        if (!IMOSLoggingEnabled())
          goto LABEL_79;
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v55 = 138412290;
          v56 = (unint64_t)v8;
          _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Error %@ is not recoverable", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_73;
      case 2:
      case 5:
      case 8:
      case 13:
      case 15:
      case 21:
      case 27:
      case 28:
      case 29:
      case 30:
        break;
      case 3:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v55 = 138412290;
            v56 = (unint64_t)v8;
            _os_log_impl(&dword_19E239000, v32, OS_LOG_TYPE_INFO, "Error: Network unavailable error %@, should defer activity; xpc_activity_will invoke us again later.",
              (uint8_t *)&v55,
              0xCu);
          }

        }
        goto LABEL_25;
      case 4:
      case 6:
      case 7:
      case 23:
        if (!IMOSLoggingEnabled())
          goto LABEL_34;
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v55 = 138412290;
          v56 = (unint64_t)v8;
          _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Error: Throttle or Network Failure %@, retrying", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_33;
      case 9:
      case 32:
        goto LABEL_57;
      case 10:
      case 11:
      case 12:
      case 24:
      case 26:
      case 31:
        if (!IMOSLoggingEnabled())
          goto LABEL_79;
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v55 = 138412290;
          v56 = (unint64_t)v8;
          _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Error! Unexpected %@, not recoverable", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_73;
      case 14:
      case 16:
      case 17:
      case 19:
      case 22:
        if (!IMOSLoggingEnabled())
          goto LABEL_79;
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v55 = 138412290;
          v56 = (unint64_t)v8;
          _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Error: Failed to successfuly sync changes up %@, not recoverable", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_73;
      case 18:
        if (!IMOSLoggingEnabled())
          goto LABEL_79;
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v55 = 138412290;
          v56 = (unint64_t)v8;
          _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Error: Unexpected App Version! %@, not recoverable", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_73;
      case 20:
        objc_msgSend(v19, "domain");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *MEMORY[0x1E0C94878];
        if (objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0C94878]))
        {
          v35 = objc_msgSend(v19, "code") == 1026;

          if (v35)
            goto LABEL_25;
        }
        else
        {

        }
        objc_msgSend(v19, "domain");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "isEqualToString:", v34))
        {
          v39 = objc_msgSend(v19, "code") == 1025;

          if (v39)
            goto LABEL_79;
        }
        else
        {

        }
        objc_msgSend(v19, "domain");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "isEqualToString:", v11))
        {
          v53 = objc_msgSend(v19, "code") == 131;

          if (v53)
            goto LABEL_25;
        }
        else
        {

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            LOWORD(v55) = 0;
            _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Operation cancelled, an earlier operation might have failed, retrying", (uint8_t *)&v55, 2u);
          }
LABEL_33:

        }
LABEL_34:
        v17 = 2;
        break;
      default:
        if (v20 == 110)
        {
LABEL_57:
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v55 = 138412290;
              v56 = (unint64_t)v8;
              _os_log_impl(&dword_19E239000, v31, OS_LOG_TYPE_INFO, "Error: NonHSA2/No user/restricted %@.", (uint8_t *)&v55, 0xCu);
            }

          }
          v17 = 4;
        }
        break;
    }
  }
  objc_msgSend(v8, "userInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKey:", *MEMORY[0x1E0C94808]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v41, "doubleValue");
    v43 = v42;
    v44 = (unint64_t)v42;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v55 = 134217984;
        v56 = (unint64_t)v43;
        _os_log_impl(&dword_19E239000, v45, OS_LOG_TYPE_INFO, "Error userInfo has a retry interval %lu", (uint8_t *)&v55, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v55 = 138412290;
        v56 = 0;
        _os_log_impl(&dword_19E239000, v46, OS_LOG_TYPE_INFO, "Error userInfo had %@ as retry interval, ignoring.", (uint8_t *)&v55, 0xCu);
      }

    }
    v44 = 0;
  }

  if (!v44)
    goto LABEL_91;
LABEL_95:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v55 = 134218754;
      v56 = v17;
      v57 = 2048;
      v58 = v44;
      v59 = 2048;
      v60 = a4;
      v61 = 2112;
      v62 = v8;
      _os_log_impl(&dword_19E239000, v48, OS_LOG_TYPE_INFO, "Error analysis: response %lu interval %lu for attempt %lu error %@", (uint8_t *)&v55, 0x2Au);
    }

  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

@end
