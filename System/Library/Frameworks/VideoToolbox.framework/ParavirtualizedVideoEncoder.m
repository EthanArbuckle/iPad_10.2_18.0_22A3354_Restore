@implementation ParavirtualizedVideoEncoder

uint64_t __ParavirtualizedVideoEncoder_CreateInstanceWithSpecification_block_invoke(uint64_t a1, OpaqueCMBlockBuffer *a2)
{
  OpaqueCMBlockBuffer *v2;
  uint64_t MessageTypeAndFlagsAndGuestUUID;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  OpaqueCMBlockBuffer *v7;
  CFDictionaryRef v8;
  const void *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef v14;
  uint64_t v15;
  uint64_t v16;
  OpaqueCMBlockBuffer *v17;
  uint64_t v18;
  uint64_t v19;
  CFDictionaryRef v20;
  __CFDictionary *MutableCopy;
  __CFDictionary *v22;
  int v23;
  uint64_t v24;
  CFStringRef v25;
  CFArrayRef v26;
  uint64_t v27;
  CFDictionaryRef v28;
  __CFDictionary *v29;
  __CFDictionary *v30;
  uint64_t v31;
  CFTypeID v32;
  uint64_t v33;
  uint64_t DerivedStorage;
  uint64_t v35;
  CFUUIDBytes *v36;
  NSObject *v37;
  uint64_t v38;
  __CFDictionary *v39;
  uint64_t v40;
  int v41;
  CFTypeRef v42;
  __CFData *v43;
  uint64_t **v44;
  unint64_t v45;
  UInt8 *BytePtr;
  uint64_t v47;
  uint64_t **v48;
  uint64_t v49;
  CFTypeID v50;
  uint64_t v51;
  uint64_t v52;
  OpaqueCMBlockBuffer *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  CFTypeID v58;
  CFDictionaryRef v59;
  CFTypeRef v60;
  CFTypeRef v61;
  CFTypeRef v62;
  CFArrayRef v63;
  int v65;
  uint64_t v66;
  CFTypeRef cf[2];
  uint64_t v68;
  CFArrayRef theArray[2];
  uint64_t v70;
  CFTypeRef v71;
  CFTypeRef v72;
  CFTypeRef v73[2];
  uint64_t v74;
  __CFData *v75;
  __int128 v76;
  uint64_t v77;

  v2 = a2;
  v65 = 0;
  MessageTypeAndFlagsAndGuestUUID = VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(a2, &v65, 0, 0);
  if (!(_DWORD)MessageTypeAndFlagsAndGuestUUID)
  {
    v4 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v4)
    {
      v5 = (const void *)v4;
      if (v65 <= 1413837681)
      {
        if (v65 <= 1165193330)
        {
          if (v65 <= 1164338290)
          {
            if (v65 == 1115252001)
            {
              DerivedStorage = CMBaseObjectGetDerivedStorage();
              os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 84));
              CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(DerivedStorage + 88));
              os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 84));
              v35 = CMBaseObjectGetDerivedStorage();
              os_unfair_lock_lock((os_unfair_lock_t)(v35 + 96));
              CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v35 + 104));
              os_unfair_lock_unlock((os_unfair_lock_t)(v35 + 96));
              v36 = (CFUUIDBytes *)CMBaseObjectGetDerivedStorage();
              v37 = VTParavirtualizationCopyNotificationQueueForGuestUUID(v36 + 4);
              CMNotificationCenterGetDefaultLocalCenter();
              FigDispatchAsyncPostNotification();
              if (v37)
                dispatch_release(v37);
              goto LABEL_276;
            }
            if (v65 != 1164275060)
              goto LABEL_276;
            v6 = CMBaseObjectGetDerivedStorage();
            LODWORD(v71) = 0;
            v75 = 0;
            *(_QWORD *)&v76 = 0;
            v66 = 0;
            cf[0] = 0;
            v72 = 0;
            v73[0] = 0;
            theArray[0] = 0;
            if (!VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, &v71, 0))
            {
              v7 = *(OpaqueCMBlockBuffer **)(v6 + 48);
              if ((v71 & 0x10) != 0)
              {
                if (!v7)
                {
                  if (v2)
                    v60 = CFRetain(v2);
                  else
                    v60 = 0;
                  v8 = 0;
                  *(_QWORD *)(v6 + 48) = v60;
                  goto LABEL_249;
                }
                CMBlockBufferAppendBufferReference(v7, v2, 0, 0, 0);
              }
              else if ((!v7 || !CMBlockBufferAppendBufferReference(v7, v2, 0, 0, 0))
                     && !VTParavirtualizationCreateReplyAndByteStream(v2, 8, &v75, &v72))
              {
                v8 = *(CFDictionaryRef *)(v6 + 48);
                if (v8)
                {
                  *(_QWORD *)(v6 + 48) = 0;
                  v2 = v8;
                }
                if (!VTParavirtualizationMessageGetSInt64(v2, 744911469, &v76))
                {
                  v9 = (const void *)v76;
                  if (!VTParavirtualizationMessageGetSInt32(v2, 744845938, (_DWORD *)&v66 + 1))
                  {
                    v10 = HIDWORD(v66);
                    if (!VTParavirtualizationMessageGetUInt32(v2, 744842860, &v66))
                    {
                      v11 = v66;
                      if (!VTParavirtualizationMessageCopyCMSampleBuffer(v2, 745759334, *(_DWORD *)(v6 + 80), v6 + 112, 0, cf)&& !VTParavirtualizationMessageCopyCFUUIDArray(v2, 745892139, theArray)&& (!theArray[0]|| CFArrayGetCount(theArray[0]) < 1|| !paravirtualizedVideoEncoder_forgetPendingFramePixelBuffersByUUIDs((uint64_t)v5, 0, 1, theArray[0]))&& !VTParavirtualizationMessageCopyCFUUID(v2, 745895273, (CFUUIDRef *)v73)&& (!v73[0]|| !paravirtualizedVideoEncoder_forgetPendingFramePixelBufferByUUID((uint64_t)v5, 0,
                                             1,
                                             v73[0])))
                      {
                        VTEncoderSessionEmitEncodedFrame(*(uint64_t **)v6, v9, v10, v11, (opaqueCMSampleBuffer *)cf[0]);
                        if (!VTParavirtualizationMessageAppendSInt32())
                          VTParavirtualizationGuestSendMessageToHostAsync(v75);
                      }
                    }
                  }
                }
LABEL_249:
                if (cf[0])
                  CFRelease(cf[0]);
                if (v73[0])
                  CFRelease(v73[0]);
                if (theArray[0])
                  CFRelease(theArray[0]);
                if (v75)
                  CFRelease(v75);
                v43 = (__CFData *)v72;
                if (!v72)
                  goto LABEL_273;
LABEL_272:
                CFRelease(v43);
                goto LABEL_273;
              }
            }
            v8 = 0;
            goto LABEL_249;
          }
          if (v65 != 1164338291)
          {
            if (v65 != 1164993121)
              goto LABEL_276;
            LODWORD(cf[0]) = 0;
            v19 = CMBaseObjectGetDerivedStorage();
            *(_QWORD *)&v76 = 0;
            v73[0] = 0;
            theArray[0] = 0;
            if (VTParavirtualizationMessageCopyCFDictionary(v2, 745562721, &v76))
            {
              v22 = 0;
              v20 = 0;
              goto LABEL_217;
            }
            v20 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            if (v20)
            {
              MutableCopy = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
              v22 = MutableCopy;
              if (!MutableCopy)
              {
                FigSignalErrorAt();
                goto LABEL_217;
              }
              CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E0CA8FF0], v20);
              v23 = VTEncoderSessionSetPixelBufferAttributes(*(uint64_t **)v19, v22);
              if (VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, cf, 0))
              {
LABEL_217:
                if ((_QWORD)v76)
                  CFRelease((CFTypeRef)v76);
                if (v22)
                  CFRelease(v22);
                if (!v20)
                {
LABEL_229:
                  if (v73[0])
                    CFRelease(v73[0]);
                  v26 = theArray[0];
                  if (!theArray[0])
                    goto LABEL_276;
                  goto LABEL_275;
                }
                v59 = v20;
LABEL_228:
                CFRelease(v59);
                goto LABEL_229;
              }
              if (((uint64_t)cf[0] & 2) != 0)
              {
                if (VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)v73, theArray)|| VTParavirtualizationMessageAppendSInt32()|| VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v73[0]))
                {
                  goto LABEL_217;
                }
              }
              else if (v23)
              {
                goto LABEL_217;
              }
              *(_QWORD *)(v19 + 24) = v22;
            }
            else
            {
              FigSignalErrorAt();
            }
            v22 = 0;
            goto LABEL_217;
          }
          v48 = (uint64_t **)CMBaseObjectGetDerivedStorage();
          *(_QWORD *)&v76 = 0;
          v73[0] = 0;
          theArray[0] = 0;
          LODWORD(v75) = 0;
          LODWORD(v72) = 0;
          LODWORD(v71) = 0;
          cf[0] = 0;
          if (VTParavirtualizationMessageGetSInt32(v2, 744714084, &v75)
            || VTParavirtualizationMessageGetSInt32(v2, 746022004, &v72)
            || VTParavirtualizationMessageGetSInt32(v2, 745039732, &v71)
            || VTParavirtualizationMessageCopyCFDictionary(v2, 744847476, cf))
          {
            goto LABEL_159;
          }
          VTEncoderSessionCreateVideoFormatDescription(*v48, (CMVideoCodecType)v75, v72, (int)v71, (const __CFDictionary *)cf[0], theArray);
          goto LABEL_155;
        }
        if (v65 <= 1413834092)
        {
          if (v65 != 1165193331)
          {
            if (v65 != 1413833572)
              goto LABEL_276;
            v15 = CMBaseObjectGetDerivedStorage();
            *(_QWORD *)&v76 = 0;
            v73[0] = 0;
            theArray[0] = 0;
            LODWORD(v75) = 0;
            LODWORD(v72) = 0;
            LODWORD(v71) = 0;
            cf[0] = 0;
            if (VTParavirtualizationMessageGetSInt32(v2, 744714084, &v75)
              || VTParavirtualizationMessageGetSInt32(v2, 746022004, &v72)
              || VTParavirtualizationMessageGetSInt32(v2, 745039732, &v71)
              || VTParavirtualizationMessageCopyCFDictionary(v2, 744847476, cf))
            {
              goto LABEL_159;
            }
            VTTileEncoderSessionCreateVideoFormatDescription(*(_BYTE ***)(v15 + 8), (CMVideoCodecType)v75, (int32_t)v72, (int32_t)v71, (const __CFDictionary *)cf[0], theArray);
LABEL_155:
            if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v76, v73)
              && !VTParavirtualizationMessageAppendSInt32()
              && !VTParavirtualizationMessageAppendCMFormatDescription((uint64_t)v73[0], 1030120563, theArray[0]))
            {
              VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v76);
            }
