@implementation DepthWrapperEncoder

void __DepthWrapperEncoder_EncodeFrame_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, CMSampleBufferRef sbuf)
{
  uint64_t CopyWithNewFormatDescription;
  CMFormatDescriptionRef FormatDescription;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  const void *v11;
  const opaqueCMFormatDescription *v12;
  CMVideoCodecType v13;
  float32x2_t v14;
  CMVideoDimensions Dimensions;
  const __CFDictionary *Extensions;
  const __CFDictionary *v17;
  const void *v18;
  const __CFDictionary *Value;
  const __CFDictionary *v20;
  const __CFAllocator *v21;
  CFDataRef v22;
  CFDataRef v23;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  unsigned int v28;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  UInt8 bytes[4];
  char v31;
  int8x8_t v32;
  uint64_t v33;

  CopyWithNewFormatDescription = a2;
  v33 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a2)
    goto LABEL_22;
  FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v8 + 48))
  {
    if (FigCFEqual())
    {
LABEL_21:
      CopyWithNewFormatDescription = FigSampleBufferCreateCopyWithNewFormatDescription();
      goto LABEL_22;
    }
    v8 = *(_QWORD *)(a1 + 32);
  }
  v9 = *(const void **)(v8 + 64);
  *(_QWORD *)(v8 + 64) = FormatDescription;
  if (FormatDescription)
    CFRetain(FormatDescription);
  if (v9)
    CFRelease(v9);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(const void **)(v10 + 48);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    v10 = *(_QWORD *)(a1 + 32);
  }
  v12 = *(const opaqueCMFormatDescription **)(v10 + 64);
  v13 = *(_DWORD *)(v10 + 16);
  formatDescriptionOut = 0;
  v14 = *(float32x2_t *)(v10 + 40);
  Dimensions = CMVideoFormatDescriptionGetDimensions(v12);
  Extensions = CMFormatDescriptionGetExtensions(v12);
  if (Extensions)
  {
    v17 = Extensions;
    v28 = a3;
    v18 = (const void *)*MEMORY[0x1E0CA2240];
    Value = (const __CFDictionary *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x1E0CA2240]);
    if (Value)
    {
      v20 = Value;
      *(_DWORD *)bytes = 0;
      v31 = 1;
      v32 = vrev32_s8((int8x8_t)vmovn_s64((int64x2_t)vcvtq_n_u64_f64(vcvtq_f64_f32(v14), 0x10uLL)));
      v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v22 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 13);
      if (v22)
      {
        v23 = v22;
        MutableCopy = CFDictionaryCreateMutableCopy(v21, 0, v17);
        if (MutableCopy)
        {
          v25 = MutableCopy;
          v26 = CFDictionaryCreateMutableCopy(v21, 0, v20);
          if (v26)
          {
            v27 = v26;
            CFDictionarySetValue(v26, CFSTR("disc"), v23);
            CFDictionarySetValue(v25, v18, v27);
            CFDictionaryRemoveValue(v25, (const void *)*MEMORY[0x1E0CA2278]);
            CFDictionaryRemoveValue(v25, (const void *)*MEMORY[0x1E0CA2270]);
            CopyWithNewFormatDescription = CMVideoFormatDescriptionCreate(v21, v13, Dimensions.width, Dimensions.height, v25, &formatDescriptionOut);
            if ((_DWORD)CopyWithNewFormatDescription)
            {
              a3 = v28;
              if (formatDescriptionOut)
                CFRelease(formatDescriptionOut);
            }
            else
            {
              *(_QWORD *)(v10 + 48) = formatDescriptionOut;
              formatDescriptionOut = 0;
              a3 = v28;
            }
            CFRelease(v25);
            CFRelease(v27);
            goto LABEL_19;
          }
          CopyWithNewFormatDescription = FigSignalErrorAt();
          CFRelease(v25);
        }
        else
        {
          CopyWithNewFormatDescription = FigSignalErrorAt();
        }
        a3 = v28;
LABEL_19:
        CFRelease(v23);
        goto LABEL_20;
      }
      CopyWithNewFormatDescription = FigSignalErrorAt();
    }
    else
    {
      CopyWithNewFormatDescription = FigSignalErrorAt();
    }
    a3 = v28;
  }
  else
  {
    CopyWithNewFormatDescription = FigSignalErrorAt();
  }
LABEL_20:
  if (!(_DWORD)CopyWithNewFormatDescription)
    goto LABEL_21;
LABEL_22:
  depthencoder_emitEncodedFrame(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), CopyWithNewFormatDescription, a3, 0);
}

@end
