@implementation BPSDefaultDetailTextAttributes

void __BPSDefaultDetailTextAttributes_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v0, "setLineBreakMode:", 4);
  objc_msgSend(v0, "setAlignment:", 1);
  v4[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = *MEMORY[0x24BDF6628];
  v5[0] = v1;
  v5[1] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)BPSDefaultDetailTextAttributes_sDefaultDetailTextAttributes;
  BPSDefaultDetailTextAttributes_sDefaultDetailTextAttributes = v2;

}

@end
