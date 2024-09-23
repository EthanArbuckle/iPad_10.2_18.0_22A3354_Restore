@implementation IMDCollaborationNoticeRateLimiter

- (IMDCollaborationNoticeRateLimiter)init
{
  IMDCollaborationNoticeRateLimiter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *persistenceQueue;
  uint64_t v5;
  NSMutableDictionary *noticeEventHistory;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMDCollaborationNoticeRateLimiter;
  v2 = -[IMDCollaborationNoticeRateLimiter init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("IMDCollaborationNoticeRateLimiter.persistenceQueue", 0);
    persistenceQueue = v2->_persistenceQueue;
    v2->_persistenceQueue = (OS_dispatch_queue *)v3;

    +[IMDCollaborationNoticeRateLimiter loadNoticeEventHistory](IMDCollaborationNoticeRateLimiter, "loadNoticeEventHistory");
    v5 = objc_claimAutoreleasedReturnValue();
    noticeEventHistory = v2->_noticeEventHistory;
    v2->_noticeEventHistory = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (BOOL)shouldSendNotice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int64_t v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[IMDCollaborationNoticeDispatcher unarchiveNoticeTransmissionEvent:](IMDCollaborationNoticeDispatcher, "unarchiveNoticeTransmissionEvent:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject highlightURL](v5, "highlightURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      IMLogHandleForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1D166BC04();

      v10 = 0;
      goto LABEL_33;
    }
    v8 = IMGetDomainBoolForKeyWithDefaultValue();
    if ((_DWORD)v8)
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "RateLimiter: Overriden by kRateLimiterOverride, approved to send.", buf, 2u);
        }

      }
    }
    else
    {
      -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        +[IMDCollaborationNoticeTypeGenerator sharedGenerator](IMDCollaborationNoticeTypeGenerator, "sharedGenerator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "typeForHighlightEvent:", v5);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringValue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v37);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "components:fromDate:toDate:options:", 64, v19, v36, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = -[IMDCollaborationNoticeRateLimiter thresholdForNoticeType:](self, "thresholdForNoticeType:", v15);
          v24 = objc_msgSend(v22, "minute");
          v10 = v24 >= v23;
          if (IMOSLoggingEnabled(v24))
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              if (v24 < v23)
                v26 = CFSTR("NO");
              else
                v26 = CFSTR("YES");
              v35 = v22;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "minute", v26));
              v27 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
              *(_DWORD *)buf = 138413058;
              v39 = v33;
              v40 = 2112;
              v41 = v37;
              v42 = 2112;
              v43 = v27;
              v44 = 2112;
              v45 = objc_claimAutoreleasedReturnValue();
              v34 = (void *)v27;
              v28 = (void *)v45;
              _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "RateLimiter: result=%@ for noticeType: %@, elapsedMinutes: %@ < threshold: %@", buf, 0x2Au);

              v22 = v35;
            }

          }
          if (v24 < v23)
          {
            -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", v7);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v36, CFSTR("lastUpdated"));

          }
        }
        else
        {
          if (IMOSLoggingEnabled(v20))
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v37;
              _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "RateLimiter: noticeType (%@) hasn't been sent before, approved to send.", buf, 0xCu);
            }

          }
          v10 = 1;
        }

        goto LABEL_33;
      }
    }
    v10 = 1;
LABEL_33:

    goto LABEL_34;
  }
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1D166BB94();
  v10 = 0;
LABEL_34:

  return v10;
}

- (void)didSendNotice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[IMDCollaborationNoticeDispatcher unarchiveNoticeTransmissionEvent:](IMDCollaborationNoticeDispatcher, "unarchiveNoticeTransmissionEvent:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject highlightURL](v5, "highlightURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[IMDCollaborationNoticeTypeGenerator sharedGenerator](IMDCollaborationNoticeTypeGenerator, "sharedGenerator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "typeForHighlightEvent:", v5);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringValue");
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v23 = 136315906;
          v24 = "-[IMDCollaborationNoticeRateLimiter didSendNotice:]";
          v25 = 2112;
          v26 = v7;
          v27 = 2112;
          v28 = v11;
          v29 = 2112;
          v30 = v12;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "%s url: %@, noticeType: %@ => %@", (uint8_t *)&v23, 0x2Au);
        }

      }
      -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v7);

      }
      -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, CFSTR("lastUpdated"));

      -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, v11);

      -[IMDCollaborationNoticeRateLimiter saveNoticeEventHistory](self, "saveNoticeEventHistory");
    }
    else
    {
      IMLogHandleForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1D166BCE4();
    }

  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D166BC74();
  }

}

- (id)dateLastUpdatedForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IMDCollaborationNoticeRateLimiter noticeEventHistory](self, "noticeEventHistory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastUpdated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)thresholdForNoticeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) < 2)
    return MEMORY[0x1E0DE7D20](IMDCollaborationNoticeRateLimiter, sel_participantChangeThreshold);
  if ((unint64_t)(a3 - 2) > 1)
    return MEMORY[0x1E0DE7D20](IMDCollaborationNoticeRateLimiter, sel_defaultThreshold);
  return MEMORY[0x1E0DE7D20](IMDCollaborationNoticeRateLimiter, sel_commentThreshold);
}

+ (int64_t)defaultThreshold
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (int64_t)commentThreshold
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (int64_t)participantChangeThreshold
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (id)peristencePath
{
  if (qword_1ED936290 != -1)
    dispatch_once(&qword_1ED936290, &unk_1E922D8E8);
  return (id)qword_1ED936298;
}

+ (id)loadNoticeEventHistory
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCollaborationNoticeRateLimiter peristencePath](IMDCollaborationNoticeRateLimiter, "peristencePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((v4 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    +[IMDCollaborationNoticeRateLimiter peristencePath](IMDCollaborationNoticeRateLimiter, "peristencePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:", v8);
    v10 = IMOSLoggingEnabled(v9);
    if (v9)
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v19 = 138412290;
          v20 = v9;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Loaded noticeEventHistory: %@", (uint8_t *)&v19, 0xCu);
        }

      }
      v12 = v9;
    }
    else
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Loaded empty dictionary, creating a new dictionary.", (uint8_t *)&v19, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v12;

    return v18;
  }
  else
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Creating rateLimiter persistence.", (uint8_t *)&v19, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDCollaborationNoticeRateLimiter peristencePath](IMDCollaborationNoticeRateLimiter, "peristencePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createFileAtPath:contents:attributes:", v15, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)saveNoticeEventHistory
{
  NSObject *persistenceQueue;
  _QWORD block[5];

  persistenceQueue = self->_persistenceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D156F7B8;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_sync(persistenceQueue, block);
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (void)setPersistenceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceQueue, a3);
}

- (NSMutableDictionary)noticeEventHistory
{
  return self->_noticeEventHistory;
}

- (void)setNoticeEventHistory:(id)a3
{
  objc_storeStrong((id *)&self->_noticeEventHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noticeEventHistory, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
}

@end
