@implementation IMHandleStatusObserverAssertion

- (IMHandleStatusObserverAssertion)initWithHandle:(id)a3
{
  id v4;
  IMHandleStatusObserverAssertion *v5;
  IMHandleStatusObserverAssertion *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMHandleStatusObserverAssertion;
  v5 = -[IMHandleStatusObserverAssertion init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_handle, v4);
    v6->_valid = 1;
  }

  return v6;
}

- (void)invalidate
{
  void *v3;

  +[IMHandleStatusManager sharedInstance](IMHandleStatusManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateObserver:", self);

  self->_valid = 0;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMHandleStatusObserverAssertion handle](self, "handle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Status observer for handle %@ is being deallocated", buf, 0xCu);

    }
  }
  if (self->_valid)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Observer being dealloced without having been invalidated, this is likely a bug", buf, 2u);
      }

    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("Observer was not invalidated before dealloc for a handle");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("IMHandleStatusObserverErrorDomain"), 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("IMHandleStatusObserver oversubscribed"), v9);

    +[IMHandleStatusManager sharedInstance](IMHandleStatusManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateObserver:", self);

  }
  v12.receiver = self;
  v12.super_class = (Class)IMHandleStatusObserverAssertion;
  -[IMHandleStatusObserverAssertion dealloc](&v12, sel_dealloc);
}

- (IMHandle)handle
{
  return (IMHandle *)objc_loadWeakRetained((id *)&self->_handle);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handle);
}

@end
