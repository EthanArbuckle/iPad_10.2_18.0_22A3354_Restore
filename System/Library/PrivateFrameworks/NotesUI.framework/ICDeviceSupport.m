@implementation ICDeviceSupport

void __40__ICDeviceSupport_UI__isCameraAvailable__block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  isCameraAvailable_isCameraAvailable = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3[0] = CFSTR("cameraRestriction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = *(id *)(a1 + 32);
  MGRegisterForUpdates();

}

uint64_t __40__ICDeviceSupport_UI__isCameraAvailable__block_invoke()
{
  int v0;
  void *v1;
  int v2;

  v0 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 1);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", *MEMORY[0x1E0D64448]);

  return v0 & (v2 ^ 1u);
}

uint64_t __40__ICDeviceSupport_UI__isCameraAvailable__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  isCameraAvailable_isCameraAvailable = result;
  return result;
}

@end
