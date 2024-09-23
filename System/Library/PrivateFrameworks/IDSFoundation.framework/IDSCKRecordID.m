@implementation IDSCKRecordID

+ (Class)__class
{
  if (qword_1EE40B0A0 != -1)
    dispatch_once(&qword_1EE40B0A0, &unk_1E3C20658);
  return (Class)(id)qword_1EE40B098;
}

+ (IDSCKRecordID)alloc
{
  uint64_t v2;
  double v3;

  return (IDSCKRecordID *)objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

@end
