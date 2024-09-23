@implementation GEOVLFFrameDetails

- (GEOVLFFrameDetails)init
{
  GEOVLFFrameDetails *v2;
  GEOVLFFrameDetails *v3;
  GEOVLFFrameDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLFFrameDetails;
  v2 = -[GEOVLFFrameDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFFrameDetails)initWithData:(id)a3
{
  GEOVLFFrameDetails *v3;
  GEOVLFFrameDetails *v4;
  GEOVLFFrameDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLFFrameDetails;
  v3 = -[GEOVLFFrameDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLFFrameDetails;
  -[GEOVLFFrameDetails dealloc](&v3, sel_dealloc);
}

- (unsigned)vioStatus
{
  return self->_vioStatus;
}

- (void)setVioStatus:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  self->_vioStatus = a3;
}

- (void)setHasVioStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8320;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasVioStatus
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readVioPoses
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVioPoses_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)vioPosesCount
{
  -[GEOVLFFrameDetails _readVioPoses]((uint64_t)self);
  return self->_vioPoses.count;
}

- (float)vioPoses
{
  -[GEOVLFFrameDetails _readVioPoses]((uint64_t)self);
  return self->_vioPoses.list;
}

- (void)clearVioPoses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedFloatClear();
}

- (void)addVioPose:(float)a3
{
  -[GEOVLFFrameDetails _readVioPoses]((uint64_t)self);
  if (self)
    PBRepeatedFloatAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (float)vioPoseAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_vioPoses;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFFrameDetails _readVioPoses]((uint64_t)self);
  p_vioPoses = &self->_vioPoses;
  count = self->_vioPoses.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_vioPoses->list[a3];
}

- (void)setVioPoses:(float *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedFloatSet();
}

- (void)_readCalibrationMatrixs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCalibrationMatrixs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)calibrationMatrixsCount
{
  -[GEOVLFFrameDetails _readCalibrationMatrixs]((uint64_t)self);
  return self->_calibrationMatrixs.count;
}

- (float)calibrationMatrixs
{
  -[GEOVLFFrameDetails _readCalibrationMatrixs]((uint64_t)self);
  return self->_calibrationMatrixs.list;
}

- (void)clearCalibrationMatrixs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedFloatClear();
}

- (void)addCalibrationMatrix:(float)a3
{
  -[GEOVLFFrameDetails _readCalibrationMatrixs]((uint64_t)self);
  if (self)
    PBRepeatedFloatAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (float)calibrationMatrixAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_calibrationMatrixs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFFrameDetails _readCalibrationMatrixs]((uint64_t)self);
  p_calibrationMatrixs = &self->_calibrationMatrixs;
  count = self->_calibrationMatrixs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_calibrationMatrixs->list[a3];
}

- (void)setCalibrationMatrixs:(float *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedFloatSet();
}

- (float)radialDistortion1
{
  return self->_radialDistortion1;
}

- (void)setRadialDistortion1:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_radialDistortion1 = a3;
}

- (void)setHasRadialDistortion1:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8208;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasRadialDistortion1
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (float)radialDistortion2
{
  return self->_radialDistortion2;
}

- (void)setRadialDistortion2:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_radialDistortion2 = a3;
}

- (void)setHasRadialDistortion2:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8224;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRadialDistortion2
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8200;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readSlamPoses
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSlamPoses_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)slamPosesCount
{
  -[GEOVLFFrameDetails _readSlamPoses]((uint64_t)self);
  return self->_slamPoses.count;
}

- (float)slamPoses
{
  -[GEOVLFFrameDetails _readSlamPoses]((uint64_t)self);
  return self->_slamPoses.list;
}

- (void)clearSlamPoses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedFloatClear();
}

- (void)addSlamPose:(float)a3
{
  -[GEOVLFFrameDetails _readSlamPoses]((uint64_t)self);
  if (self)
    PBRepeatedFloatAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (float)slamPoseAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_slamPoses;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFFrameDetails _readSlamPoses]((uint64_t)self);
  p_slamPoses = &self->_slamPoses;
  count = self->_slamPoses.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_slamPoses->list[a3];
}

- (void)setSlamPoses:(float *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedFloatSet();
}

- (void)_readTileId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTileId
{
  -[GEOVLFFrameDetails _readTileId]((uint64_t)self);
  return self->_tileId != 0;
}

