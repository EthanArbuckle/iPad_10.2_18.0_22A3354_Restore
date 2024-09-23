@implementation RegisterHotmailAuthSchemes

uint64_t __RegisterHotmailAuthSchemes_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D1E688], "registerSchemeClass:", objc_opt_class());
}

@end
