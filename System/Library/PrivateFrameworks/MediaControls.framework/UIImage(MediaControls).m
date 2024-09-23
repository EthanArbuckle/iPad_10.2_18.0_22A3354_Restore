@implementation UIImage(MediaControls)

- (UIImage)mru_imageFittingSize:()MediaControls
{
  UIImage *v6;
  void *v7;
  double v8;
  double v9;
  NSData *v10;
  CGImageSource *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFDictionary *v16;
  CGImage *ThumbnailAtIndex;
  _QWORD v19[4];
  _QWORD v20[4];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (-[UIImage isSymbolImage](a1, "isSymbolImage"))
  {
    v6 = a1;
  }
  else
  {
    if (a2 < a3)
      a2 = a3;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

    v10 = UIImagePNGRepresentation(a1);
    v21 = *MEMORY[0x1E0CBD240];
    v22[0] = MEMORY[0x1E0C9AAA0];
    v11 = CGImageSourceCreateWithData((CFDataRef)v10, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
    v12 = *MEMORY[0x1E0CBD250];
    v19[0] = *MEMORY[0x1E0CBD178];
    v19[1] = v12;
    v20[0] = MEMORY[0x1E0C9AAB0];
    v20[1] = MEMORY[0x1E0C9AAB0];
    v13 = *MEMORY[0x1E0CBD190];
    v20[2] = MEMORY[0x1E0C9AAB0];
    v14 = *MEMORY[0x1E0CBD2A0];
    v19[2] = v13;
    v19[3] = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2 * v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v11, 0, v16);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", ThumbnailAtIndex);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(ThumbnailAtIndex);
    CFRelease(v11);

  }
  return v6;
}

@end
