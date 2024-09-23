@implementation ICDocCamImageFilters

+ (id)filteredImage:(id)a3 orientation:(int64_t)a4 imageFilterType:(signed __int16)a5
{
  int v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = (void *)MEMORY[0x212B98734]();
  switch(v5)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v8, "dc_CGImage"), a4, 1.0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      objc_msgSend(a1, "colorDocument:orientation:", v8, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      objc_msgSend(a1, "grayscaleDocument:orientation:", v8, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(a1, "bradleyAdaptiveThreshold:orientation:", v8, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend(a1, "whiteboardFilter:orientation:", v8, a4);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v11 = (void *)v10;
      break;
    default:
      v11 = 0;
      break;
  }
  objc_autoreleasePoolPop(v9);

  return v11;
}

+ (id)filteredImage:(id)a3 imageFilterType:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "filteredImage:orientation:imageFilterType:", v6, objc_msgSend(v6, "dc_imageOrientation"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)imageFilterNames
{
  if (imageFilterNames_onceToken != -1)
    dispatch_once(&imageFilterNames_onceToken, &__block_literal_global_8);
  return (id)imageFilterNames_sImageFilterNames;
}

void __40__ICDocCamImageFilters_imageFilterNames__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", 1, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)imageFilterNames_sImageFilterNames;
  imageFilterNames_sImageFilterNames = v5;

}

+ (id)nonLocalizedImageFilterNames
{
  if (nonLocalizedImageFilterNames_onceToken != -1)
    dispatch_once(&nonLocalizedImageFilterNames_onceToken, &__block_literal_global_3);
  return (id)nonLocalizedImageFilterNames_sImageFilterNames;
}

void __52__ICDocCamImageFilters_nonLocalizedImageFilterNames__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", 1, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)nonLocalizedImageFilterNames_sImageFilterNames;
  nonLocalizedImageFilterNames_sImageFilterNames = v5;

}

+ (signed)imageFilterTypeFromName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "imageFilterNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  else
    return v6;
}

+ (signed)imageFilterTypeFromNonLocalizedName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "nonLocalizedImageFilterNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  else
    return v6;
}

+ (id)localizedImageFilterNameForName:(id)a3
{
  return (id)objc_msgSend(a1, "localizedImageFilterNameForType:", objc_msgSend(a1, "imageFilterTypeFromName:", a3));
}

+ (id)localizedImageFilterNameForType:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      v5 = CFSTR("Photo");
      goto LABEL_9;
    case 1:
      v5 = CFSTR("Color");
      goto LABEL_9;
    case 2:
      v5 = CFSTR("Grayscale");
      goto LABEL_9;
    case 3:
      v5 = CFSTR("Black & White");
      goto LABEL_9;
    case 4:
      v5 = CFSTR("Whiteboard");
LABEL_9:
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"), v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)nonLocalizedImageFilterNameForType:(signed __int16)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_24C5B8750[a3];
}

+ (id)sharedCoreImageContext
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedCoreImageContext_context)
  {
    objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sharedCoreImageContext_context;
    sharedCoreImageContext_context = v3;

  }
  objc_sync_exit(v2);

  return (id)sharedCoreImageContext_context;
}

