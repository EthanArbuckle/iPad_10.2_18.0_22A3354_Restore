@implementation UIImage

- (id)safari_decodedImageIfPossible
{
  id v1;
  uint64_t v2;
  CGImage *v3;
  double Width;
  double Height;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  size_t v14;
  const void *Data;
  uint64_t BytesPerRow;
  CGDataProviderRef v17;
  CGDataProvider *v18;
  size_t v19;
  CGColorSpace *ColorSpace;
  CGBitmapInfo v21;
  const CGFloat *decode;
  BOOL shouldInterpolate;
  CGColorRenderingIntent intent;
  CGImage *v25;
  id v26;
  _QWORD v28[5];
  _QWORD v29[6];
  CGRect v30;
  CGRect v31;

  v29[5] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v26 = 0;
    return v26;
  }
  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "CGImage");
  if (!v2)
    goto LABEL_15;
  v3 = (CGImage *)v2;
  if (!CGImageGetImageProvider())
    goto LABEL_15;
  Width = (double)CGImageGetWidth(v3);
  Height = (double)CGImageGetHeight(v3);
  v6 = *MEMORY[0x1E0C9DAA8];
  v7 = *MEMORY[0x1E0C9DAC0];
  v28[0] = *MEMORY[0x1E0C9DAB0];
  v28[1] = v7;
  v29[0] = v6;
  v29[1] = MEMORY[0x1E0C9AAB0];
  v8 = *MEMORY[0x1E0C9DA90];
  v28[2] = *MEMORY[0x1E0C9DAB8];
  v28[3] = v8;
  v29[2] = MEMORY[0x1E0C9AAB0];
  v29[3] = &unk_1E9D623E0;
  v28[4] = *MEMORY[0x1E0C9DA98];
  v29[4] = &unk_1E9D623E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
  v9 = CGImageProviderCopyImageBlockSetWithOptions();
  if (!v9)
    goto LABEL_15;
  v10 = (void *)v9;
  CGImageBlockSetGetRect();
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = Width;
  v31.size.height = Height;
  if (!CGRectEqualToRect(v30, v31)
    || CGImageBlockSetGetCount() != 1
    || !CGImageBlockSetGetImageBlock()
    || (CGImageBlockGetRect(),
        v12 = v11,
        v14 = (unint64_t)v13,
        Data = (const void *)CGImageBlockGetData(),
        BytesPerRow = CGImageBlockGetBytesPerRow(),
        (v17 = CGDataProviderCreateWithData(v10, Data, BytesPerRow * v14, (CGDataProviderReleaseDataCallback)releaseBlockSet)) == 0))
  {
    CGImageBlockSetRelease();
LABEL_15:
    v26 = v1;
    return v26;
  }
  v18 = v17;
  v19 = CGImageBlockGetBytesPerRow();
  ColorSpace = CGImageGetColorSpace(v3);
  if (CGImageHasAlpha())
    v21 = 8194;
  else
    v21 = 8198;
  decode = CGImageGetDecode(v3);
  shouldInterpolate = CGImageGetShouldInterpolate(v3);
  intent = CGImageGetRenderingIntent(v3);
  v25 = CGImageCreate((unint64_t)v12, v14, 8uLL, 0x20uLL, v19, ColorSpace, v21, v18, decode, shouldInterpolate, intent);
  CGDataProviderRelease(v18);
  if (!v25)
    goto LABEL_15;
  v26 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "sf_initWithCGImage:tabSnapshotEffectsVersion:", v25, objc_msgSend(v1, "sf_tabSnapshotEffectsVersion"));
  CGImageRelease(v25);
  return v26;
}

@end
