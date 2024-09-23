@implementation SceneSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  _TtC16SharingUIService23SceneSettingsDiffAction *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;

  if (a3)
  {
    v13 = self;
    v14 = a3;
    v15 = a4;
    v16 = a5;
    v22 = a6;
    v17 = a7;
    v18 = objc_msgSend(v14, "delegate");
    if (v18)
    {
      v20 = v18;
      v21 = type metadata accessor for SceneDelegate(0, v19);
      if (swift_dynamicCastClass(v20, v21))
        sub_1000173DC(v14);

      swift_unknownObjectRelease(v20);
    }
    else
    {

    }
  }
  else
  {
    __break(1u);
  }
}

- (_TtC16SharingUIService23SceneSettingsDiffAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneSettingsDiffAction((uint64_t)self, (uint64_t)a2);
  return -[SceneSettingsDiffAction init](&v3, "init");
}

@end