+ (id)bradleyAdaptiveThreshold:(id)a3
{
  id v3;
  CGImage *v4;
  size_t Width;
  size_t Height;
  CGDataProvider *DataProvider;
  const __CFData *v8;
  uint64_t v9;
  CGColorSpace *DeviceGray;
  CGContext *v11;
  char *Data;
  unint64_t v13;
  _BOOL4 v14;
  unint64_t v15;
  BOOL v16;
  size_t v17;
  char *v18;
  size_t v19;
  _QWORD *v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  _QWORD *v25;
  unsigned __int8 *v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unsigned __int8 *v40;
  char *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  char v47;
  CGImage *Image;
  id v49;
  NSObject *v50;

  v3 = a3;
  v4 = (CGImage *)objc_msgSend(v3, "dc_CGImage");
  Width = CGImageGetWidth(v4);
  Height = CGImageGetHeight(v4);
  DataProvider = CGImageGetDataProvider(v4);
  v8 = objc_retainAutorelease(CGDataProviderCopyData(DataProvider));
  v9 = -[__CFData bytes](v8, "bytes");

  DeviceGray = CGColorSpaceCreateDeviceGray();
  v11 = CGBitmapContextCreate(0, Width, Height, 8uLL, Width, DeviceGray, 0);
  Data = (char *)CGBitmapContextGetData(v11);
  v13 = 8 * (int)Width;
  v14 = (Height & 0x80000000) != 0;
  if ((Height & 0x80000000) == 0)
    v15 = Height;
  else
    v15 = -(int)Height;
  v16 = !is_mul_ok(v15, v13);
  v17 = v15 * v13;
  if (!v17)
    v14 = 0;
  if (v16 || v14)
  {
    v50 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      +[ICDocCamImageFilters bradleyAdaptiveThreshold:].cold.1(Width, Height, v50);

    CGContextRelease(v11);
    v49 = v3;
  }
  else
  {
    v18 = Data;
    if ((Height & 0x80000000) == 0)
      v19 = v17;
    else
      v19 = -(uint64_t)v17;
    v20 = malloc_type_malloc(v19, 0x7C49083AuLL);
    v21 = Height - 1;
    if ((int)Height >= 1)
    {
      v22 = 0;
      v23 = 0;
      do
      {
        if ((int)Width >= 1)
        {
          v24 = 0;
          v25 = &v20[v23];
          v26 = (unsigned __int8 *)(v9 + v23);
          v23 += Width;
          v27 = Width;
          do
          {
            v28 = *v26++;
            v24 += v28;
            v29 = v24;
            if (v22)
              v29 = v25[-(int)Width] + v24;
            *v25++ = v29;
            --v27;
          }
          while (v27);
        }
        ++v22;
      }
      while (v22 != (_DWORD)Height);
      v30 = 0;
      if ((Width & 0x80000000) == 0)
        v31 = Width;
      else
        v31 = Width + 31;
      v32 = (uint64_t)v31 >> 5;
      v33 = Height;
      v34 = -(v31 >> 5);
      do
      {
        if ((int)Width >= 1)
        {
          v35 = (v30 - v32) & ~(((int)v30 - (int)v32) >> 31);
          if (v30 + v32 >= v33)
            v36 = v21;
          else
            v36 = v30 + v32;
          v37 = v36 - v35;
          v38 = v36 * Width;
          v39 = v35 * Width;
          v40 = (unsigned __int8 *)v9;
          v41 = v18;
          v42 = v32;
          v43 = v34;
          v44 = Width;
          do
          {
            if (v42 >= (int)Width)
              v45 = Width - 1;
            else
              v45 = v42;
            v46 = *v40++;
            if (v46 * (uint64_t)((v45 - (v43 & ~(v43 >> 31))) * v37) < (uint64_t)((double)(uint64_t)(v20[v45 + v38]
                                                                                                 - (v20[v45 + v39]
                                                                                                  + v20[(v43 & ~(v43 >> 31)) + v38])
                                                                                                 + v20[(v43 & ~(v43 >> 31)) + v39])
                                                                               * 0.849999994))
              v47 = 0;
            else
              v47 = -1;
            *v41++ = v47;
            ++v43;
            ++v42;
            --v44;
          }
          while (v44);
        }
        ++v30;
        v18 += (int)Width;
        v9 += (int)Width;
      }
      while (v30 != v33);
    }
    free(v20);
    Image = CGBitmapContextCreateImage(v11);
    objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:", Image);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    CGContextRelease(v11);
    CGImageRelease(Image);
  }
  CGColorSpaceRelease(DeviceGray);

  return v49;
}

