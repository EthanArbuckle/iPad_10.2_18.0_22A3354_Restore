@implementation PHMediaFormatConversionAssetBundleSource

- (id)fileType
{
  return CFSTR("com.apple.photos.asset-bundle");
}

+ (id)sourceForFileURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (!objc_msgSend(v5, "isFileURL")
    || (objc_msgSend(v5, "pathExtension"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "lowercaseString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("photosasset")),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMediaFormatConversion.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[fileURL isFileURL] && [[[fileURL pathExtension] lowercaseString] isEqualToString:ASSET_BUNDLE_PATH_EXTENSION]"));

  }
  objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", v5, 4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (Class)requestClass
{
  return (Class)objc_opt_class();
}

@end
