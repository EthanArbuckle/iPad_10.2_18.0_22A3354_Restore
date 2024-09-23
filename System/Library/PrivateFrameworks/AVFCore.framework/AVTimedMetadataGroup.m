@implementation AVTimedMetadataGroup

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableTimedMetadataGroup *v4;
  NSArray *v5;
  _OWORD v7[3];

  v4 = +[AVMutableTimedMetadataGroup allocWithZone:](AVMutableTimedMetadataGroup, "allocWithZone:", a3);
  v5 = -[AVTimedMetadataGroup items](self, "items");
  if (self)
    -[AVTimedMetadataGroup timeRange](self, "timeRange");
  else
    memset(v7, 0, sizeof(v7));
  return -[AVMutableTimedMetadataGroup initWithItems:timeRange:](v4, "initWithItems:timeRange:", v5, v7);
}

- (CMTimeRange)timeRange
{
  _OWORD *v3;
  __int128 v4;

  v3 = *(_OWORD **)&self->start.timescale;
  v4 = v3[2];
  *(_OWORD *)&retstr->start.value = v3[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[3];
  return self;
}

- (NSArray)items
{
  return self->_priv->items;
}

- (AVTimedMetadataGroup)initWithItems:(NSArray *)items timeRange:(CMTimeRange *)timeRange
{
  AVTimedMetadataGroup *v6;
  AVTimedMetadataGroupInternal *v7;
  AVTimedMetadataGroupInternal *priv;
  __int128 v9;
  __int128 v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVTimedMetadataGroup;
  v6 = -[AVTimedMetadataGroup init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVTimedMetadataGroupInternal);
    v6->_priv = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_priv->items = (NSArray *)-[NSArray copy](items, "copy");
      priv = v6->_priv;
      v10 = *(_OWORD *)&timeRange->start.epoch;
      v9 = *(_OWORD *)&timeRange->duration.timescale;
      *(_OWORD *)&priv->timeRange.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&priv->timeRange.start.epoch = v10;
      *(_OWORD *)&priv->timeRange.duration.timescale = v9;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVTimedMetadataGroupInternal)_timedMetadataGroupInternal
{
  return self->_priv;
}

- (void)dealloc
{
  AVTimedMetadataGroupInternal *priv;
  AVTimedMetadataGroupInternal *v4;
  objc_super v5;

  priv = self->_priv;
  if (priv)
  {

    v4 = self->_priv;
    if (v4->backingSBuf)
    {
      CFRelease(v4->backingSBuf);
      v4 = self->_priv;
    }
    CFRelease(v4);
    priv = self->_priv;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVTimedMetadataGroup;
  -[AVTimedMetadataGroup dealloc](&v5, sel_dealloc);
}

- (AVTimedMetadataGroup)init
{
  uint64_t v3;
  __int128 v4;
  _OWORD v6[3];

  v3 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v6[0] = *MEMORY[0x1E0CA2E40];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  return -[AVTimedMetadataGroup initWithItems:timeRange:](self, "initWithItems:timeRange:", v3, v6);
}

- (AVTimedMetadataGroup)initWithSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
  AVTimedMetadataGroup *v3;
  __int128 v4;
  void *v6;
  CMBlockBufferRef DataBuffer;
  void *MetadataItemsFromSampleBuffer;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CMTimeRange v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  _BYTE duration[32];
  __int128 v22;
  __int128 v23;
  CMTimeRange start[2];
  uint64_t v25;

  v3 = self;
  v25 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&v15.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&v15.start.epoch = v4;
  *(_OWORD *)&v15.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  if (!sampleBuffer)
    goto LABEL_16;
  if (!self)
    return v3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  DataBuffer = CMSampleBufferGetDataBuffer(sampleBuffer);
  memset(&v19, 0, sizeof(v19));
  CMSampleBufferGetOutputPresentationTimeStamp(&v19, sampleBuffer);
  memset(&v18, 0, sizeof(v18));
  CMSampleBufferGetOutputDuration(&v18, sampleBuffer);
  if (DataBuffer)
  {
    MetadataItemsFromSampleBuffer = (void *)FigMetadataCreateMetadataItemsFromSampleBuffer();
    v17 = v19;
    v16 = v18;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    memset(duration, 0, sizeof(duration));
    v22 = 0u;
    v23 = 0u;
    v9 = objc_msgSend(MetadataItemsFromSampleBuffer, "countByEnumeratingWithState:objects:count:", duration, start, 16);
    if (v9)
    {
      v10 = v9;
      v11 = **(_QWORD **)&duration[16];
      do
      {
        v12 = 0;
        do
        {
          if (**(_QWORD **)&duration[16] != v11)
            objc_enumerationMutation(MetadataItemsFromSampleBuffer);
          v13 = (void *)objc_msgSend(+[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*(_QWORD *)&duration[8] + 8 * v12), *(_OWORD *)&v15.start.value, *(_OWORD *)&v15.start.epoch, *(_OWORD *)&v15.duration.timescale), "mutableCopy");
          v20 = v17;
          objc_msgSend(v13, "setTime:", &v20);
          v20 = v16;
          objc_msgSend(v13, "setDuration:", &v20);
          objc_msgSend(v6, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(MetadataItemsFromSampleBuffer, "countByEnumeratingWithState:objects:count:", duration, start, 16);
      }
      while (v10);
    }
    if (MetadataItemsFromSampleBuffer)
      CFRelease(MetadataItemsFromSampleBuffer);
  }
  start[0].start = v19;
  *(CMTime *)duration = v18;
  CMTimeRangeMake(&v15, &start[0].start, (CMTime *)duration);
  if (!DataBuffer)
  {
LABEL_16:

    return 0;
  }
  start[0] = v15;
  v3 = -[AVTimedMetadataGroup initWithItems:timeRange:](v3, "initWithItems:timeRange:", v6, start);
  if (v3)
    v3->_priv->backingSBuf = (opaqueCMSampleBuffer *)CFRetain(sampleBuffer);
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const __CFAllocator *v6;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (self)
    -[AVTimedMetadataGroup timeRange](self, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, timeRange=%@, items=%@>"), v5, self, (id)CMTimeRangeCopyDescription(v6, &range), -[AVTimedMetadataGroup items](self, "items"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  __int128 v7;
  NSArray *v8;
  uint64_t v9;
  int v10;
  CMTimeRange v12;
  CMTimeRange range1;
  CMTimeRange v14;
  CMTimeRange v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    v16 = v3;
    v17 = v4;
    if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = 0uLL;
      memset(&v15, 0, sizeof(v15));
      if (self)
      {
        -[AVTimedMetadataGroup timeRange](self, "timeRange");
        v7 = 0uLL;
      }
      *(_OWORD *)&v14.start.epoch = v7;
      *(_OWORD *)&v14.duration.timescale = v7;
      *(_OWORD *)&v14.start.value = v7;
      objc_msgSend(a3, "timeRange");
      v8 = -[AVTimedMetadataGroup items](self, "items");
      v9 = objc_msgSend(a3, "items");
      range1 = v15;
      v12 = v14;
      v10 = CMTimeRangeEqual(&range1, &v12);
      if (v10)
      {
        if (v8 == (NSArray *)v9)
          LOBYTE(v10) = 1;
        else
          LOBYTE(v10) = -[NSArray isEqual:](v8, "isEqual:", v9);
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  CMTimeEpoch v3;
  CMTimeEpoch v4;
  CMTime v6;
  __int128 v7;
  _OWORD v8[2];

  memset(v8, 0, sizeof(v8));
  v7 = 0u;
  if (self)
    -[AVTimedMetadataGroup timeRange](self, "timeRange");
  *(_OWORD *)&v6.value = v7;
  v6.epoch = *(_QWORD *)&v8[0];
  v3 = CMTimeHash(&v6);
  v6 = *(CMTime *)((char *)v8 + 8);
  v4 = CMTimeHash(&v6) ^ v3;
  return v4 ^ -[NSArray hash](-[AVTimedMetadataGroup items](self, "items"), "hash");
}

- (CMMetadataFormatDescriptionRef)copyFormatDescription
{
  opaqueCMSampleBuffer *backingSBuf;
  CMFormatDescriptionRef FormatDescription;
  CMMetadataFormatDescriptionRef result;
  objc_super v6;

  backingSBuf = self->_priv->backingSBuf;
  if (!backingSBuf
    || (FormatDescription = CMSampleBufferGetFormatDescription(backingSBuf)) == 0
    || (result = (CMMetadataFormatDescriptionRef)CFRetain(FormatDescription)) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVTimedMetadataGroup;
    return -[AVMetadataGroup copyFormatDescription](&v6, sel_copyFormatDescription);
  }
  return result;
}

- (opaqueCMSampleBuffer)_createSerializedRepresentationWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4
{
  opaqueCMSampleBuffer *backingSBuf;
  opaqueCMSampleBuffer *result;
  void *v9;
  const __CFAllocator *v10;
  signed int v11;
  char **v12;
  char **v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  signed int appended;
  const void *v24;
  uint64_t v25;
  OpaqueCMBlockBuffer *BlockBuffer;
  CFStringRef BaseDataTypeForConformingDataType;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  objc_class *v33;
  NSString *v34;
  uint64_t v35;
  uint64_t v36;
  objc_class *v37;
  NSString *v38;
  uint64_t v39;
  void *v40;
  objc_class *v41;
  uint64_t v42;
  uint64_t v43;
  size_t *sampleSizeArray;
  const __CFAllocator *v45;
  const char *v46;
  const char *aSelector;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  opaqueCMFormatDescription *formatDescription;
  id *v53;
  uint64_t v54;
  NSArray *obj;
  uint64_t v56;
  CMTime v57;
  __int128 v58;
  CMTimeEpoch v59;
  CMSampleTimingInfo sampleTimingArray;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CFTypeRef cf;
  CMSampleBufferRef v66;
  __int128 v67;
  size_t v68[3];
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  backingSBuf = self->_priv->backingSBuf;
  if (backingSBuf)
  {
    CMSampleBufferGetFormatDescription(backingSBuf);
    if (FigCFEqual())
    {
      result = self->_priv->backingSBuf;
      if (result)
        result = (opaqueCMSampleBuffer *)CFRetain(result);
      v9 = 0;
      goto LABEL_65;
    }
  }
  obj = -[AVTimedMetadataGroup items](self, "items");
  -[AVTimedMetadataGroup timeRange](self, "timeRange");
  cf = 0;
  v66 = 0;
  if (!a3)
  {
    v9 = 0;
LABEL_62:
    result = 0;
    goto LABEL_63;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = FigBoxedMetadataCreateForConstruction();
  if (v11)
    goto LABEL_41;
  formatDescription = a3;
  v53 = a4;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v54 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  v9 = 0;
  if (!v54)
    goto LABEL_39;
  v56 = *(_QWORD *)v62;
  v48 = *MEMORY[0x1E0CA23E8];
  v49 = *MEMORY[0x1E0C99778];
  v50 = *MEMORY[0x1E0CA2448];
  v51 = *MEMORY[0x1E0CA2428];
  v12 = &selRef_availableHDRModes;
  v13 = &selRef_externalProtectionStateChangedCallbackWithBoss_keySpecifier_;
  v45 = v10;
  while (2)
  {
    v14 = 0;
    v46 = v12[233];
    aSelector = v13[136];
    do
    {
      if (*(_QWORD *)v62 != v56)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v14);
      v69 = 0;
      v16 = FigBoxedMetadataGetFormatDescription();
      v17 = objc_msgSend(v15, "identifier");
      v18 = (__CFString *)objc_msgSend(v15, "_serializationDataType");
      v19 = objc_msgSend(v15, "extendedLanguageTag");
      v20 = objc_msgSend(v15, "value");
      if (!v17)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        v35 = objc_msgSend(v32, "stringWithFormat:", CFSTR("Metadata item %p has no identifier.  If the item was given a key and key space, use +[%@ %@] to check whether an identifier can be made from that key and key space"), v15, v34, NSStringFromSelector(aSelector));
LABEL_47:
        v36 = v35;
LABEL_49:
        v39 = AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v49, v36, 0));
        a4 = v53;
        goto LABEL_50;
      }
      if (!v18)
      {
        v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metadata item %p has no data type"), v15, v43, sampleSizeArray);
        goto LABEL_47;
      }
      v21 = (void *)v20;
      if (!v20)
      {
        v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metadata item %p has no value"), v15, v43, sampleSizeArray);
        goto LABEL_47;
      }
      if (!FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors())
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No entry in format description %p for metadata item %p with identifier %@, data type %@ and extended language tag %@.  If you created this format description using -[%@ %@], make sure the instance of %@ used to create the format description contains a representative sample of metadata items which includes an item with the same combination of identifier, dataType, and extended language tag as this one"), v16, v15, v17, v18, v19, v38, NSStringFromSelector(v46), v38);
        goto LABEL_49;
      }
      *(_OWORD *)v68 = *MEMORY[0x1E0C9D538];
      v22 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0C9D648];
      *(_OWORD *)&sampleTimingArray.duration.epoch = v22;
      v67 = *MEMORY[0x1E0C9D820];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && AVCGPointFromNSValue(v21, v68))
      {
        if (!-[__CFString isEqualToString:](v18, "isEqualToString:", v51))
          goto LABEL_59;
        appended = FigBoxedMetadataAppendCGPoint();
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && AVCGRectFromNSValue(v21, &sampleTimingArray))
      {
        if (!-[__CFString isEqualToString:](v18, "isEqualToString:", v50))
          goto LABEL_59;
        appended = FigBoxedMetadataAppendCGRect();
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && AVCGSizeFromNSValue(v21, &v67))
      {
        if (-[__CFString isEqualToString:](v18, "isEqualToString:", v48))
        {
          appended = FigBoxedMetadataAppendCGSize();
LABEL_29:
          v24 = 0;
          goto LABEL_32;
        }
LABEL_59:
        v40 = (void *)MEMORY[0x1E0CB3940];
        v41 = (objc_class *)objc_opt_class();
        v42 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v49, objc_msgSend(v40, "stringWithFormat:", CFSTR("Value \"%@\" of class %@ in metadata item %p is not compatible with base data type %@"), v21, NSStringFromClass(v41), v15, v18), 0);
        v39 = AVErrorForClientProgrammingError(v42);
        v69 = (void *)v39;
LABEL_50:
        if (v39)
          v9 = (void *)v39;
        goto LABEL_52;
      }
      v25 = objc_msgSend(v15, "_copyValueAsCFTypeWithFormatDescription:error:", v16, &v69);
      if (!v25)
      {
        v39 = (uint64_t)v69;
        goto LABEL_50;
      }
      v24 = (const void *)v25;
      appended = FigBoxedMetadataAppendCFTypedValue();
