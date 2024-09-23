@implementation RegisterGmailAuthSchemes

uint64_t __RegisterGmailAuthSchemes_block_invoke()
{
  objc_msgSend(MEMORY[0x1E0D1E688], "registerSchemeClass:", objc_opt_class());
  return objc_msgSend(MEMORY[0x1E0D1E688], "registerSchemeClass:", objc_opt_class());
}

@end
