@implementation IDSTransportLog

+ (OS_os_log)IDSService
{
  if (qword_1ECDD6578 != -1)
    dispatch_once(&qword_1ECDD6578, &unk_1E2C5F0D0);
  return (OS_os_log *)(id)qword_1ECDD6570;
}

+ (OS_os_log)QRAllocator
{
  if (qword_1EE1E2048 != -1)
    dispatch_once(&qword_1EE1E2048, &unk_1E2C5F530);
  return (OS_os_log *)(id)qword_1EE1E2040;
}

+ (OS_os_log)IDSConnection
{
  if (qword_1ECDD6560 != -1)
    dispatch_once(&qword_1ECDD6560, &unk_1E2C601F0);
  return (OS_os_log *)(id)qword_1ECDD6558;
}

+ (OS_os_log)IDSDeviceConnection
{
  if (qword_1EE1E2058 != -1)
    dispatch_once(&qword_1EE1E2058, &unk_1E2C60290);
  return (OS_os_log *)(id)qword_1EE1E2050;
}

+ (OS_os_log)IDSDataChannels
{
  if (qword_1EE1E2068 != -1)
    dispatch_once(&qword_1EE1E2068, &unk_1E2C5FF30);
  return (OS_os_log *)(id)qword_1EE1E2060;
}

+ (OS_os_log)IDSLocalSetup
{
  if (qword_1EE1E2078 != -1)
    dispatch_once(&qword_1EE1E2078, &unk_1E2C5FFD0);
  return (OS_os_log *)(id)qword_1EE1E2070;
}

+ (OS_os_log)IDSReportSpam
{
  if (qword_1EE1E1E50 != -1)
    dispatch_once(&qword_1EE1E1E50, &unk_1E2C60030);
  return (OS_os_log *)(id)qword_1EE1E1E78;
}

+ (OS_os_log)NRPairing
{
  if (qword_1EE1E1E40 != -1)
    dispatch_once(&qword_1EE1E1E40, &unk_1E2C5F490);
  return (OS_os_log *)(id)qword_1EE1E1E38;
}

@end
