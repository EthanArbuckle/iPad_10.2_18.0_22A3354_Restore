@implementation AXAuditContrastDetectionManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AXAuditContrastDetectionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_3 != -1)
    dispatch_once(&sharedManager_onceToken_3, block);
  return (id)sharedManager_instance_3;
}

void __48__AXAuditContrastDetectionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance_3;
  sharedManager_instance_3 = v0;

}

- (id)contrastResultForInput:(id)a3
{
  id v4;
  AXAuditContrastResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  id obj;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(AXAuditContrastResult);
  objc_msgSend(v4, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditContrastDetectionManager _topColorsForImageData:optimized:](self, "_topColorsForImageData:optimized:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v4, "foregroundHexColorValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditContrastDetectionManager colorForHexValueString:](self, "colorForHexValueString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "backgroundHexColorValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditContrastDetectionManager colorForHexValueString:](self, "colorForHexValueString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v13;
    v41 = v12;
    if (v9)
    {
      v14 = v9;
      v15 = v14;
      if (!v11)
      {
        v21 = objc_msgSend(v14, "isEqual:", v12);
        v18 = v13;
        if ((v21 & 1) == 0)
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          obj = v7;
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v22)
          {
            v23 = v22;
            v38 = v9;
            v24 = *(_QWORD *)v43;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v43 != v24)
                  objc_enumerationMutation(obj);
                v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                -[AXAuditContrastDetectionManager _euclideanDistanceBetweenColor1:color2:](self, "_euclideanDistanceBetweenColor1:color2:", v15, v26);
                if (v27 > 0.1)
                {
                  v37 = v26;

                  v18 = v37;
                  goto LABEL_35;
                }
              }
              v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
              if (v23)
                continue;
              break;
            }
LABEL_35:
            v9 = v38;
          }

          v11 = 0;
        }
LABEL_8:
        -[AXAuditContrastDetectionManager contrastRatioForColor1:color2:](self, "contrastRatioForColor1:color2:", v15, v18);
        v20 = v19;
        if (objc_msgSend(v4, "enhanced"))
        {
          if (v20 >= 7.1)
          {
            v17 = 14;
            goto LABEL_32;
          }
          if (v20 < 4.5)
          {
            v17 = 16;
LABEL_32:
            -[AXAuditContrastResult setRatio:](v5, "setRatio:", v20);
            -[AXAuditContrastDetectionManager auditDisplayStringForAuditColor:](self, "auditDisplayStringForAuditColor:", v9);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXAuditContrastResult setTextColor:](v5, "setTextColor:", v33);

            -[AXAuditContrastDetectionManager auditDisplayStringForAuditColor:](self, "auditDisplayStringForAuditColor:", v15);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXAuditContrastResult setPrimaryColor:](v5, "setPrimaryColor:", v34);

            -[AXAuditContrastDetectionManager auditDisplayStringForAuditColor:](self, "auditDisplayStringForAuditColor:", v18);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXAuditContrastResult setSecondaryColor:](v5, "setSecondaryColor:", v35);

            goto LABEL_33;
          }
          objc_msgSend(v4, "fontSize");
          v29 = v28 < 18.0;
          v30 = 15;
          v31 = 14;
        }
        else
        {
          if (v20 >= 4.5)
          {
            v17 = 11;
            goto LABEL_32;
          }
          if (v20 < 3.1)
          {
            v17 = 13;
            goto LABEL_32;
          }
          objc_msgSend(v4, "fontSize");
          v29 = v32 < 18.0;
          v30 = 12;
          v31 = 11;
        }
        if (v29)
          v17 = v30;
        else
          v17 = v31;
        goto LABEL_32;
      }
      v16 = v11;
    }
    else
    {
      v15 = v12;
      v16 = v13;
    }
    v18 = v16;
    goto LABEL_8;
  }
  v17 = 0;
LABEL_33:
  -[AXAuditContrastResult setClassification:](v5, "setClassification:", v17);
  objc_msgSend(v4, "fontSize");
  -[AXAuditContrastResult setFontSize:](v5, "setFontSize:");

  return v5;
}

