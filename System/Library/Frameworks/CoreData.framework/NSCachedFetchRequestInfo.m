@implementation NSCachedFetchRequestInfo

- (void)dealloc
{
  objc_super v3;

  self->_substVarBindOrdering = 0;
  self->_substIntarrayBindOrdering = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCachedFetchRequestInfo;
  -[NSCachedFetchRequestInfo dealloc](&v3, sel_dealloc);
}

@end
