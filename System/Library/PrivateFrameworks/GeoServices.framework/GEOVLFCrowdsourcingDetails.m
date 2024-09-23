@implementation GEOVLFCrowdsourcingDetails

- (GEOVLFCrowdsourcingDetails)init
{
  GEOVLFCrowdsourcingDetails *v2;
  GEOVLFCrowdsourcingDetails *v3;
  GEOVLFCrowdsourcingDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLFCrowdsourcingDetails;
  v2 = -[GEOVLFCrowdsourcingDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFCrowdsourcingDetails)initWithData:(id)a3
{
  GEOVLFCrowdsourcingDetails *v3;
  GEOVLFCrowdsourcingDetails *v4;
  GEOVLFCrowdsourcingDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLFCrowdsourcingDetails;
  v3 = -[GEOVLFCrowdsourcingDetails initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLFCrowdsourcingDetails;
  -[GEOVLFCrowdsourcingDetails dealloc](&v3, sel_dealloc);
}

- (void)_readTileOrigins
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileOrigins_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)tileOriginsCount
{
  -[GEOVLFCrowdsourcingDetails _readTileOrigins]((uint64_t)self);
  return self->_tileOrigins.count;
}

- (double)tileOrigins
{
  -[GEOVLFCrowdsourcingDetails _readTileOrigins]((uint64_t)self);
  return self->_tileOrigins.list;
}

- (void)clearTileOrigins
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedDoubleClear();
}

- (void)addTileOrigin:(double)a3
{
  -[GEOVLFCrowdsourcingDetails _readTileOrigins]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (double)tileOriginAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_tileOrigins;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFCrowdsourcingDetails _readTileOrigins]((uint64_t)self);
  p_tileOrigins = &self->_tileOrigins;
  count = self->_tileOrigins.count;
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
  return p_tileOrigins->list[a3];
}

- (void)setTileOrigins:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedDoubleSet();
}

- (void)_readSlamOrigins
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSlamOrigins_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)slamOriginsCount
{
  -[GEOVLFCrowdsourcingDetails _readSlamOrigins]((uint64_t)self);
  return self->_slamOrigins.count;
}

- (double)slamOrigins
{
  -[GEOVLFCrowdsourcingDetails _readSlamOrigins]((uint64_t)self);
  return self->_slamOrigins.list;
}

- (void)clearSlamOrigins
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedDoubleClear();
}

- (void)addSlamOrigin:(double)a3
{
  -[GEOVLFCrowdsourcingDetails _readSlamOrigins]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (double)slamOriginAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_slamOrigins;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFCrowdsourcingDetails _readSlamOrigins]((uint64_t)self);
  p_slamOrigins = &self->_slamOrigins;
  count = self->_slamOrigins.count;
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
  return p_slamOrigins->list[a3];
}

- (void)setSlamOrigins:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedDoubleSet();
}

- (void)_readSlamTracks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSlamTracks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (NSMutableArray)slamTracks
{
  -[GEOVLFCrowdsourcingDetails _readSlamTracks]((uint64_t)self);
  return self->_slamTracks;
}

- (void)setSlamTracks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *slamTracks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  slamTracks = self->_slamTracks;
  self->_slamTracks = v4;

}

- (void)clearSlamTracks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_slamTracks, "removeAllObjects");
}

- (void)addSlamTracks:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVLFCrowdsourcingDetails _readSlamTracks]((uint64_t)self);
  -[GEOVLFCrowdsourcingDetails _addNoFlagsSlamTracks:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsSlamTracks:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 192);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = v5;

      v4 = *(void **)(a1 + 192);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)slamTracksCount
{
  -[GEOVLFCrowdsourcingDetails _readSlamTracks]((uint64_t)self);
  return -[NSMutableArray count](self->_slamTracks, "count");
}

- (id)slamTracksAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readSlamTracks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_slamTracks, "objectAtIndex:", a3);
}

+ (Class)slamTracksType
{
  return (Class)objc_opt_class();
}

- (void)_readFrameDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFrameDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (NSMutableArray)frameDetails
{
  -[GEOVLFCrowdsourcingDetails _readFrameDetails]((uint64_t)self);
  return self->_frameDetails;
}

