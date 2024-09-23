@implementation LSDefaultsHasServer

const char *___LSDefaultsHasServer_block_invoke()
{
  const char *result;

  result = getenv("LS_NO_SERVER");
  if (result || (result = getenv("SCDontUseServer")) != 0 && (result = (const char *)atoi(result), (_DWORD)result))
    _LSDefaultsHasServer_hasServer = 1;
  return result;
}

@end
