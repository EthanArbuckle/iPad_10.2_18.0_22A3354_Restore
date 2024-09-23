@implementation GEOTrafficBannerText

- (GEOTrafficBannerText)init
{
  GEOTrafficBannerText *v2;
  GEOTrafficBannerText *v3;
  GEOTrafficBannerText *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTrafficBannerText;
  v2 = -[GEOTrafficBannerText init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTrafficBannerText)initWithData:(id)a3
{
  GEOTrafficBannerText *v3;
  GEOTrafficBannerText *v4;
  GEOTrafficBannerText *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTrafficBannerText;
  v3 = -[GEOTrafficBannerText initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocalizedIncidentBanners
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 215) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedIncidentBanners_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)localizedIncidentBanners
{
  -[GEOTrafficBannerText _readLocalizedIncidentBanners]((uint64_t)self);
  return self->_localizedIncidentBanners;
}

- (void)setLocalizedIncidentBanners:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizedIncidentBanners;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  localizedIncidentBanners = self->_localizedIncidentBanners;
  self->_localizedIncidentBanners = v4;

}

- (void)clearLocalizedIncidentBanners
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_localizedIncidentBanners, "removeAllObjects");
}

- (void)addLocalizedIncidentBanner:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTrafficBannerText _readLocalizedIncidentBanners]((uint64_t)self);
  -[GEOTrafficBannerText _addNoFlagsLocalizedIncidentBanner:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsLocalizedIncidentBanner:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)localizedIncidentBannersCount
{
  -[GEOTrafficBannerText _readLocalizedIncidentBanners]((uint64_t)self);
  return -[NSMutableArray count](self->_localizedIncidentBanners, "count");
}

- (id)localizedIncidentBannerAtIndex:(unint64_t)a3
{
  -[GEOTrafficBannerText _readLocalizedIncidentBanners]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizedIncidentBanners, "objectAtIndex:", a3);
}

+ (Class)localizedIncidentBannerType
{
  return (Class)objc_opt_class();
}

- (void)_readLocalizedIncidentSubBanners
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 215) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedIncidentSubBanners_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)localizedIncidentSubBanners
{
  -[GEOTrafficBannerText _readLocalizedIncidentSubBanners]((uint64_t)self);
  return self->_localizedIncidentSubBanners;
}

- (void)setLocalizedIncidentSubBanners:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizedIncidentSubBanners;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  localizedIncidentSubBanners = self->_localizedIncidentSubBanners;
  self->_localizedIncidentSubBanners = v4;

}

- (void)clearLocalizedIncidentSubBanners
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_localizedIncidentSubBanners, "removeAllObjects");
}

- (void)addLocalizedIncidentSubBanner:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTrafficBannerText _readLocalizedIncidentSubBanners]((uint64_t)self);
  -[GEOTrafficBannerText _addNoFlagsLocalizedIncidentSubBanner:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsLocalizedIncidentSubBanner:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)localizedIncidentSubBannersCount
{
  -[GEOTrafficBannerText _readLocalizedIncidentSubBanners]((uint64_t)self);
  return -[NSMutableArray count](self->_localizedIncidentSubBanners, "count");
}

- (id)localizedIncidentSubBannerAtIndex:(unint64_t)a3
{
  -[GEOTrafficBannerText _readLocalizedIncidentSubBanners]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizedIncidentSubBanners, "objectAtIndex:", a3);
}

+ (Class)localizedIncidentSubBannerType
{
  return (Class)objc_opt_class();
}

- (void)_readLocalizedIncidentSpokenTexts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 215) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedIncidentSpokenTexts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)localizedIncidentSpokenTexts
{
  -[GEOTrafficBannerText _readLocalizedIncidentSpokenTexts]((uint64_t)self);
  return self->_localizedIncidentSpokenTexts;
}

- (void)setLocalizedIncidentSpokenTexts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizedIncidentSpokenTexts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  localizedIncidentSpokenTexts = self->_localizedIncidentSpokenTexts;
  self->_localizedIncidentSpokenTexts = v4;

}

- (void)clearLocalizedIncidentSpokenTexts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_localizedIncidentSpokenTexts, "removeAllObjects");
}

- (void)addLocalizedIncidentSpokenText:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTrafficBannerText _readLocalizedIncidentSpokenTexts]((uint64_t)self);
  -[GEOTrafficBannerText _addNoFlagsLocalizedIncidentSpokenText:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsLocalizedIncidentSpokenText:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)localizedIncidentSpokenTextsCount
{
  -[GEOTrafficBannerText _readLocalizedIncidentSpokenTexts]((uint64_t)self);
  return -[NSMutableArray count](self->_localizedIncidentSpokenTexts, "count");
}

- (id)localizedIncidentSpokenTextAtIndex:(unint64_t)a3
{
  -[GEOTrafficBannerText _readLocalizedIncidentSpokenTexts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizedIncidentSpokenTexts, "objectAtIndex:", a3);
}

+ (Class)localizedIncidentSpokenTextType
{
  return (Class)objc_opt_class();
}

- (void)_readBannerLargeText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 214) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBannerLargeText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasBannerLargeText
{
  -[GEOTrafficBannerText _readBannerLargeText]((uint64_t)self);
  return self->_bannerLargeText != 0;
}

- (GEOFormattedString)bannerLargeText
{
  -[GEOTrafficBannerText _readBannerLargeText]((uint64_t)self);
  return self->_bannerLargeText;
}

- (void)setBannerLargeText:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200400000uLL;
  objc_storeStrong((id *)&self->_bannerLargeText, a3);
}

- (void)_readBannerSmallText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 214) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBannerSmallText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasBannerSmallText
{
  -[GEOTrafficBannerText _readBannerSmallText]((uint64_t)self);
  return self->_bannerSmallText != 0;
}

- (GEOFormattedString)bannerSmallText
{
  -[GEOTrafficBannerText _readBannerSmallText]((uint64_t)self);
  return self->_bannerSmallText;
}

- (void)setBannerSmallText:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200800000uLL;
  objc_storeStrong((id *)&self->_bannerSmallText, a3);
}

- (void)_readSpokenPrompt
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 215) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenPrompt_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasSpokenPrompt
{
  -[GEOTrafficBannerText _readSpokenPrompt]((uint64_t)self);
  return self->_spokenPrompt != 0;
}

- (GEOFormattedString)spokenPrompt
{
  -[GEOTrafficBannerText _readSpokenPrompt]((uint64_t)self);
  return self->_spokenPrompt;
}

- (void)setSpokenPrompt:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x280000000uLL;
  objc_storeStrong((id *)&self->_spokenPrompt, a3);
}

- (unsigned)showAtDistance
{
  return self->_showAtDistance;
}

- (void)setShowAtDistance:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000800uLL;
  self->_showAtDistance = a3;
}

- (void)setHasShowAtDistance:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000800;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasShowAtDistance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (unsigned)hideAtDistance
{
  return self->_hideAtDistance;
}

- (void)setHideAtDistance:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000008uLL;
  self->_hideAtDistance = a3;
}

- (void)setHasHideAtDistance:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000008;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasHideAtDistance
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)incidentDistance
{
  return self->_incidentDistance;
}

- (void)setIncidentDistance:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000010uLL;
  self->_incidentDistance = a3;
}

- (void)setHasIncidentDistance:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000010;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasIncidentDistance
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)incidentIndex
{
  return self->_incidentIndex;
}

- (void)setIncidentIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000020uLL;
  self->_incidentIndex = a3;
}

- (void)setHasIncidentIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000020;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasIncidentIndex
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readCameraInput
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 215) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCameraInput_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasCameraInput
{
  -[GEOTrafficBannerText _readCameraInput]((uint64_t)self);
  return self->_cameraInput != 0;
}

- (GEOCameraInput)cameraInput
{
  -[GEOTrafficBannerText _readCameraInput]((uint64_t)self);
  return self->_cameraInput;
}

- (void)setCameraInput:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x202000000uLL;
  objc_storeStrong((id *)&self->_cameraInput, a3);
}

- (void)_readTriggerRange
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 216) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTriggerRange_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasTriggerRange
{
  -[GEOTrafficBannerText _readTriggerRange]((uint64_t)self);
  return self->_triggerRange != 0;
}

- (GEOTriggerPointRange)triggerRange
{
  -[GEOTrafficBannerText _readTriggerRange]((uint64_t)self);
  return self->_triggerRange;
}

- (void)setTriggerRange:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x300000000uLL;
  objc_storeStrong((id *)&self->_triggerRange, a3);
}

- (void)_readProgressBarRange
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 215) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProgressBarRange_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasProgressBarRange
{
  -[GEOTrafficBannerText _readProgressBarRange]((uint64_t)self);
  return self->_progressBarRange != 0;
}

- (GEOTriggerPointRange)progressBarRange
{
  -[GEOTrafficBannerText _readProgressBarRange]((uint64_t)self);
  return self->_progressBarRange;
}

- (void)setProgressBarRange:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x240000000uLL;
  objc_storeStrong((id *)&self->_progressBarRange, a3);
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000200uLL;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000200;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasPriority
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (unsigned)minDisplayTime
{
  return self->_minDisplayTime;
}

- (void)setMinDisplayTime:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000040uLL;
  self->_minDisplayTime = a3;
}

- (void)setHasMinDisplayTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000040;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasMinDisplayTime
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (unsigned)overlapDelayTime
{
  return self->_overlapDelayTime;
}

- (void)setOverlapDelayTime:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000080uLL;
  self->_overlapDelayTime = a3;
}

- (void)setHasOverlapDelayTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000080;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasOverlapDelayTime
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)previousBannerChange
{
  os_unfair_lock_s *p_readerLock;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0)
    return self->_previousBannerChange;
  else
    return 0;
}

- (void)setPreviousBannerChange:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000100uLL;
  self->_previousBannerChange = a3;
}

