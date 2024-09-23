@implementation FocusSystemConfigurationDetailView.Coordinator

- (void)focusConfigurationViewController:(id)a3 configurationUIStateDidChange:(id)a4
{
  id v6;
  id v7;
  _TtCV15FocusSettingsUI34FocusSystemConfigurationDetailView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2154F55E4(v7);

}

- (void)focusConfigurationViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5
{
  void (*v6)(_QWORD, uint64_t, CGRect *);
  id v7;
  _TtCV15FocusSettingsUI34FocusSystemConfigurationDetailView11Coordinator *v8;
  CGRect v9;
  char v10;

  v6 = *(void (**)(_QWORD, uint64_t, CGRect *))((char *)&self->super.isa
                                                        + OBJC_IVAR____TtCV15FocusSettingsUI34FocusSystemConfigurationDetailView11Coordinator_updateConfigurationHandler);
  v9 = a5;
  v10 = 0;
  v7 = a3;
  v8 = self;
  v6(0, 2, &v9);

}

- (void).cxx_destruct
{
  swift_release();
}

@end
