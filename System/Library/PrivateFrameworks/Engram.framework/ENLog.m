@implementation ENLog

+ (OS_os_log)groupContext
{
  if (qword_1EFEC8FA8 != -1)
    dispatch_once(&qword_1EFEC8FA8, &unk_1E987B088);
  return (OS_os_log *)(id)qword_1EFEC8FA0;
}

+ (OS_os_log)groupContextCache
{
  if (qword_1EFEC8FB8 != -1)
    dispatch_once(&qword_1EFEC8FB8, &unk_1E987B6A0);
  return (OS_os_log *)(id)qword_1EFEC8FB0;
}

+ (OS_os_log)groupContextDataSource
{
  if (qword_1EFEC8FC8 != -1)
    dispatch_once(&qword_1EFEC8FC8, &unk_1E987B6C0);
  return (OS_os_log *)(id)qword_1EFEC8FC0;
}

+ (OS_os_log)utilities
{
  if (qword_1EFEC8FD8 != -1)
    dispatch_once(&qword_1EFEC8FD8, &unk_1E987B0C8);
  return (OS_os_log *)(id)qword_1EFEC8FD0;
}

+ (OS_os_log)groupID
{
  if (qword_1EFEC8FE8 != -1)
    dispatch_once(&qword_1EFEC8FE8, &unk_1E987B6E0);
  return (OS_os_log *)(id)qword_1EFEC8FE0;
}

@end
