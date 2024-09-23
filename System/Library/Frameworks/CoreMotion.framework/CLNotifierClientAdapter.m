@implementation CLNotifierClientAdapter

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLNotifierClientAdapter)initWithClient:(CLNotifierClientBase *)a3
{
  CLNotifierClientAdapter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CLNotifierClientAdapter *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLNotifierClientAdapter;
  v4 = -[CLNotifierClientAdapter init](&v10, sel_init);
  v8 = v4;
  if (v4)
    v4->_client = a3;
  objc_msgSend_setValid_(v4, v5, 1, v6, v7);
  return v8;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  v6 = a4 + 1;
  if (a4 + 1 < objc_msgSend_count(a3, a2, (uint64_t)a3, a4, v4))
  {
    v10 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v7, v6, v8, v9);
    objc_msgSend_becameFatallyBlocked_index_(v10, v11, (uint64_t)a3, v6, v12);
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  uint64_t v4;

  objc_msgSend_sync_(a3, a2, (uint64_t)a4, (uint64_t)a4, v4);
}

- (CLNotifierClientAdapter)init
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D448 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545A8);
    }
    v3 = qword_1EE16D440;
    if (os_signpost_enabled((os_log_t)qword_1EE16D440))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545A8);
    }
    v4 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE16D448, &unk_1E29545A8);
  }
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_setValid_(self, a2, 0, v2, v3);
  self->_client = 0;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  CLNotifierClientBase *client;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  client = self->_client;
  if (!client)
  {
    if (qword_1EE16D448 != -1)
      dispatch_once(&qword_1EE16D448, &unk_1E29545A8);
    v5 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "_client";
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545A8);
    }
    v6 = qword_1EE16D440;
    if (os_signpost_enabled((os_log_t)qword_1EE16D440))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "_client";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545A8);
    }
    v7 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "_client";
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  (*((void (**)(CLNotifierClientBase *, _QWORD, id))client->var0 + 2))(client, *(_QWORD *)&a3, a4);
}

- (NSString)debugDescription
{
  void *v3;
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CLNotifierClientAdapter;
  v4 = -[CLNotifierClientAdapter debugDescription](&v9, sel_debugDescription);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@\nCLNotifierClientBase: %p"), v6, v7, v4, self->_client);
}

- (BOOL)valid
{
  return self->_valid;
}

@end
