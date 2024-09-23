@implementation DNDSMutableIDSRecordMetadata

- (void)setRecordID:(id)a3
{
  DNDSIDSRecordID *v4;
  DNDSIDSRecordID *recordID;

  v4 = (DNDSIDSRecordID *)objc_msgSend(a3, "copy");
  recordID = self->super._recordID;
  self->super._recordID = v4;

}

- (void)setLastModified:(id)a3
{
  NSDate *v4;
  NSDate *lastModified;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  lastModified = self->super._lastModified;
  self->super._lastModified = v4;

}

- (void)setDeleted:(BOOL)a3
{
  self->super._deleted = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSIDSRecordMetadata _initWithRecordMetadata:]([DNDSIDSRecordMetadata alloc], "_initWithRecordMetadata:", self);
}

@end
