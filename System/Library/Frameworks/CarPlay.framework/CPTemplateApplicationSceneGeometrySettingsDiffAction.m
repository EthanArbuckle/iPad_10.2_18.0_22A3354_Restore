@implementation CPTemplateApplicationSceneGeometrySettingsDiffAction

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsGeometryMutationDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsGeometryMutationDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsGeometryMutationDiffInspector = self->_sceneSettingsGeometryMutationDiffInspector;
  if (!sceneSettingsGeometryMutationDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsGeometryMutationDiffInspector;
    self->_sceneSettingsGeometryMutationDiffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeFrameWithBlock:](self->_sceneSettingsGeometryMutationDiffInspector, "observeFrameWithBlock:", &__block_literal_global_15);
    sceneSettingsGeometryMutationDiffInspector = self->_sceneSettingsGeometryMutationDiffInspector;
  }
  return sceneSettingsGeometryMutationDiffInspector;
}

void __98__CPTemplateApplicationSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v10 = a3;
  v14 = a5;
  v15 = a7;
  v11 = v14;
  v12 = v15;
  v13 = v10;
  _UISceneSettingsDiffActionPerformActionsWithDelayForTransitionContext();

}

uint64_t __166__CPTemplateApplicationSceneGeometrySettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned __int8 v4;

  v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "sceneSettingsGeometryMutationDiffInspector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inspectDiff:withContext:", *(_QWORD *)(a1 + 40), &v4);

  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneGeometryWithSettingObserverContext:windowScene:transitionContext:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_updateSceneGeometryWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v7 = v6;
  if (a3.var0)
  {
    v8 = v6;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();

  }
}

void __133__CPTemplateApplicationSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_allWindows");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_computeMetricsForWindows:animated:", v4, a2);

}

- (void)setSceneSettingsGeometryMutationDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsGeometryMutationDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsGeometryMutationDiffInspector, 0);
}

@end
