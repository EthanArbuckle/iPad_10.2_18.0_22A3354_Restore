@implementation FocusFilterSystemConfigurationMastheadView

- (NSString)title
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_215688A80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)symbolName
{
  return (NSString *)sub_21551C2E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_symbolName);
}

- (NSString)subtitle
{
  return (NSString *)sub_21551C2E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_subtitle);
}

- (UIColor)color
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_color));
}

- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithTitle:(id)a3 subtitle:(id)a4 symbolName:(id)a5 color:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView *result;

  v9 = sub_215688AB0();
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  a4 = (id)sub_215688AB0();
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  a5 = (id)sub_215688AB0();
  v15 = v14;
LABEL_6:
  v16 = a6;
  FocusFilterSystemConfigurationMastheadView.init(title:subtitle:symbolName:color:)(v9, v11, (uint64_t)a4, v13, (uint64_t)a5, v15, a6);
  return result;
}

- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithCoder:(id)a3
{
  id v4;
  _TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_rootView) = 0;
  v4 = a3;

  result = (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView *)sub_215688FC0();
  __break(1u);
  return result;
}

- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithFrame:(CGRect)a3
{
  _TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView *result;

  result = (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_color));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_rootView));
}

@end
