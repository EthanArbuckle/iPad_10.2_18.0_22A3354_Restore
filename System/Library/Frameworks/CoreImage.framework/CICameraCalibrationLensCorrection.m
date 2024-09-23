@implementation CICameraCalibrationLensCorrection

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryDistortionEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("12");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.14");
  v6[3] = CFSTR("inputUseInverseLookUpTable");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = CFSTR("CIAttributeTypeBoolean");
  v4[1] = MEMORY[0x1E0C9AAA0];
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  int v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  objc_super v12;

  v7 = objc_msgSend(a4, "isEqualToString:", CFSTR("inputImage"));
  if (a3)
  {
    if (v7)
    {
      v8 = (void *)objc_msgSend(a3, "depthData");
      if (AVFDepthCameraCalibrationData(v8, v9))
      {
        if (!self->inputAVCameraCalibrationData)
        {
          v10 = (void *)objc_msgSend(a3, "depthData");
          -[CICameraCalibrationLensCorrection setValue:forKey:](self, "setValue:forKey:", AVFDepthCameraCalibrationData(v10, v11), CFSTR("inputAVCameraCalibrationData"));
        }
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CICameraCalibrationLensCorrection;
  -[CICameraCalibrationLensCorrection setValue:forKey:](&v12, sel_setValue_forKey_, a3, a4);
}

- (CGPoint)ReferenceensDistortionPointForPoint:(CGPoint)a3 lookupTable:(id)a4 distortionOpticalCenter:(CGPoint)a5 imageSize:(CGSize)a6
{
  double y;
  double x;
  double v9;
  float v10;
  double v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  unint64_t v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v9 = a6.width - a5.x;
  if (x > v9)
    v9 = x;
  v10 = v9;
  v11 = a6.height - a5.y;
  if (y > v11)
    v11 = y;
  v12 = v11;
  v13 = sqrtf((float)(v12 * v12) + (float)(v10 * v10));
  v14 = a3.x - x;
  v15 = a3.y - y;
  v16 = sqrtf((float)(v15 * v15) + (float)(v14 * v14));
  v17 = objc_msgSend(a4, "bytes");
  v18 = ((unint64_t)objc_msgSend(a4, "length") >> 2) - 1;
  if (v16 >= v13)
  {
    v20 = *(float *)(v17 + 4 * v18);
  }
  else
  {
    v19 = (float)(v16 * (float)v18) / v13;
    v20 = (float)((float)(v19 - (float)(int)v19) * *(float *)(v17 + 4 * (int)v19 + 4))
        + (float)((float)(1.0 - (float)(v19 - (float)(int)v19)) * *(float *)(v17 + 4 * (int)v19));
  }
  v21 = v15 + (float)(v20 * v15);
  v22 = x + (float)(v14 + (float)(v20 * v14));
  v23 = y + v21;
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGRect)regionOf:(int)a3 destRect:(CGRect)a4 userInfo:(id)a5
{
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double height;
  double width;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float v52;
  float v53;
  double x;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double y;
  float v65;
  double v66;
  double v67;
  double v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect result;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  y = a4.origin.y;
  x = a4.origin.x;
  if (a3 < 1)
  {
    height = a4.size.height;
    width = a4.size.width;
    v13 = (void *)objc_msgSend(a5, "valueForKey:", CFSTR("inputExtent"));
    objc_msgSend(v13, "X");
    objc_msgSend(v13, "Y");
    objc_msgSend(v13, "Z");
    v63 = v14;
    objc_msgSend(v13, "W");
    v68 = v15;
    v16 = objc_msgSend(a5, "valueForKey:", CFSTR("lookUpTable"));
    v17 = (void *)objc_msgSend(a5, "valueForKey:", CFSTR("opticalCenter"));
    objc_msgSend(v17, "X");
    v67 = v18;
    objc_msgSend(v17, "Y");
    v66 = v19;
    v8 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v20 = 2.0;
    if (width >= 2.0)
      v21 = width;
    else
      v21 = 2.0;
    v22 = v21;
    if (height >= 2.0)
      v20 = height;
    v23 = v20;
    v52 = v23;
    v53 = v22;
    v49 = y + v23;
    v50 = v23;
    v51 = v22;
    v48 = x + v22;
    v24 = 0.0;
    v25 = 0.0;
    do
    {
      v65 = v24;
      v26 = x + (float)(v24 * v53);
      v27 = v7;
      v28 = v8;
      -[CICameraCalibrationLensCorrection ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:](self, "ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v16, v26, y, v67, v66, v63, v68);
      v81.origin.x = v29;
      v81.origin.y = v30;
      v69.size.width = 0.0;
      v69.size.height = 0.0;
      v81.size.width = 0.0;
      v81.size.height = 0.0;
      v69.origin.x = v26;
      v69.origin.y = y;
      v82 = CGRectUnion(v69, v81);
      v70.origin.x = v28;
      v70.origin.y = v9;
      v70.size.width = v6;
      v70.size.height = v27;
      v71 = CGRectUnion(v70, v82);
      v59 = v71.origin.y;
      v61 = v71.origin.x;
      v55 = v71.size.height;
      v57 = v71.size.width;
      v31 = 1.0 - v25;
      -[CICameraCalibrationLensCorrection ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:](self, "ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v16, x + v51 * v31, v49, v67, v66, v63, v68);
      v83.origin.x = v32;
      v83.origin.y = v33;
      v72.size.width = 0.0;
      v72.size.height = 0.0;
      v83.size.width = 0.0;
      v83.size.height = 0.0;
      v72.origin.x = x + v51 * v31;
      v72.origin.y = v49;
      v84 = CGRectUnion(v72, v83);
      v73.origin.y = v59;
      v73.origin.x = v61;
      v73.size.height = v55;
      v73.size.width = v57;
      v74 = CGRectUnion(v73, v84);
      v60 = v74.origin.y;
      v62 = v74.origin.x;
      v56 = v74.size.height;
      v58 = v74.size.width;
      -[CICameraCalibrationLensCorrection ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:](self, "ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v16, x, y + v50 * v31, v67, v66, v63, v68);
      v85.origin.x = v34;
      v85.origin.y = v35;
      v75.size.width = 0.0;
      v75.size.height = 0.0;
      v85.size.width = 0.0;
      v85.size.height = 0.0;
      v75.origin.x = x;
      v75.origin.y = y + v50 * v31;
      v86 = CGRectUnion(v75, v85);
      v76.origin.y = v60;
      v76.origin.x = v62;
      v76.size.height = v56;
      v76.size.width = v58;
      v77 = CGRectUnion(v76, v86);
      v36 = v77.origin.x;
      v37 = v77.origin.y;
      v38 = v77.size.width;
      v39 = v77.size.height;
      -[CICameraCalibrationLensCorrection ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:](self, "ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v16, v48, y + (float)(v65 * v52), v67, v66, v63, v68);
      v87.origin.x = v40;
      v87.origin.y = v41;
      v78.size.width = 0.0;
      v78.size.height = 0.0;
      v87.size.width = 0.0;
      v87.size.height = 0.0;
      v78.origin.x = v48;
      v78.origin.y = y + (float)(v65 * v52);
      v88 = CGRectUnion(v78, v87);
      v79.origin.x = v36;
      v79.origin.y = v37;
      v79.size.width = v38;
      v79.size.height = v39;
      *(CGRect *)(&v7 - 3) = CGRectUnion(v79, v88);
      v8 = v42;
      v9 = v43;
      v6 = v44;
      v24 = v65 + 0.125;
      v25 = (float)(v65 + 0.125);
    }
    while (v25 < 0.99999);
  }
  else
  {
    v6 = (double)(int)objc_msgSend((id)objc_msgSend(a5, "valueForKey:", CFSTR("lookUpTableLength"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "intValue");
    v7 = 1.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  v45 = v8;
  v46 = v9;
  v47 = v6;
  result.size.height = v7;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (id)outputImage
{
  id result;
  double x;
  double y;
  double width;
  double height;
  const char *v8;
  _BOOL4 v9;
  AVCameraCalibrationData *inputAVCameraCalibrationData;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v28;
  float v29;
  double v30;
  float v31;
  float v32;
  CIImage *v33;
  CIKernel *v34;
  CIImage *inputImage;
  _QWORD v36[13];
  _QWORD v37[4];
  CGRect v38;
  CGRect v39;

  v37[3] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    if (!self->inputAVCameraCalibrationData)
      return 0;
    objc_msgSend(result, "extent");
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    if (CGRectIsInfinite(v38))
      return 0;
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    if (CGRectIsNull(v39))
    {
      return 0;
    }
    else
    {
      v9 = -[NSNumber BOOLValue](self->inputUseInverseLookUpTable, "BOOLValue");
      inputAVCameraCalibrationData = self->inputAVCameraCalibrationData;
      if (v9)
        v11 = AVCameraCalibrationDataInverseLensDistortionLookupTable(inputAVCameraCalibrationData, v8);
      else
        v11 = AVCameraCalibrationDataLensDistortionLookupTable(inputAVCameraCalibrationData, v8);
      v12 = v11;
      v13 = objc_msgSend(v11, "length");
      v14 = v13 >> 2;
      v15 = AVCameraCalibrationDataIntrinsicLensDistortionCenter(self->inputAVCameraCalibrationData);
      v17 = v16;
      -[CIImage extent](self->inputImage, "extent");
      v20 = v19;
      v21 = v18;
      if (v15 > v19 || v17 > v18)
      {
        v23 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(self->inputAVCameraCalibrationData);
        if (v20 <= v21)
          v25 = v21;
        else
          v25 = v20;
        if (v23 <= v24)
          v23 = v24;
        v26 = v25 / v23;
        v27 = v26;
        v15 = v15 * v27;
        v17 = v17 * v27;
      }
      v28 = v20 - v15;
      if (v15 > v20 - v15)
        v28 = v15;
      v29 = v28;
      v30 = v21 - v17;
      if (v17 > v21 - v17)
        v30 = v17;
      v31 = v30;
      v32 = sqrtf((float)(v31 * v31) + (float)(v29 * v29));
      v33 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v12, v13 & 0xFFFFFFFFFFFFFFFCLL, 2307, 0, (double)v14, 1.0);
      v34 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_radialLensDistortion);
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __48__CICameraCalibrationLensCorrection_outputImage__block_invoke;
      v36[3] = &unk_1E2EC2F30;
      *(double *)&v36[6] = x;
      *(double *)&v36[7] = y;
      *(double *)&v36[8] = width;
      *(double *)&v36[9] = height;
      v36[4] = self;
      v36[5] = v12;
      v36[10] = v14;
      inputImage = self->inputImage;
      *(double *)&v36[11] = v15;
      *(double *)&v36[12] = v17;
      v37[0] = inputImage;
      v37[1] = v33;
      v37[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v15, v17, v32, (double)v14);
      return -[CIKernel applyWithExtent:roiCallback:arguments:options:](v34, "applyWithExtent:roiCallback:arguments:options:", v36, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3), 0, x, y, width, height);
    }
  }
  return result;
}

uint64_t __48__CICameraCalibrationLensCorrection_outputImage__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  void *v12;
  CIVector *v13;
  uint64_t v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v12 = *(void **)(a1 + 32);
  v16[0] = CFSTR("inputExtent");
  v13 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v14 = *(_QWORD *)(a1 + 40);
  v17[0] = v13;
  v17[1] = v14;
  v16[1] = CFSTR("lookUpTable");
  v16[2] = CFSTR("lookUpTableLength");
  v17[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 80));
  v16[3] = CFSTR("opticalCenter");
  v17[3] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  return objc_msgSend(v12, "regionOf:destRect:userInfo:", a2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4), a3, a4, a5, a6);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (AVCameraCalibrationData)inputAVCameraCalibrationData
{
  return self->inputAVCameraCalibrationData;
}

- (void)setInputAVCameraCalibrationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputUseInverseLookUpTable
{
  return self->inputUseInverseLookUpTable;
}

- (void)setInputUseInverseLookUpTable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
