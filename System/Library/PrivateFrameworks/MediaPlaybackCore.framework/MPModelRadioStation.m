@implementation MPModelRadioStation

void __76__MPModelRadioStation_BehaviorMusicSharePlayAdditions__msp_shortDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR(" name='%@'"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertString:atIndex:", v4, objc_msgSend(*(id *)(a1 + 32), "length") - 1);

}

@end
