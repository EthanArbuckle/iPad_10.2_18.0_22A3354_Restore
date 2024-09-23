@implementation HMIVideoFragment

- (HMIVideoFragment)initWithData:(id)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)(MEMORY[0x24BDC0D68] + 16);
  v5[0] = *MEMORY[0x24BDC0D68];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDC0D68] + 32);
  return -[HMIVideoFragment initWithData:timeRange:](self, "initWithData:timeRange:", a3, v5);
}

- (HMIVideoFragment)initWithData:(id)a3 timeRange:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  __int128 v9;
  HMIVideoFragment *v10;
  _OWORD v12[3];

  v6 = (void *)MEMORY[0x24BDBCE50];
  v7 = a3;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a4->var0.var3;
  v12[0] = *(_OWORD *)&a4->var0.var0;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a4->var1.var1;
  v10 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:](self, "initWithInitializationSegment:separableSegment:timeRange:", v8, v7, v12);

  return v10;
}

- (HMIVideoFragment)initWithFragments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  HMIVideoFragment *v12;
  HMIVideoFragment *result;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __38__HMIVideoFragment_initWithFragments___block_invoke;
    v16[3] = &unk_24DBEBF80;
    v17 = v5;
    v18 = v6;
    v19 = v7;
    v8 = v7;
    v9 = v6;
    v10 = v5;
    objc_msgSend(v4, "na_each:", v16);
    objc_msgSend(v10, "initializationSegment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:](self, "initWithInitializationSegment:separableSegment:", v11, v9);

    return v12;
  }
  else
  {
    v14 = _HMFPreconditionFailure();
    __38__HMIVideoFragment_initWithFragments___block_invoke(v14, v15);
  }
  return result;
}

void __38__HMIVideoFragment_initWithFragments___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMIVideoFragment *v7;
  SEL v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCombinableWithFragment:") & 1) != 0)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v9, "separableSegment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v4);

    v5 = *(void **)(a1 + 48);
    objc_msgSend(v9, "sequenceNumbers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  else
  {
    v7 = (HMIVideoFragment *)_HMFPreconditionFailure();
    -[HMIVideoFragment redactedCopy](v7, v8);
  }
}

- (id)redactedCopy
{
  HMIVideoFragment *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  HMIVideoFragment *v9;
  uint64_t v11;

  v3 = [HMIVideoFragment alloc];
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFragment timeRange](self, "timeRange");
  -[HMIVideoFragment sequenceNumbers](self, "sequenceNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMIVideoFragment firstVideoSampleByteRange](self, "firstVideoSampleByteRange");
  v9 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:](v3, "initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:", v4, v5, &v11, v6, v7, v8);

  return v9;
}