- (void)setFrameDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *frameDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  frameDetails = self->_frameDetails;
  self->_frameDetails = v4;

}

- (void)clearFrameDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_frameDetails, "removeAllObjects");
}

- (void)addFrameDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVLFCrowdsourcingDetails _readFrameDetails]((uint64_t)self);
  -[GEOVLFCrowdsourcingDetails _addNoFlagsFrameDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsFrameDetails:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v5;

      v4 = *(void **)(a1 + 160);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)frameDetailsCount
{
  -[GEOVLFCrowdsourcingDetails _readFrameDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_frameDetails, "count");
}

- (id)frameDetailsAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readFrameDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_frameDetails, "objectAtIndex:", a3);
}

+ (Class)frameDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readResultPoseRotations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultPoseRotations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)resultPoseRotationsCount
{
  -[GEOVLFCrowdsourcingDetails _readResultPoseRotations]((uint64_t)self);
  return self->_resultPoseRotations.count;
}

- (double)resultPoseRotations
{
  -[GEOVLFCrowdsourcingDetails _readResultPoseRotations]((uint64_t)self);
  return self->_resultPoseRotations.list;
}

- (void)clearResultPoseRotations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedDoubleClear();
}

- (void)addResultPoseRotation:(double)a3
{
  -[GEOVLFCrowdsourcingDetails _readResultPoseRotations]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (double)resultPoseRotationAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_resultPoseRotations;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFCrowdsourcingDetails _readResultPoseRotations]((uint64_t)self);
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
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedDoubleSet();
}

- (double)resultTranslationX
{
  return self->_resultTranslationX;
}

- (void)setResultTranslationX:(double)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_resultTranslationX = a3;
}

- (void)setHasResultTranslationX:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
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
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_resultTranslationY = a3;
}

- (void)setHasResultTranslationY:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
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
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_resultTranslationZ = a3;
}

- (void)setHasResultTranslationZ:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasResultTranslationZ
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readInlierPoints3Ds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInlierPoints3Ds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)inlierPoints3DsCount
{
  -[GEOVLFCrowdsourcingDetails _readInlierPoints3Ds]((uint64_t)self);
  return self->_inlierPoints3Ds.count;
}

- (double)inlierPoints3Ds
{
  -[GEOVLFCrowdsourcingDetails _readInlierPoints3Ds]((uint64_t)self);
  return self->_inlierPoints3Ds.list;
}

- (void)clearInlierPoints3Ds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedDoubleClear();
}

- (void)addInlierPoints3D:(double)a3
{
  -[GEOVLFCrowdsourcingDetails _readInlierPoints3Ds]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (double)inlierPoints3DAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_inlierPoints3Ds;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFCrowdsourcingDetails _readInlierPoints3Ds]((uint64_t)self);
  p_inlierPoints3Ds = &self->_inlierPoints3Ds;
  count = self->_inlierPoints3Ds.count;
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
  return p_inlierPoints3Ds->list[a3];
}

- (void)setInlierPoints3Ds:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedDoubleSet();
}

- (void)_readInlierPoints2Ds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInlierPoints2Ds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)inlierPoints2DsCount
{
  -[GEOVLFCrowdsourcingDetails _readInlierPoints2Ds]((uint64_t)self);
  return self->_inlierPoints2Ds.count;
}

- (float)inlierPoints2Ds
{
  -[GEOVLFCrowdsourcingDetails _readInlierPoints2Ds]((uint64_t)self);
  return self->_inlierPoints2Ds.list;
}

- (void)clearInlierPoints2Ds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedFloatClear();
}

- (void)addInlierPoints2D:(float)a3
{
  -[GEOVLFCrowdsourcingDetails _readInlierPoints2Ds]((uint64_t)self);
  if (self)
    PBRepeatedFloatAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (float)inlierPoints2DAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_inlierPoints2Ds;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFCrowdsourcingDetails _readInlierPoints2Ds]((uint64_t)self);
  p_inlierPoints2Ds = &self->_inlierPoints2Ds;
  count = self->_inlierPoints2Ds.count;
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
  return p_inlierPoints2Ds->list[a3];
}

- (void)setInlierPoints2Ds:(float *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedFloatSet();
}

