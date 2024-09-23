@implementation GEOAdvisoryNotice

- (GEOAdvisoryNotice)init
{
  GEOAdvisoryNotice *v2;
  GEOAdvisoryNotice *v3;
  GEOAdvisoryNotice *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAdvisoryNotice;
  v2 = -[GEOAdvisoryNotice init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAdvisoryNotice)initWithData:(id)a3
{
  GEOAdvisoryNotice *v3;
  GEOAdvisoryNotice *v4;
  GEOAdvisoryNotice *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAdvisoryNotice;
  v3 = -[GEOAdvisoryNotice initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOAdvisoryNotice;
  -[GEOAdvisoryNotice dealloc](&v3, sel_dealloc);
}

- (void)_readNoticeText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNoticeText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasNoticeText
{
  -[GEOAdvisoryNotice _readNoticeText]((uint64_t)self);
  return self->_noticeText != 0;
}

- (GEOFormattedString)noticeText
{
  -[GEOAdvisoryNotice _readNoticeText]((uint64_t)self);
  return self->_noticeText;
}

- (void)setNoticeText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_noticeText, a3);
}

- (void)_readIncidentIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)incidentIndexsCount
{
  -[GEOAdvisoryNotice _readIncidentIndexs]((uint64_t)self);
  return self->_incidentIndexs.count;
}

- (unsigned)incidentIndexs
{
  -[GEOAdvisoryNotice _readIncidentIndexs]((uint64_t)self);
  return self->_incidentIndexs.list;
}

- (void)clearIncidentIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  PBRepeatedUInt32Clear();
}

- (void)addIncidentIndex:(unsigned int)a3
{
  -[GEOAdvisoryNotice _readIncidentIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (unsigned)incidentIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_incidentIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOAdvisoryNotice _readIncidentIndexs]((uint64_t)self);
  p_incidentIndexs = &self->_incidentIndexs;
  count = self->_incidentIndexs.count;
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
  return p_incidentIndexs->list[a3];
}

- (void)setIncidentIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  PBRepeatedUInt32Set();
}

- (void)_readAdvisoryCards
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisoryCards_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)advisoryCards
{
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  return self->_advisoryCards;
}

- (void)setAdvisoryCards:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *advisoryCards;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  advisoryCards = self->_advisoryCards;
  self->_advisoryCards = v4;

}

- (void)clearAdvisoryCards
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_advisoryCards, "removeAllObjects");
}

- (void)addAdvisoryCard:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  -[GEOAdvisoryNotice _addNoFlagsAdvisoryCard:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsAdvisoryCard:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)advisoryCardsCount
{
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  return -[NSMutableArray count](self->_advisoryCards, "count");
}

- (id)advisoryCardAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_advisoryCards, "objectAtIndex:", a3);
}

+ (Class)advisoryCardType
{
  return (Class)objc_opt_class();
}

- (void)_readAdvisoryItems
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisoryItems_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)advisoryItems
{
  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  return self->_advisoryItems;
}

- (void)setAdvisoryItems:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *advisoryItems;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  advisoryItems = self->_advisoryItems;
  self->_advisoryItems = v4;

}

- (void)clearAdvisoryItems
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_advisoryItems, "removeAllObjects");
}

- (void)addAdvisoryItem:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  -[GEOAdvisoryNotice _addNoFlagsAdvisoryItem:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsAdvisoryItem:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)advisoryItemsCount
{
  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  return -[NSMutableArray count](self->_advisoryItems, "count");
}

- (id)advisoryItemAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_advisoryItems, "objectAtIndex:", a3);
}

+ (Class)advisoryItemType
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldAlwaysShowAdvisoryCard
{
  return self->_shouldAlwaysShowAdvisoryCard;
}

- (void)setShouldAlwaysShowAdvisoryCard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_shouldAlwaysShowAdvisoryCard = a3;
}

