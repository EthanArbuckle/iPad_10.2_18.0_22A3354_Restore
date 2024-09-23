@implementation GEORegisterPListStateCaptureLegacy

void __GEORegisterPListStateCaptureLegacy_block_invoke()
{
  uint64_t v0;
  void *v1;

  qword_1ECE24470 = 1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE24478;
  qword_1ECE24478 = v0;

}

@end
