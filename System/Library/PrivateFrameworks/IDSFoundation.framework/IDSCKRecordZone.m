@implementation IDSCKRecordZone

+ (Class)__class
{
  if (qword_1EE40B100 != -1)
    dispatch_once(&qword_1EE40B100, &unk_1E3C206F8);
  return (Class)(id)qword_1EE40B0F8;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (IDSCKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