- (void)setHasPreviousBannerChange:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000100;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasPreviousBannerChange
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (id)previousBannerChangeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C086F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreviousBannerChange:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_NEXT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REPLACE_IMMEDIATELY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UPDATE_IN_PLACE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REMOVE_BANNER")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)disableFasterRerouteByDefault
{
  os_unfair_lock_s *p_readerLock;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x4000) == 0 || self->_disableFasterRerouteByDefault;
}

- (void)setDisableFasterRerouteByDefault:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200004000uLL;
  self->_disableFasterRerouteByDefault = a3;
}

- (void)setHasDisableFasterRerouteByDefault:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200004000;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDisableFasterRerouteByDefault
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)bannerStyle
{
  os_unfair_lock_s *p_readerLock;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_bannerStyle;
  else
    return 0;
}

- (void)setBannerStyle:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000002uLL;
  self->_bannerStyle = a3;
}

- (void)setHasBannerStyle:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000002;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFDLL | v3);
}

- (BOOL)hasBannerStyle
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)bannerStyleAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C08718[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBannerStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_STYLE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_STYLE_FASTER_ROUTE_AVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_STYLE_INCIDENT_AHEAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_STYLE_ROUTE_INVALIDATED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_STYLE_SUGGEST_NEW_ROUTE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_STYLE_REROUTE_ALERT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_STYLE_WARNING")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_STYLE_SILENT_UPDATE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)secondsSaved
{
  return self->_secondsSaved;
}

- (void)setSecondsSaved:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000400uLL;
  self->_secondsSaved = a3;
}

- (void)setHasSecondsSaved:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000400;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasSecondsSaved
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readButtons
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 215) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readButtons_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)buttons
{
  -[GEOTrafficBannerText _readButtons]((uint64_t)self);
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *buttons;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  buttons = self->_buttons;
  self->_buttons = v4;

}

- (void)clearButtons
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_buttons, "removeAllObjects");
}

- (void)addButton:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTrafficBannerText _readButtons]((uint64_t)self);
  -[GEOTrafficBannerText _addNoFlagsButton:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsButton:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)buttonsCount
{
  -[GEOTrafficBannerText _readButtons]((uint64_t)self);
  return -[NSMutableArray count](self->_buttons, "count");
}

- (id)buttonAtIndex:(unint64_t)a3
{
  -[GEOTrafficBannerText _readButtons]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_buttons, "objectAtIndex:", a3);
}

+ (Class)buttonType
{
  return (Class)objc_opt_class();
}

- (int)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000004uLL;
  self->_defaultButtonIndex = a3;
}

- (void)setHasDefaultButtonIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000004;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDefaultButtonIndex
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)alertDurationSeconds
{
  os_unfair_lock_s *p_readerLock;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 1) != 0)
    return self->_alertDurationSeconds;
  else
    return 20;
}

- (void)setAlertDurationSeconds:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000001uLL;
  self->_alertDurationSeconds = a3;
}

- (void)setHasAlertDurationSeconds:(BOOL)a3
{
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x200000000);
}

- (BOOL)hasAlertDurationSeconds
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)shouldShowTimer
{
  os_unfair_lock_s *p_readerLock;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x10000) == 0 || self->_shouldShowTimer;
}

- (void)setShouldShowTimer:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200010000uLL;
  self->_shouldShowTimer = a3;
}

- (void)setHasShouldShowTimer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200010000;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasShouldShowTimer
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200001000uLL;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200001000;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasZilchPathIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readBannerDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 214) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBannerDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasBannerDescription
{
  -[GEOTrafficBannerText _readBannerDescription]((uint64_t)self);
  return self->_bannerDescription != 0;
}

- (GEOFormattedString)bannerDescription
{
  -[GEOTrafficBannerText _readBannerDescription]((uint64_t)self);
  return self->_bannerDescription;
}

- (void)setBannerDescription:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200100000uLL;
  objc_storeStrong((id *)&self->_bannerDescription, a3);
}

- (void)_readBannerId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 214) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBannerId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasBannerId
{
  -[GEOTrafficBannerText _readBannerId]((uint64_t)self);
  return self->_bannerId != 0;
}

- (NSString)bannerId
{
  -[GEOTrafficBannerText _readBannerId]((uint64_t)self);
  return self->_bannerId;
}

- (void)setBannerId:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200200000uLL;
  objc_storeStrong((id *)&self->_bannerId, a3);
}

- (BOOL)defaultToNewRoute
{
  os_unfair_lock_s *p_readerLock;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x2000) == 0 || self->_defaultToNewRoute;
}

- (void)setDefaultToNewRoute:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200002000uLL;
  self->_defaultToNewRoute = a3;
}

- (void)setHasDefaultToNewRoute:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200002000;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDefaultToNewRoute
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readAnalyticsMessageValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 214) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticsMessageValue_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasAnalyticsMessageValue
{
  -[GEOTrafficBannerText _readAnalyticsMessageValue]((uint64_t)self);
  return self->_analyticsMessageValue != 0;
}

- (NSString)analyticsMessageValue
{
  -[GEOTrafficBannerText _readAnalyticsMessageValue]((uint64_t)self);
  return self->_analyticsMessageValue;
}

- (void)setAnalyticsMessageValue:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200040000uLL;
  objc_storeStrong((id *)&self->_analyticsMessageValue, a3);
}

- (void)_readArtworkOverride
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 214) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtworkOverride_tags_6346);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasArtworkOverride
{
  -[GEOTrafficBannerText _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOTrafficBannerText _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200080000uLL;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (BOOL)preserveBannerInUpdates
{
  os_unfair_lock_s *p_readerLock;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x8000) != 0 && self->_preserveBannerInUpdates;
}

- (void)setPreserveBannerInUpdates:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200008000uLL;
  self->_preserveBannerInUpdates = a3;
}

- (void)setHasPreserveBannerInUpdates:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200008000;
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasPreserveBannerInUpdates
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (void)_readEventInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(_BYTE *)(a1 + 215) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasEventInfo
{
  -[GEOTrafficBannerText _readEventInfo]((uint64_t)self);
  return self->_eventInfo != 0;
}

- (NSData)eventInfo
{
  -[GEOTrafficBannerText _readEventInfo]((uint64_t)self);
  return self->_eventInfo;
}

- (void)setEventInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x204000000uLL;
  objc_storeStrong((id *)&self->_eventInfo, a3);
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
  v8.super_class = (Class)GEOTrafficBannerText;
  -[GEOTrafficBannerText description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTrafficBannerText dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficBannerText _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  id v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  uint64_t v73;
  __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  id v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  id v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  const __CFString *v106;
  void *v107;
  uint64_t v108;
  __CFString *v109;
  const __CFString *v110;
  _QWORD v111[4];
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 96))
  {
    objc_msgSend((id)a1, "localizedIncidentBanners");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("localizedIncidentBanner");
    else
      v6 = CFSTR("localized_incident_banner");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 112))
  {
    objc_msgSend((id)a1, "localizedIncidentSubBanners");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("localizedIncidentSubBanner");
    else
      v8 = CFSTR("localized_incident_sub_banner");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend((id)a1, "localizedIncidentSpokenTexts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("localizedIncidentSpokenText");
    else
      v10 = CFSTR("localized_incident_spoken_text");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "bannerLargeText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("bannerLargeText");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("banner_large_text");
    }
    v15 = v13;

    objc_msgSend(v4, "setObject:forKey:", v15, v14);
  }

  objc_msgSend((id)a1, "bannerSmallText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("bannerSmallText");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("banner_small_text");
    }
    v20 = v18;

    objc_msgSend(v4, "setObject:forKey:", v20, v19);
  }

  objc_msgSend((id)a1, "spokenPrompt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("spokenPrompt");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("spoken_prompt");
    }
    v25 = v23;

    objc_msgSend(v4, "setObject:forKey:", v25, v24);
  }

  v26 = *(_QWORD *)(a1 + 212);
  if ((v26 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 200));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v34 = CFSTR("showAtDistance");
    else
      v34 = CFSTR("show_at_distance");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

    v26 = *(_QWORD *)(a1 + 212);
    if ((v26 & 8) == 0)
    {
LABEL_34:
      if ((v26 & 0x10) == 0)
        goto LABEL_35;
      goto LABEL_51;
    }
  }
  else if ((v26 & 8) == 0)
  {
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 168));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v36 = CFSTR("hideAtDistance");
  else
    v36 = CFSTR("hide_at_distance");
  objc_msgSend(v4, "setObject:forKey:", v35, v36);

  v26 = *(_QWORD *)(a1 + 212);
  if ((v26 & 0x10) == 0)
  {
LABEL_35:
    if ((v26 & 0x20) == 0)
      goto LABEL_40;
    goto LABEL_36;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 172));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v38 = CFSTR("incidentDistance");
  else
    v38 = CFSTR("incident_distance");
  objc_msgSend(v4, "setObject:forKey:", v37, v38);

  if ((*(_QWORD *)(a1 + 212) & 0x20) != 0)
  {
LABEL_36:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 176));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("incidentIndex");
    else
      v28 = CFSTR("incident_index");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
