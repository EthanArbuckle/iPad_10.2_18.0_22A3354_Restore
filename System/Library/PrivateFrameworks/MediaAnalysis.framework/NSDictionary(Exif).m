@implementation NSDictionary(Exif)

+ (CFDictionaryRef)vcp_exifFromImageURL:()Exif
{
  const __CFURL *v3;
  const __CFURL *v4;
  CGImageSource *v5;
  const __CFDictionary *v6;
  CFDictionaryRef v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = CGImageSourceCreateWithURL(v3, 0)) != 0)
  {
    v9 = *MEMORY[0x1E0CBD240];
    v10[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, v6);
    CFRelease(v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (float)vcp_scaledExposureTime
{
  void *v2;
  void *v3;
  float v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = -1.0;
  if (v2)
  {
    v5 = *MEMORY[0x1E0CBCB78];
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CBCB78]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v4 = v8;

    }
  }
  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CBCF70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", VCPAppleMakerNote_SISMethod);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "intValue");
      if (v13 > 4370)
      {
        if (v13 != 4627 && v13 != 4371)
          goto LABEL_16;
      }
      else if (v13 != 275 && v13 != 531)
      {
        goto LABEL_16;
      }
      v4 = v4 * 0.125;
    }
LABEL_16:

  }
  return v4;
}

- (uint64_t)vcp_flashFired
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1
    && (v3 = *MEMORY[0x1E0CBCB88],
        objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CBCB88]),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v2, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    v7 = v6 & 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)vcp_captureDeviceMake
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)vcp_captureDeviceModel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)vcp_isAppleCapture
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "vcp_captureDeviceMake");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Apple"));

  return v2;
}

@end