- (void)_readSlamPtsInlierIdxs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSlamPtsInlierIdxs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)slamPtsInlierIdxsCount
{
  -[GEOVLFCrowdsourcingDetails _readSlamPtsInlierIdxs]((uint64_t)self);
  return self->_slamPtsInlierIdxs.count;
}

- (unsigned)slamPtsInlierIdxs
{
  -[GEOVLFCrowdsourcingDetails _readSlamPtsInlierIdxs]((uint64_t)self);
  return self->_slamPtsInlierIdxs.list;
}

- (void)clearSlamPtsInlierIdxs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedUInt32Clear();
}

- (void)addSlamPtsInlierIdx:(unsigned int)a3
{
  -[GEOVLFCrowdsourcingDetails _readSlamPtsInlierIdxs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (unsigned)slamPtsInlierIdxAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_slamPtsInlierIdxs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFCrowdsourcingDetails _readSlamPtsInlierIdxs]((uint64_t)self);
  p_slamPtsInlierIdxs = &self->_slamPtsInlierIdxs;
  count = self->_slamPtsInlierIdxs.count;
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
  return p_slamPtsInlierIdxs->list[a3];
}

- (void)setSlamPtsInlierIdxs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  PBRepeatedUInt32Set();
}

- (unsigned)startFrameIdx
{
  return self->_startFrameIdx;
}

- (void)setStartFrameIdx:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_startFrameIdx = a3;
}

- (void)setHasStartFrameIdx:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasStartFrameIdx
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOVLFCrowdsourcingDetails;
  -[GEOVLFCrowdsourcingDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFCrowdsourcingDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFCrowdsourcingDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
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
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 144))
  {
    PBRepeatedDoubleNSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("tileOrigin");
    else
      v6 = CFSTR("tile_origin");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 96))
  {
    PBRepeatedDoubleNSArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("slamOrigin");
    else
      v8 = CFSTR("slam_origin");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (objc_msgSend(*(id *)(a1 + 192), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 192), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v10 = *(id *)(a1 + 192);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("slamTracks");
    else
      v17 = CFSTR("slam_tracks");
    objc_msgSend(v4, "setObject:forKey:", v9, v17);

  }
  if (objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = *(id *)(a1 + 160);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v24, "jsonRepresentation");
          else
            objc_msgSend(v24, "dictionaryRepresentation", (_QWORD)v45);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25, (_QWORD)v45);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v21);
    }

    if (a2)
      v26 = CFSTR("frameDetails");
    else
      v26 = CFSTR("frame_details");
    objc_msgSend(v4, "setObject:forKey:", v18, v26, (_QWORD)v45);

  }
  if (*(_QWORD *)(a1 + 72))
  {
    PBRepeatedDoubleNSArray();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("resultPoseRotation");
    else
      v28 = CFSTR("result_pose_rotation");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  v29 = *(_WORD *)(a1 + 216);
  if ((v29 & 1) == 0)
  {
    if ((v29 & 2) == 0)
      goto LABEL_49;
LABEL_79:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 176));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("resultTranslationY");
    else
      v44 = CFSTR("result_translation_y");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

    if ((*(_WORD *)(a1 + 216) & 4) == 0)
      goto LABEL_54;
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 168));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v42 = CFSTR("resultTranslationX");
  else
    v42 = CFSTR("result_translation_x");
  objc_msgSend(v4, "setObject:forKey:", v41, v42);

  v29 = *(_WORD *)(a1 + 216);
  if ((v29 & 2) != 0)
    goto LABEL_79;
LABEL_49:
  if ((v29 & 4) != 0)
  {
LABEL_50:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 184));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("resultTranslationZ");
    else
      v31 = CFSTR("result_translation_z");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
