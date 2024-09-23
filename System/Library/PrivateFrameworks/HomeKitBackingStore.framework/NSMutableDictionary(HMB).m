@implementation NSMutableDictionary(HMB)

+ (id)hmbDictionaryFromOPACKData:()HMB error:
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "hmbDictionaryFromOPACKData:error:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  return v1;
}

@end
