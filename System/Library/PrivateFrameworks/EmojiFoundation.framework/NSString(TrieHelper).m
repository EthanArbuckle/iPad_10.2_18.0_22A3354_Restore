@implementation NSString(TrieHelper)

- (id)getLowercaseCharacterAt:()TrieHelper locale:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "substringWithRange:", a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseStringWithLocale:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
