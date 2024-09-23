@implementation ICDeviceSupport(UI)

+ (uint64_t)isCameraAvailable
{
  uint64_t v0;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ICDeviceSupport_UI__isCameraAvailable__block_invoke_2;
  block[3] = &unk_1E5C1DB38;
  v3 = &__block_literal_global_74;
  if (isCameraAvailable_onceToken[0] != -1)
    dispatch_once(isCameraAvailable_onceToken, block);
  v0 = isCameraAvailable_isCameraAvailable;

  return v0;
}

+ (BOOL)isLargerCompactHorizontalWidthDevice
{
  _BOOL8 v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  CGRect v7;

  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPad") & 1) != 0)
    return 0;
  +[ICUIApplicationShim sharedInstance](ICUIApplicationShim, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  objc_msgSend(v2, "bounds");
  v0 = CGRectGetWidth(v7) > 667.0 && v4 == 1;

  return v0;
}

@end
