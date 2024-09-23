@implementation BWDeepFusionProcessorRequest

- (id)initWithInput:(void *)a3 delegate:
{
  id v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)BWDeepFusionProcessorRequest;
  v5 = objc_msgSendSuper2(&v16, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 1) = a2;
    *((_QWORD *)v5 + 2) = a3;
    v6 = (void *)objc_msgSend(*((id *)v5 + 1), "captureStreamSettings");
    v7 = objc_msgSend(v6, "captureFlags");
    if ((v7 & 4) != 0)
      v8 = ((int)(v7 >> 2) >> 31) + objc_msgSend(v6, "expectedEVZeroFrameCount") - 1;
    else
      v8 = 0;
    *((_DWORD *)v5 + 6) = v8;
    v9 = (void *)objc_msgSend(*((id *)v5 + 1), "captureStreamSettings");
    v10 = *((_DWORD *)v5 + 6);
    v11 = objc_msgSend(v9, "captureFlags");
    if ((v11 & 4) == 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", &unk_1E4A01AD8);
      if ((v11 & 0x400000) != 0)
      {
        v13 = &unk_1E49FBB38;
LABEL_18:
        objc_msgSend(v12, "addObject:", v13);
      }
LABEL_19:
      *((_QWORD *)v5 + 4) = v12;
      return v5;
    }
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", &unk_1E49FBA60);
    v12 = v14;
    if (v10 >= 1)
      objc_msgSend(v14, "addObject:", &unk_1E49FBA78);
    if ((v11 & 0x200000000) != 0)
    {
      objc_msgSend(v12, "addObject:", &unk_1E49FBA90);
      if ((v11 & 0x100000) == 0)
      {
LABEL_13:
        if ((v11 & 0x400000) == 0)
          goto LABEL_19;
        goto LABEL_17;
      }
    }
    else if ((v11 & 0x100000) == 0)
    {
      goto LABEL_13;
    }
    objc_msgSend(v12, "addObject:", &unk_1E49FBAA8);
    if ((v11 & 0x400000) == 0)
      goto LABEL_19;
LABEL_17:
    v13 = &unk_1E49FBAC0;
    goto LABEL_18;
  }
  return v5;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t i;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = -[BWDeepFusionProcessorInput inputBuffers](self->_input, "inputBuffers");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = (const __CFString *)*MEMORY[0x1E0D05A10];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = (void *)CVBufferCopyAttachment((CVBufferRef)objc_msgSend(v9, "buffer"), v7, 0);
        objc_msgSend(v10, "releaseAll");

        CVBufferRemoveAttachment((CVBufferRef)objc_msgSend(v9, "buffer"), v7);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  -[BWDeepFusionProcessorInput setDelegate:](self->_input, "setDelegate:", 0);

  v11.receiver = self;
  v11.super_class = (Class)BWDeepFusionProcessorRequest;
  -[BWDeepFusionProcessorRequest dealloc](&v11, sel_dealloc);
}

- (uint64_t)receivedAllBuffers
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (objc_msgSend(*(id *)(result + 8), "onlyApplyingSemanticStyle"))
    {
      return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "inputBuffers"), "count") != 0;
    }
    else
    {
      v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v3 = (void *)objc_msgSend(*(id *)(v1 + 8), "inputBuffers", 0);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
      {
        v5 = v4;
        v6 = 0;
        v7 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v3);
            v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
            if (objc_msgSend(v9, "type") == 24)
              ++v6;
            if (objc_msgSend(v9, "type") != 19)
              objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "type")));
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v5);
      }
      else
      {
        v6 = 0;
      }
      if (v6 == *(_DWORD *)(v1 + 24))
        return objc_msgSend(*(id *)(v1 + 32), "isEqualToSet:", v2);
      else
        return 0;
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@ cache:%d"), v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "portType"), self->_cacheBuffers);
}

- (BWDeepFusionProcessorInput)input
{
  return self->_input;
}

- (BWDeepFusionProcessorControllerDelegate)delegate
{
  return self->_delegate;
}

- (NSSet)expectedBufferTypes
{
  return self->_expectedBufferTypes;
}

- (IBPDeepFusionOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (int)demosaicedRawErr
{
  return self->_demosaicedRawErr;
}

- (void)setDemosaicedRawErr:(int)a3
{
  self->_demosaicedRawErr = a3;
}

- (BOOL)cacheBuffers
{
  return self->_cacheBuffers;
}

- (void)setCacheBuffers:(BOOL)a3
{
  self->_cacheBuffers = a3;
}

@end
