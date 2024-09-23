@implementation IMSharedUILogs

+ (OS_os_log)transcript
{
  if (qword_2549C1288 != -1)
    dispatch_once(&qword_2549C1288, &unk_24C751390);
  return (OS_os_log *)(id)qword_2549C1280;
}

+ (OS_os_log)fsm
{
  if (qword_2549C1298 != -1)
    dispatch_once(&qword_2549C1298, &unk_24C7513B0);
  return (OS_os_log *)(id)qword_2549C1290;
}

+ (OS_os_log)audio
{
  if (qword_2549C12A8 != -1)
    dispatch_once(&qword_2549C12A8, &unk_24C7513D0);
  return (OS_os_log *)(id)qword_2549C12A0;
}

+ (OS_os_log)utilities
{
  if (qword_2549C12B8 != -1)
    dispatch_once(&qword_2549C12B8, &unk_24C7513F0);
  return (OS_os_log *)(id)qword_2549C12B0;
}

@end
