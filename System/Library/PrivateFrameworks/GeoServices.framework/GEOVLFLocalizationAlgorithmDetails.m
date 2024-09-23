@implementation GEOVLFLocalizationAlgorithmDetails

- (GEOVLFLocalizationAlgorithmDetails)init
{
  GEOVLFLocalizationAlgorithmDetails *v2;
  GEOVLFLocalizationAlgorithmDetails *v3;
  GEOVLFLocalizationAlgorithmDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLFLocalizationAlgorithmDetails;
  v2 = -[GEOVLFLocalizationAlgorithmDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFLocalizationAlgorithmDetails)initWithData:(id)a3
{
  GEOVLFLocalizationAlgorithmDetails *v3;
  GEOVLFLocalizationAlgorithmDetails *v4;
  GEOVLFLocalizationAlgorithmDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLFLocalizationAlgorithmDetails;
  v3 = -[GEOVLFLocalizationAlgorithmDetails initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOVLFLocalizationAlgorithmDetails;
  -[GEOVLFLocalizationAlgorithmDetails dealloc](&v3, sel_dealloc);
}

- (unsigned)numberOfKeypoints
{
  return self->_numberOfKeypoints;
}

- (void)setNumberOfKeypoints:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_numberOfKeypoints = a3;
}

- (void)setHasNumberOfKeypoints:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasNumberOfKeypoints
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)numberOfMatches
{
  return self->_numberOfMatches;
}

- (void)setNumberOfMatches:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_numberOfMatches = a3;
}

- (void)setHasNumberOfMatches:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 260;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasNumberOfMatches
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)numberOfInliers
{
  return self->_numberOfInliers;
}

- (void)setNumberOfInliers:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_numberOfInliers = a3;
}

- (void)setHasNumberOfInliers:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasNumberOfInliers
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readSolverConfidences
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationAlgorithmDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSolverConfidences_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)solverConfidencesCount
{
  -[GEOVLFLocalizationAlgorithmDetails _readSolverConfidences]((uint64_t)self);
  return self->_solverConfidences.count;
}

- (double)solverConfidences
{
  -[GEOVLFLocalizationAlgorithmDetails _readSolverConfidences]((uint64_t)self);
  return self->_solverConfidences.list;
}

- (void)clearSolverConfidences
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedDoubleClear();
}

- (void)addSolverConfidence:(double)a3
{
  -[GEOVLFLocalizationAlgorithmDetails _readSolverConfidences]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (double)solverConfidenceAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_solverConfidences;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFLocalizationAlgorithmDetails _readSolverConfidences]((uint64_t)self);
  p_solverConfidences = &self->_solverConfidences;
  count = self->_solverConfidences.count;
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
  return p_solverConfidences->list[a3];
}

- (void)setSolverConfidences:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedDoubleSet();
}

- (void)_readFusedConfidences
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationAlgorithmDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFusedConfidences_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)fusedConfidencesCount
{
  -[GEOVLFLocalizationAlgorithmDetails _readFusedConfidences]((uint64_t)self);
  return self->_fusedConfidences.count;
}

- (double)fusedConfidences
{
  -[GEOVLFLocalizationAlgorithmDetails _readFusedConfidences]((uint64_t)self);
  return self->_fusedConfidences.list;
}

- (void)clearFusedConfidences
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedDoubleClear();
}

- (void)addFusedConfidence:(double)a3
{
  -[GEOVLFLocalizationAlgorithmDetails _readFusedConfidences]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (double)fusedConfidenceAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_fusedConfidences;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLFLocalizationAlgorithmDetails _readFusedConfidences]((uint64_t)self);
  p_fusedConfidences = &self->_fusedConfidences;
  count = self->_fusedConfidences.count;
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
  return p_fusedConfidences->list[a3];
}

- (void)setFusedConfidences:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedDoubleSet();
}

- (unsigned)tKptsMs
{
  return self->_tKptsMs;
}

- (void)setTKptsMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  self->_tKptsMs = a3;
}

- (void)setHasTKptsMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 264;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasTKptsMs
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)tMatchMs
{
  return self->_tMatchMs;
}

- (void)setTMatchMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  self->_tMatchMs = a3;
}

- (void)setHasTMatchMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 272;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTMatchMs
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)tPoseMs
{
  return self->_tPoseMs;
}

