@implementation CLSChildParentRelation

- (CLSChildParentRelation)initWithChildEntity:(Class)a3 parentEntity:(Class)a4 faultable:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSChildParentRelation;
  return -[CLSRelation initWithFromEntity:toEntity:onFromKey:toKey:faultable:](&v6, sel_initWithFromEntity_toEntity_onFromKey_toKey_faultable_, a3, a4, CFSTR("parentObjectID"), CFSTR("objectID"), a5);
}

@end