- (id)colorForHexValueString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("#"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scanHexInt:", &v8);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (float)((float)BYTE2(v8) / 255.0), (float)((float)BYTE1(v8) / 255.0), (float)((float)v8 / 255.0), 1.0);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v3;
}

- (id)_topColorsForImageData:(id)a3 optimized:(BOOL)a4
{
  id v6;
  id v7;
  CGImage *v8;
  CGImage *v9;
  CGDataProvider *DataProvider;
  CFDataRef v11;
  size_t Width;
  double v13;
  size_t Height;
  double v15;
  id v16;
  double v17;
  void *v18;
  int v19;
  double v20;
  int v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v30;

  v6 = a3;
  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v6));
  v8 = (CGImage *)objc_msgSend(v7, "CGImage");
  if (v8)
  {
    v9 = v8;
    DataProvider = CGImageGetDataProvider(v8);
    v11 = CGDataProviderCopyData(DataProvider);
    Width = CGImageGetWidth(v9);
    v13 = (double)Width;
    Height = CGImageGetHeight(v9);
    v15 = (double)Height;
    v16 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    v30 = v6;
    if (a4)
    {
      LODWORD(Height) = llround(v13 * 0.125);
      v17 = v13 - round(v13 * 0.125);
      if (v17 > (double)(int)Height)
      {
        v18 = 0;
        v19 = (int)(v15 * 0.5);
        v20 = round(v15 / 10.0);
        v21 = (int)((double)v19 + v20 * 2.0);
        v22 = (int)((double)v19 + v20 * -2.0);
        do
        {
          for (i = v22; (int)i <= v21; i = (int)(v20 + (double)(int)i))
          {
            v24 = v18;
            -[AXAuditContrastDetectionManager pixelColorInImagePixelData:atX:atY:width:](self, "pixelColorInImagePixelData:atX:atY:width:", v11, Height, i, v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v16, "addObject:", v18);
          }
          Height = (Height + 1);
        }
        while (v17 > (double)(int)Height);
        goto LABEL_22;
      }
    }
    else if (Width)
    {
      v26 = 0;
      v18 = 0;
      do
      {
        if (Height)
        {
          v27 = 0;
          do
          {
            v28 = v18;
            -[AXAuditContrastDetectionManager pixelColorInImagePixelData:atX:atY:width:](self, "pixelColorInImagePixelData:atX:atY:width:", v11, v26, v27, v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v16, "addObject:", v18);
            v27 = (v27 + 1);
          }
          while ((double)(int)v27 < v15);
        }
        v26 = (v26 + 1);
      }
      while ((double)(int)v26 < v13);
      goto LABEL_22;
    }
    v18 = 0;
LABEL_22:
    CFRelease(v11);
    -[AXAuditContrastDetectionManager _topColorsForColors:](self, "_topColorsForColors:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v30;
    goto LABEL_23;
  }
  v25 = 0;
LABEL_23:

  return v25;
}

- (double)_euclideanDistanceBetweenColor1:(id)a3 color2:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  CGColor *v9;
  CGColor *v10;
  const CGFloat *Components;
  double v12;
  double v13;
  double v14;
  const CGFloat *v15;
  float v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  float v24;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0.0;
  if (v5)
  {
    if (v6)
    {
      v9 = (CGColor *)objc_msgSend(objc_retainAutorelease(v5), "CGColor");
      v10 = (CGColor *)objc_msgSend(objc_retainAutorelease(v7), "CGColor");
      if (CGColorGetNumberOfComponents(v9) == 4 && CGColorGetNumberOfComponents(v10) == 4)
      {
        Components = CGColorGetComponents(v9);
        v12 = *Components;
        v13 = Components[1];
        v14 = Components[2];
        v15 = CGColorGetComponents(v10);
        v16 = v12 - *v15;
        v17 = (float)(v16 * v16);
        v18 = v13 - v15[1];
        v19 = (float)(v18 * v18) * 4.0;
        v20 = v14 - v15[2];
        v21 = (float)(v20 * v20);
        v22 = v19 + v17 * 3.0 + v21 * 2.0;
        v23 = v19 + v17 * 2.0 + v21 * 3.0;
        if ((v12 + *v15) * 0.5 >= 0.5)
          v23 = v22;
        v24 = v23;
        v8 = sqrtf(v24);
      }
    }
  }

  return v8;
}