LABEL_159:
            if (cf[0])
              CFRelease(cf[0]);
            if (theArray[0])
              CFRelease(theArray[0]);
            goto LABEL_163;
          }
          v44 = (uint64_t **)CMBaseObjectGetDerivedStorage();
          *(_QWORD *)&v76 = 0;
          v73[0] = 0;
          theArray[0] = 0;
          if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v76, v73)
            && !VTParavirtualizationMessageCopyCFData(v2, 745828964, theArray))
          {
            if (theArray[0])
            {
              v45 = CFDataGetLength(theArray[0]) / 0x30uLL;
              BytePtr = (UInt8 *)CFDataGetBytePtr(theArray[0]);
            }
            else
            {
              v45 = 0;
              BytePtr = 0;
            }
            VTEncoderSessionSetTimeRangesForNextPass(*v44, v45, BytePtr);
LABEL_225:
            if (!VTParavirtualizationMessageAppendSInt32())
              VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v76);
            goto LABEL_227;
          }
          goto LABEL_227;
        }
        if (v65 != 1413834093)
        {
          if (v65 != 1413837665)
            goto LABEL_276;
          LODWORD(v75) = 0;
          v27 = CMBaseObjectGetDerivedStorage();
          *(_QWORD *)&v76 = 0;
          v73[0] = 0;
          theArray[0] = 0;
          cf[0] = 0;
          if (VTParavirtualizationMessageCopyCFDictionary(v2, 745562721, &v76))
          {
            v30 = 0;
            v28 = 0;
          }
          else
          {
            v28 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            if (v28)
            {
              v29 = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
              v30 = v29;
              if (v29)
              {
                CFDictionaryAddValue(v29, (const void *)*MEMORY[0x1E0CA8FF0], v28);
                if (!VTParavirtualizationMessageGetVTInt32Size(v2, 745830248, (int8x8_t *)v73))
                {
                  VTTileEncoderSessionSetTileAttributes(*(uint64_t **)(v27 + 8), (uint64_t)v73[0], (uint64_t)v30);
                  if (!VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, &v75, 0)
                    && (v75 & 2) != 0
                    && !VTParavirtualizationCreateReplyAndByteStream(v2, 8, theArray, cf)
                    && !VTParavirtualizationMessageAppendSInt32())
                  {
                    VTParavirtualizationGuestSendMessageToHostAsync(theArray[0]);
                  }
                }
              }
              else
              {
                FigSignalErrorAt();
              }
            }
            else
            {
              FigSignalErrorAt();
              v30 = 0;
            }
          }
          if ((_QWORD)v76)
            CFRelease((CFTypeRef)v76);
          if (v30)
            CFRelease(v30);
          if (v28)
            CFRelease(v28);
          if (theArray[0])
            CFRelease(theArray[0]);
          v26 = (CFArrayRef)cf[0];
          if (!cf[0])
            goto LABEL_276;
          goto LABEL_275;
        }
        v52 = CMBaseObjectGetDerivedStorage();
        LODWORD(v72) = 0;
        v75 = 0;
        *(_QWORD *)&v76 = 0;
        LODWORD(v71) = 0;
        HIDWORD(v66) = 0;
        v73[0] = 0;
        theArray[0] = 0;
        cf[0] = 0;
        if (!VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, &v72, 0))
        {
          v53 = *(OpaqueCMBlockBuffer **)(v52 + 56);
          if ((v72 & 0x10) != 0)
          {
            if (!v53)
            {
              if (v2)
                v62 = CFRetain(v2);
              else
                v62 = 0;
              v8 = 0;
              *(_QWORD *)(v52 + 56) = v62;
              goto LABEL_265;
            }
            CMBlockBufferAppendBufferReference(v53, v2, 0, 0, 0);
          }
          else if ((!v53 || !CMBlockBufferAppendBufferReference(v53, v2, 0, 0, 0))
                 && !VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)cf, &v75))
          {
            v8 = *(CFDictionaryRef *)(v52 + 56);
            if (v8)
            {
              *(_QWORD *)(v52 + 56) = 0;
              v2 = v8;
            }
            if (!VTParavirtualizationMessageGetSInt64(v2, 745826668, &v76))
            {
              v54 = v76;
              if (!VTParavirtualizationMessageGetSInt32(v2, 744845938, &v71))
              {
                v55 = v71;
                if (!VTParavirtualizationMessageGetUInt32(v2, 744842860, (_DWORD *)&v66 + 1))
                {
                  v56 = HIDWORD(v66);
                  if (!VTParavirtualizationMessageCopyCFUUID(v2, 745895273, (CFUUIDRef *)v73)
                    && !VTParavirtualizationMessageCopyCMSampleBuffer(v2, 745759334, *(_DWORD *)(v52 + 80), v52 + 112, 0, (CFTypeRef *)theArray))
                  {
                    if (theArray[0])
                    {
                      if (!paravirtualizedVideoEncoder_lookupRetainAndForgetPendingTilePixelBufferByUUID((uint64_t)v5, v54, 0, 1, v73[0]))
                      {
                        VTEncoderSessionEmitEncodedTile(*(uint64_t **)(v52 + 8), v54, v55, v56, (uint64_t)theArray[0]);
                        if (!VTParavirtualizationMessageAppendSInt32())
                          VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)cf[0]);
                      }
                    }
                    else
                    {
                      FigSignalErrorAt();
                    }
                  }
                }
              }
            }