LABEL_54:
  if (*(_QWORD *)(a1 + 48))
  {
    PBRepeatedDoubleNSArray();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("inlierPoints3D");
    else
      v33 = CFSTR("inlier_points_3d");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedFloatNSArray();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("inlierPoints2D");
    else
      v35 = CFSTR("inlier_points_2d");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  if (*(_QWORD *)(a1 + 120))
  {
    PBRepeatedUInt32NSArray();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("slamPtsInlierIdx");
    else
      v37 = CFSTR("slam_pts_inlier_idx");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  if ((*(_WORD *)(a1 + 216) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 212));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("startFrameIdx");
    else
      v39 = CFSTR("start_frame_idx");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFCrowdsourcingDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFCrowdsourcingDetails)initWithDictionary:(id)a3
{
  return (GEOVLFCrowdsourcingDetails *)-[GEOVLFCrowdsourcingDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  GEOVLFSLAMTrack *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v40;
  GEOVLFFrameDetails *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  void *v65;
  const __CFString *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t jj;
  void *v73;
  const __CFString *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t kk;
  void *v81;
  const __CFString *v82;
  void *v83;
  void *v85;
  void *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("tileOrigin");
      else
        v6 = CFSTR("tile_origin");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v117;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v117 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v13, "doubleValue");
                objc_msgSend(a1, "addTileOrigin:");
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("slamOrigin");
      else
        v14 = CFSTR("slam_origin");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v113;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v113 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v21, "doubleValue");
                objc_msgSend(a1, "addSlamOrigin:");
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
          }
          while (v18);
        }

      }
      if (a3)
        v22 = CFSTR("slamTracks");
      else
        v22 = CFSTR("slam_tracks");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v87 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v85 = v23;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v109;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v109 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = [GEOVLFSLAMTrack alloc];
                if ((a3 & 1) != 0)
                  v31 = -[GEOVLFSLAMTrack initWithJSON:](v30, "initWithJSON:", v29);
                else
                  v31 = -[GEOVLFSLAMTrack initWithDictionary:](v30, "initWithDictionary:", v29);
                v32 = (void *)v31;
                objc_msgSend(a1, "addSlamTracks:", v31, v85);

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
          }
          while (v26);
        }

        v23 = v85;
        v5 = v87;
      }

      if (a3)
        v33 = CFSTR("frameDetails");
      else
        v33 = CFSTR("frame_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33, v85);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v86 = v34;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v105;
          do
          {
            for (m = 0; m != v37; ++m)
            {
              if (*(_QWORD *)v105 != v38)
                objc_enumerationMutation(v35);
              v40 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v41 = [GEOVLFFrameDetails alloc];
                if ((a3 & 1) != 0)
                  v42 = -[GEOVLFFrameDetails initWithJSON:](v41, "initWithJSON:", v40);
                else
                  v42 = -[GEOVLFFrameDetails initWithDictionary:](v41, "initWithDictionary:", v40);
                v43 = (void *)v42;
                objc_msgSend(a1, "addFrameDetails:", v42, v86);

              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
          }
          while (v37);
        }

        v34 = v86;
        v5 = v87;
      }

      if (a3)
        v44 = CFSTR("resultPoseRotation");
      else
        v44 = CFSTR("result_pose_rotation");
      objc_msgSend(v5, "objectForKeyedSubscript:", v44, v86);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v46 = v45;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v100, v123, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v101;
          do
          {
            for (n = 0; n != v48; ++n)
            {
              if (*(_QWORD *)v101 != v49)
                objc_enumerationMutation(v46);
              v51 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * n);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v51, "doubleValue");
                objc_msgSend(a1, "addResultPoseRotation:");
              }
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v100, v123, 16);
          }
          while (v48);
        }

      }
      if (a3)
        v52 = CFSTR("resultTranslationX");
      else
        v52 = CFSTR("result_translation_x");
      objc_msgSend(v5, "objectForKeyedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v53, "doubleValue");
        objc_msgSend(a1, "setResultTranslationX:");
      }

      if (a3)
        v54 = CFSTR("resultTranslationY");
      else
        v54 = CFSTR("result_translation_y");
      objc_msgSend(v5, "objectForKeyedSubscript:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v55, "doubleValue");
        objc_msgSend(a1, "setResultTranslationY:");
      }

      if (a3)
        v56 = CFSTR("resultTranslationZ");
      else
        v56 = CFSTR("result_translation_z");
      objc_msgSend(v5, "objectForKeyedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v57, "doubleValue");
        objc_msgSend(a1, "setResultTranslationZ:");
      }

      if (a3)
        v58 = CFSTR("inlierPoints3D");
      else
        v58 = CFSTR("inlier_points_3d");
      objc_msgSend(v5, "objectForKeyedSubscript:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v60 = v59;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v96, v122, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v97;
          do
          {
            for (ii = 0; ii != v62; ++ii)
            {
              if (*(_QWORD *)v97 != v63)
                objc_enumerationMutation(v60);
              v65 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * ii);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v65, "doubleValue");
                objc_msgSend(a1, "addInlierPoints3D:");
              }
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v96, v122, 16);
          }
          while (v62);
        }

      }
      if (a3)
        v66 = CFSTR("inlierPoints2D");
      else
        v66 = CFSTR("inlier_points_2d");
      objc_msgSend(v5, "objectForKeyedSubscript:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v68 = v67;
        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v92, v121, 16);
        if (v69)
        {
          v70 = v69;
          v71 = *(_QWORD *)v93;
          do
          {
            for (jj = 0; jj != v70; ++jj)
            {
              if (*(_QWORD *)v93 != v71)
                objc_enumerationMutation(v68);
              v73 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * jj);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v73, "floatValue");
                objc_msgSend(a1, "addInlierPoints2D:");
              }
            }
            v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v92, v121, 16);
          }
          while (v70);
        }

      }
      if (a3)
        v74 = CFSTR("slamPtsInlierIdx");
      else
        v74 = CFSTR("slam_pts_inlier_idx");
      objc_msgSend(v5, "objectForKeyedSubscript:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v76 = v75;
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v88, v120, 16);
        if (v77)
        {
          v78 = v77;
          v79 = *(_QWORD *)v89;
          do
          {
            for (kk = 0; kk != v78; ++kk)
            {
              if (*(_QWORD *)v89 != v79)
                objc_enumerationMutation(v76);
              v81 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * kk);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addSlamPtsInlierIdx:", objc_msgSend(v81, "unsignedIntValue"));
            }
            v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v88, v120, 16);
          }
          while (v78);
        }

      }
      if (a3)
        v82 = CFSTR("startFrameIdx");
      else
        v82 = CFSTR("start_frame_idx");
      objc_msgSend(v5, "objectForKeyedSubscript:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStartFrameIdx:", objc_msgSend(v83, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOVLFCrowdsourcingDetails)initWithJSON:(id)a3
{
  return (GEOVLFCrowdsourcingDetails *)-[GEOVLFCrowdsourcingDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_9482;
    else
      v8 = (int *)&readAll__nonRecursiveTag_9483;
    GEOVLFCrowdsourcingDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOVLFCrowdsourcingDetailsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFCrowdsourcingDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFCrowdsourcingDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  unint64_t v16;
  __int16 flags;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  PBDataReader *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOVLFCrowdsourcingDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    v21 = self->_reader;
    objc_sync_enter(v21);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v22);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLFCrowdsourcingDetails readAll:](self, "readAll:", 0);
    if (self->_tileOrigins.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v6;
      }
      while (v6 < self->_tileOrigins.count);
    }
    if (self->_slamOrigins.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v7;
      }
      while (v7 < self->_slamOrigins.count);
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = self->_slamTracks;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteSubmessage();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = self->_frameDetails;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteSubmessage();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v13);
    }

    if (self->_resultPoseRotations.count)
    {
      v16 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v16;
      }
      while (v16 < self->_resultPoseRotations.count);
    }
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_inlierPoints3Ds.count)
    {
      v18 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v18;
      }
      while (v18 < self->_inlierPoints3Ds.count);
    }
    if (self->_inlierPoints2Ds.count)
    {
      v19 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v19;
      }
      while (v19 < self->_inlierPoints2Ds.count);
    }
    if (self->_slamPtsInlierIdxs.count)
    {
      v20 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v20;
      }
      while (v20 < self->_slamPtsInlierIdxs.count);
    }
    if ((*(_WORD *)&self->_flags & 8) != 0)
      PBDataWriterWriteUint32Field();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t n;
  __int16 flags;
  unint64_t v22;
  unint64_t v23;
  uint64_t ii;
  unint64_t v25;
  unint64_t v26;
  uint64_t jj;
  unint64_t v28;
  unint64_t v29;
  uint64_t kk;
  id *v31;

  v31 = (id *)a3;
  -[GEOVLFCrowdsourcingDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v31 + 1, self->_reader);
  *((_DWORD *)v31 + 50) = self->_readerMarkPos;
  *((_DWORD *)v31 + 51) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOVLFCrowdsourcingDetails tileOriginsCount](self, "tileOriginsCount"))
  {
    objc_msgSend(v31, "clearTileOrigins");
    v4 = -[GEOVLFCrowdsourcingDetails tileOriginsCount](self, "tileOriginsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOVLFCrowdsourcingDetails tileOriginAtIndex:](self, "tileOriginAtIndex:", i);
        objc_msgSend(v31, "addTileOrigin:");
      }
    }
  }
  if (-[GEOVLFCrowdsourcingDetails slamOriginsCount](self, "slamOriginsCount"))
  {
    objc_msgSend(v31, "clearSlamOrigins");
    v7 = -[GEOVLFCrowdsourcingDetails slamOriginsCount](self, "slamOriginsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOVLFCrowdsourcingDetails slamOriginAtIndex:](self, "slamOriginAtIndex:", j);
        objc_msgSend(v31, "addSlamOrigin:");
      }
    }
  }
  if (-[GEOVLFCrowdsourcingDetails slamTracksCount](self, "slamTracksCount"))
  {
    objc_msgSend(v31, "clearSlamTracks");
    v10 = -[GEOVLFCrowdsourcingDetails slamTracksCount](self, "slamTracksCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
      {
        -[GEOVLFCrowdsourcingDetails slamTracksAtIndex:](self, "slamTracksAtIndex:", k);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addSlamTracks:", v13);

      }
    }
  }
  if (-[GEOVLFCrowdsourcingDetails frameDetailsCount](self, "frameDetailsCount"))
  {
    objc_msgSend(v31, "clearFrameDetails");
    v14 = -[GEOVLFCrowdsourcingDetails frameDetailsCount](self, "frameDetailsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
      {
        -[GEOVLFCrowdsourcingDetails frameDetailsAtIndex:](self, "frameDetailsAtIndex:", m);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addFrameDetails:", v17);

      }
    }
  }
  if (-[GEOVLFCrowdsourcingDetails resultPoseRotationsCount](self, "resultPoseRotationsCount"))
  {
    objc_msgSend(v31, "clearResultPoseRotations");
    v18 = -[GEOVLFCrowdsourcingDetails resultPoseRotationsCount](self, "resultPoseRotationsCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
      {
        -[GEOVLFCrowdsourcingDetails resultPoseRotationAtIndex:](self, "resultPoseRotationAtIndex:", n);
        objc_msgSend(v31, "addResultPoseRotation:");
      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0)
      goto LABEL_23;
LABEL_41:
    v31[22] = *(id *)&self->_resultTranslationY;
    *((_WORD *)v31 + 108) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  v31[21] = *(id *)&self->_resultTranslationX;
  *((_WORD *)v31 + 108) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_41;
LABEL_23:
  if ((flags & 4) != 0)
  {
LABEL_24:
    v31[23] = *(id *)&self->_resultTranslationZ;
    *((_WORD *)v31 + 108) |= 4u;
  }
LABEL_25:
  if (-[GEOVLFCrowdsourcingDetails inlierPoints3DsCount](self, "inlierPoints3DsCount"))
  {
    objc_msgSend(v31, "clearInlierPoints3Ds");
    v22 = -[GEOVLFCrowdsourcingDetails inlierPoints3DsCount](self, "inlierPoints3DsCount");
    if (v22)
    {
      v23 = v22;
      for (ii = 0; ii != v23; ++ii)
      {
        -[GEOVLFCrowdsourcingDetails inlierPoints3DAtIndex:](self, "inlierPoints3DAtIndex:", ii);
        objc_msgSend(v31, "addInlierPoints3D:");
      }
    }
  }
  if (-[GEOVLFCrowdsourcingDetails inlierPoints2DsCount](self, "inlierPoints2DsCount"))
  {
    objc_msgSend(v31, "clearInlierPoints2Ds");
    v25 = -[GEOVLFCrowdsourcingDetails inlierPoints2DsCount](self, "inlierPoints2DsCount");
    if (v25)
    {
      v26 = v25;
      for (jj = 0; jj != v26; ++jj)
      {
        -[GEOVLFCrowdsourcingDetails inlierPoints2DAtIndex:](self, "inlierPoints2DAtIndex:", jj);
        objc_msgSend(v31, "addInlierPoints2D:");
      }
    }
  }
  if (-[GEOVLFCrowdsourcingDetails slamPtsInlierIdxsCount](self, "slamPtsInlierIdxsCount"))
  {
    objc_msgSend(v31, "clearSlamPtsInlierIdxs");
    v28 = -[GEOVLFCrowdsourcingDetails slamPtsInlierIdxsCount](self, "slamPtsInlierIdxsCount");
    if (v28)
    {
      v29 = v28;
      for (kk = 0; kk != v29; ++kk)
        objc_msgSend(v31, "addSlamPtsInlierIdx:", -[GEOVLFCrowdsourcingDetails slamPtsInlierIdxAtIndex:](self, "slamPtsInlierIdxAtIndex:", kk));
    }
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v31 + 53) = self->_startFrameIdx;
    *((_WORD *)v31 + 108) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int16 flags;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOVLFCrowdsourcingDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVLFCrowdsourcingDetails readAll:](self, "readAll:", 0);
  PBRepeatedDoubleCopy();
  PBRepeatedDoubleCopy();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_slamTracks;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSlamTracks:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_frameDetails;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addFrameDetails:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  PBRepeatedDoubleCopy();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 168) = self->_resultTranslationX;
    *(_WORD *)(v5 + 216) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_21:
      if ((flags & 4) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_21;
  }
  *(double *)(v5 + 176) = self->_resultTranslationY;
  *(_WORD *)(v5 + 216) |= 2u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_22:
    *(double *)(v5 + 184) = self->_resultTranslationZ;
    *(_WORD *)(v5 + 216) |= 4u;
  }
