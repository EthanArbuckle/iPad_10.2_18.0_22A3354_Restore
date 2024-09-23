@implementation ASKPerformanceProfileGetForCurrentDevice

void __ASKPerformanceProfileGetForCurrentDevice_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v3;
  id v4;

  v4 = (id)MGGetStringAnswer();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(&unk_1E9E4B950, "containsObject:", v4) & 1) != 0
    || objc_msgSend(v1, "length") && (objc_msgSend(&unk_1E9E4B968, "containsObject:", v1) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v3 = objc_msgSend(&unk_1E9E4B980, "containsObject:", v4);
    v2 = 1;
    if (!v3)
      v2 = 2;
  }
  ASKPerformanceProfileGetForCurrentDevice_devicePerformanceProfile = v2;

}

@end
