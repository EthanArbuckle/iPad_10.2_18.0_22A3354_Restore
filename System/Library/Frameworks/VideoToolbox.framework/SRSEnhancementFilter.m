@implementation SRSEnhancementFilter

void __SRSEnhancementFilter_ProcessFrame_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CVBuffer *v3;
  __CVBuffer *v4;
  uint64_t v5;
  const void *v6;
  CFTypeRef v7;
  const void *v8;
  _DWORD *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  float v14;
  float v15;
  const __CFAllocator *v16;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v22;
  __IOSurface *IOSurface;
  CFTypeRef v24;
  __IOSurface *v25;
  uint64_t v26;
  uint64_t *v27;
  void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  __int128 v32;
  uint64_t v33;
  float v34;
  uint64_t v35;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (*(_BYTE *)(v2 + 32))
  {
    if (*(_BYTE *)(v2 + 33))
    {
      v3 = *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      goto LABEL_10;
    }
    v3 = *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v4 = v3;
  }
  else
  {
    if (*(_BYTE *)(v2 + 33))
      goto LABEL_11;
    v3 = 0;
    v4 = *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  CVPixelBufferGetIOSurface(v4);
  v5 = IOSurfaceAcceleratorTransformSurface();
  if ((_DWORD)v5)
    goto LABEL_41;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 32))
  {
    CVBufferPropagateAttachments(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v4);
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (*(_BYTE *)(v2 + 32))
    {
LABEL_10:
      v5 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v2 + 48), v3, *(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      if (!(_DWORD)v5)
        goto LABEL_11;
LABEL_41:
      v26 = v5;
      v22 = 0;
      v18 = 0;
      v24 = 0;
      goto LABEL_28;
    }
  }
LABEL_11:
  if (!*(_BYTE *)(a1 + 96))
    goto LABEL_23;
  v6 = (const void *)*MEMORY[0x1E0CA8D50];
  v7 = CVBufferCopyAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), (CFStringRef)*MEMORY[0x1E0CA8D50], 0);
  if (!v7)
    goto LABEL_23;
  v8 = v7;
  v9 = *(_DWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v11 = v9[2];
  v10 = v9[3];
  v12 = v9[6];
  v13 = v9[7];
  LODWORD(v32) = 0;
  v35 = 0;
  v34 = 0.0;
  if (!FigCFDictionaryGetFloat32IfPresent())
    goto LABEL_22;
  if (!FigCFDictionaryGetFloat32IfPresent())
    goto LABEL_22;
  if (!FigCFDictionaryGetFloat32IfPresent())
    goto LABEL_22;
  if (!FigCFDictionaryGetFloat32IfPresent())
    goto LABEL_22;
  v14 = (float)v12 / (float)v11;
  v15 = (float)v13 / (float)v10;
  *(float *)&v32 = v14 * *(float *)&v32;
  *(float *)&v35 = v14 * *(float *)&v35;
  *((float *)&v35 + 1) = v15 * *((float *)&v35 + 1);
  v34 = v15 * v34;
  v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
LABEL_22:
    CFRelease(v8);
LABEL_23:
    CVBufferPropagateAttachments(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v18 = 0;
    goto LABEL_24;
  }
  v18 = Mutable;
  FigCFDictionarySetFloat32();
  FigCFDictionarySetFloat32();
  FigCFDictionarySetFloat32();
  FigCFDictionarySetFloat32();
  CFRelease(v8);
  v19 = CVBufferCopyAttachments(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), kCVAttachmentMode_ShouldPropagate);
  if (v19)
  {
    v20 = v19;
    MutableCopy = CFDictionaryCreateMutableCopy(v16, 0, v19);
    v22 = MutableCopy;
    if (MutableCopy)
    {
      CFDictionarySetValue(MutableCopy, v6, v18);
      CVBufferSetAttachments(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v22, kCVAttachmentMode_ShouldPropagate);
    }
    CFRelease(v20);
    goto LABEL_25;
  }
LABEL_24:
  v22 = 0;
LABEL_25:
  IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v24 = IOSurfaceCopyValue(IOSurface, CFSTR("DolbyVisionRPUData"));
  if (v24)
  {
    v25 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    IOSurfaceSetValue(v25, CFSTR("DolbyVisionRPUData"), v24);
  }
  v26 = 0;
LABEL_28:
  v27 = **(uint64_t ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v32 = *(_OWORD *)(a1 + 72);
  v33 = *(_QWORD *)(a1 + 88);
  VTTemporalFilterPluginSessionEmitOutputFrame(v27, v26, 0, &v32, v28);
  VTTemporalFilterPluginSessionConcludeInputFrame(**(uint64_t ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const void **)(a1 + 64));
  if (v18)
    CFRelease(v18);
  if (v22)
    CFRelease(v22);
  v29 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v29)
    CFRelease(v29);
  v30 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v30)
    CFRelease(v30);
  v31 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v31)
    CFRelease(v31);
  if (v24)
    CFRelease(v24);
}

@end
