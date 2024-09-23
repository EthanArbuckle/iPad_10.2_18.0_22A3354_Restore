@implementation NWConcrete_nw_authentication_protection_space

- (void)dealloc
{
  char *realm;
  objc_super v4;

  realm = self->realm;
  if (realm)
  {
    free(realm);
    self->realm = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_authentication_protection_space;
  -[NWConcrete_nw_authentication_protection_space dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->endpoint, 0);
}

@end
