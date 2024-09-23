@implementation IMSuggestionsService

- (id)suggestedNameFromCache:(id)a3 wasFound:(BOOL *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;

  v6 = a3;
  if (!v6)
  {
    v8 = 0;
    v10 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_9;
  }
  -[NSCache objectForKey:](self->_cache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v7 == v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  if (a4)
LABEL_9:
    *a4 = v8;
LABEL_10:

  return v10;
}

- (void)scheduleFetchIfNecessaryForHandle:(id)a3
{
  _QWORD block[5];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A200BBC0;
  block[3] = &unk_1E471EA98;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (IMSuggestionsService)init
{
  IMSuggestionsService *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (*v9)(void *);
  NSObject *v10;
  void *v11;
  SGSuggestionsServiceContactsProtocol *connection;
  uint64_t v13;
  NSCache *cache;
  NSObject *v15;
  objc_class *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  NSMutableDictionary *pending;
  uint64_t v22;
  NSHashTable *handlesToRetry;
  SGSuggestionsServiceContactsProtocol *v24;
  IMSuggestionsService *v25;
  uint64_t v26;
  id newContactNotificationToken;
  _QWORD v29[4];
  IMSuggestionsService *v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)IMSuggestionsService;
  v2 = -[IMSuggestionsService init](&v31, sel_init);
  if (v2)
  {
    if (qword_1EE65F2E0 != -1)
      dispatch_once(&qword_1EE65F2E0, &unk_1E471BBE0);
    v3 = (void *)qword_1EE65F2E8;
    if (!qword_1EE65F2E8)
    {
      v32 = xmmword_1E471EC88;
      v33 = *(_OWORD *)off_1E471EC98;
      v34 = 32;
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = IMFileLocationTrimFileName();
      v6 = v34;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4725068);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("suggestionsServiceClass"), "NSObject<SGSuggestionsServiceContactsProtocol> *_IMDSuggestionsNewConnection(void)", v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void (*)(void *))IMGetAssertionFailureHandler();
      if (v9)
      {
        v9(v8);
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v8;
          _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
        }

      }
      v3 = (void *)qword_1EE65F2E8;
    }
    objc_msgSend(v3, "serviceForContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setQueuesRequestsIfBusy:", 1);
    connection = v2->_connection;
    v2->_connection = (SGSuggestionsServiceContactsProtocol *)v11;

    v13 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v13;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), v15);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v18;

    v20 = objc_opt_new();
    pending = v2->_pending;
    v2->_pending = (NSMutableDictionary *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    handlesToRetry = v2->_handlesToRetry;
    v2->_handlesToRetry = (NSHashTable *)v22;

    v24 = v2->_connection;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1A2047244;
    v29[3] = &unk_1E471EBA8;
    v25 = v2;
    v30 = v25;
    -[SGSuggestionsServiceContactsProtocol registerContactsChangeObserver:](v24, "registerContactsChangeObserver:", v29);
    v26 = objc_claimAutoreleasedReturnValue();
    newContactNotificationToken = v25->_newContactNotificationToken;
    v25->_newContactNotificationToken = (id)v26;

  }
  return v2;
}

