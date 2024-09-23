@implementation BWNodeEndOfDataMessage

+ (id)newMessage
{
  id result;
  objc_super v3;

  result = [BWNodeEndOfDataMessage alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)BWNodeEndOfDataMessage;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      *((_QWORD *)result + 1) = 0x400000001;
  }
  return result;
}

@end
