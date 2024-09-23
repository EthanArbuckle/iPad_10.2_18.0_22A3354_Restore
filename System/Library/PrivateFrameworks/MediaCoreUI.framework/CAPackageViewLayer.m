@implementation CAPackageViewLayer

- (void)layoutSublayers
{
  _TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer *v2;

  v2 = self;
  sub_2412D5FF8();

}

- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_packageLayer) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_foregroundColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return -[CAPackageViewLayer init](&v3, sel_init);
}

- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)initWithLayer:(id)a3
{
  uint64_t v4;
  _TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer *v5;
  objc_super v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  sub_2414B544C();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_packageLayer) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_foregroundColor) = 0;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v4 = sub_2414B57C4();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  v5 = -[CAPackageViewLayer initWithLayer:](&v7, sel_initWithLayer_, v4);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_packageLayer) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_foregroundColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return -[CAPackageViewLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_packageLayer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_foregroundColor));
}

@end