- (void)setTPoseMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  self->_tPoseMs = a3;
}

- (void)setHasTPoseMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 288;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasTPoseMs
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
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
  v8.super_class = (Class)GEOVLFLocalizationAlgorithmDetails;
  -[GEOVLFLocalizationAlgorithmDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFLocalizationAlgorithmDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFLocalizationAlgorithmDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 100);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("numberOfKeypoints");
    else
      v7 = CFSTR("number_of_keypoints");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 100);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("numberOfMatches");
    else
      v9 = CFSTR("number_of_matches");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = *(_WORD *)(a1 + 100);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("numberOfInliers");
    else
      v11 = CFSTR("number_of_inliers");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    PBRepeatedDoubleNSArray();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("solverConfidence");
    else
      v13 = CFSTR("solver_confidence");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedDoubleNSArray();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("fusedConfidence");
    else
      v15 = CFSTR("fused_confidence");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v16 = *(_WORD *)(a1 + 100);
  if ((v16 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("tKptsMs");
    else
      v18 = CFSTR("t_kpts_ms");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v16 = *(_WORD *)(a1 + 100);
    if ((v16 & 0x10) == 0)
    {
LABEL_29:
      if ((v16 & 0x20) == 0)
        return v4;
      goto LABEL_39;
    }
  }
  else if ((v16 & 0x10) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("tMatchMs");
  else
    v20 = CFSTR("t_match_ms");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  if ((*(_WORD *)(a1 + 100) & 0x20) != 0)
  {
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("tPoseMs");
    else
      v22 = CFSTR("t_pose_ms");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFLocalizationAlgorithmDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFLocalizationAlgorithmDetails)initWithDictionary:(id)a3
{
  return (GEOVLFLocalizationAlgorithmDetails *)-[GEOVLFLocalizationAlgorithmDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("numberOfKeypoints");
      else
        v6 = CFSTR("number_of_keypoints");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberOfKeypoints:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("numberOfMatches");
      else
        v8 = CFSTR("number_of_matches");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberOfMatches:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("numberOfInliers");
      else
        v10 = CFSTR("number_of_inliers");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberOfInliers:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("solverConfidence");
      else
        v12 = CFSTR("solver_confidence");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v40;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v40 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v18);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v19, "doubleValue");
                objc_msgSend(a1, "addSolverConfidence:");
              }
              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          }
          while (v16);
        }

      }
      if (a3)
        v20 = CFSTR("fusedConfidence");
      else
        v20 = CFSTR("fused_confidence");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v36;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v36 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v26);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v27, "doubleValue", (_QWORD)v35);
                objc_msgSend(a1, "addFusedConfidence:");
              }
              ++v26;
            }
            while (v24 != v26);
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v24);
        }

      }
      if (a3)
        v28 = CFSTR("tKptsMs");
      else
        v28 = CFSTR("t_kpts_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28, (_QWORD)v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTKptsMs:", objc_msgSend(v29, "unsignedIntValue"));

      if (a3)
        v30 = CFSTR("tMatchMs");
      else
        v30 = CFSTR("t_match_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTMatchMs:", objc_msgSend(v31, "unsignedIntValue"));

      if (a3)
        v32 = CFSTR("tPoseMs");
      else
        v32 = CFSTR("t_pose_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTPoseMs:", objc_msgSend(v33, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOVLFLocalizationAlgorithmDetails)initWithJSON:(id)a3
{
  return (GEOVLFLocalizationAlgorithmDetails *)-[GEOVLFLocalizationAlgorithmDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_9856;
    else
      v8 = (int *)&readAll__nonRecursiveTag_9857;
    GEOVLFLocalizationAlgorithmDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFLocalizationAlgorithmDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFLocalizationAlgorithmDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  __int16 v9;
  PBDataReader *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1C0) == 0)
    {
      v10 = self->_reader;
      objc_sync_enter(v10);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "writeData:", v11);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v10);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVLFLocalizationAlgorithmDetails readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (__int16)self->_flags;
  }
  v6 = v12;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v12;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v12;
  }
  if (self->_solverConfidences.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v6 = v12;
      ++v7;
    }
    while (v7 < self->_solverConfidences.count);
  }
  if (self->_fusedConfidences.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v6 = v12;
      ++v8;
    }
    while (v8 < self->_fusedConfidences.count);
  }
  v9 = (__int16)self->_flags;
  if ((v9 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v12;
    v9 = (__int16)self->_flags;
    if ((v9 & 0x10) == 0)
    {
LABEL_17:
      if ((v9 & 0x20) == 0)
        goto LABEL_24;
      goto LABEL_21;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  v6 = v12;
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
LABEL_21:
    PBDataWriterWriteUint32Field();
LABEL_23:
    v6 = v12;
  }
LABEL_24:

}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  __int16 v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOVLFLocalizationAlgorithmDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 16) = self->_readerMarkPos;
  *((_DWORD *)v12 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_3;
LABEL_19:
    *((_DWORD *)v12 + 21) = self->_numberOfMatches;
    *((_WORD *)v12 + 50) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v12 + 20) = self->_numberOfKeypoints;
  *((_WORD *)v12 + 50) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_19;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v12 + 19) = self->_numberOfInliers;
    *((_WORD *)v12 + 50) |= 1u;
  }
