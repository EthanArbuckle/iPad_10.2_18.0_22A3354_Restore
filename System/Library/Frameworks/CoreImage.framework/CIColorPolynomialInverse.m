@implementation CIColorPolynomialInverse

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorPolynomialInverse);
}

- (id)_kernelRGB
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorPolynomialInverseRGB);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[8];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryColorAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryInterlaced");
  v11[3] = CFSTR("CICategoryNonSquarePixels");
  v11[4] = CFSTR("CICategoryStillImage");
  v11[5] = CFSTR("CICategoryHighDynamicRange");
  v11[6] = CFSTR("CICategoryBuiltIn");
  v11[7] = CFSTR("CICategoryApplePrivate");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 8);
  v13[1] = CFSTR("14");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("11.0");
  v12[3] = CFSTR("inputRedCoefficients");
  v9[0] = CFSTR("CIAttributeDefault");
  v10[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v9[1] = CFSTR("CIAttributeIdentity");
  v10[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputGreenCoefficients");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeIdentity");
  v8[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v8[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v12[5] = CFSTR("inputBlueCoefficients");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeIdentity");
  v6[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v6[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputAlphaCoefficients");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeIdentity");
  v4[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v4[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (BOOL)_isInvertible
{
  CIVector *inputGreenCoefficients;
  CIVector *inputAlphaCoefficients;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  inputGreenCoefficients = self->super.inputGreenCoefficients;
  v26[0] = self->super.inputRedCoefficients;
  v26[1] = inputGreenCoefficients;
  inputAlphaCoefficients = self->super.inputAlphaCoefficients;
  v26[2] = self->super.inputBlueCoefficients;
  v26[3] = inputAlphaCoefficients;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "W");
        v11 = fabs(v10);
        objc_msgSend(v9, "Z");
        v13 = v12;
        if (v11 >= 0.00001)
        {
          objc_msgSend(v9, "Z");
          v16 = v13 * v15;
          objc_msgSend(v9, "W");
          v18 = v17 * 3.0;
          objc_msgSend(v9, "Y");
          if (v16 > v18 * v19)
            return 0;
        }
        else if (fabs(v12) < 0.00001)
        {
          objc_msgSend(v9, "Y");
          if (fabs(v14) < 0.00001)
            return 0;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 1;
}

- (id)outputImage
{
  NSObject *v4;
  objc_super v5;

  if (-[CIColorPolynomialInverse _isInvertible](self, "_isInvertible"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CIColorPolynomialInverse;
    return -[CIColorPolynomial outputImage](&v5, sel_outputImage);
  }
  else
  {
    v4 = ci_logger_filter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CIColorPolynomialInverse outputImage].cold.1((uint64_t)self, v4);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
}

- (void)outputImage
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_msgSend((id)objc_opt_class(), "description");
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}@: input coefficients are not inverable.", (uint8_t *)&v3, 0xCu);
}

@end
