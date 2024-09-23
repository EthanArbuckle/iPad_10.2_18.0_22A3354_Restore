@implementation CKContextExtractionUtil

+ (id)_renderImageToSurfaceWithImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  CGColorSpace *DeviceRGB;
  uint64_t v24;
  CGContext *v25;
  CGImage *v26;
  _QWORD v28[4];
  _QWORD v29[5];
  CGRect v30;

  v29[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ioSurface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v4, "size");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v4, "scale");
      v13 = v12;
      v28[0] = *MEMORY[0x1E0CBBDD0];
      v14 = v9 * v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v15;
      v28[1] = *MEMORY[0x1E0CBBD88];
      v16 = v11 * v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0CBBD70];
      v29[1] = v17;
      v29[2] = &unk_1E6246C10;
      v19 = *MEMORY[0x1E0CBBD90];
      v28[2] = v18;
      v28[3] = v19;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1111970369);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[3] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEA0]), "initWithProperties:", v21);
      objc_msgSend(v22, "lockWithOptions:seed:", 1, 0);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v24 = CGIOSurfaceContextCreate();
      if (v24)
      {
        v25 = (CGContext *)v24;
        v26 = (CGImage *)objc_msgSend(objc_retainAutorelease(v4), "CGImage");
        v30.origin.x = 0.0;
        v30.origin.y = 0.0;
        v30.size.width = v14;
        v30.size.height = v16;
        CGContextDrawImage(v25, v30, v26);
        CGColorSpaceRelease(DeviceRGB);
        CGContextFlush(v25);
        CFRelease(v25);
        v7 = v22;
      }
      else
      {
        CGColorSpaceRelease(DeviceRGB);
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)renderLeadImage:(id)a3 toDonationItem:(id)a4
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a4;
    +[CKContextExtractionUtil _renderImageToSurfaceWithImage:](CKContextExtractionUtil, "_renderImageToSurfaceWithImage:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeadImage:");

  }
  else
  {
    v6 = a4;
    objc_msgSend(v6, "setLeadImage:", 0);
  }

}

+ (void)renderSnapshot:(id)a3 toDonationItem:(id)a4
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a4;
    +[CKContextExtractionUtil _renderImageToSurfaceWithImage:](CKContextExtractionUtil, "_renderImageToSurfaceWithImage:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSnapshot:");

  }
  else
  {
    v6 = a4;
    objc_msgSend(v6, "setSnapshot:", 0);
  }

}

@end
