char *RPStringUtility_FourccToCStr(int a1)
{
  unint64_t v1;
  char *v2;

  v1 = RPStringUtility_FourccToCStr_ix++;
  v2 = (char *)&RPStringUtility_FourccToCStr_str + 5 * (v1 % 0xA);
  *v2 = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  v2[4] = 0;
  return v2;
}

uint64_t RPStringUtility_CStrToFourcc(char *a1)
{
  return (a1[1] << 16) | (*a1 << 24) | (a1[2] << 8) | a1[3];
}

uint64_t RPLogSetLogLevel(uint64_t result)
{
  if (result <= 3)
    __RPLogLevel = result;
  return result;
}

void sub_214138C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void handleInputBuffer(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  id v10;
  CMTimeValue value;
  CMTimeScale timescale;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  CMTime v19;
  int v20;
  CMTime time2;
  CMTime time1;
  CMTime v23;

  v10 = a1;
  memset(&v23, 0, sizeof(v23));
  CMClockMakeHostTimeFromSystemUnits(&v23, *(_QWORD *)(a4 + 8));
  value = v23.value;
  timescale = v23.timescale;
  time1 = *(CMTime *)((_BYTE *)v10 + 4);
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  if (CMTimeCompare(&time1, &time2)
    && value
    && *((_QWORD *)v10 + 12) >= value
    && __RPLogLevel <= 2
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    handleInputBuffer_cold_1(value, timescale);
  }
  v13 = *((_QWORD *)v10 + 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __handleInputBuffer_block_invoke;
  block[3] = &unk_24D15D670;
  v19 = v23;
  v16 = v10;
  v17 = a3;
  v20 = a5;
  v18 = a6;
  v14 = v10;
  dispatch_async(v13, block);

}

void isRunningListenerCallback(void *a1, OpaqueAudioQueue *a2, int a3)
{
  _QWORD *v5;
  NSObject *v6;
  AudioQueueRef **v7;
  _QWORD block[4];
  AudioQueueRef **v9;
  int v10;
  UInt32 ioDataSize;
  int outData;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  ioDataSize = 4;
  outData = 0;
  if (a3 == 1634824814)
  {
    if (AudioQueueGetProperty(a2, 0x6171726Eu, &outData, &ioDataSize))
    {
      if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        isRunningListenerCallback_cold_1();
    }
    else
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v14 = "isRunningListenerCallback";
        v15 = 1024;
        v16 = 238;
        v17 = 1024;
        v18 = outData;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: isRunningListenerCallback with isRunning %d", buf, 0x18u);
      }
      v6 = v5[1];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __isRunningListenerCallback_block_invoke;
      block[3] = &unk_24D15D698;
      v7 = v5;
      v9 = v7;
      v10 = outData;
      dispatch_async(v6, block);
      AudioQueueRemovePropertyListener(*v7[4], 0x6171726Eu, (AudioQueuePropertyListenerProc)isRunningListenerCallback, v7);

    }
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    isRunningListenerCallback_cold_2();
  }

}