- (id)_topColorsForColors:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    v20 = 0;
    goto LABEL_20;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v6)
  {

    v19 = 0;
    v9 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  v22 = v4;
  v23 = v3;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v24 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v26 != v24)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      v14 = objc_msgSend(v5, "countForObject:", v13);
      v15 = v14;
      if (v14 <= v10)
      {
        v16 = v13;
        if (v14 <= v11)
          continue;
      }
      else
      {
        v16 = v8;

        v9 = v16;
        v8 = v13;
        v17 = v15;
        v15 = v10;
        v10 = v17;
      }
      v18 = v13;

      v9 = v16;
      v11 = v15;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v7);

  v4 = v22;
  v19 = v8;
  if (v8)
    objc_msgSend(v22, "addObject:", v8);
  v3 = v23;
  if (v9)
    objc_msgSend(v22, "addObject:", v9);
LABEL_19:
  v20 = v4;

LABEL_20:
  return v20;
}

- (id)pixelColorInImagePixelData:(__CFData *)a3 atX:(int)a4 atY:(int)a5 width:(double)a6
{
  const UInt8 *BytePtr;
  int64_t v11;
  CFIndex Length;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int64_t v17;
  const UInt8 *v18;

  BytePtr = CFDataGetBytePtr(a3);
  v11 = vcvtd_n_s64_f64((double)a4 + a6 * (double)a5, 2uLL);
  Length = CFDataGetLength(a3);
  if (Length >= v11)
    v17 = v11;
  else
    v17 = Length;
  v18 = &BytePtr[v17];
  LOBYTE(v13) = *v18;
  LOBYTE(v14) = v18[1];
  LOBYTE(v15) = v18[2];
  LOBYTE(v16) = v18[3];
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (float)((float)v13 / 255.0), (float)((float)v14 / 255.0), (float)((float)v15 / 255.0), (float)((float)v16 / 255.0));
}

- (double)luminanceForColor:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CGColor *v6;
  const CGFloat *Components;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = a3;
  v4 = v3;
  v5 = 0.0;
  if (v3)
  {
    v6 = (CGColor *)objc_msgSend(objc_retainAutorelease(v3), "CGColor");
    if (CGColorGetNumberOfComponents(v6) == 4)
    {
      Components = CGColorGetComponents(v6);
      v8 = *Components;
      v9 = Components[1];
      v10 = Components[2];
      if (*Components <= 0.03928)
        v11 = v8 / 12.92;
      else
        v11 = pow((v8 + 0.055) / 1.055, 2.4);
      if (v9 <= 0.03928)
        v12 = v9 / 12.92;
      else
        v12 = pow((v9 + 0.055) / 1.055, 2.4);
      v13 = v12 * 0.7152 + v11 * 0.2126;
      if (v10 <= 0.03928)
        v14 = v10 / 12.92;
      else
        v14 = pow((v10 + 0.055) / 1.055, 2.4);
      v5 = v13 + v14 * 0.0722;
    }
  }

  return v5;
}

- (double)contrastRatioForColor1:(id)a3 color2:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  v6 = a4;
  -[AXAuditContrastDetectionManager luminanceForColor:](self, "luminanceForColor:", a3);
  v8 = v7;
  -[AXAuditContrastDetectionManager luminanceForColor:](self, "luminanceForColor:", v6);
  v10 = v9;

  result = (v8 + 0.05) / (v10 + 0.05);
  if (v10 > v8)
    return 1.0 / result;
  return result;
}

- (id)auditDisplayStringForAuditColor:(id)a3
{
  CGColor *v3;
  const CGFloat *Components;
  void *v5;

  if (a3)
  {
    v3 = (CGColor *)objc_msgSend(objc_retainAutorelease(a3), "CGColor");
    if (CGColorGetNumberOfComponents(v3) == 4)
    {
      Components = CGColorGetComponents(v3);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%02X%02X%02X"), llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getSuggestedColorForFailContrast:(id)a3 backgroundColor:(id)a4
{
  return 0;
}

@end