- (void)setHasShouldAlwaysShowAdvisoryCard:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1026;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasShouldAlwaysShowAdvisoryCard
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readDetailCardTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetailCardTitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDetailCardTitle
{
  -[GEOAdvisoryNotice _readDetailCardTitle]((uint64_t)self);
  return self->_detailCardTitle != 0;
}

- (GEOFormattedString)detailCardTitle
{
  -[GEOAdvisoryNotice _readDetailCardTitle]((uint64_t)self);
  return self->_detailCardTitle;
}

- (void)setDetailCardTitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_detailCardTitle, a3);
}

- (void)_readNoticeArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNoticeArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasNoticeArtwork
{
  -[GEOAdvisoryNotice _readNoticeArtwork]((uint64_t)self);
  return self->_noticeArtwork != 0;
}

- (GEOPBTransitArtwork)noticeArtwork
{
  -[GEOAdvisoryNotice _readNoticeArtwork]((uint64_t)self);
  return self->_noticeArtwork;
}

- (void)setNoticeArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_noticeArtwork, a3);
}

- (void)_readAnalyticsMessageValues
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticsMessageValues_tags_366);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)analyticsMessageValues
{
  -[GEOAdvisoryNotice _readAnalyticsMessageValues]((uint64_t)self);
  return self->_analyticsMessageValues;
}

- (void)setAnalyticsMessageValues:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *analyticsMessageValues;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  analyticsMessageValues = self->_analyticsMessageValues;
  self->_analyticsMessageValues = v4;

}

- (void)clearAnalyticsMessageValues
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_analyticsMessageValues, "removeAllObjects");
}

- (void)addAnalyticsMessageValue:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAdvisoryNotice _readAnalyticsMessageValues]((uint64_t)self);
  -[GEOAdvisoryNotice _addNoFlagsAnalyticsMessageValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsAnalyticsMessageValue:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)analyticsMessageValuesCount
{
  -[GEOAdvisoryNotice _readAnalyticsMessageValues]((uint64_t)self);
  return -[NSMutableArray count](self->_analyticsMessageValues, "count");
}

- (id)analyticsMessageValueAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryNotice _readAnalyticsMessageValues]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_analyticsMessageValues, "objectAtIndex:", a3);
}

+ (Class)analyticsMessageValueType
{
  return (Class)objc_opt_class();
}

- (int)advisoryType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_advisoryType;
  else
    return 0;
}

- (void)setAdvisoryType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_advisoryType = a3;
}