id __copy_helper_block_e8_56n11_8_8_t0w8_s8(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  result = *(id *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_e8_56n4_8_s8(uint64_t a1)
{

}

void sub_21413B57C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __handleInputBuffer_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 *v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  double v12;
  Float64 v13;
  uint64_t v14;
  __int128 v15;
  CMSampleBufferRef v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  const __CFAllocator *v20;
  size_t v21;
  CMItemCount v22;
  const AudioStreamPacketDescription *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  CMTime time;
  CMBlockBufferRef destinationBuffer;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMTime time2;
  _BYTE time1[32];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 32))
    return;
  v4 = (__int128 *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_DWORD *)(a1 + 64);
  *(_OWORD *)time1 = *(_OWORD *)(v1 + 96);
  *(_QWORD *)&time1[16] = *(_QWORD *)(v1 + 112);
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  if (CMTimeCompare((CMTime *)time1, &time2))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 96) >= v3)
    {
      if (__RPLogLevel <= 2)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __handleInputBuffer_block_invoke_cold_3(v3, v5);
        v6 = *(_QWORD *)(a1 + 32);
      }
      if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(v6 + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0))
        v7 = __RPLogLevel > 2;
      else
        v7 = 1;
      if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __handleInputBuffer_block_invoke_cold_2();
      return;
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)time1 = 136446722;
    *(_QWORD *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 147;
    *(_WORD *)&time1[18] = 2048;
    *(double *)&time1[20] = (float)((float)v3 / (float)v5);
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: first sample received at time %.3f", time1, 0x1Cu);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *v4;
  *(_QWORD *)(v8 + 112) = *((_QWORD *)v4 + 2);
  *(_OWORD *)(v8 + 96) = v9;
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v10 + 40))
  {
    *(_BYTE *)(v10 + 40) = 0;
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v10 + 48))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      if (v12 > 0.0)
      {
        v13 = v12;
        if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)time1 = 136446466;
          *(_QWORD *)&time1[4] = "handleInputBuffer_block_invoke";
          *(_WORD *)&time1[12] = 1024;
          *(_DWORD *)&time1[14] = 159;
          _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: gap since last audio tap, filling with empty sample buffer", time1, 0x12u);
        }
        v14 = *(_QWORD *)(a1 + 32);
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
        v15 = *(_OWORD *)(v14 + 72);
        *(_OWORD *)time1 = *(_OWORD *)(v14 + 56);
        *(_OWORD *)&time1[16] = v15;
        v34 = *(_QWORD *)(v14 + 88);
        v16 = RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval(&time2, (uint64_t)time1, v13);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
        if (v16)
          CFRelease(v16);
      }

      v10 = *(_QWORD *)(a1 + 32);
    }
  }
  v17 = *(_QWORD *)(v10 + 32);
  if (*(_DWORD *)(v17 + 152) == 2)
  {
    v18 = *(_DWORD *)(a1 + 80);
    if (!v18)
    {
      v19 = *(_DWORD *)(v17 + 24);
      if (v19)
        v18 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 16) / v19;
      else
        v18 = 0;
    }
    formatDescriptionOut = 0;
    time2.value = 0;
    destinationBuffer = 0;
    v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (!CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const AudioStreamBasicDescription *)(v17 + 8), 0, 0, 0, 0, 0, &formatDescriptionOut))
    {
      v21 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 16);
      if (!CMBlockBufferCreateWithMemoryBlock(v20, 0, v21, v20, 0, 0, v21, 1u, &destinationBuffer)
        && !CMBlockBufferReplaceDataBytes(*(const void **)(*(_QWORD *)(a1 + 40) + 8), destinationBuffer, 0, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 16)))
      {
        v22 = *(unsigned int *)(a1 + 80);
        v23 = *(const AudioStreamPacketDescription **)(a1 + 48);
        *(_OWORD *)time1 = *v4;
        *(_QWORD *)&time1[16] = *((_QWORD *)v4 + 2);
        if (!CMAudioSampleBufferCreateReadyWithPacketDescriptions(v20, destinationBuffer, formatDescriptionOut, v22, (CMTime *)time1, v23, (CMSampleBufferRef *)&time2))
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          CMSampleBufferGetDuration(&time, (CMSampleBufferRef)time2.value);
          objc_msgSend(v24, "dateByAddingTimeInterval:", CMTimeGetSeconds(&time));
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = *(_QWORD *)(a1 + 32);
          v27 = *(void **)(v26 + 48);
          *(_QWORD *)(v26 + 48) = v25;

          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
          if (v28)
            (*(void (**)(uint64_t, CMTimeValue))(v28 + 16))(v28, time2.value);
        }
      }
    }
    if (time2.value)
      CFRelease((CFTypeRef)time2.value);
    if (destinationBuffer)
      CFRelease(destinationBuffer);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 144) += v18;
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)time1 = 136446466;
    *(_QWORD *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 168;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: recorder is not running, ignoring audio data", time1, 0x12u);
  }
  if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(*(_QWORD *)(a1 + 32) + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0)&& __RPLogLevel <= 2&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __handleInputBuffer_block_invoke_cold_1();
  }
}

