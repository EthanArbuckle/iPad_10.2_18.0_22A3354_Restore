@implementation ParavirtualizedVideoDecoder

uint64_t __ParavirtualizedVideoDecoder_CreateInstanceWithSpecification_block_invoke(uint64_t a1, OpaqueCMBlockBuffer *a2)
{
  uint64_t MessageTypeAndFlagsAndGuestUUID;
  uint64_t v4;
  const void *v5;
  uint64_t **DerivedStorage;
  uint64_t **v7;
  CFTypeRef v8;
  CFUUIDRef v9;
  CFArrayRef v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t v13;
  CFArrayRef v14;
  uint64_t UInt32;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFArrayRef v19;
  const __CFArray *v20;
  uint64_t **v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  __CVBuffer *v24;
  __CVBuffer *v25;
  uint64_t **v26;
  uint64_t v27;
  CFTypeRef v28;
  uint64_t SInt32;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFIndex v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t *v38;
  uint64_t DestinationPixelBufferAttributes;
  uint64_t v40;
  CFDictionaryRef v41;
  __CFDictionary *MutableCopy;
  __CFDictionary *v43;
  CFTypeRef v44;
  uint64_t v45;
  CFTypeRef v46;
  uint64_t v47;
  uint64_t v48;
  CFArrayRef v49;
  uint64_t v50;
  const void *SInt64;
  os_unfair_lock_s *v52;
  const __CFDictionary *Value;
  const __CFDictionary *v54;
  const void *v55;
  const void *v56;
  const __CFArray *v57;
  const __CFArray *v58;
  CFIndex Count;
  CFIndex FirstIndexOfValue;
  int v61;
  uint64_t v62;
  CFIndex v63;
  OpaqueCMTaggedBufferGroup *v64;
  CFArrayRef v65;
  unint64_t v67;
  uint64_t v68;
  int v69;
  int v70;
  int v71;
  int Height;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t v84;
  unsigned int v85;
  int v86;
  CFTypeRef v87;
  CFArrayRef IOSurface;
  CFTypeRef v89;
  uint64_t v90;
  CFTypeRef v91;
  CFArrayRef pixelBuffer;
  CFArrayRef theArray;
  CFTypeRef cf[4];
  CFRange v95;

  cf[3] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v86 = 0;
  MessageTypeAndFlagsAndGuestUUID = VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(a2, &v86, 0, 0);
  if (!(_DWORD)MessageTypeAndFlagsAndGuestUUID)
  {
    v4 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v4)
    {
      v5 = (const void *)v4;
      if (v86 > 1147565409)
      {
        if (v86 > 1148215904)
        {
          if (v86 != 1413772146)
          {
            if (v86 != 1413768557)
            {
              if (v86 == 1148215905)
              {
                VTVideoDecoderGetCMBaseObject(v4);
                DerivedStorage = (uint64_t **)CMBaseObjectGetDerivedStorage();
                cf[0] = 0;
                if (!VTParavirtualizationMessageCopyCFDictionary(a2, 745562721, cf))
                  VTDecoderSessionSetPixelBufferAttributes(*DerivedStorage, cf[0]);
                goto LABEL_61;
              }
              goto LABEL_149;
            }
            VTVideoDecoderGetCMBaseObject(v4);
            v45 = CMBaseObjectGetDerivedStorage();
            theArray = 0;
            cf[0] = 0;
            LODWORD(v89) = 0;
            LODWORD(IOSurface) = 0;
            v91 = 0;
            pixelBuffer = 0;
            if (VTParavirtualizationMessageGetSInt64(a2, 745826668, cf)
              || (v46 = cf[0], VTParavirtualizationMessageGetSInt32(a2, 744845938, &v89))
              || (v47 = v89, VTParavirtualizationMessageGetUInt32(a2, 745107046, &IOSurface))
              || (v48 = IOSurface,
                  VTParavirtualizationMessageCopyCFUUID(a2, 745895273, &theArray)))
            {
              v56 = 0;
              goto LABEL_99;
            }
            v49 = theArray;
            if (theArray)
            {
              v81 = v48;
              v82 = v47;
              v84 = v45;
              VTVideoDecoderGetCMBaseObject(v5);
              v50 = CMBaseObjectGetDerivedStorage();
              SInt64 = (const void *)FigCFNumberCreateSInt64();
              v52 = (os_unfair_lock_s *)(v50 + 72);
              os_unfair_lock_lock((os_unfair_lock_t)(v50 + 72));
              Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v50 + 80), v49);
              if (Value)
              {
                v54 = Value;
                v55 = CFDictionaryGetValue(Value, CFSTR("PixelBufferKey"));
                v56 = v55;
                if (v55)
                {
                  CFRetain(v55);
                  v57 = (const __CFArray *)CFDictionaryGetValue(v54, CFSTR("TilesUsingPixelBuffer"));
                  if (v57)
                  {
                    v58 = v57;
                    Count = CFArrayGetCount(v57);
                    if (Count)
                    {
                      v95.length = Count;
                      v95.location = 0;
                      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v58, v95, SInt64);
                      if (FirstIndexOfValue != -1)
                        CFArrayRemoveValueAtIndex(v58, FirstIndexOfValue);
                      if (!CFArrayGetCount(v58))
                        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v50 + 80), v49);
                    }
                  }
                  v61 = 0;
                }
                else
                {
                  v61 = FigSignalErrorAt();
                }
              }
              else
              {
                v61 = FigSignalErrorAt();
                v56 = 0;
              }
              v45 = v84;
              v47 = v82;
              os_unfair_lock_unlock(v52);
              if (SInt64)
                CFRelease(SInt64);
              v48 = v81;
              if (v61)
              {
LABEL_99:
                if (theArray)
                  CFRelease(theArray);
                if (v56)
                  CFRelease(v56);
                if (pixelBuffer)
                  CFRelease(pixelBuffer);
                v44 = v91;
                if (!v91)
                  goto LABEL_149;
                goto LABEL_148;
              }
            }
            else
            {
              v56 = 0;
            }
            VTTileDecoderSessionEmitDecodedTile(*(uint64_t **)(v45 + 8), (uint64_t)v46, v47, v48, (uint64_t)v56);
            if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, &pixelBuffer, &v91)
              && !VTParavirtualizationMessageAppendSInt32())
            {
              VTParavirtualizationGuestSendMessageToHostAsync(pixelBuffer);
            }
            goto LABEL_99;
          }
          VTVideoDecoderGetCMBaseObject(v4);
          v40 = CMBaseObjectGetDerivedStorage();
          theArray = 0;
          cf[0] = 0;
          if (VTParavirtualizationMessageCopyCFDictionary(a2, 744710753, cf))
          {
            v41 = 0;
          }
          else
          {
            v41 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            if (v41)
            {
              MutableCopy = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
              v43 = MutableCopy;
              if (MutableCopy)
              {
                CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E0CA8FF0], v41);
                if (!VTParavirtualizationMessageCopyCFDictionary(a2, 745825394, &theArray))
                  VTTileDecoderSessionSetTileDecodeRequirements(*(uint64_t **)(v40 + 8), cf[0], theArray);
              }
              else
              {
                FigSignalErrorAt();
              }
              goto LABEL_49;
            }
            FigSignalErrorAt();
          }
          v43 = 0;
