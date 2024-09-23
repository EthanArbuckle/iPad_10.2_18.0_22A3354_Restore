@implementation RedEyeDifference

- (id)outputImage
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CIImage *inputSubtractedImage;
  _QWORD v18[3];
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v18[2] = *MEMORY[0x1E0C80C00];
  if (outputImage_onceToken_14 != -1)
    dispatch_once(&outputImage_onceToken_14, &__block_literal_global_15_0);
  v3 = (void *)objc_msgSend((id)outputImage_kernels_13, "objectAtIndexedSubscript:", 0);
  -[CIImage extent](self->inputImage, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CIImage extent](self->inputSubtractedImage, "extent");
  v21.origin.x = v12;
  v21.origin.y = v13;
  v21.size.width = v14;
  v21.size.height = v15;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v20 = CGRectUnion(v19, v21);
  inputSubtractedImage = self->inputSubtractedImage;
  v18[0] = self->inputImage;
  v18[1] = inputSubtractedImage;
  return (id)objc_msgSend(v3, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_17, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2), v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
}

NSArray *__31__RedEyeDifference_outputImage__block_invoke()
{
  NSArray *result;

  result = objc_retain(+[CIKernel kernelsWithString:](CIColorKernel, "kernelsWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kernel vec4 _redEyeDifference(sampler src1, sampler src2) { vec2 dc = destCoord(); vec4 s1, s2, diff; s"
                 "1 = sample(src1, samplerTransform(src1, dc)); s2 = sample(src2, samplerTransform(src2, dc)); diff = max"
                 "(s1 - s2, vec4(0.0)); return vec4(diff.rgb, 1.0); }")));
  outputImage_kernels_13 = (uint64_t)result;
  return result;
}

@end
