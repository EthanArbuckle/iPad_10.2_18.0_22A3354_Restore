@implementation CHUISWatchComplicationsWidgetSceneSettingsDiffInspector

- (void)observeCornerPositionWithBlock:(id)a3
{
  -[CHUISWatchComplicationsWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 89888, a3);
}

- (void)observeCurvedLabelMetricsWithBlock:(id)a3
{
  -[CHUISWatchComplicationsWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 89889, a3);
}

- (void)observeBezelContentCenterWithBlock:(id)a3
{
  -[CHUISWatchComplicationsWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 89890, a3);
}

- (void)observeIncludeAccessoryViewsWithBlock:(id)a3
{
  -[CHUISWatchComplicationsWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 89891, a3);
}

- (void)observeGenerateSnapshotMetadataWithBlock:(id)a3
{
  -[CHUISWatchComplicationsWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 89892, a3);
}

- (void)_observerForKey:(int64_t)a3 observer:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__CHUISWatchComplicationsWidgetSceneSettingsDiffInspector__observerForKey_observer___block_invoke;
    v8[3] = &unk_1E6B84A38;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

uint64_t __84__CHUISWatchComplicationsWidgetSceneSettingsDiffInspector__observerForKey_observer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
