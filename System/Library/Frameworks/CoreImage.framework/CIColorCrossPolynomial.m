@implementation CIColorCrossPolynomial

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorCrossPolynomial);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[7];
  _QWORD v10[6];
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v27 = 0;
  v22 = 0x3FF0000000000000;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17[0] = 0;
  v17[1] = 0x3FF0000000000000;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_QWORD *)&v13 = 0x3FF0000000000000;
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryColorEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryInterlaced");
  v9[3] = CFSTR("CICategoryNonSquarePixels");
  v9[4] = CFSTR("CICategoryStillImage");
  v9[5] = CFSTR("CICategoryHighDynamicRange");
  v9[6] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v11[1] = CFSTR("7");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.9");
  v10[3] = CFSTR("inputRedCoefficients");
  v7[0] = CFSTR("CIAttributeDefault");
  v8[0] = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v22, 10);
  v7[1] = CFSTR("CIAttributeIdentity");
  v8[1] = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v22, 10);
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v10[4] = CFSTR("inputGreenCoefficients");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeIdentity");
  v6[0] = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v17, 10);
  v6[1] = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v17, 10);
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v10[5] = CFSTR("inputBlueCoefficients");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeIdentity");
  v4[0] = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v12, 10);
  v4[1] = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v12, 10);
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (BOOL)_isIdentity
{
  return 0;
}

- (id)outputImage
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CIVector *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CIVector *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CIVector *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CIVector *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CIVector *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CIVector *v59;
  CIImage *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  id v69;
  CIVector *v70;
  CIVector *v71;
  CIVector *v72;
  CIVector *v73;
  _QWORD v74[13];

  v74[11] = *MEMORY[0x1E0C80C00];
  if (-[CIColorCrossPolynomial _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[CIVector X](self->inputRedCoefficients, "X");
  v5 = v4;
  -[CIVector X](self->inputGreenCoefficients, "X");
  v7 = v6;
  -[CIVector X](self->inputBlueCoefficients, "X");
  v73 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v5, v7, v8);
  -[CIVector Y](self->inputRedCoefficients, "Y");
  v10 = v9;
  -[CIVector Y](self->inputGreenCoefficients, "Y");
  v12 = v11;
  -[CIVector Y](self->inputBlueCoefficients, "Y");
  v72 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v10, v12, v13);
  -[CIVector Z](self->inputRedCoefficients, "Z");
  v15 = v14;
  -[CIVector Z](self->inputGreenCoefficients, "Z");
  v17 = v16;
  -[CIVector Z](self->inputBlueCoefficients, "Z");
  v71 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v15, v17, v18);
  -[CIVector valueAtIndex:](self->inputRedCoefficients, "valueAtIndex:", 3);
  v20 = v19;
  -[CIVector valueAtIndex:](self->inputGreenCoefficients, "valueAtIndex:", 3);
  v22 = v21;
  -[CIVector valueAtIndex:](self->inputBlueCoefficients, "valueAtIndex:", 3);
  v70 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v20, v22, v23);
  -[CIVector valueAtIndex:](self->inputRedCoefficients, "valueAtIndex:", 4);
  v25 = v24;
  -[CIVector valueAtIndex:](self->inputGreenCoefficients, "valueAtIndex:", 4);
  v27 = v26;
  -[CIVector valueAtIndex:](self->inputBlueCoefficients, "valueAtIndex:", 4);
  v29 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v25, v27, v28);
  -[CIVector valueAtIndex:](self->inputRedCoefficients, "valueAtIndex:", 5);
  v31 = v30;
  -[CIVector valueAtIndex:](self->inputGreenCoefficients, "valueAtIndex:", 5);
  v33 = v32;
  -[CIVector valueAtIndex:](self->inputBlueCoefficients, "valueAtIndex:", 5);
  v35 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v31, v33, v34);
  -[CIVector valueAtIndex:](self->inputRedCoefficients, "valueAtIndex:", 6);
  v37 = v36;
  -[CIVector valueAtIndex:](self->inputGreenCoefficients, "valueAtIndex:", 6);
  v39 = v38;
  -[CIVector valueAtIndex:](self->inputBlueCoefficients, "valueAtIndex:", 6);
  v41 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v37, v39, v40);
  -[CIVector valueAtIndex:](self->inputRedCoefficients, "valueAtIndex:", 7);
  v43 = v42;
  -[CIVector valueAtIndex:](self->inputGreenCoefficients, "valueAtIndex:", 7);
  v45 = v44;
  -[CIVector valueAtIndex:](self->inputBlueCoefficients, "valueAtIndex:", 7);
  v47 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v43, v45, v46);
  -[CIVector valueAtIndex:](self->inputRedCoefficients, "valueAtIndex:", 8);
  v49 = v48;
  -[CIVector valueAtIndex:](self->inputGreenCoefficients, "valueAtIndex:", 8);
  v51 = v50;
  -[CIVector valueAtIndex:](self->inputBlueCoefficients, "valueAtIndex:", 8);
  v53 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v49, v51, v52);
  -[CIVector valueAtIndex:](self->inputRedCoefficients, "valueAtIndex:", 9);
  v55 = v54;
  -[CIVector valueAtIndex:](self->inputGreenCoefficients, "valueAtIndex:", 9);
  v57 = v56;
  -[CIVector valueAtIndex:](self->inputBlueCoefficients, "valueAtIndex:", 9);
  v59 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v55, v57, v58);
  v60 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  -[CIImage extent](self->inputImage, "extent");
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v69 = -[CIColorCrossPolynomial _kernel](self, "_kernel");
  v74[0] = v60;
  v74[1] = v73;
  v74[2] = v72;
  v74[3] = v71;
  v74[4] = v70;
  v74[5] = v29;
  v74[6] = v35;
  v74[7] = v41;
  v74[8] = v47;
  v74[9] = v53;
  v74[10] = v59;
  return (id)objc_msgSend((id)objc_msgSend(v69, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 11), v62, v64, v66, v68), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputRedCoefficients
{
  return self->inputRedCoefficients;
}

- (void)setInputRedCoefficients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputGreenCoefficients
{
  return self->inputGreenCoefficients;
}

- (void)setInputGreenCoefficients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputBlueCoefficients
{
  return self->inputBlueCoefficients;
}

- (void)setInputBlueCoefficients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