- (void)setHasAdvisoryType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasAdvisoryType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)advisoryTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("FOOTER");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAdvisoryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FOOTER"));

  return v4;
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
  v8.super_class = (Class)GEOAdvisoryNotice;
  -[GEOAdvisoryNotice description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAdvisoryNotice dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoryNotice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  int v41;
  __CFString *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "noticeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("noticeText");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("notice_text");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("incidentIndex");
    else
      v10 = CFSTR("incident_index");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v12 = *(id *)(a1 + 48);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v58 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("advisoryCard");
    else
      v19 = CFSTR("advisory_card");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v21 = *(id *)(a1 + 56);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("advisoryItem");
    else
      v28 = CFSTR("advisory_item");
    objc_msgSend(v4, "setObject:forKey:", v20, v28);

  }
  if ((*(_WORD *)(a1 + 116) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 112));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("shouldAlwaysShowAdvisoryCard");
    else
      v30 = CFSTR("should_always_show_advisory_card");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  objc_msgSend((id)a1, "detailCardTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("detailCardTitle");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("detail_card_title");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  objc_msgSend((id)a1, "noticeArtwork");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("noticeArtwork");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("notice_artwork");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend((id)a1, "analyticsMessageValues");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("analyticsMessageValue");
    else
      v40 = CFSTR("analytics_message_value");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  if ((*(_WORD *)(a1 + 116) & 1) != 0)
  {
    v41 = *(_DWORD *)(a1 + 108);
    if (v41)
    {
      if (v41 == 1)
      {
        v42 = CFSTR("FOOTER");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 108));
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v42 = CFSTR("UNKNOWN");
    }
    if (a2)
      v43 = CFSTR("advisoryType");
    else
      v43 = CFSTR("advisory_type");
    objc_msgSend(v4, "setObject:forKey:", v42, v43);

  }
  v44 = *(void **)(a1 + 16);
  if (v44)
  {
    objc_msgSend(v44, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __47__GEOAdvisoryNotice__dictionaryRepresentation___block_invoke;
      v51[3] = &unk_1E1C00600;
      v48 = v47;
      v52 = v48;
      objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v51);
      v49 = v48;

      v46 = v49;
    }
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAdvisoryNotice _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOAdvisoryNotice__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAdvisoryNotice)initWithDictionary:(id)a3
{
  return (GEOAdvisoryNotice *)-[GEOAdvisoryNotice _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOFormattedString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  GEOAdvisoryCard *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  GEOAdvisoryItem *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  GEOFormattedString *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  GEOPBTransitArtwork *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("noticeText");
      else
        v6 = CFSTR("notice_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOFormattedString initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOFormattedString initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setNoticeText:", v9);

      }
      if (a3)
        v11 = CFSTR("incidentIndex");
      else
        v11 = CFSTR("incident_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v69 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v83;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v83 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addIncidentIndex:", objc_msgSend(v18, "unsignedIntValue"));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
          }
          while (v15);
        }

        v5 = v69;
      }

      if (a3)
        v19 = CFSTR("advisoryCard");
      else
        v19 = CFSTR("advisory_card");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v67 = v20;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v79;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v79 != v24)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = [GEOAdvisoryCard alloc];
                if ((a3 & 1) != 0)
                  v28 = -[GEOAdvisoryCard initWithJSON:](v27, "initWithJSON:", v26);
                else
                  v28 = -[GEOAdvisoryCard initWithDictionary:](v27, "initWithDictionary:", v26);
                v29 = (void *)v28;
                objc_msgSend(a1, "addAdvisoryCard:", v28, v67);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
          }
          while (v23);
        }

        v20 = v67;
        v5 = v69;
      }

      if (a3)
        v30 = CFSTR("advisoryItem");
      else
        v30 = CFSTR("advisory_item");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30, v67);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v68 = v31;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v75;
          do
          {
            for (k = 0; k != v34; ++k)
            {
              if (*(_QWORD *)v75 != v35)
                objc_enumerationMutation(v32);
              v37 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = [GEOAdvisoryItem alloc];
                if ((a3 & 1) != 0)
                  v39 = -[GEOAdvisoryItem initWithJSON:](v38, "initWithJSON:", v37);
                else
                  v39 = -[GEOAdvisoryItem initWithDictionary:](v38, "initWithDictionary:", v37);
                v40 = (void *)v39;
                objc_msgSend(a1, "addAdvisoryItem:", v39, v68);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
          }
          while (v34);
        }

        v31 = v68;
        v5 = v69;
      }

      if (a3)
        v41 = CFSTR("shouldAlwaysShowAdvisoryCard");
      else
        v41 = CFSTR("should_always_show_advisory_card");
      objc_msgSend(v5, "objectForKeyedSubscript:", v41, v68);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setShouldAlwaysShowAdvisoryCard:", objc_msgSend(v42, "BOOLValue"));

      if (a3)
        v43 = CFSTR("detailCardTitle");
      else
        v43 = CFSTR("detail_card_title");
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
        objc_msgSend(a1, "setDetailCardTitle:", v46);

      }
      if (a3)
        v48 = CFSTR("noticeArtwork");
      else
        v48 = CFSTR("notice_artwork");
      objc_msgSend(v5, "objectForKeyedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v51 = -[GEOPBTransitArtwork initWithJSON:](v50, "initWithJSON:", v49);
        else
          v51 = -[GEOPBTransitArtwork initWithDictionary:](v50, "initWithDictionary:", v49);
        v52 = (void *)v51;
        objc_msgSend(a1, "setNoticeArtwork:", v51);

      }
      if (a3)
        v53 = CFSTR("analyticsMessageValue");
      else
        v53 = CFSTR("analytics_message_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v55 = v54;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v71;
          do
          {
            for (m = 0; m != v57; ++m)
            {
              if (*(_QWORD *)v71 != v58)
                objc_enumerationMutation(v55);
              v60 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v61 = (void *)objc_msgSend(v60, "copy");
                objc_msgSend(a1, "addAnalyticsMessageValue:", v61);

              }
            }
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
          }
          while (v57);
        }

        v5 = v69;
      }

      if (a3)
        v62 = CFSTR("advisoryType");
      else
        v62 = CFSTR("advisory_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = v63;
        if ((objc_msgSend(v64, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          v65 = 0;
        else
          v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("FOOTER"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_105:

          goto LABEL_106;
        }
        v65 = objc_msgSend(v63, "intValue");
      }
      objc_msgSend(a1, "setAdvisoryType:", v65);
      goto LABEL_105;
    }
  }
LABEL_106:

  return a1;
}

