@implementation CIPersonSegmentationKernel

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("rect"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "CGRectValue");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  __CVBuffer *v18;
  __CVBuffer *v19;
  size_t Width;
  double v21;
  const __CFString *v22;
  void *v23;
  size_t Height;
  double v25;
  BOOL v26;
  char *v27;
  double v28;
  unint64_t v29;
  size_t v30;
  size_t BytesPerRow;
  char *BaseAddress;
  unint64_t v33;
  size_t v34;
  char *v35;
  unsigned int v36;
  uint64_t v39;
  uint64_t v40;
  Class (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  const __CFString *v50;
  const __CFString *v51;
  _QWORD v52[2];
  CGRect v53;

  v52[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x194026220](a1, a2);
  v11 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "pixelBuffer");
  if (!v11)
  {
    if (a6)
    {
      v23 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIPersonSegmentationFilter"), 1, &unk_1E2F1D5A8);
LABEL_18:
      v26 = 0;
      *a6 = v23;
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  v12 = v11;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__12;
  v48 = __Block_byref_object_dispose__12;
  v13 = (objc_class *)getVNGeneratePersonSegmentationRequestClass_softClass;
  v49 = getVNGeneratePersonSegmentationRequestClass_softClass;
  if (!getVNGeneratePersonSegmentationRequestClass_softClass)
  {
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __getVNGeneratePersonSegmentationRequestClass_block_invoke;
    v42 = &unk_1E2EC2EB8;
    v43 = &v44;
    __getVNGeneratePersonSegmentationRequestClass_block_invoke((uint64_t)&v39);
    v13 = (objc_class *)v45[5];
  }
  _Block_object_dispose(&v44, 8);
  v14 = objc_alloc_init(v13);
  objc_msgSend(v14, "setQualityLevel:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("q")), "unsignedIntValue"));
  v44 = 0;
  v45 = &v44;
  v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__12;
  v48 = __Block_byref_object_dispose__12;
  v15 = (objc_class *)getVNImageRequestHandlerClass_softClass;
  v49 = getVNImageRequestHandlerClass_softClass;
  if (!getVNImageRequestHandlerClass_softClass)
  {
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __getVNImageRequestHandlerClass_block_invoke;
    v42 = &unk_1E2EC2EB8;
    v43 = &v44;
    __getVNImageRequestHandlerClass_block_invoke((uint64_t)&v39);
    v15 = (objc_class *)v45[5];
  }
  _Block_object_dispose(&v44, 8);
  v16 = [v15 alloc];
  v17 = (id)objc_msgSend(v16, "initWithCVPixelBuffer:options:", v12, MEMORY[0x1E0C9AA70]);
  v52[0] = v14;
  if (!objc_msgSend(v17, "performRequests:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1), a6))goto LABEL_31;
  v18 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "results"), "firstObject"), "pixelBuffer");
  v19 = v18;
  if (!v18)
  {
    v22 = CFSTR("Couldn't get the output pixelBuffer from Vision request result");
    if (!a6)
      goto LABEL_31;
    goto LABEL_17;
  }
  Width = CVPixelBufferGetWidth(v18);
  objc_msgSend(a5, "region");
  if (v21 != (double)Width)
  {
    v22 = CFSTR("The output pixelBuffer from Vision is not the expected width.");
    if (!a6)
      goto LABEL_31;
    goto LABEL_17;
  }
  Height = CVPixelBufferGetHeight(v19);
  objc_msgSend(a5, "region");
  if (v25 != (double)Height)
  {
    v22 = CFSTR("The output pixelBuffer from Vision is not the expected height.");
    if (a6)
    {
LABEL_17:
      v50 = CFSTR("CINonLocalizedDescriptionKey");
      v51 = v22;
      v23 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIPersonSegmentationKernel"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
      goto LABEL_18;
    }
LABEL_31:
    v26 = 0;
    goto LABEL_32;
  }
  if (CVPixelBufferGetPixelFormatType(v19) != 1278226488)
  {
    v22 = CFSTR("The output pixelBuffer from Vision is not the expected format.");
    if (a6)
      goto LABEL_17;
    goto LABEL_31;
  }
  CVPixelBufferLockBaseAddress(v19, 1uLL);
  v27 = (char *)objc_msgSend(a5, "baseAddress");
  objc_msgSend(a5, "region");
  v28 = CGRectGetHeight(v53);
  v29 = objc_msgSend(a5, "bytesPerRow");
  v30 = CVPixelBufferGetHeight(v19);
  BytesPerRow = CVPixelBufferGetBytesPerRow(v19);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(v19);
  if (v30 >= (unint64_t)v28)
    v33 = (unint64_t)v28;
  else
    v33 = v30;
  if (BytesPerRow >= v29)
    v34 = v29;
  else
    v34 = BytesPerRow;
  if (v33)
  {
    v35 = BaseAddress;
    v36 = 1;
    do
    {
      memmove(v27, v35, v34);
      v27 += v29;
      v35 += BytesPerRow;
    }
    while (v33 > v36++);
  }
  CVPixelBufferUnlockBaseAddress(v19, 1uLL);
  v26 = 1;
LABEL_32:
  objc_autoreleasePoolPop(v10);
  return v26;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 266;
}

+ (int)outputFormat
{
  return 261;
}

@end
