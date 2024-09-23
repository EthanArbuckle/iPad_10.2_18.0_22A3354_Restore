@implementation NSNetServiceBrowser

- (NSNetServiceBrowser)init
{
  NSNetServiceBrowser *v2;
  CFNetServiceBrowserRef v3;
  CFRunLoopRef Current;
  __CFRunLoop *v5;
  __CFNetServiceBrowser *v6;
  id netServiceBrowser;
  CFNetServiceClientContext clientContext;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSNetServiceBrowser;
  v2 = -[NSNetServiceBrowser init](&v10, sel_init);
  if (!v2)
    goto LABEL_8;
  clientContext.version = 0;
  clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], v2);
  clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E0C98BD0];
  clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E0C98BC0];
  clientContext.copyDescription = 0;
  v3 = CFNetServiceBrowserCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFNetServiceBrowserClientCallBack)_netServiceBrowserDispatchCallBack, &clientContext);
  v2->_netServiceBrowser = v3;
  if (!v3)
  {
    netServiceBrowser = 0;
    v2->_reserved = 0;
LABEL_7:

    v2->_netServiceBrowser = 0;
LABEL_8:

    return 0;
  }
  Current = CFRunLoopGetCurrent();
  if (!Current)
  {
    v2->_reserved = 0;
    netServiceBrowser = v2->_netServiceBrowser;
    goto LABEL_7;
  }
  v5 = Current;
  v6 = -[NSNetServiceBrowser _internalNetServiceBrowser](v2, "_internalNetServiceBrowser");
  CFNetServiceBrowserScheduleWithRunLoop(v6, v5, (CFStringRef)*MEMORY[0x1E0C9B270]);
  v2->_reserved = 0;
  return v2;
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak(&self->_delegate, delegate);
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  __CFRunLoop *v6;

  v6 = -[NSRunLoop getCFRunLoop](aRunLoop, "getCFRunLoop");
  if (v6)
    CFNetServiceBrowserScheduleWithRunLoop(-[NSNetServiceBrowser _internalNetServiceBrowser](self, "_internalNetServiceBrowser"), v6, (CFStringRef)mode);
}

- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  __CFRunLoop *v6;

  v6 = -[NSRunLoop getCFRunLoop](aRunLoop, "getCFRunLoop");
  if (v6)
    CFNetServiceBrowserUnscheduleFromRunLoop(-[NSNetServiceBrowser _internalNetServiceBrowser](self, "_internalNetServiceBrowser"), v6, (CFStringRef)mode);
}

- (void)searchForBrowsableDomains
{
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  CFStreamError error;

  if (self->_netServiceBrowser)
  {
    error.domain = 0;
    *(_QWORD *)&error.error = 0;
    v3 = CFNetServiceBrowserSearchForDomains(-[NSNetServiceBrowser _internalNetServiceBrowser](self, "_internalNetServiceBrowser"), 0, &error);
    v4 = -[NSNetServiceBrowser delegate](self, "delegate");
    if (v3)
    {
      if (v4)
      {
        -[NSNetServiceBrowser delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowserWillSearch:", self);
      }
    }
    else if (v4)
    {
      -[NSNetServiceBrowser delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v5 = (void *)MEMORY[0x1E0C99D80];
        v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", error.error);
        objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didNotSearch:", self, objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", error.domain), CFSTR("NSNetServicesErrorDomain"), 0));
      }
    }
  }
}

- (void)searchForRegistrationDomains
{
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  CFStreamError error;

  if (self->_netServiceBrowser)
  {
    error.domain = 0;
    *(_QWORD *)&error.error = 0;
    v3 = CFNetServiceBrowserSearchForDomains(-[NSNetServiceBrowser _internalNetServiceBrowser](self, "_internalNetServiceBrowser"), 1u, &error);
    v4 = -[NSNetServiceBrowser delegate](self, "delegate");
    if (v3)
    {
      if (v4)
      {
        -[NSNetServiceBrowser delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowserWillSearch:", self);
      }
    }
    else if (v4)
    {
      -[NSNetServiceBrowser delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v5 = (void *)MEMORY[0x1E0C99D80];
        v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", error.error);
        objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didNotSearch:", self, objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", error.domain), CFSTR("NSNetServicesErrorDomain"), 0));
      }
    }
  }
}

