@implementation NSDictionary(IPDictionaryExtensions)

- (id)invertedDictionary
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
