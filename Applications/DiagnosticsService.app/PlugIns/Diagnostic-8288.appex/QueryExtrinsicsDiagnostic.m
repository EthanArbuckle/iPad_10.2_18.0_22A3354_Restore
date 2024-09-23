@implementation QueryExtrinsicsDiagnostic

- (void)start
{
  operator new();
}

- (void)log:(const void *)a3
{
  const void *v4;
  int v5;
  const void *v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a3 + 23) >= 0)
      v4 = a3;
    else
      v4 = *(const void **)a3;
    v5 = 136315138;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "QueryExtrinsicsDiagnostic %s", (uint8_t *)&v5, 0xCu);
  }
}

- (int)initDevice
{
  void *v3;
  void *__p[2];
  char v6;

  v3 = objc_autoreleasePoolPush();
  sub_10000E84C(__p, "initStreaming");
  -[QueryExtrinsicsDiagnostic log:](self, "log:", __p);
  if (v6 < 0)
    operator delete(__p[0]);
  DeviceCMInterface::initAndActivateCaptureDeviceController(self->_diagnosticCMInterface);
}

- (int)getCalibResults:(QueryExtrinsicsDiagnostic *)self focalPoint:(SEL)a2
{
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 *v5;
  const void *v8;
  __n128 OperationalWideToPeridotTransform;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17[2];
  char v18;
  void *__p;
  unsigned __int32 v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  __CFData *v27;

  v4 = v3;
  v5 = v2;
  sub_10000E84C(&__p, "getCalibResults");
  -[QueryExtrinsicsDiagnostic log:](self, "log:", &__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p);
  v27 = 0;
  if (DeviceCMInterface::getJasperCalib(self->_diagnosticCMInterface, &v27))
  {
    sub_10000E84C(v17, "unable to get JasperCalib");
    -[QueryExtrinsicsDiagnostic log:](self, "log:", v17);
    if (v18 < 0)
      operator delete(v17[0]);
    return 1;
  }
  else
  {
    if (self->_isJasper)
    {
      v8 = (const void *)JDJasperCalibCreateWithBinaryRepresentation(v27);
      JDJasperCalibGetFactoryWideToJasperTransform(v27);
    }
    else
    {
      v8 = (const void *)PDPeridotCalibCreateWithBinaryRepresentation(v27);
      OperationalWideToPeridotTransform = PDPeridotCalibGetOperationalWideToPeridotTransform(v27);
    }
    v20 = OperationalWideToPeridotTransform.n128_u32[2];
    v22 = v11;
    v24 = v13;
    __p = (void *)OperationalWideToPeridotTransform.n128_u64[0];
    v21 = v10;
    v26 = v15;
    v23 = v12;
    v25 = v14;
    if (v8)
      CFRelease(v8);
    v16 = v25;
    *(_DWORD *)(v4 + 8) = v26;
    *(_QWORD *)v4 = v16;
    CalcRotationAngleFromMatrix((uint64_t)&__p, v5);
    CFRelease(v27);
    return 0;
  }
}

@end
