@implementation ARFileDescriptorIsTTY

void __ARFileDescriptorIsTTY_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("SSH_TTY"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  ARFileDescriptorIsTTY_isSSHTTY = v1 != 0;

}

@end