LABEL_49:
          if (cf[0])
            CFRelease(cf[0]);
          if (theArray)
            CFRelease(theArray);
          if (v41)
            CFRelease(v41);
          if (!v43)
            goto LABEL_149;
          v44 = v43;
          goto LABEL_148;
        }
        if (v86 == 1147565410)
        {
          cf[0] = 0;
          if (VTParavirtualizationMessageCopyCFUUIDArray(a2, 745892139, (__CFArray **)cf))
            goto LABEL_61;
          if (cf[0])
          {
            if (CFArrayGetCount((CFArrayRef)cf[0]) >= 1)
              paravirtualizedVideoDecoder_lookupRetainAndForgetPendingFramePixelBuffersByUUIDs((uint64_t)v5, (const __CFArray *)cf[0], 0);
LABEL_61:
            v44 = cf[0];
            if (!cf[0])
              goto LABEL_149;
            goto LABEL_148;
          }
LABEL_149:
          CFRelease(v5);
          return MessageTypeAndFlagsAndGuestUUID;
        }
        if (v86 != 1148021094)
          goto LABEL_149;
        VTVideoDecoderGetCMBaseObject(v4);
        v26 = (uint64_t **)CMBaseObjectGetDerivedStorage();
        theArray = 0;
        cf[0] = 0;
        v90 = 0;
        v91 = 0;
        pixelBuffer = 0;
        IOSurface = 0;
        v89 = 0;
        v87 = 0;
        v27 = VTParavirtualizationMessageGetSInt64(a2, 744911469, cf);
        if ((_DWORD)v27)
        {
          v79 = v27;
          v28 = 0;
        }
        else
        {
          v28 = cf[0];
          SInt32 = VTParavirtualizationMessageGetSInt32(a2, 744845938, (_DWORD *)&v90 + 1);
          if (!(_DWORD)SInt32)
          {
            v30 = HIDWORD(v90);
            SInt32 = VTParavirtualizationMessageGetUInt32(a2, 745107046, &v90);
            if (!(_DWORD)SInt32)
            {
              v31 = v90;
              v32 = VTParavirtualizationMessageCopyCFUUIDArray(a2, 745892139, &theArray);
              if (!(_DWORD)v32)
              {
                if (!theArray
                  || CFArrayGetCount(theArray) < 1
                  || (v32 = paravirtualizedVideoDecoder_lookupRetainAndForgetPendingFramePixelBuffersByUUIDs((uint64_t)v5, theArray, &pixelBuffer), !(_DWORD)v32))
                {
                  v32 = VTParavirtualizationMessageCopyFigTagCollectionArray(a2, 745825067, &IOSurface);
                  if (!(_DWORD)v32)
                  {
                    if (pixelBuffer)
                      v33 = CFArrayGetCount(pixelBuffer);
                    else
                      v33 = 0;
                    v63 = (CFIndex)IOSurface;
                    if (IOSurface)
                      v63 = CFArrayGetCount(IOSurface);
                    if (v33 == v63)
                    {
                      if (!pixelBuffer)
                      {
                        v64 = 0;
                        goto LABEL_126;
                      }
                      v32 = MEMORY[0x194028160](*MEMORY[0x1E0C9AE00], IOSurface, pixelBuffer, &v87);
                      if (!(_DWORD)v32)
                      {
                        v64 = (OpaqueCMTaggedBufferGroup *)v87;
LABEL_126:
                        VTDecoderSessionEmitDecodedMultiImageFrame(*v26, v28, v30, v31, v64);
                        if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, (CMBlockBufferRef *)&v91, &v89)&& !VTParavirtualizationMessageAppendSInt32())
                        {
                          VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v91);
                        }
LABEL_129:
                        if (v87)
                          CFRelease(v87);
                        if (IOSurface)
                          CFRelease(IOSurface);
                        if (pixelBuffer)
                          CFRelease(pixelBuffer);
                        v65 = theArray;
                        if (!theArray)
                        {
LABEL_145:
                          if (v91)
                            CFRelease(v91);
                          v44 = v89;
                          if (!v89)
                            goto LABEL_149;
                          goto LABEL_148;
                        }
LABEL_144:
                        CFRelease(v65);
                        goto LABEL_145;
                      }
                    }
                    else
                    {
                      v32 = FigSignalErrorAt();
                    }
                  }
                }
              }
              v79 = v32;
