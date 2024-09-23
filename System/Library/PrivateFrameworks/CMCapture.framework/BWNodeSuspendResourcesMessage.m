@implementation BWNodeSuspendResourcesMessage

+ (id)newMessage
{
  id result;
  objc_super v3;

  result = [BWNodeSuspendResourcesMessage alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)BWNodeSuspendResourcesMessage;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      *((_QWORD *)result + 1) = 0x800000001;
  }
  return result;
}

@end