- (GEOVLFUsageTileID)tileId
{
  -[GEOVLFFrameDetails _readTileId]((uint64_t)self);
  return self->_tileId;
}

- (void)setTileId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_tileId, a3);
}

- (void)_readResultPoseRotations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultPoseRotations_tags_9647);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)resultPoseRotationsCount
{
  -[GEOVLFFrameDetails _readResultPoseRotations]((uint64_t)self);
  return self->_resultPoseRotations.count;
}

- (double)resultPoseRotations
{
  -[GEOVLFFrameDetails _readResultPoseRotations]((uint64_t)self);
  return self->_resultPoseRotations.list;
}

- (void)clearResultPoseRotations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedDoubleClear();
}

- (void)addResultPoseRotation:(double)a3
{
  -[GEOVLFFrameDetails _readResultPoseRotations]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (double)resultPoseRotationAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_resultPoseRotations;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFFrameDetails _readResultPoseRotations]((uint64_t)self);
  p_resultPoseRotations = &self->_resultPoseRotations;
  count = self->_resultPoseRotations.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_resultPoseRotations->list[a3];
}

- (void)setResultPoseRotations:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedDoubleSet();
}

- (double)resultTranslationX
{
  return self->_resultTranslationX;
}

- (void)setResultTranslationX:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_resultTranslationX = a3;
}

- (void)setHasResultTranslationX:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasResultTranslationX
{
  return *(_WORD *)&self->_flags & 1;
}

- (double)resultTranslationY
{
  return self->_resultTranslationY;
}

- (void)setResultTranslationY:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_resultTranslationY = a3;
}

- (void)setHasResultTranslationY:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasResultTranslationY
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)resultTranslationZ
{
  return self->_resultTranslationZ;
}

- (void)setResultTranslationZ:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_resultTranslationZ = a3;
}

- (void)setHasResultTranslationZ:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8196;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasResultTranslationZ
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (int)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_resultStatus = a3;
}

