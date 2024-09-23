@implementation AVCaptureSynchronizedDataCollection

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  AVCaptureSynchronizedDataCollectionInternal *internal;
  uint64_t v4;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    if (internal->count >= 1)
    {
      v4 = 0;
      do
      {

        internal = self->_internal;
      }
      while (v4 < internal->count);
    }
    free(internal->dataOutputs);
    free(self->_internal->synchronizedData);

  }
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureSynchronizedDataCollection;
  -[AVCaptureSynchronizedDataCollection dealloc](&v5, sel_dealloc);
}

- (AVCaptureSynchronizedData)objectForKeyedSubscript:(AVCaptureOutput *)key
{
  AVCaptureSynchronizedDataCollectionInternal *internal;
  uint64_t v4;

  internal = self->_internal;
  if (internal->count < 1)
    return 0;
  v4 = 0;
  while (internal->dataOutputs[v4] != key)
  {
    if (internal->count == ++v4)
      return 0;
  }
  return (AVCaptureSynchronizedData *)internal->synchronizedData[v4];
}

- (NSUInteger)count
{
  return self->_internal->count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  id *dataOutputs;

  var0 = a3->var0;
  a3->var2 = &self->_internal->changeSeed;
  if (var0)
    return 0;
  dataOutputs = self->_internal->dataOutputs;
  a3->var0 = 1;
  a3->var1 = dataOutputs;
  return self->_internal->count;
}

- (id)debugDescription
{
  CMTimeFlags flags;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  AVCaptureSynchronizedData *v10;
  CMTimeEpoch epoch;
  NSArray *obj;
  CMTime rhs;
  CMTime time;
  CMTime lhs;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("{ "));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_internal->possibleDataOutputs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = -[AVCaptureSynchronizedDataCollection objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v9);
        objc_msgSend(v4, "appendFormat:", CFSTR("%@"), +[AVCaptureSynchronizedDataCollection _shortStringForDataOutput:syncedData:](AVCaptureSynchronizedDataCollection, "_shortStringForDataOutput:syncedData:", v9, v10));
        if (v10)
        {
          -[AVCaptureSynchronizedData timestamp](v10, "timestamp");
          objc_msgSend(v4, "appendFormat:", CFSTR(" %*lld, "), 15, v17);
          if ((flags & 1) == 0)
          {
            -[AVCaptureSynchronizedData timestamp](v10, "timestamp");
            value = lhs.value;
            flags = lhs.flags;
            timescale = lhs.timescale;
            epoch = lhs.epoch;
          }
        }
        else
        {
          objc_msgSend(v4, "appendString:", CFSTR("                , "));
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  lhs = (CMTime)self->_internal->creationTime;
  rhs.value = value;
  rhs.timescale = timescale;
  rhs.flags = flags;
  rhs.epoch = epoch;
  CMTimeSubtract(&time, &lhs, &rhs);
  objc_msgSend(v4, "appendFormat:", CFSTR("} (Latency:%f)"), CMTimeGetSeconds(&time));
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureSynchronizedDataCollection debugDescription](self, "debugDescription"));
}

