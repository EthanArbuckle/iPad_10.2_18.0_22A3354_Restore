@implementation AVTAvatarKitSnapshotVersionNumber

void __AVTAvatarKitSnapshotVersionNumber_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  if ((unint64_t)objc_msgSend(v2, "count") < 3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  AVTAvatarKitSnapshotVersionNumber_kAVTAvatarKitSnapshotVersionNumber = v8 + 1000 * (v6 + 1000 * v4);

}

@end
