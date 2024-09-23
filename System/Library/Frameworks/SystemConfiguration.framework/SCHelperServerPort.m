@implementation SCHelperServerPort

void ____SCHelperServerPort_block_invoke()
{
  __SCHelperServerPort_sb_type = 2;
  if (_SC_isAppleInternal_once_4 != -1)
    dispatch_once(&_SC_isAppleInternal_once_4, &__block_literal_global_5);
  if (!_SC_isAppleInternal_isInternal_4)
    __SCHelperServerPort_sb_type |= *MEMORY[0x1E0C806B0];
}

@end