LABEL_180:
              VTDecoderSessionEmitDecodedMultiImageFrame(*v26, v28, v79, v31, 0);
              goto LABEL_129;
            }
          }
          v79 = SInt32;
        }
        v31 = 0;
        goto LABEL_180;
      }
      if (v86 <= 1147433056)
      {
        if (v86 == 1115252001)
        {
          VTVideoDecoderGetCMBaseObject(v4);
          v34 = CMBaseObjectGetDerivedStorage();
          os_unfair_lock_lock((os_unfair_lock_t)(v34 + 56));
          CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v34 + 64));
          os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 56));
          VTVideoDecoderGetCMBaseObject(v5);
          v35 = CMBaseObjectGetDerivedStorage();
          os_unfair_lock_lock((os_unfair_lock_t)(v35 + 72));
          CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v35 + 80));
          os_unfair_lock_unlock((os_unfair_lock_t)(v35 + 72));
          VTVideoDecoderGetCMBaseObject(v5);
          v36 = CMBaseObjectGetDerivedStorage();
          v37 = VTParavirtualizationCopyNotificationQueueForGuestUUID((CFUUIDBytes *)(v36 + 24));
          CMNotificationCenterGetDefaultLocalCenter();
          FigDispatchAsyncPostNotification();
          if (v37)
            dispatch_release(v37);
          goto LABEL_149;
        }
        if (v86 != 1147303270)
          goto LABEL_149;
        VTVideoDecoderGetCMBaseObject(v4);
        v7 = (uint64_t **)CMBaseObjectGetDerivedStorage();
        theArray = 0;
        cf[0] = 0;
        v91 = 0;
        pixelBuffer = 0;
        IOSurface = 0;
        v89 = 0;
        if (VTParavirtualizationMessageGetSInt64(a2, 744911469, cf)
          || (v8 = cf[0], VTParavirtualizationMessageCopyCFDictionary(a2, 745566064, &theArray)))
        {
          v9 = 0;
        }
        else
        {
          VTDecoderSessionCreatePixelBufferWithOptions(*v7, v8, (uint64_t)theArray, &pixelBuffer);
          if (pixelBuffer)
          {
            v9 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
            v10 = pixelBuffer;
            VTVideoDecoderGetCMBaseObject(v5);
            v11 = CMBaseObjectGetDerivedStorage();
            os_unfair_lock_lock((os_unfair_lock_t)(v11 + 56));
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v11 + 64), v9, v10);
            CFDictionaryGetCount(*(CFDictionaryRef *)(v11 + 64));
            os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 56));
          }
          else
          {
            v9 = 0;
          }
          if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, (CMBlockBufferRef *)&v91, &v89)
            && !VTParavirtualizationMessageAppendSInt32()
            && (!v9 || !VTParavirtualizationMessageAppendCFUUID((uint64_t)v89, 745895273, v9)))
          {
            if (pixelBuffer)
              IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
            VTParavirtualizationGuestSendMessageWithIOSurfacesToHostAsync((OpaqueCMBlockBuffer *)v91);
          }
        }
        if (pixelBuffer)
          CFRelease(pixelBuffer);
        if (v9)
          CFRelease(v9);
        if (v91)
          CFRelease(v91);
        if (v89)
          CFRelease(v89);
        v44 = theArray;
        if (!theArray)
          goto LABEL_149;
