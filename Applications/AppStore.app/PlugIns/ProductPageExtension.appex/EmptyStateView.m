@implementation EmptyStateView

- (_TtC20ProductPageExtension14EmptyStateView)initWithFrame:(CGRect)a3
{
  id v4;
  char *v5;
  uint64_t ObjectType;

  v4 = objc_allocWithZone((Class)type metadata accessor for EmptyStateView(0));
  v5 = sub_1005D86E0(0, 0, 0, 0);
  ObjectType = swift_getObjectType();
  swift_deallocPartialClassInstance(self, ObjectType, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x34));
  return (_TtC20ProductPageExtension14EmptyStateView *)v5;
}

- (_TtC20ProductPageExtension14EmptyStateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005D96E8();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension14EmptyStateView *v2;

  v2 = self;
  sub_1005D8FA0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_divider));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_descriptionTextSpace;
  v4 = type metadata accessor for StaticDimension(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->divider[OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_title]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_titleLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->divider[OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_descriptionLabel));
}

@end
