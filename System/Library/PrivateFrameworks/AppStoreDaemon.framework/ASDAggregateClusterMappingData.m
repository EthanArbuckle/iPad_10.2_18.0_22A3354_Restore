@implementation ASDAggregateClusterMappingData

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ASDAggregateClusterMappingData;
  -[ASDAggregateClusterMappingData dealloc](&v3, sel_dealloc);
}

- (unint64_t)clusterIDsCount
{
  return self->_clusterIDs.count;
}

- (int)clusterIDs
{
  return self->_clusterIDs.list;
}

- (void)clearClusterIDs
{
  PBRepeatedInt32Clear();
}

- (void)addClusterID:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)clusterIDAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_clusterIDs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_clusterIDs = &self->_clusterIDs;
  count = self->_clusterIDs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_clusterIDs->list[a3];
}

- (void)setClusterIDs:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)clusterVersionsCount
{
  return self->_clusterVersions.count;
}

- (int)clusterVersions
{
  return self->_clusterVersions.list;
}

- (void)clearClusterVersions
{
  PBRepeatedInt32Clear();
}

- (void)addClusterVersion:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)clusterVersionAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_clusterVersions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_clusterVersions = &self->_clusterVersions;
  count = self->_clusterVersions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_clusterVersions->list[a3];
}

- (void)setClusterVersions:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)clusterAppCountsCount
{
  return self->_clusterAppCounts.count;
}

- (int)clusterAppCounts
{
  return self->_clusterAppCounts.list;
}

- (void)clearClusterAppCounts
{
  PBRepeatedInt32Clear();
}

- (void)addClusterAppCount:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)clusterAppCountAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_clusterAppCounts;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_clusterAppCounts = &self->_clusterAppCounts;
  count = self->_clusterAppCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_clusterAppCounts->list[a3];
}

- (void)setClusterAppCounts:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)weightedAppLaunchesCount
{
  return self->_weightedAppLaunches.count;
}

- (int)weightedAppLaunches
{
  return self->_weightedAppLaunches.list;
}

- (void)clearWeightedAppLaunches
{
  PBRepeatedInt32Clear();
}

- (void)addWeightedAppLaunches:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)weightedAppLaunchesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_weightedAppLaunches;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_weightedAppLaunches = &self->_weightedAppLaunches;
  count = self->_weightedAppLaunches.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_weightedAppLaunches->list[a3];
}

- (void)setWeightedAppLaunches:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)weightedAppForgroundUsagesCount
{
  return self->_weightedAppForgroundUsages.count;
}

- (int)weightedAppForgroundUsages
{
  return self->_weightedAppForgroundUsages.list;
}

- (void)clearWeightedAppForgroundUsages
{
  PBRepeatedInt32Clear();
}

- (void)addWeightedAppForgroundUsage:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)weightedAppForgroundUsageAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_weightedAppForgroundUsages;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_weightedAppForgroundUsages = &self->_weightedAppForgroundUsages;
  count = self->_weightedAppForgroundUsages.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_weightedAppForgroundUsages->list[a3];
}

