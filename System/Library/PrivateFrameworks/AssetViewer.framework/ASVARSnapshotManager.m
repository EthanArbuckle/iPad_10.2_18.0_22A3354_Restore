@implementation ASVARSnapshotManager

+ (void)showARSnapshotUIForImage:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0D8C0E8];
  v4 = a3;
  v6 = objc_alloc_init(v3);
  v5 = objc_alloc_init(MEMORY[0x1E0D8C0F0]);
  objc_msgSend(v5, "setFlashStyle:", 0);
  objc_msgSend(v5, "setSaveLocation:", 1);
  objc_msgSend(v6, "showScreenshotUIForImage:options:", v4, v5);

}

@end
