@implementation IMReachability

+ (id)reachabilityWithHostName:(id)a3
{
  id v3;
  IMReachability *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [IMReachability alloc];
  v6 = (void *)objc_msgSend_initWithRemoteHost_delegate_(v4, v5, (uint64_t)v3, 0);

  return v6;
}

+ (id)reachabilityWithRemoteAddress:(id)a3
{
  id v3;
  IMReachability *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [IMReachability alloc];
  v6 = (void *)objc_msgSend_initWithLocalSocketAddress_remoteSocketAddress_delegate_(v4, v5, 0, (uint64_t)v3, 0);

  return v6;
}

+ (id)reachabilityWithLocalAddress:(id)a3 remoteAddress:(id)a4
{
  id v5;
  id v6;
  IMReachability *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = [IMReachability alloc];
  v9 = (void *)objc_msgSend_initWithLocalSocketAddress_remoteSocketAddress_delegate_(v7, v8, (uint64_t)v6, (uint64_t)v5, 0);

  return v9;
}

- (id)_initWithReachabilityRef:(__SCNetworkReachability *)a3 description:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *queue;
  NSObject *v22;
  _QWORD block[4];
  IMReachability *v25;
  __SCNetworkReachability *v26;
  SCNetworkReachabilityContext context;
  objc_super v28;

  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v28.receiver = self;
    v28.super_class = (Class)IMReachability;
    self = -[IMReachability init](&v28, sel_init);
    if (self)
    {
      if (v9)
      {
        context.version = 0;
        context.info = (void *)objc_msgSend_weakRefWithObject_(MEMORY[0x1E0D13238], v10, (uint64_t)self, v11);
        context.retain = j__CFRetain;
        context.release = j__CFRelease;
        context.copyDescription = 0;
        if (SCNetworkReachabilitySetCallback(a3, (SCNetworkReachabilityCallBack)sub_190697284, &context))
        {
          dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("com.apple.IMReachability.%p"), v14, self);
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v19 = (const char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
          v20 = (OS_dispatch_queue *)dispatch_queue_create(v19, v12);
          queue = self->_queue;
          self->_queue = v20;

        }
        if (!SCNetworkReachabilitySetDispatchQueue(a3, (dispatch_queue_t)self->_queue))
        {
          SCNetworkReachabilitySetCallback(a3, 0, 0);
          a3 = 0;
          goto LABEL_9;
        }
      }
      self->_reachabilityRef = (void *)CFRetain(a3);
      objc_storeWeak((id *)&self->_delegate, v9);
      im_primary_queue();
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19069731C;
      block[3] = &unk_1E2C44088;
      v25 = self;
      v26 = a3;
      dispatch_async(v22, block);

    }
    self = self;
    a3 = (__SCNetworkReachability *)self;
  }
LABEL_9:

  return a3;
}

- (IMReachability)initWithRemoteHost:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  SCNetworkReachabilityRef v13;
  const char *v14;
  void *v15;
  IMReachability *v16;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v8 = v6;
  v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  v13 = SCNetworkReachabilityCreateWithName(0, v12);
  v15 = (void *)objc_msgSend__initWithReachabilityRef_description_delegate_(self, v14, (uint64_t)v13, (uint64_t)v8, v7);

  v16 = v15;
  if (v13)
    CFRelease(v13);

  return v16;
}

- (IMReachability)initWithLocalSocketAddress:(id)a3 remoteSocketAddress:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const sockaddr *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const sockaddr *v28;
  SCNetworkReachabilityRef v29;
  const char *v30;
  SCNetworkReachabilityRef v31;
  IMReachability *v32;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = (const __CFString *)IMStringForSocketAddress(v8);
    if (v9)
    {
LABEL_3:
      v12 = (const __CFString *)IMStringForSocketAddress(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
LABEL_6:
  if (!v11)
    v11 = CFSTR("*");
  if (v12)
    v13 = v12;
  else
    v13 = CFSTR("*");
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17 = (void *)objc_msgSend_initWithFormat_(v14, v15, (uint64_t)CFSTR("%@ -> %@"), v16, v11, v13);
  v34 = xmmword_1906BC860;
  v18 = objc_retainAutorelease(v8);
  v22 = objc_msgSend_bytes(v18, v19, v20, v21);
  if (v22)
    v23 = (const sockaddr *)v22;
  else
    v23 = (const sockaddr *)&v34;
  if (v9)
  {
    v24 = objc_retainAutorelease(v9);
    v28 = (const sockaddr *)objc_msgSend_bytes(v24, v25, v26, v27);
    v29 = SCNetworkReachabilityCreateWithAddressPair(0, v23, v28);
  }
  else
  {
    v29 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v23);
  }
  v31 = v29;
  v32 = (IMReachability *)(id)objc_msgSend__initWithReachabilityRef_description_delegate_(self, v30, (uint64_t)v29, (uint64_t)v17, v10);
  if (v31)
    CFRelease(v31);

  return v32;
}

