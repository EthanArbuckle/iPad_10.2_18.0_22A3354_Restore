@implementation ZN2NL8CFLogger14sharedInstanceEv

NL::CFLogger *___ZN2NL8CFLogger14sharedInstanceEv_block_invoke()
{
  NL::CFLogger *v0;
  NL::CFLogger *result;

  v0 = (NL::CFLogger *)operator new();
  result = NL::CFLogger::CFLogger(v0);
  NL::CFLogger::sharedInstance(void)::instance = (uint64_t)v0;
  return result;
}

@end
