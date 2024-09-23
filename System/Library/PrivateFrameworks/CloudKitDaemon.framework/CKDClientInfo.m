@implementation CKDClientInfo

- (NSString)hostname
{
  CKDClientInfo *v2;
  const char *v3;
  uint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cachedHostname)
    objc_msgSend__refreshHostname(v2, v3, v4);
  objc_sync_exit(v2);

  return v2->_cachedHostname;
}

+ (id)sharedClientInfo
{
  if (qword_1ED702830 != -1)
    dispatch_once(&qword_1ED702830, &unk_1E7833088);
  return (id)qword_1ED702828;
}

- (CKDClientInfo)init
{
  uint64_t v2;
  void *v5;
  objc_class *v6;
  void *v7;
  const char *v8;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v8, (uint64_t)a2, self, CFSTR("CKDClientInfo.m"), 55, CFSTR("Use +[%@ sharedClientInfo]"), v7);

  return 0;
}

- (id)initInternal
{
  CKDClientInfo *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *hostCallbackQueue;
  const char *v7;
  id v9;
  id location;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CKDClientInfo;
  v2 = -[CKDClientInfo init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.cloudkit.clientinfo.callback", v4);
    hostCallbackQueue = v2->_hostCallbackQueue;
    v2->_hostCallbackQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v12[0] = CFSTR("UserAssignedDeviceName");
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v12, 1);
    objc_copyWeak(&v9, &location);
    v2->_hostNotificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  MGCancelNotifications();
  v3.receiver = self;
  v3.super_class = (Class)CKDClientInfo;
  -[CKDClientInfo dealloc](&v3, sel_dealloc);
}

- (void)_refreshHostname
{
  CKDClientInfo *v3;
  uint64_t v4;
  NSString *cachedHostname;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSString *v12;

  objc_msgSend_willChangeValueForKey_(self, a2, (uint64_t)CFSTR("hostname"));
  v3 = self;
  objc_sync_enter(v3);
  v4 = MGCopyAnswer();
  cachedHostname = v3->_cachedHostname;
  v3->_cachedHostname = (NSString *)v4;

  if ((unint64_t)objc_msgSend_maximumLengthOfBytesUsingEncoding_(v3->_cachedHostname, v6, 4) >= 0x3E9)
  {
    v7 = 10;
    v9 = (void *)MEMORY[0x1C3B83E24]();
    while ((unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v3->_cachedHostname, v8, 4) >= 0x3E9)
    {
      objc_msgSend_substringToIndex_(v3->_cachedHostname, v10, 1010 - v7);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v3->_cachedHostname;
      v3->_cachedHostname = (NSString *)v11;

      v7 *= 2;
    }
    objc_autoreleasePoolPop(v9);
  }
  objc_sync_exit(v3);

  MEMORY[0x1E0DE7D20](v3, sel_didChangeValueForKey_, CFSTR("hostname"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostCallbackQueue, 0);
  objc_storeStrong((id *)&self->_cachedHostname, 0);
}

@end
