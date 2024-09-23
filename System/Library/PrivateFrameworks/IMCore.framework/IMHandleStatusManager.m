@implementation IMHandleStatusManager

- (IMHandleStatusManager)init
{
  IMHandleStatusManager *v2;
  uint64_t v3;
  NSMapTable *observers;
  uint64_t v5;
  NSMapTable *handlesForObserver;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMHandleStatusManager;
  v2 = -[IMHandleStatusManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    handlesForObserver = v2->_handlesForObserver;
    v2->_handlesForObserver = (NSMapTable *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1ECF12538 != -1)
    dispatch_once(&qword_1ECF12538, &unk_1E471D918);
  return (id)qword_1ECF12558;
}

- (id)acquireObservationAssertionForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IMHandleStatusObserverAssertion *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "ID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Vending a new observer for handle %@", (uint8_t *)&v16, 0xCu);

    }
  }
  -[IMHandleStatusManager observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandleStatusManager observers](self, "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

    -[IMHandleStatusManager handlesForObserver](self, "handlesForObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v4, v13);

  }
  -[IMHandleStatusManager beginObservingStatusUpdatesForHandle:](self, "beginObservingStatusUpdatesForHandle:", v4);
  v14 = -[IMHandleStatusObserverAssertion initWithHandle:]([IMHandleStatusObserverAssertion alloc], "initWithHandle:", v4);
  objc_msgSend(v9, "addObject:", v14);

  return v14;
}

- (void)invalidateObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "handle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Invalidating observer for handle %@", (uint8_t *)&v16, 0xCu);

    }
  }
  -[IMHandleStatusManager observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "containsObject:", v4))
    {
      objc_msgSend(v11, "removeObject:", v4);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "handle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "ID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v11, "count");
          v16 = 138412546;
          v17 = v14;
          v18 = 2048;
          v19 = v15;
          _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Remaining observers for handle %@: %lu", (uint8_t *)&v16, 0x16u);

        }
      }
    }
  }
  -[IMHandleStatusManager adjustObservingStatusForHandles](self, "adjustObservingStatusForHandles");

}

- (void)adjustObservingStatusForHandles
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Checking whether to unsubscribe handles", buf, 2u);
    }

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[IMHandleStatusManager observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138412290;
    v19 = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        -[IMHandleStatusManager observers](self, "observers", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12 || !objc_msgSend(v12, "count"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v19;
              v25 = v10;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "No more observers for handle %@, ending observing status updates", buf, 0xCu);
            }

          }
          -[IMHandleStatusManager handlesForObserver](self, "handlesForObserver");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[IMHandleStatusManager endObservingStatusUpdatesForHandle:](self, "endObservingStatusUpdatesForHandle:", v15);
            -[IMHandleStatusManager observers](self, "observers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "removeObjectForKey:", v10);

            -[IMHandleStatusManager handlesForObserver](self, "handlesForObserver");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeObjectForKey:", v10);

          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v19;
              v25 = v10;
              _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "No IMHandle found for handle %@", buf, 0xCu);
            }

          }
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

}

- (void)beginObservingStatusUpdatesForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "ID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Status manager beginning observing for handle: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  -[IMHandleStatusManager beginObservingAvailabilityForHandle:](self, "beginObservingAvailabilityForHandle:", v4);
  -[IMHandleStatusManager beginObservingOffGridStateForHandle:](self, "beginObservingOffGridStateForHandle:", v4);

}

