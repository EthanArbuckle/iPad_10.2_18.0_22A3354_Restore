@implementation GEOPDFlyover

+ (id)flyoverForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__GEOPDFlyover_PlaceDataExtras__flyoverForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 13, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__GEOPDFlyover_PlaceDataExtras__flyoverForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue flyover](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (id)bestLocalizedAnnouncementMessage
{
  void *v2;
  void *v3;

  -[GEOPDFlyover notificationMessages](self, "notificationMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GEOPDFlyover)init
{
  GEOPDFlyover *v2;
  GEOPDFlyover *v3;
  GEOPDFlyover *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDFlyover;
  v2 = -[GEOPDFlyover init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDFlyover)initWithData:(id)a3
{
  GEOPDFlyover *v3;
  GEOPDFlyover *v4;
  GEOPDFlyover *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDFlyover;
  v3 = -[GEOPDFlyover initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEOPDFlyover clearCameraPaths](self, "clearCameraPaths");
  -[GEOPDFlyover clearLabelFrames](self, "clearLabelFrames");
  v3.receiver = self;
  v3.super_class = (Class)GEOPDFlyover;
  -[GEOPDFlyover dealloc](&v3, sel_dealloc);
}

- (void)_readCameraPaths
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFlyoverReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCameraPaths_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)cameraPathsCount
{
  -[GEOPDFlyover _readCameraPaths]((uint64_t)self);
  return self->_cameraPathsCount;
}

- (GEOPDCameraPathFrame)cameraPaths
{
  -[GEOPDFlyover _readCameraPaths]((uint64_t)self);
  return self->_cameraPaths;
}

- (uint64_t)_reserveCameraPaths:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 24);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (88 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 88 * v9, 0x83BB5EC5uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 32) = v9;
      *(_QWORD *)(a1 + 16) = result;
      bzero((void *)(result + 88 * *(_QWORD *)(a1 + 24)), 88 * (v9 - *(_QWORD *)(a1 + 24)));
      return 1;
    }
  }
  return result;
}

- (void)clearCameraPaths
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_cameraPathsSpace = 0;
  self->_cameraPathsCount = 0;
  free(self->_cameraPaths);
  self->_cameraPaths = 0;
}

- (void)addCameraPath:(GEOPDCameraPathFrame *)a3
{
  GEOPDCameraPathFrame v5;

  -[GEOPDFlyover _readCameraPaths]((uint64_t)self);
  v5 = *a3;
  if (self && -[GEOPDFlyover _reserveCameraPaths:]((uint64_t)self, 1uLL))
    self->_cameraPaths[self->_cameraPathsCount++] = v5;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (GEOPDCameraPathFrame)cameraPathAtIndex:(SEL)a3
{
  GEOPDCameraPathFrame *result;
  unint64_t cameraPathsCount;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOPDCameraPathFrame *v13;
  __int128 v14;
  __int128 v15;

  -[GEOPDFlyover _readCameraPaths]((uint64_t)self);
  cameraPathsCount = self->_cameraPathsCount;
  if (cameraPathsCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a4, cameraPathsCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  v13 = &self->_cameraPaths[a4];
  v14 = *(_OWORD *)&v13->var7;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&v13->var5;
  *(_OWORD *)&retstr->var7 = v14;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&v13->var9;
  *(_QWORD *)&retstr->var11 = *(_QWORD *)&v13->var11;
  v15 = *(_OWORD *)&v13->var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(_OWORD *)&retstr->var3 = v15;
  return result;
}

- (void)setCameraPaths:(GEOPDCameraPathFrame *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[GEOPDFlyover clearCameraPaths](self, "clearCameraPaths");
  if (-[GEOPDFlyover _reserveCameraPaths:]((uint64_t)self, a4))
  {
    memcpy(self->_cameraPaths, a3, 88 * a4);
    self->_cameraPathsCount = a4;
  }
}

- (BOOL)useSplines
{
  return self->_useSplines;
}

- (void)setUseSplines:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_useSplines = a3;
}

- (void)setHasUseSplines:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasUseSplines
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readLabelFrames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFlyoverReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabelFrames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)labelFramesCount
{
  -[GEOPDFlyover _readLabelFrames]((uint64_t)self);
  return self->_labelFramesCount;
}

