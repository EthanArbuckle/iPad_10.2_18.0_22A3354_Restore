@implementation IDSCKRecord

+ (Class)__class
{
  if (qword_1EE40B090 != -1)
    dispatch_once(&qword_1EE40B090, &unk_1E3C1BE90);
  return (Class)(id)qword_1EE40B088;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (IDSCKRecordID)recordID
{
  return self->_recordID;
}

- (IDSCKRecordKeyValueSetting)encryptedValuesByKey
{
  return self->_encryptedValuesByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedValuesByKey, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
