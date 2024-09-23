@implementation AXMBrailleEdgesDetectorNode

+ (BOOL)isSupported
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)title
{
  return CFSTR("Braille Edge Detector");
}

- (id)_generateResultFromImage:(id)a3 canvasDescription:(id)a4 invert:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  size_t v10;
  size_t v11;
  void *v12;
  void *v13;
  void *v14;
  CGImage *v15;
  CGImage *v16;
  size_t Height;
  CGColorSpace *DeviceRGB;
  NSObject *v19;
  size_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  double v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  _BYTE *v36;
  size_t i;
  unint64_t v38;
  double v39;
  void *v41;
  size_t v42;
  char *v43;
  CGContext *c;
  void *v45;
  id v46;
  size_t Width;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];

  v5 = a5;
  v57[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "height");
  v11 = objc_msgSend(v9, "width");
  v12 = (void *)MEMORY[0x1E0C9DD90];
  v56 = *MEMORY[0x1E0C9DF58];
  v57[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contextWithOptions:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "extent");
  v15 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:", v8, 0.0, 0.0);
  if (v15)
  {
    v16 = v15;
    v45 = v14;
    v46 = v8;
    Width = CGImageGetWidth(v15);
    Height = CGImageGetHeight(v16);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v43 = (char *)malloc_type_calloc(4 * v10 * v11, 1uLL, 0x100004077774924uLL);
    c = CGBitmapContextCreate(v43, v11, v10, 8uLL, 4 * v11, DeviceRGB, 0x4001u);
    CGColorSpaceRelease(DeviceRGB);
    AXLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v10;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = Height;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", Height);
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", Width);
      *(_DWORD *)buf = 138413058;
      v49 = v41;
      v50 = 2112;
      v51 = v21;
      v52 = 2112;
      v53 = v22;
      v23 = (void *)v22;
      v54 = 2112;
      v55 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v55;
      _os_log_impl(&dword_1B0E3B000, v19, OS_LOG_TYPE_DEFAULT, "%@ %@ -- %@ %@", buf, 0x2Au);

      v10 = v20;
      Height = v42;
    }

    v25 = (double)((v11 - Width) >> 1);
    v26 = 0.0;
    if (v11 > Width)
    {
      v27 = Width;
    }
    else
    {
      v25 = 0.0;
      v27 = v11;
    }
    if (Height >= v10)
      v28 = v10;
    else
      v28 = Height;
    if (v10 > Height)
      v26 = (double)((v10 - Height) >> 1);
    v29 = (double)v27;
    v30 = (double)v28;
    CGContextDrawImage(c, *(CGRect *)&v25, v16);
    CGContextRelease(c);
    CFRelease(v16);
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v34 = 0;
      v35 = v43 + 2;
      do
      {
        v36 = v35;
        for (i = v11; i; --i)
        {
          LOBYTE(v32) = *(v36 - 2);
          LOBYTE(v33) = *(v36 - 1);
          *(double *)&v38 = (double)v33 * 0.7152 / 255.0;
          v39 = (double)v32 * 0.2126 / 255.0 + *(double *)&v38;
          LOBYTE(v38) = *v36;
          buf[0] = 0;
          buf[0] = -[AXMBrailleEdgesDetectorNode _mapLuminance:toDiscreteNumber:invert:](self, "_mapLuminance:toDiscreteNumber:invert:", objc_msgSend(v9, "numberOfDiscretePinHeights"), v5, v39 + (double)v38 * 0.0722 / 255.0);
          objc_msgSend(v31, "appendBytes:length:", buf, 1);
          v36 += 4;
        }
        ++v34;
        v35 += 4 * v11;
      }
      while (v34 != v20);
    }
    v14 = v45;
    v8 = v46;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (unsigned)_mapLuminance:(double)a3 toDiscreteNumber:(unint64_t)a4 invert:(BOOL)a5
{
  float v5;
  float v6;
  float v7;
  float v9;

  if (a5)
  {
    if (a4 >= 0x100)
    {
      v5 = a3 * -255.0 + 1.0;
      return vcvtps_s32_f32(v5);
    }
    else
    {
      v7 = (float)(a4 - 1) - (float)(a4 - 1) * a3;
      return vcvtms_u32_f32(v7);
    }
  }
  else if (a4 >= 0x100)
  {
    v6 = a3 * 255.0;
    return vcvtms_s32_f32(v6);
  }
  else
  {
    v9 = (float)(a4 - 1) * a3;
    return vcvtps_u32_f32(v9);
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AXMBrailleEdgesDetectorNode;
  v6 = a3;
  -[AXMEvaluationNode evaluate:metrics:](&v18, sel_evaluate_metrics_, v6, a4);
  objc_msgSend(v6, "sourceInput", v18.receiver, v18.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ciImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analysisOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMBrailleEdgesDetectorNode _processImage:analaysisOptions:](self, "_processImage:analaysisOptions:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "result");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analysisOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "brailleEdgeOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "canvasDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analysisOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "brailleEdgeOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMBrailleEdgesDetectorNode _generateResultFromImage:canvasDescription:invert:](self, "_generateResultFromImage:canvasDescription:invert:", v10, v14, objc_msgSend(v16, "invert"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBrailleEdges:", v17);

}

- (id)_processImage:(id)a3 analaysisOptions:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[4];

  v63[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "extent");
  if (v7 > 600.0)
  {
    objc_msgSend(v5, "extent");
    CGAffineTransformMakeScale(&v59, 600.0 / v8, 600.0 / v8);
    objc_msgSend(v5, "imageByApplyingTransform:highQualityDownsample:", &v59, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  objc_msgSend(v6, "brailleEdgeOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "edgeStrength");
  if (v11 > 0.0)
  {
    v12 = (void *)MEMORY[0x1E0C9DDB8];
    v14 = *MEMORY[0x1E0C9E200];
    v62[0] = *MEMORY[0x1E0C9E1F8];
    v13 = v62[0];
    v62[1] = v14;
    v63[0] = v5;
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "edgeStrength");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filterWithName:withInputParameters:", CFSTR("CIEdges"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C9DDB8];
    v60[0] = v13;
    objc_msgSend(v18, "outputImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v14;
    v61[0] = v20;
    v61[1] = &unk_1E6288BF8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filterWithName:withInputParameters:", CFSTR("CIBloom"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "outputImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "outputImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "extent");
    v26 = -v25;
    objc_msgSend(v23, "extent");
    CGAffineTransformMakeTranslation(&v57, v26, -v27);
    objc_msgSend(v23, "extent");
    v29 = v28;
    objc_msgSend(v5, "extent");
    v31 = v29 / v30;
    objc_msgSend(v23, "extent");
    v33 = v32;
    objc_msgSend(v5, "extent");
    CGAffineTransformScale(&v58, &v57, v31, v33 / v34);
    objc_msgSend(v24, "imageByApplyingTransform:", &v58);
    v35 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v35;
  }
  objc_msgSend(v10, "canvasDescription");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (double)(unint64_t)objc_msgSend(v36, "width");
  objc_msgSend(v5, "extent");
  v39 = v37 / v38 * 1.1;

  objc_msgSend(v10, "canvasDescription");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (double)(unint64_t)objc_msgSend(v40, "height");
  objc_msgSend(v5, "extent");
  v43 = v41 / v42 * 1.1;

  if (v39 < v43)
    v43 = v39;
  objc_msgSend(v10, "zoomLevel");
  CGAffineTransformMakeScale(&v56, v44 * v43, v44 * v43);
  objc_msgSend(v5, "imageByApplyingTransform:highQualityDownsample:", &v56, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "extent");
  v47 = v46;
  objc_msgSend(v10, "origin");
  v49 = -(v48 * v47);
  objc_msgSend(v45, "extent");
  v51 = v50;
  objc_msgSend(v10, "origin");
  CGAffineTransformMakeTranslation(&v55, v49, v51 * v52);
  objc_msgSend(v45, "imageByApplyingTransform:highQualityDownsample:", &v55, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

@end
