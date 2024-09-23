@implementation NSMutableDictionary(ML3ArtworkAdditions)

- (uint64_t)mergeWithDictionary:()ML3ArtworkAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__NSMutableDictionary_ML3ArtworkAdditions__mergeWithDictionary___block_invoke;
  v4[3] = &unk_1E5B627F0;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

@end
