@implementation FocusStatusSettingsManager

- (void)dealloc
{
  _TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager *v3;
  objc_super v4;

  if (*((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager_isListeningToModeConfigurationService) == 1)
    objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager_modeConfigurationService), sel_removeListener_, self);
  else
    v3 = self;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FocusStatusSettingsManager();
  -[FocusStatusSettingsManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager_modeConfigurationService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager_globalConfigurationService));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager)init
{
  _TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager *result;

  result = (_TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  id v5;
  _TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager *v6;

  v5 = a3;
  v6 = self;
  sub_21560BADC();

}

@end
