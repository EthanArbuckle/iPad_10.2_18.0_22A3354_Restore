@implementation AVUnsupportedOutputURLPathExtensions

uint64_t __AVUnsupportedOutputURLPathExtensions_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("mp3"), CFSTR("m1a"), CFSTR("m2a"), CFSTR("aac"), CFSTR("adts"), CFSTR("gsm"), CFSTR("mpa"), 0);
  AVUnsupportedOutputURLPathExtensions_sUnsupportedExtensionList = result;
  return result;
}

@end
