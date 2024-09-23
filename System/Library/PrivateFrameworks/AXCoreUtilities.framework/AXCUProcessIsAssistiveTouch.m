@implementation AXCUProcessIsAssistiveTouch

void __AXCUProcessIsAssistiveTouch_block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("assistivetouchd"));

  if (v2)
    AXCUProcessIsAssistiveTouch__AXProcessIsAssistiveTouch = 1;
}

@end