uint64_t __isRunningListenerCallback_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 32);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 152) == 1)
    {
      v3 = result;
      if (*(_DWORD *)(result + 40))
      {
        result = *(_QWORD *)(v1 + 24);
        if (result)
        {
          result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
          v2 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 32);
        }
        *(_DWORD *)(v2 + 152) = 2;
      }
    }
  }
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

double OUTLINED_FUNCTION_5(double a1, float a2)
{
  return a2;
}

double OUTLINED_FUNCTION_6@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 8) = a3;
  return (float)((float)a1 / (float)a2);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

CMSampleBufferRef RPSampleBufferUtilities_CreateSampleBufferFromIOSurface(IOSurfaceRef surface, const CMSampleTimingInfo *a2)
{
  const __CFAllocator *v3;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CVPixelBufferRef pixelBufferOut;
  CMSampleBufferRef sampleBufferOut;

  pixelBufferOut = 0;
  sampleBufferOut = 0;
  formatDescriptionOut = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], surface, 0, &pixelBufferOut);
  CMVideoFormatDescriptionCreateForImageBuffer(0, pixelBufferOut, &formatDescriptionOut);
  CMSampleBufferCreateForImageBuffer(v3, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, a2, &sampleBufferOut);
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  return sampleBufferOut;
}

CMSampleBufferRef RPSampleBufferUtilities_CreateSampleBufferWithPixelBuffer(CVImageBufferRef imageBuffer, uint64_t a2)
{
  __int128 v3;
  CMTimeEpoch v4;
  __int128 v5;
  CMTimeEpoch v6;
  const __CFAllocator *v7;
  OSStatus v8;
  CMSampleBufferRef result;
  CMSampleTimingInfo v10;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef sampleBufferOut;

  sampleBufferOut = 0;
  formatDescriptionOut = 0;
  v3 = *(_OWORD *)(MEMORY[0x24BDC0DB8] + 48);
  *(_OWORD *)&v10.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x24BDC0DB8] + 32);
  *(_OWORD *)&v10.decodeTimeStamp.value = v3;
  v4 = *(_QWORD *)(MEMORY[0x24BDC0DB8] + 64);
  v5 = *(_OWORD *)(MEMORY[0x24BDC0DB8] + 16);
  *(_OWORD *)&v10.duration.value = *MEMORY[0x24BDC0DB8];
  *(_OWORD *)&v10.duration.epoch = v5;
  *(_OWORD *)&v10.presentationTimeStamp.value = *(_OWORD *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  v10.decodeTimeStamp.epoch = v4;
  v10.presentationTimeStamp.epoch = v6;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], imageBuffer, &formatDescriptionOut))
  {
    v8 = CMSampleBufferCreateReadyWithImageBuffer(v7, imageBuffer, formatDescriptionOut, &v10, &sampleBufferOut);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    if (!v8)
      return sampleBufferOut;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    RPSampleBufferUtilities_CreateSampleBufferWithPixelBuffer_cold_1();
  result = sampleBufferOut;
  if (sampleBufferOut)
  {
    CFRelease(sampleBufferOut);
    return 0;
  }
  return result;
}

CMSampleBufferRef RPSampleBufferUtilities_CopySampleBufferFromSourceBuffer(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  CMSampleTimingInfo *v4;
  CMItemCount v5;
  CMTime *p_decodeTimeStamp;
  __int128 v7;
  CMTimeEpoch v8;
  CMItemCount v9;
  CMTimeEpoch v10;
  CMItemCount numSampleTimingEntries;
  CMSampleBufferRef sampleBufferOut;

  numSampleTimingEntries = 0;
  sampleBufferOut = 0;
  CMSampleBufferGetSampleTimingInfoArray(a1, 0, 0, &numSampleTimingEntries);
  if ((unint64_t)numSampleTimingEntries >= 0x38E38E38E38E38FLL)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      RPSampleBufferUtilities_CopySampleBufferFromSourceBuffer_cold_1();
    return 0;
  }
  else
  {
    v4 = (CMSampleTimingInfo *)malloc_type_malloc(72 * numSampleTimingEntries, 0x1000040FF89C88EuLL);
    CMSampleBufferGetSampleTimingInfoArray(a1, numSampleTimingEntries, v4, &numSampleTimingEntries);
    v5 = numSampleTimingEntries;
    if (numSampleTimingEntries >= 1)
    {
      p_decodeTimeStamp = &v4->decodeTimeStamp;
      v7 = *MEMORY[0x24BDC0D40];
      v8 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
      v9 = numSampleTimingEntries;
      do
      {
        *(_OWORD *)&p_decodeTimeStamp->value = v7;
        p_decodeTimeStamp->epoch = v8;
        v10 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)&p_decodeTimeStamp[-1].value = *(_OWORD *)a2;
        p_decodeTimeStamp[-1].epoch = v10;
        p_decodeTimeStamp += 3;
        --v9;
      }
      while (v9);
    }
    CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, v5, v4, &sampleBufferOut);
    free(v4);
    return sampleBufferOut;
  }
}

