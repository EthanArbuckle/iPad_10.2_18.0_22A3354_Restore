@implementation NTKSnapshotMappedImageCache

void __NTKSnapshotMappedImageCache_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0D01938];
  v1 = (void *)objc_opt_new();
  objc_msgSend(v0, "optionsWithContainerPathProvider:", v1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01930]), "initWithUniqueIdentifier:options:", CFSTR("com.apple.nanotimekit.ClockFaceSnapshots"), v4);
  v3 = (void *)NTKSnapshotMappedImageCache___cache;
  NTKSnapshotMappedImageCache___cache = v2;

}

@end
