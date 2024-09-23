@implementation SettingsDiffer

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC18ActivityUIServices14SettingsDiffer *v18;
  id v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    sub_22D83E1A4();
    v14 = a3;
    v15 = a4;
    v16 = a6;
    v17 = a7;
    v18 = self;
    v19 = a5;
    v21[0] = sub_22D84B784();
    -[FBSSettingsDiffInspector inspectDiff:withContext:](v18, sel_inspectDiff_withContext_, v19, v21);
    v20 = (void *)v21[0];

  }
}

- (_TtC18ActivityUIServices14SettingsDiffer)init
{
  uint64_t v3;
  _TtC18ActivityUIServices14SettingsDiffer *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC18ActivityUIServices14SettingsDiffer_subjects;
  v4 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_22D828A70(MEMORY[0x24BEE4AF8]);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SettingsDiffer();
  return -[FBSSceneSettingsDiffInspector init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
