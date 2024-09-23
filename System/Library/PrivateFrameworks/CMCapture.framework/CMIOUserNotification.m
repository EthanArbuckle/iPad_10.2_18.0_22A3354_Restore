@implementation CMIOUserNotification

- (id)initNotificationWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  xpc_connection_t mach_service;
  _xpc_connection_s *v14;
  xpc_object_t empty;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD handler[4];
  id v22;
  id location;
  objc_super v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)CMIOUserNotification;
  v10 = -[CMCaptureUserNotification initForSubclass](&v24, sel_initForSubclass);
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v10 + 1) = dispatch_queue_create_with_target_V2("CMIOUserNotification", v11, 0);
    v12 = dispatch_group_create();
    *((_QWORD *)v10 + 2) = v12;
    dispatch_group_enter(v12);
    mach_service = xpc_connection_create_mach_service("com.apple.cmio.registerassistantservice", 0, 2uLL);
    *((_QWORD *)v10 + 4) = mach_service;
    if (mach_service)
    {
      *((_BYTE *)v10 + 41) = 1;
      objc_initWeak(&location, v10);
      xpc_connection_set_target_queue(*((xpc_connection_t *)v10 + 4), *((dispatch_queue_t *)v10 + 1));
      v14 = (_xpc_connection_s *)*((_QWORD *)v10 + 4);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __75__CMIOUserNotification_initNotificationWithTimeout_flags_dictionary_error___block_invoke;
      handler[3] = &unk_1E491E828;
      objc_copyWeak(&v22, &location);
      xpc_connection_set_event_handler(v14, handler);
      xpc_connection_resume(*((xpc_connection_t *)v10 + 4));
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_BOOL(empty, "user-notification", 1);
      xpc_connection_send_message(*((xpc_connection_t *)v10 + 4), empty);
      xpc_release(empty);
      v16 = (void *)objc_msgSend(v10, "_createOrUpdate:withTimeout:flags:dictionary:", "notifications-msgtype-create", a4, a5, a3);
      if (a6)
        *a6 = v16;
      if (v16)
      {

        v10 = 0;
      }
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {

      if (a6)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v25 = CFSTR("description");
        v26[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s:%d"), "-[CMIOUserNotification initNotificationWithTimeout:flags:dictionary:error:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 405);
        v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
        v19 = (void *)objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -12783, v18);
        v10 = 0;
        *a6 = v19;
      }
      else
      {
        return 0;
      }
    }
  }
  return v10;
}

uint64_t __75__CMIOUserNotification_initNotificationWithTimeout_flags_dictionary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_handleXPCEvent:", a2);
}

- (void)dealloc
{
  objc_super v3;

  -[CMIOUserNotification _closeConnection](self, "_closeConnection");

  dispatch_release((dispatch_object_t)self->_responseGroup);
  v3.receiver = self;
  v3.super_class = (Class)CMIOUserNotification;
  -[CMIOUserNotification dealloc](&v3, sel_dealloc);
}

- (void)_closeConnection
{
  OS_xpc_object *userNotificationServiceConnection;

  userNotificationServiceConnection = self->_userNotificationServiceConnection;
  if (userNotificationServiceConnection)
  {
    if (self->_connectionIsValid)
      xpc_connection_cancel(userNotificationServiceConnection);
    self->_connectionIsValid = 0;
    xpc_release(self->_userNotificationServiceConnection);
    self->_userNotificationServiceConnection = 0;
    dispatch_group_leave((dispatch_group_t)self->_responseGroup);
  }
}

- (void)_handleXPCEvent:(id)a3
{
  uint64_t v5;
  char v7;
  int *v8;
  const char *string;

  v5 = MEMORY[0x1A858E754](a3, a2);
  if (v5 == MEMORY[0x1E0C81310])
  {
    if (a3 != (id)MEMORY[0x1E0C81260] || MEMORY[0x1E0C81258] == MEMORY[0x1E0C81260])
      goto LABEL_13;
    v7 = 0;
    v8 = &OBJC_IVAR___CMIOUserNotification__connectionIsValid;
LABEL_12:
    *((_BYTE *)&self->super.super.isa + *v8) = v7;
LABEL_13:
    -[CMIOUserNotification _closeConnection](self, "_closeConnection");
    return;
  }
  if (v5 == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(a3, "notifications-param-message-type");
    if (string)
    {
      if (!strcmp(string, "notifications-msgtype-read-response"))
      {
        self->_response = xpc_dictionary_get_int64(a3, "notifications-param-response");
        v7 = 1;
        v8 = &OBJC_IVAR___CMIOUserNotification__responseIsValid;
        goto LABEL_12;
      }
    }
  }
}

