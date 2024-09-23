@implementation ActivityConfigurationManager.StateListener

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  void (*v5)(uint64_t);
  id v6;
  _TtCC15FocusSettingsUI28ActivityConfigurationManagerP33_2D32E0A4A8017E0B91C01818CA0AAB7813StateListener *v7;
  uint64_t v8;

  v5 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC15FocusSettingsUI28ActivityConfigurationManagerP33_2D32E0A4A8017E0B91C01818CA0AAB7813StateListener_stateDidChange);
  v6 = a3;
  v7 = self;
  v8 = swift_retain();
  v5(v8);

  swift_release();
}

- (_TtCC15FocusSettingsUI28ActivityConfigurationManagerP33_2D32E0A4A8017E0B91C01818CA0AAB7813StateListener)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC15FocusSettingsUI28ActivityConfigurationManagerP33_2D32E0A4A8017E0B91C01818CA0AAB7813StateListener_stateDidChange);
  *v2 = nullsub_1;
  v2[1] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivityConfigurationManager.StateListener();
  return -[ActivityConfigurationManager.StateListener init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
