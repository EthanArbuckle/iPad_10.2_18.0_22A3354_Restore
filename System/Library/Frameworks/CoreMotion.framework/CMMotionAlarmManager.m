@implementation CMMotionAlarmManager

- (CMMotionAlarmManager)init
{
  uint64_t v2;
  uint64_t v3;

  return (CMMotionAlarmManager *)objc_msgSend_initWithName_(self, a2, (uint64_t)CFSTR("_DefaultManager"), v2, v3);
}

- (CMMotionAlarmManager)initWithName:(id)a3
{
  CMMotionAlarmManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMMotionAlarmManager;
  v4 = -[CMMotionAlarmManager init](&v6, sel_init);
  if (v4)
    v4->_name = (NSString *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_name = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMMotionAlarmManager;
  -[CMMotionAlarmManager dealloc](&v3, sel_dealloc);
}

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3E4A7C;
  block[3] = &unk_1E2955938;
  block[4] = a1;
  if (qword_1ECEDF8E8 != -1)
    dispatch_once(&qword_1ECEDF8E8, block);
  return (id)qword_1ECEDF8F0;
}

- (BOOL)registerAlarmWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  CMMotionAlarm *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v13 = [CMMotionAlarm alloc];
  v15 = (void *)objc_msgSend_initWithName_type_duration_repeats_(v13, v14, (uint64_t)a3, v10, v9, v8);
  objc_msgSend_setManager_(v15, v16, (uint64_t)self, v17, v18);
  v23 = (void *)objc_msgSend_instance(CMMotionAlarmManagerInternal, v19, v20, v21, v22);
  LOBYTE(a7) = objc_msgSend__registerAlarm_error_(v23, v24, (uint64_t)v15, (uint64_t)a7, v25);

  return (char)a7;
}

- (BOOL)unregisterAlarmWithName:(id)a3 error:(id *)a4
{
  CMMotionAlarm *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  v7 = [CMMotionAlarm alloc];
  v9 = (void *)objc_msgSend_initWithName_type_duration_repeats_(v7, v8, (uint64_t)a3, 9, 0xFFFFFFFFLL, 0);
  objc_msgSend_setManager_(v9, v10, (uint64_t)self, v11, v12);
  v17 = (void *)objc_msgSend_instance(CMMotionAlarmManagerInternal, v13, v14, v15, v16);
  LOBYTE(a4) = objc_msgSend__unregisterAlarm_error_(v17, v18, (uint64_t)v9, (uint64_t)a4, v19);

  return (char)a4;
}

- (BOOL)acknowledgeAlarmWithName:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend_instance(CMMotionAlarmManagerInternal, a2, (uint64_t)a3, (uint64_t)a4, v4);
  return MEMORY[0x1E0DE7D20](v7, sel__acknowledgeAlarm_error_, a3, a4, v8);
}

- (BOOL)launchRemoteAppWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = objc_msgSend_instance(CMMotionAlarmManagerInternal, a2, (uint64_t)a3, v3, v4);
  v12 = objc_msgSend_delegate(self, v8, v9, v10, v11);
  return MEMORY[0x1E0DE7D20](v7, sel__launchRemoteAppWithError_delegate_, a3, v12, v13);
}

- (BOOL)unregisterAlarm:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend_name(a3, a2, (uint64_t)a3, (uint64_t)a4, v4);
  return MEMORY[0x1E0DE7D20](self, sel_unregisterAlarmWithName_error_, v7, a4, v8);
}

- (BOOL)acknowledgeAlarm:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend_name(a3, a2, (uint64_t)a3, (uint64_t)a4, v4);
  return MEMORY[0x1E0DE7D20](self, sel_acknowledgeAlarmWithName_error_, v7, a4, v8);
}

+ (BOOL)isAvailable
{
  return ((unint64_t)sub_18F1F7BFC() >> 1) & 1;
}

- (CMMotionAlarmDelegateProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMMotionAlarmDelegateProtocol *)a3;
}

- (NSString)name
{
  return self->_name;
}

@end
