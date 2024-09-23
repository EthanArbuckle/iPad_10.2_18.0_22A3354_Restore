@implementation CISegmentationFusion

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_segmentationFusion);
}

+ (id)customAttributes
{
  float v2;
  double v3;
  float v4;
  double v5;
  float v6;
  CIVector *v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  CIVector *v13;
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(&unk_1E2F1D760, "objectForKeyedSubscript:", CFSTR("additiveLowerAlpha")), "floatValue");
  v3 = v2;
  objc_msgSend((id)objc_msgSend(&unk_1E2F1D760, "objectForKeyedSubscript:", CFSTR("additiveUpperAlpha")), "floatValue");
  v5 = v4;
  objc_msgSend((id)objc_msgSend(&unk_1E2F1D760, "objectForKeyedSubscript:", CFSTR("additiveMaxBlur")), "floatValue");
  v7 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v3, v5, v6);
  objc_msgSend((id)objc_msgSend(&unk_1E2F1D760, "objectForKeyedSubscript:", CFSTR("subtractiveLowerAlpha")), "floatValue");
  v9 = v8;
  objc_msgSend((id)objc_msgSend(&unk_1E2F1D760, "objectForKeyedSubscript:", CFSTR("subtractiveUpperAlpha")), "floatValue");
  v11 = v10;
  objc_msgSend((id)objc_msgSend(&unk_1E2F1D760, "objectForKeyedSubscript:", CFSTR("subtractiveMaxBlur")), "floatValue");
  v13 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v9, v11, v12);
  v21[0] = CFSTR("inputAddBlur");
  v19[0] = CFSTR("CIAttributeType");
  v19[1] = CFSTR("CIAttributeDefault");
  v20[0] = CFSTR("CIAttributeTypePosition3");
  v20[1] = v7;
  v19[2] = CFSTR("CIAttributeIdentity");
  v20[2] = &unk_1E2F1B250;
  v22[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v21[1] = CFSTR("inputRemoveBlur");
  v17[0] = CFSTR("CIAttributeType");
  v17[1] = CFSTR("CIAttributeDefault");
  v18[0] = CFSTR("CIAttributeTypePosition3");
  v18[1] = v13;
  v17[2] = CFSTR("CIAttributeIdentity");
  v18[2] = &unk_1E2F1B250;
  v22[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v21[2] = CFSTR("inputApertureScaling");
  v15[0] = CFSTR("CIAttributeType");
  v15[1] = CFSTR("CIAttributeDefault");
  v16[0] = CFSTR("CIAttributeTypeScalar");
  v16[1] = &unk_1E2F1B260;
  v15[2] = CFSTR("CIAttributeIdentity");
  v16[2] = &unk_1E2F1B260;
  v22[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  BOOL result;

  -[CIVector Z](self->inputAddBlur, "Z");
  result = 0;
  if (v3 == 0.0)
  {
    -[CIVector Z](self->inputRemoveBlur, "Z");
    if (v4 == 0.0)
      return 1;
  }
  return result;
}

- (id)outputImage
{
  CIImage *inputMatteImage;
  double v4;
  double v5;
  CIImage *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  float v26;
  float v28;
  float v29;
  double v30;
  float v31;
  double v32;
  float v33;
  double v34;
  double v35;
  float v36;
  double v37;
  float v38;
  double v39;
  float v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float v46;
  double v47;
  float v48;
  double v49;
  float v50;
  double v51;
  float v52;
  double v53;
  float v54;
  double v55;
  float v56;
  float v57;
  double v58;
  double v59;
  CIVector *v60;
  CIVector *v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  float v73;
  CGAffineTransform v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[5];
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v77[4] = *MEMORY[0x1E0C80C00];
  inputMatteImage = self->inputMatteImage;
  if (!inputMatteImage)
    return self->inputImage;
  -[CIImage extent](inputMatteImage, "extent");
  if (v4 <= 1.0)
    return self->inputImage;
  -[CIImage extent](self->inputMatteImage, "extent");
  if (v5 <= 1.0)
    return self->inputImage;
  v6 = self->inputMatteImage;
  -[CIImage extent](v6, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CIImage extent](self->inputImage, "extent");
  v80.origin.x = v15;
  v80.origin.y = v16;
  v80.size.width = v17;
  v80.size.height = v18;
  v78.origin.x = v8;
  v78.origin.y = v10;
  v78.size.width = v12;
  v78.size.height = v14;
  if (!CGRectEqualToRect(v78, v80))
  {
    -[CIImage extent](self->inputMatteImage, "extent");
    if (!CGRectEqualToRect(v79, *MEMORY[0x1E0C9D5E0]))
    {
      -[CIImage extent](self->inputImage, "extent");
      v20 = v19;
      v22 = v21;
      -[CIImage extent](self->inputMatteImage, "extent");
      v24 = v20 / v23;
      v26 = v22 / v25;
      CGAffineTransformMakeScale(&v74, v24, v26);
      v6 = -[CIImage imageByApplyingTransform:](v6, "imageByApplyingTransform:", &v74);
    }
  }
  if (!self->inputImage)
    return 0;
  if (-[CISegmentationFusion _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v29 = v28;
  -[CIVector X](self->inputRemoveBlur, "X");
  v31 = v30;
  -[CIVector Y](self->inputRemoveBlur, "Y");
  v33 = v32;
  -[CIVector Z](self->inputRemoveBlur, "Z");
  *(float *)&v34 = v34;
  v73 = (float)(*(float *)&v34 / (float)(v33 - v31)) / v29;
  -[CIVector X](self->inputRemoveBlur, "X");
  v36 = v35;
  -[CIVector Y](self->inputRemoveBlur, "Y");
  v38 = v37;
  -[CIVector Z](self->inputRemoveBlur, "Z");
  *(float *)&v39 = v39;
  v40 = (float)((float)((float)((float)-*(float *)&v39 / (float)(v38 - v36)) * v36) + 0.0) / v29;
  -[NSNumber floatValue](self->inputApertureScaling, "floatValue");
  v42 = v41;
  -[CIVector Z](self->inputRemoveBlur, "Z");
  v44 = v29;
  *(float *)&v42 = v43 * v42 / v29;
  -[CIVector X](self->inputAddBlur, "X");
  v46 = v45;
  -[CIVector Z](self->inputAddBlur, "Z");
  v48 = v47;
  -[CIVector Y](self->inputAddBlur, "Y");
  *(float *)&v49 = v49;
  v50 = (float)((float)(0.0 - v48) / (float)(*(float *)&v49 - v46)) / v29;
  -[CIVector X](self->inputAddBlur, "X");
  v52 = v51;
  -[CIVector Z](self->inputAddBlur, "Z");
  v54 = v53;
  -[CIVector Y](self->inputAddBlur, "Y");
  *(float *)&v55 = v55;
  v56 = (float)(v54 + (float)((float)((float)-(float)(0.0 - v54) / (float)(*(float *)&v55 - v52)) * v52)) / v29;
  -[NSNumber floatValue](self->inputApertureScaling, "floatValue");
  v58 = v57;
  -[CIVector Z](self->inputAddBlur, "Z");
  *(float *)&v58 = v59 * v58 / v44;
  v60 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v73, v40, *(float *)&v42);
  v61 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v50, v56, *(float *)&v58);
  v62 = -[CISegmentationFusion kernel](self, "kernel");
  -[CIImage extent](self->inputImage, "extent");
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v77[0] = self->inputImage;
  v77[1] = v6;
  v77[2] = v61;
  v77[3] = v60;
  v71 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
  v75[0] = CFSTR("kCIKernelOutputFormat");
  v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  v75[1] = CFSTR("kCIImageAlphaOne");
  v76[0] = v72;
  v76[1] = MEMORY[0x1E0C9AAB0];
  return (id)objc_msgSend(v62, "applyWithExtent:arguments:options:", v71, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2), v64, v66, v68, v70);
}

@end
