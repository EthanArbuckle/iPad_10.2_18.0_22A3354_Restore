@implementation ICReindexer

+ (id)reindexer
{
  if (ICUseCoreDataCoreSpotlightIntegration())
    objc_msgSend(MEMORY[0x1E0D641B0], "sharedReindexer");
  else
    objc_msgSend(MEMORY[0x1E0D64258], "sharedIndexer");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
