@implementation CIFaceMaskApply

+ (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CIFaceMaskApply);
}

- (id)outputImage
{
  CIImage *inputImage;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t i;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CIVector *v34;
  CIVector *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CIVector *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CIVector *v60;
  float v61;
  double v62;
  float v63;
  CIVector *v64;
  uint64_t v65;
  CIImage *inputParameterImage;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v85;
  _QWORD v86[8];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[9];
  __int128 v90;
  __int128 v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->inputParameterImage)
  {
    v4 = objc_msgSend((id)objc_opt_class(), "_kernel");
    inputImage = self->inputImage;
    if (v4)
    {
      v85 = (void *)v4;
      -[CIImage extent](inputImage, "extent");
      v6 = v5;
      -[CIImage extent](self->inputImage, "extent");
      v8 = v7;
      v90 = xmmword_192494980;
      v91 = xmmword_192494980;
      v9 = v7 / v6;
      v10 = -[CIVector count](self->inputFacesChinX, "count");
      if (v10 >= -[CIVector count](self->inputFacesCenterX, "count"))
        v11 = 96;
      else
        v11 = 112;
      v12 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v11), "count");
      v13 = -[CIVector count](self->inputFacesChinY, "count");
      if (v13 >= -[CIVector count](self->inputFacesCenterY, "count"))
        v14 = 104;
      else
        v14 = 120;
      v15 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v14), "count");
      v16 = -1.0;
      v17 = -1.0;
      v18 = -1.0;
      if (v12 <= v15)
        v19 = v15;
      else
        v19 = v12;
      v20 = -1.0;
      v21 = -1.0;
      v22 = -1.0;
      v23 = -1.0;
      v24 = -1.0;
      v25 = -1.0;
      if (v19)
      {
        v26 = v15;
        for (i = 0; i != v19; ++i)
        {
          if (i < v12)
          {
            -[CIVector valueAtIndex:](self->inputFacesChinX, "valueAtIndex:", i, v25, v24, v23, v22);
            v29 = v28;
            -[CIVector valueAtIndex:](self->inputFacesCenterX, "valueAtIndex:", i);
            v25 = v29 - v30;
            *(float *)&v25 = v25;
            *((_DWORD *)&v91 + i) = LODWORD(v25);
          }
          if (i < v26)
          {
            -[CIVector valueAtIndex:](self->inputFacesChinY, "valueAtIndex:", i);
            v32 = v31;
            -[CIVector valueAtIndex:](self->inputFacesCenterY, "valueAtIndex:", i);
            v25 = v9 * (v32 - v33);
            *(float *)&v25 = v25;
            *((_DWORD *)&v90 + i) = LODWORD(v25);
          }
        }
        v25 = *(float *)&v91;
        v24 = *((float *)&v91 + 1);
        v23 = *((float *)&v91 + 2);
        v22 = *((float *)&v91 + 3);
        v21 = *(float *)&v90;
        v20 = *((float *)&v90 + 1);
        v18 = *((float *)&v90 + 2);
        v17 = *((float *)&v90 + 3);
      }
      v34 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v25 / v6, v24 / v6, v23 / v6, v22 / v6);
      v35 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v21 / v8, v20 / v8, v18 / v8, v17 / v8);
      -[CIVector X](self->inputFacesCenterX, "X");
      if (v36 != -1.0)
      {
        -[CIVector X](self->inputFacesCenterX, "X");
        v16 = v37 / v6;
      }
      -[CIVector Y](self->inputFacesCenterX, "Y");
      v38 = -1.0;
      v39 = -1.0;
      if (v40 != -1.0)
      {
        -[CIVector Y](self->inputFacesCenterX, "Y");
        v39 = v41 / v6;
      }
      -[CIVector Z](self->inputFacesCenterX, "Z");
      if (v42 != -1.0)
      {
        -[CIVector Z](self->inputFacesCenterX, "Z");
        v38 = v43 / v6;
      }
      -[CIVector W](self->inputFacesCenterX, "W");
      v44 = -1.0;
      v45 = -1.0;
      if (v46 != -1.0)
      {
        -[CIVector W](self->inputFacesCenterX, "W");
        v45 = v47 / v6;
      }
      v48 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v16, v39, v38, v45);
      -[CIVector X](self->inputFacesCenterY, "X");
      if (v49 != -1.0)
      {
        -[CIVector X](self->inputFacesCenterY, "X");
        v44 = v50 / v8;
      }
      -[CIVector Y](self->inputFacesCenterY, "Y");
      v51 = -1.0;
      v52 = -1.0;
      if (v53 != -1.0)
      {
        -[CIVector Y](self->inputFacesCenterY, "Y");
        v52 = v54 / v8;
      }
      -[CIVector Z](self->inputFacesCenterY, "Z");
      if (v55 != -1.0)
      {
        -[CIVector Z](self->inputFacesCenterY, "Z");
        v51 = v56 / v8;
      }
      -[CIVector W](self->inputFacesCenterY, "W");
      v57 = -1.0;
      if (v58 != -1.0)
      {
        -[CIVector W](self->inputFacesCenterY, "W");
        v57 = v59 / v8;
      }
      v60 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v44, v52, v51, v57);
      SDOFFaceMaskValue((uint64_t)CFSTR("chinThetaLimit"), self->inputTuningParameters);
      v62 = v61;
      SDOFFaceMaskValue((uint64_t)CFSTR("chinThetaMultip"), self->inputTuningParameters);
      v64 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v62, v63);
      v89[0] = self->inputImage;
      v89[1] = v48;
      v89[2] = v60;
      v89[3] = v34;
      v89[4] = v35;
      v65 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      inputParameterImage = self->inputParameterImage;
      v89[5] = v65;
      v89[6] = inputParameterImage;
      v89[7] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0 / v6, 1.0 / v8);
      v89[8] = v64;
      v67 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 9);
      -[CIImage extent](self->inputParameterImage, "extent");
      v69 = v68;
      v71 = v70;
      v73 = v72;
      v75 = v74;
      saveImage(self->inputImage, (uint64_t)CFSTR("/tmp/inputFaceMask-CI.tiff"), 0);
      -[CIImage extent](self->inputImage, "extent");
      v77 = v76;
      v79 = v78;
      v81 = v80;
      v83 = v82;
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __30__CIFaceMaskApply_outputImage__block_invoke;
      v86[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v86[4] = v69;
      v86[5] = v71;
      v86[6] = v73;
      v86[7] = v75;
      v87[0] = CFSTR("kCIKernelOutputFormat");
      v87[1] = CFSTR("kCIImageAlphaOne");
      v88[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
      v88[1] = MEMORY[0x1E0C9AAB0];
      inputImage = (CIImage *)objc_msgSend(v85, "applyWithExtent:roiCallback:arguments:options:", v86, v67, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2), v77, v79, v81, v83);
      saveImage(inputImage, (uint64_t)CFSTR("/tmp/outputFaceMask-CI.tiff"), 0);
    }
  }
  return inputImage;
}

double __30__CIFaceMaskApply_outputImage__block_invoke(uint64_t a1, int a2)
{
  double result;

  if (a2)
    return *(double *)(a1 + 32);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputParameterImage
{
  return self->inputParameterImage;
}

- (void)setInputParameterImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputFacesCenterX
{
  return self->inputFacesCenterX;
}

- (void)setInputFacesCenterX:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CIVector)inputFacesCenterY
{
  return self->inputFacesCenterY;
}

- (void)setInputFacesCenterY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CIVector)inputFacesChinX
{
  return self->inputFacesChinX;
}

- (void)setInputFacesChinX:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CIVector)inputFacesChinY
{
  return self->inputFacesChinY;
}

- (void)setInputFacesChinY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CIVector)inputK0
{
  return self->inputK0;
}

- (void)setInputK0:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CIVector)inputK1
{
  return self->inputK1;
}

- (void)setInputK1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CIVector)inputK2
{
  return self->inputK2;
}

- (void)setInputK2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (CIVector)inputK3
{
  return self->inputK3;
}

- (void)setInputK3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)inputK4
{
  return self->inputK4;
}

- (void)setInputK4:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

@end