- (void)setHasResultStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8256;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasResultStatus
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFFrameDetails;
  -[GEOVLFFrameDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFFrameDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFFrameDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 180) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 176));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("vioStatus");
    else
      v7 = CFSTR("vio_status");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  if (*(_QWORD *)(a1 + 96))
  {
    PBRepeatedFloatNSArray();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("vioPose");
    else
      v9 = CFSTR("vio_pose");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedFloatNSArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("calibrationMatrix");
    else
      v11 = CFSTR("calibration_matrix");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(_WORD *)(a1 + 180);
  if ((v12 & 0x10) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 164);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("radialDistortion1");
    else
      v21 = CFSTR("radial_distortion_1");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

    v12 = *(_WORD *)(a1 + 180);
    if ((v12 & 0x20) == 0)
    {
LABEL_19:
      if ((v12 & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_19;
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 168);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("radialDistortion2");
  else
    v23 = CFSTR("radial_distortion_2");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  if ((*(_WORD *)(a1 + 180) & 8) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 144));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timestamp"));

  }
LABEL_21:
  if (*(_QWORD *)(a1 + 72))
  {
    PBRepeatedFloatNSArray();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("slamPose");
    else
      v15 = CFSTR("slam_pose");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "tileId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("tileId");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("tile_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    PBRepeatedDoubleNSArray();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("resultPoseRotation");
    else
      v25 = CFSTR("result_pose_rotation");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  v26 = *(_WORD *)(a1 + 180);
  if ((v26 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 112));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("resultTranslationX");
    else
      v28 = CFSTR("result_translation_x");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v26 = *(_WORD *)(a1 + 180);
    if ((v26 & 2) == 0)
    {
LABEL_47:
      if ((v26 & 4) == 0)
        goto LABEL_48;
      goto LABEL_58;
    }
  }
  else if ((v26 & 2) == 0)
  {
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 120));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v30 = CFSTR("resultTranslationY");
  else
    v30 = CFSTR("result_translation_y");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  v26 = *(_WORD *)(a1 + 180);
  if ((v26 & 4) == 0)
  {
LABEL_48:
    if ((v26 & 0x40) == 0)
      return v4;
    goto LABEL_62;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 128));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v32 = CFSTR("resultTranslationZ");
  else
    v32 = CFSTR("result_translation_z");
  objc_msgSend(v4, "setObject:forKey:", v31, v32);

  if ((*(_WORD *)(a1 + 180) & 0x40) != 0)
  {
LABEL_62:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 172));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v34 = CFSTR("resultStatus");
    else
      v34 = CFSTR("result_status");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFFrameDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFFrameDetails)initWithDictionary:(id)a3
{
  return (GEOVLFFrameDetails *)-[GEOVLFFrameDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  const __CFString *v37;
  void *v38;
  GEOVLFUsageTileID *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("vioStatus");
      else
        v6 = CFSTR("vio_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setVioStatus:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("vioPose");
      else
        v8 = CFSTR("vio_pose");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v72 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "floatValue");
                objc_msgSend(a1, "addVioPose:");
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
          }
          while (v12);
        }

      }
      if (a3)
        v16 = CFSTR("calibrationMatrix");
      else
        v16 = CFSTR("calibration_matrix");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v68;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v68 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v23, "floatValue");
                objc_msgSend(a1, "addCalibrationMatrix:");
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
          }
          while (v20);
        }

      }
      if (a3)
        v24 = CFSTR("radialDistortion1");
      else
        v24 = CFSTR("radial_distortion_1");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v25, "floatValue");
        objc_msgSend(a1, "setRadialDistortion1:");
      }

      if (a3)
        v26 = CFSTR("radialDistortion2");
      else
        v26 = CFSTR("radial_distortion_2");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v27, "floatValue");
        objc_msgSend(a1, "setRadialDistortion2:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v28, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

      if (a3)
        v29 = CFSTR("slamPose");
      else
        v29 = CFSTR("slam_pose");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v31 = v30;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v64;
          do
          {
            for (k = 0; k != v33; ++k)
            {
              if (*(_QWORD *)v64 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v36, "floatValue");
                objc_msgSend(a1, "addSlamPose:");
              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
          }
          while (v33);
        }

      }
      if (a3)
        v37 = CFSTR("tileId");
      else
        v37 = CFSTR("tile_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = [GEOVLFUsageTileID alloc];
        if ((a3 & 1) != 0)
          v40 = -[GEOVLFUsageTileID initWithJSON:](v39, "initWithJSON:", v38);
        else
          v40 = -[GEOVLFUsageTileID initWithDictionary:](v39, "initWithDictionary:", v38);
        v41 = (void *)v40;
        objc_msgSend(a1, "setTileId:", v40);

      }
      if (a3)
        v42 = CFSTR("resultPoseRotation");
      else
        v42 = CFSTR("result_pose_rotation");
      objc_msgSend(v5, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v44 = v43;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v60;
          do
          {
            for (m = 0; m != v46; ++m)
            {
              if (*(_QWORD *)v60 != v47)
                objc_enumerationMutation(v44);
              v49 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v49, "doubleValue", (_QWORD)v59);
                objc_msgSend(a1, "addResultPoseRotation:");
              }
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
          }
          while (v46);
        }

      }
      if (a3)
        v50 = CFSTR("resultTranslationX");
      else
        v50 = CFSTR("result_translation_x");
      objc_msgSend(v5, "objectForKeyedSubscript:", v50, (_QWORD)v59);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v51, "doubleValue");
        objc_msgSend(a1, "setResultTranslationX:");
      }

      if (a3)
        v52 = CFSTR("resultTranslationY");
      else
        v52 = CFSTR("result_translation_y");
      objc_msgSend(v5, "objectForKeyedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v53, "doubleValue");
        objc_msgSend(a1, "setResultTranslationY:");
      }

      if (a3)
        v54 = CFSTR("resultTranslationZ");
      else
        v54 = CFSTR("result_translation_z");
      objc_msgSend(v5, "objectForKeyedSubscript:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v55, "doubleValue");
        objc_msgSend(a1, "setResultTranslationZ:");
      }

      if (a3)
        v56 = CFSTR("resultStatus");
      else
        v56 = CFSTR("result_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setResultStatus:", objc_msgSend(v57, "intValue"));

    }
  }

  return a1;
}

