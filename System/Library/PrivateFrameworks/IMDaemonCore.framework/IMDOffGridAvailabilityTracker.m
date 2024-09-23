@implementation IMDOffGridAvailabilityTracker

+ (IMDOffGridAvailabilityTracker)sharedTracker
{
  if (qword_1EFC63F18 != -1)
    dispatch_once(&qword_1EFC63F18, &unk_1E922F188);
  return (IMDOffGridAvailabilityTracker *)(id)qword_1EFC63F10;
}

- (IMDOffGridAvailabilityTracker)init
{
  IMDOffGridAvailabilityTracker *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *trackedHandles;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDOffGridAvailabilityTracker;
  v2 = -[IMDOffGridAvailabilityTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedHandles = v2->_trackedHandles;
    v2->_trackedHandles = v3;

  }
  return v2;
}

- (void)startTrackingHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  IMDOffGridAvailabilityTrackerRecord *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[IMDOffGridAvailabilityTracker trackedHandles](self, "trackedHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v13 = 138412290;
          v14 = v5;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Tracking handle %@", (uint8_t *)&v13, 0xCu);
        }

      }
      v10 = objc_alloc_init(IMDOffGridAvailabilityTrackerRecord);
      -[IMDOffGridAvailabilityTrackerRecord setHandle:](v10, "setHandle:", v4);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 172800.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDOffGridAvailabilityTrackerRecord setExpirationDate:](v10, "setExpirationDate:", v11);

      -[IMDOffGridAvailabilityTracker trackedHandles](self, "trackedHandles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v5);

      -[IMDOffGridAvailabilityTracker _startTimer](self, "_startTimer");
    }
  }

}

- (void)stopTrackingHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[IMDOffGridAvailabilityTracker trackedHandles](self, "trackedHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "ID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v10;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Stopping tracking of handle %@", (uint8_t *)&v14, 0xCu);

        }
      }
      -[IMDOffGridAvailabilityTracker trackedHandles](self, "trackedHandles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v5);

      -[IMDOffGridAvailabilityTracker trackedHandles](self, "trackedHandles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count") == 0;

      if (v13)
        -[IMDOffGridAvailabilityTracker _clearTimer](self, "_clearTimer");
    }
  }

}

- (void)_startTimer
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[8];

  -[IMDOffGridAvailabilityTracker updateTimer](self, "updateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Starting timer", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v6 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1D15DDC30;
    v8[3] = &unk_1E92287C8;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, v8, 600.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDOffGridAvailabilityTracker setUpdateTimer:](self, "setUpdateTimer:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_clearTimer
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[IMDOffGridAvailabilityTracker updateTimer](self, "updateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Invalidating timer", v7, 2u);
      }

    }
    -[IMDOffGridAvailabilityTracker updateTimer](self, "updateTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[IMDOffGridAvailabilityTracker setUpdateTimer:](self, "setUpdateTimer:", 0);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[IMDOffGridAvailabilityTracker updateTimer](self, "updateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)IMDOffGridAvailabilityTracker;
  -[IMDOffGridAvailabilityTracker dealloc](&v4, sel_dealloc);
}

- (void)_updateTracker
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Updating off grid status tracking", v5, 2u);
    }

  }
  -[IMDOffGridAvailabilityTracker trackedHandles](self, "trackedHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &unk_1E922F1C8);

}

- (NSMutableDictionary)trackedHandles
{
  return self->_trackedHandles;
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_trackedHandles, 0);
}

@end
