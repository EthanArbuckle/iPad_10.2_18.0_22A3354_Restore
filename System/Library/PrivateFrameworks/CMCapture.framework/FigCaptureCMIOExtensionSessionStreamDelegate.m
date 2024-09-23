@implementation FigCaptureCMIOExtensionSessionStreamDelegate

- (void)stream:(id)a3 propertiesChanged:(id)a4
{
  uint64_t DerivedStorage;
  os_unfair_lock_s *v7;
  id v8;
  NSObject *global_queue;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v7 = (os_unfair_lock_s *)(DerivedStorage + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 20));
  if (*(_BYTE *)(DerivedStorage + 16))
  {
    os_unfair_lock_unlock(v7);
    v8 = 0;
  }
  else
  {
    v8 = *(id *)(DerivedStorage + 48);
    os_unfair_lock_unlock(v7);
    if (v8)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__FigCaptureCMIOExtensionSessionStreamDelegate_stream_propertiesChanged___block_invoke;
      block[3] = &unk_1E491EB90;
      block[4] = a4;
      block[5] = self;
      block[6] = v8;
      dispatch_async(global_queue, block);
    }
  }

}

uint64_t __73__FigCaptureCMIOExtensionSessionStreamDelegate_stream_propertiesChanged___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v14;
    v5 = *MEMORY[0x1E0CA5538];
    v11 = *MEMORY[0x1E0D06FD0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        if (objc_msgSend(v7, "isEqualToString:", v5))
        {
          if (!objc_msgSend(v8, "value"))
            goto LABEL_13;
          v17 = v11;
          v18 = objc_msgSend(v8, "value");
          FigCaptureDeviceGetNotificationCenter(objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
        }
        else
        {
          v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("CMIOExtensionPropertyName"));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("UniqueID"));
          v10 = objc_msgSend(v8, "value");
          if (v10)
            v10 = objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(v8, "value"), CFSTR("CMIOExtensionPropertyValue"));
          FigCaptureDeviceGetNotificationCenter(v10);
        }
        CMNotificationCenterPostNotification();
LABEL_13:
        ++v6;
      }
      while (v3 != v6);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)stream:(id)a3 receivedSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  uint64_t DerivedStorage;
  const __CFString *v6;
  void *v7;
  const opaqueCMFormatDescription *FormatDescription;
  CMVideoDimensions Dimensions;
  CMVideoDimensions v10;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v12;
  uint64_t v13;
  CVImageBufferRef ImageBuffer;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFDictionary *v22;
  void *v23;
  __CVPixelBufferPool *v24;
  CFAllocatorRef *v25;
  const __CFAllocator *v26;
  OpaqueVTPixelTransferSession *v27;
  CFDictionaryRef v28;
  const __CFDictionary *v29;
  __CVBuffer *v30;
  const __CFAllocator *v31;
  CFDictionaryRef v32;
  CFDictionaryRef v33;
  CFDictionaryRef v34;
  CFDictionaryRef v35;
  uint64_t v36;
  void (*v37)(uint64_t, CVPixelBufferRef, CMTime *);
  CMTime v38;
  CMTime v39;
  CVPixelBufferRef pixelBufferOut;
  CGRect v41;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pixelBufferOut = 0;
  v6 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v7 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v7)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    CMSetAttachment(a4, v6, v7, 1u);
  }
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
  v10 = Dimensions;
  if (Dimensions.width >= 1 && Dimensions.height >= 1)
  {
    v41.size.width = (double)Dimensions.width;
    v41.size.height = (double)Dimensions.height;
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v41);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D06F30]);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D06D40]);
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(*(unint64_t *)&v10));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D06D38]);
  }
  objc_msgSend(*(id *)(DerivedStorage + 248), "processSampleBuffer:", a4);
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  v15 = (const __CFString *)*MEMORY[0x1E0D05DD8];
  v16 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05DD8], 0);
  if (v16)
  {
    v17 = v16;
    v18 = *MEMORY[0x1E0D069A0];
    v19 = objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
    v20 = *MEMORY[0x1E0D069A8];
    v21 = objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A8]);
    if (v19)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v18);
    if (v21)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v20);
    v22 = (const __CFDictionary *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D08288]);
    if (v22 && ImageBuffer)
      CMSetAttachments(ImageBuffer, v22, 1u);
    CMRemoveAttachment(a4, v15);
  }
  memset(&v39, 0, sizeof(v39));
  CMSampleBufferGetPresentationTimeStamp(&v39, a4);
  v23 = (void *)objc_msgSend(*(id *)(DerivedStorage + 96), "objectForKeyedSubscript:", *MEMORY[0x1E0D07FE0]);
  v24 = (__CVPixelBufferPool *)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D07F00]);
  v25 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (!v24)
    goto LABEL_26;
  v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v24, &pixelBufferOut))
    goto LABEL_42;
  v27 = *(OpaqueVTPixelTransferSession **)(DerivedStorage + 240);
  if (v27)
    goto LABEL_22;
  if (VTPixelTransferSessionCreate(v26, (VTPixelTransferSessionRef *)(DerivedStorage + 240)))
  {
LABEL_42:
    FigDebugAssert3();
    goto LABEL_39;
  }
  v27 = *(OpaqueVTPixelTransferSession **)(DerivedStorage + 240);
LABEL_22:
  if (VTPixelTransferSessionTransferImage(v27, ImageBuffer, pixelBufferOut))
    goto LABEL_42;
  CVBufferPropagateAttachments(ImageBuffer, pixelBufferOut);
  v28 = CVBufferCopyAttachments(pixelBufferOut, kCVAttachmentMode_ShouldNotPropagate);
  if (v28)
  {
    v29 = (const __CFDictionary *)CFAutorelease(v28);
    if (v29)
      CVBufferSetAttachments(pixelBufferOut, v29, kCVAttachmentMode_ShouldNotPropagate);
  }
LABEL_26:
  if (!pixelBufferOut)
  {
    if (ImageBuffer)
      v30 = (__CVBuffer *)CFRetain(ImageBuffer);
    else
      v30 = 0;
    pixelBufferOut = v30;
  }
  v31 = *v25;
  v32 = CMCopyDictionaryOfAttachments(*v25, a4, 1u);
  if (v32)
  {
    v33 = v32;
    CVBufferSetAttachment(pixelBufferOut, CFSTR("SampleBufferPropagatableAttachments"), v32, kCVAttachmentMode_ShouldPropagate);
    CFRelease(v33);
  }
  v34 = CMCopyDictionaryOfAttachments(v31, a4, 0);
  if (v34)
  {
    v35 = v34;
    CVBufferSetAttachment(pixelBufferOut, CFSTR("SampleBufferNonPropagatableAttachments"), v34, kCVAttachmentMode_ShouldNotPropagate);
    CFRelease(v35);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 20));
  if (*(_BYTE *)(DerivedStorage + 104))
  {
    v36 = *(_QWORD *)(DerivedStorage + 112);
    if (v36)
    {
      v37 = *(void (**)(uint64_t, CVPixelBufferRef, CMTime *))(v36 + 16);
      v38 = v39;
      v37(v36, pixelBufferOut, &v38);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 20));
LABEL_39:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
}

- (opaqueCMSampleBuffer)stream:(id)a3 copySampleBuffer:(BOOL *)a4 error:(id *)a5
{
  return 0;
}

@end