LABEL_40:
  objc_msgSend((id)a1, "cameraInput");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("cameraInput");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("camera_input");
    }
    v39 = v31;

    objc_msgSend(v4, "setObject:forKey:", v39, v32);
  }

  objc_msgSend((id)a1, "triggerRange");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v40, "jsonRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("triggerRange");
    }
    else
    {
      objc_msgSend(v40, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("trigger_range");
    }
    v44 = v42;

    objc_msgSend(v4, "setObject:forKey:", v44, v43);
  }

  objc_msgSend((id)a1, "progressBarRange");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v45, "jsonRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("progressBarRange");
    }
    else
    {
      objc_msgSend(v45, "dictionaryRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("progress_bar_range");
    }
    v49 = v47;

    objc_msgSend(v4, "setObject:forKey:", v49, v48);
  }

  v50 = *(_QWORD *)(a1 + 212);
  if ((v50 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 192));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("priority"));

    v50 = *(_QWORD *)(a1 + 212);
    if ((v50 & 0x40) == 0)
    {
LABEL_70:
      if ((v50 & 0x80) == 0)
        goto LABEL_71;
      goto LABEL_107;
    }
  }
  else if ((v50 & 0x40) == 0)
  {
    goto LABEL_70;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 180));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v70 = CFSTR("minDisplayTime");
  else
    v70 = CFSTR("min_display_time");
  objc_msgSend(v4, "setObject:forKey:", v69, v70);

  v50 = *(_QWORD *)(a1 + 212);
  if ((v50 & 0x80) == 0)
  {
LABEL_71:
    if ((v50 & 0x100) == 0)
      goto LABEL_72;
    goto LABEL_111;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 184));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v72 = CFSTR("overlapDelayTime");
  else
    v72 = CFSTR("overlap_delay_time");
  objc_msgSend(v4, "setObject:forKey:", v71, v72);

  v50 = *(_QWORD *)(a1 + 212);
  if ((v50 & 0x100) == 0)
  {
LABEL_72:
    if ((v50 & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_167;
  }
LABEL_111:
  v73 = *(int *)(a1 + 188);
  if (v73 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 188));
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = off_1E1C086F8[v73];
  }
  if (a2)
    v106 = CFSTR("previousBannerChange");
  else
    v106 = CFSTR("previous_banner_change");
  objc_msgSend(v4, "setObject:forKey:", v74, v106);

  v50 = *(_QWORD *)(a1 + 212);
  if ((v50 & 0x4000) == 0)
  {
LABEL_73:
    if ((v50 & 2) == 0)
      goto LABEL_74;
    goto LABEL_168;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 209));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v107, CFSTR("disableFasterRerouteByDefault"));

  v50 = *(_QWORD *)(a1 + 212);
  if ((v50 & 2) == 0)
  {
LABEL_74:
    if ((v50 & 0x400) == 0)
      goto LABEL_79;
    goto LABEL_75;
  }
LABEL_168:
  v108 = *(int *)(a1 + 160);
  if (v108 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 160));
    v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v109 = off_1E1C08718[v108];
  }
  if (a2)
    v110 = CFSTR("bannerStyle");
  else
    v110 = CFSTR("banner_style");
  objc_msgSend(v4, "setObject:forKey:", v109, v110);

  if ((*(_QWORD *)(a1 + 212) & 0x400) != 0)
  {
LABEL_75:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 196));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v52 = CFSTR("secondsSaved");
    else
      v52 = CFSTR("seconds_saved");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

  }
LABEL_79:
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v54 = *(id *)(a1 + 72);
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v114;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v114 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v59, "jsonRepresentation");
          else
            objc_msgSend(v59, "dictionaryRepresentation");
          v60 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v53, "addObject:", v60);
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
      }
      while (v56);
    }

    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("button"));
  }
  v61 = *(_QWORD *)(a1 + 212);
  if ((v61 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 164));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v76 = CFSTR("defaultButtonIndex");
    else
      v76 = CFSTR("default_button_index");
    objc_msgSend(v4, "setObject:forKey:", v75, v76);

    v61 = *(_QWORD *)(a1 + 212);
    if ((v61 & 1) == 0)
    {
LABEL_93:
      if ((v61 & 0x10000) == 0)
        goto LABEL_94;
LABEL_121:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 211));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v80 = CFSTR("shouldShowTimer");
      else
        v80 = CFSTR("should_show_timer");
      objc_msgSend(v4, "setObject:forKey:", v79, v80);

      if ((*(_QWORD *)(a1 + 212) & 0x1000) == 0)
        goto LABEL_99;
      goto LABEL_95;
    }
  }
  else if ((v61 & 1) == 0)
  {
    goto LABEL_93;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 156));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v78 = CFSTR("alertDurationSeconds");
  else
    v78 = CFSTR("alert_duration_seconds");
  objc_msgSend(v4, "setObject:forKey:", v77, v78);

  v61 = *(_QWORD *)(a1 + 212);
  if ((v61 & 0x10000) != 0)
    goto LABEL_121;
LABEL_94:
  if ((v61 & 0x1000) != 0)
  {
LABEL_95:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 204));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v63 = CFSTR("zilchPathIndex");
    else
      v63 = CFSTR("zilch_path_index");
    objc_msgSend(v4, "setObject:forKey:", v62, v63);

  }
LABEL_99:
  objc_msgSend((id)a1, "bannerDescription");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v64, "jsonRepresentation");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = CFSTR("bannerDescription");
    }
    else
    {
      objc_msgSend(v64, "dictionaryRepresentation");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = CFSTR("banner_description");
    }
    v81 = v66;

    objc_msgSend(v4, "setObject:forKey:", v81, v67);
  }

  objc_msgSend((id)a1, "bannerId");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    if (a2)
      v83 = CFSTR("bannerId");
    else
      v83 = CFSTR("banner_id");
    objc_msgSend(v4, "setObject:forKey:", v82, v83);
  }

  if ((*(_BYTE *)(a1 + 213) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 208));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v85 = CFSTR("defaultToNewRoute");
    else
      v85 = CFSTR("default_to_new_route");
    objc_msgSend(v4, "setObject:forKey:", v84, v85);

  }
  objc_msgSend((id)a1, "analyticsMessageValue");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    if (a2)
      v87 = CFSTR("analyticsMessageValue");
    else
      v87 = CFSTR("analytics_message_value");
    objc_msgSend(v4, "setObject:forKey:", v86, v87);
  }

  objc_msgSend((id)a1, "artworkOverride");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88;
  if (v88)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v88, "jsonRepresentation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("artworkOverride");
    }
    else
    {
      objc_msgSend(v88, "dictionaryRepresentation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("artwork_override");
    }
    v92 = v90;

    objc_msgSend(v4, "setObject:forKey:", v92, v91);
  }

  if ((*(_BYTE *)(a1 + 213) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 210));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v94 = CFSTR("preserveBannerInUpdates");
    else
      v94 = CFSTR("preserve_banner_in_updates");
    objc_msgSend(v4, "setObject:forKey:", v93, v94);

  }
  objc_msgSend((id)a1, "eventInfo");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v95;
  if (v95)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v95, "base64EncodedStringWithOptions:", 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v97, CFSTR("eventInfo"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v95, CFSTR("event_info"));
    }
  }

  v98 = *(void **)(a1 + 16);
  if (v98)
  {
    objc_msgSend(v98, "dictionaryRepresentation");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v99;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v99, "count"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __50__GEOTrafficBannerText__dictionaryRepresentation___block_invoke;
      v111[3] = &unk_1E1C00600;
      v102 = v101;
      v112 = v102;
      objc_msgSend(v100, "enumerateKeysAndObjectsUsingBlock:", v111);
      v103 = v102;

      v100 = v103;
    }
    objc_msgSend(v4, "setObject:forKey:", v100, CFSTR("Unknown Fields"));

  }
  v104 = v4;

  return v104;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficBannerText _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOTrafficBannerText__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOTrafficBannerText)initWithDictionary:(id)a3
{
  return (GEOTrafficBannerText *)-[GEOTrafficBannerText _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
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
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  GEOFormattedString *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  GEOFormattedString *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  GEOFormattedString *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  GEOCameraInput *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  GEOTriggerPointRange *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  GEOTriggerPointRange *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  id v78;
  uint64_t v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  id v83;
  uint64_t v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t m;
  uint64_t v93;
  GEOTrafficBannerTextButton *v94;
  uint64_t v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  GEOFormattedString *v107;
  uint64_t v108;
  void *v109;
  const __CFString *v110;
  void *v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  GEOPBTransitArtwork *v120;
  uint64_t v121;
  void *v122;
  const __CFString *v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  void *v127;
  void *v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_250;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_250;
  if (a3)
    v6 = CFSTR("localizedIncidentBanner");
  else
    v6 = CFSTR("localized_incident_banner");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v143, v150, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v144;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v144 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (void *)objc_msgSend(v13, "copy");
            objc_msgSend(a1, "addLocalizedIncidentBanner:", v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v143, v150, 16);
      }
      while (v10);
    }

  }
  if (a3)
    v15 = CFSTR("localizedIncidentSubBanner");
  else
    v15 = CFSTR("localized_incident_sub_banner");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v139, v149, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v140;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v140 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = (void *)objc_msgSend(v22, "copy");
            objc_msgSend(a1, "addLocalizedIncidentSubBanner:", v23);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v139, v149, 16);
      }
      while (v19);
    }

  }
  if (a3)
    v24 = CFSTR("localizedIncidentSpokenText");
  else
    v24 = CFSTR("localized_incident_spoken_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v136;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v136 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = (void *)objc_msgSend(v31, "copy");
            objc_msgSend(a1, "addLocalizedIncidentSpokenText:", v32);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
      }
      while (v28);
    }

  }
  if (a3)
    v33 = CFSTR("bannerLargeText");
  else
    v33 = CFSTR("banner_large_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = [GEOFormattedString alloc];
    if ((a3 & 1) != 0)
      v36 = -[GEOFormattedString initWithJSON:](v35, "initWithJSON:", v34);
    else
      v36 = -[GEOFormattedString initWithDictionary:](v35, "initWithDictionary:", v34);
    v37 = (void *)v36;
    objc_msgSend(a1, "setBannerLargeText:", v36);

  }
  if (a3)
    v38 = CFSTR("bannerSmallText");
  else
    v38 = CFSTR("banner_small_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = [GEOFormattedString alloc];
    if ((a3 & 1) != 0)
      v41 = -[GEOFormattedString initWithJSON:](v40, "initWithJSON:", v39);
    else
      v41 = -[GEOFormattedString initWithDictionary:](v40, "initWithDictionary:", v39);
    v42 = (void *)v41;
    objc_msgSend(a1, "setBannerSmallText:", v41);

  }
  if (a3)
    v43 = CFSTR("spokenPrompt");
  else
    v43 = CFSTR("spoken_prompt");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = [GEOFormattedString alloc];
    if ((a3 & 1) != 0)
      v46 = -[GEOFormattedString initWithJSON:](v45, "initWithJSON:", v44);
    else
      v46 = -[GEOFormattedString initWithDictionary:](v45, "initWithDictionary:", v44);
    v47 = (void *)v46;
    objc_msgSend(a1, "setSpokenPrompt:", v46);

  }
  if (a3)
    v48 = CFSTR("showAtDistance");
  else
    v48 = CFSTR("show_at_distance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShowAtDistance:", objc_msgSend(v49, "unsignedIntValue"));

  if (a3)
    v50 = CFSTR("hideAtDistance");
  else
    v50 = CFSTR("hide_at_distance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHideAtDistance:", objc_msgSend(v51, "unsignedIntValue"));

  if (a3)
    v52 = CFSTR("incidentDistance");
  else
    v52 = CFSTR("incident_distance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncidentDistance:", objc_msgSend(v53, "unsignedIntValue"));

  if (a3)
    v54 = CFSTR("incidentIndex");
  else
    v54 = CFSTR("incident_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncidentIndex:", objc_msgSend(v55, "unsignedIntValue"));

  if (a3)
    v56 = CFSTR("cameraInput");
  else
    v56 = CFSTR("camera_input");
  objc_msgSend(v5, "objectForKeyedSubscript:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = [GEOCameraInput alloc];
    if ((a3 & 1) != 0)
      v59 = -[GEOCameraInput initWithJSON:](v58, "initWithJSON:", v57);
    else
      v59 = -[GEOCameraInput initWithDictionary:](v58, "initWithDictionary:", v57);
    v60 = (void *)v59;
    objc_msgSend(a1, "setCameraInput:", v59);

  }
  if (a3)
    v61 = CFSTR("triggerRange");
  else
    v61 = CFSTR("trigger_range");
  objc_msgSend(v5, "objectForKeyedSubscript:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = [GEOTriggerPointRange alloc];
    if ((a3 & 1) != 0)
      v64 = -[GEOTriggerPointRange initWithJSON:](v63, "initWithJSON:", v62);
    else
      v64 = -[GEOTriggerPointRange initWithDictionary:](v63, "initWithDictionary:", v62);
    v65 = (void *)v64;
    objc_msgSend(a1, "setTriggerRange:", v64);

  }
  if (a3)
    v66 = CFSTR("progressBarRange");
  else
    v66 = CFSTR("progress_bar_range");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = [GEOTriggerPointRange alloc];
    if ((a3 & 1) != 0)
      v69 = -[GEOTriggerPointRange initWithJSON:](v68, "initWithJSON:", v67);
    else
      v69 = -[GEOTriggerPointRange initWithDictionary:](v68, "initWithDictionary:", v67);
    v70 = (void *)v69;
    objc_msgSend(a1, "setProgressBarRange:", v69);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priority"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPriority:", objc_msgSend(v71, "unsignedIntValue"));

  if (a3)
    v72 = CFSTR("minDisplayTime");
  else
    v72 = CFSTR("min_display_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMinDisplayTime:", objc_msgSend(v73, "unsignedIntValue"));

  if (a3)
    v74 = CFSTR("overlapDelayTime");
  else
    v74 = CFSTR("overlap_delay_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOverlapDelayTime:", objc_msgSend(v75, "unsignedIntValue"));

  if (a3)
    v76 = CFSTR("previousBannerChange");
  else
    v76 = CFSTR("previous_banner_change");
  objc_msgSend(v5, "objectForKeyedSubscript:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v78 = v77;
    if ((objc_msgSend(v78, "isEqualToString:", CFSTR("SHOW_NEXT")) & 1) != 0)
    {
      v79 = 0;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("REPLACE_IMMEDIATELY")) & 1) != 0)
    {
      v79 = 1;
    }
    else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("UPDATE_IN_PLACE")) & 1) != 0)
    {
      v79 = 2;
    }
    else if (objc_msgSend(v78, "isEqualToString:", CFSTR("REMOVE_BANNER")))
    {
      v79 = 3;
    }
    else
    {
      v79 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_142;
    v79 = objc_msgSend(v77, "intValue");
  }
  objc_msgSend(a1, "setPreviousBannerChange:", v79);
