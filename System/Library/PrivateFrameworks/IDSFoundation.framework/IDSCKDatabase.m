@implementation IDSCKDatabase

+ (Class)__class
{
  if (qword_1EE40B080 != -1)
    dispatch_once(&qword_1EE40B080, &unk_1E3C20638);
  return (Class)(id)qword_1EE40B078;
}

+ (IDSCKDatabase)alloc
{
  uint64_t v2;
  double v3;

  return (IDSCKDatabase *)objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

@end