- (void)_setIncludesAWDL:(BOOL)a3
{
  objc_setAssociatedObject(self, "kNSNetServiceBrowserIncludesAWDLKey", (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), (void *)0x301);
}

- (void)searchForServicesOfType:(NSString *)type inDomain:(NSString *)domainString
{
  uint64_t AssociatedObject;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef cf;

  if (self->_netServiceBrowser)
  {
    cf = 0;
    if (-[NSNetServiceBrowser includesPeerToPeer](self, "includesPeerToPeer"))
    {
      AssociatedObject = 1;
    }
    else
    {
      AssociatedObject = (uint64_t)objc_getAssociatedObject(self, "kNSNetServiceBrowserIncludesAWDLKey");
      if (AssociatedObject)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend((id)AssociatedObject, "BOOLValue"))
            AssociatedObject = 2;
          else
            AssociatedObject = 0;
        }
        else
        {
          AssociatedObject = 0;
        }
      }
    }
    v8 = _CFNetServiceBrowserSearchForServices((char *)-[NSNetServiceBrowser _internalNetServiceBrowser](self, "_internalNetServiceBrowser"), (uint64_t)domainString, (uint64_t)type, AssociatedObject, (CFErrorRef *)&cf);
    v9 = -[NSNetServiceBrowser delegate](self, "delegate");
    if (v8)
    {
      if (v9)
      {
        -[NSNetServiceBrowser delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowserWillSearch:", self);
      }
    }
    else
    {
      if (v9)
      {
        -[NSNetServiceBrowser delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = _CFStreamErrorFromCFError((__CFError *)cf);
          v11 = (void *)MEMORY[0x1E0C99D80];
          v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
          objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didNotSearch:", self, objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v13, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v10), CFSTR("NSNetServicesErrorDomain"), 0));
        }
      }
      CFRelease(cf);
    }
  }
}

- (void)stop
{
  CFNetServiceBrowserStopSearch(-[NSNetServiceBrowser _internalNetServiceBrowser](self, "_internalNetServiceBrowser"), 0);
}

- (__CFNetServiceBrowser)_internalNetServiceBrowser
{
  return (__CFNetServiceBrowser *)self->_netServiceBrowser;
}

- (void)_dispatchCallBack:(void *)a3 flags:(unint64_t)a4 error:(id)a5
{
  uint64_t v5;
  int64_t var0;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(_QWORD *)&a5.var1;
  var0 = a5.var0;
  v9 = (void *)MEMORY[0x186DB8C8C](self, a2);
  if ((_DWORD)v5 == -72005)
  {
    if (-[NSNetServiceBrowser delegate](self, "delegate"))
    {
      -[NSNetServiceBrowser delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowserDidStopSearch:", self);
    }
  }
  else
  {
    if (!(_DWORD)v5)
      __asm { BR              X10 }
    if (-[NSNetServiceBrowser delegate](self, "delegate"))
    {
      -[NSNetServiceBrowser delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
        objc_msgSend(-[NSNetServiceBrowser delegate](self, "delegate"), "netServiceBrowser:didNotSearch:", self, objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", var0), CFSTR("NSNetServicesErrorDomain"), 0));
      }
    }
  }
  objc_autoreleasePoolPop(v9);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_netServiceBrowser)
  {
    CFNetServiceBrowserInvalidate(-[NSNetServiceBrowser _internalNetServiceBrowser](self, "_internalNetServiceBrowser"));

  }
  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSNetServiceBrowser;
  -[NSNetServiceBrowser dealloc](&v3, sel_dealloc);
}

- (BOOL)includesPeerToPeer
{
  return self->_includesPeerToPeer;
}

- (void)setIncludesPeerToPeer:(BOOL)includesPeerToPeer
{
  self->_includesPeerToPeer = includesPeerToPeer;
}

@end
