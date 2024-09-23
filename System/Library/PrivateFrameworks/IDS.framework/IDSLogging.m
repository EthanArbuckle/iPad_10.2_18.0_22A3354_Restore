@implementation IDSLogging

+ (OS_os_log)Connection
{
  if (qword_1ECDD66D0 != -1)
    dispatch_once(&qword_1ECDD66D0, &unk_1E2C645F8);
  return (OS_os_log *)(id)qword_1ECDD66C0;
}

+ (OS_os_log)_IDSService
{
  if (qword_1ECDD6678 != -1)
    dispatch_once(&qword_1ECDD6678, &unk_1E2C5F250);
  return (OS_os_log *)(id)qword_1ECDD6658;
}

+ (OS_os_log)IDSAccountController
{
  if (qword_1ECDD6690 != -1)
    dispatch_once(&qword_1ECDD6690, &unk_1E2C5F350);
  return (OS_os_log *)(id)qword_1ECDD66A0;
}

+ (OS_os_log)DaemonController
{
  if (qword_1ECDD66C8 != -1)
    dispatch_once(&qword_1ECDD66C8, &unk_1E2C645D8);
  return (OS_os_log *)(id)qword_1ECDD66B8;
}

+ (OS_os_log)Accounts
{
  if (qword_1ECDD6688 != -1)
    dispatch_once(&qword_1ECDD6688, &unk_1E2C5F5F0);
  return (OS_os_log *)(id)qword_1ECDD6680;
}

+ (OS_os_log)ServiceAvailability
{
  if (qword_1EE1E1F50 != -1)
    dispatch_once(&qword_1EE1E1F50, &unk_1E2C5F630);
  return (OS_os_log *)(id)qword_1EE1E1F48;
}

+ (OS_os_log)IDQuery
{
  if (qword_1ECDD65F0 != -1)
    dispatch_once(&qword_1ECDD65F0, &unk_1E2C5F670);
  return (OS_os_log *)(id)qword_1ECDD65E8;
}

+ (OS_os_log)general
{
  if (qword_1EE1E2088 != -1)
    dispatch_once(&qword_1EE1E2088, &unk_1E2C5F190);
  return (OS_os_log *)(id)qword_1EE1E2080;
}

+ (OS_os_log)transactionLog
{
  if (qword_1EE1E2098 != -1)
    dispatch_once(&qword_1EE1E2098, &unk_1E2C60070);
  return (OS_os_log *)(id)qword_1EE1E2090;
}

+ (OS_os_log)DaemonListener
{
  if (qword_1ECDD6630 != -1)
    dispatch_once(&qword_1ECDD6630, &unk_1E2C600B0);
  return (OS_os_log *)(id)qword_1ECDD6638;
}

+ (OS_os_log)IDSService
{
  if (qword_1EE1E20A8 != -1)
    dispatch_once(&qword_1EE1E20A8, &unk_1E2C600F0);
  return (OS_os_log *)(id)qword_1EE1E20A0;
}

+ (OS_os_log)IDSConnection
{
  if (qword_1EE1E20B8 != -1)
    dispatch_once(&qword_1EE1E20B8, &unk_1E2C5F290);
  return (OS_os_log *)(id)qword_1EE1E20B0;
}

+ (OS_os_log)IDSConnection_oversize
{
  if (qword_1ECDD6428 != -1)
    dispatch_once(&qword_1ECDD6428, &unk_1E2C5F570);
  return (OS_os_log *)(id)qword_1ECDD6430;
}

+ (OS_os_log)IDSDirectMessagingConnection
{
  if (qword_1ECDD65E0 != -1)
    dispatch_once(&qword_1ECDD65E0, &unk_1E2C60110);
  return (OS_os_log *)(id)qword_1ECDD65D8;
}

+ (OS_os_log)continuity
{
  if (qword_1EE1E20C8 != -1)
    dispatch_once(&qword_1EE1E20C8, &unk_1E2C5F590);
  return (OS_os_log *)(id)qword_1EE1E20C0;
}

+ (OS_os_log)IDSSession
{
  if (qword_1EE1E1E48 != -1)
    dispatch_once(&qword_1EE1E1E48, &unk_1E2C5F5B0);
  return (OS_os_log *)(id)qword_1EE1E20D0;
}

+ (OS_os_log)CFS
{
  if (qword_1EE1E20E0 != -1)
    dispatch_once(&qword_1EE1E20E0, &unk_1E2C60130);
  return (OS_os_log *)(id)qword_1EE1E20D8;
}

+ (OS_os_log)_IDSGroupSession
{
  if (qword_1EE1E20F0 != -1)
    dispatch_once(&qword_1EE1E20F0, &unk_1E2C64618);
  return (OS_os_log *)(id)qword_1EE1E20E8;
}

+ (OS_os_log)_IDSGroupSession_oversize
{
  if (qword_1EE1E2100 != -1)
    dispatch_once(&qword_1EE1E2100, &unk_1E2C601B0);
  return (OS_os_log *)(id)qword_1EE1E20F8;
}

+ (OS_os_log)DaemonProxy
{
  if (qword_1EE1E2110 != -1)
    dispatch_once(&qword_1EE1E2110, &unk_1E2C5F310);
  return (OS_os_log *)(id)qword_1EE1E2108;
}

+ (OS_os_log)GUIDTRACE
{
  if (qword_1ECDD6588 != -1)
    dispatch_once(&qword_1ECDD6588, &unk_1E2C5F5D0);
  return (OS_os_log *)(id)qword_1ECDD6580;
}

+ (OS_os_log)IDSDevice
{
  if (qword_1EE1E2120 != -1)
    dispatch_once(&qword_1EE1E2120, &unk_1E2C64638);
  return (OS_os_log *)(id)qword_1EE1E2118;
}

+ (OS_os_log)IDSDeviceConnection
{
  if (qword_1EE1E2130 != -1)
    dispatch_once(&qword_1EE1E2130, &unk_1E2C5F390);
  return (OS_os_log *)(id)qword_1EE1E2128;
}

+ (OS_os_log)IDSDataChannels
{
  if (qword_1EE1E2140 != -1)
    dispatch_once(&qword_1EE1E2140, &unk_1E2C5F3B0);
  return (OS_os_log *)(id)qword_1EE1E2138;
}

+ (OS_os_log)IDSRealTimeEncryptionProxy
{
  if (qword_1EE1E2150 != -1)
    dispatch_once(&qword_1EE1E2150, &unk_1E2C5F3D0);
  return (OS_os_log *)(id)qword_1EE1E2148;
}

+ (OS_os_log)IDSiCloudSignInHack
{
  if (qword_1EE1E2160 != -1)
    dispatch_once(&qword_1EE1E2160, &unk_1E2C5F650);
  return (OS_os_log *)(id)qword_1EE1E2158;
}

+ (OS_os_log)_IDSSession
{
  if (qword_1EE1E2170 != -1)
    dispatch_once(&qword_1EE1E2170, &unk_1E2C5F3F0);
  return (OS_os_log *)(id)qword_1EE1E2168;
}

@end
