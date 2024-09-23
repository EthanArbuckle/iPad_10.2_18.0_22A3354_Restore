@implementation VCPProtoMovieSafetyResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  VCPProtoMovieSafetyResult *v7;
  VCPProtoMovieSafetyResult *v8;
  void *v9;
  _QWORD v11[4];
  VCPProtoMovieSafetyResult *v12;
  CMTimeRange v13;
  CMTimeRange v14;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, (CFDictionaryRef)v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Sensitivity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SensitivitySceneResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14.start.flags & 1) != 0)
  {
    v7 = 0;
    if ((v14.duration.flags & 1) != 0 && !v14.duration.epoch)
    {
      v7 = 0;
      if ((v14.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
        {
          v8 = objc_alloc_init(VCPProtoMovieSafetyResult);
          v13 = v14;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieSafetyResult setTimeRange:](v8, "setTimeRange:", v9);

          -[VCPProtoMovieSafetyResult setSensitivity:](v8, "setSensitivity:", objc_msgSend(v5, "intValue"));
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __74__VCPProtoMovieSafetyResult_LegacyConversion__resultFromLegacyDictionary___block_invoke;
          v11[3] = &unk_1E6B174E8;
          v7 = v8;
          v12 = v7;
          objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __74__VCPProtoMovieSafetyResult_LegacyConversion__resultFromLegacyDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  VCPProtoClassification *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = objc_alloc_init(VCPProtoClassification);
  -[VCPProtoClassification setIdentifier:](v6, "setIdentifier:", objc_msgSend(v7, "longLongValue"));
  objc_msgSend(v5, "floatValue");
  -[VCPProtoClassification setConfidence:](v6, "setConfidence:");
  objc_msgSend(*(id *)(a1 + 32), "addClassification:", v6);

}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  unint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CMTimeRange v17;
  CMTimeRange range;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[VCPProtoMovieSafetyResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v17, 0, sizeof(v17));
  range = v17;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[VCPProtoMovieSafetyResult classificationsCount](self, "classificationsCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0;
        i < -[VCPProtoMovieSafetyResult classificationsCount](self, "classificationsCount", *(_OWORD *)&v17.start.value, *(_OWORD *)&v17.start.epoch, *(_OWORD *)&v17.duration.timescale);
        ++i)
  {
    -[VCPProtoMovieSafetyResult classificationAtIndex:](self, "classificationAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "confidence");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, v13);

  }
  v19[0] = CFSTR("Sensitivity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoMovieSafetyResult sensitivity](self, "sensitivity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("SensitivitySceneResults");
  v20[0] = v14;
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("attributes"));

  return v6;
}

- (void)clearClassifications
{
  -[NSMutableArray removeAllObjects](self->_classifications, "removeAllObjects");
}

- (void)addClassification:(id)a3
{
  id v4;
  NSMutableArray *classifications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  classifications = self->_classifications;
  v8 = v4;
  if (!classifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_classifications;
    self->_classifications = v6;

    v4 = v8;
    classifications = self->_classifications;
  }
  -[NSMutableArray addObject:](classifications, "addObject:", v4);

}

- (unint64_t)classificationsCount
{
  return -[NSMutableArray count](self->_classifications, "count");
}

- (id)classificationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_classifications, "objectAtIndex:", a3);
}

+ (Class)classificationType
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
  v8.super_class = (Class)VCPProtoMovieSafetyResult;
  -[VCPProtoMovieSafetyResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieSafetyResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  VCPProtoTimeRange *timeRange;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sensitivity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sensitivity"));

  if (-[NSMutableArray count](self->_classifications, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_classifications, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_classifications;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("classification"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSafetyResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_classifications;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "setTimeRange:", self->_timeRange);
  v8[4] = self->_sensitivity;
  if (-[VCPProtoMovieSafetyResult classificationsCount](self, "classificationsCount"))
  {
    objc_msgSend(v8, "clearClassifications");
    v4 = -[VCPProtoMovieSafetyResult classificationsCount](self, "classificationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[VCPProtoMovieSafetyResult classificationAtIndex:](self, "classificationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addClassification:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 16) = self->_sensitivity;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_classifications;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addClassification:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  NSMutableArray *classifications;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[3]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_sensitivity == *((_DWORD *)v4 + 4))
  {
    classifications = self->_classifications;
    if ((unint64_t)classifications | v4[1])
      v7 = -[NSMutableArray isEqual:](classifications, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  v4 = 2654435761 * self->_sensitivity;
  return v4 ^ v3 ^ -[NSMutableArray hash](self->_classifications, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 3);
  if (timeRange)
  {
    if (v6)
      -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else if (v6)
  {
    -[VCPProtoMovieSafetyResult setTimeRange:](self, "setTimeRange:");
  }
  self->_sensitivity = *((_DWORD *)v4 + 4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[VCPProtoMovieSafetyResult addClassification:](self, "addClassification:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (int)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(int)a3
{
  self->_sensitivity = a3;
}

- (NSMutableArray)classifications
{
  return self->_classifications;
}

- (void)setClassifications:(id)a3
{
  objc_storeStrong((id *)&self->_classifications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
}

@end
