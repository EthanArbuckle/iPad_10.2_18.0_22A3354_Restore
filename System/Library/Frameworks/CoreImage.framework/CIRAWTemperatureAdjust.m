@implementation CIRAWTemperatureAdjust

- (id)outputImage
{
  CIFilter *v3;
  double v4;
  long double v5;
  NSNumber *inputVersion;
  double v7;
  double v8;
  double v9;
  float v10;
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
  void *v25;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _OWORD v45[4];
  uint64_t v46;
  double v47[3];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  double v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorMatrix"));
  -[NSNumber doubleValue](self->inputEV, "doubleValue");
  v5 = v4;
  inputVersion = self->inputVersion;
  if (inputVersion)
  {
    if (-[NSNumber intValue](inputVersion, "intValue"))
      v7 = 2.54999995;
    else
      v7 = 2.0;
  }
  else
  {
    v7 = 2.54999995;
  }
  v8 = exp2(v5);
  -[CIVector X](self->inputWhitePoint, "X");
  v10 = v9;
  -[CIVector Y](self->inputWhitePoint, "Y");
  *(float *)&v11 = v11;
  v27 = v8 * v7;
  v28 = v7 * 0.0;
  v29 = v7 * 0.0;
  v30 = v7 * 0.0;
  v31 = v8 * v7;
  v32 = v7 * 0.0;
  v33 = v7 * 0.0;
  v34 = v7 * 0.0;
  v35 = v8 * v7;
  v47[0] = (float)(v10 / *(float *)&v11);
  v47[1] = 1.0;
  v47[2] = (1.0 - v10 - *(float *)&v11) / *(float *)&v11;
  v46 = 0;
  memset(v45, 0, sizeof(v45));
  GetAdaptationMatrix(v47, dbl_192496F10, (double *)v45);
  MatrixMatrix(&v27, (double *)v45, &v27);
  v53 = xmmword_192496E70;
  v54 = 0x3FEA6741C471F7DCLL;
  v52 = 0.0;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  GetAdaptationMatrix((const double *)&v53, dbl_192496F10, (double *)&v48);
  v12 = *((double *)&v48 + 1) * 0.332802766 + *(double *)&v48 * 0.645435667;
  v13 = v12 + *(double *)&v49 * 0.0302547969;
  v14 = *(double *)&v50 * 0.332802766 + *((double *)&v49 + 1) * 0.645435667;
  v15 = v14 + *((double *)&v50 + 1) * 0.0302547969;
  v16 = *((double *)&v51 + 1) * 0.332802766 + *(double *)&v51 * 0.645435667;
  v17 = v16 + v52 * 0.0302547969;
  v18 = *((double *)&v48 + 1) * 0.612066763 + *(double *)&v48 * 0.181033831 + *(double *)&v49 * 0.0689652691;
  v19 = *(double *)&v50 * 0.612066763 + *((double *)&v49 + 1) * 0.181033831 + *((double *)&v50 + 1) * 0.0689652691;
  v20 = *((double *)&v51 + 1) * 0.612066763 + *(double *)&v51 * 0.181033831 + v52 * 0.0689652691;
  v21 = *((double *)&v48 + 1) * 0.0551304711 + *(double *)&v48 * 0.137826178 + *(double *)&v49 * 0.725884537;
  v22 = *(double *)&v50 * 0.0551304711 + *((double *)&v49 + 1) * 0.137826178 + *((double *)&v50 + 1) * 0.725884537;
  v23 = *((double *)&v51 + 1) * 0.0551304711 + *(double *)&v51 * 0.137826178 + v52 * 0.725884537;
  v36 = v13;
  v37 = v18;
  v38 = v21;
  v39 = v15;
  v40 = v19;
  v41 = v22;
  v42 = v17;
  v43 = v20;
  v44 = v23;
  v24 = v21 * -(v17 * v19)
      + v13 * v19 * v23
      + v21 * v15 * v20
      + -(v15 * v18) * v23
      + v18 * v22 * v17
      + -(v13 * v22) * v20;
  if (v24 != 0.0)
  {
    v36 = (v19 * v23 - v20 * v22) / v24;
    v37 = (v20 * v21 - v18 * v23) / v24;
    v38 = (v18 * v22 - v19 * v21) / v24;
    v39 = (v23 * -(v14 + *((double *)&v50 + 1) * 0.0302547969) + v17 * v22) / v24;
    v40 = (v21 * -(v16 + v52 * 0.0302547969) + v13 * v23) / v24;
    v41 = (v15 * v21 - v13 * v22) / v24;
    v42 = (v15 * v20 - v17 * v19) / v24;
    v43 = (v20 * -(v12 + *(double *)&v49 * 0.0302547969) + v17 * v18) / v24;
    v44 = (v13 * v19 - v15 * v18) / v24;
  }
  MatrixMatrix(&v27, &v36, &v27);
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v27, v28, v29, 0.0), CFSTR("inputRVector"));
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v30, v31, v32, 0.0), CFSTR("inputGVector"));
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v33, v34, v35, 0.0), CFSTR("inputBVector"));
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0), CFSTR("inputAVector"));
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0), CFSTR("inputBiasVector"));
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", self->inputImage, CFSTR("inputImage"));
  v25 = (void *)-[CIFilter valueForKey:](v3, "valueForKey:", CFSTR("outputImage"));
  if (GetLinearAdobeRGB(void)::onceToken != -1)
    dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_61);
  return (id)objc_msgSend(v25, "imageByColorMatchingColorSpaceToWorkingSpace:", GetLinearAdobeRGB(void)::space);
}

@end
