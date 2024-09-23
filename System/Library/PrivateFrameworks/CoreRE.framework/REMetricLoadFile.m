@implementation REMetricLoadFile

id __REMetricLoadFile_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = *(_QWORD *)(a1 + 32);
  v6[0] = CFSTR("callsite");
  v6[1] = CFSTR("isAppleModelViewerApp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = CFSTR("type");
  v3 = *(_QWORD *)(a1 + 40);
  v7[1] = v2;
  v7[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
