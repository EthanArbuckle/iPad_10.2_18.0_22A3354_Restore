@implementation ClimateOnButton

- (_TtC7Climate15ClimateOnButton)init
{
  return (_TtC7Climate15ClimateOnButton *)sub_100066DF8();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate15ClimateOnButton_highlightedBackgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate15ClimateOnButton_onColor);
  v4 = *(void **)&self->super.action[OBJC_IVAR____TtC7Climate15ClimateOnButton_onColor];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.action[OBJC_IVAR____TtC7Climate15ClimateOnButton_onColor + 8]);

  v5 = (char *)self + OBJC_IVAR____TtC7Climate15ClimateOnButton_offColor;
  v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate15ClimateOnButton_offColor);
  v7 = *(void **)&self->super.action[OBJC_IVAR____TtC7Climate15ClimateOnButton_offColor];
  v8 = v6;
  swift_bridgeObjectRelease(*((_QWORD *)v5 + 2));

}

@end