- (GEOVLFFrameDetails)initWithJSON:(id)a3
{
  return (GEOVLFFrameDetails *)-[GEOVLFFrameDetails _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_9681;
    else
      v8 = (int *)&readAll__nonRecursiveTag_9682;
    GEOVLFFrameDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOVLFUsageTileID readAll:](self->_tileId, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFFrameDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFFrameDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  __int16 flags;
  unint64_t v9;
  unint64_t v10;
  __int16 v11;
  PBDataReader *v12;
  void *v13;
  id v14;

  v14 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3F00) == 0)
    {
      v12 = self->_reader;
      objc_sync_enter(v12);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "writeData:", v13);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_36;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVLFFrameDetails readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
    PBDataWriterWriteUint32Field();
  v5 = v14;
  if (self->_vioPoses.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v5 = v14;
      ++v6;
    }
    while (v6 < self->_vioPoses.count);
  }
  if (self->_calibrationMatrixs.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v5 = v14;
      ++v7;
    }
    while (v7 < self->_calibrationMatrixs.count);
  }
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    v5 = v14;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_13:
      if ((flags & 8) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteFloatField();
  v5 = v14;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_14:
    PBDataWriterWriteDoubleField();
    v5 = v14;
  }
LABEL_15:
  if (self->_slamPoses.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v5 = v14;
      ++v9;
    }
    while (v9 < self->_slamPoses.count);
  }
  if (self->_tileId)
  {
    PBDataWriterWriteSubmessage();
    v5 = v14;
  }
  if (self->_resultPoseRotations.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v5 = v14;
      ++v10;
    }
    while (v10 < self->_resultPoseRotations.count);
  }
  v11 = (__int16)self->_flags;
  if ((v11 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v5 = v14;
    v11 = (__int16)self->_flags;
    if ((v11 & 2) == 0)
    {
LABEL_25:
      if ((v11 & 4) == 0)
        goto LABEL_26;
      goto LABEL_33;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteDoubleField();
  v5 = v14;
  v11 = (__int16)self->_flags;
  if ((v11 & 4) == 0)
  {
LABEL_26:
    if ((v11 & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  v5 = v14;
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
LABEL_34:
    PBDataWriterWriteInt32Field();
LABEL_36:
    v5 = v14;
  }
LABEL_37:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  __int16 flags;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  __int16 v17;
  id *v18;

  v18 = (id *)a3;
  -[GEOVLFFrameDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 38) = self->_readerMarkPos;
  *((_DWORD *)v18 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v18 + 44) = self->_vioStatus;
    *((_WORD *)v18 + 90) |= 0x80u;
  }
  if (-[GEOVLFFrameDetails vioPosesCount](self, "vioPosesCount"))
  {
    objc_msgSend(v18, "clearVioPoses");
    v4 = -[GEOVLFFrameDetails vioPosesCount](self, "vioPosesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOVLFFrameDetails vioPoseAtIndex:](self, "vioPoseAtIndex:", i);
        objc_msgSend(v18, "addVioPose:");
      }
    }
  }
  if (-[GEOVLFFrameDetails calibrationMatrixsCount](self, "calibrationMatrixsCount"))
  {
    objc_msgSend(v18, "clearCalibrationMatrixs");
    v7 = -[GEOVLFFrameDetails calibrationMatrixsCount](self, "calibrationMatrixsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOVLFFrameDetails calibrationMatrixAtIndex:](self, "calibrationMatrixAtIndex:", j);
        objc_msgSend(v18, "addCalibrationMatrix:");
      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    if ((flags & 0x20) == 0)
      goto LABEL_13;
LABEL_32:
    *((_DWORD *)v18 + 42) = LODWORD(self->_radialDistortion2);
    *((_WORD *)v18 + 90) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *((_DWORD *)v18 + 41) = LODWORD(self->_radialDistortion1);
  *((_WORD *)v18 + 90) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_32;
LABEL_13:
  if ((flags & 8) != 0)
  {
LABEL_14:
    v18[18] = *(id *)&self->_timestamp;
    *((_WORD *)v18 + 90) |= 8u;
  }
LABEL_15:
  if (-[GEOVLFFrameDetails slamPosesCount](self, "slamPosesCount"))
  {
    objc_msgSend(v18, "clearSlamPoses");
    v11 = -[GEOVLFFrameDetails slamPosesCount](self, "slamPosesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEOVLFFrameDetails slamPoseAtIndex:](self, "slamPoseAtIndex:", k);
        objc_msgSend(v18, "addSlamPose:");
      }
    }
  }
  if (self->_tileId)
    objc_msgSend(v18, "setTileId:");
  if (-[GEOVLFFrameDetails resultPoseRotationsCount](self, "resultPoseRotationsCount"))
  {
    objc_msgSend(v18, "clearResultPoseRotations");
    v14 = -[GEOVLFFrameDetails resultPoseRotationsCount](self, "resultPoseRotationsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
      {
        -[GEOVLFFrameDetails resultPoseRotationAtIndex:](self, "resultPoseRotationAtIndex:", m);
        objc_msgSend(v18, "addResultPoseRotation:");
      }
    }
  }
  v17 = (__int16)self->_flags;
  if ((v17 & 1) != 0)
  {
    v18[14] = *(id *)&self->_resultTranslationX;
    *((_WORD *)v18 + 90) |= 1u;
    v17 = (__int16)self->_flags;
    if ((v17 & 2) == 0)
    {
LABEL_27:
      if ((v17 & 4) == 0)
        goto LABEL_28;
LABEL_36:
      v18[16] = *(id *)&self->_resultTranslationZ;
      *((_WORD *)v18 + 90) |= 4u;
      if ((*(_WORD *)&self->_flags & 0x40) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_27;
  }
  v18[15] = *(id *)&self->_resultTranslationY;
  *((_WORD *)v18 + 90) |= 2u;
  v17 = (__int16)self->_flags;
  if ((v17 & 4) != 0)
    goto LABEL_36;
LABEL_28:
  if ((v17 & 0x40) != 0)
  {
LABEL_29:
    *((_DWORD *)v18 + 43) = self->_resultStatus;
    *((_WORD *)v18 + 90) |= 0x40u;
  }
LABEL_30:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  id v10;
  void *v11;
  __int16 v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLFFrameDetails readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 0x80) != 0)
    {
      *(_DWORD *)(v5 + 176) = self->_vioStatus;
      *(_WORD *)(v5 + 180) |= 0x80u;
    }
    PBRepeatedFloatCopy();
    PBRepeatedFloatCopy();
    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(float *)(v5 + 164) = self->_radialDistortion1;
      *(_WORD *)(v5 + 180) |= 0x10u;
      flags = (__int16)self->_flags;
      if ((flags & 0x20) == 0)
      {
LABEL_9:
        if ((flags & 8) == 0)
          goto LABEL_11;
        goto LABEL_10;
      }
    }
    else if ((flags & 0x20) == 0)
    {
      goto LABEL_9;
    }
    *(float *)(v5 + 168) = self->_radialDistortion2;
    *(_WORD *)(v5 + 180) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
    {
LABEL_11:
      PBRepeatedFloatCopy();
      v10 = -[GEOVLFUsageTileID copyWithZone:](self->_tileId, "copyWithZone:", a3);
      v11 = *(void **)(v5 + 136);
      *(_QWORD *)(v5 + 136) = v10;

      PBRepeatedDoubleCopy();
      v12 = (__int16)self->_flags;
      if ((v12 & 1) != 0)
      {
        *(double *)(v5 + 112) = self->_resultTranslationX;
        *(_WORD *)(v5 + 180) |= 1u;
        v12 = (__int16)self->_flags;
        if ((v12 & 2) == 0)
        {
LABEL_13:
          if ((v12 & 4) == 0)
            goto LABEL_14;
          goto LABEL_22;
        }
      }
      else if ((v12 & 2) == 0)
      {
        goto LABEL_13;
      }
      *(double *)(v5 + 120) = self->_resultTranslationY;
      *(_WORD *)(v5 + 180) |= 2u;
      v12 = (__int16)self->_flags;
      if ((v12 & 4) == 0)
      {
LABEL_14:
        if ((v12 & 0x40) == 0)
          return (id)v5;
LABEL_15:
        *(_DWORD *)(v5 + 172) = self->_resultStatus;
        *(_WORD *)(v5 + 180) |= 0x40u;
        return (id)v5;
      }
LABEL_22:
      *(double *)(v5 + 128) = self->_resultTranslationZ;
      *(_WORD *)(v5 + 180) |= 4u;
      if ((*(_WORD *)&self->_flags & 0x40) == 0)
        return (id)v5;
      goto LABEL_15;
    }
LABEL_10:
    *(double *)(v5 + 144) = self->_timestamp;
    *(_WORD *)(v5 + 180) |= 8u;
    goto LABEL_11;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOVLFFrameDetailsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  __int16 flags;
  __int16 v7;
  GEOVLFUsageTileID *tileId;
  __int16 v9;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  -[GEOVLFFrameDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 90);
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
    if ((v5 & 0x80) == 0 || self->_vioStatus != *((_DWORD *)v4 + 44))
      goto LABEL_48;
  }
  else if ((v5 & 0x80) != 0)
  {
LABEL_48:
    v11 = 0;
    goto LABEL_49;
  }
  if (!PBRepeatedFloatIsEqual() || !PBRepeatedFloatIsEqual())
    goto LABEL_48;
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 90);
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_radialDistortion1 != *((float *)v4 + 41))
      goto LABEL_48;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_radialDistortion2 != *((float *)v4 + 42))
      goto LABEL_48;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timestamp != *((double *)v4 + 18))
      goto LABEL_48;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_48;
  }
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_48;
  tileId = self->_tileId;
  if ((unint64_t)tileId | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOVLFUsageTileID isEqual:](tileId, "isEqual:"))
      goto LABEL_48;
  }
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_48;
  v9 = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 90);
  if ((v9 & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_resultTranslationX != *((double *)v4 + 14))
      goto LABEL_48;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_48;
  }
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_resultTranslationY != *((double *)v4 + 15))
      goto LABEL_48;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_resultTranslationZ != *((double *)v4 + 16))
      goto LABEL_48;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_resultStatus != *((_DWORD *)v4 + 43))
      goto LABEL_48;
    v11 = 1;
  }
  else
  {
    v11 = (v10 & 0x40) == 0;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  float radialDistortion1;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float radialDistortion2;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double timestamp;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  double resultTranslationX;
  double v25;
  long double v26;
  double v27;
  unint64_t v28;
  double resultTranslationY;
  double v30;
  long double v31;
  double v32;
  unint64_t v33;
  double resultTranslationZ;
  double v35;
  long double v36;
  double v37;
  uint64_t v38;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  -[GEOVLFFrameDetails readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
    v43 = 2654435761 * self->_vioStatus;
  else
    v43 = 0;
  v42 = PBRepeatedFloatHash();
  v41 = PBRepeatedFloatHash();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    radialDistortion1 = self->_radialDistortion1;
    v6 = radialDistortion1;
    if (radialDistortion1 < 0.0)
      v6 = -radialDistortion1;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    radialDistortion2 = self->_radialDistortion2;
    v11 = radialDistortion2;
    if (radialDistortion2 < 0.0)
      v11 = -radialDistortion2;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v40 = v4;
  if ((flags & 8) != 0)
  {
    timestamp = self->_timestamp;
    v16 = -timestamp;
    if (timestamp >= 0.0)
      v16 = self->_timestamp;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v19 = PBRepeatedFloatHash();
  v20 = -[GEOVLFUsageTileID hash](self->_tileId, "hash");
  v21 = PBRepeatedDoubleHash();
  v22 = (__int16)self->_flags;
  if ((v22 & 1) != 0)
  {
    resultTranslationX = self->_resultTranslationX;
    v25 = -resultTranslationX;
    if (resultTranslationX >= 0.0)
      v25 = self->_resultTranslationX;
    v26 = floor(v25 + 0.5);
    v27 = (v25 - v26) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0)
        v23 += (unint64_t)v27;
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    v23 = 0;
  }
  if ((v22 & 2) != 0)
  {
    resultTranslationY = self->_resultTranslationY;
    v30 = -resultTranslationY;
    if (resultTranslationY >= 0.0)
      v30 = self->_resultTranslationY;
    v31 = floor(v30 + 0.5);
    v32 = (v30 - v31) * 1.84467441e19;
    v28 = 2654435761u * (unint64_t)fmod(v31, 1.84467441e19);
    if (v32 >= 0.0)
    {
      if (v32 > 0.0)
        v28 += (unint64_t)v32;
    }
    else
    {
      v28 -= (unint64_t)fabs(v32);
    }
  }
  else
  {
    v28 = 0;
  }
  if ((v22 & 4) != 0)
  {
    resultTranslationZ = self->_resultTranslationZ;
    v35 = -resultTranslationZ;
    if (resultTranslationZ >= 0.0)
      v35 = self->_resultTranslationZ;
    v36 = floor(v35 + 0.5);
    v37 = (v35 - v36) * 1.84467441e19;
    v33 = 2654435761u * (unint64_t)fmod(v36, 1.84467441e19);
    if (v37 >= 0.0)
    {
      if (v37 > 0.0)
        v33 += (unint64_t)v37;
    }
    else
    {
      v33 -= (unint64_t)fabs(v37);
    }
  }
  else
  {
    v33 = 0;
  }
  if ((v22 & 0x40) != 0)
    v38 = 2654435761 * self->_resultStatus;
  else
    v38 = 0;
  return v42 ^ v43 ^ v41 ^ v40 ^ v9 ^ v14 ^ v19 ^ v21 ^ v20 ^ v23 ^ v28 ^ v33 ^ v38;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  GEOVLFUsageTileID *tileId;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  __int16 v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "readAll:", 0);
  if ((*((_WORD *)v21 + 90) & 0x80) != 0)
  {
    self->_vioStatus = *((_DWORD *)v21 + 44);
    *(_WORD *)&self->_flags |= 0x80u;
  }
  v4 = objc_msgSend(v21, "vioPosesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v21, "vioPoseAtIndex:", i);
      -[GEOVLFFrameDetails addVioPose:](self, "addVioPose:");
    }
  }
  v7 = objc_msgSend(v21, "calibrationMatrixsCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
    {
      objc_msgSend(v21, "calibrationMatrixAtIndex:", j);
      -[GEOVLFFrameDetails addCalibrationMatrix:](self, "addCalibrationMatrix:");
    }
  }
  v10 = *((_WORD *)v21 + 90);
  if ((v10 & 0x10) != 0)
  {
    self->_radialDistortion1 = *((float *)v21 + 41);
    *(_WORD *)&self->_flags |= 0x10u;
    v10 = *((_WORD *)v21 + 90);
    if ((v10 & 0x20) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  self->_radialDistortion2 = *((float *)v21 + 42);
  *(_WORD *)&self->_flags |= 0x20u;
  if ((*((_WORD *)v21 + 90) & 8) != 0)
  {
LABEL_12:
    self->_timestamp = *((double *)v21 + 18);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_13:
  v11 = objc_msgSend(v21, "slamPosesCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
    {
      objc_msgSend(v21, "slamPoseAtIndex:", k);
      -[GEOVLFFrameDetails addSlamPose:](self, "addSlamPose:");
    }
  }
  tileId = self->_tileId;
  v15 = v21;
  v16 = *((_QWORD *)v21 + 17);
  if (tileId)
  {
    if (!v16)
      goto LABEL_25;
    -[GEOVLFUsageTileID mergeFrom:](tileId, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_25;
    -[GEOVLFFrameDetails setTileId:](self, "setTileId:");
  }
  v15 = v21;
LABEL_25:
  v17 = objc_msgSend(v15, "resultPoseRotationsCount");
  if (v17)
  {
    v18 = v17;
    for (m = 0; m != v18; ++m)
    {
      objc_msgSend(v21, "resultPoseRotationAtIndex:", m);
      -[GEOVLFFrameDetails addResultPoseRotation:](self, "addResultPoseRotation:");
    }
  }
  v20 = *((_WORD *)v21 + 90);
  if ((v20 & 1) != 0)
  {
    self->_resultTranslationX = *((double *)v21 + 14);
    *(_WORD *)&self->_flags |= 1u;
    v20 = *((_WORD *)v21 + 90);
    if ((v20 & 2) == 0)
    {
LABEL_30:
      if ((v20 & 4) == 0)
        goto LABEL_31;
LABEL_36:
      self->_resultTranslationZ = *((double *)v21 + 16);
      *(_WORD *)&self->_flags |= 4u;
      if ((*((_WORD *)v21 + 90) & 0x40) == 0)
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  else if ((v20 & 2) == 0)
  {
    goto LABEL_30;
  }
  self->_resultTranslationY = *((double *)v21 + 15);
  *(_WORD *)&self->_flags |= 2u;
  v20 = *((_WORD *)v21 + 90);
  if ((v20 & 4) != 0)
    goto LABEL_36;
LABEL_31:
  if ((v20 & 0x40) != 0)
  {
LABEL_32:
    self->_resultStatus = *((_DWORD *)v21 + 43);
    *(_WORD *)&self->_flags |= 0x40u;
  }
LABEL_33:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