+ (id)convertImageToGrayScale:(id)a3
{
  CGImage *v3;
  CGFloat Width;
  CGFloat Height;
  CGColorSpace *DeviceGray;
  CGContext *v7;
  CGImageRef Image;
  void *v9;
  CGRect v11;

  v3 = (CGImage *)objc_msgSend(a3, "dc_CGImage");
  Width = (double)CGImageGetWidth(v3);
  Height = (double)CGImageGetHeight(v3);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v7 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, (unint64_t)Width, DeviceGray, 0);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = Width;
  v11.size.height = Height;
  CGContextDrawImage(v7, v11, v3);
  Image = CGBitmapContextCreateImage(v7);
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:", Image);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorSpaceRelease(DeviceGray);
  CGContextRelease(v7);
  CFRelease(Image);
  return v9;
}

+ (id)whiteboardFilter:(id)a3 orientation:(int64_t)a4
{
  void *v5;
  WhiteboardFilter *v6;
  void *v7;
  void *v8;
  CGImage *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", objc_msgSend(a3, "dc_CGImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(WhiteboardFilter);
  -[WhiteboardFilter setInputImage:](v6, "setInputImage:", v5);
  -[WhiteboardFilter setStride:](v6, "setStride:", &unk_24C5D8118);
  -[WhiteboardFilter outputImage](v6, "outputImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters sharedCoreImageContext](ICDocCamImageFilters, "sharedCoreImageContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extent");
  v9 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v7);
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", v9, a4, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v9);

  return v10;
}

+ (id)whiteboardAndSaturation:(id)a3 orientation:(int64_t)a4
{
  void *v5;
  WhiteboardFilter *v6;
  void *v7;
  void *v8;
  CGImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGImage *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", objc_msgSend(a3, "dc_CGImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(WhiteboardFilter);
  -[WhiteboardFilter setInputImage:](v6, "setInputImage:", v5);
  -[WhiteboardFilter setStride:](v6, "setStride:", &unk_24C5D8118);
  -[WhiteboardFilter outputImage](v6, "outputImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters sharedCoreImageContext](ICDocCamImageFilters, "sharedCoreImageContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extent");
  v9 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v7);
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", v9, a4, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIColorControls"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDefaults");
  objc_msgSend(v11, "setValue:forKey:", &unk_24C5D8130, CFSTR("inputSaturation"));
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", objc_msgSend(v10, "dc_CGImage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("inputImage"));

  objc_msgSend(v11, "valueForKey:", CFSTR("outputImage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extent");
  v14 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v13);
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", v14, a4, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v14);
  CGImageRelease(v9);

  return v15;
}

+ (id)grayscale:(id)a3 orientation:(int64_t)a4
{
  void *v5;
  void *v6;

  +[ICDocCamImageFilters convertImageToGrayScale:](ICDocCamImageFilters, "convertImageToGrayScale:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v5, "dc_CGImage"), a4, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)bradleyAdaptiveThreshold:(id)a3 orientation:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  +[ICDocCamImageFilters convertImageToGrayScale:](ICDocCamImageFilters, "convertImageToGrayScale:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters bradleyAdaptiveThreshold:](ICDocCamImageFilters, "bradleyAdaptiveThreshold:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v6, "dc_CGImage"), a4, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)bradleyAdaptiveThresholdWithBlur:(id)a3 orientation:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGImage *v12;
  void *v13;

  +[ICDocCamImageFilters convertImageToGrayScale:](ICDocCamImageFilters, "convertImageToGrayScale:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters bradleyAdaptiveThreshold:](ICDocCamImageFilters, "bradleyAdaptiveThreshold:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v6, "dc_CGImage"), a4, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", objc_msgSend(v7, "dc_CGImage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:keysAndValues:", CFSTR("CIGaussianBlur"), *MEMORY[0x24BDBF960], v8, CFSTR("inputRadius"), &unk_24C5D8148, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters sharedCoreImageContext](ICDocCamImageFilters, "sharedCoreImageContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extent");
  v12 = (CGImage *)objc_msgSend(v11, "createCGImage:fromRect:", v10);
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", v12, a4, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v12);

  return v13;
}

+ (id)colorDocument:(id)a3 orientation:(int64_t)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  return +[ICDocCamImageFilters colorDocument:orientation:filterName:filterAmount:filterKey:](ICDocCamImageFilters, "colorDocument:orientation:filterName:filterAmount:filterKey:", a3, a4, CFSTR("CIPaperWash"), *MEMORY[0x24BDBF980], v4);
}

