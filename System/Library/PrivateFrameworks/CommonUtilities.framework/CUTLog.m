@implementation CUTLog

+ (OS_os_log)power
{
  if (qword_1EE5CD6E8 != -1)
    dispatch_once(&qword_1EE5CD6E8, &unk_1E4490200);
  return (OS_os_log *)(id)qword_1EE5CD6E0;
}

+ (OS_os_log)fileCopier
{
  if (qword_1EE5CD750 != -1)
    dispatch_once(&qword_1EE5CD750, &unk_1E448FF38);
  return (OS_os_log *)(id)qword_1EE5CD748;
}

+ (OS_os_log)network
{
  if (qword_1ECD8FDB8 != -1)
    dispatch_once(&qword_1ECD8FDB8, &unk_1E4490220);
  return (OS_os_log *)(id)qword_1ECD8FDB0;
}

+ (OS_os_log)weakLink
{
  if (qword_1EE5CD6D0 != -1)
    dispatch_once(&qword_1EE5CD6D0, &unk_1E4490058);
  return (OS_os_log *)(id)qword_1EE5CD6D8;
}

+ (OS_os_log)xpc
{
  if (qword_1EE5CD760 != -1)
    dispatch_once(&qword_1EE5CD760, &unk_1E4490240);
  return (OS_os_log *)(id)qword_1EE5CD758;
}

+ (OS_os_log)utilities
{
  if (qword_1EE5CD770 != -1)
    dispatch_once(&qword_1EE5CD770, &unk_1E4490260);
  return (OS_os_log *)(id)qword_1EE5CD768;
}

@end