- (id)_initWithPossibleDataOutputs:(id)a3
{
  AVCaptureSynchronizedDataCollection *v4;
  AVCaptureSynchronizedDataCollectionInternal *v5;
  AVCaptureSynchronizedDataCollectionInternal *v6;
  OpaqueCMClock *HostTimeClock;
  AVCaptureSynchronizedDataCollectionInternal *internal;
  CMTime v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVCaptureSynchronizedDataCollection;
  v4 = -[AVCaptureSynchronizedDataCollection init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptureSynchronizedDataCollectionInternal);
    v4->_internal = v5;
    if (v5)
    {
      v6 = v5;
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&v10, HostTimeClock);
      v6->creationTime = ($95D729B680665BEAEFA1D6FCA8238556)v10;
      v4->_internal->possibleDataOutputs = (NSArray *)a3;
      v4->_internal->maxCount = objc_msgSend(a3, "count");
      internal = v4->_internal;
      if (internal->maxCount)
      {
        v4->_internal->dataOutputs = (id *)malloc_type_calloc(internal->maxCount, 8uLL, 0x80040B8603338uLL);
        v4->_internal->synchronizedData = (id *)malloc_type_calloc(v4->_internal->maxCount, 8uLL, 0x80040B8603338uLL);
      }
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)_setSynchronizedData:(id)a3 forCaptureOutput:(id)a4
{
  AVCaptureSynchronizedDataCollectionInternal *internal;
  uint64_t count;
  uint64_t v8;
  void *v9;

  ++self->_internal->changeSeed;
  internal = self->_internal;
  count = internal->count;
  if (internal->count < 1)
  {
LABEL_5:
    if (internal->maxCount <= (char)count)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v9);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
    }
    else
    {
      self->_internal->dataOutputs[self->_internal->count] = a4;
      self->_internal->synchronizedData[self->_internal->count++] = a3;
    }
  }
  else
  {
    v8 = 0;
    while (internal->dataOutputs[v8] != a4)
    {
      if (count == ++v8)
        goto LABEL_5;
    }

    self->_internal->synchronizedData[v8] = a3;
  }
}

+ (id)_shortStringForDataOutput:(id)a3 syncedData:(id)a4
{
  void *v6;
  const char *v7;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      if (objc_msgSend(a4, "sampleBufferWasDropped"))
        v7 = "!";
      else
        v7 = " ";
      return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("VDO[%s%@]:"), v7, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason")));
    }
    else
    {
      return CFSTR("VDO[--]:");
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a4)
        return CFSTR("ADO[  ]:");
      else
        return CFSTR("ADO[--]:");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
          return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MDO[%@]:"), objc_msgSend(a1, "_shortStringForMetadataObjects:", objc_msgSend(a4, "metadataObjects")), v17);
        else
          return CFSTR("MDO[--]:");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (a4)
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            if (objc_msgSend(a4, "depthDataWasDropped"))
              v10 = "!";
            else
              v10 = " ";
            return (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("DDO[%s%@]:"), v10, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason")));
          }
          else
          {
            return CFSTR("DDO[--]:");
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (a4)
            {
              v11 = (void *)MEMORY[0x1E0CB3940];
              if (objc_msgSend(a4, "visionDataWasDropped"))
                v12 = "!";
              else
                v12 = " ";
              return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("VSNDO[%s%@]:"), v12, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason")));
            }
            else
            {
              return CFSTR("VSNDO[--]:");
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (a4)
              {
                v13 = (void *)MEMORY[0x1E0CB3940];
                if (objc_msgSend(a4, "pointCloudDataWasDropped"))
                  v14 = "!";
                else
                  v14 = " ";
                return (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("PDO[%s%@]:"), v14, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason")));
              }
              else
              {
                return CFSTR("PDO[--]:");
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (a4)
                {
                  v15 = (void *)MEMORY[0x1E0CB3940];
                  if (objc_msgSend(a4, "cameraCalibrationDataWasDropped"))
                    v16 = "!";
                  else
                    v16 = " ";
                  return (id)objc_msgSend(v15, "stringWithFormat:", CFSTR("CCDO[%s%@]:"), v16, objc_msgSend(a1, "_shortStringForDataDroppedReason:", objc_msgSend(a4, "droppedReason")));
                }
                else
                {
                  return CFSTR("CCDO[--]:");
                }
              }
              else
              {
                return CFSTR("???[--]:");
              }
            }
          }
        }
      }
    }
  }
}

+ (id)_shortStringForDataDroppedReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR(" ");
  else
    return off_1E4217138[a3 - 1];
}