LABEL_142:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("disableFasterRerouteByDefault"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDisableFasterRerouteByDefault:", objc_msgSend(v80, "BOOLValue"));

  if (a3)
    v81 = CFSTR("bannerStyle");
  else
    v81 = CFSTR("banner_style");
  objc_msgSend(v5, "objectForKeyedSubscript:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v83 = v82;
    if ((objc_msgSend(v83, "isEqualToString:", CFSTR("BANNER_STYLE_UNKNOWN")) & 1) != 0)
    {
      v84 = 0;
    }
    else if ((objc_msgSend(v83, "isEqualToString:", CFSTR("BANNER_STYLE_FASTER_ROUTE_AVAILABLE")) & 1) != 0)
    {
      v84 = 1;
    }
    else if ((objc_msgSend(v83, "isEqualToString:", CFSTR("BANNER_STYLE_INCIDENT_AHEAD")) & 1) != 0)
    {
      v84 = 2;
    }
    else if ((objc_msgSend(v83, "isEqualToString:", CFSTR("BANNER_STYLE_ROUTE_INVALIDATED")) & 1) != 0)
    {
      v84 = 3;
    }
    else if ((objc_msgSend(v83, "isEqualToString:", CFSTR("BANNER_STYLE_SUGGEST_NEW_ROUTE")) & 1) != 0)
    {
      v84 = 4;
    }
    else if ((objc_msgSend(v83, "isEqualToString:", CFSTR("BANNER_STYLE_REROUTE_ALERT")) & 1) != 0)
    {
      v84 = 5;
    }
    else if ((objc_msgSend(v83, "isEqualToString:", CFSTR("BANNER_STYLE_WARNING")) & 1) != 0)
    {
      v84 = 6;
    }
    else if (objc_msgSend(v83, "isEqualToString:", CFSTR("BANNER_STYLE_SILENT_UPDATE")))
    {
      v84 = 7;
    }
    else
    {
      v84 = 0;
    }

    goto LABEL_168;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v84 = objc_msgSend(v82, "intValue");
LABEL_168:
    objc_msgSend(a1, "setBannerStyle:", v84);
  }

  if (a3)
    v85 = CFSTR("secondsSaved");
  else
    v85 = CFSTR("seconds_saved");
  objc_msgSend(v5, "objectForKeyedSubscript:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSecondsSaved:", objc_msgSend(v86, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("button"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v129 = v87;
    v130 = v5;
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v88 = v87;
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v132;
      do
      {
        for (m = 0; m != v90; ++m)
        {
          if (*(_QWORD *)v132 != v91)
            objc_enumerationMutation(v88);
          v93 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v94 = [GEOTrafficBannerTextButton alloc];
            if ((a3 & 1) != 0)
              v95 = -[GEOTrafficBannerTextButton initWithJSON:](v94, "initWithJSON:", v93);
            else
              v95 = -[GEOTrafficBannerTextButton initWithDictionary:](v94, "initWithDictionary:", v93);
            v96 = (void *)v95;
            objc_msgSend(a1, "addButton:", v95, v129, v130, (_QWORD)v131);

          }
        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
      }
      while (v90);
    }

    v87 = v129;
    v5 = v130;
  }

  if (a3)
    v97 = CFSTR("defaultButtonIndex");
  else
    v97 = CFSTR("default_button_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v97, v129, v130);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDefaultButtonIndex:", objc_msgSend(v98, "intValue"));

  if (a3)
    v99 = CFSTR("alertDurationSeconds");
  else
    v99 = CFSTR("alert_duration_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAlertDurationSeconds:", objc_msgSend(v100, "unsignedIntValue"));

  if (a3)
    v101 = CFSTR("shouldShowTimer");
  else
    v101 = CFSTR("should_show_timer");
  objc_msgSend(v5, "objectForKeyedSubscript:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShouldShowTimer:", objc_msgSend(v102, "BOOLValue"));

  if (a3)
    v103 = CFSTR("zilchPathIndex");
  else
    v103 = CFSTR("zilch_path_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v104, "unsignedIntValue"));

  if (a3)
    v105 = CFSTR("bannerDescription");
  else
    v105 = CFSTR("banner_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v107 = [GEOFormattedString alloc];
    if ((a3 & 1) != 0)
      v108 = -[GEOFormattedString initWithJSON:](v107, "initWithJSON:", v106);
    else
      v108 = -[GEOFormattedString initWithDictionary:](v107, "initWithDictionary:", v106);
    v109 = (void *)v108;
    objc_msgSend(a1, "setBannerDescription:", v108);

  }
  if (a3)
    v110 = CFSTR("bannerId");
  else
    v110 = CFSTR("banner_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v112 = (void *)objc_msgSend(v111, "copy");
    objc_msgSend(a1, "setBannerId:", v112);

  }
  if (a3)
    v113 = CFSTR("defaultToNewRoute");
  else
    v113 = CFSTR("default_to_new_route");
  objc_msgSend(v5, "objectForKeyedSubscript:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDefaultToNewRoute:", objc_msgSend(v114, "BOOLValue"));

  if (a3)
    v115 = CFSTR("analyticsMessageValue");
  else
    v115 = CFSTR("analytics_message_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v117 = (void *)objc_msgSend(v116, "copy");
    objc_msgSend(a1, "setAnalyticsMessageValue:", v117);

  }
  if (a3)
    v118 = CFSTR("artworkOverride");
  else
    v118 = CFSTR("artwork_override");
  objc_msgSend(v5, "objectForKeyedSubscript:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v120 = [GEOPBTransitArtwork alloc];
    if ((a3 & 1) != 0)
      v121 = -[GEOPBTransitArtwork initWithJSON:](v120, "initWithJSON:", v119);
    else
      v121 = -[GEOPBTransitArtwork initWithDictionary:](v120, "initWithDictionary:", v119);
    v122 = (void *)v121;
    objc_msgSend(a1, "setArtworkOverride:", v121);

  }
  if (a3)
    v123 = CFSTR("preserveBannerInUpdates");
  else
    v123 = CFSTR("preserve_banner_in_updates");
  objc_msgSend(v5, "objectForKeyedSubscript:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPreserveBannerInUpdates:", objc_msgSend(v124, "BOOLValue"));

  if (a3)
    v125 = CFSTR("eventInfo");
  else
    v125 = CFSTR("event_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v126, 0);
    objc_msgSend(a1, "setEventInfo:", v127);

  }
  a1 = a1;

LABEL_250:
  return a1;
}

- (GEOTrafficBannerText)initWithJSON:(id)a3
{
  return (GEOTrafficBannerText *)-[GEOTrafficBannerText _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6453;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6454;
    GEOTrafficBannerTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTrafficBannerTextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficBannerTextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficBannerTextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v24;
  PBDataReader *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
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
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTrafficBannerTextIsDirty((uint64_t)self) & 1) == 0)
  {
    v25 = self->_reader;
    objc_sync_enter(v25);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v26);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v25);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTrafficBannerText readAll:](self, "readAll:", 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v6 = self->_localizedIncidentBanners;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v40;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v40 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v7);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = self->_localizedIncidentSubBanners;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v36;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v11);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = self->_localizedIncidentSpokenTexts;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteStringField();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v15);
    }

    if (self->_bannerLargeText)
      PBDataWriterWriteSubmessage();
    if (self->_bannerSmallText)
      PBDataWriterWriteSubmessage();
    if (self->_spokenPrompt)
      PBDataWriterWriteSubmessage();
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x20) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_cameraInput)
      PBDataWriterWriteSubmessage();
    if (self->_triggerRange)
      PBDataWriterWriteSubmessage();
    if (self->_progressBarRange)
      PBDataWriterWriteSubmessage();
    v19 = self->_flags;
    if ((*(_WORD *)&v19 & 0x200) != 0)
    {
      PBDataWriterWriteUint32Field();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 0x40) != 0)
    {
      PBDataWriterWriteUint32Field();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 0x80) != 0)
    {
      PBDataWriterWriteUint32Field();
      v19 = self->_flags;
    }
    if ((*(_WORD *)&v19 & 0x100) != 0)
    {
      PBDataWriterWriteInt32Field();
      v19 = self->_flags;
    }
    if ((*(_WORD *)&v19 & 0x4000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v19 = self->_flags;
    }
    if ((*(_WORD *)&v19 & 0x400) != 0)
      PBDataWriterWriteUint32Field();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = self->_buttons;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v20);
          PBDataWriterWriteSubmessage();
          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v21);
    }

    v24 = self->_flags;
    if ((*(_BYTE *)&v24 & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v24 = self->_flags;
    }
    if ((*(_BYTE *)&v24 & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v24 = self->_flags;
    }
    if ((*(_DWORD *)&v24 & 0x10000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v24 = self->_flags;
    }
    if ((*(_WORD *)&v24 & 0x1000) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_bannerDescription)
      PBDataWriterWriteSubmessage();
    if (self->_bannerId)
      PBDataWriterWriteStringField();
    if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_analyticsMessageValue)
      PBDataWriterWriteStringField();
    if (self->_artworkOverride)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_eventInfo)
      PBDataWriterWriteDataField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v27);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOTrafficBannerText _readCameraInput]((uint64_t)self);
  return -[GEOCameraInput hasGreenTeaWithValue:](self->_cameraInput, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  char *v16;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v23;
  char *v24;
  char *v25;

  v25 = (char *)a3;
  -[GEOTrafficBannerText readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v25 + 1, self->_reader);
  *((_DWORD *)v25 + 36) = self->_readerMarkPos;
  *((_DWORD *)v25 + 37) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTrafficBannerText localizedIncidentBannersCount](self, "localizedIncidentBannersCount"))
  {
    objc_msgSend(v25, "clearLocalizedIncidentBanners");
    v4 = -[GEOTrafficBannerText localizedIncidentBannersCount](self, "localizedIncidentBannersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTrafficBannerText localizedIncidentBannerAtIndex:](self, "localizedIncidentBannerAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addLocalizedIncidentBanner:", v7);

      }
    }
  }
  if (-[GEOTrafficBannerText localizedIncidentSubBannersCount](self, "localizedIncidentSubBannersCount"))
  {
    objc_msgSend(v25, "clearLocalizedIncidentSubBanners");
    v8 = -[GEOTrafficBannerText localizedIncidentSubBannersCount](self, "localizedIncidentSubBannersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOTrafficBannerText localizedIncidentSubBannerAtIndex:](self, "localizedIncidentSubBannerAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addLocalizedIncidentSubBanner:", v11);

      }
    }
  }
  if (-[GEOTrafficBannerText localizedIncidentSpokenTextsCount](self, "localizedIncidentSpokenTextsCount"))
  {
    objc_msgSend(v25, "clearLocalizedIncidentSpokenTexts");
    v12 = -[GEOTrafficBannerText localizedIncidentSpokenTextsCount](self, "localizedIncidentSpokenTextsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOTrafficBannerText localizedIncidentSpokenTextAtIndex:](self, "localizedIncidentSpokenTextAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addLocalizedIncidentSpokenText:", v15);

      }
    }
  }
  if (self->_bannerLargeText)
    objc_msgSend(v25, "setBannerLargeText:");
  v16 = v25;
  if (self->_bannerSmallText)
  {
    objc_msgSend(v25, "setBannerSmallText:");
    v16 = v25;
  }
  if (self->_spokenPrompt)
  {
    objc_msgSend(v25, "setSpokenPrompt:");
    v16 = v25;
  }
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    *((_DWORD *)v16 + 50) = self->_showAtDistance;
    *(_QWORD *)(v16 + 212) |= 0x800uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_22;
      goto LABEL_64;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v16 + 42) = self->_hideAtDistance;
  *(_QWORD *)(v16 + 212) |= 8uLL;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_64:
  *((_DWORD *)v16 + 43) = self->_incidentDistance;
  *(_QWORD *)(v16 + 212) |= 0x10uLL;
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_23:
    *((_DWORD *)v16 + 44) = self->_incidentIndex;
    *(_QWORD *)(v16 + 212) |= 0x20uLL;
  }
