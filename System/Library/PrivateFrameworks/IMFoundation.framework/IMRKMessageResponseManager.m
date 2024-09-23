@implementation IMRKMessageResponseManager

+ (Class)__class
{
  if (qword_1EE1DD688 != -1)
    dispatch_once(&qword_1EE1DD688, &unk_1E2C46228);
  return (Class)(id)qword_1EE1DD660;
}

+ (id)alloc
{
  uint64_t v2;
  uint64_t v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

+ (id)sharedManager
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend___class(a1, a2, v2, v3);
  return (id)objc_msgSend_sharedManager(v4, v5, v6, v7);
}

@end