- (void)setWeightedAppForgroundUsages:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
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
  v8.super_class = (Class)ASDAggregateClusterMappingData;
  -[ASDAggregateClusterMappingData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDAggregateClusterMappingData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_encodingVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("encodingVersion"));

  PBRepeatedInt32NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("clusterID"));

  PBRepeatedInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("clusterVersion"));

  PBRepeatedInt32NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("clusterAppCount"));

  PBRepeatedInt32NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("weightedAppLaunches"));

  PBRepeatedInt32NSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("weightedAppForgroundUsage"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASDAggregateClusterMappingDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_weightedAppForgroundUsages;
  unint64_t v10;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_clusterIDs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clusterIDs.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v5;
      }
      while (v5 < self->_clusterIDs.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_clusterVersions.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clusterVersions.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_clusterVersions.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_clusterAppCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clusterAppCounts.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_clusterAppCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_weightedAppLaunches.count)
  {
    PBDataWriterPlaceMark();
    if (self->_weightedAppLaunches.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v8;
      }
      while (v8 < self->_weightedAppLaunches.count);
    }
    PBDataWriterRecallMark();
  }
  p_weightedAppForgroundUsages = &self->_weightedAppForgroundUsages;
  if (p_weightedAppForgroundUsages->count)
  {
    PBDataWriterPlaceMark();
    if (p_weightedAppForgroundUsages->count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < p_weightedAppForgroundUsages->count);
    }
    PBDataWriterRecallMark();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  unint64_t v13;
  unint64_t v14;
  uint64_t m;
  unint64_t v16;
  unint64_t v17;
  uint64_t n;
  _DWORD *v19;

  v19 = a3;
  v19[32] = self->_encodingVersion;
  if (-[ASDAggregateClusterMappingData clusterIDsCount](self, "clusterIDsCount"))
  {
    objc_msgSend(v19, "clearClusterIDs");
    v4 = -[ASDAggregateClusterMappingData clusterIDsCount](self, "clusterIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v19, "addClusterID:", -[ASDAggregateClusterMappingData clusterIDAtIndex:](self, "clusterIDAtIndex:", i));
    }
  }
  if (-[ASDAggregateClusterMappingData clusterVersionsCount](self, "clusterVersionsCount"))
  {
    objc_msgSend(v19, "clearClusterVersions");
    v7 = -[ASDAggregateClusterMappingData clusterVersionsCount](self, "clusterVersionsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v19, "addClusterVersion:", -[ASDAggregateClusterMappingData clusterVersionAtIndex:](self, "clusterVersionAtIndex:", j));
    }
  }
  if (-[ASDAggregateClusterMappingData clusterAppCountsCount](self, "clusterAppCountsCount"))
  {
    objc_msgSend(v19, "clearClusterAppCounts");
    v10 = -[ASDAggregateClusterMappingData clusterAppCountsCount](self, "clusterAppCountsCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v19, "addClusterAppCount:", -[ASDAggregateClusterMappingData clusterAppCountAtIndex:](self, "clusterAppCountAtIndex:", k));
    }
  }
  if (-[ASDAggregateClusterMappingData weightedAppLaunchesCount](self, "weightedAppLaunchesCount"))
  {
    objc_msgSend(v19, "clearWeightedAppLaunches");
    v13 = -[ASDAggregateClusterMappingData weightedAppLaunchesCount](self, "weightedAppLaunchesCount");
    if (v13)
    {
      v14 = v13;
      for (m = 0; m != v14; ++m)
        objc_msgSend(v19, "addWeightedAppLaunches:", -[ASDAggregateClusterMappingData weightedAppLaunchesAtIndex:](self, "weightedAppLaunchesAtIndex:", m));
    }
  }
  if (-[ASDAggregateClusterMappingData weightedAppForgroundUsagesCount](self, "weightedAppForgroundUsagesCount"))
  {
    objc_msgSend(v19, "clearWeightedAppForgroundUsages");
    v16 = -[ASDAggregateClusterMappingData weightedAppForgroundUsagesCount](self, "weightedAppForgroundUsagesCount");
    if (v16)
    {
      v17 = v16;
      for (n = 0; n != v17; ++n)
        objc_msgSend(v19, "addWeightedAppForgroundUsage:", -[ASDAggregateClusterMappingData weightedAppForgroundUsageAtIndex:](self, "weightedAppForgroundUsageAtIndex:", n));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[32] = self->_encodingVersion;
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_encodingVersion == v4[32]
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual())
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 2654435761 * self->_encodingVersion;
  v3 = PBRepeatedInt32Hash();
  v4 = v3 ^ PBRepeatedInt32Hash();
  v5 = v4 ^ PBRepeatedInt32Hash();
  v6 = v5 ^ PBRepeatedInt32Hash();
  return v2 ^ v6 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;
  id v20;

  v4 = a3;
  self->_encodingVersion = v4[32];
  v20 = v4;
  v5 = objc_msgSend(v4, "clusterIDsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[ASDAggregateClusterMappingData addClusterID:](self, "addClusterID:", objc_msgSend(v20, "clusterIDAtIndex:", i));
  }
  v8 = objc_msgSend(v20, "clusterVersionsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[ASDAggregateClusterMappingData addClusterVersion:](self, "addClusterVersion:", objc_msgSend(v20, "clusterVersionAtIndex:", j));
  }
  v11 = objc_msgSend(v20, "clusterAppCountsCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[ASDAggregateClusterMappingData addClusterAppCount:](self, "addClusterAppCount:", objc_msgSend(v20, "clusterAppCountAtIndex:", k));
  }
  v14 = objc_msgSend(v20, "weightedAppLaunchesCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[ASDAggregateClusterMappingData addWeightedAppLaunches:](self, "addWeightedAppLaunches:", objc_msgSend(v20, "weightedAppLaunchesAtIndex:", m));
  }
  v17 = objc_msgSend(v20, "weightedAppForgroundUsagesCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[ASDAggregateClusterMappingData addWeightedAppForgroundUsage:](self, "addWeightedAppForgroundUsage:", objc_msgSend(v20, "weightedAppForgroundUsageAtIndex:", n));
  }

}

- (int)encodingVersion
{
  return self->_encodingVersion;
}

- (void)setEncodingVersion:(int)a3
{
  self->_encodingVersion = a3;
}

@end
