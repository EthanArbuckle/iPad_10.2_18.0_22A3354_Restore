@implementation CMCatherineFeeder

- (CMCatherineFeeder)init
{
  CMCatherineFeeder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMCatherineFeeder;
  v2 = -[CMCatherineFeeder init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMCatherineFeederInternal);
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  objc_super v7;
  _QWORD block[5];

  v6 = *(NSObject **)(objc_msgSend_internal(self, a2, v2, v3, v4) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F48A3F8;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(v6, block);

  v7.receiver = self;
  v7.super_class = (Class)CMCatherineFeeder;
  -[CMCatherineFeeder dealloc](&v7, sel_dealloc);
}

- (void)feedCatherine:(double)a3 confidence:(double)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  _QWORD block[7];
  int v15;
  double v16;
  __int16 v17;
  double v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D6A0 != -1)
    dispatch_once(&qword_1EE16D6A0, &unk_1E2955028);
  v7 = qword_1EE16D6A8;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283777;
    v20 = a3;
    v21 = 2049;
    v22 = a4;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEBUG, "feedCatherine called with HR %{private}f, confidence %{private}f", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E2955028);
    v15 = 134283777;
    v16 = a3;
    v17 = 2049;
    v18 = a4;
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMCatherineFeeder feedCatherine:confidence:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  v12 = *(NSObject **)(objc_msgSend_internal(self, v8, v9, v10, v11) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F48A61C;
  block[3] = &unk_1E2956548;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(v12, block);
}

- (CMCatherineFeederInternal)internal
{
  return self->_internal;
}

@end
