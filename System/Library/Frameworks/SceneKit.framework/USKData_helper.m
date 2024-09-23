@implementation USKData_helper

+ (id)dataWithToken:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)USKData_weak), "initWithToken:", a3);
}

+ (id)dataWithInt:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)USKData_weak), "initWithInt:", *(_QWORD *)&a3);
}

+ (id)dataWithDouble:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)USKData_weak), "initWithDouble:", a3);
}

+ (id)dataWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)USKData_weak), "initWithString:", a3);
}

@end
