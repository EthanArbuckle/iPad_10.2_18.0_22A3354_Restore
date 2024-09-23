@implementation PVColorSpace(JFX)

+ (id)jfx_getColorSpaceFromColorPrimaries:()JFX transferFunction:matrix:
{
  void *v8;
  NSObject *v9;

  if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isRec709Gamma:transferFunction:matrix:"))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isP3D65:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "p3d65GammaColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isSRGBColorSpace:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "sRGBColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isRec601Gamma:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec601_1_1_6_GammaColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isRec709Linear:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec709LinearColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isP3HLG:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "p3HLGGammaColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isP3PQ:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "p3PQGammaColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isRec2100HLG:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec2100HLGColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isRec2100PQ:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec2100PQColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE78FF8], "JFX_isRec2020Linear:transferFunction:matrix:", a3, a4, a5))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec2020LinearColorSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    JFXLog_core();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[PVColorSpace(JFX) jfx_getColorSpaceFromColorPrimaries:transferFunction:matrix:].cold.1(v9);

    v8 = 0;
  }
  return v8;
}

+ (uint64_t)jfx_getColorSpaceFromPixelBuffer:()JFX
{
  const __CFDictionary *v4;
  const void *Value;
  const void *v6;
  const void *v7;

  v4 = CVBufferCopyAttachments(buffer, kCVAttachmentMode_ShouldPropagate);
  Value = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDC5490]);
  v6 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDC5510]);
  v7 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDC5570]);
  if (v4)
    CFRelease(v4);
  return objc_msgSend(a1, "jfx_getColorSpaceFromColorPrimaries:transferFunction:matrix:", Value, v6, v7);
}

+ (uint64_t)jfx_getColorSpaceFromImageBuffer:()JFX
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "cvPixelBuffer");
  return objc_msgSend(MEMORY[0x24BE78FF8], "jfx_getColorSpaceFromPixelBuffer:", v3);
}

+ (id)jfx_getColorSpaceFromCaptureColorSpace:()JFX
{
  void *v3;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec2100HLGColorSpace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1)
      objc_msgSend(MEMORY[0x24BE78FF8], "p3d65GammaColorSpace");
    else
      objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)jfx_getColorSpaceFromCGColorSpace:()JFX
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (jfx_getColorSpaceFromCGColorSpace__onceToken != -1)
    dispatch_once(&jfx_getColorSpaceFromCGColorSpace__onceToken, &__block_literal_global_54);
  CGColorSpaceGetName(space);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)jfx_getColorSpaceFromCGColorSpace__s_HDRColorSpaceLookup, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (CGColorSpaceIsWideGamutRGB(space))
    {
      objc_msgSend(MEMORY[0x24BE78FF8], "p3d65GammaColorSpace");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDBF2D8]))
        objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
      else
        objc_msgSend(MEMORY[0x24BE78FF8], "sRGBColorSpace");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v6;
  }

  return v5;
}

+ (id)jfx_compareAndChooseGreaterColorSpace:()JFX right:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = __65__PVColorSpace_JFX__jfx_compareAndChooseGreaterColorSpace_right___block_invoke((uint64_t)v6, v5);
  if (v7 >= __65__PVColorSpace_JFX__jfx_compareAndChooseGreaterColorSpace_right___block_invoke(v7, v6))v8 = v5;
  else
    v8 = v6;
  v9 = v8;

  return v9;
}

+ (id)jfx_compareAndChooseLesserColorSpace:()JFX right:
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BE78FF8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "jfx_compareAndChooseGreaterColorSpace:right:", v7, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
    v9 = v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (uint64_t)jfx_getCVPixelFormatForDisplay
{
  uint64_t v2;

  v2 = 1111970369;
  if ((objc_msgSend(a1, "isP3d65GammaColorSpace") & 1) == 0)
  {
    v2 = 2016686640;
    if ((objc_msgSend(a1, "isWideGamutSpace") & 1) == 0)
    {
      if (objc_msgSend(a1, "isHDRSpace"))
        return 2016686640;
      else
        return 1111970369;
    }
  }
  return v2;
}

