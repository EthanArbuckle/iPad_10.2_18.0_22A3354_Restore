@implementation NSString(EncodedWord)

- (id)sg_stringWithDecodedEncodedWords
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "sg_decodeEncodedWords");
  return v1;
}

@end
