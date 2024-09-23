@implementation BLSBacklightSceneSettingsDiffInspector

- ($A4FF59F43F4B20644E55A5E6B3BB4A05)inspectDiff:(id)a3
{
  unsigned __int8 v4;

  v4 = 0;
  -[FBSSettingsDiffInspector inspectDiff:withContext:](self, "inspectDiff:withContext:", a3, &v4);
  return ($A4FF59F43F4B20644E55A5E6B3BB4A05)v4;
}

- (BLSBacklightSceneSettingsDiffInspector)init
{
  BLSBacklightSceneSettingsDiffInspector *v2;
  BLSBacklightSceneSettingsDiffInspector *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLSBacklightSceneSettingsDiffInspector;
  v2 = -[FBSSceneSettingsDiffInspector init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](v2, "observeOtherSetting:withBlock:", 200000, &__block_literal_global_15);
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](v3, "observeOtherSetting:withBlock:", 200001, &__block_literal_global_1);
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](v3, "observeOtherSetting:withBlock:", 200002, &__block_literal_global_2);
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](v3, "observeOtherSetting:withBlock:", 200003, &__block_literal_global_3_0);
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](v3, "observeOtherSetting:withBlock:", 200005, &__block_literal_global_4);
  }
  return v3;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 |= 3u;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 |= 5u;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 |= 9u;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 |= 0x11u;
}

void __46__BLSBacklightSceneSettingsDiffInspector_init__block_invoke_5(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 |= 0x21u;
}

@end
