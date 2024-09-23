@implementation BLSHBacklightSceneClientSettingsDiffInspector

- (BLSHBacklightSceneClientSettingsDiffInspector)init
{
  BLSHBacklightSceneClientSettingsDiffInspector *v2;
  BLSHBacklightSceneClientSettingsDiffInspector *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLSHBacklightSceneClientSettingsDiffInspector;
  v2 = -[FBSSceneClientSettingsDiffInspector init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](v2, "observeOtherSetting:withBlock:", 200000, &__block_literal_global_18);
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](v3, "observeOtherSetting:withBlock:", 200001, &__block_literal_global_1);
  }
  return v3;
}

void __53__BLSHBacklightSceneClientSettingsDiffInspector_init__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 |= 1u;
}

void __53__BLSHBacklightSceneClientSettingsDiffInspector_init__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 |= 2u;
}

- ($7D24B5AD5894795FD85A0EE1D817D743)inspectDiff:(id)a3
{
  unsigned __int8 v4;

  v4 = 0;
  -[FBSSettingsDiffInspector inspectDiff:withContext:](self, "inspectDiff:withContext:", a3, &v4);
  return ($7D24B5AD5894795FD85A0EE1D817D743)v4;
}

@end
