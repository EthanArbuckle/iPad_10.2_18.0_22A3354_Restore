@implementation CIHomographyResampler

- (CIHomographyResampler)init
{
  CIHomographyResampler *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  CIContext *ctx;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CIHomographyResampler;
  v2 = -[ImageHomographyResampler init](&v8, sel_init);
  if (v2)
  {
    v9[0] = *MEMORY[0x1E0C9DFC0];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = *MEMORY[0x1E0C9DF68];
    v10[0] = v3;
    v10[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    ctx = v2->_ctx;
    v2->_ctx = (CIContext *)v5;

  }
  return v2;
}

- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5
{
  return -[CIHomographyResampler ResampleCVPixels:clipToRect:outputSize:pixelBufferPool:](self, "ResampleCVPixels:clipToRect:outputSize:pixelBufferPool:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
}

- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 pixelBufferPool:(__CVPixelBufferPool *)a6
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  uint64_t v15;
  CFDictionaryRef PixelBufferAttributes;
  void *v17;
  int v18;
  void *v19;
  int v20;
  CVReturn v21;
  const __CFDictionary *v22;
  OSType PixelFormatType;
  CVPixelBufferRef v25;
  uint64_t v26;
  _QWORD v27[2];

  height = a5.height;
  width = a5.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v27[1] = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = *MEMORY[0x1E0CA8FF0];
  v27[0] = MEMORY[0x1E0C9AA70];
  v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  if (a6)
  {
    PixelBufferAttributes = CVPixelBufferPoolGetPixelBufferAttributes(a6);
    -[__CFDictionary objectForKeyedSubscript:](PixelBufferAttributes, "objectForKeyedSubscript:", CFSTR("Height"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntValue");

    -[__CFDictionary objectForKeyedSubscript:](PixelBufferAttributes, "objectForKeyedSubscript:", CFSTR("Width"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntValue");

    if (v18 != height || v20 != width)
      return v25;
    v21 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a6, &v25);
  }
  else
  {
    v22 = (const __CFDictionary *)v15;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v21 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)width, (unint64_t)height, PixelFormatType, v22, &v25);
  }
  if (!v21)
    -[CIHomographyResampler ResampleCVPixels:clipToRect:outputSize:toPixelBuffer:](self, "ResampleCVPixels:clipToRect:outputSize:toPixelBuffer:", a3, v25, x, y, v10, v9, width, height);
  return v25;
}

- (void)updateBackgroundFill:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_lastFillRect;
  id v9;
  void *v10;
  void *v11;
  CIImage *v12;
  CIImage *fillImage;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_lastFillRect = &self->_lastFillRect;
  if (!CGRectEqualToRect(a3, self->_lastFillRect))
  {
    v9 = objc_alloc(MEMORY[0x1E0C9DDC8]);
    objc_msgSend(MEMORY[0x1E0C9DD80], "grayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithColor:", v10);
    objc_msgSend(v11, "imageByCroppingToRect:", x, y, width, height);
    v12 = (CIImage *)objc_claimAutoreleasedReturnValue();
    fillImage = self->_fillImage;
    self->_fillImage = v12;

    p_lastFillRect->origin.x = x;
    p_lastFillRect->origin.y = y;
    p_lastFillRect->size.width = width;
    p_lastFillRect->size.height = height;
  }
}

- (signed)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 toPixelBuffer:(__CVBuffer *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  float v15;
  float v16;
  void *v17;
  __int128 v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  float v52;
  float v53;
  void *v54;
  void *v55;
  void *v56;
  float v57;
  float v58;
  void *v59;
  void *v61;
  void *v62;
  double v65;
  double v66;
  double v67;
  double v68;
  float v69;
  float v70;
  void *v71;
  void *v72;
  float v73;
  void *v74;
  void *v75;
  void *v76;
  double v78;
  void *v79;
  float v80;
  void *v81;
  float v82;
  void *v83;
  CGAffineTransform v84;
  CGAffineTransform v85;
  CGAffineTransform v86;
  CGAffineTransform v87;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  uint64_t v100;
  CGRect CleanRect;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v100 = *MEMORY[0x1E0C80C00];
  CleanRect = CVImageBufferGetCleanRect(a3);
  v11 = CleanRect.origin.x;
  v12 = CleanRect.origin.y;
  v78 = CleanRect.size.width;
  v13 = CleanRect.size.height;
  v14 = 0;
  v15 = (float)(unint64_t)CleanRect.size.height;
  do
  {
    v16 = self->super.homographyMatrix[v14];
    *(&v91 + v14++) = v16;
  }
  while (v14 != 9);
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a3);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "imageByCroppingToRect:", v11, v12, v78, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v89.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v89.c = v18;
  *(_OWORD *)&v89.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformTranslate(&v90, &v89, -v11, -v12);
  v62 = v17;
  objc_msgSend(v17, "imageByApplyingTransform:", &v90);
  v66 = y;
  v67 = width;
  v68 = height;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "imageByApplyingOrientation:", 4);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = x;
  v19 = v91;
  v73 = v92;
  v20 = v92 * v15;
  v82 = v93;
  v21 = v93 + (float)((float)(v92 * v15) + (float)(v91 * 0.0));
  v22 = v96;
  v70 = v95;
  v23 = v95 * v15;
  v80 = v94;
  v24 = v96 + (float)((float)(v95 * v15) + (float)(v94 * 0.0));
  v25 = v97;
  v69 = v98;
  v26 = v98 * v15;
  v27 = (float)(v98 * v15) + (float)(v97 * 0.0);
  v28 = v99;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", (float)(v21 / (float)(v99 + v27)), (float)(v24 / (float)(v99 + v27)));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (float)(unint64_t)v78;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", (float)((float)(v82 + (float)(v20 + (float)(v19 * v29))) / (float)(v28 + (float)(v26 + (float)(v25 * v29)))), (float)((float)(v22 + (float)(v23 + (float)(v80 * v29))) / (float)(v28 + (float)(v26 + (float)(v25 * v29)))));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v73 * 0.0;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", (float)((float)(v82 + (float)((float)(v73 * 0.0) + (float)(v19 * v29)))/ (float)(v28 + (float)((float)(v69 * 0.0) + (float)(v25 * v29)))), (float)((float)(v22 + (float)((float)(v70 * 0.0) + (float)(v80 * v29)))/ (float)(v28 + (float)((float)(v69 * 0.0) + (float)(v25 * v29)))));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", (float)((float)(v82 + (float)(v30 + (float)(v19 * 0.0)))/ (float)(v28 + (float)((float)(v69 * 0.0) + (float)(v25 * 0.0)))), (float)((float)(v22 + (float)((float)(v70 * 0.0) + (float)(v80 * 0.0)))/ (float)(v28 + (float)((float)(v69 * 0.0) + (float)(v25 * 0.0)))));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIPerspectiveTransform"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CICrop"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setValue:forKey:", v75, CFSTR("inputTopLeft"));
  objc_msgSend(v31, "setValue:forKey:", v79, CFSTR("inputTopRight"));
  objc_msgSend(v31, "setValue:forKey:", v74, CFSTR("inputBottomRight"));
  objc_msgSend(v31, "setValue:forKey:", v83, CFSTR("inputBottomLeft"));
  objc_msgSend(v31, "setValue:forKey:", v72, CFSTR("inputImage"));
  objc_msgSend(v31, "outputImage");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIHomographyResampler updateBackgroundFill:](self, "updateBackgroundFill:", v65, v66, v67, v68);
  objc_msgSend(v81, "imageByCompositingOverImage:", self->_fillImage);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", (double)(int)v65, (double)(int)v66, (double)((int)(v67 + (double)(int)v65) - (int)v65), (double)((int)(v68 + (double)(int)v66) - (int)v66));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setValue:forKey:", v33, CFSTR("inputRectangle"));

  objc_msgSend(v32, "setValue:forKey:", v71, CFSTR("inputImage"));
  objc_msgSend(v32, "outputImage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!CGRectIsEmpty(self->hightlightRect))
  {
    objc_msgSend(v34, "extent");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CICrop"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", self->hightlightRect.origin.x, self->hightlightRect.origin.y, self->hightlightRect.size.width, self->hightlightRect.size.height);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setValue:forKey:", v44, CFSTR("inputRectangle"));

    objc_msgSend(v43, "setValue:forKey:", v34, CFSTR("inputImage"));
    objc_msgSend(v43, "outputImage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorControls"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = 1050253722;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setValue:forKey:", v48, CFSTR("inputContrast"));

    objc_msgSend(v46, "setValue:forKey:", v34, CFSTR("inputImage"));
    objc_msgSend(v46, "outputImage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "imageByCompositingOverImage:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "imageByCroppingToRect:", v36, v38, v40, v42);
    v51 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v51;
  }
  v52 = v65;
  v53 = v66;
  CGAffineTransformMakeTranslation(&v88, (float)-v52, (float)-v53);
  objc_msgSend(v34, "imageByApplyingTransform:", &v88);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  memset(&v87, 0, sizeof(v87));
  if (v54)
    objc_msgSend(v54, "imageTransformForOrientation:", 4);
  else
    memset(&v86, 0, sizeof(v86));
  CGAffineTransformInvert(&v87, &v86);
  v85 = v87;
  objc_msgSend(v55, "imageByApplyingTransform:", &v85);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = a5.width / v67;
  v58 = a5.height / v68;
  CGAffineTransformMakeScale(&v84, v57, v58);
  objc_msgSend(v56, "imageByApplyingTransform:", &v84);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  CVBufferPropagateAttachments(a3, a6);
  CVBufferRemoveAttachment(a6, (CFStringRef)*MEMORY[0x1E0CA8D50]);
  -[CIContext render:toCVPixelBuffer:](self->_ctx, "render:toCVPixelBuffer:", v59, a6);

  return 0;
}

- (CGRect)hightlightRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->hightlightRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setHightlightRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->hightlightRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillImage, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
}

@end
