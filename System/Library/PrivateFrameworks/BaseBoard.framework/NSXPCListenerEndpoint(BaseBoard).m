@implementation NSXPCListenerEndpoint(BaseBoard)

- (uint64_t)initWithXPCDictionary:()BaseBoard
{
  void *v2;
  uint64_t v3;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "initWithBSXPCCoder:", v2);

  return v3;
}

- (void)encodeWithXPCDictionary:()BaseBoard
{
  id v2;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeWithBSXPCCoder:");

}

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:()BaseBoard
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "_endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeXPCObject:forKey:", v4, CFSTR("endpt"));

}

- (id)initWithBSXPCCoder:()BaseBoard
{
  void *v4;
  id v5;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("endpt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
    objc_msgSend(v5, "_setEndpoint:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
