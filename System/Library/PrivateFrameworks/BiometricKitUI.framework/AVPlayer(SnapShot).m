@implementation AVPlayer(SnapShot)

- (id)bkui_snapshotImageAt:()SnapShot asset:error:
{
  void *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *a3;
  v13 = *((_QWORD *)a3 + 2);
  v8 = objc_msgSend(v7, "copyCGImageAtTime:actualTime:error:", &v12, 0, a5);
  if (v8)
  {
    v9 = (const void *)v8;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFAutorelease(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
