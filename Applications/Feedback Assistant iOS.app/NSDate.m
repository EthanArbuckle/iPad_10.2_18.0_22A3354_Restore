@implementation NSDate

- (id)fba_toString
{
  if (qword_100117FD8 != -1)
    dispatch_once(&qword_100117FD8, &stru_1000E67B8);
  return objc_msgSend((id)qword_100117FD0, "stringFromDate:", self);
}

@end
