@implementation WKNSURLAuthenticationChallenge

- (id)_web_createTarget
{
  Object *v2;
  id v3;
  const WebCore::AuthenticationChallenge *v4;

  v2 = -[WKObject _apiObject](self, "_apiObject");
  if ((_MergedGlobals_64 & 1) == 0)
  {
    qword_1ECE728E0 = 0;
    _MergedGlobals_64 = 1;
  }
  if (qword_1ECE728D8 != -1)
    dispatch_once(&qword_1ECE728D8, &__block_literal_global_18);
  v3 = objc_alloc(MEMORY[0x1E0C92C48]);
  return (id)objc_msgSend(v3, "initWithAuthenticationChallenge:sender:", WebCore::mac((WebCore *)&v2[1], v4), qword_1ECE728E0);
}

void __51__WKNSURLAuthenticationChallenge__web_createTarget__block_invoke()
{
  WKNSURLAuthenticationChallengeSender *v0;
  const void *v1;

  v0 = objc_alloc_init(WKNSURLAuthenticationChallengeSender);
  v1 = (const void *)qword_1ECE728E0;
  qword_1ECE728E0 = (uint64_t)v0;
  if (v1)
    CFRelease(v1);
}

@end
