@implementation VCPProtoMovieHumanActionClassificationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  VCPProtoMovieHumanActionClassificationResult *v9;
  VCPProtoMovieHumanActionClassificationResult *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  VCPProtoMovieHumanActionClassificationResult *v15;
  CMTimeRange v16;
  CMTimeRange v17;
  NSRect v18;

  v3 = (const __CFDictionary *)a3;
  memset(&v17, 0, sizeof(v17));
  CMTimeRangeMakeFromDictionary(&v17, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanBounds"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanActions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("torsoPrint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v17.start.flags & 1) != 0)
  {
    v9 = 0;
    if ((v17.duration.flags & 1) != 0 && !v17.duration.epoch)
    {
      v9 = 0;
      if ((v17.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
        {
          v10 = objc_alloc_init(VCPProtoMovieHumanActionClassificationResult);
          v16 = v17;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieHumanActionClassificationResult setTimeRange:](v10, "setTimeRange:", v11);

          v18 = NSRectFromString(v5);
          +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieHumanActionClassificationResult setBounds:](v10, "setBounds:", v12);

          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __93__VCPProtoMovieHumanActionClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke;
          v14[3] = &unk_1E6B174E8;
          v9 = v10;
          v15 = v9;
          objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);
          if (v7)
            -[VCPProtoMovieHumanActionClassificationResult setFaceId:](v9, "setFaceId:", v7);
          if (v8)
            -[VCPProtoMovieHumanActionClassificationResult setTorsoprint:](v9, "setTorsoprint:", v8);

        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __93__VCPProtoMovieHumanActionClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFDictionaryRef v17;
  void *v18;
  CMTimeRange v20;
  CMTimeRange range;
  NSRect v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieHumanActionClassificationResult bounds](self, "bounds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rectValue");
  NSStringFromRect(v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("humanBounds"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[VCPProtoMovieHumanActionClassificationResult classificationsCount](self, "classificationsCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[VCPProtoMovieHumanActionClassificationResult classificationsCount](self, "classificationsCount"); ++i)
  {
    -[VCPProtoMovieHumanActionClassificationResult classificationAtIndex:](self, "classificationAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "confidence");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v8, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, v12);

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("humanActions"));
  if (-[VCPProtoMovieHumanActionClassificationResult hasFaceId](self, "hasFaceId"))
  {
    -[VCPProtoMovieHumanActionClassificationResult faceId](self, "faceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("faceIdentifier"));

  }
  if (-[VCPProtoMovieHumanActionClassificationResult hasTorsoprint](self, "hasTorsoprint"))
  {
    -[VCPProtoMovieHumanActionClassificationResult torsoprint](self, "torsoprint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("torsoPrint"));

  }
  -[VCPProtoMovieHumanActionClassificationResult timeRange](self, "timeRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "timeRangeValue");
  else
    memset(&v20, 0, sizeof(v20));
  range = v20;
  v17 = CMTimeRangeCopyAsDictionary(&range, 0);
  v18 = (void *)-[__CFDictionary mutableCopy](v17, "mutableCopy");

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v3, CFSTR("attributes"));
  return v18;
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

- (BOOL)hasFaceId
{
  return self->_faceId != 0;
}

- (BOOL)hasTorsoprint
{
  return self->_torsoprint != 0;
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
  v8.super_class = (Class)VCPProtoMovieHumanActionClassificationResult;
  -[VCPProtoMovieHumanActionClassificationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieHumanActionClassificationResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoBounds *bounds;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSString *faceId;
  NSData *torsoprint;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("bounds"));

  }
  if (-[NSMutableArray count](self->_classifications, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_classifications, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_classifications;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("classification"));
  }
  faceId = self->_faceId;
  if (faceId)
    objc_msgSend(v3, "setObject:forKey:", faceId, CFSTR("faceId"));
  torsoprint = self->_torsoprint;
  if (torsoprint)
    objc_msgSend(v3, "setObject:forKey:", torsoprint, CFSTR("torsoprint"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieHumanActionClassificationResultReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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

  if (self->_faceId)
    PBDataWriterWriteStringField();
  if (self->_torsoprint)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setTimeRange:", self->_timeRange);
  objc_msgSend(v9, "setBounds:", self->_bounds);
  if (-[VCPProtoMovieHumanActionClassificationResult classificationsCount](self, "classificationsCount"))
  {
    objc_msgSend(v9, "clearClassifications");
    v4 = -[VCPProtoMovieHumanActionClassificationResult classificationsCount](self, "classificationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[VCPProtoMovieHumanActionClassificationResult classificationAtIndex:](self, "classificationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addClassification:", v7);

      }
    }
  }
  if (self->_faceId)
    objc_msgSend(v9, "setFaceId:");
  v8 = v9;
  if (self->_torsoprint)
  {
    objc_msgSend(v9, "setTorsoprint:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = self->_classifications;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addClassification:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_faceId, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  v18 = -[NSData copyWithZone:](self->_torsoprint, "copyWithZone:", a3);
  v19 = (void *)v5[5];
  v5[5] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  VCPProtoBounds *bounds;
  NSMutableArray *classifications;
  NSString *faceId;
  NSData *torsoprint;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[4]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && ((bounds = self->_bounds, !((unint64_t)bounds | v4[1])) || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && ((classifications = self->_classifications, !((unint64_t)classifications | v4[2]))
     || -[NSMutableArray isEqual:](classifications, "isEqual:"))
    && ((faceId = self->_faceId, !((unint64_t)faceId | v4[3]))
     || -[NSString isEqual:](faceId, "isEqual:")))
  {
    torsoprint = self->_torsoprint;
    if ((unint64_t)torsoprint | v4[5])
      v10 = -[NSData isEqual:](torsoprint, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  v4 = -[VCPProtoBounds hash](self->_bounds, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_classifications, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_faceId, "hash");
  return v6 ^ -[NSData hash](self->_torsoprint, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  VCPProtoBounds *bounds;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
    -[VCPProtoMovieHumanActionClassificationResult setTimeRange:](self, "setTimeRange:");
  }
  bounds = self->_bounds;
  v8 = *((_QWORD *)v4 + 1);
  if (bounds)
  {
    if (v8)
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else if (v8)
  {
    -[VCPProtoMovieHumanActionClassificationResult setBounds:](self, "setBounds:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 2);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[VCPProtoMovieHumanActionClassificationResult addClassification:](self, "addClassification:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if (*((_QWORD *)v4 + 3))
    -[VCPProtoMovieHumanActionClassificationResult setFaceId:](self, "setFaceId:");
  if (*((_QWORD *)v4 + 5))
    -[VCPProtoMovieHumanActionClassificationResult setTorsoprint:](self, "setTorsoprint:");

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (NSMutableArray)classifications
{
  return self->_classifications;
}

- (void)setClassifications:(id)a3
{
  objc_storeStrong((id *)&self->_classifications, a3);
}

- (NSString)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(id)a3
{
  objc_storeStrong((id *)&self->_faceId, a3);
}

- (NSData)torsoprint
{
  return self->_torsoprint;
}

- (void)setTorsoprint:(id)a3
{
  objc_storeStrong((id *)&self->_torsoprint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprint, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_faceId, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end
