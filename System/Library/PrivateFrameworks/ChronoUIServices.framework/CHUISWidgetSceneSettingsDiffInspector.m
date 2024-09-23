@implementation CHUISWidgetSceneSettingsDiffInspector

- (void)inspectDiff:(id)a3 withContext:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHUISWidgetSceneSettingsDiffInspector;
  -[FBSSettingsDiffInspector inspectDiff:withContext:](&v4, sel_inspectDiff_withContext_, a3, a4);
}

- (void)observeWidgetWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88888, a3);
}

- (void)observeMetricsWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88889, a3);
}

- (void)observeWidgetConfigurationIdentifierBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88890, a3);
}

- (void)observeVisibilityWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88891, a3);
}

- (void)observeContentTypeWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88892, a3);
}

- (void)observeAnimationsPausedWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88894, a3);
}

- (void)observeContentPausedWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88904, a3);
}

- (void)observeVisibleEntryShouldSnapshotWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88895, a3);
}

- (void)observeCanAppearInSecureEnvironmentWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88897, a3);
}

- (void)observeKeybagLockPolicyWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88910, a3);
}

- (void)observePrefersUnredactedContentInLowLuminanceEnvironmentWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88903, a3);
}

- (void)observeSupportsLowLuminanceWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88902, a3);
}

- (void)observeTintingParametersWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88898, a3);
}

- (void)observeInlineTextParametersWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88899, a3);
}

- (void)observeColorSchemeWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88893, a3);
}

- (void)observeShowsWidgetLabelWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88905, a3);
}

- (void)observeWidgetPriorityWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88906, a3);
}

- (void)observeInteractionDisabledWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88907, a3);
}

- (void)observeRenderSchemeWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88908, a3);
}

- (void)observeClipBehaviorWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88909, a3);
}

- (void)observeWantsBaseContentTouchEventsWithBlock:(id)a3
{
  -[CHUISWidgetSceneSettingsDiffInspector _observerForKey:observer:](self, "_observerForKey:observer:", 88911, a3);
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
    v8[2] = __66__CHUISWidgetSceneSettingsDiffInspector__observerForKey_observer___block_invoke;
    v8[3] = &unk_1E6B84A38;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

uint64_t __66__CHUISWidgetSceneSettingsDiffInspector__observerForKey_observer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
