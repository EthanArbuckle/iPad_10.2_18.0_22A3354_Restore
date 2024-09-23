@implementation NSString(IKEncoding)

- (uint64_t)ik_URLEncodedString
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("!*'();:@&=+$,/?%#[]")),
             "invertedSet"));
}

@end
