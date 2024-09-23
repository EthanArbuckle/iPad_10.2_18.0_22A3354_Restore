@implementation NUANFImageResolver

+ (id)imageResourceResponseForFileURL:(id)a3 perserveColorSpace:(BOOL)a4 withSize:(CGSize)a5 andQuality:(unint64_t)a6
{
  double height;
  double width;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  height = a5.height;
  width = a5.width;
  v9 = (void *)MEMORY[0x24BDBCE50];
  v10 = a3;
  objc_msgSend(v9, "dataWithContentsOfURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE906E8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "dataIsAnimatedImage:", v11);

  objc_msgSend(MEMORY[0x24BE906E8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v14, "loadAnimatedImageFromImageData:size:", v11, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x24BE906C0]);
    objc_msgSend(v17, "setAnimatedImage:", v16);
  }
  else
  {
    objc_msgSend(v14, "imageFromData:size:", v11, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x24BE906F0]);
    objc_msgSend(v17, "setImage:", v16);
  }
  objc_msgSend(v17, "setFileURL:", v10);

  objc_msgSend(v17, "setImageQuality:", a6);
  return v17;
}

@end
