@implementation IDSCKDatabaseOperation

+ (Class)__class
{
  if (qword_1EE40B0C0 != -1)
    dispatch_once(&qword_1EE40B0C0, &unk_1E3C20698);
  return (Class)(id)qword_1EE40B0B8;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

@end
