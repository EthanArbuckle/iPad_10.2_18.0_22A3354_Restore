@implementation FBALog

+ (id)debug
{
  if (qword_100118068 != -1)
    dispatch_once(&qword_100118068, &stru_1000E6E88);
  return (id)qword_100118060;
}

+ (id)upload
{
  if (qword_100118078 != -1)
    dispatch_once(&qword_100118078, &stru_1000E6EA8);
  return (id)qword_100118070;
}

+ (id)model
{
  if (qword_100118088 != -1)
    dispatch_once(&qword_100118088, &stru_1000E6EC8);
  return (id)qword_100118080;
}

+ (id)ffu
{
  if (qword_100118098 != -1)
    dispatch_once(&qword_100118098, &stru_1000E6EE8);
  return (id)qword_100118090;
}

+ (id)clientHandle
{
  if (qword_1001180A8 != -1)
    dispatch_once(&qword_1001180A8, &stru_1000E6F08);
  return (id)qword_1001180A0;
}

+ (id)net
{
  if (qword_1001180B8 != -1)
    dispatch_once(&qword_1001180B8, &stru_1000E6F28);
  return (id)qword_1001180B0;
}

+ (id)appHandle
{
  if (qword_1001180C8 != -1)
    dispatch_once(&qword_1001180C8, &stru_1000E6F48);
  return (id)qword_1001180C0;
}

+ (id)attachHandle
{
  if (qword_1001180D8 != -1)
    dispatch_once(&qword_1001180D8, &stru_1000E6F68);
  return (id)qword_1001180D0;
}

+ (id)reachability
{
  if (qword_1001180E8 != -1)
    dispatch_once(&qword_1001180E8, &stru_1000E6F88);
  return (id)qword_1001180E0;
}

+ (id)ded
{
  if (qword_1001180F8 != -1)
    dispatch_once(&qword_1001180F8, &stru_1000E6FA8);
  return (id)qword_1001180F0;
}

+ (id)newURLActionActivity
{
  os_activity_t v2;
  void *v3;

  v2 = _os_activity_create((void *)&_mh_execute_header, "Starting feedback via ULR scheme", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v3 = (void *)qword_100119EE0;
  qword_100119EE0 = (uint64_t)v2;

  return (id)qword_100119EE0;
}

+ (id)currentURLActionActivity
{
  if (qword_100119EE0)
    return objc_msgSend(a1, "newURLActionActivity");
  else
    return 0;
}

@end