LABEL_24:
  if (self->_cameraInput)
  {
    objc_msgSend(v25, "setCameraInput:");
    v16 = v25;
  }
  if (self->_triggerRange)
  {
    objc_msgSend(v25, "setTriggerRange:");
    v16 = v25;
  }
  if (self->_progressBarRange)
  {
    objc_msgSend(v25, "setProgressBarRange:");
    v16 = v25;
  }
  v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x200) != 0)
  {
    *((_DWORD *)v16 + 48) = self->_priority;
    *(_QWORD *)(v16 + 212) |= 0x200uLL;
    v18 = self->_flags;
    if ((*(_BYTE *)&v18 & 0x40) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v18 & 0x80) == 0)
        goto LABEL_33;
      goto LABEL_68;
    }
  }
  else if ((*(_BYTE *)&v18 & 0x40) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v16 + 45) = self->_minDisplayTime;
  *(_QWORD *)(v16 + 212) |= 0x40uLL;
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 0x80) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v18 & 0x100) == 0)
      goto LABEL_34;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v16 + 46) = self->_overlapDelayTime;
  *(_QWORD *)(v16 + 212) |= 0x80uLL;
  v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x100) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v18 & 0x4000) == 0)
      goto LABEL_35;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v16 + 47) = self->_previousBannerChange;
  *(_QWORD *)(v16 + 212) |= 0x100uLL;
  v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v18 & 2) == 0)
      goto LABEL_36;
LABEL_71:
    *((_DWORD *)v16 + 40) = self->_bannerStyle;
    *(_QWORD *)(v16 + 212) |= 2uLL;
    if ((*(_QWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_70:
  v16[209] = self->_disableFasterRerouteByDefault;
  *(_QWORD *)(v16 + 212) |= 0x4000uLL;
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 2) != 0)
    goto LABEL_71;
LABEL_36:
  if ((*(_WORD *)&v18 & 0x400) != 0)
  {
LABEL_37:
    *((_DWORD *)v16 + 49) = self->_secondsSaved;
    *(_QWORD *)(v16 + 212) |= 0x400uLL;
  }
LABEL_38:
  if (-[GEOTrafficBannerText buttonsCount](self, "buttonsCount"))
  {
    objc_msgSend(v25, "clearButtons");
    v19 = -[GEOTrafficBannerText buttonsCount](self, "buttonsCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        -[GEOTrafficBannerText buttonAtIndex:](self, "buttonAtIndex:", m);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addButton:", v22);

      }
    }
  }
  v23 = self->_flags;
  v24 = v25;
  if ((*(_BYTE *)&v23 & 4) != 0)
  {
    *((_DWORD *)v25 + 41) = self->_defaultButtonIndex;
    *(_QWORD *)(v25 + 212) |= 4uLL;
    v23 = self->_flags;
    if ((*(_BYTE *)&v23 & 1) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v23 & 0x10000) == 0)
        goto LABEL_45;
      goto LABEL_75;
    }
  }
  else if ((*(_BYTE *)&v23 & 1) == 0)
  {
    goto LABEL_44;
  }
  *((_DWORD *)v25 + 39) = self->_alertDurationSeconds;
  *(_QWORD *)(v25 + 212) |= 1uLL;
  v23 = self->_flags;
  if ((*(_DWORD *)&v23 & 0x10000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v23 & 0x1000) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_75:
  v25[211] = self->_shouldShowTimer;
  *(_QWORD *)(v25 + 212) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_46:
    *((_DWORD *)v25 + 51) = self->_zilchPathIndex;
    *(_QWORD *)(v25 + 212) |= 0x1000uLL;
  }
