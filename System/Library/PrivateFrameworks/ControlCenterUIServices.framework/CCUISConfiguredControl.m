@implementation CCUISConfiguredControl

- (CHSControlIdentity)identity
{
  return (CHSControlIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CCUISConfiguredControl_identity));
}

- (unint64_t)type
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_type);
}

- (unint64_t)size
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_size);
}

- (CCUISConfiguredControl)initWithIdentity:(id)a3 type:(unint64_t)a4
{
  return -[CCUISConfiguredControl initWithIdentity:type:size:](self, sel_initWithIdentity_type_size_, a3, a4, 0);
}

- (CCUISConfiguredControl)initWithIdentity:(id)a3 type:(unint64_t)a4 size:(unint64_t)a5
{
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_identity) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_type) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISConfiguredControl_size) = (Class)a5;
  v7.receiver = self;
  v7.super_class = (Class)CCUISConfiguredControl;
  v5 = a3;
  return -[CCUISConfiguredControl init](&v7, sel_init);
}

- (NSString)description
{
  CCUISConfiguredControl *v2;
  void *v3;

  v2 = self;
  CCUISConfiguredControl.description.getter();

  v3 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CCUISConfiguredControl)init
{
  CCUISConfiguredControl *result;

  result = (CCUISConfiguredControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
