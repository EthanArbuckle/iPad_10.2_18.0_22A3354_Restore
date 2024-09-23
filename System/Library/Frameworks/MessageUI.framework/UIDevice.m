@implementation UIDevice

void __31__UIDevice_MessageUI__mf_isPad__block_invoke()
{
  void *v0;
  unint64_t v1;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  v3 = v1 > 3 || (v1 & 0xF) == 1;
  mf_isPad_isPad = v3;
}

@end