id RPSampleBufferUtilities_EncodeAudioSampleBuffer(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  AudioBufferList *v6;
  id v7;
  unint64_t v8;
  void **p_mData;
  uint64_t v10;
  void *v11;
  const opaqueCMFormatDescription *FormatDescription;
  void *v13;
  void *v14;
  void *v15;
  CMSampleTimingInfo v17;
  size_t bufferListSizeNeededOut;
  CMBlockBufferRef blockBufferOut;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("RPBroadcastProcessExtensionPayloadKeySampleType"));

  blockBufferOut = 0;
  bufferListSizeNeededOut = 0;
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, &bufferListSizeNeededOut, 0, 0, 0, 0, 0, &blockBufferOut);
  v6 = (AudioBufferList *)malloc_type_malloc(bufferListSizeNeededOut, 0x256FBE5uLL);
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, 0, v6, bufferListSizeNeededOut, 0, 0, 0, &blockBufferOut);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  if (v6->mNumberBuffers)
  {
    v8 = 0;
    p_mData = &v6->mBuffers[0].mData;
    do
    {
      v10 = *((unsigned int *)p_mData - 1);
      v11 = *p_mData;
      p_mData += 2;
      objc_msgSend(v7, "appendBytes:length:", v11, v10);
      ++v8;
    }
    while (v8 < v6->mNumberBuffers);
  }
  free(v6);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("RPBroadcastProcessExtensionPayloadKeyAudioBufferList"));
  FormatDescription = CMSampleBufferGetFormatDescription(a1);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription), 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"));
  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetSampleTimingInfo(a1, 0, &v17);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 72);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("RPBroadcastProcessExtensionPayloadKeyTimingInfo"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", CMSampleBufferGetNumSamples(a1));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("RPBroadcastProcessExtensionPayloadKeyNumSamples"));

  if (blockBufferOut)
    CFRelease(blockBufferOut);

  return v4;
}

CMSampleBufferRef RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer(void *a1)
{
  id v1;
  void *v2;
  CMItemCount v3;
  void *v4;
  void *v5;
  const __CFAllocator *v6;
  const AudioStreamBasicDescription *StreamBasicDescription;
  void *v8;
  size_t v9;
  char *v10;
  UInt32 mChannelsPerFrame;
  void *v12;
  CMSampleBufferRef v13;
  AudioStreamBasicDescription asbd;
  CMSampleTimingInfo sampleTimingArray;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef v18;

  formatDescriptionOut = 0;
  v18 = 0;
  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyNumSamples"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyTimingInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  objc_msgSend(v4, "getBytes:length:", &sampleTimingArray, 72);
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&asbd, 0, sizeof(asbd));
  objc_msgSend(v5, "getBytes:length:", &asbd, 40);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(formatDescriptionOut);
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessExtensionPayloadKeyAudioBufferList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(v8, "length");
    v10 = (char *)malloc_type_malloc(v9, 0x8CE1C984uLL);
    memcpy(v10, (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), v9);
    if (v10)
    {
      mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      if (mChannelsPerFrame == 1 || (StreamBasicDescription->mFormatFlags & 0x20) == 0)
      {
        v12 = malloc_type_malloc(0x18uLL, 0x10800404ACF7207uLL);
        *(_DWORD *)v12 = 1;
        *((_DWORD *)v12 + 3) = v9;
        *((_DWORD *)v12 + 2) = StreamBasicDescription->mChannelsPerFrame;
        *((_QWORD *)v12 + 2) = v10;
        goto LABEL_13;
      }
      if (mChannelsPerFrame == 2)
      {
        v12 = malloc_type_malloc(0x28uLL, 0xF3B2E1ECuLL);
        *(_DWORD *)v12 = 2;
        *((_DWORD *)v12 + 2) = 1;
        *((_DWORD *)v12 + 3) = v9 >> 1;
        *((_QWORD *)v12 + 2) = v10;
        *((_DWORD *)v12 + 6) = 1;
        *((_DWORD *)v12 + 7) = v9 >> 1;
        *((_QWORD *)v12 + 4) = &v10[v9 >> 1];
        goto LABEL_13;
      }
      if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer_cold_1();
      free(v10);
    }
  }
  v12 = 0;
