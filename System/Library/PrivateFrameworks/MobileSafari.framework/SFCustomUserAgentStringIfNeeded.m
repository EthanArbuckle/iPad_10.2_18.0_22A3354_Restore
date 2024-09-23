@implementation SFCustomUserAgentStringIfNeeded

void ___SFCustomUserAgentStringIfNeeded_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("UserAgent"));
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)_SFCustomUserAgentStringIfNeeded::customUserAgentString;
  _SFCustomUserAgentStringIfNeeded::customUserAgentString = v1;

}

@end
