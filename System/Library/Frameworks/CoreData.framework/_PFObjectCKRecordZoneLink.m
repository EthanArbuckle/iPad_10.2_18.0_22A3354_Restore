@implementation _PFObjectCKRecordZoneLink

- (_PFObjectCKRecordZoneLink)initWithObjectID:(id)a3 recordName:(id)a4
{
  _PFObjectCKRecordZoneLink *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PFObjectCKRecordZoneLink;
  v6 = -[_PFObjectCKRecordZoneLink init](&v8, sel_init);
  if (v6)
  {
    v6->_objectID = (NSManagedObjectID *)a3;
    v6->_recordName = (NSString *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PFObjectCKRecordZoneLink;
  -[_PFObjectCKRecordZoneLink dealloc](&v3, sel_dealloc);
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (NSString)recordName
{
  return self->_recordName;
}

@end
