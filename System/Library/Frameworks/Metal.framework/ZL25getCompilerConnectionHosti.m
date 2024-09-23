@implementation ZL25getCompilerConnectionHosti

MTLCompilerConnectionManagerPrivate *___ZL25getCompilerConnectionHosti_block_invoke()
{
  MTLCompilerConnectionManagerPrivate *result;

  result = MTLCreateCompilerConnectionManager(32023);
  getCompilerConnectionHost(int)::gCompilerConnection = (uint64_t)result;
  return result;
}

MTLCompilerConnectionManagerPrivate *___ZL25getCompilerConnectionHosti_block_invoke_2()
{
  MTLCompilerConnectionManagerPrivate *result;

  result = MTLCreateCompilerConnectionManager(32024);
  getCompilerConnectionHost(int)::gCompilerConnection = (uint64_t)result;
  return result;
}

@end
