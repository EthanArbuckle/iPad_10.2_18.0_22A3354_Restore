@implementation GPAppCapabilities

- (BOOL)supportsSharePlay
{
  GPAppCapabilities *v2;
  char v3;

  v2 = self;
  v3 = AppCapabilities.supportsSharePlay.getter();

  return v3 & 1;
}

- (void)setSupportsSharePlay:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsSharePlay) = a3;
}

- (BOOL)supportsStartFromApp
{
  GPAppCapabilities *v2;
  char v3;

  v2 = self;
  v3 = AppCapabilities.supportsStartFromApp.getter();

  return v3 & 1;
}

- (void)setSupportsStartFromApp:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsStartFromApp) = a3;
}

- (GPAppCapabilities)initWithAuditToken:(id *)a3
{
  return (GPAppCapabilities *)AppCapabilities.init(auditToken:)(*(_QWORD *)a3->var0, *(_QWORD *)&a3->var0[2], *(_QWORD *)&a3->var0[4], *(_QWORD *)&a3->var0[6]);
}

- (GPAppCapabilities)init
{
  GPAppCapabilities *result;

  result = (GPAppCapabilities *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver));
}

@end