- (unint64_t)receiveResponseWithTimeout:(double)a3 error:(id *)a4
{
  dispatch_time_t v6;
  intptr_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0)
    v6 = -1;
  else
    v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v7 = dispatch_group_wait((dispatch_group_t)self->_responseGroup, v6);
  if (v7)
  {
    if (a4)
    {
LABEL_6:
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2F90];
      v13[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s:%d"), "-[CMIOUserNotification receiveResponseWithTimeout:error:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 478, CFSTR("description"));
      v10 = (void *)objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v7, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
LABEL_10:
      *a4 = v10;
    }
  }
  else if (self->_responseIsValid)
  {
    if (a4)
    {
      v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if (self->_connectionIsValid)
      v7 = -12783;
    else
      v7 = -12785;
    if (a4)
      goto LABEL_6;
  }
  return self->_response;
}

- (id)updateWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5
{
  return -[CMIOUserNotification _createOrUpdate:withTimeout:flags:dictionary:](self, "_createOrUpdate:withTimeout:flags:dictionary:", "notifications-msgtype-update", a4, a5, a3);
}

- (id)_createOrUpdate:(const char *)a3 withTimeout:(double)a4 flags:(unint64_t)a5 dictionary:(id)a6
{
  xpc_object_t empty;
  void *v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  uint64_t v15;
  int int64;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!self->_connectionIsValid)
  {
    int64 = -12785;
LABEL_13:
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2F90];
    v21[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s:%d"), "-[CMIOUserNotification _createOrUpdate:withTimeout:flags:dictionary:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 530, CFSTR("description"));
    return (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, int64, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1));
  }
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "notifications-param-message-type", a3);
  xpc_dictionary_set_double(empty, "notifications-param-timeout", a4);
  xpc_dictionary_set_int64(empty, "notifications-param-flags", a5);
  v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v11)
  {
    v12 = v11;
    xpc_dictionary_set_value(empty, "notifications-param-dictionary", v11);
    xpc_release(v12);
    v13 = xpc_connection_send_message_with_reply_sync(self->_userNotificationServiceConnection, empty);
    if (v13)
    {
      v14 = v13;
      v15 = MEMORY[0x1A858E754]();
      if (v15 == MEMORY[0x1E0C81310])
      {
        int64 = -12788;
      }
      else if (v15 == MEMORY[0x1E0C812F8])
      {
        int64 = xpc_dictionary_get_int64(v14, "errorReturn");
      }
      else
      {
        int64 = -12780;
      }
      xpc_release(v14);
    }
    else
    {
      int64 = -12783;
    }
  }
  else
  {
    int64 = -12780;
  }
  if (empty)
    xpc_release(empty);
  if (int64)
    goto LABEL_13;
  return 0;
}

- (void)asyncResponse:(id)a3 block:(id)a4
{
  CMIOUserNotification *v7;
  NSObject *responseGroup;
  _QWORD v9[6];

  v7 = self;
  responseGroup = self->_responseGroup;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CMIOUserNotification_asyncResponse_block___block_invoke;
  v9[3] = &unk_1E491F098;
  v9[4] = self;
  v9[5] = a4;
  dispatch_group_notify(responseGroup, (dispatch_queue_t)a3, v9);
}

void __44__CMIOUserNotification_asyncResponse_block___block_invoke(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[40])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v1 = *(_BYTE **)(a1 + 32);
  }

}

- (id)cancel
{
  xpc_object_t empty;
  xpc_object_t v4;
  void *v5;
  int int64;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!self->_connectionIsValid)
  {
    int64 = -12785;
    goto LABEL_12;
  }
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "notifications-param-message-type", "notifications-msgtype-cancel");
  v4 = xpc_connection_send_message_with_reply_sync(self->_userNotificationServiceConnection, empty);
  if (v4)
  {
    v5 = v4;
    if (MEMORY[0x1A858E754]() != MEMORY[0x1E0C812F8] || MEMORY[0x1E0C81310] == MEMORY[0x1E0C812F8])
      int64 = -12788;
    else
      int64 = xpc_dictionary_get_int64(v5, "errorReturn");
    xpc_release(v5);
    if (empty)
      goto LABEL_10;
  }
  else
  {
    int64 = -12788;
    if (empty)
LABEL_10:
      xpc_release(empty);
  }
  if (int64)
  {
LABEL_12:
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2F90];
    v12[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s:%d"), "-[CMIOUserNotification cancel]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/CMCapture/Sources/Common/CMCaptureUserNotification.m", 579, CFSTR("description"));
    return (id)objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, int64, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
  return 0;
}

@end