LABEL_23:
  PBRepeatedDoubleCopy();
  PBRepeatedFloatCopy();
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 212) = self->_startFrameIdx;
    *(_WORD *)(v5 + 216) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *slamTracks;
  NSMutableArray *frameDetails;
  __int16 flags;
  __int16 v8;
  __int16 v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[GEOVLFCrowdsourcingDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_31;
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_31;
  slamTracks = self->_slamTracks;
  if ((unint64_t)slamTracks | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](slamTracks, "isEqual:"))
      goto LABEL_31;
  }
  frameDetails = self->_frameDetails;
  if ((unint64_t)frameDetails | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](frameDetails, "isEqual:"))
      goto LABEL_31;
  }
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_31;
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 108);
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_resultTranslationX != *((double *)v4 + 21))
      goto LABEL_31;
  }
  else if ((v8 & 1) != 0)
  {
LABEL_31:
    v10 = 0;
    goto LABEL_32;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_resultTranslationY != *((double *)v4 + 22))
      goto LABEL_31;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_resultTranslationZ != *((double *)v4 + 23))
      goto LABEL_31;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_31;
  }
  if (!PBRepeatedDoubleIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_31;
  }
  v9 = *((_WORD *)v4 + 108);
  v10 = (v9 & 8) == 0;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_startFrameIdx != *((_DWORD *)v4 + 53))
      goto LABEL_31;
    v10 = 1;
  }
