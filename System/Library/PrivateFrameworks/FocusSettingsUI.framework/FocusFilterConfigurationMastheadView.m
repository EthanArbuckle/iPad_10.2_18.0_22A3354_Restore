@implementation FocusFilterConfigurationMastheadView

- (NSString)bundleIdentifier
{
  return (NSString *)sub_2155F739C();
}

- (NSString)title
{
  return (NSString *)sub_2155F739C();
}

- (NSString)subtitle
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView_subtitle))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_215688A80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithBundleIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView *result;

  v6 = sub_215688AB0();
  v8 = v7;
  v9 = sub_215688AB0();
  v11 = v10;
  if (a5)
  {
    v12 = sub_215688AB0();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  FocusFilterConfigurationMastheadView.init(bundleIdentifier:title:subtitle:)(v6, v8, v9, v11, v12, v14);
  return result;
}

- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithCoder:(id)a3
{
  id v4;
  _TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView_rootView) = 0;
  v4 = a3;

  result = (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView *)sub_215688FC0();
  __break(1u);
  return result;
}

- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithFrame:(CGRect)a3
{
  _TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView *result;

  result = (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView_rootView));
}

@end