- (id)redactedCopyWithMetadata
{
  void *v3;
  void *v4;
  id v5;
  HMIVideoFragment *v6;
  void *v7;
  void *v8;
  HMIVideoFragment *v9;
  _BYTE v11[48];
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFragment separableSegment](self, "separableSegment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__HMIVideoFragment_redactedCopyWithMetadata__block_invoke;
  v12[3] = &unk_24DBEBFA8;
  v13 = v3;
  v5 = v3;
  HMIMP4Parse(v4, 0, v12);

  v6 = [HMIVideoFragment alloc];
  -[HMIVideoFragment initializationSegment](self, "initializationSegment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFragment timeRange](self, "timeRange");
  -[HMIVideoFragment sequenceNumbers](self, "sequenceNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:](v6, "initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:", v7, v5, v11, v8, 0, 0);

  return v9;
}

uint64_t __44__HMIVideoFragment_redactedCopyWithMetadata__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 != 1835295092)
    objc_msgSend(*(id *)(a1 + 32), "appendData:", v2, v3);
  return 1;
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4
{
  __int128 v4;
  _OWORD v6[3];

  v4 = *(_OWORD *)(MEMORY[0x24BDC0D68] + 16);
  v6[0] = *MEMORY[0x24BDC0D68];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x24BDC0D68] + 32);
  return -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:](self, "initWithInitializationSegment:separableSegment:timeRange:", a3, a4, v6);
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 sequenceNumbers:(id)a5
{
  id v8;
  id v9;
  id v10;
  __int128 v11;
  HMIVideoFragment *v12;
  HMIVideoFragment *v13;
  void *v14;
  HMIVideoFragment *v15;
  NSObject *v16;
  void *v17;
  NSArray *sequenceNumbers;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  _BYTE v23[32];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *(_OWORD *)(MEMORY[0x24BDC0D68] + 16);
  *(_OWORD *)v23 = *MEMORY[0x24BDC0D68];
  *(_OWORD *)&v23[16] = v11;
  v24 = *(_OWORD *)(MEMORY[0x24BDC0D68] + 32);
  v12 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:](self, "initWithInitializationSegment:separableSegment:timeRange:", v8, v9, v23);
  v13 = v12;
  if (v12)
  {
    if (-[NSArray count](v12->_sequenceNumbers, "count") && HMFEqualObjects())
    {
      v14 = (void *)MEMORY[0x220735570]();
      v15 = v13;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        sequenceNumbers = v13->_sequenceNumbers;
        *(_DWORD *)v23 = 138543874;
        *(_QWORD *)&v23[4] = v17;
        *(_WORD *)&v23[12] = 2112;
        *(_QWORD *)&v23[14] = v10;
        *(_WORD *)&v23[22] = 2112;
        *(_QWORD *)&v23[24] = sequenceNumbers;
        _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_ERROR, "%{public}@Provided sequenceNumbers: %@, don't match fragment's sequenceNumbers: %@", v23, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }
    v19 = objc_msgSend(v10, "copy");
    v20 = v13->_sequenceNumbers;
    v13->_sequenceNumbers = (NSArray *)v19;

    v13->_videoFormatDescription = 0;
    v13->_audioFormatDescription = 0;
    v13->_attributesLoaded = 0;
    v21 = MEMORY[0x24BDC0D40];
    *(_OWORD *)&v13->_baseDecodeTimeStamp.value = *MEMORY[0x24BDC0D40];
    v13->_baseDecodeTimeStamp.epoch = *(_QWORD *)(v21 + 16);
    v13->_frameReorderingRequired = 1;
  }

  return v13;
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  return -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:](self, "initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:", a3, a4, v7, 0, 0);
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 firstVideoSampleByteRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  id v14;
  __int128 v15;
  HMIVideoFragment *v16;
  _OWORD v18[3];
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  int v23;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  v12 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke;
  v19[3] = &unk_24DBEBFF8;
  v21 = v22;
  v14 = v13;
  v20 = v14;
  HMIMP4Parse(v12, 0, v19);
  v15 = *(_OWORD *)&a5->var0.var3;
  v18[0] = *(_OWORD *)&a5->var0.var0;
  v18[1] = v15;
  v18[2] = *(_OWORD *)&a5->var1.var1;
  v16 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:](self, "initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:", v11, v12, v18, v14, location, length);

  _Block_object_dispose(v22, 8);
  return v16;
}

uint64_t __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 == 1836019558)
  {
    v12 = v4;
    v13 = v5;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke_2;
    v10[3] = &unk_24DBEBFF8;
    v9 = *(_OWORD *)(a1 + 32);
    v7 = (id)v9;
    v11 = v9;
    HMIMP4Parse(a4, 0, v10);

  }
  return 1;
}

uint64_t __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke_3;
  v7[3] = &unk_24DBEBFD0;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v8 = v6;
  HMIMP4ParseMFHD(a3, v7);

  return 0;
}

