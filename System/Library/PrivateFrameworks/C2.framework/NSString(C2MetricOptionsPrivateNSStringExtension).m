@implementation NSString(C2MetricOptionsPrivateNSStringExtension)

- (int8x8_t)c2UniformlyDistributedIdentifier
{
  void *v1;
  void *v2;
  int8x16_t v3;
  int8x16_t v5;
  int8x16_t v6;
  unsigned __int8 md[16];
  int8x16_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)md = 0u;
  v8 = 0u;
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    -[NSString(C2MetricOptionsPrivateNSStringExtension) c2UniformlyDistributedIdentifier].cold.1();
  v2 = v1;
  if (!objc_msgSend(v1, "length"))
    -[NSString(C2MetricOptionsPrivateNSStringExtension) c2UniformlyDistributedIdentifier].cold.2();
  CC_SHA256((const void *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"), md);
  v5 = *(int8x16_t *)md;
  v6 = v8;

  v3 = veorq_s8(v5, v6);
  return veor_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
}

- (void)c2UniformlyDistributedIdentifier
{
  __assert_rtn("-[NSString(C2MetricOptionsPrivateNSStringExtension) c2UniformlyDistributedIdentifier]", "C2MetricOptions.m", 18, "stringData.length && \"Hashing empty byte array strictly forbidden.\");
}

@end
