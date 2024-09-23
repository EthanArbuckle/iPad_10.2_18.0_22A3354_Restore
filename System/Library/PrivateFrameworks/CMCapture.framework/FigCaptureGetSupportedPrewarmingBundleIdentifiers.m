@implementation FigCaptureGetSupportedPrewarmingBundleIdentifiers

void __FigCaptureGetSupportedPrewarmingBundleIdentifiers_block_invoke()
{
  _QWORD v0[3];

  v0[2] = *MEMORY[0x1E0C80C00];
  if (!FigCaptureGetSupportedPrewarmingBundleIdentifiers_bundleIdentifiers)
  {
    v0[0] = 0x1E493D4D8;
    v0[1] = 0x1E493D5F8;
    FigCaptureGetSupportedPrewarmingBundleIdentifiers_bundleIdentifiers = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v0, 2);
  }
}

@end
