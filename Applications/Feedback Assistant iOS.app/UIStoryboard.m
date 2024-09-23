@implementation UIStoryboard

+ (id)fbaMainStoryboard
{
  if (qword_100115E38 != -1)
    swift_once(&qword_100115E38, sub_10008850C);
  return (id)qword_100119F70;
}

@end
