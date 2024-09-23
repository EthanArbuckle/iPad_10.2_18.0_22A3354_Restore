@implementation SPLog

+ (BOOL)bootstrap
{
  if (qword_1002B8248 != -1)
    dispatch_once(&qword_1002B8248, &stru_10025FCF0);
  return 1;
}

@end
