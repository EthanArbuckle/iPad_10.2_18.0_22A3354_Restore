@implementation ConsumeSandboxExtensions

void __ConsumeSandboxExtensions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  objc_msgSend(a3, "objectForKey:", CFSTR("data"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  RecordSandboxExtension(v4, v5);

}

@end
