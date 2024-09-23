@implementation IDSCKModifyRecordZonesOperation

+ (Class)__class
{
  if (qword_1EE40B150 != -1)
    dispatch_once(&qword_1EE40B150, &unk_1E3C20778);
  return (Class)(id)qword_1EE40B148;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)modifyRecordZonesCompletionBlock
{
  return self->_modifyRecordZonesCompletionBlock;
}

- (void)setModifyRecordZonesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifyRecordZonesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
}

@end
