@implementation NSSet(NSSetPortCoding)

- (id)replacementObjectForPortCoder:()NSSetPortCoding
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isByref"))
  {
    v6.receiver = a1;
    v6.super_class = (Class)NSSet_0;
    return objc_msgSendSuper2(&v6, sel_replacementObjectForPortCoder_, a3);
  }
  return a1;
}

@end