- (GEOPDLabelFrame)labelFrames
{
  -[GEOPDFlyover _readLabelFrames]((uint64_t)self);
  return self->_labelFrames;
}

- (uint64_t)_reserveLabelFrames:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 56);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (16 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 40), 16 * v9, 0x55BF464EuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 56) = v9;
      *(_QWORD *)(a1 + 40) = result;
      bzero((void *)(result + 16 * *(_QWORD *)(a1 + 48)), 16 * (v9 - *(_QWORD *)(a1 + 48)));
      return 1;
    }
  }
  return result;
}

- (void)clearLabelFrames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_labelFramesSpace = 0;
  self->_labelFramesCount = 0;
  free(self->_labelFrames);
  self->_labelFrames = 0;
}

- (void)addLabelFrame:(GEOPDLabelFrame)a3
{
  uint64_t v3;
  uint64_t v4;
  GEOPDLabelFrame *v6;

  v3 = *(_QWORD *)&a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  -[GEOPDFlyover _readLabelFrames]((uint64_t)self);
  if (self && -[GEOPDFlyover _reserveLabelFrames:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_labelFrames[self->_labelFramesCount];
    *(_QWORD *)&v6->var0 = v4;
    *(_QWORD *)&v6->var2 = v3;
    ++self->_labelFramesCount;
  }
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (GEOPDLabelFrame)labelFrameAtIndex:(unint64_t)a3
{
  unint64_t labelFramesCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOPDLabelFrame *v10;
  uint64_t v11;
  uint64_t v12;
  GEOPDLabelFrame result;

  -[GEOPDFlyover _readLabelFrames]((uint64_t)self);
  labelFramesCount = self->_labelFramesCount;
  if (labelFramesCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, labelFramesCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  v10 = &self->_labelFrames[a3];
  v11 = *(_QWORD *)&v10->var0;
  v12 = *(_QWORD *)&v10->var2;
  result.var2 = *(float *)&v12;
  result.var3 = *($162FAC071EAEBA15A6F8D573D0754DF6 *)((char *)&v12 + 4);
  result.var0 = *(float *)&v11;
  result.var1 = HIDWORD(v11);
  return result;
}

- (void)setLabelFrames:(GEOPDLabelFrame *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[GEOPDFlyover clearLabelFrames](self, "clearLabelFrames");
  if (-[GEOPDFlyover _reserveLabelFrames:]((uint64_t)self, a4))
  {
    memcpy(self->_labelFrames, a3, 16 * a4);
    self->_labelFramesCount = a4;
  }
}

- (void)_readLabels
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFlyoverReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabels_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)labels
{
  -[GEOPDFlyover _readLabels]((uint64_t)self);
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *labels;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  labels = self->_labels;
  self->_labels = v4;

}

- (void)clearLabels
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_labels, "removeAllObjects");
}

- (void)addLabel:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDFlyover _readLabels]((uint64_t)self);
  -[GEOPDFlyover _addNoFlagsLabel:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsLabel:(uint64_t)a1
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

- (unint64_t)labelsCount
{
  -[GEOPDFlyover _readLabels]((uint64_t)self);
  return -[NSMutableArray count](self->_labels, "count");
}

- (id)labelAtIndex:(unint64_t)a3
{
  -[GEOPDFlyover _readLabels]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_labels, "objectAtIndex:", a3);
}

+ (Class)labelType
{
  return (Class)objc_opt_class();
}

- (void)_readNotificationMessages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFlyoverReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNotificationMessages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)notificationMessages
{
  -[GEOPDFlyover _readNotificationMessages]((uint64_t)self);
  return self->_notificationMessages;
}

- (void)setNotificationMessages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *notificationMessages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  notificationMessages = self->_notificationMessages;
  self->_notificationMessages = v4;

}

- (void)clearNotificationMessages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_notificationMessages, "removeAllObjects");
}