LABEL_13:
  CMSampleBufferCreate(v6, 0, 0, 0, 0, formatDescriptionOut, v3, 1, &sampleTimingArray, 0, 0, &v18);
  CMSampleBufferSetDataBufferFromAudioBufferList(v18, v6, v6, 0, (const AudioBufferList *)v12);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  if (v12)
  {
    free(*((void **)v12 + 2));
    free(v12);
  }
  v13 = v18;

  return v13;
}

CMSampleBufferRef RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval(CMTime *a1, uint64_t a2, Float64 a3)
{
  __int128 v5;
  const __CFAllocator *v6;
  const opaqueCMFormatDescription *v7;
  const AudioStreamBasicDescription *StreamBasicDescription;
  unsigned int mFramesPerPacket;
  const opaqueCMFormatDescription *mBytesPerPacket;
  CMItemCount v11;
  Float64 mSampleRate;
  CMSampleBufferRef result;
  CMSampleTimingInfo v14;
  AudioStreamBasicDescription asbd;
  CMSampleBufferRef v16;
  CMAudioFormatDescriptionRef formatDescriptionOut;

  v16 = 0;
  formatDescriptionOut = 0;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&asbd.mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)&asbd.mBytesPerPacket = v5;
  *(_QWORD *)&asbd.mBitsPerChannel = *(_QWORD *)(a2 + 32);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_6();
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    v7 = 0;
  }
  else
  {
    v7 = formatDescriptionOut;
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v7);
  formatDescriptionOut = 0;
  mFramesPerPacket = StreamBasicDescription->mFramesPerPacket;
  if (!mFramesPerPacket)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_1();
LABEL_27:
    mSampleRate = 0.0;
    if (!v7)
      goto LABEL_42;
    goto LABEL_41;
  }
  mBytesPerPacket = (const opaqueCMFormatDescription *)StreamBasicDescription->mBytesPerPacket;
  formatDescriptionOut = mBytesPerPacket;
  if ((_DWORD)mBytesPerPacket != StreamBasicDescription->mBytesPerFrame * mFramesPerPacket)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_5();
    goto LABEL_27;
  }
  v11 = (unint64_t)(a3 * 44100.0 / (double)mFramesPerPacket);
  asbd.mSampleRate = 0.0;
  if (CMBlockBufferCreateWithMemoryBlock(v6, 0, (_QWORD)mBytesPerPacket * v11, v6, 0, 0, (_QWORD)mBytesPerPacket * v11, 0, (CMBlockBufferRef *)&asbd))
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_4();
  }
  else
  {
    if (!CMBlockBufferAssureBlockMemory(*(CMBlockBufferRef *)&asbd.mSampleRate))
    {
      mSampleRate = asbd.mSampleRate;
      goto LABEL_8;
    }
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_3();
  }
  if (*(_QWORD *)&asbd.mSampleRate)
    CFRelease(*(CFTypeRef *)&asbd.mSampleRate);
  mSampleRate = 0.0;
