@implementation CLGeomagneticModelProviderAdapter

+ (id)getSilo
{
  if (qword_1ECEDFB38 != -1)
    dispatch_once(&qword_1ECEDFB38, &unk_1E2953A88);
  return (id)qword_1ECEDFB30;
}

- (CLGeomagneticModelProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLGeomagneticModelProviderAdapter;
  return -[CLIntersiloService initWithInboundProtocol:outboundProtocol:](&v3, sel_initWithInboundProtocol_outboundProtocol_, &unk_1EE17B610, &unk_1EE1875F8);
}

- (void)beginService
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_universe(self, a2, v2, v3, v4);
  v7 = sub_18F209CEC(v6);
  objc_msgSend_setAdaptedNotifier_(self, v8, v7, v9, v10);
  if (!objc_msgSend_notifier(self, v11, v12, v13, v14))
  {
    if (qword_1EE16D448 != -1)
      dispatch_once(&qword_1EE16D448, &unk_1E29581D0);
    v15 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2082;
      v23 = "assert";
      v24 = 2081;
      v25 = "__null != self.notifier";
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29581D0);
    }
    v16 = qword_1EE16D440;
    if (os_signpost_enabled((os_log_t)qword_1EE16D440))
    {
      *(_DWORD *)buf = 68289539;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2082;
      v23 = "assert";
      v24 = 2081;
      v25 = "__null != self.notifier";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29581D0);
    }
    v17 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2082;
      v23 = "assert";
      v24 = 2081;
      v25 = "__null != self.notifier";
      _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
}

+ (BOOL)isSupported
{
  if (qword_1ECEDFB28 != -1)
    dispatch_once(&qword_1ECEDFB28, &unk_1E29546A8);
  return byte_1ECEDFB20;
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

- (void)endService
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_notifier(self, a2, v2, v3, v4);
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
}

- (void)adaptee
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;

  result = (void *)objc_msgSend_notifier(self, a2, v2, v3, v4);
  if (result)
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1E2945760, (const struct __class_type_info *)&unk_1E2945C80, 0);
  return result;
}

- (void)doAsync:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v6 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, v3, v4);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  uint64_t v4;
  uint64_t v7;

  v7 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v7);
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v6 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, v3, v4);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
  return 0;
}

- (void)fetchGeomagneticModelData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[8];

  v6 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, v3, v4);
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v6 + 208))(v7);
  (*((void (**)(id, _QWORD *))a3 + 2))(a3, v7);
}

@end
