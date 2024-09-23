@implementation OS_ldap_operation

- (void)dealloc
{
  objc_super v3;

  ldap_operation_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_ldap_operation;
  -[OS_ldap_operation dealloc](&v3, sel_dealloc);
}

@end
