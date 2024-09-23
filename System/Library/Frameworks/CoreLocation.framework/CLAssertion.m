@implementation CLAssertion

- (void)invalidate
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  NSObject *var0;
  _QWORD block[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLAssertion *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLAssertion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C90);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAssertion\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  var0 = self->_internal->var0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F5CCFCC;
  block[3] = &unk_1E2990DE0;
  block[4] = self;
  dispatch_sync(var0, block);
  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  CLAssertionInternal *internal;
  objc_super v8;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLAssertion *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLAssertion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C90);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAssertion\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  if (internal)
  {
    sub_18F5B99A8((uint64_t)self->_internal);
    dispatch_release((dispatch_object_t)internal->var0);
    MEMORY[0x194002D30](internal, 0xA0C40BD48D6D6);
  }
  v8.receiver = self;
  v8.super_class = (Class)CLAssertion;
  -[CLAssertion dealloc](&v8, sel_dealloc);
  os_activity_scope_leave(&state);
}

- (CLAssertion)initWithRegistrationMessageName:(const char *)a3 messageDictionary:(id)a4
{
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  CLAssertion *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[8];
  objc_super v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  CLAssertion *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLAssertion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C90);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    v24 = 2114;
    v25 = v10;
    v26 = 2050;
    v27 = self;
    v28 = 2082;
    v29 = a3;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAssertion\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  v16.receiver = self;
  v16.super_class = (Class)CLAssertion;
  v11 = -[CLAssertion init](&v16, sel_init);
  if (v11)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C90);
    v12 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = (const char *)a4;
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Requesting new assertion\", \"messageDictionary\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v13 = dispatch_queue_create("CLAssertionInternalQueue", 0);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_18F5BB770;
    v15[3] = &unk_1E29930A8;
    v15[4] = v11;
    v15[5] = v13;
    v15[6] = a4;
    v15[7] = a3;
    dispatch_sync(v13, v15);
    dispatch_release(v13);
  }
  os_activity_scope_leave(&state);
  return v11;
}

@end