+ (id)colorDocument:(id)a3 orientation:(int64_t)a4 constantColor:(BOOL)a5
{
  const __CFString *v8;
  float v9;
  id *v10;
  id v11;
  double v12;
  void *v13;

  if (a5)
    v8 = CFSTR("CIDocumentEnhancer");
  else
    v8 = CFSTR("CIPaperWash");
  if (a5)
    v9 = *(float *)"333?";
  else
    v9 = 1.0;
  v10 = (id *)MEMORY[0x24BDBF910];
  if (!a5)
    v10 = (id *)MEMORY[0x24BDBF980];
  v11 = *v10;
  *(float *)&v12 = v9;
  objc_msgSend(a1, "colorDocument:orientation:filterName:filterAmount:filterKey:", a3, a4, v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)colorDocument:(id)a3 orientation:(int64_t)a4 filterName:(id)a5 filterAmount:(float)a6 filterKey:(id)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  CGImage *v20;
  void *v21;

  v11 = (void *)MEMORY[0x24BDBF660];
  v12 = a7;
  v13 = a5;
  objc_msgSend(v11, "imageWithCGImage:", objc_msgSend(a3, "dc_CGImage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v16 = a6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v17, v12);

  objc_msgSend(v15, "setValue:forKey:", v14, *MEMORY[0x24BDBF960]);
  objc_msgSend(v15, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters sharedCoreImageContext](ICDocCamImageFilters, "sharedCoreImageContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "extent");
  v20 = (CGImage *)objc_msgSend(v19, "createCGImage:fromRect:", v18);
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", v20, a4, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v20);

  return v21;
}

+ (id)grayscaleDocument:(id)a3 orientation:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGImage *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", objc_msgSend(a3, "dc_CGImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIPaperWash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v5, *MEMORY[0x24BDBF960]);
  objc_msgSend(v6, "setValue:forKey:", &unk_24C5D8160, *MEMORY[0x24BDBF980]);
  objc_msgSend(v6, "outputImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters sharedCoreImageContext](ICDocCamImageFilters, "sharedCoreImageContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extent");
  v9 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v7);
  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", v9, a4, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v9);

  return v10;
}

+ (id)filteredImage:(id)a3 imageFilterType:(signed __int16)a4 constantColor:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "filteredImage:orientation:imageFilterType:constantColor:", v8, objc_msgSend(v8, "dc_imageOrientation"), v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)filteredImage:(id)a3 orientation:(int64_t)a4 imageFilterType:(signed __int16)a5 constantColor:(BOOL)a6
{
  _BOOL8 v6;
  int v7;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = (void *)MEMORY[0x212B98734]();
  switch(v7)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", objc_msgSend(v10, "dc_CGImage"), a4, 1.0);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      objc_msgSend(a1, "colorDocument:orientation:constantColor:", v10, a4, v6);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      objc_msgSend(a1, "grayscaleDocument:orientation:", v10, a4);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(a1, "bradleyAdaptiveThreshold:orientation:", v10, a4);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend(a1, "whiteboardFilter:orientation:", v10, a4);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v13 = (void *)v12;
      break;
    default:
      v13 = 0;
      break;
  }
  objc_autoreleasePoolPop(v11);

  return v13;
}

