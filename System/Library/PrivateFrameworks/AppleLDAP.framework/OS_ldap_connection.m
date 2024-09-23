@implementation OS_ldap_connection

- (void)dealloc
{
  objc_super v3;

  ldap_connection_dispose(&self->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)OS_ldap_connection;
  -[OS_ldap_connection dealloc](&v3, sel_dealloc);
}

@end
