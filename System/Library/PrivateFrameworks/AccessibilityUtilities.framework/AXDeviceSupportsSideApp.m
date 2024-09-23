@implementation AXDeviceSupportsSideApp

void __AXDeviceSupportsSideApp_block_invoke()
{
  id v0;

  if (MGGetBoolAnswer()
    && (AXDeviceSupportsSideApp_DeviceSupportsMedusa = MGGetBoolAnswer(),
        (AXDeviceSupportsSideApp_DeviceSupportsMedusa & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0D10780], "sharedSystemShellSwitcher");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    AXDeviceSupportsSideApp_DeviceSupportsMedusa = objc_msgSend(v0, "isClarityBoardEnabled") ^ 1;

  }
  else
  {
    AXDeviceSupportsSideApp_DeviceSupportsMedusa = 0;
  }
}

@end