+ (id)_shortStringForMetadataObjects:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v12 = CFSTR("dogHead");
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = (__CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "type", v12);
        if (v9 == CFSTR("face"))
        {
          v10 = CFSTR("FA_");
        }
        else if (v9 == CFSTR("humanBody"))
        {
          v10 = CFSTR("HB_");
        }
        else if (v9 == CFSTR("humanFullBody"))
        {
          v10 = CFSTR("HFB_");
        }
        else if (v9 == CFSTR("catBody"))
        {
          v10 = CFSTR("CB_");
        }
        else if (v9 == CFSTR("dogBody"))
        {
          v10 = CFSTR("DB_");
        }
        else if (v9 == CFSTR("salientObject"))
        {
          v10 = CFSTR("SO_");
        }
        else if (v9 == CFSTR("org.gs1.UPC-E"))
        {
          v10 = CFSTR("UE_");
        }
        else if (v9 == CFSTR("org.iso.Code39"))
        {
          v10 = CFSTR("39_");
        }
        else if (v9 == CFSTR("org.iso.Code39Mod43"))
        {
          v10 = CFSTR("43_");
        }
        else if (v9 == CFSTR("org.gs1.EAN-13"))
        {
          v10 = CFSTR("13_");
        }
        else if (v9 == CFSTR("org.gs1.EAN-8"))
        {
          v10 = CFSTR("E8_");
        }
        else if (v9 == CFSTR("com.intermec.Code93"))
        {
          v10 = CFSTR("93_");
        }
        else if (v9 == CFSTR("org.iso.Code128"))
        {
          v10 = CFSTR("80_");
        }
        else if (v9 == CFSTR("org.iso.PDF417"))
        {
          v10 = CFSTR("PD_");
        }
        else if (v9 == CFSTR("org.iso.QRCode"))
        {
          v10 = CFSTR("QR_");
        }
        else if (v9 == CFSTR("org.iso.Aztec"))
        {
          v10 = CFSTR("AZ_");
        }
        else if (v9 == CFSTR("org.ansi.Interleaved2of5"))
        {
          v10 = CFSTR("25_");
        }
        else if (v9 == CFSTR("org.gs1.ITF14"))
        {
          v10 = CFSTR("IT_");
        }
        else if (v9 == CFSTR("org.iso.DataMatrix"))
        {
          v10 = CFSTR("DM_");
        }
        else if (v9 == CFSTR("Codabar"))
        {
          v10 = CFSTR("CD_");
        }
        else if (v9 == CFSTR("org.gs1.GS1DataBar"))
        {
          v10 = CFSTR("DC_");
        }
        else if (v9 == CFSTR("org.gs1.GS1DataBarExpanded"))
        {
          v10 = CFSTR("DE_");
        }
        else if (v9 == CFSTR("org.gs1.GS1DataBarLimited"))
        {
          v10 = CFSTR("DL_");
        }
        else if (v9 == CFSTR("org.iso.MicroQR"))
        {
          v10 = CFSTR("MQ_");
        }
        else if (v9 == CFSTR("org.iso.MicroPDF417"))
        {
          v10 = CFSTR("MP_");
        }
        else if (v9 == CFSTR("trackedFaces"))
        {
          v10 = CFSTR("TF_");
        }
        else if (v9 == CFSTR("offlineVideoStabilizationMotion"))
        {
          v10 = CFSTR("VS_");
        }
        else if (v9 == CFSTR("saliencyHeatMap"))
        {
          v10 = CFSTR("SH_");
        }
        else if (v9 == CFSTR("videoPreviewHistogram"))
        {
          v10 = CFSTR("VP_");
        }
        else if (v9 == CFSTR("com.apple.AppClipCode"))
        {
          v10 = CFSTR("AC_");
        }
        else if (v9 == CFSTR("textRegion"))
        {
          v10 = CFSTR("TR_");
        }
        else if (v9 == CFSTR("humanHead"))
        {
          v10 = CFSTR("HH_");
        }
        else if (v9 == CFSTR("catHead"))
        {
          v10 = CFSTR("CH_");
        }
        else if (v9 == v12)
        {
          v10 = CFSTR("DH_");
        }
        else
        {
          v10 = CFSTR("??_");
        }
        objc_msgSend(v4, "appendString:", v10);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("_")))
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  else
    objc_msgSend(v4, "appendString:", CFSTR("__"));
  return v4;
}

@end
