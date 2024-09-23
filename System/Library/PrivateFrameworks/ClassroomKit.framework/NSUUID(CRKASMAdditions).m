@implementation NSUUID(CRKASMAdditions)

+ (id)crk_UUIDWithOpaqueString:()CRKASMAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "crk_UUIDWithOpaqueData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)crk_UUIDWithOpaqueData:()CRKASMAdditions
{
  id v4;
  const void *v5;
  CC_LONG v6;
  unsigned __int8 md[32];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  CC_SHA256(v5, v6, md);
  objc_msgSend(a1, "crk_condense32BytesIntoFirst16Bytes:", md);
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUUIDBytes:", md);
}

+ (int8x16_t)crk_condense32BytesIntoFirst16Bytes:()CRKASMAdditions
{
  int8x16_t result;

  result = veorq_s8(a3[1], *a3);
  *a3 = result;
  return result;
}

@end
