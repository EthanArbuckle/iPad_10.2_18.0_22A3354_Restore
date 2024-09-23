@implementation BWStillImageConditionalRouterOverCaptureConfiguration

+ (id)overCaptureConfiguration
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BWStillImageConditionalRouterOverCaptureConfiguration)init
{
  BWStillImageConditionalRouterOverCaptureConfiguration *v2;
  BWStillImageConditionalRouterOverCaptureConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterOverCaptureConfiguration;
  v2 = -[BWStillImageConditionalRouterConfiguration initWithNumberOfOutputs:](&v5, sel_initWithNumberOfOutputs_, 3);
  v3 = v2;
  if (v2)
    -[BWStillImageConditionalRouterConfiguration setShouldEmitSampleBufferDecisionProvider:](v2, "setShouldEmitSampleBufferDecisionProvider:", &__block_literal_global_94);
  return v3;
}

uint64_t __61__BWStillImageConditionalRouterOverCaptureConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, _DWORD *a3)
{
  CFTypeRef v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  *a3 = 0;
  v5 = CMGetAttachment(target, CFSTR("BWStillImageCaptureSettings"), 0);
  if (v5
    && (v6 = (void *)v5,
        (v7 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])) != 0))
  {
    v8 = (void *)v7;
    if ((unint64_t)objc_msgSend((id)objc_msgSend(v6, "captureStreamSettings"), "count") >= 2)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = (void *)objc_msgSend(v6, "captureStreamSettings");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v15, "hasValidFrames"))
              objc_msgSend(v9, "addObject:", objc_msgSend(v15, "portType"));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }
      v16 = *MEMORY[0x1E0D05A18];
      if (objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D05A18])
        && objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D05A30]))
      {
        *a3 = objc_msgSend(v8, "isEqualToString:", v16);
      }
      v17 = *MEMORY[0x1E0D05A28];
      if (objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D05A28])
        && objc_msgSend(v9, "containsObject:", v16))
      {
        *a3 = objc_msgSend(v8, "isEqualToString:", v17);
      }
    }
  }
  else
  {
    FigDebugAssert3();
  }
  return 1;
}

- (unsigned)narrowFieldOfViewOutputIndex
{
  return 0;
}

- (unsigned)wideFieldOfViewOutputIndex
{
  return 1;
}

@end
