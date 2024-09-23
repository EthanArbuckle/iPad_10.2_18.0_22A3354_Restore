@implementation MOVWriterInterfaceUtil

+ (id)makeDeviceString
{
  void *v2;
  int v3;
  void **v4;
  uint64_t v5;
  void **v6;
  void *v7;
  void *v8;
  void *v10;
  void *__p[2];
  char v12;

  v10 = &unk_24CA36398;
  sub_21064D1EC((uint64_t)&v10, (char *)__p);
  nullsub_2(&v10);
  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = v12;
  v4 = (void **)__p[0];
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding");
  if (v3 >= 0)
    v6 = __p;
  else
    v6 = v4;
  objc_msgSend(v2, "stringWithCString:encoding:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v12 & 0x80000000) == 0)
    return v7;
  operator delete(__p[0]);
  return v8;
}

@end
