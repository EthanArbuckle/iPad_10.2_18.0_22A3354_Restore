@implementation FBSOpenApplicationOptionsClass

uint64_t ____FBSOpenApplicationOptionsClass_block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("FBSOpenApplicationOptions"), CFSTR("FrontBoardServices"));
  __FBSOpenApplicationOptionsClass__optionsClass = result;
  return result;
}

@end