void __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 sequenceNumbers:(id)a6
{
  __int128 v6;
  _OWORD v8[3];

  v6 = *(_OWORD *)&a5->var0.var3;
  v8[0] = *(_OWORD *)&a5->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a5->var1.var1;
  return -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:](self, "initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:", a3, a4, v8, a6, 0, 0);
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 sequenceNumbers:(id)a6 firstVideoSampleByteRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  HMIVideoFragment *v17;
  HMIVideoFragment *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  NSArray *sequenceNumbers;
  _OWORD *v23;
  objc_super v25;

  length = a7.length;
  location = a7.location;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HMIVideoFragment;
  v17 = -[HMIVideoFragment init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_initializationSegment, a3);
    objc_storeStrong((id *)&v18->_separableSegment, a4);
    v20 = *(_OWORD *)&a5->var0.var3;
    v19 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&v18->_timeRange.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&v18->_timeRange.start.epoch = v20;
    *(_OWORD *)&v18->_timeRange.duration.timescale = v19;
    v21 = objc_msgSend(v16, "copy");
    sequenceNumbers = v18->_sequenceNumbers;
    v18->_sequenceNumbers = (NSArray *)v21;

    v18->_firstVideoSampleByteRange.location = location;
    v18->_firstVideoSampleByteRange.length = length;
    v23 = (_OWORD *)MEMORY[0x24BDC0D40];
    v18->_baseDecodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    *(_OWORD *)&v18->_baseDecodeTimeStamp.value = *v23;
  }

  return v18;
}

