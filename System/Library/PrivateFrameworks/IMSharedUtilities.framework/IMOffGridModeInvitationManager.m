@implementation IMOffGridModeInvitationManager

+ (id)sharedInstance
{
  if (qword_1ECFC74C8 != -1)
    dispatch_once(&qword_1ECFC74C8, &unk_1E3FB38A8);
  return (id)qword_1ECFC6F50;
}

- (IMOffGridModeInvitationManager)init
{
  IMOffGridModeInvitationManager *v2;
  NSCache *v3;
  NSCache *dateAttemptedInvitationByHandleCache;
  dispatch_queue_t v5;
  OS_dispatch_queue *offGridBackgroundQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMOffGridModeInvitationManager;
  v2 = -[IMOffGridModeInvitationManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    dateAttemptedInvitationByHandleCache = v2->_dateAttemptedInvitationByHandleCache;
    v2->_dateAttemptedInvitationByHandleCache = v3;

    v5 = dispatch_queue_create("com.apple.messages.IMOffGridModeInvitationManager", 0);
    offGridBackgroundQueue = v2->_offGridBackgroundQueue;
    v2->_offGridBackgroundQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (IDSOffGridStateManager)offGridStateManager
{
  IDSOffGridStateManager *offGridStateManager;
  id v4;
  OS_dispatch_queue *offGridBackgroundQueue;
  IDSOffGridStateManager *v6;
  id v7;
  IDSOffGridStateManager *v8;
  NSObject *v9;
  id v11;

  offGridStateManager = self->_offGridStateManager;
  if (!offGridStateManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D34328]);
    offGridBackgroundQueue = self->_offGridBackgroundQueue;
    v11 = 0;
    v6 = (IDSOffGridStateManager *)objc_msgSend(v4, "initWithQueue:error:", offGridBackgroundQueue, &v11);
    v7 = v11;
    v8 = self->_offGridStateManager;
    self->_offGridStateManager = v6;

    if (v7)
    {
      IMLogHandleForCategory("IMOffGridModeInvitationManager");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_19E36D530(v9);

    }
    offGridStateManager = self->_offGridStateManager;
  }
  return offGridStateManager;
}

- (void)attemptIfNecessaryToAutomaticallyShareOffGridModeWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  NSCache *dateAttemptedInvitationByHandleCache;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  IMOffGridModeInvitationManager *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[IMOffGridModeInvitationManager _isHandleIDEligibleToReceiveAutomaticInvitation:](self, "_isHandleIDEligibleToReceiveAutomaticInvitation:", v8))
  {
    -[IMOffGridModeInvitationManager _invitationCacheKeyForHandleID:fromHandleID:](self, "_invitationCacheKeyForHandleID:fromHandleID:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](self->_dateAttemptedInvitationByHandleCache, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && (objc_msgSend(v12, "timeIntervalSinceNow"), fabs(v14) < 300.0))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v11;
          _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Not attempting to check or share invitation for personal off grid mode, have attempted recently for cache key: %@", buf, 0xCu);
        }

      }
      if (v10)
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0, 0);
    }
    else
    {
      dateAttemptedInvitationByHandleCache = self->_dateAttemptedInvitationByHandleCache;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](dateAttemptedInvitationByHandleCache, "setObject:forKey:", v16, v11);

      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_19E2C39E4;
      v19[3] = &unk_1E3FB77E0;
      v23 = v10;
      v20 = v8;
      v21 = self;
      v22 = v9;
      -[IMOffGridModeInvitationManager _invitedHandlesContainHandleID:completion:](self, "_invitedHandlesContainHandleID:completion:", v20, v19);

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Not attempting to share off grid mode, recipient is not eligible (e.g. not a contact)", buf, 2u);
      }

    }
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0, 0);
  }

}