LABEL_8:
  memset(&v14, 0, sizeof(v14));
  CMTimeMakeWithSeconds(&v14.duration, a3, 44100);
  v14.presentationTimeStamp = *a1;
  v14.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  if (!CMSampleBufferCreate(v6, *(CMBlockBufferRef *)&mSampleRate, 1u, 0, 0, v7, v11, 1, &v14, 1, (const size_t *)&formatDescriptionOut, &v16))
  {
    if (v7)
      CFRelease(v7);
    if (mSampleRate != 0.0)
      CFRelease(*(CFTypeRef *)&mSampleRate);
    return v16;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_2();
    if (!v7)
      goto LABEL_42;
    goto LABEL_41;
  }
  if (v7)
LABEL_41:
    CFRelease(v7);
LABEL_42:
  if (mSampleRate != 0.0)
    CFRelease(*(CFTypeRef *)&mSampleRate);
  result = v16;
  if (v16)
  {
    CFRelease(v16);
    return 0;
  }
  return result;
}

CMSampleBufferRef RPSampleBufferUtilities_CreateAudioSampleBuffer(uint64_t a1, const AudioStreamBasicDescription *a2, CMTime *a3)
{
  unsigned int v5;
  UInt32 mBytesPerPacket;
  const __CFAllocator *v7;
  OSStatus v8;
  CMSampleBufferRef v9;
  CMTime presentationTimeStamp;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef sbuf;

  formatDescriptionOut = 0;
  sbuf = 0;
  v5 = *(_DWORD *)(a1 + 12);
  mBytesPerPacket = a2->mBytesPerPacket;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_3();
  }
  else
  {
    presentationTimeStamp = *a3;
    v8 = CMAudioSampleBufferCreateWithPacketDescriptions(v7, 0, 0, 0, 0, formatDescriptionOut, v5 / mBytesPerPacket, &presentationTimeStamp, 0, &sbuf);
    CFRelease(formatDescriptionOut);
    if (v8)
    {
      if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_2();
    }
    else
    {
      if (!CMSampleBufferSetDataBufferFromAudioBufferList(sbuf, v7, v7, 0, (const AudioBufferList *)a1))
      {
        v9 = sbuf;
        presentationTimeStamp = *a3;
        CMSampleBufferSetOutputPresentationTimeStamp(sbuf, &presentationTimeStamp);
        return v9;
      }
      if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_1();
    }
  }
  if (sbuf)
    CFRelease(sbuf);
  return 0;
}

void RPSampleBufferUtilities_ReleaseAudioSampleBuffer(const void *a1, void **a2)
{
  if (a1)
    CFRelease(a1);
  if (a2)
  {
    free(a2[2]);
    free(a2);
  }
}

float RPSampleBufferUtilities_SecondsPresentationTimeForSample(opaqueCMSampleBuffer *a1)
{
  CMTime v2;

  if (!a1)
    return 0.0;
  memset(&v2, 0, sizeof(v2));
  CMSampleBufferGetPresentationTimeStamp(&v2, a1);
  return (float)v2.value / (float)v2.timescale;
}

uint64_t RPSampleBufferUtilities_CreateCGImageFromIOSurface(__IOSurface *a1)
{
  void *v2;
  uint64_t v3;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  size_t AllocSize;
  CGColorSpace *DeviceRGB;
  CGDataProvider *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (IOSurfaceGetPixelFormat(a1) == 1380411457)
  {
    v12 = *MEMORY[0x24BDD91F8];
    v13[0] = &unk_24D166F48;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = CGImageCreateFromIOSurface();

  }
  else
  {
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(a1);
    BytesPerRow = IOSurfaceGetBytesPerRow(a1);
    Width = IOSurfaceGetWidth(a1);
    Height = IOSurfaceGetHeight(a1);
    AllocSize = IOSurfaceGetAllocSize(a1);
    CFRetain(a1);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v10 = CGDataProviderCreateWithData(a1, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)RPSampleBufferUtilities_releaseIOSurface);
    v3 = (uint64_t)CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2002u, v10, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v10);
    CGColorSpaceRelease(DeviceRGB);
  }
  return v3;
}

void RPSampleBufferUtilities_releaseIOSurface(__IOSurface *a1)
{
  IOSurfaceUnlock(a1, 0, 0);
  CFRelease(a1);
}

