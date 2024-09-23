@implementation NPKTrackPassIngestionType

id __NPKTrackPassIngestionType_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("ingestionType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
