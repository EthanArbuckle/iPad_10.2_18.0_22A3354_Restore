@implementation BatchMetadata

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (void)setBatchIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)timestampReferenceIdentifier
{
  return self->_timestampReferenceIdentifier;
}

- (void)setTimestampReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (int)batchStatus
{
  return self->_batchStatus;
}

- (void)setBatchStatus:(int)a3
{
  self->_batchStatus = a3;
}

- (unint64_t)processedAttempts
{
  return self->_processedAttempts;
}

- (void)setProcessedAttempts:(unint64_t)a3
{
  self->_processedAttempts = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)dateLastProcessed
{
  return self->_dateLastProcessed;
}

- (void)setDateLastProcessed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)dateUploaded
{
  return self->_dateUploaded;
}

- (void)setDateUploaded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unint64_t)a3
{
  self->_eventCount = a3;
}

- (NSNumber)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_dateUploaded, 0);
  objc_storeStrong((id *)&self->_dateLastProcessed, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_timestampReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
}

@end
