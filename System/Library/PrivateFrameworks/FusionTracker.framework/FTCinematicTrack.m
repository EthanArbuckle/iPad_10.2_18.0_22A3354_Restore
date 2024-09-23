@implementation FTCinematicTrack

- (FTCinematicTrack)init
{
  FTCinematicTrack *v2;
  FTCinematicTrack *v3;
  FTCinematicTrack *v4;
  __int128 v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FTCinematicTrack;
  v2 = -[FTCinematicTrack init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v6 = *MEMORY[0x24BDC0D40];
    v7 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    -[FTCinematicTrack setLastTappedTime:](v2, "setLastTappedTime:", &v6);
    v4 = v3;
  }

  return v3;
}

- (FTCinematicTrack)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FTCinematicTrack;
  v5 = -[FTCinematicTrack init](&v23, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 3) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("identifier"));
    objc_msgSend(v4, "fusionTracker_decodeCGRectForKey:", CFSTR("box"));
    *((_QWORD *)v5 + 13) = v6;
    *((_QWORD *)v5 + 14) = v7;
    *((_QWORD *)v5 + 15) = v8;
    *((_QWORD *)v5 + 16) = v9;
    *((_QWORD *)v5 + 4) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("objectKind"));
    if (v4)
    {
      objc_msgSend(v4, "fusionTracker_decodeCMTimeForKey:", CFSTR("lastDetectionTime"));
    }
    else
    {
      v19 = 0uLL;
      v21 = 0;
    }
    *(_OWORD *)(v5 + 56) = v19;
    *((_QWORD *)v5 + 9) = v21;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boxConfidence"), v19, v21);
    *((_DWORD *)v5 + 3) = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("detectionConfidence"));
    *((_DWORD *)v5 + 4) = v11;
    if (v4)
    {
      objc_msgSend(v4, "fusionTracker_decodeCMTimeForKey:", CFSTR("lastTappedTime"));
    }
    else
    {
      v20 = 0uLL;
      v22 = 0;
    }
    *((_OWORD *)v5 + 5) = v20;
    *((_QWORD *)v5 + 12) = v22;
    v5[9] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHighPriority"), v20, v22);
    *((_QWORD *)v5 + 6) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceObservationId"));
    v5[8] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTapSpawned"));
    v12 = (void *)MEMORY[0x24BDBCF20];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("metadata"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v15;

    v17 = v5;
  }

  return (FTCinematicTrack *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  $95D729B680665BEAEFA1D6FCA8238556 lastTappedTime;
  $95D729B680665BEAEFA1D6FCA8238556 lastDetectionTime;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_objectKind, CFSTR("objectKind"));
  lastDetectionTime = self->_lastDetectionTime;
  objc_msgSend(v4, "fusionTracker_encodeCMTime:forKey:", &lastDetectionTime, CFSTR("lastDetectionTime"));
  *(float *)&v5 = self->_boxConfidence;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("boxConfidence"), v5);
  *(float *)&v6 = self->_detectionConfidence;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("detectionConfidence"), v6);
  lastTappedTime = self->_lastTappedTime;
  objc_msgSend(v4, "fusionTracker_encodeCMTime:forKey:", &lastTappedTime, CFSTR("lastTappedTime"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isHighPriority, CFSTR("isHighPriority"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_sourceObservationId, CFSTR("sourceObservationId"));
  objc_msgSend(v4, "fusionTracker_encodeCGRect:forKey:", CFSTR("box"), self->_box.origin.x, self->_box.origin.y, self->_box.size.width, self->_box.size.height);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTapSpawned, CFSTR("isTapSpawned"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromTrack:(shared_ptr<ft:(BOOL)a4 :Track>)a3 isHighPriority:
{
  __shared_weak_count *var1;
  Track *var0;
  FTCinematicTrack *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t *v11;
  std::runtime_error *exception;
  std::runtime_error *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = objc_alloc_init(FTCinematicTrack);
  -[FTCinematicTrack setIdentifier:](v6, "setIdentifier:", *(_QWORD *)(*(_QWORD *)var0 + 16));
  -[FTCinematicTrack setBox:](v6, "setBox:", *(double *)(*(_QWORD *)var0 + 24), *(double *)(*(_QWORD *)var0 + 32), *(double *)(*(_QWORD *)var0 + 40), *(double *)(*(_QWORD *)var0 + 48));
  -[FTCinematicTrack setObjectKind:](v6, "setObjectKind:", *(_QWORD *)(*(_QWORD *)var0 + 88));
  v7 = *(_QWORD *)var0;
  if (!*(_BYTE *)(*(_QWORD *)var0 + 232))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Track not yet initialized.");
    goto LABEL_10;
  }
  v17 = *(_OWORD *)(v7 + 124);
  v18 = *(_QWORD *)(v7 + 140);
  -[FTCinematicTrack setLastDetectionTime:](v6, "setLastDetectionTime:", &v17);
  v8 = *(double *)(*(_QWORD *)var0 + 248);
  *(float *)&v8 = v8;
  -[FTCinematicTrack setBoxConfidence:](v6, "setBoxConfidence:", v8);
  if (!*(_BYTE *)(*(_QWORD *)var0 + 232))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Track not yet initialized.");
LABEL_10:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  LODWORD(v9) = *(_DWORD *)(*(_QWORD *)var0 + 96);
  -[FTCinematicTrack setDetectionConfidence:](v6, "setDetectionConfidence:", v9);
  v15 = *MEMORY[0x24BDC0D40];
  v16 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  -[FTCinematicTrack setLastTappedTime:](v6, "setLastTappedTime:", &v15);
  -[FTCinematicTrack setIsHighPriority:](v6, "setIsHighPriority:", var1);
  v10 = *(_QWORD *)var0;
  if (!*(_BYTE *)(*(_QWORD *)var0 + 232))
  {
    v14 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v14, "Track not yet initialized.");
    __cxa_throw(v14, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (*(_BYTE *)(v10 + 160))
    v11 = (uint64_t *)(v10 + 152);
  else
    v11 = &kFTInvalidTrackId;
  -[FTCinematicTrack setSourceObservationId:](v6, "setSourceObservationId:", *v11);
  return v6;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGRect)box
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_box.origin.x;
  y = self->_box.origin.y;
  width = self->_box.size.width;
  height = self->_box.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBox:(CGRect)a3
{
  self->_box = a3;
}

- (unint64_t)objectKind
{
  return self->_objectKind;
}

- (void)setObjectKind:(unint64_t)a3
{
  self->_objectKind = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setLastDetectionTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastDetectionTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastDetectionTime.value = v3;
}

- (float)boxConfidence
{
  return self->_boxConfidence;
}

- (void)setBoxConfidence:(float)a3
{
  self->_boxConfidence = a3;
}

- (float)detectionConfidence
{
  return self->_detectionConfidence;
}

- (void)setDetectionConfidence:(float)a3
{
  self->_detectionConfidence = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTappedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setLastTappedTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastTappedTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastTappedTime.value = v3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BOOL)isTapSpawned
{
  return self->_isTapSpawned;
}

- (void)setIsTapSpawned:(BOOL)a3
{
  self->_isTapSpawned = a3;
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (void)setIsHighPriority:(BOOL)a3
{
  self->_isHighPriority = a3;
}

- (unint64_t)sourceObservationId
{
  return self->_sourceObservationId;
}

- (void)setSourceObservationId:(unint64_t)a3
{
  self->_sourceObservationId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