LABEL_47:
  if (self->_bannerDescription)
  {
    objc_msgSend(v25, "setBannerDescription:");
    v24 = v25;
  }
  if (self->_bannerId)
  {
    objc_msgSend(v25, "setBannerId:");
    v24 = v25;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
  {
    v24[208] = self->_defaultToNewRoute;
    *(_QWORD *)(v24 + 212) |= 0x2000uLL;
  }
  if (self->_analyticsMessageValue)
  {
    objc_msgSend(v25, "setAnalyticsMessageValue:");
    v24 = v25;
  }
  if (self->_artworkOverride)
  {
    objc_msgSend(v25, "setArtworkOverride:");
    v24 = v25;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    v24[210] = self->_preserveBannerInUpdates;
    *(_QWORD *)(v24 + 212) |= 0x8000uLL;
  }
  if (self->_eventInfo)
  {
    objc_msgSend(v25, "setEventInfo:");
    v24 = v25;
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
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  PBUnknownFields *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
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
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 4) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTrafficBannerTextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_56;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTrafficBannerText readAll:](self, "readAll:", 0);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v9 = self->_localizedIncidentBanners;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v69 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocalizedIncidentBanner:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    }
    while (v10);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v14 = self->_localizedIncidentSubBanners;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v65 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocalizedIncidentSubBanner:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v15);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v19 = self->_localizedIncidentSpokenTexts;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v61 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocalizedIncidentSpokenText:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v20);
  }

  v24 = -[GEOFormattedString copyWithZone:](self->_bannerLargeText, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  v26 = -[GEOFormattedString copyWithZone:](self->_bannerSmallText, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v26;

  v28 = -[GEOFormattedString copyWithZone:](self->_spokenPrompt, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v28;

  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 200) = self->_showAtDistance;
    *(_QWORD *)(v5 + 212) |= 0x800uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_28:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_29;
      goto LABEL_59;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_28;
  }
  *(_DWORD *)(v5 + 168) = self->_hideAtDistance;
  *(_QWORD *)(v5 + 212) |= 8uLL;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_59:
  *(_DWORD *)(v5 + 172) = self->_incidentDistance;
  *(_QWORD *)(v5 + 212) |= 0x10uLL;
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_30:
    *(_DWORD *)(v5 + 176) = self->_incidentIndex;
    *(_QWORD *)(v5 + 212) |= 0x20uLL;
  }
LABEL_31:
  v31 = -[GEOCameraInput copyWithZone:](self->_cameraInput, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v31;

  v33 = -[GEOTriggerPointRange copyWithZone:](self->_triggerRange, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v33;

  v35 = -[GEOTriggerPointRange copyWithZone:](self->_progressBarRange, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v35;

  v37 = self->_flags;
  if ((*(_WORD *)&v37 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_priority;
    *(_QWORD *)(v5 + 212) |= 0x200uLL;
    v37 = self->_flags;
    if ((*(_BYTE *)&v37 & 0x40) == 0)
    {
LABEL_33:
      if ((*(_BYTE *)&v37 & 0x80) == 0)
        goto LABEL_34;
      goto LABEL_63;
    }
  }
  else if ((*(_BYTE *)&v37 & 0x40) == 0)
  {
    goto LABEL_33;
  }
  *(_DWORD *)(v5 + 180) = self->_minDisplayTime;
  *(_QWORD *)(v5 + 212) |= 0x40uLL;
  v37 = self->_flags;
  if ((*(_BYTE *)&v37 & 0x80) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v37 & 0x100) == 0)
      goto LABEL_35;
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v5 + 184) = self->_overlapDelayTime;
  *(_QWORD *)(v5 + 212) |= 0x80uLL;
  v37 = self->_flags;
  if ((*(_WORD *)&v37 & 0x100) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v37 & 0x4000) == 0)
      goto LABEL_36;
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v5 + 188) = self->_previousBannerChange;
  *(_QWORD *)(v5 + 212) |= 0x100uLL;
  v37 = self->_flags;
  if ((*(_WORD *)&v37 & 0x4000) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v37 & 2) == 0)
      goto LABEL_37;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v5 + 209) = self->_disableFasterRerouteByDefault;
  *(_QWORD *)(v5 + 212) |= 0x4000uLL;
  v37 = self->_flags;
  if ((*(_BYTE *)&v37 & 2) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v37 & 0x400) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_66:
  *(_DWORD *)(v5 + 160) = self->_bannerStyle;
  *(_QWORD *)(v5 + 212) |= 2uLL;
  if ((*(_QWORD *)&self->_flags & 0x400) != 0)
  {
LABEL_38:
    *(_DWORD *)(v5 + 196) = self->_secondsSaved;
    *(_QWORD *)(v5 + 212) |= 0x400uLL;
  }
LABEL_39:
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v38 = self->_buttons;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v57;
    do
    {
      for (m = 0; m != v39; ++m)
      {
        if (*(_QWORD *)v57 != v40)
          objc_enumerationMutation(v38);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v56);
        objc_msgSend((id)v5, "addButton:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    }
    while (v39);
  }

  v43 = self->_flags;
  if ((*(_BYTE *)&v43 & 4) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_defaultButtonIndex;
    *(_QWORD *)(v5 + 212) |= 4uLL;
    v43 = self->_flags;
    if ((*(_BYTE *)&v43 & 1) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v43 & 0x10000) == 0)
        goto LABEL_49;
LABEL_70:
      *(_BYTE *)(v5 + 211) = self->_shouldShowTimer;
      *(_QWORD *)(v5 + 212) |= 0x10000uLL;
      if ((*(_QWORD *)&self->_flags & 0x1000) == 0)
        goto LABEL_51;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&v43 & 1) == 0)
  {
    goto LABEL_48;
  }
  *(_DWORD *)(v5 + 156) = self->_alertDurationSeconds;
  *(_QWORD *)(v5 + 212) |= 1uLL;
  v43 = self->_flags;
  if ((*(_DWORD *)&v43 & 0x10000) != 0)
    goto LABEL_70;
LABEL_49:
  if ((*(_WORD *)&v43 & 0x1000) != 0)
  {
LABEL_50:
    *(_DWORD *)(v5 + 204) = self->_zilchPathIndex;
    *(_QWORD *)(v5 + 212) |= 0x1000uLL;
  }
