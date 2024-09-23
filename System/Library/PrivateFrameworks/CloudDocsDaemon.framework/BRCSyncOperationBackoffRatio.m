@implementation BRCSyncOperationBackoffRatio

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCSyncOperationBackoffRatio)init
{
  BRCSyncOperationBackoffRatio *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCSyncOperationBackoffRatio;
  result = -[BRCSyncOperationBackoffRatio init](&v3, sel_init);
  if (result)
  {
    result->_totalSyncOperations = 0;
    result->_failedSyncOperations = 0;
  }
  return result;
}

- (BRCSyncOperationBackoffRatio)initWithCoder:(id)a3
{
  id v4;
  BRCSyncOperationBackoffRatio *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCSyncOperationBackoffRatio;
  v5 = -[BRCSyncOperationBackoffRatio init](&v7, sel_init);
  if (v5)
  {
    v5->_totalSyncOperations = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalSyncOperations"));
    v5->_failedSyncOperations = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("failedSyncOperations"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t totalSyncOperations;
  id v5;

  totalSyncOperations = self->_totalSyncOperations;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", totalSyncOperations, CFSTR("totalSyncOperations"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_failedSyncOperations, CFSTR("failedSyncOperations"));

}

- (float)backoffRatio
{
  unint64_t totalSyncOperations;
  void *v4;
  unint64_t v5;
  float result;

  totalSyncOperations = self->_totalSyncOperations;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "minimumNumberOfFailuresBeforeReportingSyncBackoffRatio");

  result = 0.0;
  if (totalSyncOperations >= v5)
    return (float)self->_failedSyncOperations / (float)self->_totalSyncOperations;
  return result;
}

- (void)newSyncOperationWithError:(id)a3
{
  if (a3)
    ++self->_failedSyncOperations;
  ++self->_totalSyncOperations;
}

- (void)clear
{
  self->_totalSyncOperations = 0;
  self->_failedSyncOperations = 0;
}

@end
