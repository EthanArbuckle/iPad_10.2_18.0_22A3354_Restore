@implementation OSLogHandleManager

+ (id)sharedInstance
{
  if (qword_1ECD91040 != -1)
    dispatch_once(&qword_1ECD91040, &unk_1E2C43028);
  return (id)qword_1ECD90FF0;
}

@end
