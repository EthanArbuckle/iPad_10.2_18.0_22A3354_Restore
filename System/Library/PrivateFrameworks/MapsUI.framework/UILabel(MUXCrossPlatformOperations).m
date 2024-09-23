@implementation UILabel(MUXCrossPlatformOperations)

+ (id)_mapsui_defaultLabel
{
  id v0;

  v0 = objc_alloc(MEMORY[0x1E0DC3990]);
  return (id)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

@end
