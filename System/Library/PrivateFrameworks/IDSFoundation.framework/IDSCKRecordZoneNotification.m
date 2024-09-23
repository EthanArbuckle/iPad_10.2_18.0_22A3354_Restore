@implementation IDSCKRecordZoneNotification

+ (Class)__class
{
  if (qword_1EE40B180 != -1)
    dispatch_once(&qword_1EE40B180, &unk_1E3C207B8);
  return (Class)(id)qword_1EE40B178;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (IDSCKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end
