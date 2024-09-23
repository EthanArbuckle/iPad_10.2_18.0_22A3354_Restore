@implementation BPSDefaultTitleTextAttributes

void __BPSDefaultTitleTextAttributes_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v0, "setLineBreakMode:", 4);
  objc_msgSend(v0, "setAlignment:", 1);
  objc_msgSend(v0, "setLineSpacing:", 0.0);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BDF6628];
  v5[0] = *MEMORY[0x24BDF65F8];
  v5[1] = v2;
  v6[0] = v1;
  v6[1] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)BPSDefaultTitleTextAttributes_sDefaultTitleTextAttributes;
  BPSDefaultTitleTextAttributes_sDefaultTitleTextAttributes = v3;

}

@end
