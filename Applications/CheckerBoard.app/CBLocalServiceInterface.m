@implementation CBLocalServiceInterface

+ (id)clientInterface
{
  if (qword_10008BD48 != -1)
    dispatch_once(&qword_10008BD48, &stru_100075D20);
  return (id)qword_10008BD50;
}

+ (id)serverInterface
{
  if (qword_10008BD58 != -1)
    dispatch_once(&qword_10008BD58, &stru_100075D40);
  return (id)qword_10008BD60;
}

@end
