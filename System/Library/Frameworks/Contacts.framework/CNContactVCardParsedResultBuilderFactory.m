@implementation CNContactVCardParsedResultBuilderFactory

- (id)makeBuilder
{
  return objc_alloc_init(CNContactVCardParsedResultBuilder);
}

@end
