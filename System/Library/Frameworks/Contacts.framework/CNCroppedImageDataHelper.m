@implementation CNCroppedImageDataHelper

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("thumbnailImageData");
  v7[1] = CFSTR("cropRect");
  v7[2] = CFSTR("imageDataAvailable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNCroppedImageDataHelper)initWithContactStore:(id)a3
{
  id v5;
  CNCroppedImageDataHelper *v6;
  CNCroppedImageDataHelper *v7;
  CNCroppedImageDataHelper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCroppedImageDataHelper;
  v6 = -[CNCroppedImageDataHelper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)croppedImageDataAvailableForContact:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "imageDataAvailable") & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = *MEMORY[0x1E0D13818];
    objc_msgSend(v3, "thumbnailImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) ^ 1;

  }
  return v4;
}

- (id)croppedImageDataForContact:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "croppedImageDataAvailableForContact:", v4))
  {
    objc_msgSend(v4, "thumbnailImageData");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(v4, "thumbnailImageData"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "length"),
          v7,
          v6,
          v8))
    {
      objc_msgSend(v4, "thumbnailImageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNCroppedImageDataHelper squareImageData:](self, "squareImageData:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v4, "isKeyAvailable:", CFSTR("imageData")))
      {
        v11 = v4;
      }
      else
      {
        -[CNCroppedImageDataHelper contactStore](self, "contactStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = CFSTR("imageData");
        v21[1] = CFSTR("cropRect");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "unifiedContactWithIdentifier:keysToFetch:error:", v13, v14, 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v11, "imageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v11, "imageData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cropRect");
        CNImageUtilsCroppedImageDataFromFullSizeImageData(v15, 0, v16, v17, v18, v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)squareImageData:(id)a3
{
  const __CFData *v3;
  const __CFData *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  CFDictionaryRef v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CGImage *ImageAtIndex;
  __CFData *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  CGImage *v20;
  CGImageDestinationRef v21;
  CGImageDestination *v22;
  void *v23;

  v3 = (const __CFData *)a3;
  v4 = v3;
  if (v3)
  {
    v5 = CGImageSourceCreateWithData(v3, 0);
    if (v5)
    {
      v6 = v5;
      v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
      -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      if (vabdd_f64(v10, v13) <= 1.0)
      {
        CFRelease(v6);
        v15 = v4;
        goto LABEL_14;
      }
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
      CFRelease(v6);
    }
    else
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(0, 0, 0);
      v13 = 0.0;
      v10 = 0.0;
    }
    if (v10 >= v13)
      v16 = v13;
    else
      v16 = v10;
    v17 = 0;
    v18 = 0;
    v19 = v16;
    v20 = CGImageCreateWithImageInRect(ImageAtIndex, *(CGRect *)(&v16 - 2));
    CGImageRelease(ImageAtIndex);
    v15 = (__CFData *)objc_opt_new();
    v21 = CGImageDestinationCreateWithData(v15, CFSTR("public.jpeg"), 1uLL, 0);
    if (v21)
    {
      v22 = v21;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E2A40140, *MEMORY[0x1E0CBC780]);
      CGImageDestinationAddImage(v22, v20, (CFDictionaryRef)v23);
      CGImageDestinationFinalize(v22);
      CFRelease(v22);

    }
    CGImageRelease(v20);
  }
  else
  {
    v15 = 0;
  }
LABEL_14:

  return v15;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