LABEL_51:
  v44 = -[GEOFormattedString copyWithZone:](self->_bannerDescription, "copyWithZone:", a3, (_QWORD)v56);
  v45 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v44;

  v46 = -[NSString copyWithZone:](self->_bannerId, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v46;

  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 208) = self->_defaultToNewRoute;
    *(_QWORD *)(v5 + 212) |= 0x2000uLL;
  }
  v48 = -[NSString copyWithZone:](self->_analyticsMessageValue, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v48;

  v50 = -[GEOPBTransitArtwork copyWithZone:](self->_artworkOverride, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v50;

  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 210) = self->_preserveBannerInUpdates;
    *(_QWORD *)(v5 + 212) |= 0x8000uLL;
  }
  v52 = -[NSData copyWithZone:](self->_eventInfo, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v52;

  v54 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v54;
LABEL_56:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSMutableArray *localizedIncidentBanners;
  NSMutableArray *localizedIncidentSubBanners;
  NSMutableArray *localizedIncidentSpokenTexts;
  GEOFormattedString *bannerLargeText;
  GEOFormattedString *bannerSmallText;
  GEOFormattedString *spokenPrompt;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;
  uint64_t v12;
  GEOCameraInput *cameraInput;
  GEOTriggerPointRange *triggerRange;
  GEOTriggerPointRange *progressBarRange;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v16;
  uint64_t v17;
  NSMutableArray *buttons;
  GEOFormattedString *bannerDescription;
  NSString *bannerId;
  uint64_t v21;
  NSString *analyticsMessageValue;
  GEOPBTransitArtwork *artworkOverride;
  uint64_t v24;
  char v25;
  NSData *eventInfo;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_124;
  -[GEOTrafficBannerText readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  localizedIncidentBanners = self->_localizedIncidentBanners;
  if ((unint64_t)localizedIncidentBanners | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](localizedIncidentBanners, "isEqual:"))
      goto LABEL_124;
  }
  localizedIncidentSubBanners = self->_localizedIncidentSubBanners;
  if ((unint64_t)localizedIncidentSubBanners | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](localizedIncidentSubBanners, "isEqual:"))
      goto LABEL_124;
  }
  localizedIncidentSpokenTexts = self->_localizedIncidentSpokenTexts;
  if ((unint64_t)localizedIncidentSpokenTexts | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](localizedIncidentSpokenTexts, "isEqual:"))
      goto LABEL_124;
  }
  bannerLargeText = self->_bannerLargeText;
  if ((unint64_t)bannerLargeText | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOFormattedString isEqual:](bannerLargeText, "isEqual:"))
      goto LABEL_124;
  }
  bannerSmallText = self->_bannerSmallText;
  if ((unint64_t)bannerSmallText | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOFormattedString isEqual:](bannerSmallText, "isEqual:"))
      goto LABEL_124;
  }
  spokenPrompt = self->_spokenPrompt;
  if ((unint64_t)spokenPrompt | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOFormattedString isEqual:](spokenPrompt, "isEqual:"))
      goto LABEL_124;
  }
  flags = self->_flags;
  v12 = *(_QWORD *)(v4 + 212);
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_showAtDistance != *((_DWORD *)v4 + 50))
      goto LABEL_124;
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_hideAtDistance != *((_DWORD *)v4 + 42))
      goto LABEL_124;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_incidentDistance != *((_DWORD *)v4 + 43))
      goto LABEL_124;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_incidentIndex != *((_DWORD *)v4 + 44))
      goto LABEL_124;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_124;
  }
  cameraInput = self->_cameraInput;
  if ((unint64_t)cameraInput | *((_QWORD *)v4 + 10) && !-[GEOCameraInput isEqual:](cameraInput, "isEqual:"))
    goto LABEL_124;
  triggerRange = self->_triggerRange;
  if ((unint64_t)triggerRange | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOTriggerPointRange isEqual:](triggerRange, "isEqual:"))
      goto LABEL_124;
  }
  progressBarRange = self->_progressBarRange;
  if ((unint64_t)progressBarRange | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOTriggerPointRange isEqual:](progressBarRange, "isEqual:"))
      goto LABEL_124;
  }
  v16 = self->_flags;
  v17 = *(_QWORD *)(v4 + 212);
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_priority != *((_DWORD *)v4 + 48))
      goto LABEL_124;
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&v16 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_minDisplayTime != *((_DWORD *)v4 + 45))
      goto LABEL_124;
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&v16 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_overlapDelayTime != *((_DWORD *)v4 + 46))
      goto LABEL_124;
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    if ((v17 & 0x100) == 0 || self->_previousBannerChange != *((_DWORD *)v4 + 47))
      goto LABEL_124;
  }
  else if ((v17 & 0x100) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v16 & 0x4000) != 0)
  {
    if ((v17 & 0x4000) == 0)
      goto LABEL_124;
    if (self->_disableFasterRerouteByDefault)
    {
      if (!v4[209])
        goto LABEL_124;
    }
    else if (v4[209])
    {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x4000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_bannerStyle != *((_DWORD *)v4 + 40))
      goto LABEL_124;
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v16 & 0x400) != 0)
  {
    if ((v17 & 0x400) == 0 || self->_secondsSaved != *((_DWORD *)v4 + 49))
      goto LABEL_124;
  }
  else if ((v17 & 0x400) != 0)
  {
    goto LABEL_124;
  }
  buttons = self->_buttons;
  if ((unint64_t)buttons | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](buttons, "isEqual:"))
      goto LABEL_124;
    v16 = self->_flags;
    v17 = *(_QWORD *)(v4 + 212);
  }
  if ((*(_BYTE *)&v16 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_defaultButtonIndex != *((_DWORD *)v4 + 41))
      goto LABEL_124;
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_BYTE *)&v16 & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_alertDurationSeconds != *((_DWORD *)v4 + 39))
      goto LABEL_124;
  }
  else if ((v17 & 1) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    if ((v17 & 0x10000) == 0)
      goto LABEL_124;
    if (self->_shouldShowTimer)
    {
      if (!v4[211])
        goto LABEL_124;
    }
    else if (v4[211])
    {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x10000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    if ((v17 & 0x1000) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 51))
      goto LABEL_124;
  }
  else if ((v17 & 0x1000) != 0)
  {
    goto LABEL_124;
  }
  bannerDescription = self->_bannerDescription;
  if ((unint64_t)bannerDescription | *((_QWORD *)v4 + 5)
    && !-[GEOFormattedString isEqual:](bannerDescription, "isEqual:"))
  {
    goto LABEL_124;
  }
  bannerId = self->_bannerId;
  if ((unint64_t)bannerId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](bannerId, "isEqual:"))
      goto LABEL_124;
  }
  v21 = *(_QWORD *)(v4 + 212);
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
  {
    if ((v21 & 0x2000) == 0)
      goto LABEL_124;
    if (self->_defaultToNewRoute)
    {
      if (!v4[208])
        goto LABEL_124;
    }
    else if (v4[208])
    {
      goto LABEL_124;
    }
  }
  else if ((v21 & 0x2000) != 0)
  {
    goto LABEL_124;
  }
  analyticsMessageValue = self->_analyticsMessageValue;
  if ((unint64_t)analyticsMessageValue | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](analyticsMessageValue, "isEqual:"))
  {
    goto LABEL_124;
  }
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:"))
      goto LABEL_124;
  }
  v24 = *(_QWORD *)(v4 + 212);
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) == 0)
  {
    if ((v24 & 0x8000) == 0)
      goto LABEL_130;
LABEL_124:
    v25 = 0;
    goto LABEL_125;
  }
  if ((v24 & 0x8000) == 0)
    goto LABEL_124;
  if (!self->_preserveBannerInUpdates)
  {
    if (!v4[210])
      goto LABEL_130;
    goto LABEL_124;
  }
  if (!v4[210])
    goto LABEL_124;
LABEL_130:
  eventInfo = self->_eventInfo;
  if ((unint64_t)eventInfo | *((_QWORD *)v4 + 11))
    v25 = -[NSData isEqual:](eventInfo, "isEqual:");
  else
    v25 = 1;
LABEL_125:

  return v25;
}

- (unint64_t)hash
{
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v4;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  -[GEOTrafficBannerText readAll:](self, "readAll:", 1);
  v38 = -[NSMutableArray hash](self->_localizedIncidentBanners, "hash");
  v37 = -[NSMutableArray hash](self->_localizedIncidentSubBanners, "hash");
  v36 = -[NSMutableArray hash](self->_localizedIncidentSpokenTexts, "hash");
  v35 = -[GEOFormattedString hash](self->_bannerLargeText, "hash");
  v34 = -[GEOFormattedString hash](self->_bannerSmallText, "hash");
  v33 = -[GEOFormattedString hash](self->_spokenPrompt, "hash");
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    v32 = 2654435761 * self->_showAtDistance;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
LABEL_3:
      v31 = 2654435761 * self->_hideAtDistance;
      if ((*(_BYTE *)&flags & 0x10) != 0)
        goto LABEL_4;
LABEL_8:
      v30 = 0;
      if ((*(_BYTE *)&flags & 0x20) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_3;
  }
  v31 = 0;
  if ((*(_BYTE *)&flags & 0x10) == 0)
    goto LABEL_8;
LABEL_4:
  v30 = 2654435761 * self->_incidentDistance;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_5:
    v29 = 2654435761 * self->_incidentIndex;
    goto LABEL_10;
  }
LABEL_9:
  v29 = 0;
LABEL_10:
  v28 = -[GEOCameraInput hash](self->_cameraInput, "hash");
  v27 = -[GEOTriggerPointRange hash](self->_triggerRange, "hash");
  v26 = -[GEOTriggerPointRange hash](self->_progressBarRange, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    v25 = 2654435761 * self->_priority;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
    {
LABEL_12:
      v24 = 2654435761 * self->_minDisplayTime;
      if ((*(_BYTE *)&v4 & 0x80) != 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else
  {
    v25 = 0;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_12;
  }
  v24 = 0;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
LABEL_13:
    v23 = 2654435761 * self->_overlapDelayTime;
    if ((*(_WORD *)&v4 & 0x100) != 0)
      goto LABEL_14;
    goto LABEL_21;
  }
LABEL_20:
  v23 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_14:
    v22 = 2654435761 * self->_previousBannerChange;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_15;
    goto LABEL_22;
  }
LABEL_21:
  v22 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_15:
    v21 = 2654435761 * self->_disableFasterRerouteByDefault;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_16;
LABEL_23:
    v20 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_17;
    goto LABEL_24;
  }
LABEL_22:
  v21 = 0;
  if ((*(_BYTE *)&v4 & 2) == 0)
    goto LABEL_23;
LABEL_16:
  v20 = 2654435761 * self->_bannerStyle;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_17:
    v19 = 2654435761 * self->_secondsSaved;
    goto LABEL_25;
  }
LABEL_24:
  v19 = 0;
LABEL_25:
  v18 = -[NSMutableArray hash](self->_buttons, "hash");
  v5 = self->_flags;
  if ((*(_BYTE *)&v5 & 4) != 0)
  {
    v17 = 2654435761 * self->_defaultButtonIndex;
    if ((*(_BYTE *)&v5 & 1) != 0)
    {
LABEL_27:
      v15 = 2654435761 * self->_alertDurationSeconds;
      if ((*(_DWORD *)&v5 & 0x10000) != 0)
        goto LABEL_28;
LABEL_32:
      v6 = 0;
      if ((*(_WORD *)&v5 & 0x1000) != 0)
        goto LABEL_29;
      goto LABEL_33;
    }
  }
  else
  {
    v17 = 0;
    if ((*(_BYTE *)&v5 & 1) != 0)
      goto LABEL_27;
  }
  v15 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
    goto LABEL_32;
LABEL_28:
  v6 = 2654435761 * self->_shouldShowTimer;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
LABEL_29:
    v7 = 2654435761 * self->_zilchPathIndex;
    goto LABEL_34;
  }
LABEL_33:
  v7 = 0;
