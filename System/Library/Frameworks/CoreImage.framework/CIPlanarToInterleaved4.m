@implementation CIPlanarToInterleaved4

- (id)outputImage
{
  CIImage *v2;
  CIKernel *v4;
  uint64_t v5;
  uint64_t v6;
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
  CGAffineTransform v20;
  _QWORD v21[3];
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = -[CIPlanarize inputImage](self, "inputImage");
  -[CIImage extent](v2, "extent");
  if (CGRectIsEmpty(v22))
    return 0;
  -[CIImage extent](v2, "extent");
  if (CGRectIsInfinite(v23))
    return 0;
  v4 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_planarToInterleaved4);
  -[CIImage extent](v2, "extent");
  v6 = v5;
  -[CIImage extent](v2, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  CGAffineTransformMakeScale(&v20, 1.0, 0.25);
  v24.origin.x = v8;
  v24.origin.y = v10;
  v24.size.width = v12;
  v24.size.height = v14;
  v25 = CGRectApplyAffineTransform(v24, &v20);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v21[0] = v2;
  v21[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25.size.height, MEMORY[0x1E0C809B0], 3221225472, __37__CIPlanarToInterleaved4_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, v6);
  return -[CIKernel applyWithExtent:roiCallback:arguments:](v4, "applyWithExtent:roiCallback:arguments:", &v19, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2), x, y, width, height);
}

@end