- (void)fetchSuggestedRealNameForDisplayName:(id)a3 messageUID:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *queue;
  _QWORD v17[5];
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD block[4];
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13 && self->_connection)
  {
    if (v10
      && (-[IMSuggestionsService _maybePhoneNumber:](self, "_maybePhoneNumber:", v10)
       || -[IMSuggestionsService _maybeEmailAddress:](self, "_maybeEmailAddress:", v10)
       || -[IMSuggestionsService isBusiness:](self, "isBusiness:", v10)))
    {
      -[NSCache objectForKey:](self->_cache, "objectForKey:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1A2047598;
        block[3] = &unk_1E471E8B8;
        v24 = v13;
        v23 = v14;
        dispatch_async(v12, block);

        v15 = v24;
      }
      else
      {
        queue = self->_queue;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = sub_1A200B130;
        v17[3] = &unk_1E471EBD0;
        v17[4] = self;
        v18 = v10;
        v19 = v12;
        v21 = v13;
        v20 = v11;
        dispatch_async(queue, v17);

        v15 = v18;
      }

LABEL_15:
      goto LABEL_16;
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1A2047588;
    v25[3] = &unk_1E471E528;
    v26 = v13;
    dispatch_async(v12, v25);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Unexpectedly nil parameter in fetchSuggestedRealNameForDisplayName", buf, 2u);
    }
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_startRequestForDisplayNameCallbackWithSuggestedName:(id)a3 displayName:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A200B038;
  v15[3] = &unk_1E471E868;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)_startRequestForDisplayName:(id)a3 messageUID:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  SGSuggestionsServiceContactsProtocol *connection;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  IMSuggestionsService *v15;
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    connection = self->_connection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1A200B848;
    v13[3] = &unk_1E471EBF8;
    v14 = v8;
    v15 = self;
    v16 = v10;
    -[SGSuggestionsServiceContactsProtocol namesForDetail:limitTo:prependMaybe:withCompletion:](connection, "namesForDetail:limitTo:prependMaybe:withCompletion:", v14, 1, 1, v13);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "displayName paramater was unexpectedly nil in _startRequestForDisplayName", buf, 2u);
    }

  }
}

- (BOOL)_maybePhoneNumber:(id)a3
{
  JUMPOUT(0x1A858280CLL);
}

+ (id)sharedInstance
{
  if (qword_1ECF12510 != -1)
    dispatch_once(&qword_1ECF12510, &unk_1E471D518);
  return (id)qword_1EE65F350;
}

- (void)dealloc
{
  objc_super v3;

  -[SGSuggestionsServiceContactsProtocol deregisterContactsChangeObserverWithToken:](self->_connection, "deregisterContactsChangeObserverWithToken:", self->_newContactNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)IMSuggestionsService;
  -[IMSuggestionsService dealloc](&v3, sel_dealloc);
}

- (id)serviceConnection
{
  return self->_connection;
}

- (BOOL)_maybeEmailAddress:(id)a3
{
  return IMStringIsEmail();
}

- (BOOL)isBusiness:(id)a3
{
  JUMPOUT(0x1A85827F4);
}

- (void)startUsingLocalLookupsWithTable:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A20474C0;
  block[3] = &unk_1E471E7C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)stopUsingLocalLookups
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A2047554;
  block[3] = &unk_1E471E348;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)_contactForSGContactMatch:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &unk_1E471B9E0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactFromSuggestion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchCNContactForSuggestedHandle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    v12 = 0;
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Fetching a suggested CNContact for displayName %@", buf, 0xCu);
    }

  }
  v7 = -[IMSuggestionsService _maybePhoneNumber:](self, "_maybePhoneNumber:", v5);
  v8 = -[IMSuggestionsService _maybeEmailAddress:](self, "_maybeEmailAddress:", v5);
  if (v7)
  {
    -[IMSuggestionsService serviceConnection](self, "serviceConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v9, "contactMatchesByPhoneNumber:error:", v5, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)&v18;
  }
  else
  {
    if (!v8)
    {
      v13 = 0;
      v10 = 0;
      goto LABEL_14;
    }
    -[IMSuggestionsService serviceConnection](self, "serviceConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v9, "contactMatchesByEmailAddress:error:", v5, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)&v17;
  }
  v13 = *v11;

LABEL_14:
  if (objc_msgSend(v10, "count"))
  {
    -[IMSuggestionsService _contactForSGContactMatch:](self, "_contactForSGContactMatch:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Found suggested contact %@ with error", buf, 0xCu);
    }

  }
  v12 = v14;

LABEL_22:
  return v12;
}

- (id)personNameComponentsForHandle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a3, "displayID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSuggestionsService fetchCNContactForSuggestedHandle:](self, "fetchCNContactForSuggestedHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D397A8], "firstNameForCNContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397A8], "lastNameForCNContact:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setGivenName:", v6);
  if (v7)
    objc_msgSend(v9, "setFamilyName:", v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_newContactNotificationToken, 0);
  objc_storeStrong((id *)&self->_handlesToRetry, 0);
  objc_storeStrong((id *)&self->_localTable, 0);
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