- (void)addNotificationMessage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDFlyover _readNotificationMessages]((uint64_t)self);
  -[GEOPDFlyover _addNoFlagsNotificationMessage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsNotificationMessage:(uint64_t)a1
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

- (unint64_t)notificationMessagesCount
{
  -[GEOPDFlyover _readNotificationMessages]((uint64_t)self);
  return -[NSMutableArray count](self->_notificationMessages, "count");
}

- (id)notificationMessageAtIndex:(unint64_t)a3
{
  -[GEOPDFlyover _readNotificationMessages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_notificationMessages, "objectAtIndex:", a3);
}

+ (Class)notificationMessageType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOPDFlyover;
  -[GEOPDFlyover description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDFlyover dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDFlyover _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  const __CFString *v33;
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
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 24));
    if (*(_QWORD *)(a1 + 24))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        _GEOPDCameraPathFrameDictionaryRepresentation(*(_QWORD *)(a1 + 16) + v6, a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        ++v7;
        v6 += 88;
      }
      while (v7 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v9 = CFSTR("cameraPath");
    else
      v9 = CFSTR("camera_path");
    objc_msgSend(v4, "setObject:forKey:", v5, v9);

  }
  if ((*(_BYTE *)(a1 + 96) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("useSplines");
    else
      v11 = CFSTR("use_splines");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(a1 + 48))
    {
      v13 = 0;
      v14 = 0;
      do
      {
        _GEOPDLabelFrameDictionaryRepresentation(*(_QWORD *)(a1 + 40) + v13, a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v15);

        ++v14;
        v13 += 16;
      }
      while (v14 < *(_QWORD *)(a1 + 48));
    }
    if (a2)
      v16 = CFSTR("labelFrame");
    else
      v16 = CFSTR("label_frame");
    objc_msgSend(v4, "setObject:forKey:", v12, v16);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v18 = *(id *)(a1 + 64);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("label"));
  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = *(id *)(a1 + 72);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v31, "jsonRepresentation");
          else
            objc_msgSend(v31, "dictionaryRepresentation", (_QWORD)v35);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v32, (_QWORD)v35);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v28);
    }

    if (a2)
      v33 = CFSTR("notificationMessage");
    else
      v33 = CFSTR("notification_message");
    objc_msgSend(v4, "setObject:forKey:", v25, v33, (_QWORD)v35);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDFlyover _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDFlyover)initWithDictionary:(id)a3
{
  return (GEOPDFlyover *)-[GEOPDFlyover _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  GEOPDLabelLocalizations *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  uint64_t v41;
  GEOLocalizedString *v42;
  uint64_t v43;
  void *v44;
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
  _OWORD v58[5];
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("cameraPath");
      else
        v6 = CFSTR("camera_path");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v67 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v65 = 0;
                v63 = 0u;
                v64 = 0u;
                v61 = 0u;
                v62 = 0u;
                v60 = 0u;
                _GEOPDCameraPathFrameFromDictionaryRepresentation(v13, (uint64_t)&v60, a3);
                v58[2] = v62;
                v58[3] = v63;
                v58[4] = v64;
                v59 = v65;
                v58[0] = v60;
                v58[1] = v61;
                objc_msgSend(a1, "addCameraPath:", v58);
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("useSplines");
      else
        v14 = CFSTR("use_splines");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setUseSplines:", objc_msgSend(v15, "BOOLValue"));

      if (a3)
        v16 = CFSTR("labelFrame");
      else
        v16 = CFSTR("label_frame");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v55 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v60 = 0uLL;
                _GEOPDLabelFrameFromDictionaryRepresentation(v23, (uint64_t)&v60, a3);
                objc_msgSend(a1, "addLabelFrame:", v60);
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
          }
          while (v20);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("label"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v51;
          do
          {
            for (k = 0; k != v27; ++k)
            {
              if (*(_QWORD *)v51 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = [GEOPDLabelLocalizations alloc];
                if ((a3 & 1) != 0)
                  v32 = -[GEOPDLabelLocalizations initWithJSON:](v31, "initWithJSON:", v30);
                else
                  v32 = -[GEOPDLabelLocalizations initWithDictionary:](v31, "initWithDictionary:", v30);
                v33 = (void *)v32;
                objc_msgSend(a1, "addLabel:", v32);

              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
          }
          while (v27);
        }

      }
      if (a3)
        v34 = CFSTR("notificationMessage");
      else
        v34 = CFSTR("notification_message");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v36 = v35;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v47;
          do
          {
            for (m = 0; m != v38; ++m)
            {
              if (*(_QWORD *)v47 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = [GEOLocalizedString alloc];
                if ((a3 & 1) != 0)
                  v43 = -[GEOLocalizedString initWithJSON:](v42, "initWithJSON:", v41);
                else
                  v43 = -[GEOLocalizedString initWithDictionary:](v42, "initWithDictionary:", v41);
                v44 = (void *)v43;
                objc_msgSend(a1, "addNotificationMessage:", v43);

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
          }
          while (v38);
        }

      }
    }
  }

  return a1;
}

