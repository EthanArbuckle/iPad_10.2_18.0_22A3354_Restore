@implementation NSUUID(BSCoding)

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:()BSCoding
{
  id v4;
  id v5;
  unsigned __int8 uuid[8];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1)
  {
    *(_QWORD *)uuid = 0;
    v7 = 0;
    objc_msgSend(a1, "getUUIDBytes:", uuid);
    a1 = xpc_uuid_create(uuid);
  }
  objc_msgSend(v4, "encodeXPCObject:forKey:", a1, CFSTR("uuid"), v4);

}

- (id)initWithBSXPCCoder:()BSCoding
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C813A0], CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(a1, "initWithUUIDBytes:", xpc_uuid_get_bytes(v4));
    a1 = v6;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

@end