- (void)beginObservingAvailabilityForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, void *);
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  IMHandleStatusManager *v18;
  void (**v19)(void *, void *);
  _QWORD aBlock[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D396B8], "isInAppleStoreDemoMode"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Not beginnign observing availability in Apple Store Demo mode.", buf, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(v4, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Received request to begin observing availability for: %@", buf, 0xCu);
      }

    }
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A20E9480;
    aBlock[3] = &unk_1E4721EF0;
    v9 = v6;
    v21 = v9;
    v10 = (void (**)(void *, void *))_Block_copy(aBlock);
    +[IMHandleAvailabilityManager sharedInstance](IMHandleAvailabilityManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusSubscriptionForHandle:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v10[2](v10, v12);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "ID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v23 = v14;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing availability (yet).", buf, 0xCu);

        }
      }
      +[IMHandleAvailabilityManager sharedInstance](IMHandleAvailabilityManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = sub_1A20E9710;
      v16[3] = &unk_1E4721F18;
      v17 = v4;
      v18 = self;
      v19 = v10;
      objc_msgSend(v15, "fetchUpdatedStatusForHandle:completion:", v17, v16);

    }
  }

}

- (void)endObservingAvailabilityForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  IMHandleStatusManager *v18;
  void (**v19)(void *, void *);
  _QWORD aBlock[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D396B8], "isInAppleStoreDemoMode"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Not ending observing availability in Apple Store Demo mode.", buf, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(v4, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A20E9D00;
    aBlock[3] = &unk_1E4721EF0;
    v8 = v6;
    v21 = v8;
    v9 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Received request to end observing availability for: %@", buf, 0xCu);
      }

    }
    +[IMHandleAvailabilityManager sharedInstance](IMHandleAvailabilityManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusSubscriptionForHandle:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v9[2](v9, v12);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "ID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v23 = v14;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing availability (yet).", buf, 0xCu);

        }
      }
      +[IMHandleAvailabilityManager sharedInstance](IMHandleAvailabilityManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = sub_1A20E9F8C;
      v16[3] = &unk_1E4721F18;
      v17 = v4;
      v18 = self;
      v19 = v9;
      objc_msgSend(v15, "fetchUpdatedStatusForHandle:completion:", v17, v16);

    }
  }

}

- (void)beginObservingOffGridStateForHandle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void (**v11)(void *, void *);
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  IMHandleStatusManager *v19;
  void (**v20)(void *, void *);
  _QWORD aBlock[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    objc_msgSend(v4, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Received request to begin observing offgrid status for: %@", buf, 0xCu);
      }

    }
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A20EA528;
    aBlock[3] = &unk_1E4721EF0;
    v10 = v7;
    v22 = v10;
    v11 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0D39878], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cachedStatusSubscriptionForHandle:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v11[2](v11, v13);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "ID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing offgrid status (yet).", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0D39878], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = sub_1A20EA7B8;
      v17[3] = &unk_1E4721F18;
      v18 = v4;
      v19 = self;
      v20 = v11;
      objc_msgSend(v16, "fetchUpdatedStatusForHandle:completion:", v18, v17);

    }
  }

}

- (void)endObservingOffGridStateForHandle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void (**v11)(void *, void *);
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  IMHandleStatusManager *v19;
  void (**v20)(void *, void *);
  _QWORD aBlock[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    objc_msgSend(v4, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Received request to end observing offgrid status for: %@", buf, 0xCu);
      }

    }
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A20EAD54;
    aBlock[3] = &unk_1E4721EF0;
    v10 = v7;
    v22 = v10;
    v11 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0D39878], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cachedStatusSubscriptionForHandle:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v11[2](v11, v13);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "ID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing offgrid status (yet).", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0D39878], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = sub_1A20EAFE0;
      v17[3] = &unk_1E4721F18;
      v18 = v4;
      v19 = self;
      v20 = v11;
      objc_msgSend(v16, "fetchUpdatedStatusForHandle:completion:", v18, v17);

    }
  }

}

- (void)endObservingStatusUpdatesForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "ID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Status manager ending observing for handle: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  -[IMHandleStatusManager endObservingAvailabilityForHandle:](self, "endObservingAvailabilityForHandle:", v4);
  -[IMHandleStatusManager endObservingOffGridStateForHandle:](self, "endObservingOffGridStateForHandle:", v4);

}

- (NSMapTable)observers
{
  return self->_observers;
}

- (NSMapTable)handlesForObserver
{
  return self->_handlesForObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlesForObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
