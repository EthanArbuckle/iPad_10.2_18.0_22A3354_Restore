@implementation CopySectionProperty

uint64_t __captureSession_CopySectionProperty_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  void *v8;
  CMTimeValue v9;
  const __CFAllocator *v10;
  uint64_t result;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTime time;
  CMTime valuePtr;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "movieFileSinkPipelineWithSinkID:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "audioFileSinkPipelineWithSinkID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "sinkID");
  if (FigCFEqual())
  {
    v4 = (void *)objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes]((uint64_t)v2), "objectAtIndexedSubscript:", 0);
    v5 = 0;
    v6 = v4;
  }
  else if (v3)
  {
    v6 = (void *)-[FigCaptureAudioFileSinkPipeline audioFileSinkNode](v3);
    v5 = 0;
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "micSourcePipeline"), "sourceID");
    if (FigCFEqual())
      v5 = (void *)-[FigCaptureMicSourcePipeline sourceNode](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "micSourcePipeline"));
    else
      v5 = 0;
    v4 = 0;
    v6 = 0;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionFileSink_RecordedDuration")))
  {
    v7 = (const __CFDictionary *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 696), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    if (v7)
    {
      memset(&valuePtr, 0, sizeof(valuePtr));
      CMTimeMakeFromDictionary(&valuePtr, v7);
LABEL_17:
      v10 = *(const __CFAllocator **)(a1 + 72);
      time = valuePtr;
      result = (uint64_t)CMTimeCopyAsDictionary(&time, v10);
LABEL_30:
      **(_QWORD **)(a1 + 64) = result;
      return result;
    }
    if (v6)
    {
      memset(&valuePtr, 0, sizeof(valuePtr));
      objc_msgSend(v6, "lastFileDuration");
      goto LABEL_17;
    }
LABEL_25:
    result = FigSignalErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    return result;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionFileSink_RecordedSize")))
  {
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 704), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    if (v8)
    {
      v9 = objc_msgSend(v8, "unsignedLongLongValue");
    }
    else
    {
      if (!v6)
        goto LABEL_25;
      v9 = objc_msgSend(v6, "lastFileSize");
    }
    valuePtr.value = v9;
    result = (uint64_t)CFNumberCreate(*(CFAllocatorRef *)(a1 + 72), kCFNumberSInt64Type, &valuePtr);
    goto LABEL_30;
  }
  if (v4 && CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionMovieFileSink_MovieLevelMetadata")))
  {
    result = objc_msgSend(v4, "movieLevelMetadata");
    if (!result)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (v5 && CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionAudioSource_AudioMeteringLevels")))
  {
    result = objc_msgSend(v5, "audioLevels");
    if (!result)
      goto LABEL_30;
LABEL_29:
    result = (uint64_t)CFRetain((CFTypeRef)result);
    goto LABEL_30;
  }
  result = CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionMetadataSource_MetadataFormatDescription"));
  if ((_DWORD)result)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "metadataSourcePipelines", 0);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
LABEL_34:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
        if (objc_msgSend((id)objc_msgSend(v17, "sourceID"), "isEqualToString:", *(_QWORD *)(a1 + 48)))
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
          if (v14)
            goto LABEL_34;
          goto LABEL_40;
        }
      }
      v19 = (const void *)-[FigCaptureMetadataSourcePipeline sourceFormatDescription]((uint64_t)v17);
      if (!v19 || (result = (uint64_t)CFRetain(v19), (v18 = result) == 0))
      {
        result = FigSignalErrorAt();
        v18 = 0;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
      }
      if (v17)
        goto LABEL_46;
    }
    else
    {
LABEL_40:
      v18 = 0;
    }
    result = FigSignalErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
LABEL_46:
    **(_QWORD **)(a1 + 64) = v18;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12784;
  }
  return result;
}

@end
