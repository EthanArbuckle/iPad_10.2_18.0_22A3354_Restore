@implementation PDFKitDeviceIsiPad

void __PDFKitDeviceIsiPad_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  PDFKitDeviceIsiPad_deviceIsiPad = objc_msgSend(v0, "userInterfaceIdiom") == 1;

}

@end
