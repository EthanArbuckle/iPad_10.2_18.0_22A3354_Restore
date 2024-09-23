@implementation CPUIContentStyleDiffInspector

- (void)observeMapStyleWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__CPUIContentStyleDiffInspector_observeMapStyleWithBlock___block_invoke;
  v10[3] = &unk_24C77D3E8;
  v6 = v4;
  v11 = v6;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 1893182283, v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __58__CPUIContentStyleDiffInspector_observeMapStyleWithBlock___block_invoke_2;
  v8[3] = &unk_24C77D3E8;
  v9 = v6;
  v7 = v6;
  -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", 3152422721, v8);

}

uint64_t __58__CPUIContentStyleDiffInspector_observeMapStyleWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__CPUIContentStyleDiffInspector_observeMapStyleWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
