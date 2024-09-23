@implementation FBScene(InstrumentClusterSceneSettings)

- (void)updateClusterSceneSettingsWithBlock:()InstrumentClusterSceneSettings
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __79__FBScene_InstrumentClusterSceneSettings__updateClusterSceneSettingsWithBlock___block_invoke;
    v6[3] = &unk_24C769908;
    v5 = v4;
    v6[0] = MEMORY[0x24BDAC760];
    v7 = v4;
    objc_msgSend(a1, "updateSettingsWithBlock:", v6);

    v4 = v5;
  }

}

@end
