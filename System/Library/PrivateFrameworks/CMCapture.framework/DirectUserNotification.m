@implementation DirectUserNotification

- (id)initNotificationWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5 error:(id *)a6
{
  _QWORD *v10;
  CFUserNotificationRef v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SInt32 error;
  objc_super v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)DirectUserNotification;
  v10 = -[CMCaptureUserNotification initForSubclass](&v18, sel_initForSubclass);
  if (v10)
  {
    error = 0;
    v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, a4, &error, (CFDictionaryRef)a5);
    v10[1] = v11;
    if (a6)
    {
      v12 = error;
      if (error)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v14 = *MEMORY[0x1E0CB2F90];
        v19 = CFSTR("description");
        v20[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s:%d"), "-[DirectUserNotification initNotificationWithTimeout:flags:dictionary:error:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 287);
        v15 = (void *)objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v12, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1));
      }
      else
      {
        v15 = 0;
      }
      *a6 = v15;
      v11 = (CFUserNotificationRef)v10[1];
    }
    if (!v11)
    {

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  __CFUserNotification *notification;
  objc_super v4;

  notification = self->_notification;
  if (notification)
    CFRelease(notification);
  v4.receiver = self;
  v4.super_class = (Class)DirectUserNotification;
  -[DirectUserNotification dealloc](&v4, sel_dealloc);
}

- (unint64_t)receiveResponseWithTimeout:(double)a3 error:(id *)a4
{
  SInt32 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CFOptionFlags responseFlags;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  responseFlags = 0;
  v5 = CFUserNotificationReceiveResponse(self->_notification, a3, &responseFlags);
  if (a4)
  {
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2F90];
      v8 = v5;
      v12 = CFSTR("description");
      v13[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s:%d"), "-[DirectUserNotification receiveResponseWithTimeout:error:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 311);
      v9 = (void *)objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
    }
    else
    {
      v9 = 0;
    }
    *a4 = v9;
  }
  return responseFlags;
}

- (void)asyncResponse:(id)a3 block:(id)a4
{
  DirectUserNotification *v6;
  NSObject *global_queue;
  _QWORD v8[6];

  v6 = self;
  global_queue = dispatch_get_global_queue(21, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__DirectUserNotification_asyncResponse_block___block_invoke;
  v8[3] = &unk_1E491F480;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(global_queue, v8);
}

void __46__DirectUserNotification_asyncResponse_block___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "receiveResponseWithTimeout:error:", 0, 0.0));

}

- (id)updateWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5
{
  SInt32 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = CFUserNotificationUpdate(self->_notification, a3, a4, (CFDictionaryRef)a5);
  if (!v5)
    return 0;
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2F90];
  v8 = v5;
  v11[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s:%d"), "-[DirectUserNotification updateWithTimeout:flags:dictionary:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 332, CFSTR("description"));
  return (id)objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
}

- (id)cancel
{
  SInt32 v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = CFUserNotificationCancel(self->_notification);
  if (!v2)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2F90];
  v5 = v2;
  v8[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s:%d"), "-[DirectUserNotification cancel]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 341, CFSTR("description"));
  return (id)objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
}

@end
