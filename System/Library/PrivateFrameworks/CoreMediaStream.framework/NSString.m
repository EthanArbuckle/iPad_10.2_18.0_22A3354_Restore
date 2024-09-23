@implementation NSString

void __53__NSString_MSStringUtilities__MSTempFileOutFileName___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NSTemporaryDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("asset-XXXXXX"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MSTempFileOutFileName__formatString;
  MSTempFileOutFileName__formatString = v0;

}

@end
