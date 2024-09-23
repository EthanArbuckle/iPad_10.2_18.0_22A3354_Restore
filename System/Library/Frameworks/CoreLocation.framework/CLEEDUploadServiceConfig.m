@implementation CLEEDUploadServiceConfig

- (CLEEDUploadServiceConfig)initWithNumInflightUploads:(int64_t)a3 maxUploadFileSizeMB:(int64_t)a4 maxUploadQuotaMB:(int64_t)a5
{
  NSObject *v9;
  CLEEDUploadServiceConfig *result;
  char *v11;
  objc_super v12;
  int v13;
  const char *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  int64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v9 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v22 = "-[CLEEDUploadServiceConfig initWithNumInflightUploads:maxUploadFileSizeMB:maxUploadQuotaMB:]";
    v23 = 2050;
    v24 = a5;
    v25 = 2050;
    v26 = a4;
    v27 = 2050;
    v28 = a3;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "#EED2EMSFW,%{public}s[uploadQuotaMB:%{public}ld,maxFileSizeMB:%{public}ld,numInFlightUploads:%{public}ld]", buf, 0x2Au);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v13 = 136446978;
    v14 = "-[CLEEDUploadServiceConfig initWithNumInflightUploads:maxUploadFileSizeMB:maxUploadQuotaMB:]";
    v15 = 2050;
    v16 = a5;
    v17 = 2050;
    v18 = a4;
    v19 = 2050;
    v20 = a3;
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadServiceConfig initWithNumInflightUploads:maxUploadFileSizeMB:maxUploadQuotaMB:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CLEEDUploadServiceConfig;
  result = -[CLEEDUploadServiceConfig init](&v12, sel_init);
  if (result)
  {
    result->_maxUploadFileSizeMB = a4;
    result->_maxUploadQuotaMB = a5;
    result->_numInFlightUploads = a3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLEEDUploadServiceConfig;
  -[CLEEDUploadServiceConfig dealloc](&v2, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_maxUploadQuotaMB(self, a2, v2, v3);
  v10 = objc_msgSend_maxUploadFileSizeMB(self, v7, v8, v9);
  v14 = objc_msgSend_numInFlightUploads(self, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("[uploadQuotaMB:%ld,maxFileSizeMB:%ld,numInFlightUploads:%ld]"), v16, v6, v10, v14);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_maxUploadQuotaMB, (uint64_t)CFSTR("maxUploadQuotaMB"));
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_maxUploadFileSizeMB, (uint64_t)CFSTR("maxUploadFileSizeMB"));
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_numInFlightUploads, (uint64_t)CFSTR("numInFlightUploads"));
}

- (CLEEDUploadServiceConfig)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  CLEEDUploadServiceConfig *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLEEDUploadServiceConfig;
  v6 = -[CLEEDUploadServiceConfig init](&v12, sel_init);
  if (v6)
  {
    v6->_maxUploadQuotaMB = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("maxUploadQuotaMB"), v5);
    v6->_maxUploadFileSizeMB = objc_msgSend_decodeIntegerForKey_(a3, v7, (uint64_t)CFSTR("maxUploadFileSizeMB"), v8);
    v6->_numInFlightUploads = objc_msgSend_decodeIntegerForKey_(a3, v9, (uint64_t)CFSTR("numInFlightUploads"), v10);
  }
  return v6;
}

- (int64_t)numInFlightUploads
{
  return self->_numInFlightUploads;
}

- (int64_t)maxUploadFileSizeMB
{
  return self->_maxUploadFileSizeMB;
}

- (int64_t)maxUploadQuotaMB
{
  return self->_maxUploadQuotaMB;
}

@end