- (GEOAdvisoryNotice)initWithJSON:(id)a3
{
  return (GEOAdvisoryNotice *)-[GEOAdvisoryNotice _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_391;
    else
      v8 = (int *)&readAll__nonRecursiveTag_392;
    GEOAdvisoryNoticeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOAdvisoryNoticeCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoryNoticeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoryNoticeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  PBDataReader *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAdvisoryNoticeIsDirty((uint64_t)self) & 1) == 0)
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAdvisoryNotice readAll:](self, "readAll:", 0);
    if (self->_noticeText)
      PBDataWriterWriteSubmessage();
    if (self->_incidentIndexs.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_incidentIndexs.count);
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_advisoryCards;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v8);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_advisoryItems;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v12);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_detailCardTitle)
      PBDataWriterWriteSubmessage();
    if (self->_noticeArtwork)
      PBDataWriterWriteSubmessage();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = self->_analyticsMessageValues;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteStringField();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v16);
    }

    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v21);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_advisoryCards;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_18;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_advisoryItems;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (_QWORD)v16) & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:
    v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  v14 = 0;
LABEL_19:

  return v14;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  void *v18;
  id *v19;

  v19 = (id *)a3;
  -[GEOAdvisoryNotice readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v19 + 1, self->_reader);
  *((_DWORD *)v19 + 24) = self->_readerMarkPos;
  *((_DWORD *)v19 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_noticeText)
    objc_msgSend(v19, "setNoticeText:");
  if (-[GEOAdvisoryNotice incidentIndexsCount](self, "incidentIndexsCount"))
  {
    objc_msgSend(v19, "clearIncidentIndexs");
    v4 = -[GEOAdvisoryNotice incidentIndexsCount](self, "incidentIndexsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v19, "addIncidentIndex:", -[GEOAdvisoryNotice incidentIndexAtIndex:](self, "incidentIndexAtIndex:", i));
    }
  }
  if (-[GEOAdvisoryNotice advisoryCardsCount](self, "advisoryCardsCount"))
  {
    objc_msgSend(v19, "clearAdvisoryCards");
    v7 = -[GEOAdvisoryNotice advisoryCardsCount](self, "advisoryCardsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOAdvisoryNotice advisoryCardAtIndex:](self, "advisoryCardAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAdvisoryCard:", v10);

      }
    }
  }
  if (-[GEOAdvisoryNotice advisoryItemsCount](self, "advisoryItemsCount"))
  {
    objc_msgSend(v19, "clearAdvisoryItems");
    v11 = -[GEOAdvisoryNotice advisoryItemsCount](self, "advisoryItemsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEOAdvisoryNotice advisoryItemAtIndex:](self, "advisoryItemAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAdvisoryItem:", v14);

      }
    }
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v19 + 112) = self->_shouldAlwaysShowAdvisoryCard;
    *((_WORD *)v19 + 58) |= 2u;
  }
  if (self->_detailCardTitle)
    objc_msgSend(v19, "setDetailCardTitle:");
  if (self->_noticeArtwork)
    objc_msgSend(v19, "setNoticeArtwork:");
  if (-[GEOAdvisoryNotice analyticsMessageValuesCount](self, "analyticsMessageValuesCount"))
  {
    objc_msgSend(v19, "clearAnalyticsMessageValues");
    v15 = -[GEOAdvisoryNotice analyticsMessageValuesCount](self, "analyticsMessageValuesCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
      {
        -[GEOAdvisoryNotice analyticsMessageValueAtIndex:](self, "analyticsMessageValueAtIndex:", m);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAnalyticsMessageValue:", v18);

      }
    }
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v19 + 27) = self->_advisoryType;
    *((_WORD *)v19 + 58) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  PBUnknownFields *v30;
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
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOAdvisoryNoticeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAdvisoryNotice readAll:](self, "readAll:", 0);
  v9 = -[GEOFormattedString copyWithZone:](self->_noticeText, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  PBRepeatedUInt32Copy();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = self->_advisoryCards;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAdvisoryCard:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v12);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = self->_advisoryItems;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAdvisoryItem:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v17);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 112) = self->_shouldAlwaysShowAdvisoryCard;
    *(_WORD *)(v5 + 116) |= 2u;
  }
  v21 = -[GEOFormattedString copyWithZone:](self->_detailCardTitle, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v21;

  v23 = -[GEOPBTransitArtwork copyWithZone:](self->_noticeArtwork, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v23;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = self->_analyticsMessageValues;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v25);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addAnalyticsMessageValue:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v26);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_advisoryType;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  v30 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v30;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOFormattedString *noticeText;
  NSMutableArray *advisoryCards;
  NSMutableArray *advisoryItems;
  __int16 v8;
  GEOFormattedString *detailCardTitle;
  GEOPBTransitArtwork *noticeArtwork;
  NSMutableArray *analyticsMessageValues;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOAdvisoryNotice readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  noticeText = self->_noticeText;
  if ((unint64_t)noticeText | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOFormattedString isEqual:](noticeText, "isEqual:"))
      goto LABEL_27;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_27;
  advisoryCards = self->_advisoryCards;
  if ((unint64_t)advisoryCards | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](advisoryCards, "isEqual:"))
      goto LABEL_27;
  }
  advisoryItems = self->_advisoryItems;
  if ((unint64_t)advisoryItems | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](advisoryItems, "isEqual:"))
      goto LABEL_27;
  }
  v8 = *((_WORD *)v4 + 58);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) != 0)
    {
      if (self->_shouldAlwaysShowAdvisoryCard)
      {
        if (!*((_BYTE *)v4 + 112))
          goto LABEL_27;
        goto LABEL_17;
      }
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_17;
    }
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  if ((v8 & 2) != 0)
    goto LABEL_27;
