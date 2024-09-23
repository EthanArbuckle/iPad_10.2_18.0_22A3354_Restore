@implementation AvailableAppsView.SearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  _TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator *v6;

  v5 = a3;
  v6 = self;
  sub_21551B3E8(v5);

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCACA0);
  sub_21568872C();
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DCACA0);
  sub_21568872C();
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v5;
  id v6;
  _TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator *v7;
  id v8;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_sharedApplication);
  objc_msgSend(v8, sel_sendAction_to_from_forEvent_, sel_resignFirstResponder, 0, 0, 0);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4;
  _TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21551B558();

  return self & 1;
}

- (_TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator)init
{
  _TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator *result;

  result = (_TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