LABEL_5:
  if (-[GEOVLFLocalizationAlgorithmDetails solverConfidencesCount](self, "solverConfidencesCount"))
  {
    objc_msgSend(v12, "clearSolverConfidences");
    v5 = -[GEOVLFLocalizationAlgorithmDetails solverConfidencesCount](self, "solverConfidencesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOVLFLocalizationAlgorithmDetails solverConfidenceAtIndex:](self, "solverConfidenceAtIndex:", i);
        objc_msgSend(v12, "addSolverConfidence:");
      }
    }
  }
  if (-[GEOVLFLocalizationAlgorithmDetails fusedConfidencesCount](self, "fusedConfidencesCount"))
  {
    objc_msgSend(v12, "clearFusedConfidences");
    v8 = -[GEOVLFLocalizationAlgorithmDetails fusedConfidencesCount](self, "fusedConfidencesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOVLFLocalizationAlgorithmDetails fusedConfidenceAtIndex:](self, "fusedConfidenceAtIndex:", j);
        objc_msgSend(v12, "addFusedConfidence:");
      }
    }
  }
  v11 = (__int16)self->_flags;
  if ((v11 & 8) == 0)
  {
    if ((v11 & 0x10) == 0)
      goto LABEL_15;
LABEL_22:
    *((_DWORD *)v12 + 23) = self->_tMatchMs;
    *((_WORD *)v12 + 50) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  *((_DWORD *)v12 + 22) = self->_tKptsMs;
  *((_WORD *)v12 + 50) |= 8u;
  v11 = (__int16)self->_flags;
  if ((v11 & 0x10) != 0)
    goto LABEL_22;
LABEL_15:
  if ((v11 & 0x20) != 0)
  {
LABEL_16:
    *((_DWORD *)v12 + 24) = self->_tPoseMs;
    *((_WORD *)v12 + 50) |= 0x20u;
  }
LABEL_17:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  PBDataReader *reader;
  PBDataReader *v6;
  id v7;
  __int16 flags;
  __int16 v9;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLFLocalizationAlgorithmDetails readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v4 + 80) = self->_numberOfKeypoints;
      *(_WORD *)(v4 + 100) |= 2u;
      flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v4 + 84) = self->_numberOfMatches;
    *(_WORD *)(v4 + 100) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
    {
LABEL_9:
      PBRepeatedDoubleCopy();
      PBRepeatedDoubleCopy();
      v9 = (__int16)self->_flags;
      if ((v9 & 8) != 0)
      {
        *(_DWORD *)(v4 + 88) = self->_tKptsMs;
        *(_WORD *)(v4 + 100) |= 8u;
        v9 = (__int16)self->_flags;
        if ((v9 & 0x10) == 0)
        {
LABEL_11:
          if ((v9 & 0x20) == 0)
            return (id)v4;
LABEL_12:
          *(_DWORD *)(v4 + 96) = self->_tPoseMs;
          *(_WORD *)(v4 + 100) |= 0x20u;
          return (id)v4;
        }
      }
      else if ((v9 & 0x10) == 0)
      {
        goto LABEL_11;
      }
      *(_DWORD *)(v4 + 92) = self->_tMatchMs;
      *(_WORD *)(v4 + 100) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 0x20) == 0)
        return (id)v4;
      goto LABEL_12;
    }