LABEL_17:
  detailCardTitle = self->_detailCardTitle;
  if ((unint64_t)detailCardTitle | *((_QWORD *)v4 + 9)
    && !-[GEOFormattedString isEqual:](detailCardTitle, "isEqual:"))
  {
    goto LABEL_27;
  }
  noticeArtwork = self->_noticeArtwork;
  if ((unint64_t)noticeArtwork | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPBTransitArtwork isEqual:](noticeArtwork, "isEqual:"))
      goto LABEL_27;
  }
  analyticsMessageValues = self->_analyticsMessageValues;
  if ((unint64_t)analyticsMessageValues | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](analyticsMessageValues, "isEqual:"))
      goto LABEL_27;
  }
  v12 = *((_WORD *)v4 + 58);
  v13 = (v12 & 1) == 0;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_advisoryType != *((_DWORD *)v4 + 27))
      goto LABEL_27;
    v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  -[GEOAdvisoryNotice readAll:](self, "readAll:", 1);
  v12 = -[GEOFormattedString hash](self->_noticeText, "hash");
  v3 = PBRepeatedUInt32Hash();
  v4 = -[NSMutableArray hash](self->_advisoryCards, "hash");
  v5 = -[NSMutableArray hash](self->_advisoryItems, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_shouldAlwaysShowAdvisoryCard;
  else
    v6 = 0;
  v7 = -[GEOFormattedString hash](self->_detailCardTitle, "hash");
  v8 = -[GEOPBTransitArtwork hash](self->_noticeArtwork, "hash");
  v9 = -[NSMutableArray hash](self->_analyticsMessageValues, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v10 = 2654435761 * self->_advisoryType;
  else
    v10 = 0;
  return v3 ^ v12 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOFormattedString *noticeText;
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
  GEOFormattedString *detailCardTitle;
  uint64_t v21;
  GEOPBTransitArtwork *noticeArtwork;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  noticeText = self->_noticeText;
  v6 = *((_QWORD *)v4 + 11);
  if (noticeText)
  {
    if (v6)
      -[GEOFormattedString mergeFrom:](noticeText, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOAdvisoryNotice setNoticeText:](self, "setNoticeText:");
  }
  v7 = objc_msgSend(v4, "incidentIndexsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[GEOAdvisoryNotice addIncidentIndex:](self, "addIncidentIndex:", objc_msgSend(v4, "incidentIndexAtIndex:", i));
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = *((id *)v4 + 6);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        -[GEOAdvisoryNotice addAdvisoryCard:](self, "addAdvisoryCard:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v12);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = *((id *)v4 + 7);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        -[GEOAdvisoryNotice addAdvisoryItem:](self, "addAdvisoryItem:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v17);
  }

  if ((*((_WORD *)v4 + 58) & 2) != 0)
  {
    self->_shouldAlwaysShowAdvisoryCard = *((_BYTE *)v4 + 112);
    *(_WORD *)&self->_flags |= 2u;
  }
  detailCardTitle = self->_detailCardTitle;
  v21 = *((_QWORD *)v4 + 9);
  if (detailCardTitle)
  {
    if (v21)
      -[GEOFormattedString mergeFrom:](detailCardTitle, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOAdvisoryNotice setDetailCardTitle:](self, "setDetailCardTitle:");
  }
  noticeArtwork = self->_noticeArtwork;
  v23 = *((_QWORD *)v4 + 10);
  if (noticeArtwork)
  {
    if (v23)
      -[GEOPBTransitArtwork mergeFrom:](noticeArtwork, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOAdvisoryNotice setNoticeArtwork:](self, "setNoticeArtwork:");
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = *((id *)v4 + 8);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        -[GEOAdvisoryNotice addAnalyticsMessageValue:](self, "addAnalyticsMessageValue:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m), (_QWORD)v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v26);
  }

  if ((*((_WORD *)v4 + 58) & 1) != 0)
  {
    self->_advisoryType = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOAdvisoryNoticeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_395);
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x404u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAdvisoryNotice readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_noticeText, "clearUnknownFields:", 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_advisoryCards;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_advisoryItems;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[GEOFormattedString clearUnknownFields:](self->_detailCardTitle, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_noticeArtwork, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noticeText, 0);
  objc_storeStrong((id *)&self->_noticeArtwork, 0);
  objc_storeStrong((id *)&self->_detailCardTitle, 0);
  objc_storeStrong((id *)&self->_analyticsMessageValues, 0);
  objc_storeStrong((id *)&self->_advisoryItems, 0);
  objc_storeStrong((id *)&self->_advisoryCards, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
