@implementation ClimateQuickActionPopover

- (_TtC7Climate25ClimateQuickActionPopover)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001B43C();
}

- (void)didTapDeepLinkButton:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC7Climate25ClimateQuickActionPopover *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    v8 = self;
    sub_100046544();

    swift_unknownObjectRelease(v6);
  }
}

- (_TtC7Climate25ClimateQuickActionPopover)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7Climate25ClimateQuickActionPopover *result;

  v4 = a4;
  result = (_TtC7Climate25ClimateQuickActionPopover *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateQuickActionPopover", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_sourceView));
  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_climateZone, type metadata accessor for ClimateZone);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_contentView));
  sub_10001BF8C((uint64_t)self + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_popoverTapView));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  uint64_t Strong;
  uint64_t v9;
  id v10;
  id v11;
  _TtC7Climate25ClimateQuickActionPopover *v12;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_delegate);
  if (Strong)
  {
    v9 = Strong;
    v10 = a3;
    v11 = a4;
    v12 = self;
    sub_1000467DC(v12, 0);

    swift_unknownObjectRelease(v9);
  }
}

@end