LABEL_8:
    *(_DWORD *)(v4 + 76) = self->_numberOfInliers;
    *(_WORD *)(v4 + 100) |= 1u;
    goto LABEL_9;
  }
  v6 = reader;
  objc_sync_enter(v6);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v6);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOVLFLocalizationAlgorithmDetailsReadAllFrom(v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v7 = (id)v4;
  objc_sync_exit(v6);

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[GEOVLFLocalizationAlgorithmDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 50);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_numberOfKeypoints != *((_DWORD *)v4 + 20))
      goto LABEL_33;
  }
  else if ((v6 & 2) != 0)
  {
LABEL_33:
    v9 = 0;
    goto LABEL_34;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numberOfMatches != *((_DWORD *)v4 + 21))
      goto LABEL_33;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_numberOfInliers != *((_DWORD *)v4 + 19))
      goto LABEL_33;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_33;
  }
  if (!PBRepeatedDoubleIsEqual() || !PBRepeatedDoubleIsEqual())
    goto LABEL_33;
  v7 = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 50);
  if ((v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_tKptsMs != *((_DWORD *)v4 + 22))
      goto LABEL_33;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_tMatchMs != *((_DWORD *)v4 + 23))
      goto LABEL_33;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_33;
  }
  v9 = (v8 & 0x20) == 0;
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_tPoseMs != *((_DWORD *)v4 + 24))
      goto LABEL_33;
    v9 = 1;
  }
LABEL_34:

  return v9;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[GEOVLFLocalizationAlgorithmDetails readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    v4 = 0;
    if ((flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((flags & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_numberOfKeypoints;
  if ((flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_numberOfMatches;
  if ((flags & 1) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_numberOfInliers;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = PBRepeatedDoubleHash();
  v8 = PBRepeatedDoubleHash();
  v9 = (__int16)self->_flags;
  if ((v9 & 8) == 0)
  {
    v10 = 0;
    if ((v9 & 0x10) != 0)
      goto LABEL_10;
LABEL_13:
    v11 = 0;
    if ((v9 & 0x20) != 0)
      goto LABEL_11;
LABEL_14:
    v12 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12;
  }
  v10 = 2654435761 * self->_tKptsMs;
  if ((v9 & 0x10) == 0)
    goto LABEL_13;
LABEL_10:
  v11 = 2654435761 * self->_tMatchMs;
  if ((v9 & 0x20) == 0)
    goto LABEL_14;
LABEL_11:
  v12 = 2654435761 * self->_tPoseMs;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  __int16 v11;
  unsigned int *v12;

  v12 = (unsigned int *)a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = *((_WORD *)v12 + 50);
  if ((v4 & 2) != 0)
  {
    self->_numberOfKeypoints = v12[20];
    *(_WORD *)&self->_flags |= 2u;
    v4 = *((_WORD *)v12 + 50);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfMatches = v12[21];
  *(_WORD *)&self->_flags |= 4u;
  if ((v12[25] & 1) != 0)
  {
LABEL_4:
    self->_numberOfInliers = v12[19];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_5:
  v5 = objc_msgSend(v12, "solverConfidencesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v12, "solverConfidenceAtIndex:", i);
      -[GEOVLFLocalizationAlgorithmDetails addSolverConfidence:](self, "addSolverConfidence:");
    }
  }
  v8 = objc_msgSend(v12, "fusedConfidencesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
    {
      objc_msgSend(v12, "fusedConfidenceAtIndex:", j);
      -[GEOVLFLocalizationAlgorithmDetails addFusedConfidence:](self, "addFusedConfidence:");
    }
  }
  v11 = *((_WORD *)v12 + 50);
  if ((v11 & 8) == 0)
  {
    if ((v11 & 0x10) == 0)
      goto LABEL_13;
LABEL_20:
    self->_tMatchMs = v12[23];
    *(_WORD *)&self->_flags |= 0x10u;
    if ((v12[25] & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  self->_tKptsMs = v12[22];
  *(_WORD *)&self->_flags |= 8u;
  v11 = *((_WORD *)v12 + 50);
  if ((v11 & 0x10) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v11 & 0x20) != 0)
  {
LABEL_14:
    self->_tPoseMs = v12[24];
    *(_WORD *)&self->_flags |= 0x20u;
  }
LABEL_15:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
