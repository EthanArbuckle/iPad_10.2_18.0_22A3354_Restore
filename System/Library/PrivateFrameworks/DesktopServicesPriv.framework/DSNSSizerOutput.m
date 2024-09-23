@implementation DSNSSizerOutput

- (DSNSSizerOutput)initWithSizerOutput:(TSizerOutput *)a3
{
  DSNSSizerOutput *v4;
  DSNSSizerOutput *v5;
  __CFString *fRef;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSNSSizerOutput;
  v4 = -[DSNSSizerOutput init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_userVisibleItemCount = a3->var0;
    v4->_fsItemCount = a3->var1;
    v4->_logicalBytesTotal = a3->var2;
    v4->_physicalBytesTotal = a3->var3;
    v4->_mergeSourceNewerConflictsCount = a3->var5;
    v4->_mergeSourceItemsNotInDestinationCount = a3->var6;
    v4->_mergeDestinationItemsNotInSourceCount = a3->var7;
    v4->_mergeDestinationNewerConflictsBytes = a3->var8;
    v4->_mergeMatchedFilesCount = a3->var9;
    v4->_mergeMatchedFilesBytes = a3->var10;
    v4->_mergeDiffMetaDataFilesCount = a3->var11;
    v4->_mergeDestinationItemsNotInSourceCount = a3->var12;
    fRef = a3->var14.fString.fRef;
    v4->_mergePhysicalDelta = a3->var13;
    objc_storeStrong((id *)&v4->_sourcePath, fRef);
    objc_storeStrong((id *)&v5->_destinationPath, a3->var15.fString.fRef);
    v5->_conflictPhysicalDelta = a3->var16;
    v5->_maxFileSize = a3->var17;
    v5->_conflicts = a3->var18;
  }
  return v5;
}

- (DSNSSizerOutput)initWithSpaceNeeds:(DestinationSpaceNeeds *)a3
{
  DSNSSizerOutput *v4;
  DSNSSizerOutput *v5;
  uint64_t v6;
  NSString *sourcePath;
  uint64_t v8;
  NSString *destinationPath;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DSNSSizerOutput;
  v4 = -[DSNSSizerOutput init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_userVisibleItemCount = a3->var0;
    v4->_fsItemCount = a3->var1;
    v4->_logicalBytesTotal = a3->var2;
    v4->_physicalBytesTotal = a3->var3;
    v4->_mergeSourceNewerConflictsCount = a3->var4;
    v4->_mergeSourceItemsNotInDestinationCount = a3->var5;
    v4->_mergeDestinationItemsNotInSourceCount = a3->var6;
    v4->_mergeDestinationNewerConflictsBytes = a3->var7;
    v4->_mergeMatchedFilesCount = a3->var9;
    v4->_mergeMatchedFilesBytes = a3->var10;
    v4->_mergeDiffMetaDataFilesCount = a3->var11;
    v4->_mergeDestinationItemsNotInSourceCount = a3->var8;
    v4->_mergePhysicalDelta = a3->var12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var13);
    v6 = objc_claimAutoreleasedReturnValue();
    sourcePath = v5->_sourcePath;
    v5->_sourcePath = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var14);
    v8 = objc_claimAutoreleasedReturnValue();
    destinationPath = v5->_destinationPath;
    v5->_destinationPath = (NSString *)v8;

    v5->_conflictPhysicalDelta = a3->var15;
    v5->_maxFileSize = a3->var16;
    v5->_conflicts = a3->var18;
  }
  return v5;
}

- (int64_t)userVisibleItemCount
{
  return self->_userVisibleItemCount;
}

- (void)setUserVisibleItemCount:(int64_t)a3
{
  self->_userVisibleItemCount = a3;
}

- (int64_t)fsItemCount
{
  return self->_fsItemCount;
}

- (void)setFsItemCount:(int64_t)a3
{
  self->_fsItemCount = a3;
}

- (int64_t)logicalBytesTotal
{
  return self->_logicalBytesTotal;
}

- (void)setLogicalBytesTotal:(int64_t)a3
{
  self->_logicalBytesTotal = a3;
}

- (int64_t)physicalBytesTotal
{
  return self->_physicalBytesTotal;
}

- (void)setPhysicalBytesTotal:(int64_t)a3
{
  self->_physicalBytesTotal = a3;
}

- (int64_t)mergeSourceNewerConflictsCount
{
  return self->_mergeSourceNewerConflictsCount;
}

- (void)setMergeSourceNewerConflictsCount:(int64_t)a3
{
  self->_mergeSourceNewerConflictsCount = a3;
}

- (int64_t)mergeSourceItemsNotInDestinationCount
{
  return self->_mergeSourceItemsNotInDestinationCount;
}

- (void)setMergeSourceItemsNotInDestinationCount:(int64_t)a3
{
  self->_mergeSourceItemsNotInDestinationCount = a3;
}

- (int64_t)mergeDestinationNewerConflictsCount
{
  return self->_mergeDestinationNewerConflictsCount;
}

- (void)setMergeDestinationNewerConflictsCount:(int64_t)a3
{
  self->_mergeDestinationNewerConflictsCount = a3;
}

- (int64_t)mergeDestinationNewerConflictsBytes
{
  return self->_mergeDestinationNewerConflictsBytes;
}

- (void)setMergeDestinationNewerConflictsBytes:(int64_t)a3
{
  self->_mergeDestinationNewerConflictsBytes = a3;
}

- (int64_t)mergeMatchedFilesCount
{
  return self->_mergeMatchedFilesCount;
}

- (void)setMergeMatchedFilesCount:(int64_t)a3
{
  self->_mergeMatchedFilesCount = a3;
}

- (int64_t)mergeMatchedFilesBytes
{
  return self->_mergeMatchedFilesBytes;
}

- (void)setMergeMatchedFilesBytes:(int64_t)a3
{
  self->_mergeMatchedFilesBytes = a3;
}

- (int64_t)mergeDiffMetaDataFilesCount
{
  return self->_mergeDiffMetaDataFilesCount;
}

- (void)setMergeDiffMetaDataFilesCount:(int64_t)a3
{
  self->_mergeDiffMetaDataFilesCount = a3;
}

- (int64_t)mergeDestinationItemsNotInSourceCount
{
  return self->_mergeDestinationItemsNotInSourceCount;
}

- (void)setMergeDestinationItemsNotInSourceCount:(int64_t)a3
{
  self->_mergeDestinationItemsNotInSourceCount = a3;
}

- (int64_t)mergePhysicalDelta
{
  return self->_mergePhysicalDelta;
}

- (void)setMergePhysicalDelta:(int64_t)a3
{
  self->_mergePhysicalDelta = a3;
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePath, a3);
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationPath, a3);
}

- (int64_t)conflictPhysicalDelta
{
  return self->_conflictPhysicalDelta;
}

- (void)setConflictPhysicalDelta:(int64_t)a3
{
  self->_conflictPhysicalDelta = a3;
}

- (unint64_t)maxFileSize
{
  return self->_maxFileSize;
}

- (void)setMaxFileSize:(unint64_t)a3
{
  self->_maxFileSize = a3;
}

- (unsigned)conflicts
{
  return self->_conflicts;
}

- (void)setConflicts:(unsigned int)a3
{
  self->_conflicts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
}

@end
