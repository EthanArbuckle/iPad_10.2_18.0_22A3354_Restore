@implementation MUViewContactActionRowItemViewModel

- (id)titleText
{
  return _MULocalizedStringFromThisBundle(CFSTR("Contacts [Placecard]"));
}

- (id)symbolName
{
  return CFSTR("person.fill");
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return (id)objc_msgSend(CFSTR("ActionRowItemType"), "stringByAppendingString:", CFSTR("Contacts"));
}

@end
