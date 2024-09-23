@implementation CLGyroCalibrationDatabaseAdapter

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

+ (id)getSilo
{
  if (qword_1ECEDFCB8 != -1)
    dispatch_once(&qword_1ECEDFCB8, &unk_1E2954088);
  return (id)qword_1ECEDFCB0;
}

- (CLGyroCalibrationDatabaseAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLGyroCalibrationDatabaseAdapter;
  return -[CLIntersiloService initWithInboundProtocol:outboundProtocol:](&v3, sel_initWithInboundProtocol_outboundProtocol_, &unk_1EE17EFC0, &unk_1EE1876B8);
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
  v7 = sub_18F3BC07C(v6);
  objc_msgSend_setAdaptedNotifier_(self, v8, v7, v9, v10);
  if (!objc_msgSend_notifier(self, v11, v12, v13, v14))
  {
    if (qword_1EE16D448 != -1)
      dispatch_once(&qword_1EE16D448, &unk_1E2944F40);
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
        dispatch_once(&qword_1EE16D448, &unk_1E2944F40);
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
        dispatch_once(&qword_1EE16D448, &unk_1E2944F40);
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
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1E2945760, (const struct __class_type_info *)&unk_1E2945C68, 0);
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

+ (BOOL)isSupported
{
  if (qword_1ECEDFCC0 != -1)
    dispatch_once(&qword_1ECEDFCC0, &unk_1E29546C8);
  return byte_1ECEDFCA8;
}

- (BOOL)syncgetGyroStatsWithBias:(id *)a3 slope:(id *)a4 l2Error:(id *)a5 isDynamic:(BOOL)a6 deltaBias:(id *)a7 deltaSlope:(id *)a8 deltaError:(id *)a9 isDeltaDynamic:(BOOL)a10
{
  _BOOL8 v12;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v12 = a6;
  v17 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v18 = (*(uint64_t (**)(uint64_t, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, _BOOL8))(*(_QWORD *)v17 + 256))(v17, a3, a4, a5, v12);
  if (v18)
  {
    v23 = objc_msgSend_adaptee(self, v19, v20, v21, v22);
    LOBYTE(v18) = (*(uint64_t (**)(uint64_t, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, $E2C29196C7A5C696474C6955C5A9CE06 *, BOOL))(*(_QWORD *)v23 + 256))(v23, a7, a8, a9, a10);
  }
  return v18;
}

- (int)syncgetMaxDynamicTemperature
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_adaptee(self, a2, v2, v3, v4);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 264))(v5);
}

- (void)startFactoryGYTT
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_adaptee(self, a2, v2, v3, v4);
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 248))(v5);
}

- (BOOL)syncgetBiasFit:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v6 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, v3, v4);
  return (*(uint64_t (**)(uint64_t, $27EAB7405FCF4138B96BF1D57C6DB1C9 *))(*(_QWORD *)v6 + 216))(v6, a3);
}

- (void)getBiasFitWithReply:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[320];
  _OWORD __src[20];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(__src, 0, sizeof(__src));
  v6 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, v3, v4);
  v7 = (*(uint64_t (**)(uint64_t, _OWORD *))(*(_QWORD *)v6 + 216))(v6, __src);
  memcpy(v8, __src, sizeof(v8));
  (*((void (**)(id, uint64_t, _BYTE *))a3 + 2))(a3, v7, v8);
}

- (int)syncgetNonFactoryRoundCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_adaptee(self, a2, v2, v3, v4);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 296))(v5);
}

- (BOOL)syncgetSupportsMiniCalibration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_adaptee(self, a2, v2, v3, v4);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 272))(v5);
}

- (double)syncgetLastMiniCalibration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v7;

  v7 = 0.0;
  v5 = objc_msgSend_adaptee(self, a2, v2, v3, v4);
  (*(void (**)(uint64_t, double *))(*(_QWORD *)v5 + 288))(v5, &v7);
  return v7;
}

- (BOOL)syncgetInsertWithBias:(id *)a3 variance:(id *)a4 temperature:(float)a5 timestamp:(double)a6
{
  uint64_t v6;
  uint64_t v11;

  v11 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, (uint64_t)a4, v6);
  return (*(uint64_t (**)(uint64_t, const $E2C29196C7A5C696474C6955C5A9CE06 *, const $E2C29196C7A5C696474C6955C5A9CE06 *, float, double))(*(_QWORD *)v11 + 208))(v11, a3, a4, a5, a6);
}

- (void)dumpDatabase:(id)a3 onCompletion:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend_adaptee(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v8 = (*(uint64_t (**)(uint64_t, id))(*(_QWORD *)v7 + 224))(v7, a3);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v8);
}

- (BOOL)syncgetWipeDatabase
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_adaptee(self, a2, v2, v3, v4);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 232))(v5);
}

- (int)syncgetNumTemperatures
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend_adaptee(self, a2, v2, v3, v4);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 240))(v5);
}

@end
