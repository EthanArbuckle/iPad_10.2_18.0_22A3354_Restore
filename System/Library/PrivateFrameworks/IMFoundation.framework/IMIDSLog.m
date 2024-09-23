@implementation IMIDSLog

+ (OS_os_log)daemon_oversized
{
  if (qword_1EE1DD258 != -1)
    dispatch_once(&qword_1EE1DD258, &unk_1E2C45E48);
  return (OS_os_log *)(id)qword_1EE1DD250;
}

+ (OS_os_log)encryption
{
  if (qword_1EE1DD8D0 != -1)
    dispatch_once(&qword_1EE1DD8D0, &unk_1E2C42F08);
  return (OS_os_log *)(id)qword_1EE1DD8C8;
}

+ (OS_os_log)daemon
{
  if (qword_1EE1DD3A0 != -1)
    dispatch_once(&qword_1EE1DD3A0, &unk_1E2C43448);
  return (OS_os_log *)(id)qword_1EE1DD490;
}

+ (OS_os_log)dataDetector
{
  if (qword_1EE1DD818 != -1)
    dispatch_once(&qword_1EE1DD818, &unk_1E2C438C8);
  return (OS_os_log *)(id)qword_1EE1DD810;
}

+ (OS_os_log)activityMonitor
{
  if (qword_1EE1DD248 != -1)
    dispatch_once(&qword_1EE1DD248, &unk_1E2C45E68);
  return (OS_os_log *)(id)qword_1EE1DD240;
}

+ (OS_os_log)security
{
  if (qword_1EE1DD4E0 != -1)
    dispatch_once(&qword_1EE1DD4E0, &unk_1E2C45E88);
  return (OS_os_log *)(id)qword_1EE1DD4F8;
}

+ (OS_os_log)URLLoading
{
  if (qword_1ECD90B60 != -1)
    dispatch_once(&qword_1ECD90B60, &unk_1E2C43188);
  return (OS_os_log *)(id)qword_1ECD90B58;
}

+ (OS_os_log)timer
{
  if (qword_1EE1DD898 != -1)
    dispatch_once(&qword_1EE1DD898, &unk_1E2C43288);
  return (OS_os_log *)(id)qword_1EE1DD8A0;
}

+ (OS_os_log)XPC
{
  if (qword_1EE1DD608 != -1)
    dispatch_once(&qword_1EE1DD608, &unk_1E2C45EA8);
  return (OS_os_log *)(id)qword_1EE1DD610;
}

@end
