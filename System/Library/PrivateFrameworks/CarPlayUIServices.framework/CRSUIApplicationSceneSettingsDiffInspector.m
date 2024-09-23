@implementation CRSUIApplicationSceneSettingsDiffInspector

- (void)observeBannerFrameWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__CRSUIApplicationSceneSettingsDiffInspector_observeBannerFrameWithBlock___block_invoke;
  v6[3] = &unk_24C7699A8;
  v7 = v4;
  v5 = v4;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 3152422720, v6);

}

uint64_t __74__CRSUIApplicationSceneSettingsDiffInspector_observeBannerFrameWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeMapStyleWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__CRSUIApplicationSceneSettingsDiffInspector_observeMapStyleWithBlock___block_invoke;
  v6[3] = &unk_24C7699A8;
  v7 = v4;
  v5 = v4;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 3152422721, v6);

}

uint64_t __71__CRSUIApplicationSceneSettingsDiffInspector_observeMapStyleWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)observeFrameRateLimitWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__CRSUIApplicationSceneSettingsDiffInspector_observeFrameRateLimitWithBlock___block_invoke;
  v6[3] = &unk_24C7699A8;
  v7 = v4;
  v5 = v4;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 3152422722, v6);

}

uint64_t __77__CRSUIApplicationSceneSettingsDiffInspector_observeFrameRateLimitWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
