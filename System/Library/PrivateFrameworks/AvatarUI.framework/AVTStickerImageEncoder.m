@implementation AVTStickerImageEncoder

- (id)imageFromURL:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99D50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfURL:options:error:", v7, 1, a4);

  if (v8)
  {
    -[AVTStickerImageEncoder imageFromData:error:](self, "imageFromData:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)imageFromData:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 604, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)dataFromImage:(id)a3
{
  return UIImagePNGRepresentation((UIImage *)a3);
}

- (id)dataFromImage:(id)a3 clippingRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  CGDataProvider *DataProvider;
  CGImageSourceRef v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  __CFData *Mutable;
  __CFString *v19;
  CGImageDestination *v20;
  id v21;
  CGImage *v22;
  uint64_t v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v27[3] = *MEMORY[0x1E0C80C00];
  v8 = objc_retainAutorelease(a3);
  DataProvider = CGImageGetDataProvider((CGImageRef)objc_msgSend(v8, "CGImage"));
  v10 = CGImageSourceCreateWithDataProvider(DataProvider, 0);
  objc_msgSend(v8, "scale");
  v12 = v11 * 72.0;
  v26[0] = *MEMORY[0x1E0CBCA00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 * 72.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  v26[1] = *MEMORY[0x1E0CBC9F8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v14;
  v26[2] = *MEMORY[0x1E0CBCB50];
  v24 = *MEMORY[0x1E0CBCCB0];
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  NSStringFromCGRect(v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  Mutable = CFDataCreateMutable(0, 0);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = CGImageDestinationCreateWithData(Mutable, v19, 1uLL, 0);

  v21 = objc_retainAutorelease(v8);
  v22 = (CGImage *)objc_msgSend(v21, "CGImage");

  CGImageDestinationAddImage(v20, v22, v17);
  CGImageDestinationFinalize(v20);
  if (v20)
    CFRelease(v20);
  if (v10)
    CFRelease(v10);

  return Mutable;
}

- (id)fileExtension
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC580], "preferredFilenameExtension");
}

@end
