@implementation IDSCKSubscription

+ (Class)__class
{
  if (qword_1EE40B1D0 != -1)
    dispatch_once(&qword_1EE40B1D0, &unk_1E3C20818);
  return (Class)(id)qword_1EE40B1C8;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

@end
