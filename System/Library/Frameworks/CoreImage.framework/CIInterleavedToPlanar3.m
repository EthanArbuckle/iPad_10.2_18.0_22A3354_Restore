@implementation CIInterleavedToPlanar3

- (id)outputImage
{
  CIImage *v2;
  CIKernel *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  uint64_t v19;
  uint64_t v20;
  CGAffineTransform v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[3];
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v24[2] = *MEMORY[0x1E0C80C00];
  v2 = -[CIPlanarize inputImage](self, "inputImage");
  -[CIImage extent](v2, "extent");
  if (CGRectIsEmpty(v25))
    return 0;
  -[CIImage extent](v2, "extent");
  if (CGRectIsInfinite(v26))
    return 0;
  v4 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_interleavedToPlanar3);
  -[CIImage extent](v2, "extent");
  v6 = v5;
  -[CIImage extent](v2, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  CGAffineTransformMakeScale(&v21, 1.0, 3.0);
  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  v28 = CGRectApplyAffineTransform(v27, &v21);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  v24[0] = v2;
  v24[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6, MEMORY[0x1E0C809B0], 3221225472, __37__CIInterleavedToPlanar3_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, *(_QWORD *)&v6);
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = CFSTR("kCIKernelOutputFormat");
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  return -[CIKernel applyWithExtent:roiCallback:arguments:options:](v4, "applyWithExtent:roiCallback:arguments:options:", &v20, v19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1), x, y, width, height);
}

@end
