@implementation QLRemoteItemTransformer

+ (id)allowedOutputClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  return a3;
}

- (id)transformedContentsFromSpotlightSearchableItemInfo:(id)a3 context:(id)a4 error:(id *)a5
{
  return a3;
}

@end
