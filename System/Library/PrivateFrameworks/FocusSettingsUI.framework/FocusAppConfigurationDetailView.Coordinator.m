@implementation FocusAppConfigurationDetailView.Coordinator

- (void)focusConfigurationViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5
{
  void (*v6)(_QWORD, CGRect *);
  id v7;
  _TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator *v8;
  CGRect v9;
  char v10;

  v6 = *(void (**)(_QWORD, CGRect *))((char *)&self->super.isa
                                               + OBJC_IVAR____TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator_updateConfigurationHandler);
  v9 = a5;
  v10 = 0;
  v7 = a3;
  v8 = self;
  v6(0, &v9);

}

- (void)focusConfigurationViewController:(id)a3 configurationUIStateDidChange:(id)a4
{
  void (*v6)(id, _OWORD *);
  id v7;
  id v8;
  _TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator *v9;
  _OWORD v10[2];
  char v11;

  v6 = *(void (**)(id, _OWORD *))((char *)&self->super.isa
                                           + OBJC_IVAR____TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator_updateConfigurationHandler);
  memset(v10, 0, sizeof(v10));
  v11 = 1;
  v7 = a3;
  v8 = a4;
  v9 = self;
  v6(a4, v10);

}

- (_TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator)init
{
  _TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator *result;

  result = (_TtCV15FocusSettingsUI31FocusAppConfigurationDetailView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
