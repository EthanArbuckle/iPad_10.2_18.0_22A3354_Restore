@implementation VNHomeAppFaceAnalyzerMultiDetectorBase

- (CGRect)calculateCropRectForInputFace:(id)a3 imageBuffer:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
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
  CGRect v25;
  CGRect result;
  CGRect v27;

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v10, "width");
  v12 = objc_msgSend(v10, "height");
  if (v11 == -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth")
    && v12 == -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight")&& (objc_msgSend(v9, "unalignedBoundingBox"), v27.origin.x = 0.0, v27.origin.y = 0.0, v27.size.width = 1.0, v27.size.height = 1.0, CGRectEqualToRect(v25, v27)))
  {
    objc_msgSend(v9, "unalignedBoundingBox");
    v14 = v13 * (double)v11;
    v16 = v15 * (double)v11;
    v18 = v17 * (double)v12;
    v20 = v19 * (double)v12;
  }
  else
  {
    if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error: input specifications are invalid for executing this request"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = *MEMORY[0x1E0C9D628];
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v21 = v14;
  v22 = v18;
  v23 = v16;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  vImage_Buffer *v6;

  v6 = (vImage_Buffer *)malloc_type_calloc(0x20uLL, 1uLL, 0xE34159ABuLL);
  if (v6)
  {
    v6->data = CVPixelBufferGetBaseAddress(a3);
    v6->height = CVPixelBufferGetHeight(a3);
    v6->width = CVPixelBufferGetWidth(a3);
    v6->rowBytes = CVPixelBufferGetBytesPerRow(a3);
  }
  else if (a4)
  {
    +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
