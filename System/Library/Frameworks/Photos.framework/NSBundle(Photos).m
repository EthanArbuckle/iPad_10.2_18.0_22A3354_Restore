@implementation NSBundle(Photos)

- (uint64_t)ph_isFirstPartyBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NSBundle_Photos__ph_isFirstPartyBundle__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = a1;
  if (ph_isFirstPartyBundle_onceToken != -1)
    dispatch_once(&ph_isFirstPartyBundle_onceToken, block);
  return ph_isFirstPartyBundle_isFirstPartyBundle;
}

@end
