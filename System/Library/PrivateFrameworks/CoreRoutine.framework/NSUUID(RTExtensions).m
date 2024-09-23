@implementation NSUUID(RTExtensions)

+ (id)nilUUID
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = 0;
  v1[1] = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v1);
}

@end
