@implementation BKSHIDEventVendorDefinedDescriptor

+ (id)descriptorWithPage:(unsigned int)a3 usage:(unsigned int)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithPage:usage:eventType:", *(_QWORD *)&a3, *(_QWORD *)&a4, 1);
}

- (BKSHIDEventVendorDefinedDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventVendorDefinedDescriptor;
  return (BKSHIDEventVendorDefinedDescriptor *)-[BKSHIDEventDescriptor _initWithEventType:](&v3, sel__initWithEventType_, 1);
}

@end
