@implementation AVTImageIOImageEncoder

- (id)imageFromImageSource:(CGImageSource *)a3 error:(id *)a4
{
  CGImageRef ImageAtIndex;
  CGImageRef v6;
  void *v7;

  if (a3)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
    if (ImageAtIndex)
    {
      v6 = ImageAtIndex;
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", ImageAtIndex);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v6);
      if (!a4)
        return v7;
    }
    else
    {
      v7 = 0;
      if (!a4)
        return v7;
    }
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 604, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)imageFromURL:(id)a3 error:(id *)a4
{
  CGImageSourceRef v6;
  CGImageSourceRef v7;
  void *v8;

  v6 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v6)
  {
    v7 = v6;
    -[AVTImageIOImageEncoder imageFromImageSource:error:](self, "imageFromImageSource:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)imageFromData:(id)a3 error:(id *)a4
{
  CGImageSourceRef v6;
  CGImageSourceRef v7;
  void *v8;

  v6 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (v6)
  {
    v7 = v6;
    -[AVTImageIOImageEncoder imageFromImageSource:error:](self, "imageFromImageSource:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)dataFromImage:(id)a3
{
  void *v3;
  id v4;
  __CFData *v5;
  __CFString *v6;
  CGImageDestination *v7;
  const __CFDictionary *v8;
  id v9;
  CGImage *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v4 = a3;
  objc_msgSend(v3, "data");
  v5 = (__CFData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "typeIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CGImageDestinationCreateWithData(v5, v6, 1uLL, 0);
  objc_msgSend((id)objc_opt_class(), "addImageOptions");
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v4);
  v10 = (CGImage *)objc_msgSend(v9, "CGImage");

  CGImageDestinationAddImage(v7, v10, v8);
  CGImageDestinationFinalize(v7);
  if (v7)
    CFRelease(v7);
  v11 = (void *)-[__CFData copy](v5, "copy");

  return v11;
}

+ (id)typeIdentifier
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclass needs to implement"));
  return &stru_1EA5207B8;
}

+ (id)addImageOptions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)fileExtension
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclass needs to implement"));
  return &stru_1EA5207B8;
}

@end