LABEL_148:
        CFRelease(v44);
        goto LABEL_149;
      }
      if (v86 == 1147433057)
      {
        VTVideoDecoderGetCMBaseObject(v4);
        v38 = (uint64_t *)CMBaseObjectGetDerivedStorage();
        theArray = 0;
        cf[0] = 0;
        DestinationPixelBufferAttributes = VTDecoderSessionGetDestinationPixelBufferAttributes(*v38);
        if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, (CMBlockBufferRef *)cf, &theArray)
          && (!DestinationPixelBufferAttributes
           || !VTParavirtualizationMessageAppendCFDictionary(theArray, 745562721, DestinationPixelBufferAttributes)))
        {
          VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)cf[0]);
        }
        goto LABEL_149;
      }
      if (v86 != 1147497844)
        goto LABEL_149;
      VTVideoDecoderGetCMBaseObject(v4);
      v12 = (uint64_t **)CMBaseObjectGetDerivedStorage();
      pixelBuffer = 0;
      theArray = 0;
      LODWORD(IOSurface) = 0;
      LODWORD(v87) = 0;
      v91 = 0;
      v89 = 0;
      HIDWORD(v90) = 0;
      v13 = VTParavirtualizationMessageGetSInt64(a2, 744911469, &theArray);
      if ((_DWORD)v13)
      {
        v78 = v13;
        v25 = 0;
        v14 = 0;
      }
      else
      {
        v14 = theArray;
        UInt32 = VTParavirtualizationMessageGetSInt32(a2, 744845938, &IOSurface);
        if (!(_DWORD)UInt32)
        {
          v16 = IOSurface;
          UInt32 = VTParavirtualizationMessageGetUInt32(a2, 745107046, &v87);
          if (!(_DWORD)UInt32)
          {
            v17 = v87;
            v18 = VTParavirtualizationMessageCopyCFUUID(a2, 745895273, &pixelBuffer);
            if ((_DWORD)v18)
            {
              v78 = v18;
              v25 = 0;
              goto LABEL_183;
            }
            v19 = pixelBuffer;
            if (pixelBuffer)
            {
              v20 = v14;
              v21 = v12;
              v83 = v17;
              VTVideoDecoderGetCMBaseObject(v5);
              v22 = CMBaseObjectGetDerivedStorage();
              v23 = (os_unfair_lock_s *)(v22 + 56);
              os_unfair_lock_lock((os_unfair_lock_t)(v22 + 56));
              v24 = (__CVBuffer *)CFDictionaryGetValue(*(CFDictionaryRef *)(v22 + 64), v19);
              v25 = v24;
              if (v24)
              {
                CFRetain(v24);
                CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v22 + 64), v19);
                os_unfair_lock_unlock(v23);
                v17 = v83;
                v12 = v21;
                v14 = v20;
              }
              else
              {
                v78 = FigSignalErrorAt();
                os_unfair_lock_unlock(v23);
                v12 = v21;
                if ((_DWORD)v78)
                {
                  v14 = v20;
                  v17 = v83;
                  goto LABEL_183;
                }
                v14 = v20;
                v17 = v83;
              }
            }
            else
            {
              v25 = 0;
            }
            v62 = VTParavirtualizationMessageSetAttachmentsOnPixelBufferAndIOSurfaceIfPresent(a2, v25);
            if (!(_DWORD)v62)
            {
              v62 = VTParavirtualizationMessageGetSInt32(a2, 744909164, (_DWORD *)&v90 + 1);
              if (!(_DWORD)v62)
              {
                if (HIDWORD(v90))
                {
                  if ((_DWORD)v16)
                  {
                    paravirtualizedVideoDecoder_FillPixelBufferWithYCbCrColor(v25, 78, 124, 218);
                  }
                  else
                  {
                    CVPixelBufferGetIOSurface(v25);
                    if (IOSurfaceGetProtectionOptions())
                      goto LABEL_138;
                    v85 = v17;
                    paravirtualizedVideoDecoder_FillPixelBufferWithYCbCrColor(v25, 69, 182, 90);
                    CVPixelBufferLockBaseAddress(v25, 0);
                    v80 = (int)theArray;
                    v67 = (int)(CVPixelBufferGetWidth(v25) - 20) / 0xF0uLL;
                    v68 = 0;
                    v69 = (int)(CVPixelBufferGetHeight(v25) - 20) / 27;
                    if (v69 >= (int)v67)
                      v69 = v67;
                    if (v69 <= 1)
                      v70 = 1;
                    else
                      v70 = v69;
                    v71 = -9 * v70;
                    while (1)
                    {
                      Height = CVPixelBufferGetHeight(v25);
                      v73 = Height >= 0 ? Height : Height + 1;
                      v74 = v71 + (v73 >> 1);
                      v75 = strlen(off_1E2F627F0[v68]);
                      if (paravirtualizedVideoDecoder_DrawCharsToPixelBuffer(v25, 20, v74, v70, (uint64_t)off_1E2F627F0[v68], v75))break;
                      ++v68;
                      v71 += 9 * v70;
                      if (v68 == 3)
                      {
                        snprintf((char *)cf, 0x13uLL, "frameNumber: %5d", v80);
                        v76 = strlen((const char *)cf);
                        v77 = CVPixelBufferGetWidth(v25) - 6 * v70 * v76;
                        paravirtualizedVideoDecoder_DrawCharsToPixelBuffer(v25, v77 / 2, 36, v70, (uint64_t)cf, v76);
                        break;
                      }
                    }
                    CVPixelBufferUnlockBaseAddress(v25, 0);
                    v17 = v85;
                    v16 = 0;
                  }
                  CVBufferSetAttachment(v25, CFSTR("IsDRMSubstitute"), (CFTypeRef)*MEMORY[0x1E0C9AE50], kCVAttachmentMode_ShouldPropagate);
                }
LABEL_138:
                VTDecoderSessionEmitDecodedFrame(*v12, v14, v16, v17, v25);
                if (!VTParavirtualizationCreateReplyAndByteStream(a2, 8, (CMBlockBufferRef *)&v91, &v89)&& !VTParavirtualizationMessageAppendSInt32())
                {
                  VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v91);
                }
                if (v25)
                  goto LABEL_142;
                goto LABEL_143;
              }
            }
            v78 = v62;
LABEL_183:
            VTDecoderSessionEmitDecodedFrame(*v12, v14, v78, v17, 0);
            if (v25)
LABEL_142:
              CFRelease(v25);
LABEL_143:
            v65 = pixelBuffer;
            if (!pixelBuffer)
              goto LABEL_145;
            goto LABEL_144;
          }
        }
        v78 = UInt32;
        v25 = 0;
      }
      v17 = 0;
      goto LABEL_183;
    }
  }
  return MessageTypeAndFlagsAndGuestUUID;
}

@end
