@implementation _EXRunningLibXPCServiceExtension

- (_EXRunningLibXPCServiceExtension)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____EXRunningLibXPCServiceExtension____lazy_storage____extensionIdentity) = 0;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXRunningLibXPCServiceExtension_connectionHandler);
  v4 = (objc_class *)type metadata accessor for _EXRunningLibXPCServiceExtension();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[_EXRunningLibXPCServiceExtension init](&v6, sel_init);
}

- (void)resume
{
  _EXRunningLibXPCServiceExtension *v2;

  v2 = self;
  sub_190C2F720();
}

- (int)_startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4;
  _EXRunningLibXPCServiceExtension *v6;

  v4 = *(_QWORD *)&a4;
  v6 = self;
  LODWORD(v4) = sub_190C2FB6C((uint64_t)a3, v4);

  return v4;
}

- (_EXExtensionIdentity)extensionIdentity
{
  _EXRunningLibXPCServiceExtension *v2;
  id v3;

  v2 = self;
  v3 = sub_190C96484();

  return (_EXExtensionIdentity *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____EXRunningLibXPCServiceExtension____lazy_storage____extensionIdentity));
  sub_190C2FC70(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____EXRunningLibXPCServiceExtension_connectionHandler));
}

@end
