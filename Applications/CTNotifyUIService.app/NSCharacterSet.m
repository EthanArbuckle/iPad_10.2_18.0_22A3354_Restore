@implementation NSCharacterSet

+ (id)phonePadCharacterSet
{
  if (qword_10001CCD8 != -1)
    dispatch_once(&qword_10001CCD8, &stru_100014410);
  return (id)qword_10001CCD0;
}

@end
