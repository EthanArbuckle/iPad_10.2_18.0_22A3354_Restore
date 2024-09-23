@implementation NUStoragePoolStats

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[NUStoragePoolStats init](+[NUStoragePoolStats allocWithZone:](NUStoragePoolStats, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_peakTotalBytes;
  *((_QWORD *)result + 2) = self->_usedCount;
  *((_QWORD *)result + 3) = self->_usedBytes;
  *((_QWORD *)result + 4) = self->_peakUsedBytes;
  *((_QWORD *)result + 5) = self->_nonPurgeableCount;
  *((_QWORD *)result + 6) = self->_nonPurgeableBytes;
  *((_QWORD *)result + 7) = self->_peakNonPurgeableBytes;
  *((_QWORD *)result + 8) = self->_volatileCount;
  *((_QWORD *)result + 9) = self->_volatileBytes;
  *((_QWORD *)result + 10) = self->_peakVolatileBytes;
  *((_QWORD *)result + 11) = self->_discardedCount;
  *((_QWORD *)result + 12) = self->_migrationCount;
  *((_QWORD *)result + 13) = self->_migrationBytes;
  *((_QWORD *)result + 14) = self->_purgedCount;
  *((_QWORD *)result + 15) = self->_purgedBytes;
  *((_QWORD *)result + 16) = self->_requestCount;
  *((_QWORD *)result + 17) = self->_reusedNonPurgeableCount;
  *((_QWORD *)result + 18) = self->_reusedVolatileCount;
  return result;
}

- (void)setUsedBytes:(int64_t)a3
{
  int64_t peakUsedBytes;
  int64_t peakTotalBytes;
  int64_t v6;
  int64_t v7;

  peakUsedBytes = self->_peakUsedBytes;
  if (peakUsedBytes <= a3)
    peakUsedBytes = a3;
  self->_usedBytes = a3;
  self->_peakUsedBytes = peakUsedBytes;
  peakTotalBytes = self->_peakTotalBytes;
  v6 = -[NUStoragePoolStats totalBytes](self, "totalBytes");
  if (peakTotalBytes <= v6)
    v7 = v6;
  else
    v7 = peakTotalBytes;
  self->_peakTotalBytes = v7;
}

- (void)setNonPurgeableBytes:(int64_t)a3
{
  int64_t peakNonPurgeableBytes;
  int64_t peakTotalBytes;
  int64_t v6;
  int64_t v7;

  peakNonPurgeableBytes = self->_peakNonPurgeableBytes;
  if (peakNonPurgeableBytes <= a3)
    peakNonPurgeableBytes = a3;
  self->_nonPurgeableBytes = a3;
  self->_peakNonPurgeableBytes = peakNonPurgeableBytes;
  peakTotalBytes = self->_peakTotalBytes;
  v6 = -[NUStoragePoolStats totalBytes](self, "totalBytes");
  if (peakTotalBytes <= v6)
    v7 = v6;
  else
    v7 = peakTotalBytes;
  self->_peakTotalBytes = v7;
}

- (void)setVolatileBytes:(int64_t)a3
{
  int64_t peakVolatileBytes;
  int64_t peakTotalBytes;
  int64_t v6;
  int64_t v7;

  peakVolatileBytes = self->_peakVolatileBytes;
  if (peakVolatileBytes <= a3)
    peakVolatileBytes = a3;
  self->_volatileBytes = a3;
  self->_peakVolatileBytes = peakVolatileBytes;
  peakTotalBytes = self->_peakTotalBytes;
  v6 = -[NUStoragePoolStats totalBytes](self, "totalBytes");
  if (peakTotalBytes <= v6)
    v7 = v6;
  else
    v7 = peakTotalBytes;
  self->_peakTotalBytes = v7;
}

- (int64_t)totalCount
{
  int64_t v3;
  int64_t v4;

  v3 = -[NUStoragePoolStats usedCount](self, "usedCount");
  v4 = -[NUStoragePoolStats volatileCount](self, "volatileCount") + v3;
  return v4 + -[NUStoragePoolStats nonPurgeableCount](self, "nonPurgeableCount");
}

- (int64_t)totalBytes
{
  int64_t v3;
  int64_t v4;

  v3 = -[NUStoragePoolStats usedBytes](self, "usedBytes");
  v4 = -[NUStoragePoolStats volatileBytes](self, "volatileBytes") + v3;
  return v4 + -[NUStoragePoolStats nonPurgeableBytes](self, "nonPurgeableBytes");
}

- (int64_t)reusedCount
{
  int64_t v3;

  v3 = -[NUStoragePoolStats reusedNonPurgeableCount](self, "reusedNonPurgeableCount");
  return -[NUStoragePoolStats reusedVolatileCount](self, "reusedVolatileCount") + v3;
}

- (float)reusedRate
{
  float v3;

  if (!-[NUStoragePoolStats requestCount](self, "requestCount"))
    return 0.0;
  v3 = (float)-[NUStoragePoolStats reusedCount](self, "reusedCount");
  return v3 / (float)-[NUStoragePoolStats requestCount](self, "requestCount");
}

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  float v6;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[NUStoragePoolStats usedBytes](self, "usedBytes");
  NSLocalizedFileSizeDescription();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats peakUsedBytes](self, "peakUsedBytes");
  NSLocalizedFileSizeDescription();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats nonPurgeableBytes](self, "nonPurgeableBytes");
  NSLocalizedFileSizeDescription();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats peakNonPurgeableBytes](self, "peakNonPurgeableBytes");
  NSLocalizedFileSizeDescription();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats volatileBytes](self, "volatileBytes");
  NSLocalizedFileSizeDescription();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats peakVolatileBytes](self, "peakVolatileBytes");
  NSLocalizedFileSizeDescription();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats totalBytes](self, "totalBytes");
  NSLocalizedFileSizeDescription();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats peakTotalBytes](self, "peakTotalBytes");
  NSLocalizedFileSizeDescription();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats migrationBytes](self, "migrationBytes");
  NSLocalizedFileSizeDescription();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStoragePoolStats purgedBytes](self, "purgedBytes");
  NSLocalizedFileSizeDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  v11 = -[NUStoragePoolStats totalCount](self, "totalCount");
  v10 = -[NUStoragePoolStats usedCount](self, "usedCount");
  v9 = -[NUStoragePoolStats nonPurgeableCount](self, "nonPurgeableCount");
  v8 = -[NUStoragePoolStats volatileCount](self, "volatileCount");
  v4 = -[NUStoragePoolStats migrationCount](self, "migrationCount");
  v5 = -[NUStoragePoolStats purgedCount](self, "purgedCount");
  -[NUStoragePoolStats reusedRate](self, "reusedRate");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("\tTotal:     %ld (%@/%@)\n\t Used:     %ld (%@/%@)\n\t   NP:     %ld (%@/%@)\n\t    V:     %ld (%@/%@) migrations: %ld (%@)\n\tPurge:     %ld (%@)\n\tReuse:     %d%% (%ld/%ld) NP: %ld V: %ld\n\tDiscarded: %ld\n"), v11, v17, v15, v10, v22, v21, v9, v20, v19, v8, v18, v16, v4, v12, v5, v3,
    (int)rintf(v6 * 100.0),
    -[NUStoragePoolStats reusedCount](self, "reusedCount"),
    -[NUStoragePoolStats requestCount](self, "requestCount"),
    -[NUStoragePoolStats reusedNonPurgeableCount](self, "reusedNonPurgeableCount"),
    -[NUStoragePoolStats reusedVolatileCount](self, "reusedVolatileCount"),
    -[NUStoragePoolStats discardedCount](self, "discardedCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)peakTotalBytes
{
  return self->_peakTotalBytes;
}

- (int64_t)usedCount
{
  return self->_usedCount;
}

- (void)setUsedCount:(int64_t)a3
{
  self->_usedCount = a3;
}

- (int64_t)usedBytes
{
  return self->_usedBytes;
}

- (int64_t)peakUsedBytes
{
  return self->_peakUsedBytes;
}

- (int64_t)nonPurgeableCount
{
  return self->_nonPurgeableCount;
}

- (void)setNonPurgeableCount:(int64_t)a3
{
  self->_nonPurgeableCount = a3;
}

- (int64_t)nonPurgeableBytes
{
  return self->_nonPurgeableBytes;
}

- (int64_t)peakNonPurgeableBytes
{
  return self->_peakNonPurgeableBytes;
}

- (int64_t)volatileCount
{
  return self->_volatileCount;
}

- (void)setVolatileCount:(int64_t)a3
{
  self->_volatileCount = a3;
}

- (int64_t)volatileBytes
{
  return self->_volatileBytes;
}

- (int64_t)peakVolatileBytes
{
  return self->_peakVolatileBytes;
}

- (int64_t)discardedCount
{
  return self->_discardedCount;
}

- (void)setDiscardedCount:(int64_t)a3
{
  self->_discardedCount = a3;
}

- (int64_t)migrationCount
{
  return self->_migrationCount;
}

- (void)setMigrationCount:(int64_t)a3
{
  self->_migrationCount = a3;
}

- (int64_t)migrationBytes
{
  return self->_migrationBytes;
}

- (void)setMigrationBytes:(int64_t)a3
{
  self->_migrationBytes = a3;
}

- (int64_t)purgedCount
{
  return self->_purgedCount;
}

- (void)setPurgedCount:(int64_t)a3
{
  self->_purgedCount = a3;
}

- (int64_t)purgedBytes
{
  return self->_purgedBytes;
}

- (void)setPurgedBytes:(int64_t)a3
{
  self->_purgedBytes = a3;
}

- (int64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(int64_t)a3
{
  self->_requestCount = a3;
}

- (int64_t)reusedNonPurgeableCount
{
  return self->_reusedNonPurgeableCount;
}

- (void)setReusedNonPurgeableCount:(int64_t)a3
{
  self->_reusedNonPurgeableCount = a3;
}

- (int64_t)reusedVolatileCount
{
  return self->_reusedVolatileCount;
}

- (void)setReusedVolatileCount:(int64_t)a3
{
  self->_reusedVolatileCount = a3;
}

@end
