@implementation CPSAppClipRecord

void __110__CPSAppClipRecord_ClipUIServicesExtras__getApplicationIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if ((objc_msgSend(v3, "placeholder") & 1) == 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __110__CPSAppClipRecord_ClipUIServicesExtras__getApplicationIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke_2;
    v4[3] = &unk_1E8E8ADE8;
    v5 = v3;
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

void __110__CPSAppClipRecord_ClipUIServicesExtras__getApplicationIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke_2(uint64_t a1)
{
  sendResult(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

@end