LABEL_265:
            if (theArray[0])
              CFRelease(theArray[0]);
            v63 = (CFArrayRef)v73[0];
            if (v73[0])
              goto LABEL_268;
            goto LABEL_269;
          }
        }
        v8 = 0;
        goto LABEL_265;
      }
      if (v65 <= 1836083565)
      {
        if (v65 > 1836082291)
        {
          if (v65 == 1836082292)
          {
            v49 = CMBaseObjectGetDerivedStorage();
            v75 = 0;
            v72 = 0;
            v76 = *MEMORY[0x1E0CA2E68];
            v77 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            v71 = 0;
            *(_OWORD *)v73 = v76;
            v74 = v77;
            *(_OWORD *)theArray = v76;
            v70 = v77;
            if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, &v75, &v72)
              && !VTParavirtualizationMessageGetCMTime(v2, 744911987, (int8x8_t *)&v76)
              && !VTParavirtualizationMessageCopyCFPropertyList(v2, 745369715, &v71))
            {
              if (v71 && (v50 = CFGetTypeID(v71), v50 == CFStringGetTypeID()))
              {
                v51 = *(_QWORD *)(v49 + 120);
                *(_OWORD *)cf = v76;
                v68 = v77;
                VTMultiPassStorageGetTimeStampAndDuration(v51, (uint64_t)cf, v71, (uint64_t)v73, (uint64_t)theArray);
                *(_OWORD *)cf = *(_OWORD *)v73;
                v68 = v74;
                if (!VTParavirtualizationMessageAppendCMTime())
                {
                  *(_OWORD *)cf = *(_OWORD *)theArray;
                  v68 = v70;
                  if (!VTParavirtualizationMessageAppendCMTime()
                    && !VTParavirtualizationMessageAppendSInt32())
                  {
                    VTParavirtualizationGuestSendMessageToHostAsync(v75);
                  }
                }
              }
              else
              {
                FigSignalErrorAt();
              }
            }
            if (v75)
              CFRelease(v75);
            if (v72)
              CFRelease(v72);
            v26 = (CFArrayRef)v71;
            if (!v71)
              goto LABEL_276;
          }
          else
          {
            if (v65 != 1836083556)
              goto LABEL_276;
            v24 = CMBaseObjectGetDerivedStorage();
            *(_QWORD *)&v76 = 0;
            v73[0] = 0;
            if (VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v76, v73))
            {
              v25 = 0;
            }
            else
            {
              v25 = VTMultiPassStorageCopyIdentifier(*(_QWORD *)(v24 + 120));
              if (!VTParavirtualizationMessageAppendCFPropertyList())
                VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v76);
            }
            if ((_QWORD)v76)
              CFRelease((CFTypeRef)v76);
            if (v73[0])
              CFRelease(v73[0]);
            if (!v25)
              goto LABEL_276;
            v26 = (CFArrayRef)v25;
          }
          goto LABEL_275;
        }
        if (v65 != 1413837682)
        {
          if (v65 != 1836082020)
            goto LABEL_276;
          v12 = CMBaseObjectGetDerivedStorage();
          theArray[0] = 0;
          cf[0] = 0;
          v76 = *MEMORY[0x1E0CA2E68];
          v77 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          LODWORD(v72) = 0;
          v75 = 0;
          if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, theArray, cf)
            && !VTParavirtualizationMessageGetCMTime(v2, 745829232, (int8x8_t *)&v76)
            && !VTParavirtualizationMessageGetSInt32(v2, 745107044, &v72))
          {
            v13 = *(_QWORD *)(v12 + 120);
            *(_OWORD *)v73 = v76;
            v74 = v77;
            VTMultiPassStorageCopyDataAtTimeStamp(v13, (__int128 *)v73, (int)v72, &v75);
            if (!VTParavirtualizationMessageAppendSInt32())
            {
              if (v75)
              {
                LOBYTE(v71) = 0;
                if (VTParavirtualizationMessageCFDataRequiresFragmentation((uint64_t)cf[0], 0x4000uLL, v75, (BOOL *)&v71))goto LABEL_235;
                if ((_BYTE)v71)
                {
                  v73[0] = 0;
                  do
                  {
                    if (VTParavirtualizationMessageAppendCFDataWithLimitFromOffset((uint64_t)cf[0], 745369700, 0x4000uLL, v75, (CFIndex *)v73))break;
                    v14 = v73[0];
                    if ((unint64_t)v14 >= CFDataGetLength(v75))
                      goto LABEL_234;
                    if (VTParavirtualizationMessageChangeMessageFlags(theArray[0], 16, 16)
                      || VTParavirtualizationGuestSendMessageToHostAsync(theArray[0]))
                    {
                      break;
                    }
                    if (theArray[0])
                    {
                      CFRelease(theArray[0]);
                      theArray[0] = 0;
                    }
                    if (cf[0])
                    {
                      CFRelease(cf[0]);
                      cf[0] = 0;
                    }
                  }
                  while (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, theArray, cf));
                  goto LABEL_235;
                }
                if (VTParavirtualizationMessageAppendCFData((uint64_t)cf[0], 745369700, v75))
                  goto LABEL_235;
              }
LABEL_234:
              VTParavirtualizationGuestSendMessageToHostAsync(theArray[0]);
            }
          }
