@implementation CLSParentChildRelation

- (CLSParentChildRelation)initWithParentEntity:(Class)a3 childEntity:(Class)a4 faultable:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSParentChildRelation;
  return -[CLSRelation initWithFromEntity:toEntity:onFromKey:toKey:faultable:](&v6, sel_initWithFromEntity_toEntity_onFromKey_toKey_faultable_, a3, a4, CFSTR("objectID"), CFSTR("parentObjectID"), a5);
}

@end
