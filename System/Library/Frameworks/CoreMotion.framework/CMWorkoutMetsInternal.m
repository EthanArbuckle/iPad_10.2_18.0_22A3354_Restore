@implementation CMWorkoutMetsInternal

- (CMWorkoutMetsInternal)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *__p[2];
  char v10;
  objc_super v11;

  if (!objc_msgSend_isAvailable(CMWorkoutMets, a2, v2, v3, v4))
    return 0;
  v11.receiver = self;
  v11.super_class = (Class)CMWorkoutMetsInternal;
  v6 = -[CMWorkoutMetsInternal init](&v11, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMWorkoutMets", 0);
    v7 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v7, __p, *((_QWORD *)v6 + 2));
    *((_QWORD *)v6 + 1) = v7;
    if (v10 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v6 + 1));
  }
  return (CMWorkoutMetsInternal *)v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutMetsInternal;
  -[CMWorkoutMetsInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  void *fLocationdConnection;
  uint64_t v4;

  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    v4 = MEMORY[0x194001018](fLocationdConnection, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_queryWorkoutMetsWithSessionId:(id)a3 handler:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *fInternalQueue;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD block[7];
  int v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D6A0 != -1)
    dispatch_once(&qword_1EE16D6A0, &unk_1E2943B90);
  v7 = qword_1EE16D6A8;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = objc_msgSend_UUIDString(a3, v8, v9, v10, v11);
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "Workout Mets query for session: %@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2943B90);
    v19 = 138412290;
    v20 = objc_msgSend_UUIDString(a3, v13, v14, v15, v16);
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMWorkoutMetsInternal _queryWorkoutMetsWithSessionId:handler:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F490AF4;
  block[3] = &unk_1E2955C70;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(fInternalQueue, block);
}

@end