LABEL_34:
  v8 = -[GEOFormattedString hash](self->_bannerDescription, "hash", v15);
  v9 = -[NSString hash](self->_bannerId, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
    v10 = 2654435761 * self->_defaultToNewRoute;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_analyticsMessageValue, "hash");
  v12 = -[GEOPBTransitArtwork hash](self->_artworkOverride, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
    v13 = 2654435761 * self->_preserveBannerInUpdates;
  else
    v13 = 0;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSData hash](self->_eventInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  GEOFormattedString *bannerLargeText;
  uint64_t v21;
  GEOFormattedString *bannerSmallText;
  uint64_t v23;
  GEOFormattedString *spokenPrompt;
  uint64_t v25;
  uint64_t v26;
  GEOCameraInput *cameraInput;
  uint64_t v28;
  GEOTriggerPointRange *triggerRange;
  uint64_t v30;
  GEOTriggerPointRange *progressBarRange;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  uint64_t v39;
  GEOFormattedString *bannerDescription;
  uint64_t v41;
  GEOPBTransitArtwork *artworkOverride;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v5 = *((id *)v4 + 12);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        -[GEOTrafficBannerText addLocalizedIncidentBanner:](self, "addLocalizedIncidentBanner:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v7);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v10 = *((id *)v4 + 14);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(v10);
        -[GEOTrafficBannerText addLocalizedIncidentSubBanner:](self, "addLocalizedIncidentSubBanner:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v12);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = *((id *)v4 + 13);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        -[GEOTrafficBannerText addLocalizedIncidentSpokenText:](self, "addLocalizedIncidentSpokenText:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v17);
  }

  bannerLargeText = self->_bannerLargeText;
  v21 = *((_QWORD *)v4 + 7);
  if (bannerLargeText)
  {
    if (v21)
      -[GEOFormattedString mergeFrom:](bannerLargeText, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOTrafficBannerText setBannerLargeText:](self, "setBannerLargeText:");
  }
  bannerSmallText = self->_bannerSmallText;
  v23 = *((_QWORD *)v4 + 8);
  if (bannerSmallText)
  {
    if (v23)
      -[GEOFormattedString mergeFrom:](bannerSmallText, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOTrafficBannerText setBannerSmallText:](self, "setBannerSmallText:");
  }
  spokenPrompt = self->_spokenPrompt;
  v25 = *((_QWORD *)v4 + 16);
  if (spokenPrompt)
  {
    if (v25)
      -[GEOFormattedString mergeFrom:](spokenPrompt, "mergeFrom:");
  }
  else if (v25)
  {
    -[GEOTrafficBannerText setSpokenPrompt:](self, "setSpokenPrompt:");
  }
  v26 = *(_QWORD *)(v4 + 212);
  if ((v26 & 0x800) != 0)
  {
    self->_showAtDistance = *((_DWORD *)v4 + 50);
    *(_QWORD *)&self->_flags |= 0x800uLL;
    v26 = *(_QWORD *)(v4 + 212);
    if ((v26 & 8) == 0)
    {
LABEL_39:
      if ((v26 & 0x10) == 0)
        goto LABEL_40;
      goto LABEL_47;
    }
  }
  else if ((v26 & 8) == 0)
  {
    goto LABEL_39;
  }
  self->_hideAtDistance = *((_DWORD *)v4 + 42);
  *(_QWORD *)&self->_flags |= 8uLL;
  v26 = *(_QWORD *)(v4 + 212);
  if ((v26 & 0x10) == 0)
  {
LABEL_40:
    if ((v26 & 0x20) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_47:
  self->_incidentDistance = *((_DWORD *)v4 + 43);
  *(_QWORD *)&self->_flags |= 0x10uLL;
  if ((*(_QWORD *)(v4 + 212) & 0x20) != 0)
  {
LABEL_41:
    self->_incidentIndex = *((_DWORD *)v4 + 44);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
LABEL_42:
  cameraInput = self->_cameraInput;
  v28 = *((_QWORD *)v4 + 10);
  if (cameraInput)
  {
    if (v28)
      -[GEOCameraInput mergeFrom:](cameraInput, "mergeFrom:");
  }
  else if (v28)
  {
    -[GEOTrafficBannerText setCameraInput:](self, "setCameraInput:");
  }
  triggerRange = self->_triggerRange;
  v30 = *((_QWORD *)v4 + 17);
  if (triggerRange)
  {
    if (v30)
      -[GEOTriggerPointRange mergeFrom:](triggerRange, "mergeFrom:");
  }
  else if (v30)
  {
    -[GEOTrafficBannerText setTriggerRange:](self, "setTriggerRange:");
  }
  progressBarRange = self->_progressBarRange;
  v32 = *((_QWORD *)v4 + 15);
  if (progressBarRange)
  {
    if (v32)
      -[GEOTriggerPointRange mergeFrom:](progressBarRange, "mergeFrom:");
  }
  else if (v32)
  {
    -[GEOTrafficBannerText setProgressBarRange:](self, "setProgressBarRange:");
  }
  v33 = *(_QWORD *)(v4 + 212);
  if ((v33 & 0x200) != 0)
  {
    self->_priority = *((_DWORD *)v4 + 48);
    *(_QWORD *)&self->_flags |= 0x200uLL;
    v33 = *(_QWORD *)(v4 + 212);
    if ((v33 & 0x40) == 0)
    {
LABEL_63:
      if ((v33 & 0x80) == 0)
        goto LABEL_64;
      goto LABEL_86;
    }
  }
  else if ((v33 & 0x40) == 0)
  {
    goto LABEL_63;
  }
  self->_minDisplayTime = *((_DWORD *)v4 + 45);
  *(_QWORD *)&self->_flags |= 0x40uLL;
  v33 = *(_QWORD *)(v4 + 212);
  if ((v33 & 0x80) == 0)
  {
LABEL_64:
    if ((v33 & 0x100) == 0)
      goto LABEL_65;
    goto LABEL_87;
  }
LABEL_86:
  self->_overlapDelayTime = *((_DWORD *)v4 + 46);
  *(_QWORD *)&self->_flags |= 0x80uLL;
  v33 = *(_QWORD *)(v4 + 212);
  if ((v33 & 0x100) == 0)
  {
LABEL_65:
    if ((v33 & 0x4000) == 0)
      goto LABEL_66;
    goto LABEL_88;
  }
LABEL_87:
  self->_previousBannerChange = *((_DWORD *)v4 + 47);
  *(_QWORD *)&self->_flags |= 0x100uLL;
  v33 = *(_QWORD *)(v4 + 212);
  if ((v33 & 0x4000) == 0)
  {
LABEL_66:
    if ((v33 & 2) == 0)
      goto LABEL_67;
    goto LABEL_89;
  }
LABEL_88:
  self->_disableFasterRerouteByDefault = v4[209];
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  v33 = *(_QWORD *)(v4 + 212);
  if ((v33 & 2) == 0)
  {
LABEL_67:
    if ((v33 & 0x400) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_89:
  self->_bannerStyle = *((_DWORD *)v4 + 40);
  *(_QWORD *)&self->_flags |= 2uLL;
  if ((*(_QWORD *)(v4 + 212) & 0x400) != 0)
  {
LABEL_68:
    self->_secondsSaved = *((_DWORD *)v4 + 49);
    *(_QWORD *)&self->_flags |= 0x400uLL;
  }
LABEL_69:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v34 = *((id *)v4 + 9);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v45 != v37)
          objc_enumerationMutation(v34);
        -[GEOTrafficBannerText addButton:](self, "addButton:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * m), (_QWORD)v44);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v36);
  }

  v39 = *(_QWORD *)(v4 + 212);
  if ((v39 & 4) != 0)
  {
    self->_defaultButtonIndex = *((_DWORD *)v4 + 41);
    *(_QWORD *)&self->_flags |= 4uLL;
    v39 = *(_QWORD *)(v4 + 212);
    if ((v39 & 1) == 0)
    {
LABEL_78:
      if ((v39 & 0x10000) == 0)
        goto LABEL_79;
      goto LABEL_93;
    }
  }
  else if ((v39 & 1) == 0)
  {
    goto LABEL_78;
  }
  self->_alertDurationSeconds = *((_DWORD *)v4 + 39);
  *(_QWORD *)&self->_flags |= 1uLL;
  v39 = *(_QWORD *)(v4 + 212);
  if ((v39 & 0x10000) == 0)
  {
LABEL_79:
    if ((v39 & 0x1000) == 0)
      goto LABEL_81;
    goto LABEL_80;
  }
LABEL_93:
  self->_shouldShowTimer = v4[211];
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  if ((*(_QWORD *)(v4 + 212) & 0x1000) != 0)
  {
LABEL_80:
    self->_zilchPathIndex = *((_DWORD *)v4 + 51);
    *(_QWORD *)&self->_flags |= 0x1000uLL;
  }
LABEL_81:
  bannerDescription = self->_bannerDescription;
  v41 = *((_QWORD *)v4 + 5);
  if (bannerDescription)
  {
    if (v41)
      -[GEOFormattedString mergeFrom:](bannerDescription, "mergeFrom:");
  }
  else if (v41)
  {
    -[GEOTrafficBannerText setBannerDescription:](self, "setBannerDescription:");
  }
  if (*((_QWORD *)v4 + 6))
    -[GEOTrafficBannerText setBannerId:](self, "setBannerId:");
  if ((v4[213] & 0x20) != 0)
  {
    self->_defaultToNewRoute = v4[208];
    *(_QWORD *)&self->_flags |= 0x2000uLL;
  }
  if (*((_QWORD *)v4 + 3))
    -[GEOTrafficBannerText setAnalyticsMessageValue:](self, "setAnalyticsMessageValue:");
  artworkOverride = self->_artworkOverride;
  v43 = *((_QWORD *)v4 + 4);
  if (artworkOverride)
  {
    if (v43)
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEOTrafficBannerText setArtworkOverride:](self, "setArtworkOverride:");
  }
  if (v4[213] < 0)
  {
    self->_preserveBannerInUpdates = v4[210];
    *(_QWORD *)&self->_flags |= 0x8000uLL;
  }
  if (*((_QWORD *)v4 + 11))
    -[GEOTrafficBannerText setEventInfo:](self, "setEventInfo:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTrafficBannerTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6457);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200020000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTrafficBannerText readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_bannerLargeText, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_bannerSmallText, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_spokenPrompt, "clearUnknownFields:", 1);
    -[GEOCameraInput clearUnknownFields:](self->_cameraInput, "clearUnknownFields:", 1);
    -[GEOTriggerPointRange clearUnknownFields:](self->_triggerRange, "clearUnknownFields:", 1);
    -[GEOTriggerPointRange clearUnknownFields:](self->_progressBarRange, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_buttons;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[GEOFormattedString clearUnknownFields:](self->_bannerDescription, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artworkOverride, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerRange, 0);
  objc_storeStrong((id *)&self->_spokenPrompt, 0);
  objc_storeStrong((id *)&self->_progressBarRange, 0);
  objc_storeStrong((id *)&self->_localizedIncidentSubBanners, 0);
  objc_storeStrong((id *)&self->_localizedIncidentSpokenTexts, 0);
  objc_storeStrong((id *)&self->_localizedIncidentBanners, 0);
  objc_storeStrong((id *)&self->_eventInfo, 0);
  objc_storeStrong((id *)&self->_cameraInput, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_bannerSmallText, 0);
  objc_storeStrong((id *)&self->_bannerLargeText, 0);
  objc_storeStrong((id *)&self->_bannerId, 0);
  objc_storeStrong((id *)&self->_bannerDescription, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_analyticsMessageValue, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
