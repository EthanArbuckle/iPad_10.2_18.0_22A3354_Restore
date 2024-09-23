@implementation VCPProtoMovieClassificationResult

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
  v8.super_class = (Class)VCPProtoMovieClassificationResult;
  -[VCPProtoMovieClassificationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieClassificationResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_classifications;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("classification"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieClassificationResultReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (-[VCPProtoMovieClassificationResult classificationsCount](self, "classificationsCount"))
  {
    objc_msgSend(v8, "clearClassifications");
    v4 = -[VCPProtoMovieClassificationResult classificationsCount](self, "classificationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[VCPProtoMovieClassificationResult classificationAtIndex:](self, "classificationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addClassification:", v7);

      }
    }
  }

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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

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
        objc_msgSend(v5, "addClassification:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  NSMutableArray *classifications;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[2]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")))
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

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  return -[NSMutableArray hash](self->_classifications, "hash") ^ v3;
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
  v6 = *((_QWORD *)v4 + 2);
  if (timeRange)
  {
    if (v6)
      -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else if (v6)
  {
    -[VCPProtoMovieClassificationResult setTimeRange:](self, "setTimeRange:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
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
        -[VCPProtoMovieClassificationResult addClassification:](self, "addClassification:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
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

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  VCPProtoMovieClassificationResult *v6;
  VCPProtoMovieClassificationResult *v7;
  void *v8;
  _QWORD v10[4];
  VCPProtoMovieClassificationResult *v11;
  CMTimeRange v12;
  CMTimeRange v13;

  v3 = (const __CFDictionary *)a3;
  memset(&v13, 0, sizeof(v13));
  CMTimeRangeMakeFromDictionary(&v13, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v13.start.flags & 1) == 0)
  {
LABEL_2:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = 0;
  if ((v13.duration.flags & 1) != 0 && !v13.duration.epoch && (v13.duration.value & 0x8000000000000000) == 0)
  {
    if (objc_msgSend(v4, "count"))
    {
      v7 = objc_alloc_init(VCPProtoMovieClassificationResult);
      v12 = v13;
      +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoMovieClassificationResult setTimeRange:](v7, "setTimeRange:", v8);

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __82__VCPProtoMovieClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke;
      v10[3] = &unk_1E6B174E8;
      v6 = v7;
      v11 = v6;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

      goto LABEL_8;
    }
    goto LABEL_2;
  }
LABEL_8:

  return v6;
}

void __82__VCPProtoMovieClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
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
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFDictionaryRef v12;
  void *v13;
  CMTimeRange v15;
  CMTimeRange range;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[VCPProtoMovieClassificationResult classificationsCount](self, "classificationsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[VCPProtoMovieClassificationResult classificationsCount](self, "classificationsCount"); ++i)
  {
    -[VCPProtoMovieClassificationResult classificationAtIndex:](self, "classificationAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "confidence");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, v9);

  }
  -[VCPProtoMovieClassificationResult timeRange](self, "timeRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "timeRangeValue");
  else
    memset(&v15, 0, sizeof(v15));
  range = v15;
  v12 = CMTimeRangeCopyAsDictionary(&range, 0);
  v13 = (void *)-[__CFDictionary mutableCopy](v12, "mutableCopy");

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v3, CFSTR("attributes"));
  return v13;
}

@end
