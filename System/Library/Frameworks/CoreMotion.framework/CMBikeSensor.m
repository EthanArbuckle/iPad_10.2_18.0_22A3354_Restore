@implementation CMBikeSensor

- (CMBikeSensor)init
{
  CMBikeSensor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMBikeSensor;
  v2 = -[CMBikeSensor init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMBikeSensorInternal);
  return v2;
}

- (void)dealloc
{
  CMBikeSensorInternal *internal;
  NSObject *fInternalQueue;
  objc_super v5;
  _QWORD block[5];

  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F42812C;
  block[3] = &unk_1E2955938;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMBikeSensor;
  -[CMBikeSensor dealloc](&v5, sel_dealloc);
}

+ (BOOL)isAvailable
{
  if ((sub_18F1F7758() & 1) == 0)
    sub_18F1F77DC();
  return 0;
}

- (void)feedBikeSensorData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDF978 != -1)
    dispatch_once(&qword_1ECEDF978, &unk_1E2954F48);
  if (qword_1ECEDF970 == 3)
  {
    objc_msgSend_instantaneousPower(a3, a2, (uint64_t)a3, v3, v4);
    if (v11 >= 1.79769313e308 && (objc_msgSend_instantaneousCadence(a3, v7, v8, v9, v10), v12 >= 1.79769313e308))
    {
      if (qword_1EE16D6A0 != -1)
        dispatch_once(&qword_1EE16D6A0, &unk_1E29550C8);
      v19 = qword_1EE16D6A8;
      if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_instantaneousPower(a3, v20, v21, v22, v23);
        *(_DWORD *)buf = 134217984;
        v33 = v24;
        _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_DEFAULT, "CMBikeSensor::feedBikeSensorData the input variable is beyond the limit and was rejected: %f", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D6A0 != -1)
          dispatch_once(&qword_1EE16D6A0, &unk_1E29550C8);
        objc_msgSend_instantaneousPower(a3, v25, v26, v27, v28);
        v29 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMBikeSensor feedBikeSensorData:]", "CoreLocation: %s\n", v29);
        if (v29 != (char *)buf)
          free(v29);
      }
    }
    else
    {
      v13 = objc_msgSend_newFitnessMachineDataFromBikeSensorData(a3, v7, v8, v9, v10);
      v18 = objc_msgSend__internal(self, v14, v15, v16, v17);
      MEMORY[0x1E0DE7D20](v18, sel__feedBikeSensorData_, v13, v30, v31);
    }
  }
}

- (CMBikeSensorInternal)_internal
{
  return self->_internal;
}

@end
