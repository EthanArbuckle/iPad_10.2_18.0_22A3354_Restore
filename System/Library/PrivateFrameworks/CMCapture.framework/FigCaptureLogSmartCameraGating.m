@implementation FigCaptureLogSmartCameraGating

- (FigCaptureLogSmartCameraGating)initWithGateIdentifier:(int)a3
{
  FigCaptureLogSmartCameraGating *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureLogSmartCameraGating;
  result = -[FigCaptureLogSmartCameraGating init](&v5, sel_init);
  if (result)
  {
    result->_gateIdentifier = a3;
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  NSDate *openingTimestamp;
  objc_super v4;

  openingTimestamp = self->_openingTimestamp;
  if (openingTimestamp)
  {
    -[FigCaptureLogSmartCameraGating logGateClosed](self, "logGateClosed");
    openingTimestamp = self->_openingTimestamp;
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureLogSmartCameraGating;
  -[FigCaptureLogSmartCameraGating dealloc](&v4, sel_dealloc);
}

- (void)logGateOpened
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_openingTimestamp = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  self->_currentPresentations = 0;
  *(_QWORD *)&self->_numFrames = 0;
  self->_numClosingFrames = 0;
  *(_QWORD *)&self->_numBoxesPresented = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)logTracksCreated:(int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_numTrackedRegions += a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)logSmartCamIsConfident:(BOOL)a3 presentedIdentifiers:(id)a4 presentedCount:(int)a5
{
  os_unfair_lock_s *p_lock;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a4)
  {
    objc_msgSend(a4, "count");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(a4);
          if (!-[NSSet containsObject:](self->_currentPresentations, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13)))++self->_numBoxesPresented;
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

    self->_currentPresentations = (NSSet *)a4;
  }
  else
  {
    self->_numBoxesPresented += a5;
  }
  ++self->_numFrames;
  if (!a5)
  {
    ++self->_numEmptyFrames;
    if (a3)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (!a3)
LABEL_15:
    ++self->_numClosingFrames;
LABEL_16:
  os_unfair_lock_unlock(p_lock);
}

- (void)logGateClosed
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  NSDate *openingTimestamp;
  _QWORD v6[8];
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_openingTimestamp)
  {
    v6[0] = CFSTR("GateID");
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_gateIdentifier);
    openingTimestamp = self->_openingTimestamp;
    v7[0] = v4;
    v7[1] = openingTimestamp;
    v6[1] = CFSTR("timestamp");
    v6[2] = CFSTR("timestampEnd");
    v7[2] = objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6[3] = CFSTR("NumFrames");
    v7[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numFrames);
    v6[4] = CFSTR("NumTrackedRegions");
    v7[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numTrackedRegions);
    v6[5] = CFSTR("NumBoxesPresented");
    v7[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numBoxesPresented);
    v6[6] = CFSTR("NumEmptyFrames");
    v7[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numEmptyFrames);
    v6[7] = CFSTR("NumClosingFrames");
    v7[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numClosingFrames);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 8);
    PLLogRegisteredEvent();

    self->_openingTimestamp = 0;
    self->_currentPresentations = 0;
  }
  else
  {
    FigDebugAssert3();
  }
  os_unfair_lock_unlock(p_lock);
}

@end