- (void)_ensureAttributes
{
  void *v3;
  const __CFAllocator *v4;
  id v5;
  void *v6;
  size_t v7;
  CMTimeFlags v8;
  CMTimeFlags v9;
  __CFDictionary *Mutable;
  void *v11;
  HMIVideoFragment *v12;
  NSObject *v13;
  void *v14;
  CMTimeFlags v15;
  CFTypeRef v16;
  uint64_t (*v17)(CFTypeRef, _QWORD, uint64_t, CFTypeRef *, _QWORD);
  CMTimeFlags v18;
  const void *ValueAtIndex;
  CFTypeRef v20;
  uint64_t (*v21)(CFTypeRef, _QWORD, uint64_t, CFTypeRef *, _QWORD);
  CMTimeFlags v22;
  const void *v23;
  CFTypeRef v24;
  CFTypeRef v25;
  CFArrayRef theArray;
  CFTypeRef cf;
  CMBlockBufferRef blockBufferOut;
  CFTypeRef v29;
  CFTypeRef v30;
  CFTypeRef v31;
  $95D729B680665BEAEFA1D6FCA8238556 buf;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (self->_attributesLoaded)
    return;
  v30 = 0;
  v31 = 0;
  blockBufferOut = 0;
  v29 = 0;
  theArray = 0;
  cf = 0;
  v24 = 0;
  v25 = 0;
  -[HMIVideoFragment data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = objc_retainAutorelease(v3);
  v6 = (void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = CMBlockBufferCreateWithMemoryBlock(v4, v6, v7, (CFAllocatorRef)*MEMORY[0x24BDBD258], 0, 0, objc_msgSend(v5, "length"), 2u, &blockBufferOut);
  if (!v8)
  {
    v8 = CMByteStreamCreateForBlockBuffer();
    if (!v8)
    {
      Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDDCF30], CFSTR("video/mp4"));
      CFRelease(CFSTR("video/mp4"));
      v15 = FigFormatReaderCreateForStreamReturningResults();
      if (v15)
      {
LABEL_28:
        v9 = v15;
        goto LABEL_5;
      }
      v16 = v29;
      v17 = *(uint64_t (**)(CFTypeRef, _QWORD, uint64_t, CFTypeRef *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 64);
      if (!v17)
        goto LABEL_54;
      v18 = v17(v16, 0, 1986618469, &v31, 0);
      if (v18 != -12843)
      {
        v9 = v18;
        if (v18)
          goto LABEL_5;
        v15 = FigTrackReaderCopyProperty((uint64_t)v31, *MEMORY[0x24BDDCFA0], (uint64_t)v4, (uint64_t)&theArray);
        if (v15)
          goto LABEL_28;
        v9 = FigTrackReaderCopyProperty((uint64_t)v31, *MEMORY[0x24BDDCFA8], (uint64_t)v4, (uint64_t)&v25);
        if (v25)
          self->_frameReorderingRequired = CFBooleanGetValue((CFBooleanRef)v25) != 0;
        else
          self->_frameReorderingRequired = 1;
        if (v9)
          goto LABEL_5;
        if (CFArrayGetCount(theArray) >= 1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
          self->_videoFormatDescription = (opaqueCMFormatDescription *)CFRetain(ValueAtIndex);
        }
        if (theArray)
          CFRelease(theArray);
        theArray = 0;
        getTimeRangeAssetTrackProperty((uint64_t)v29, (uint64_t)v31, &self->_videoTrackTimeRange.start.value);
        v15 = FigTrackReaderCopyProperty((uint64_t)v31, *MEMORY[0x24BDDCFB0], (uint64_t)v4, (uint64_t)&v24);
        if (v15)
          goto LABEL_28;
        if (v24)
        {
          CMTimeMakeFromDictionary((CMTime *)&buf, (CFDictionaryRef)v24);
          self->_baseDecodeTimeStamp = buf;
        }
      }
      v20 = v29;
      v21 = *(uint64_t (**)(CFTypeRef, _QWORD, uint64_t, CFTypeRef *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 64);
      if (!v21)
      {
LABEL_54:
        v9 = -12782;
        goto LABEL_5;
      }
      v22 = v21(v20, 0, 1936684398, &v30, 0);
      if (v22 != -12843)
      {
        v9 = v22;
        if (v22)
          goto LABEL_5;
        v15 = FigTrackReaderCopyProperty((uint64_t)v30, *MEMORY[0x24BDDCFA0], (uint64_t)v4, (uint64_t)&theArray);
        if (v15)
          goto LABEL_28;
        if (CFArrayGetCount(theArray) >= 1)
        {
          v23 = CFArrayGetValueAtIndex(theArray, 0);
          self->_audioFormatDescription = (opaqueCMFormatDescription *)CFRetain(v23);
        }
        if (theArray)
          CFRelease(theArray);
        theArray = 0;
        getTimeRangeAssetTrackProperty((uint64_t)v29, (uint64_t)v30, &self->_audioTrackTimeRange.start.value);
      }
      v9 = 0;
      goto LABEL_5;
    }
  }
  v9 = v8;
  Mutable = 0;
LABEL_5:
  self->_attributesLoaded = 1;
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  if (cf)
    CFRelease(cf);
  if (v29)
    CFRelease(v29);
  if (Mutable)
    CFRelease(Mutable);
  if (v31)
    CFRelease(v31);
  if (v30)
    CFRelease(v30);
  if (v24)
    CFRelease(v24);
  if (v25)
    CFRelease(v25);
  if (v9)
  {
    v11 = (void *)MEMORY[0x220735570]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543618;
      *(int64_t *)((char *)&buf.value + 4) = (int64_t)v14;
      LOWORD(buf.flags) = 1024;
      *(unsigned int *)((char *)&buf.flags + 2) = v9;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to read fragment data, err: %d", (uint8_t *)&buf, 0x12u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- ($94156A41BB1A692D44714D0EDB14C87A)videoTrackTimeRange
{
  $94156A41BB1A692D44714D0EDB14C87A *result;
  __int128 v6;

  result = ($94156A41BB1A692D44714D0EDB14C87A *)-[HMIVideoFragment _ensureAttributes](self, "_ensureAttributes");
  v6 = *(_OWORD *)&self->_videoTrackTimeRange.start.epoch;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->_videoTrackTimeRange.start.value;
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->_videoTrackTimeRange.duration.timescale;
  return result;
}

- ($94156A41BB1A692D44714D0EDB14C87A)audioTrackTimeRange
{
  $94156A41BB1A692D44714D0EDB14C87A *result;
  __int128 v6;

  result = ($94156A41BB1A692D44714D0EDB14C87A *)-[HMIVideoFragment _ensureAttributes](self, "_ensureAttributes");
  v6 = *(_OWORD *)&self->_audioTrackTimeRange.start.epoch;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->_audioTrackTimeRange.start.value;
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->_audioTrackTimeRange.duration.timescale;
  return result;
}

- (opaqueCMFormatDescription)videoFormatDescription
{
  -[HMIVideoFragment _ensureAttributes](self, "_ensureAttributes");
  return self->_videoFormatDescription;
}

- (opaqueCMFormatDescription)audioFormatDescription
{
  -[HMIVideoFragment _ensureAttributes](self, "_ensureAttributes");
  return self->_audioFormatDescription;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)baseDecodeTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[HMIVideoFragment _ensureAttributes](self, "_ensureAttributes");
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_baseDecodeTimeStamp;
  return result;
}

- (BOOL)frameReorderingRequired
{
  -[HMIVideoFragment _ensureAttributes](self, "_ensureAttributes");
  return self->_frameReorderingRequired;
}

- (BOOL)isCombinableWithFragment:(id)a3
{
  id v4;
  int v5;
  opaqueCMFormatDescription *v6;
  const opaqueCMFormatDescription *v7;
  int v8;
  BOOL v9;

  v4 = a3;
  v5 = CMFormatDescriptionEqual(-[HMIVideoFragment videoFormatDescription](self, "videoFormatDescription"), (CMFormatDescriptionRef)objc_msgSend(v4, "videoFormatDescription"));
  v6 = -[HMIVideoFragment audioFormatDescription](self, "audioFormatDescription");
  v7 = (const opaqueCMFormatDescription *)objc_msgSend(v4, "audioFormatDescription");

  v8 = CMFormatDescriptionEqual(v6, v7);
  if (v5)
    v9 = v8 == 0;
  else
    v9 = 1;
  return !v9;
}

- (NSData)data
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMIVideoFragment initializationSegment](self, "initializationSegment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMIVideoFragment separableSegment](self, "separableSegment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v5);

  v6 = (void *)objc_msgSend(v4, "copy");
  return (NSData *)v6;
}

- (NSData)sanitizedData
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFragment data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__HMIVideoFragment_sanitizedData__block_invoke;
  v7[3] = &unk_24DBEBFA8;
  v5 = v3;
  v8 = v5;
  HMIMP4Parse(v4, 0, v7);

  return (NSData *)v5;
}

