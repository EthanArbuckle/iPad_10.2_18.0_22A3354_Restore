@implementation SGPaths

+ (id)topDirectoryCreateIfNeeded:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__SGPaths_topDirectoryCreateIfNeeded___block_invoke;
  v4[3] = &__block_descriptor_41_e5_v8__0l;
  v4[4] = a1;
  v5 = a3;
  if (topDirectoryCreateIfNeeded___pasOnceToken2 != -1)
    dispatch_once(&topDirectoryCreateIfNeeded___pasOnceToken2, v4);
  return (id)topDirectoryCreateIfNeeded___pasExprOnceResult;
}

+ (id)suggestionsDirectoryFile:(id)a3
{
  return (id)objc_msgSend(a1, "filename:createIfNeeded:", a3, 1);
}

+ (id)suggestionsSubdirectory:(id)a3
{
  return (id)objc_msgSend(a1, "subdirectory:createIfNeeded:", a3, 1);
}

void __38__SGPaths_topDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "topDirectoryWithName:createIfNeeded:", CFSTR("Suggestions"), *(unsigned __int8 *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)topDirectoryCreateIfNeeded___pasExprOnceResult;
  topDirectoryCreateIfNeeded___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

@end
