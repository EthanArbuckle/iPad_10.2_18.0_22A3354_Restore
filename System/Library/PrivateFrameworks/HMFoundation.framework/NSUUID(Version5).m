@implementation NSUUID(Version5)

+ (id)hmf_UUIDWithNamespace:()Version5 data:salts:
{
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  __NSUUIDCreateUUIDVersion5((uint64_t)v7, a3, a4, a5);
  return (id)objc_msgSend([a1 alloc], "initWithUUIDBytes:", v7);
}

+ (uint64_t)hmf_UUIDWithNamespace:()Version5 data:
{
  return objc_msgSend(a1, "hmf_UUIDWithNamespace:data:salts:", a3, a4, 0);
}

- (id)initWithNamespace:()Version5 data:
{
  id v5;
  _QWORD v7[3];

  v5 = 0;
  v7[2] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v7[0] = 0;
    v7[1] = 0;
    __NSUUIDCreateUUIDVersion5((uint64_t)v7, a3, a4, 0);
    a1 = (id)objc_msgSend(a1, "initWithUUIDBytes:", v7);
    v5 = a1;
  }

  return v5;
}

@end
