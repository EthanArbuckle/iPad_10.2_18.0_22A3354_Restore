@implementation NSString(ECHTMLEntityParser)

- (id)ec_parseHTMLEntity
{
  id v2;

  v2 = 0;
  parseEntity(a1, &v2);
  return v2;
}

- (uint64_t)ec_parseHTMLEntityCharacter
{
  return parseEntity(a1, 0);
}

@end