- (void)dealloc
{
  const __SCNetworkReachability *reachabilityRef;
  void *v4;
  objc_super v5;

  reachabilityRef = (const __SCNetworkReachability *)self->_reachabilityRef;
  if (reachabilityRef)
  {
    SCNetworkReachabilitySetDispatchQueue(reachabilityRef, 0);
    v4 = self->_reachabilityRef;
    if (v4)
    {
      CFRelease(v4);
      self->_reachabilityRef = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)IMReachability;
  -[IMReachability dealloc](&v5, sel_dealloc);
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<IMReachability:%p> (%@)"), v2, self, self->_description);
}

- (void)_handleCallbackForSCNetworkReachability:(__SCNetworkReachability *)a3
{
  unint64_t v5;
  NSObject *v6;
  int v7;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  SCNetworkReachabilityFlags flags[2];
  uint8_t buf[4];
  IMReachability *v18;
  __int16 v19;
  _BYTE v20[20];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)flags = 0xAAAAAAAAAAAAAAAALL;
  if (SCNetworkReachabilityGetFlags(a3, flags))
  {
    v5 = self->_flags;
    if (v5 == *(_QWORD *)flags)
    {
      OSLogHandleForIDSCategory("IMReachability");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->_flags;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 138412802;
        v18 = self;
        v19 = 1024;
        *(_DWORD *)v20 = v7;
        *(_WORD *)&v20[4] = 2112;
        *(_QWORD *)&v20[6] = WeakRetained;
        _os_log_impl(&dword_19066D000, v6, OS_LOG_TYPE_DEFAULT, "%@: reachability flags did not change %08x  (Delegate: %@)", buf, 0x1Cu);

      }
    }
    else
    {
      self->_flags = *(_QWORD *)flags;
      OSLogHandleForIDSCategory("IMReachability");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_flags;
        v12 = objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 138413058;
        v18 = self;
        v19 = 1024;
        *(_DWORD *)v20 = v5;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v11;
        *(_WORD *)&v20[10] = 2112;
        *(_QWORD *)&v20[12] = v12;
        _os_log_impl(&dword_19066D000, v10, OS_LOG_TYPE_DEFAULT, "%@: reachabilityDidChange %08x -> %08x  (Delegate: %@)", buf, 0x22u);

      }
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_reachabilityDidChange_(v13, v14, (uint64_t)self, v15);

    }
  }
  else
  {
    OSLogHandleForIDSCategory("IMReachability");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      v19 = 2048;
      *(_QWORD *)v20 = a3;
      _os_log_impl(&dword_19066D000, v9, OS_LOG_TYPE_DEFAULT, "%@: Failed to get flags for reachability: %p", buf, 0x16u);
    }

  }
}

- (void)_forceGetFlagsIfNecessary
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  int v6;
  IMReachability *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_gettingFlags && !self->_flags && self->_reachabilityRef)
  {
    self->_gettingFlags = 1;
    OSLogHandleForIDSCategory("IMReachability");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "%@: Forcing reachability query", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend__handleCallbackForSCNetworkReachability_(self, v4, (uint64_t)self->_reachabilityRef, v5);
    self->_gettingFlags = 0;
  }
}

- (unint64_t)flags
{
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
    objc_msgSend__forceGetFlagsIfNecessary(self, v4, v5, v6);
  return self->_flags;
}

- (BOOL)connectionRequired
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__forceGetFlagsIfNecessary(self, a2, v2, v3);
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (IMReachabilityDelegate)delegate
{
  return (IMReachabilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)gettingFlags
{
  return self->_gettingFlags;
}

- (void)setGettingFlags:(BOOL)a3
{
  self->_gettingFlags = a3;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)reachabilityDescription
{
  return self->_description;
}

- (void)setReachabilityDescription:(id)a3
{
  objc_storeStrong((id *)&self->_description, a3);
}

- (void)reachabilityRef
{
  return self->_reachabilityRef;
}

- (void)setReachabilityRef:(void *)a3
{
  self->_reachabilityRef = a3;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

- (void)set_queue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
