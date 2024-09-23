@implementation BPSArchivedDevices

BOOL __BPSArchivedDevices_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "valueForProperty:", *MEMORY[0x24BE6B348]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue") != 0;

  return v3;
}

@end
