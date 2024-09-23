@implementation FinHealthLogFacilities

void __FinHealthLogFacilities_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("FinHealthClient");
  v2[1] = CFSTR("FinHealthServer");
  v2[2] = CFSTR("FinHealthSQL");
  v2[3] = CFSTR("FinHealthCore");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FinHealthLogFacilities_logFacilities;
  FinHealthLogFacilities_logFacilities = v0;

}

@end
