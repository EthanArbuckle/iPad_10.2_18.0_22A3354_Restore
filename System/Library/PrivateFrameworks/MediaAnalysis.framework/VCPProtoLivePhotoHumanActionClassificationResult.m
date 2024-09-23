@implementation VCPProtoLivePhotoHumanActionClassificationResult

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

- (BOOL)hasFaceId
{
  return self->_faceId != 0;
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
  v8.super_class = (Class)VCPProtoLivePhotoHumanActionClassificationResult;
  -[VCPProtoLivePhotoHumanActionClassificationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoHumanActionClassificationResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  VCPProtoBounds *bounds;
  void *v14;
  NSString *faceId;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  if (-[NSMutableArray count](self->_classifications, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_classifications, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_classifications;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("classification"));
  }
  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("bounds"));

  }
  faceId = self->_faceId;
  if (faceId)
    objc_msgSend(v3, "setObject:forKey:", faceId, CFSTR("faceId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoHumanActionClassificationResultReadFrom((uint64_t)self, (uint64_t)a3);
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

  PBDataWriterWriteSubmessage();
  if (self->_faceId)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setTimeRange:", self->_timeRange);
  if (-[VCPProtoLivePhotoHumanActionClassificationResult classificationsCount](self, "classificationsCount"))
  {
    objc_msgSend(v8, "clearClassifications");
    v4 = -[VCPProtoLivePhotoHumanActionClassificationResult classificationsCount](self, "classificationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[VCPProtoLivePhotoHumanActionClassificationResult classificationAtIndex:](self, "classificationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addClassification:", v7);

      }
    }
  }
  objc_msgSend(v8, "setBounds:", self->_bounds);
  if (self->_faceId)
    objc_msgSend(v8, "setFaceId:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_classifications;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addClassification:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  v16 = -[NSString copyWithZone:](self->_faceId, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  NSMutableArray *classifications;
  VCPProtoBounds *bounds;
  NSString *faceId;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[4]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && ((classifications = self->_classifications, !((unint64_t)classifications | v4[2]))
     || -[NSMutableArray isEqual:](classifications, "isEqual:"))
    && ((bounds = self->_bounds, !((unint64_t)bounds | v4[1])) || -[VCPProtoBounds isEqual:](bounds, "isEqual:")))
  {
    faceId = self->_faceId;
    if ((unint64_t)faceId | v4[3])
      v9 = -[NSString isEqual:](faceId, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  v4 = -[NSMutableArray hash](self->_classifications, "hash") ^ v3;
  v5 = -[VCPProtoBounds hash](self->_bounds, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_faceId, "hash");
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
  VCPProtoBounds *bounds;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 4);
  if (timeRange)
  {
    if (v6)
      -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else if (v6)
  {
    -[VCPProtoLivePhotoHumanActionClassificationResult setTimeRange:](self, "setTimeRange:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[VCPProtoLivePhotoHumanActionClassificationResult addClassification:](self, "addClassification:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  bounds = self->_bounds;
  v13 = *((_QWORD *)v4 + 1);
  if (bounds)
  {
    if (v13)
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else if (v13)
  {
    -[VCPProtoLivePhotoHumanActionClassificationResult setBounds:](self, "setBounds:");
  }
  if (*((_QWORD *)v4 + 3))
    -[VCPProtoLivePhotoHumanActionClassificationResult setFaceId:](self, "setFaceId:");

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (NSMutableArray)classifications
{
  return self->_classifications;
}

- (void)setClassifications:(id)a3
{
  objc_storeStrong((id *)&self->_classifications, a3);
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (NSString)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(id)a3
{
  objc_storeStrong((id *)&self->_faceId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_faceId, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  VCPProtoLivePhotoHumanActionClassificationResult *v8;
  VCPProtoLivePhotoHumanActionClassificationResult *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  VCPProtoLivePhotoHumanActionClassificationResult *v14;
  CMTimeRange v15;
  CMTimeRange v16;
  NSRect v17;

  v3 = (const __CFDictionary *)a3;
  memset(&v16, 0, sizeof(v16));
  CMTimeRangeMakeFromDictionary(&v16, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanBounds"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanActions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16.start.flags & 1) != 0)
  {
    v8 = 0;
    if ((v16.duration.flags & 1) != 0 && !v16.duration.epoch && (v16.duration.value & 0x8000000000000000) == 0)
    {
      v8 = 0;
      if (objc_msgSend(v4, "count"))
      {
        if (v5)
        {
          v10 = objc_alloc_init(VCPProtoLivePhotoHumanActionClassificationResult);
          v15 = v16;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoLivePhotoHumanActionClassificationResult setTimeRange:](v10, "setTimeRange:", v11);

          v17 = NSRectFromString(v5);
          +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoLivePhotoHumanActionClassificationResult setBounds:](v10, "setBounds:", v12);

          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __97__VCPProtoLivePhotoHumanActionClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke;
          v13[3] = &unk_1E6B174E8;
          v8 = v10;
          v14 = v8;
          objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
          if (v7)
            -[VCPProtoLivePhotoHumanActionClassificationResult setFaceId:](v8, "setFaceId:", v7);

        }
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __97__VCPProtoLivePhotoHumanActionClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
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
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CFDictionaryRef v16;
  void *v17;
  CMTimeRange v19;
  CMTimeRange range;
  NSRect v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[VCPProtoLivePhotoHumanActionClassificationResult classificationsCount](self, "classificationsCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0;
        i < -[VCPProtoLivePhotoHumanActionClassificationResult classificationsCount](self, "classificationsCount");
        ++i)
  {
    -[VCPProtoLivePhotoHumanActionClassificationResult classificationAtIndex:](self, "classificationAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "confidence");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v6, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, v10);

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("humanActions"));
  -[VCPProtoLivePhotoHumanActionClassificationResult bounds](self, "bounds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rectValue");
  NSStringFromRect(v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("humanBounds"));

  if (-[VCPProtoLivePhotoHumanActionClassificationResult hasFaceId](self, "hasFaceId"))
  {
    -[VCPProtoLivePhotoHumanActionClassificationResult faceId](self, "faceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("faceIdentifier"));

  }
  -[VCPProtoLivePhotoHumanActionClassificationResult timeRange](self, "timeRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "timeRangeValue");
  else
    memset(&v19, 0, sizeof(v19));
  range = v19;
  v16 = CMTimeRangeCopyAsDictionary(&range, 0);
  v17 = (void *)-[__CFDictionary mutableCopy](v16, "mutableCopy");

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v3, CFSTR("attributes"));
  return v17;
}

@end
