@implementation ATXHeuristicsBundlePath

void __ATXHeuristicsBundlePath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A209D8]();
  objc_msgSend(MEMORY[0x24BE04108], "pathForResource:ofType:isDirectory:", CFSTR("Heuristics"), &stru_24D9B4B78, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)ATXHeuristicsBundlePath__pasExprOnceResult;
  ATXHeuristicsBundlePath__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