LABEL_235:
          if (theArray[0])
            CFRelease(theArray[0]);
          if (cf[0])
            CFRelease(cf[0]);
          v26 = v75;
          if (!v75)
            goto LABEL_276;
          goto LABEL_275;
        }
        v38 = CMBaseObjectGetDerivedStorage();
        *(_QWORD *)&v76 = 0;
        v73[0] = 0;
        if (VTParavirtualizationMessageCopyCFDictionary(v2, 744710753, &v76))
        {
          v8 = 0;
        }
        else
        {
          v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          if (v8)
          {
            v39 = (__CFDictionary *)FigCFDictionaryCreateMutableCopy();
            v40 = (uint64_t)v39;
            if (v39)
            {
              CFDictionaryAddValue(v39, (const void *)*MEMORY[0x1E0CA8FF0], v8);
              v41 = VTParavirtualizationMessageCopyCFDictionary(v2, 745825650, v73);
              v42 = v73[0];
              if (!v41)
              {
                VTTileEncoderSessionSetTileEncodeRequirements(*(uint64_t **)(v38 + 8), v40, (uint64_t)v73[0]);
                v42 = v73[0];
              }
              if (v42)
                CFRelease(v42);
            }
            else
            {
              FigSignalErrorAt();
            }
LABEL_139:
            if ((_QWORD)v76)
              CFRelease((CFTypeRef)v76);
            if (v40)
            {
              v43 = (__CFData *)v40;
              goto LABEL_272;
            }
LABEL_273:
            if (v8)
            {
              v26 = v8;
LABEL_275:
              CFRelease(v26);
            }
LABEL_276:
            CFRelease(v5);
            return MessageTypeAndFlagsAndGuestUUID;
          }
          FigSignalErrorAt();
        }
        v40 = 0;
        goto LABEL_139;
      }
      if (v65 > 1836086120)
      {
        if (v65 != 1836086121)
        {
          if (v65 != 1836086132)
            goto LABEL_276;
          v31 = CMBaseObjectGetDerivedStorage();
          cf[0] = 0;
          v75 = 0;
          v76 = *MEMORY[0x1E0CA2E68];
          v77 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          v72 = 0;
          *(_OWORD *)v73 = v76;
          v74 = v77;
          if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)cf, &v75)
            && !VTParavirtualizationMessageGetCMTime(v2, 744911987, (int8x8_t *)&v76)
            && !VTParavirtualizationMessageCopyCFPropertyList(v2, 745369715, &v72))
          {
            if (v72 && (v32 = CFGetTypeID(v72), v32 == CFStringGetTypeID()))
            {
              v33 = *(_QWORD *)(v31 + 120);
              *(_OWORD *)theArray = v76;
              v70 = v77;
              VTMultiPassStorageGetTimeStamp(v33, (__int128 *)theArray, v72, (uint64_t)v73);
              *(_OWORD *)theArray = *(_OWORD *)v73;
              v70 = v74;
              if (!VTParavirtualizationMessageAppendCMTime()
                && !VTParavirtualizationMessageAppendSInt32())
              {
                VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)cf[0]);
              }
            }
            else
            {
              FigSignalErrorAt();
            }
          }
          if (cf[0])
            CFRelease(cf[0]);
          if (v75)
            CFRelease(v75);
          v26 = (CFArrayRef)v72;
          if (!v72)
            goto LABEL_276;
          goto LABEL_275;
        }
        v57 = CMBaseObjectGetDerivedStorage();
        *(_QWORD *)&v76 = 0;
        v73[0] = 0;
        theArray[0] = 0;
        if (!VTParavirtualizationMessageCopyCFPropertyList(v2, 745957732, (CFTypeRef *)theArray))
        {
          if (!theArray[0] || (v58 = CFGetTypeID(theArray[0]), v58 != CFStringGetTypeID()))
          {
            FigSignalErrorAt();
            goto LABEL_227;
          }
          VTMultiPassStorageSetIdentifier(*(_QWORD *)(v57 + 120), theArray[0]);
          if (VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v76, v73))
            goto LABEL_227;
          goto LABEL_225;
        }