LABEL_32:
      if (appended)
      {
        if (appended == -16328)
        {
          BaseDataTypeForConformingDataType = CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType(v18);
          v28 = (void *)MEMORY[0x1E0CB3940];
          v29 = (objc_class *)objc_opt_class();
          v30 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v49, objc_msgSend(v28, "stringWithFormat:", CFSTR("Value \"%@\" of class %@ in metadata item %p is not compatible with base data type %@"), v21, NSStringFromClass(v29), v15, BaseDataTypeForConformingDataType), 0);
          v31 = AVErrorForClientProgrammingError(v30);
        }
        else
        {
          v31 = AVLocalizedErrorWithUnderlyingOSStatus(appended, 0);
        }
        a4 = v53;
        v69 = (void *)v31;
        if (v31)
          v9 = (void *)v31;
        if (v24)
          CFRelease(v24);
        goto LABEL_52;
      }
      if (v69)
        v9 = v69;
      if (v24)
        CFRelease(v24);
      ++v14;
    }
    while (v54 != v14);
    v10 = v45;
    v54 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    v12 = &selRef_availableHDRModes;
    v13 = &selRef_externalProtectionStateChangedCallbackWithBoss_keySpecifier_;
    if (v54)
      continue;
    break;
  }
LABEL_39:
  v11 = FigBoxedMetadataEndConstruction();
  if (v11
    || (BlockBuffer = (OpaqueCMBlockBuffer *)FigBoxedMetadataGetBlockBuffer(),
        *(_OWORD *)&sampleTimingArray.duration.value = v58,
        sampleTimingArray.duration.epoch = v59,
        sampleTimingArray.presentationTimeStamp = v57,
        sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18],
        v68[0] = CMBlockBufferGetDataLength(BlockBuffer),
        (v11 = CMSampleBufferCreate(v10, BlockBuffer, 1u, 0, 0, formatDescription, 1, 1, &sampleTimingArray, 1, v68, &v66)) != 0))
  {
LABEL_41:
    v9 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v11, 0);
  }
LABEL_52:
  result = v66;
  if (!v66)
    goto LABEL_62;
  v9 = 0;
LABEL_63:
  if (cf)
  {
    CFRelease(cf);
    result = v66;
  }
LABEL_65:
  if (a4)
  {
    if (!result)
      *a4 = v9;
  }
  return result;
}

@end
