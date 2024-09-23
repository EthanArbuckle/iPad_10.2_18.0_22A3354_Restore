@implementation CLHidDevice

- (CLHidDevice)initWithHidDevice:(id)a3 matchingDict:(id)a4
{
  CLHidDevice *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLHidDevice;
  result = -[CLHidDevice init](&v7, sel_init);
  if (result)
  {
    result->_matching = (NSDictionary *)a4;
    result->_hidDevice = (HIDDevice *)a3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHidDevice;
  -[CLHidDevice dealloc](&v3, sel_dealloc);
}

- (BOOL)setReport:(int64_t)a3 payload:(char *)a4 length:(int64_t)a5
{
  void *v8;
  const char *v9;
  char v10;
  NSObject *v11;
  char *v13;
  _QWORD v14[5];
  uint64_t v15;
  int v16;
  int64_t v17;
  __int16 v18;
  uint64_t v19;
  uint8_t buf[4];
  int64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v8 = (void *)objc_msgSend_hidDevice(self, a2, a3, (uint64_t)a4, a5);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18F4463D0;
  v14[3] = &unk_1E2958088;
  v14[4] = a3;
  v10 = objc_msgSend_setReport_reportLength_withIdentifier_forType_error_timeout_callback_(v8, v9, (uint64_t)a4, a5, a3, 2, &v15, 0, v14);
  if ((v10 & 1) == 0)
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2953A48);
    v11 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v21 = a3;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_ERROR, "[CLHidManager] setReport: id=0x%lx, failed=%@", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2953A48);
      v16 = 134218242;
      v17 = a3;
      v18 = 2112;
      v19 = v15;
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CLHidDevice setReport:payload:length:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf)
        free(v13);
    }
  }
  return v10;
}

- (NSDictionary)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (HIDDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
  self->_hidDevice = (HIDDevice *)a3;
}

@end
