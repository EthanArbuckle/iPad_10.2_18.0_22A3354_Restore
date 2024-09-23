@implementation IDSCKServerChangeToken

+ (Class)__class
{
  if (qword_1EE40B110 != -1)
    dispatch_once(&qword_1EE40B110, &unk_1E3C1BC30);
  return (Class)(id)qword_1EE40B108;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

@end
