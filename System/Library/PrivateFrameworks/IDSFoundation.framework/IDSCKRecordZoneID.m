@implementation IDSCKRecordZoneID

+ (Class)__class
{
  if (qword_1EE40B0F0 != -1)
    dispatch_once(&qword_1EE40B0F0, &unk_1E3C1BB50);
  return (Class)(id)qword_1EE40B0E8;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