uint64_t __33__HMIVideoFragment_sanitizedData__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 != 1835295092)
    objc_msgSend(*(id *)(a1 + 32), "appendData:", v2, v3);
  return 1;
}

- (NSData)sanitizedSeperableSegment
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoFragment separableSegment](self, "separableSegment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__HMIVideoFragment_sanitizedSeperableSegment__block_invoke;
  v7[3] = &unk_24DBEBFA8;
  v5 = v3;
  v8 = v5;
  HMIMP4Parse(v4, 0, v7);

  return (NSData *)v5;
}

uint64_t __45__HMIVideoFragment_sanitizedSeperableSegment__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 != 1835295092)
    objc_msgSend(*(id *)(a1 + 32), "appendData:", v2, v3);
  return 1;
}

+ (BOOL)isInitializationSegment:(id)a3 combinableWithInitializationSegment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  HMIVideoFragment *v8;
  void *v9;
  HMIVideoFragment *v10;
  HMIVideoFragment *v11;
  void *v12;
  HMIVideoFragment *v13;
  BOOL result;
  void *v15;
  SEL v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = v6;
    if (v6)
    {
      v8 = [HMIVideoFragment alloc];
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:](v8, "initWithInitializationSegment:separableSegment:", v5, v9);

      v11 = [HMIVideoFragment alloc];
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:](v11, "initWithInitializationSegment:separableSegment:", v7, v12);

      LOBYTE(v12) = -[HMIVideoFragment isCombinableWithFragment:](v10, "isCombinableWithFragment:", v13);
      return (char)v12;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v15 = (void *)_HMFPreconditionFailure();
  +[HMIVideoFragment fragmentData:handler:](v15, v16, v17, v18);
  return result;
}

