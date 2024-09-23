@implementation CPLSharedSimplePropertyMapping

- (BOOL)shouldUpdatePropertyOnPrivateRecord:(id)a3 recordClass:(Class)a4
{
  return 0;
}

- (BOOL)shouldUpdatePropertyOnSharedRecord:(id)a3 recordClass:(Class)a4
{
  return 1;
}

@end
