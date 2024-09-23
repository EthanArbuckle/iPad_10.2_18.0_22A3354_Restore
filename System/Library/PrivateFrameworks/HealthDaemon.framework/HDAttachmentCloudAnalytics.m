@implementation HDAttachmentCloudAnalytics

- (int64_t)numberOfAttachmentRecords
{
  return self->_numberOfAttachmentRecords;
}

- (void)setNumberOfAttachmentRecords:(int64_t)a3
{
  self->_numberOfAttachmentRecords = a3;
}

- (int64_t)numberOfReferenceRecords
{
  return self->_numberOfReferenceRecords;
}

- (void)setNumberOfReferenceRecords:(int64_t)a3
{
  self->_numberOfReferenceRecords = a3;
}

- (int64_t)numberOfTombstoneRecords
{
  return self->_numberOfTombstoneRecords;
}

- (void)setNumberOfTombstoneRecords:(int64_t)a3
{
  self->_numberOfTombstoneRecords = a3;
}

- (int64_t)numberOfOrphanedAttachmentRecords
{
  return self->_numberOfOrphanedAttachmentRecords;
}

- (void)setNumberOfOrphanedAttachmentRecords:(int64_t)a3
{
  self->_numberOfOrphanedAttachmentRecords = a3;
}

- (int64_t)numberOfOrphanedReferenceRecords
{
  return self->_numberOfOrphanedReferenceRecords;
}

- (void)setNumberOfOrphanedReferenceRecords:(int64_t)a3
{
  self->_numberOfOrphanedReferenceRecords = a3;
}

- (int64_t)percentageOfAttachmentsWithAssetData
{
  return self->_percentageOfAttachmentsWithAssetData;
}

- (void)setPercentageOfAttachmentsWithAssetData:(int64_t)a3
{
  self->_percentageOfAttachmentsWithAssetData = a3;
}

@end
