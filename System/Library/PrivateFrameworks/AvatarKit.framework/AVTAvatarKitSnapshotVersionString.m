@implementation AVTAvatarKitSnapshotVersionString

void __AVTAvatarKitSnapshotVersionString_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)AVTAvatarKitSnapshotVersionString_kAVTAvatarKitSnapshotVersionString;
  AVTAvatarKitSnapshotVersionString_kAVTAvatarKitSnapshotVersionString = v1;

}

@end
