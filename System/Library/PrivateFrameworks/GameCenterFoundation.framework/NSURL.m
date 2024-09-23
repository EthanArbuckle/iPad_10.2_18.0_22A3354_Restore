@implementation NSURL

void __41__NSURL_GKAdditions___gkIsValidServerURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("http"), CFSTR("https"), 0);
  v1 = (void *)_gkIsValidServerURL_sValidSchemes;
  _gkIsValidServerURL_sValidSchemes = v0;

}

@end
