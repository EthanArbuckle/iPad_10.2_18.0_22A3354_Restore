@implementation ENExposureDetectionDaemonSessionStatistics

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(ENExposureDetectionDaemonSessionStatistics);
  *((_QWORD *)result + 2) = self->_droppedCachedKeyUpdatesCount;
  *((_QWORD *)result + 1) = self->_droppedKeyCount;
  *((_QWORD *)result + 3) = self->_fileKeyCount;
  *((_QWORD *)result + 4) = self->_fileInvalidKeyCount;
  *((_QWORD *)result + 5) = self->_invalidFileSignatureCount;
  *((_QWORD *)result + 6) = self->_matchedKeyCount;
  *((_QWORD *)result + 7) = self->_newCachedKeyCount;
  *((_QWORD *)result + 8) = self->_processedFileCount;
  *((_QWORD *)result + 9) = self->_revokedKeyCount;
  *((_QWORD *)result + 10) = self->_updatedCachedKeyCount;
  return result;
}

- (id)description
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v15;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v4 = 0;

  if (self->_processedFileCount)
  {
    NSAppendPrintF_safe();
    v5 = v4;

    NSAppendPrintF_safe();
    v4 = v5;

    if (self->_fileInvalidKeyCount)
    {
      NSAppendPrintF_safe();
      v6 = v4;

      v4 = v6;
    }
  }
  if (self->_invalidFileSignatureCount)
  {
    NSAppendPrintF_safe();
    v7 = v4;

    v4 = v7;
  }
  NSAppendPrintF_safe();
  v8 = v4;

  if (self->_revokedKeyCount)
  {
    NSAppendPrintF_safe();
    v9 = v8;

    v8 = v9;
  }
  if (self->_droppedKeyCount)
  {
    NSAppendPrintF_safe();
    v10 = v8;

    v8 = v10;
  }
  if (self->_newCachedKeyCount)
  {
    NSAppendPrintF_safe();
    v11 = v8;

    v8 = v11;
  }
  if (self->_updatedCachedKeyCount)
  {
    NSAppendPrintF_safe();
    v12 = v8;

    v8 = v12;
  }
  if (self->_droppedCachedKeyUpdatesCount)
  {
    NSAppendPrintF_safe();
    v13 = v8;

    v8 = v13;
  }
  return v8;
}

- (unint64_t)droppedKeyCount
{
  return self->_droppedKeyCount;
}

- (void)setDroppedKeyCount:(unint64_t)a3
{
  self->_droppedKeyCount = a3;
}

- (unint64_t)droppedCachedKeyUpdatesCount
{
  return self->_droppedCachedKeyUpdatesCount;
}

- (void)setDroppedCachedKeyUpdatesCount:(unint64_t)a3
{
  self->_droppedCachedKeyUpdatesCount = a3;
}

- (unint64_t)fileKeyCount
{
  return self->_fileKeyCount;
}

- (void)setFileKeyCount:(unint64_t)a3
{
  self->_fileKeyCount = a3;
}

- (unint64_t)fileInvalidKeyCount
{
  return self->_fileInvalidKeyCount;
}

- (void)setFileInvalidKeyCount:(unint64_t)a3
{
  self->_fileInvalidKeyCount = a3;
}

- (unint64_t)invalidFileSignatureCount
{
  return self->_invalidFileSignatureCount;
}

- (void)setInvalidFileSignatureCount:(unint64_t)a3
{
  self->_invalidFileSignatureCount = a3;
}

- (unint64_t)matchedKeyCount
{
  return self->_matchedKeyCount;
}

- (void)setMatchedKeyCount:(unint64_t)a3
{
  self->_matchedKeyCount = a3;
}

- (unint64_t)newCachedKeyCount
{
  return self->_newCachedKeyCount;
}

- (void)setNewCachedKeyCount:(unint64_t)a3
{
  self->_newCachedKeyCount = a3;
}

- (unint64_t)processedFileCount
{
  return self->_processedFileCount;
}

- (void)setProcessedFileCount:(unint64_t)a3
{
  self->_processedFileCount = a3;
}

- (unint64_t)revokedKeyCount
{
  return self->_revokedKeyCount;
}

- (void)setRevokedKeyCount:(unint64_t)a3
{
  self->_revokedKeyCount = a3;
}

- (unint64_t)updatedCachedKeyCount
{
  return self->_updatedCachedKeyCount;
}

- (void)setUpdatedCachedKeyCount:(unint64_t)a3
{
  self->_updatedCachedKeyCount = a3;
}

@end