+ (void)fragmentData:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  HMIVideoFragment *v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[3];
  int v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "canFragmentData:", v6) & 1) != 0)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__4;
    v21[4] = __Block_byref_object_dispose__4;
    v22 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__4;
    v19[4] = __Block_byref_object_dispose__4;
    v20 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__4;
    v17[4] = __Block_byref_object_dispose__4;
    v18 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __41__HMIVideoFragment_fragmentData_handler___block_invoke;
    v9[3] = &unk_24DBEC070;
    v11 = v21;
    v12 = v19;
    v13 = v17;
    v14 = v15;
    v10 = v7;
    HMIMP4Parse(v6, 0, v9);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v17, 8);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);

  }
  else
  {
    v8 = -[HMIVideoFragment initWithData:]([HMIVideoFragment alloc], "initWithData:", v6);
    (*((void (**)(id, HMIVideoFragment *))v7 + 2))(v7, v8);

  }
}

uint64_t __41__HMIVideoFragment_fragmentData_handler___block_invoke(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMIVideoFragment *v14;
  __int128 v15;
  HMIVideoFragment *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _OWORD v21[3];
  _QWORD v22[5];

  v8 = a3;
  v9 = a4;
  if (a2 <= 1836019557)
  {
    if (a2 != 1718909296)
    {
      if (a2 == 1835295092)
      {
        v10 = (void *)MEMORY[0x220735570]();
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendData:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendData:", v8);
        v13 = a1[4];
        v14 = [HMIVideoFragment alloc];
        v15 = *(_OWORD *)(MEMORY[0x24BDC0D68] + 16);
        v21[0] = *MEMORY[0x24BDC0D68];
        v21[1] = v15;
        v21[2] = *(_OWORD *)(MEMORY[0x24BDC0D68] + 32);
        v16 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:](v14, "initWithInitializationSegment:separableSegment:timeRange:", v11, v12, v21);
        (*(void (**)(uint64_t, HMIVideoFragment *))(v13 + 16))(v13, v16);

        objc_autoreleasePoolPop(v10);
        v17 = *(_QWORD *)(a1[7] + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = 0;

      }
      goto LABEL_11;
    }
    v19 = a1[5];
LABEL_9:
    objc_storeStrong((id *)(*(_QWORD *)(v19 + 8) + 40), a3);
    goto LABEL_11;
  }
  if (a2 == 1836019558)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __41__HMIVideoFragment_fragmentData_handler___block_invoke_2;
    v22[3] = &unk_24DBEC048;
    v22[4] = a1[8];
    HMIMP4Parse(v9, 0, v22);
    goto LABEL_11;
  }
  if (a2 == 1836019574)
  {
    v19 = a1[6];
    goto LABEL_9;
  }
LABEL_11:

  return 1;
}

uint64_t __41__HMIVideoFragment_fragmentData_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__HMIVideoFragment_fragmentData_handler___block_invoke_3;
  v4[3] = &unk_24DBEC020;
  v4[4] = *(_QWORD *)(a1 + 32);
  HMIMP4ParseMFHD(a3, v4);
  return 0;
}

