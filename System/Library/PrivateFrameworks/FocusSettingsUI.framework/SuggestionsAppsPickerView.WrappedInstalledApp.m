@implementation SuggestionsAppsPickerView.WrappedInstalledApp

- (NSString)displayName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_215688A80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setDisplayName:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_215688AB0();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp_displayName);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp)init
{
  _TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp *result;

  result = (_TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