- (uint64_t)jfx_getCVPixelFormatForExport
{
  if (objc_msgSend(a1, "isHDRSpace"))
    return 2016686640;
  else
    return 875704438;
}

- (void)jfx_attachColorSpaceToPixelBuffer:()JFX
{
  id v4;

  objc_msgSend(a1, "nclcTriplet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  CVBufferSetAttachment(a3, (CFStringRef)*MEMORY[0x24BDC5490], (CFTypeRef)objc_msgSend(v4, "colorPrimary"), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(a3, (CFStringRef)*MEMORY[0x24BDC5510], (CFTypeRef)objc_msgSend(v4, "transferFunction"), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(a3, (CFStringRef)*MEMORY[0x24BDC5570], (CFTypeRef)objc_msgSend(v4, "ycbcrMatrix"), kCVAttachmentMode_ShouldPropagate);

}

- (id)jfx_videoExportColorSpace
{
  void *v2;

  if (objc_msgSend(a1, "isHDRSpace"))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec2100HLGColorSpace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(a1, "isWideGamutSpace"))
      objc_msgSend(MEMORY[0x24BE78FF8], "p3d65GammaColorSpace");
    else
      objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (uint64_t)JFX_compareTriplets:()JFX transferFunction:matrix:validNCLCTriplets:
{
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;

  v9 = a6;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ColorPrimaries"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", a3);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TransferFunctions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", a4);

  if (a5)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Matrices"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", a5);

  }
  else
  {
    v15 = 1;
  }

  return v11 & v13 & v15;
}

+ (id)JFX_nclcDictionaryForColorSpace:()JFX
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "nclcTriplet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("ColorPrimaries");
  v11 = objc_msgSend(v3, "colorPrimary");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("TransferFunctions");
  v10 = objc_msgSend(v3, "transferFunction");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("Matrices");
  v9 = objc_msgSend(v3, "ycbcrMatrix");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)JFX_isRec709Gamma:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x24BE78FF8];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isSRGBColorSpace:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x24BE78FF8];
  objc_msgSend(MEMORY[0x24BE78FF8], "sRGBColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isP3D65:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE78FF8], "p3d65GammaColorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nclcTriplet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = CFSTR("ColorPrimaries");
  v20 = objc_msgSend(v9, "colorPrimary");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v21[1] = CFSTR("TransferFunctions");
  v19 = objc_msgSend(v9, "transferFunction");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  v21[2] = CFSTR("Matrices");
  v12 = objc_msgSend(v9, "ycbcrMatrix");
  v13 = *MEMORY[0x24BDC5590];
  v18[0] = v12;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v15);
  return v16;
}

+ (uint64_t)JFX_isRec601Gamma:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x24BE78FF8];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec601_1_1_6_GammaColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isRec709Linear:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x24BE78FF8];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec709LinearColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isP3HLG:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE78FF8], "p3HLGGammaColorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nclcTriplet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = CFSTR("ColorPrimaries");
  v20 = objc_msgSend(v9, "colorPrimary");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v21[1] = CFSTR("TransferFunctions");
  v19 = objc_msgSend(v9, "transferFunction");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  v21[2] = CFSTR("Matrices");
  v12 = objc_msgSend(v9, "ycbcrMatrix");
  v13 = *MEMORY[0x24BDC5580];
  v18[0] = v12;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v15);
  return v16;
}

+ (uint64_t)JFX_isP3PQ:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x24BE78FF8];
  objc_msgSend(MEMORY[0x24BE78FF8], "p3PQGammaColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isRec2100HLG:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x24BE78FF8];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec2100HLGColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isRec2100PQ:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x24BE78FF8];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec2100PQColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (uint64_t)JFX_isRec2020Linear:()JFX transferFunction:matrix:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x24BE78FF8];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec2020LinearColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JFX_nclcDictionaryForColorSpace:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x24BE78FF8], "JFX_compareTriplets:transferFunction:matrix:validNCLCTriplets:", a3, a4, a5, v10);
  return v11;
}

+ (void)jfx_getColorSpaceFromColorPrimaries:()JFX transferFunction:matrix:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269A9000, log, OS_LOG_TYPE_ERROR, "Unsupported NCLC triplet colorspace", v1, 2u);
}

@end