uint64_t showReactionsTip(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "showReactionsTip";
    v10 = 1024;
    v11 = 14;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  +[RPControlCenterAngelProxy sharedInstance](RPControlCenterAngelProxy, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showReactionsTipForApplication:bundleID:", v3, v4);

  return v6;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_21414A94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21414AFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21414BA60(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_1(void *a1, const char *a2)
{
  return objc_msgSend(a1, "code");
}

uint64_t OUTLINED_FUNCTION_8_0@<X0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 8) = x8_0;
  return objc_msgSend(a1, "code");
}

void sub_214153D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void handleInputBuffer_cold_1(uint64_t a1, int a2)
{
  double v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_6(a1, a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(v2, v3);
  OUTLINED_FUNCTION_7(&dword_214135000, MEMORY[0x24BDACB70], v4, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: handleInputBuffer audio sample buffer timestamp %.3f earlier than previous %.3f", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_9();
}

void isRunningListenerCallback_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: error reading AudioQueue property", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void isRunningListenerCallback_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: AudioQueue listener property %d not added", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void __handleInputBuffer_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: Could not enqueue audio buffer", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void __handleInputBuffer_block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: Could not enqueue audio buffer", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void __handleInputBuffer_block_invoke_cold_3(uint64_t a1, int a2)
{
  double v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_6(a1, a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(v2, v3);
  OUTLINED_FUNCTION_7(&dword_214135000, MEMORY[0x24BDACB70], v4, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: discarding audio sample buffer due to timestamp %.3f earlier than previous %.3f", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_9();
}

void RPSampleBufferUtilities_CreateSampleBufferWithPixelBuffer_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed with error code %u", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CopySampleBufferFromSourceBuffer_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Overflow detected", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d unsupported NonInterleaved with %d channels", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Non-positive framesPerPacket", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d CMSampleBufferCreate failed: %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d CMBlockBufferAssureBlockMemory failed: %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d CMBlockBufferCreateEmpty failed: %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Invalid ASBD params", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d CMAudioFormatDescriptionCreate failed: %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Failed to create the CMSampleBuffer: %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Failed to create the CMSampleBuffer description: %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Failed to create format description for audio buffer", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x24BDB68C8](inAQ, *(_QWORD *)&inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x24BDB68D0](inAQ, *(_QWORD *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x24BDB68D8](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x24BDB68E0](inAQ, inBuffer, *(_QWORD *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x24BDB68F8](inAQ, inBuffer);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x24BDB6908](inAQ, *(_QWORD *)&inID, outData, ioDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x24BDB6910](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(_QWORD *)&inFlags, outAQ);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x24BDB6928](inAQ, *(_QWORD *)&inID, inProc, inUserData);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BDB6940](inAQ, *(_QWORD *)&inID, inData, *(_QWORD *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x24BDB6948](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x24BDB6950](inAQ, inImmediate);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
  MEMORY[0x24BDBE008](c, gray, alpha);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x24BDD9030]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0040](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x24BDC0058](desc);
}

OSStatus CMAudioSampleBufferCreateReadyWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0060](allocator, dataBuffer, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0068](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, presentationTimeStamp);
}

OSStatus CMBlockBufferAssureBlockMemory(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00A8](theBuffer);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x24BDC00F8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x24BDC0168](retstr, hostTime);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0280](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0290](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC02A0](allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC02B0](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(_QWORD *)&flags, blockBufferOut);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC02D0](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02E0](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x24BDC0300](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x24BDC0340](sbuf, sampleIndex, timingInfoOut);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x24BDC0348](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

OSStatus CMSampleBufferSetDataBufferFromAudioBufferList(CMSampleBufferRef sbuf, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, const AudioBufferList *bufferList)
{
  return MEMORY[0x24BDC0370](sbuf, blockBufferStructureAllocator, blockBufferBlockAllocator, *(_QWORD *)&flags, bufferList);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return MEMORY[0x24BDC0378](sbuf, outputPresentationTimeStamp);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0648](allocator, imageBuffer, formatDescriptionOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x24BDD8B60](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D28](xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x24BEB0C98]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