+ (id)imageWithRGBColorspaceFromImage:(id)a3
{
  id v3;
  CGImage *v4;
  CGColorSpace *ColorSpace;
  double Width;
  double Height;
  CGContext *v8;
  CGContext *v9;
  CGImageRef Image;
  CGImageRef v11;
  uint64_t v12;
  id v13;
  CGRect v15;

  v3 = a3;
  v4 = (CGImage *)objc_msgSend(v3, "dc_CGImage");
  ColorSpace = CGImageGetColorSpace(v4);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
  {
    Width = (double)CGImageGetWidth(v4);
    Height = (double)CGImageGetHeight(v4);
    v8 = DCTSUCreateRGBABitmapContext(0, Width, Height, 1.0);
    if (v8)
    {
      v9 = v8;
      v15.origin.x = 0.0;
      v15.origin.y = 0.0;
      v15.size.width = Width;
      v15.size.height = Height;
      CGContextDrawImage(v8, v15, v4);
      Image = CGBitmapContextCreateImage(v9);
      if (Image)
      {
        v11 = Image;
        objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", Image, objc_msgSend(v3, "dc_imageOrientation"), 1.0);
        v12 = objc_claimAutoreleasedReturnValue();

        CFRelease(v11);
        v3 = (id)v12;
      }
      CGContextRelease(v9);
    }
  }
  v13 = v3;

  return v13;
}

+ (id)perspectiveCorrectedCIImageFromCIImage:(id)a3 imageQuad:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  CGRect v24;
  CGRect v25;

  v5 = (void *)MEMORY[0x24BDBF658];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "filterWithName:", CFSTR("CIPerspectiveCorrection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend(v6, "topLeft");
  objc_msgSend(v9, "vectorWithCGPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("inputTopLeft"));

  v11 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend(v6, "topRight");
  objc_msgSend(v11, "vectorWithCGPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("inputTopRight"));

  v13 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend(v6, "bottomLeft");
  objc_msgSend(v13, "vectorWithCGPoint:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v14, CFSTR("inputBottomLeft"));

  v15 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend(v6, "bottomRight");
  v17 = v16;
  v19 = v18;

  objc_msgSend(v15, "vectorWithCGPoint:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v20, CFSTR("inputBottomRight"));

  objc_msgSend(v8, "setValue:forKey:", v7, *MEMORY[0x24BDBF960]);
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x24BDBF9C8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "extent");
  v25 = CGRectInset(v24, 1.0, 1.0);
  objc_msgSend(v21, "imageByCroppingToRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)perspectiveCorrectedImageFromImage:(id)a3 imageQuad:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CGImage *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  +[ICDocCamImageFilters sharedCoreImageContext](ICDocCamImageFilters, "sharedCoreImageContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", objc_msgSend(v6, "dc_CGImage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "perspectiveCorrectedCIImageFromCIImage:imageQuad:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "extent");
  v11 = objc_msgSend(v8, "createCGImage:fromRect:", v10);
  if (v11)
  {
    v12 = (CGImage *)v11;
    objc_msgSend(MEMORY[0x24BDF6AC8], "dc_imageWithCGImage:scale:orientation:", v11, objc_msgSend(v6, "dc_imageOrientation"), 1.0);
    v13 = objc_claimAutoreleasedReturnValue();

    CGImageRelease(v12);
    v6 = (id)v13;
  }

  return v6;
}

+ (id)perspectiveCorrectedImageFromImage:(id)a3 normalizedImageQuad:(id)a4
{
  id v6;
  id v7;
  CGImage *v8;
  double Width;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (CGImage *)objc_msgSend(v7, "dc_CGImage");
  Width = (double)CGImageGetWidth(v8);
  objc_msgSend(v6, "imageQuadByScalingBy:", Width, (double)CGImageGetHeight(v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "perspectiveCorrectedImageFromImage:imageQuad:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)bradleyAdaptiveThreshold:(os_log_t)log .cold.1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "adaptiveThreshold() overflow check failed with %d x %d image", (uint8_t *)v3, 0xEu);
}

@end
