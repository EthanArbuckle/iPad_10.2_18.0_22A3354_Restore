@implementation CRSUIInstrumentClusterSettingsDiffInspector

- (void)observeShowETAWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__CRSUIInstrumentClusterSettingsDiffInspector_observeShowETAWithBlock___block_invoke;
  v6[3] = &unk_24C7699A8;
  v7 = v4;
  v5 = v4;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 4293273412, v6);

}

uint64_t __71__CRSUIInstrumentClusterSettingsDiffInspector_observeShowETAWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeShowCompassWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__CRSUIInstrumentClusterSettingsDiffInspector_observeShowCompassWithBlock___block_invoke;
  v6[3] = &unk_24C7699A8;
  v7 = v4;
  v5 = v4;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 4293273410, v6);

}

uint64_t __75__CRSUIInstrumentClusterSettingsDiffInspector_observeShowCompassWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeShowSpeedLimitWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__CRSUIInstrumentClusterSettingsDiffInspector_observeShowSpeedLimitWithBlock___block_invoke;
  v6[3] = &unk_24C7699A8;
  v7 = v4;
  v5 = v4;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 4293273411, v6);

}

uint64_t __78__CRSUIInstrumentClusterSettingsDiffInspector_observeShowSpeedLimitWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeItemTypeWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__CRSUIInstrumentClusterSettingsDiffInspector_observeItemTypeWithBlock___block_invoke;
  v6[3] = &unk_24C7699A8;
  v7 = v4;
  v5 = v4;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 4293273408, v6);

}

uint64_t __72__CRSUIInstrumentClusterSettingsDiffInspector_observeItemTypeWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeLayoutSpecificationWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__CRSUIInstrumentClusterSettingsDiffInspector_observeLayoutSpecificationWithBlock___block_invoke;
  v6[3] = &unk_24C7699A8;
  v7 = v4;
  v5 = v4;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 4293273409, v6);

}

uint64_t __83__CRSUIInstrumentClusterSettingsDiffInspector_observeLayoutSpecificationWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
