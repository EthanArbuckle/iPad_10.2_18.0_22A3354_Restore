@implementation NSString(NTKImage)

- (uint64_t)imageWithFont:()NTKImage
{
  return objc_msgSend(a1, "imageWithFont:border:cropped:", a3, 4, 1);
}

- (id)imageWithFont:()NTKImage border:cropped:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0DC3658];
  v8 = a3;
  objc_msgSend(v7, "colorWithWhite:alpha:", 1.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithFont:border:color:cropped:", v8, 4, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)imageWithFont:()NTKImage border:color:cropped:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  void *v25;
  void *v26;
  CGImage *v27;
  size_t Width;
  size_t Height;
  CGDataProvider *DataProvider;
  const __CFData *v31;
  const UInt8 *BytePtr;
  int BytesPerRow;
  uint64_t v34;
  uint64_t v35;
  const UInt8 *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  const UInt8 *v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  CGFloat v52;
  id v53;
  CGImage *v54;
  CGImage *v55;
  id v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[3];
  CGSize v61;
  CGRect v62;

  v60[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = *MEMORY[0x1E0DC1140];
  v59[0] = *MEMORY[0x1E0DC1138];
  v59[1] = v12;
  v60[0] = v10;
  v60[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sizeWithAttributes:", v13);
  CLKCeilForDevice();
  v17 = v16;
  CLKCeilForDevice();
  v18 = (double)a4;
  v19 = v17 + (double)a4;
  v21 = v20 + (double)a4;
  objc_msgSend(v15, "screenScale");
  v23 = v22;
  v61.width = v19;
  v61.height = v21;
  UIGraphicsBeginImageContextWithOptions(v61, 0, v23);
  v24 = (double)(a4 >> 1);
  objc_msgSend(a1, "drawAtPoint:withAttributes:", v13, v24, v24);
  UIGraphicsGetImageFromCurrentImageContext();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_imageThatSuppressesAccessibilityHairlineThickening");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  if (a6)
  {
    v58 = v10;
    v57 = objc_retainAutorelease(v26);
    v27 = (CGImage *)objc_msgSend(v57, "CGImage");
    Width = CGImageGetWidth(v27);
    Height = CGImageGetHeight(v27);
    DataProvider = CGImageGetDataProvider(v27);
    v31 = CGDataProviderCopyData(DataProvider);
    BytePtr = CFDataGetBytePtr(v31);
    BytesPerRow = CGImageGetBytesPerRow(v27);
    if (Height)
    {
      v34 = 0;
      v35 = BytesPerRow;
      v36 = BytePtr + 2;
      v37 = 0x7FFFFFFF;
      v38 = 0x80000000;
      v39 = 0x80000000;
      v40 = 0x7FFFFFFF;
      do
      {
        if (Width)
        {
          v41 = 0;
          v42 = v36;
          do
          {
            v43 = *(v42 - 2);
            v44 = *(v42 - 1);
            v46 = *v42;
            v42 += 4;
            v45 = v46;
            v47 = v44 + v43;
            if ((int)v41 >= v40)
              v48 = v40;
            else
              v48 = v41;
            if ((int)v41 <= v39)
              v49 = v39;
            else
              v49 = v41;
            if ((int)v34 >= v37)
              v50 = v37;
            else
              v50 = v34;
            if ((int)v34 <= v38)
              v51 = v38;
            else
              v51 = v34;
            if (v47 + v45)
            {
              v40 = v48;
              v39 = v49;
              v37 = v50;
              v38 = v51;
            }
            ++v41;
          }
          while (Width != v41);
        }
        ++v34;
        v36 += v35;
      }
      while (v34 != Height);
    }
    else
    {
      v39 = 0x80000000;
      v40 = 0x7FFFFFFF;
      v37 = 0x7FFFFFFF;
      v38 = 0x80000000;
    }
    CFRelease(v31);
    v52 = v18 + (double)(int)((v39 - v40 + 1) & 0xFFFFFFFE);
    v53 = objc_retainAutorelease(v57);
    v54 = (CGImage *)objc_msgSend(v53, "CGImage");
    v62.origin.x = (double)v40 - v24;
    v62.origin.y = (double)v37 - v24;
    v62.size.width = v52;
    v62.size.height = v18 + (double)(int)((v38 - v37 + 1) & 0xFFFFFFFE);
    v55 = CGImageCreateWithImageInRect(v54, v62);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v55);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    CGImageRelease(v55);
    v10 = v58;
  }

  return v26;
}

@end