LABEL_227:
        v59 = (CFDictionaryRef)v76;
        if (!(_QWORD)v76)
          goto LABEL_229;
        goto LABEL_228;
      }
      if (v65 == 1836083566)
      {
        v47 = CMBaseObjectGetDerivedStorage();
        *(_QWORD *)&v76 = 0;
        v73[0] = 0;
        if (!VTParavirtualizationCreateReplyAndByteStream(v2, 8, (CMBlockBufferRef *)&v76, v73))
        {
          VTMultiPassStorageInvalidate(*(_QWORD *)(v47 + 120));
          if (!VTParavirtualizationMessageAppendSInt32())
            VTParavirtualizationGuestSendMessageToHostAsync((OpaqueCMBlockBuffer *)v76);
        }
LABEL_163:
        if ((_QWORD)v76)
          CFRelease((CFTypeRef)v76);
        v26 = (CFArrayRef)v73[0];
        if (!v73[0])
          goto LABEL_276;
        goto LABEL_275;
      }
      if (v65 != 1836086116)
        goto LABEL_276;
      v16 = CMBaseObjectGetDerivedStorage();
      theArray[0] = 0;
      cf[0] = 0;
      v76 = *MEMORY[0x1E0CA2E68];
      v77 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      LODWORD(v72) = 0;
      v75 = 0;
      LODWORD(v71) = 0;
      if (!VTParavirtualizationMessageGetMessageTypeAndFlagsAndGuestUUID(v2, 0, &v71, 0))
      {
        v17 = *(OpaqueCMBlockBuffer **)(v16 + 128);
        if ((v71 & 0x10) != 0)
        {
          if (!v17)
          {
            if (v2)
              v61 = CFRetain(v2);
            else
              v61 = 0;
            v8 = 0;
            *(_QWORD *)(v16 + 128) = v61;
            goto LABEL_261;
          }
          CMBlockBufferAppendBufferReference(v17, v2, 0, 0, 0);
        }
        else if ((!v17 || !CMBlockBufferAppendBufferReference(v17, v2, 0, 0, 0))
               && !VTParavirtualizationCreateReplyAndByteStream(v2, 8, theArray, cf))
        {
          v8 = *(CFDictionaryRef *)(v16 + 128);
          if (v8)
          {
            *(_QWORD *)(v16 + 128) = 0;
            v2 = v8;
          }
          if (!VTParavirtualizationMessageGetCMTime(v2, 745829232, (int8x8_t *)&v76)
            && !VTParavirtualizationMessageGetSInt32(v2, 745107044, &v72)
            && !VTParavirtualizationMessageCopyCFData(v2, 745369700, &v75))
          {
            v18 = *(_QWORD *)(v16 + 120);
            *(_OWORD *)v73 = v76;
            v74 = v77;
            VTMultiPassStorageSetDataAtTimeStamp(v18, (__int128 *)v73, (int)v72, v75);
            if (!VTParavirtualizationMessageAppendSInt32())
              VTParavirtualizationGuestSendMessageToHostAsync(theArray[0]);
          }
LABEL_261:
          v63 = theArray[0];
          if (theArray[0])
LABEL_268:
            CFRelease(v63);
LABEL_269:
          if (cf[0])
            CFRelease(cf[0]);
          v43 = v75;
          if (v75)
            goto LABEL_272;
          goto LABEL_273;
        }
      }
      v8 = 0;
      goto LABEL_261;
    }
  }
  return MessageTypeAndFlagsAndGuestUUID;
}

@end