- (GEOPDFlyover)initWithJSON:(id)a3
{
  return (GEOPDFlyover *)-[GEOPDFlyover _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_71;
    else
      v8 = (int *)&readAll__nonRecursiveTag_71;
    GEOPDFlyoverReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDFlyoverCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDFlyoverIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDFlyoverReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDFlyoverIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDFlyover readAll:](self, "readAll:", 0);
    if (self->_cameraPathsCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v28 = 0;
        PBDataWriterPlaceMark();
        GEOPDCameraPathFrameWriteTo((uint64_t)&self->_cameraPaths[v6]);
        PBDataWriterRecallMark();
        ++v7;
        ++v6;
      }
      while (v7 < self->_cameraPathsCount);
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_labelFramesCount)
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v28 = 0;
        PBDataWriterPlaceMark();
        GEOPDLabelFrameWriteTo((uint64_t)&self->_labelFrames[v8]);
        PBDataWriterRecallMark();
        ++v9;
        ++v8;
      }
      while (v9 < self->_labelFramesCount);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_labels;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_notificationMessages;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v15);
    }

  }
}

- (void)copyTo:(id)a3
{
  id *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  _BYTE v21[88];

  v4 = (id *)a3;
  -[GEOPDFlyover readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 20) = self->_readerMarkPos;
  *((_DWORD *)v4 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPDFlyover cameraPathsCount](self, "cameraPathsCount"))
  {
    objc_msgSend(v4, "clearCameraPaths");
    v5 = -[GEOPDFlyover cameraPathsCount](self, "cameraPathsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOPDFlyover cameraPathAtIndex:](self, "cameraPathAtIndex:", i);
        objc_msgSend(v4, "addCameraPath:", v21);
      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v4 + 92) = self->_useSplines;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  if (-[GEOPDFlyover labelFramesCount](self, "labelFramesCount"))
  {
    objc_msgSend(v4, "clearLabelFrames");
    v8 = -[GEOPDFlyover labelFramesCount](self, "labelFramesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        v11 = -[GEOPDFlyover labelFrameAtIndex:](self, "labelFrameAtIndex:", j);
        objc_msgSend(v4, "addLabelFrame:", v11, v12);
      }
    }
  }
  if (-[GEOPDFlyover labelsCount](self, "labelsCount"))
  {
    objc_msgSend(v4, "clearLabels");
    v13 = -[GEOPDFlyover labelsCount](self, "labelsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOPDFlyover labelAtIndex:](self, "labelAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addLabel:", v16);

      }
    }
  }
  if (-[GEOPDFlyover notificationMessagesCount](self, "notificationMessagesCount"))
  {
    objc_msgSend(v4, "clearNotificationMessages");
    v17 = -[GEOPDFlyover notificationMessagesCount](self, "notificationMessagesCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEOPDFlyover notificationMessageAtIndex:](self, "notificationMessageAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addNotificationMessage:", v20);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  unint64_t cameraPathsCount;
  unint64_t labelFramesCount;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
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
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDFlyoverReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_25;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDFlyover readAll:](self, "readAll:", 0);
  cameraPathsCount = self->_cameraPathsCount;
  if (cameraPathsCount)
  {
    -[GEOPDFlyover _reserveCameraPaths:](v5, cameraPathsCount);
    memcpy(*(void **)(v5 + 16), self->_cameraPaths, 88 * self->_cameraPathsCount);
    *(_QWORD *)(v5 + 24) = self->_cameraPathsCount;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 92) = self->_useSplines;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  labelFramesCount = self->_labelFramesCount;
  if (labelFramesCount)
  {
    -[GEOPDFlyover _reserveLabelFrames:](v5, labelFramesCount);
    memcpy(*(void **)(v5 + 40), self->_labelFrames, 16 * self->_labelFramesCount);
    *(_QWORD *)(v5 + 48) = self->_labelFramesCount;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_labels;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLabel:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_notificationMessages;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v8);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addNotificationMessage:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
LABEL_25:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t cameraPathsCount;
  char v6;
  unint64_t labelFramesCount;
  NSMutableArray *labels;
  NSMutableArray *notificationMessages;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_4;
  -[GEOPDFlyover readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  cameraPathsCount = self->_cameraPathsCount;
  if ((const void *)cameraPathsCount != v4[3] || memcmp(self->_cameraPaths, v4[2], 88 * cameraPathsCount))
    goto LABEL_4;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    if (((_BYTE)v4[12] & 1) == 0)
      goto LABEL_14;
LABEL_4:
    v6 = 0;
    goto LABEL_5;
  }
  if (((_BYTE)v4[12] & 1) == 0)
    goto LABEL_4;
  if (self->_useSplines)
  {
    if (!*((_BYTE *)v4 + 92))
      goto LABEL_4;
  }
  else if (*((_BYTE *)v4 + 92))
  {
    goto LABEL_4;
  }
LABEL_14:
  labelFramesCount = self->_labelFramesCount;
  if ((const void *)labelFramesCount != v4[6])
    goto LABEL_4;
  if (memcmp(self->_labelFrames, v4[5], 16 * labelFramesCount))
    goto LABEL_4;
  labels = self->_labels;
  if ((unint64_t)labels | (unint64_t)v4[8])
  {
    if (!-[NSMutableArray isEqual:](labels, "isEqual:"))
      goto LABEL_4;
  }
  notificationMessages = self->_notificationMessages;
  if ((unint64_t)notificationMessages | (unint64_t)v4[9])
    v6 = -[NSMutableArray isEqual:](notificationMessages, "isEqual:");
  else
    v6 = 1;
LABEL_5:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDFlyover readAll:](self, "readAll:", 1);
  v3 = PBHashBytes();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_useSplines;
  else
    v4 = 0;
  v5 = v4 ^ PBHashBytes();
  v6 = v5 ^ -[NSMutableArray hash](self->_labels, "hash");
  return v6 ^ -[NSMutableArray hash](self->_notificationMessages, "hash") ^ v3;
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
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[5];
  uint64_t v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "cameraPathsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      if (v4)
      {
        objc_msgSend(v4, "cameraPathAtIndex:", i);
      }
      else
      {
        v32 = 0;
        memset(v31, 0, sizeof(v31));
      }
      -[GEOPDFlyover addCameraPath:](self, "addCameraPath:", v31);
    }
  }
  if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    self->_useSplines = *((_BYTE *)v4 + 92);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v8 = objc_msgSend(v4, "labelFramesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
    {
      v11 = objc_msgSend(v4, "labelFrameAtIndex:", j);
      -[GEOPDFlyover addLabelFrame:](self, "addLabelFrame:", v11, v12);
    }
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = *((id *)v4 + 8);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        -[GEOPDFlyover addLabel:](self, "addLabel:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v15);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = *((id *)v4 + 9);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (m = 0; m != v20; ++m)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        -[GEOPDFlyover addNotificationMessage:](self, "addNotificationMessage:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * m), (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v20);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationMessages, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestLocalizedLabelAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[GEOPDFlyover labelsCount](self, "labelsCount") >= a3)
  {
    -[GEOPDFlyover labelAtIndex:](self, "labelAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestLocalizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