LABEL_32:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  __int16 flags;
  unint64_t v5;
  double resultTranslationX;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double resultTranslationY;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double resultTranslationZ;
  double v17;
  long double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  -[GEOVLFCrowdsourcingDetails readAll:](self, "readAll:", 1);
  v28 = PBRepeatedDoubleHash();
  v27 = PBRepeatedDoubleHash();
  v26 = -[NSMutableArray hash](self->_slamTracks, "hash");
  v25 = -[NSMutableArray hash](self->_frameDetails, "hash");
  v3 = PBRepeatedDoubleHash();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    resultTranslationX = self->_resultTranslationX;
    v7 = -resultTranslationX;
    if (resultTranslationX >= 0.0)
      v7 = self->_resultTranslationX;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 2) != 0)
  {
    resultTranslationY = self->_resultTranslationY;
    v12 = -resultTranslationY;
    if (resultTranslationY >= 0.0)
      v12 = self->_resultTranslationY;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((flags & 4) != 0)
  {
    resultTranslationZ = self->_resultTranslationZ;
    v17 = -resultTranslationZ;
    if (resultTranslationZ >= 0.0)
      v17 = self->_resultTranslationZ;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  v20 = PBRepeatedDoubleHash();
  v21 = PBRepeatedFloatHash();
  v22 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v23 = 2654435761 * self->_startFrameIdx;
  else
    v23 = 0;
  return v27 ^ v28 ^ v26 ^ v25 ^ v3 ^ v5 ^ v10 ^ v15 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t m;
  uint64_t v21;
  uint64_t v22;
  uint64_t n;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t ii;
  uint64_t v28;
  uint64_t v29;
  uint64_t jj;
  uint64_t v31;
  uint64_t v32;
  uint64_t kk;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "tileOriginsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v4, "tileOriginAtIndex:", i);
      -[GEOVLFCrowdsourcingDetails addTileOrigin:](self, "addTileOrigin:");
    }
  }
  v8 = objc_msgSend(v4, "slamOriginsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
    {
      objc_msgSend(v4, "slamOriginAtIndex:", j);
      -[GEOVLFCrowdsourcingDetails addSlamOrigin:](self, "addSlamOrigin:");
    }
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = *((id *)v4 + 24);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v13; ++k)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        -[GEOVLFCrowdsourcingDetails addSlamTracks:](self, "addSlamTracks:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v13);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = *((id *)v4 + 20);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v18; ++m)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        -[GEOVLFCrowdsourcingDetails addFrameDetails:](self, "addFrameDetails:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * m), (_QWORD)v34);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v18);
  }

  v21 = objc_msgSend(v4, "resultPoseRotationsCount");
  if (v21)
  {
    v22 = v21;
    for (n = 0; n != v22; ++n)
    {
      objc_msgSend(v4, "resultPoseRotationAtIndex:", n, (_QWORD)v34);
      -[GEOVLFCrowdsourcingDetails addResultPoseRotation:](self, "addResultPoseRotation:");
    }
  }
  v24 = *((_WORD *)v4 + 108);
  if ((v24 & 1) != 0)
  {
    self->_resultTranslationX = *((double *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
    v24 = *((_WORD *)v4 + 108);
    if ((v24 & 2) == 0)
    {
LABEL_26:
      if ((v24 & 4) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  else if ((v24 & 2) == 0)
  {
    goto LABEL_26;
  }
  self->_resultTranslationY = *((double *)v4 + 22);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v4 + 108) & 4) != 0)
  {
LABEL_27:
    self->_resultTranslationZ = *((double *)v4 + 23);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_28:
  v25 = objc_msgSend(v4, "inlierPoints3DsCount", (_QWORD)v34);
  if (v25)
  {
    v26 = v25;
    for (ii = 0; ii != v26; ++ii)
    {
      objc_msgSend(v4, "inlierPoints3DAtIndex:", ii);
      -[GEOVLFCrowdsourcingDetails addInlierPoints3D:](self, "addInlierPoints3D:");
    }
  }
  v28 = objc_msgSend(v4, "inlierPoints2DsCount");
  if (v28)
  {
    v29 = v28;
    for (jj = 0; jj != v29; ++jj)
    {
      objc_msgSend(v4, "inlierPoints2DAtIndex:", jj);
      -[GEOVLFCrowdsourcingDetails addInlierPoints2D:](self, "addInlierPoints2D:");
    }
  }
  v31 = objc_msgSend(v4, "slamPtsInlierIdxsCount");
  if (v31)
  {
    v32 = v31;
    for (kk = 0; kk != v32; ++kk)
      -[GEOVLFCrowdsourcingDetails addSlamPtsInlierIdx:](self, "addSlamPtsInlierIdx:", objc_msgSend(v4, "slamPtsInlierIdxAtIndex:", kk));
  }
  if ((*((_WORD *)v4 + 108) & 8) != 0)
  {
    self->_startFrameIdx = *((_DWORD *)v4 + 53);
    *(_WORD *)&self->_flags |= 8u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slamTracks, 0);
  objc_storeStrong((id *)&self->_frameDetails, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
