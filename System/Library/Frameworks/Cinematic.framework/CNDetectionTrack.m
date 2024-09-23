@implementation CNDetectionTrack

- (CNDetectionType)detectionType
{
  return -[PTCinematographyTrack detectionType](self->_internalTrack, "detectionType");
}

- (CNDetectionID)detectionID
{
  return -[PTCinematographyTrack trackIdentifier](self->_internalTrack, "trackIdentifier");
}

- (CNDetectionGroupID)detectionGroupID
{
  return -[PTCinematographyTrack groupIdentifier](self->_internalTrack, "groupIdentifier");
}

- (BOOL)isUserCreated
{
  return -[PTCinematographyTrack isUserCreated](self->_internalTrack, "isUserCreated");
}

- (BOOL)isDiscrete
{
  return -[PTCinematographyTrack isDiscrete](self->_internalTrack, "isDiscrete");
}

- (CNDetection)detectionAtOrBeforeTime:(CMTime *)time
{
  PTCinematographyTrack *internalTrack;
  void *v4;
  id v5;
  CMTime v7;

  internalTrack = self->_internalTrack;
  v7 = *time;
  -[PTCinematographyTrack detectionAtOrBeforeTime:](internalTrack, "detectionAtOrBeforeTime:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = +[CNDetection _copyDetectionFromInternal:](CNDetection, "_copyDetectionFromInternal:", v4);
  else
    v5 = 0;

  return (CNDetection *)v5;
}

- (CNDetection)detectionNearestTime:(CMTime *)time
{
  PTCinematographyTrack *internalTrack;
  void *v4;
  id v5;
  CMTime v7;

  internalTrack = self->_internalTrack;
  v7 = *time;
  -[PTCinematographyTrack detectionNearestTime:](internalTrack, "detectionNearestTime:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = +[CNDetection _copyDetectionFromInternal:](CNDetection, "_copyDetectionFromInternal:", v4);
  else
    v5 = 0;

  return (CNDetection *)v5;
}

- (NSArray)detectionsInTimeRange:(CMTimeRange *)timeRange
{
  PTCinematographyTrack *internalTrack;
  __int128 v4;
  void *v5;
  id v6;
  _OWORD v8[3];

  internalTrack = self->_internalTrack;
  v4 = *(_OWORD *)&timeRange->start.epoch;
  v8[0] = *(_OWORD *)&timeRange->start.value;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[PTCinematographyTrack detectionsInTimeRange:](internalTrack, "detectionsInTimeRange:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CNDetection _copyDetectionsFromInternal:](CNDetection, "_copyDetectionsFromInternal:", v5);

  return (NSArray *)v6;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CNDetectionTrack internalTrack](self, "internalTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)_initWithInternal:(id)a3
{
  id v4;
  CNDetectionTrack *v5;
  uint64_t v6;
  PTCinematographyTrack *internalTrack;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNDetectionTrack;
  v5 = -[CNDetectionTrack init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    internalTrack = v5->_internalTrack;
    v5->_internalTrack = (PTCinematographyTrack *)v6;

  }
  return v5;
}

- (PTCinematographyTrack)internalTrack
{
  return (PTCinematographyTrack *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalTrack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTrack, 0);
}

+ (id)_trackFromInternal:(id)a3
{
  id v3;
  __objc2_class **v4;
  char isKindOfClass;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = off_25044F160;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = off_25044F158;
    if ((isKindOfClass & 1) != 0)
      v4 = off_25044F140;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v4), "_initWithInternal:", v3);

  return v6;
}

+ (id)_tracksFromInternal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_trackFromInternal:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (id)_internalFromTracks:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "internalTrack", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

@end
