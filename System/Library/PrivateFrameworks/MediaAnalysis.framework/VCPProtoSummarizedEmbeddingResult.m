@implementation VCPProtoSummarizedEmbeddingResult

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoSummarizedEmbeddingResult;
  -[VCPProtoSummarizedEmbeddingResult dealloc](&v3, sel_dealloc);
}

- (unint64_t)embeddingIDsCount
{
  return self->_embeddingIDs.count;
}

- (unsigned)embeddingIDs
{
  return self->_embeddingIDs.list;
}

- (void)clearEmbeddingIDs
{
  PBRepeatedUInt32Clear();
}

- (void)addEmbeddingID:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)embeddingIDAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_embeddingIDs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_embeddingIDs = &self->_embeddingIDs;
  count = self->_embeddingIDs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_embeddingIDs->list[a3];
}

- (void)setEmbeddingIDs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)VCPProtoSummarizedEmbeddingResult;
  -[VCPProtoSummarizedEmbeddingResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoSummarizedEmbeddingResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  PBRepeatedUInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("embeddingID"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoSummarizedEmbeddingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_embeddingIDs;
  unint64_t v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteSubmessage();
  p_embeddingIDs = &self->_embeddingIDs;
  if (p_embeddingIDs->count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_embeddingIDs->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setTimeRange:", self->_timeRange);
  if (-[VCPProtoSummarizedEmbeddingResult embeddingIDsCount](self, "embeddingIDsCount"))
  {
    objc_msgSend(v7, "clearEmbeddingIDs");
    v4 = -[VCPProtoSummarizedEmbeddingResult embeddingIDsCount](self, "embeddingIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addEmbeddingID:", -[VCPProtoSummarizedEmbeddingResult embeddingIDAtIndex:](self, "embeddingIDAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[4]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")))
  {
    IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD *v10;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = v4[4];
  v10 = v4;
  if (timeRange)
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoSummarizedEmbeddingResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v10;
LABEL_7:
  v7 = objc_msgSend(v4, "embeddingIDsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[VCPProtoSummarizedEmbeddingResult addEmbeddingID:](self, "addEmbeddingID:", objc_msgSend(v10, "embeddingIDAtIndex:", i));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  VCPProtoSummarizedEmbeddingResult *v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTimeRange v26;
  CMTimeRange v27;
  _QWORD v28[18];

  v28[16] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v27, 0, sizeof(v27));
  CMTimeRangeMakeFromDictionary(&v27, (CFDictionaryRef)v3);
  if ((v27.start.flags & 1) != 0)
  {
    v5 = 0;
    if ((v27.duration.flags & 1) != 0 && !v27.duration.epoch)
    {
      v5 = 0;
      if ((v27.duration.value & 0x8000000000000000) == 0)
      {
        if (v4)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("embeddingIds"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count"))
          {
            v5 = objc_alloc_init(VCPProtoSummarizedEmbeddingResult);
            v26 = v27;
            +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v26);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPProtoSummarizedEmbeddingResult setTimeRange:](v5, "setTimeRange:", v8);

            v9 = objc_msgSend(v7, "count");
            MEMORY[0x1E0C80A78]((_QWORD *)(4 * v9), v9, v10, v11);
            v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v14 = v7;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
            if (v15)
            {
              v20 = (uint64_t)&v20;
              v21 = v7;
              v16 = 0;
              v17 = *(_QWORD *)v23;
              do
              {
                v18 = 0;
                v19 = v16;
                do
                {
                  if (*(_QWORD *)v23 != v17)
                    objc_enumerationMutation(v14);
                  *(_DWORD *)&v13[4 * (v19 + v18)] = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "unsignedIntValue", v20);
                  ++v18;
                }
                while (v15 != v18);
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
                v16 = v19 + v18;
              }
              while (v15);
              v15 = (v19 + v18);
              v7 = v21;
            }

            -[VCPProtoSummarizedEmbeddingResult setEmbeddingIDs:count:](v5, "setEmbeddingIDs:count:", v13, v15);
          }
          else
          {
            v5 = 0;
          }

        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  unint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  CMTimeRange v13;
  CMTimeRange range;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[VCPProtoSummarizedEmbeddingResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v13, 0, sizeof(v13));
  range = v13;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[VCPProtoSummarizedEmbeddingResult embeddingIDsCount](self, "embeddingIDsCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0;
        i < -[VCPProtoSummarizedEmbeddingResult embeddingIDsCount](self, "embeddingIDsCount", *(_OWORD *)&v13.start.value, *(_OWORD *)&v13.start.epoch, *(_OWORD *)&v13.duration.timescale);
        ++i)
  {
    v9 = -[VCPProtoSummarizedEmbeddingResult embeddingIDAtIndex:](self, "embeddingIDAtIndex:", i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  v15 = CFSTR("embeddingIds");
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("attributes"));

  return v6;
}

@end