uint64_t __41__HMIVideoFragment_fragmentData_handler___block_invoke_3(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (BOOL)canFragmentData:(id)a3
{
  id v3;
  BOOL v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1718909296;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__HMIVideoFragment_canFragmentData___block_invoke;
  v6[3] = &unk_24DBEC098;
  v6[4] = &v7;
  v6[5] = &v11;
  v6[6] = &v15;
  HMIMP4Parse(v3, 0, v6);
  v4 = *((_BYTE *)v12 + 24) && *((_DWORD *)v8 + 6) == 1836019558 && *((_DWORD *)v16 + 6) > 0;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v4;
}

BOOL __36__HMIVideoFragment_canFragmentData___block_invoke(_QWORD *a1, int a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(_DWORD *)(v2 + 24);
  if (v3 == a2)
  {
    if (a2 > 1836019557)
    {
      if (a2 == 1836019558)
      {
        *(_DWORD *)(v2 + 24) = 1835295092;
        v2 = *(_QWORD *)(a1[6] + 8);
        v5 = *(_DWORD *)(v2 + 24) + 1;
        goto LABEL_12;
      }
      v4 = 1836019574;
    }
    else
    {
      if (a2 == 1718909296)
      {
        v5 = 1836019574;
        goto LABEL_12;
      }
      v4 = 1835295092;
    }
    if (a2 == v4)
    {
      v5 = 1836019558;
LABEL_12:
      *(_DWORD *)(v2 + 24) = v5;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  return v3 == a2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  uint64_t *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v7;
  _QWORD v8[15];
  char v9;
  char v10;

  -[HMIVideoFragment timeRange](self, "timeRange");
  if ((v10 & 1) == 0
    || (-[HMIVideoFragment timeRange](self, "timeRange"), (v9 & 1) == 0)
    || (-[HMIVideoFragment timeRange](self, "timeRange"), v8[14])
    || (-[HMIVideoFragment timeRange](self, "timeRange"), (v8[6] & 0x8000000000000000) != 0))
  {
    v5 = &v7;
    result = -[HMIVideoFragment videoTrackTimeRange](self, "videoTrackTimeRange");
  }
  else
  {
    v5 = v8;
    result = -[HMIVideoFragment timeRange](self, "timeRange");
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v5;
  retstr->var3 = v5[2];
  return result;
}

- (unint64_t)sequenceNumber
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[HMIVideoFragment sequenceNumbers](self, "sequenceNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[HMIVideoFragment sequenceNumbers](self, "sequenceNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (void)dealloc
{
  opaqueCMFormatDescription *videoFormatDescription;
  opaqueCMFormatDescription *audioFormatDescription;
  objc_super v5;

  videoFormatDescription = self->_videoFormatDescription;
  if (videoFormatDescription)
    CFRelease(videoFormatDescription);
  audioFormatDescription = self->_audioFormatDescription;
  if (audioFormatDescription)
    CFRelease(audioFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoFragment;
  -[HMIVideoFragment dealloc](&v5, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoFragment)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  NSRange v15;
  HMIVideoFragment *v16;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_initializationSegment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_separableSegment);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  NSStringFromSelector(sel_timeRange);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "decodeCMTimeRangeForKey:", v11);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
  }

  v12 = objc_opt_class();
  NSStringFromSelector(sel_firstVideoSampleByteRange);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = NSRangeFromString(v14);

  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  v16 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:](self, "initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:", v7, v10, v18, v15.location, v15.length);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSRange v13;

  v4 = a3;
  -[HMIVideoFragment initializationSegment](self, "initializationSegment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initializationSegment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[HMIVideoFragment separableSegment](self, "separableSegment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_separableSegment);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[HMIVideoFragment timeRange](self, "timeRange");
  NSStringFromSelector(sel_timeRange);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCMTimeRange:forKey:", &v12, v9);

  v13.location = -[HMIVideoFragment firstVideoSampleByteRange](self, "firstVideoSampleByteRange");
  NSStringFromRange(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_firstVideoSampleByteRange);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v11);

}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _OWORD v22[3];
  _QWORD v23[6];
  NSRange v24;

  v23[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoFragment sequenceNumbers](self, "sequenceNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]"), v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoFragment initializationSegment](self, "initializationSegment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Initialization Segment Data"), v7);
  v23[0] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoFragment separableSegment](self, "separableSegment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Separable Segment Data"), v10);
  v23[1] = v11;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:", CFSTR("Sequence Numbers"), v21);
  v23[2] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoFragment timeRange](self, "timeRange");
  HMICMTimeRangeDescription(v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Time Range"), v14);
  v23[3] = v15;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  v24.location = -[HMIVideoFragment firstVideoSampleByteRange](self, "firstVideoSampleByteRange");
  NSStringFromRange(v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("First Video Sample Byte Range"), v17);
  v23[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSData)initializationSegment
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)separableSegment
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- ($94156A41BB1A692D44714D0EDB14C87A)timeRange
{
  $94156A41BB1A692D44714D0EDB14C87A *result;

  objc_copyStruct(retstr, &self->_timeRange, 48, 1, 0);
  return result;
}

- (NSArray)sequenceNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (_NSRange)firstVideoSampleByteRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_firstVideoSampleByteRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumbers, 0);
  objc_storeStrong((id *)&self->_separableSegment, 0);
  objc_storeStrong((id *)&self->_initializationSegment, 0);
}

@end
