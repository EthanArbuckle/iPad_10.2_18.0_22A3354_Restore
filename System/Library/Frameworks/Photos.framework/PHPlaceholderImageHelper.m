@implementation PHPlaceholderImageHelper

+ (id)placeholderImageDataForImageSize:(CGSize)a3 qualityClass:(id)a4 dataSpecification:(PHAssetResourceTableDataSpecification *)a5
{
  double height;
  double width;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  height = a3.height;
  width = a3.width;
  v20 = 0;
  v21 = 0;
  v19 = 0;
  v8 = (void *)MEMORY[0x1E0D719F8];
  v9 = a4;
  objc_msgSend(v8, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backingImageFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "placeholderDataForFormat:photoImageSize:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", objc_msgSend(v11, "formatID"), (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, (char *)&v19 + 4, width, height, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v13 = v21;
    v15 = v20;
    v14 = HIDWORD(v20);
    v17 = v19;
    v16 = HIDWORD(v19);
    a5->var0 = HIDWORD(v21);
    a5->var1 = v13;
    a5->var2 = v14;
    a5->var3 = v15;
    a5->var4 = v16;
    a5->var5 = v17;
    a5->var6 = 0;
  }
  return v12;
}

@end