- (void)batchShareOffGridModeToHandleIDs:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  NSCache *dateAttemptedInvitationByHandleCache;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  IMOffGridModeInvitationManager *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = a4;
  v31 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v46 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Attempting to batch invite %lu handles", buf, 0xCu);
    }

  }
  objc_msgSend(v32, "unprefixedURI");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v41;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v13), "unprefixedURI");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[IMOffGridModeInvitationManager _isHandleIDEligibleToReceiveAutomaticInvitation:](self, "_isHandleIDEligibleToReceiveAutomaticInvitation:", v14))
        {
          -[IMOffGridModeInvitationManager _invitationCacheKeyForHandleID:fromHandleID:](self, "_invitationCacheKeyForHandleID:fromHandleID:", v14, v34);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache objectForKey:](self->_dateAttemptedInvitationByHandleCache, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && (objc_msgSend(v16, "timeIntervalSinceNow"), fabs(v18) < 300.0))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v46 = (uint64_t)v14;
                _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Not attempting to check or share invitation for personal off grid mode for handle: %@, have attempted recently", buf, 0xCu);
              }

            }
          }
          else
          {
            dateAttemptedInvitationByHandleCache = self->_dateAttemptedInvitationByHandleCache;
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSCache setObject:forKey:](dateAttemptedInvitationByHandleCache, "setObject:forKey:", v20, v15);

            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34EA8]), "initWithPrefixedURI:", v14);
            objc_msgSend(v33, "addObject:", v21);

          }
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v46 = (uint64_t)v14;
            _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Not attempting to share off grid mode for handle %@, recipient is not eligible (e.g. not a contact)", buf, 0xCu);
          }

        }
        ++v13;
      }
      while (v11 != v13);
      v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      v11 = v24;
    }
    while (v24);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v33, "count");
      *(_DWORD *)buf = 134217984;
      v46 = v26;
      _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "%lu handles are eligible for invitation and not rate limited, checking how many are not invited", buf, 0xCu);
    }

  }
  -[IMOffGridModeInvitationManager offGridStateManager](self, "offGridStateManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_19E2C4090;
  v35[3] = &unk_1E3FB7830;
  v36 = v33;
  v37 = self;
  v38 = v32;
  v39 = v31;
  v28 = v32;
  v29 = v33;
  v30 = v31;
  objc_msgSend(v27, "invitedHandlesWithCompletion:", v35);

}

- (void)repairOffGridStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19E2C461C;
  v14[3] = &unk_1E3FB77E0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[IMOffGridModeInvitationManager _invitedHandlesContainHandleID:completion:](self, "_invitedHandlesContainHandleID:completion:", v12, v14);

}

- (void)_inviteHandleID:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0D34EA8];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithUnprefixedURI:", v11);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34EA8]), "initWithUnprefixedURI:", v10);

  -[IMOffGridModeInvitationManager offGridStateManager](self, "offGridStateManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_19E2C494C;
  v17[3] = &unk_1E3FB7808;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "inviteHandles:fromSenderHandle:withDictionaryPayload:completion:", v13, v14, MEMORY[0x1E0C9AA70], v17);

}

- (void)_invitedHandlesContainHandleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[IMOffGridModeInvitationManager offGridStateManager](self, "offGridStateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[IMOffGridModeInvitationManager offGridStateManager](self, "offGridStateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19E2C4C30;
    v14[3] = &unk_1E3FB7858;
    v16 = v7;
    v14[4] = self;
    v15 = v6;
    objc_msgSend(v10, "invitedHandlesWithCompletion:", v14);

    v11 = v16;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "invitedHandlesWithCompletion: not supported", v13, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMOffGridModeInvitationManagerErrorDomain"), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

- (id)_invitationCacheKeyForHandleID:(id)a3 fromHandleID:(id)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = &stru_1E3FBBA48;
  if (a3)
    v5 = (const __CFString *)a3;
  else
    v5 = &stru_1E3FBBA48;
  if (a4)
    v4 = (const __CFString *)a4;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;%@"), v5, v4);
}

- (BOOL)_isHandleIDEligibleToReceiveAutomaticInvitation:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[IMAppleStoreHelper isInAppleStoreDemoMode](IMAppleStoreHelper, "isInAppleStoreDemoMode"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Not automatically off grid mode while in Apple Store Demo mode.", (uint8_t *)&v11, 2u);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (MEMORY[0x1A1AE7CF8](v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Handle \"%@\" is a business ID, not eligible to receive off grid subscription invitation.", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_15;
    }
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if (MEMORY[0x1A1AE7D1C](v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Handle \"%@\" is a stewie ID, not eligible to receive off grid mode subscription invitation.", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchCNContactForHandleWithID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v9);
  if (!v5 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Handle \"%@\" is not in the users contacts, not eligible to receive off grid mode subscription invitation.", (uint8_t *)&v11, 0xCu);
    }

  }
LABEL_17:

  return v5;
}

- (BOOL)_isHandleAlreadyInvited:(id)a3 idsInvitedHandles:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unprefixedURI", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v5);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IMOffGridModeInvitationManager offGridStateManager](self, "offGridStateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E2C5128;
  v7[3] = &unk_1E3FB7880;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeAllInvitedHandlesWithCompletion:", v7);

}

- (void)setOffGridStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_offGridStateManager, a3);
}

- (NSCache)dateAttemptedInvitationByHandleCache
{
  return self->_dateAttemptedInvitationByHandleCache;
}

- (void)setDateAttemptedInvitationByHandleCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateAttemptedInvitationByHandleCache, a3);
}

- (OS_dispatch_queue)offGridBackgroundQueue
{
  return self->_offGridBackgroundQueue;
}

- (void)setOffGridBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_offGridBackgroundQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offGridBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_dateAttemptedInvitationByHandleCache, 0);
  objc_storeStrong((id *)&self->_offGridStateManager, 0);
}

@end
