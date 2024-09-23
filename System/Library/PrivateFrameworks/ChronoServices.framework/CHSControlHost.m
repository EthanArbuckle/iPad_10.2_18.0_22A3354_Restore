@implementation CHSControlHost

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CHSControlConfiguration)configuration
{
  return (CHSControlConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___CHSControlHost_configuration));
}

- (void)setConfiguration:(id)a3
{
  void *v4;
  CHSControlHost *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlHost_configuration);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlHost_configuration) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_18FB6CD40(v4);

}

- (BOOL)isActive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSControlHost__activationState);
}

- (CHSControlHost)initWithIdentifier:(id)a3
{
  void *v4;
  CHSControlHost *v5;

  sub_18FBCD0DC();
  v4 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  v5 = -[CHSControlHost initWithIdentifier:configuration:](self, sel_initWithIdentifier_configuration_, v4, 0);

  return v5;
}

- (CHSControlHost)initWithIdentifier:(id)a3 configuration:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = sub_18FBCD0DC();
  v7 = v6;
  v8 = a4;
  return (CHSControlHost *)CHSControlHost.init(identifier:configuration:)(v5, v7, a4);
}

- (void)dealloc
{
  CHSControlHost *v2;
  objc_super v3;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___CHSControlHost__invalid) == 1)
  {
    v3.receiver = self;
    v3.super_class = (Class)CHSControlHost;
    v2 = self;
    -[CHSControlHost dealloc](&v3, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CHSControlHost__serverConnection);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)activate
{
  CHSControlHost *v2;

  v2 = self;
  CHSControlHost.activate()();

}

- (void)deactivate
{
  CHSControlHost *v2;

  v2 = self;
  CHSControlHost.deactivate()();

}

- (void)invalidate
{
  CHSControlHost *v2;

  v2 = self;
  CHSControlHost.invalidate()();

}

- (NSString)description
{
  CHSControlHost *v2;
  void *v3;

  v2 = self;
  CHSControlHost.description.getter();

  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CHSControlHost)init
{
  CHSControlHost *result;

  result = (CHSControlHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
