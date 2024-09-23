@implementation C2MetricProcessUUID

void __C2MetricProcessUUID_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)C2MetricProcessUUID_processUUIDString;
  C2MetricProcessUUID_processUUIDString = v0;

}

@end
