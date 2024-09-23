@implementation CRSUIInstrumentClusterSettingsDiffAction

- (id)sceneSettingsGeometryMutationDiffInspector
{
  CRSUIInstrumentClusterSettingsDiffInspector *instrumentClusterSettingsDiffInspector;
  CRSUIInstrumentClusterSettingsDiffInspector *v4;
  CRSUIInstrumentClusterSettingsDiffInspector *v5;

  instrumentClusterSettingsDiffInspector = self->_instrumentClusterSettingsDiffInspector;
  if (!instrumentClusterSettingsDiffInspector)
  {
    v4 = (CRSUIInstrumentClusterSettingsDiffInspector *)objc_opt_new();
    v5 = self->_instrumentClusterSettingsDiffInspector;
    self->_instrumentClusterSettingsDiffInspector = v4;

    -[CRSUIInstrumentClusterSettingsDiffInspector observeShowETAWithBlock:](self->_instrumentClusterSettingsDiffInspector, "observeShowETAWithBlock:", &__block_literal_global_0);
    -[CRSUIInstrumentClusterSettingsDiffInspector observeShowCompassWithBlock:](self->_instrumentClusterSettingsDiffInspector, "observeShowCompassWithBlock:", &__block_literal_global_1);
    -[CRSUIInstrumentClusterSettingsDiffInspector observeShowSpeedLimitWithBlock:](self->_instrumentClusterSettingsDiffInspector, "observeShowSpeedLimitWithBlock:", &__block_literal_global_2);
    -[CRSUIInstrumentClusterSettingsDiffInspector observeItemTypeWithBlock:](self->_instrumentClusterSettingsDiffInspector, "observeItemTypeWithBlock:", &__block_literal_global_3);
    -[CRSUIInstrumentClusterSettingsDiffInspector observeItemTypeWithBlock:](self->_instrumentClusterSettingsDiffInspector, "observeItemTypeWithBlock:", &__block_literal_global_4);
    instrumentClusterSettingsDiffInspector = self->_instrumentClusterSettingsDiffInspector;
  }
  return instrumentClusterSettingsDiffInspector;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
  a2[3] = 1;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_2(uint64_t a1, _WORD *a2)
{
  *a2 = 257;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_3(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
  a2[2] = 1;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_4(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
  a2[4] = 1;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_5(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
  a2[5] = 1;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  __int16 v19;

  v11 = a3;
  v12 = a5;
  v13 = a7;
  v14 = v11;
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_2549E2908))
  {
    v15 = v14;
    v19 = 0;
    v18 = 0;
    -[CRSUIInstrumentClusterSettingsDiffAction sceneSettingsGeometryMutationDiffInspector](self, "sceneSettingsGeometryMutationDiffInspector");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inspectDiff:withContext:", v12, &v18);

    if ((_BYTE)v18)
    {
      v17 = v15;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContext();

    }
  }

}

uint64_t __154__CRSUIInstrumentClusterSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 41))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(*(id *)(v1 + 32), "updateSceneForNewCompassSetting");
  }
  if (*(_BYTE *)(v1 + 42))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(*(id *)(v1 + 32), "updateSceneForNewSpeedLimitSetting");
  }
  if (*(_BYTE *)(v1 + 44))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(*(id *)(v1 + 32), "updateSceneForNewItemTypeSetting");
  }
  if (*(_BYTE *)(v1 + 43))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(v1 + 32), "updateSceneForNewItemTypeSetting");
  }
  return result;
}

- (CRSUIInstrumentClusterSettingsDiffInspector)instrumentClusterSettingsDiffInspector
{
  return self->_instrumentClusterSettingsDiffInspector;
}

- (void)setInstrumentClusterSettingsDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentClusterSettingsDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentClusterSettingsDiffInspector, 0);
}

@end
