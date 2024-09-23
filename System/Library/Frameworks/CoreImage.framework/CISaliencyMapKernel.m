@implementation CISaliencyMapKernel

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
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  __CVBuffer *v15;
  BOOL result;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4), "pixelBuffer");
  if (v8)
  {
    v9 = v8;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__17;
    v29 = __Block_byref_object_dispose__17;
    v10 = (objc_class *)getVNGenerateAttentionBasedSaliencyImageRequestClass(void)::softClass;
    v30 = getVNGenerateAttentionBasedSaliencyImageRequestClass(void)::softClass;
    if (!getVNGenerateAttentionBasedSaliencyImageRequestClass(void)::softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = ___ZL52getVNGenerateAttentionBasedSaliencyImageRequestClassv_block_invoke;
      v23 = &unk_1E2EC2EB8;
      v24 = &v25;
      ___ZL52getVNGenerateAttentionBasedSaliencyImageRequestClassv_block_invoke((uint64_t)&v20);
      v10 = (objc_class *)v26[5];
    }
    _Block_object_dispose(&v25, 8);
    v11 = objc_alloc_init(v10);
    v25 = 0;
    v26 = &v25;
    v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__17;
    v29 = __Block_byref_object_dispose__17;
    v12 = (objc_class *)getVNImageRequestHandlerClass(void)::softClass;
    v30 = getVNImageRequestHandlerClass(void)::softClass;
    if (!getVNImageRequestHandlerClass(void)::softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = ___ZL29getVNImageRequestHandlerClassv_block_invoke_1;
      v23 = &unk_1E2EC2EB8;
      v24 = &v25;
      ___ZL29getVNImageRequestHandlerClassv_block_invoke_1((uint64_t)&v20);
      v12 = (objc_class *)v26[5];
    }
    _Block_object_dispose(&v25, 8);
    v13 = [v12 alloc];
    v14 = (void *)objc_msgSend(v13, "initWithCVPixelBuffer:options:", v9, MEMORY[0x1E0C9AA70]);
    v31[0] = v11;
    if ((objc_msgSend(v14, "performRequests:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1), a6) & 1) != 0)
    {
      v15 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "results"), "firstObject"), "pixelBuffer");

      if (v15)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __64__CISaliencyMapKernel_processWithInputs_arguments_output_error___block_invoke;
        v19[3] = &unk_1E2EC5238;
        v19[4] = a5;
        PixelBufferApplyPlaneReadOnlyBlock(v15, (uint64_t)v19);
        return 1;
      }
      if (a6)
      {
        v17 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CISaliencyMapFilter"), 1, &unk_1E2F1D738);
        goto LABEL_15;
      }
    }
    else
    {

    }
    return 0;
  }
  if (!a6)
    return 0;
  v17 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CISaliencyMapFilter"), 1, &unk_1E2F1D710);
LABEL_15:
  v18 = (void *)v17;
  result = 0;
  *a6 = v18;
  return result;
}

void *__64__CISaliencyMapKernel_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  char *v10;
  unint64_t Height;
  void *result;
  size_t v13;
  CGRect v14;

  v10 = (char *)objc_msgSend(*(id *)(a1 + 32), "baseAddress");
  objc_msgSend(*(id *)(a1 + 32), "region");
  Height = (unint64_t)CGRectGetHeight(v14);
  result = (void *)objc_msgSend(*(id *)(a1 + 32), "bytesPerRow");
  if (Height < a5)
    a5 = Height;
  if (a5)
  {
    v13 = (size_t)result;
    do
    {
      result = memcpy(v10, a2, v13);
      a2 += a6;
      v10 += v13;
      --a5;
    }
    while (a5);
  }
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 266;
}

+ (int)outputFormat
{
  return 2309;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end
