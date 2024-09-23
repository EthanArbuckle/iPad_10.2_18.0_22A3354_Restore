@implementation BDSAppGroupContainer

+ (NSURL)containerURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend_isUnitTesting(a1, a2, v2, v3, v4))
  {
    if (qword_25592A548 != -1)
      dispatch_once(&qword_25592A548, &unk_24F08BA88);
    v9 = (id)qword_25592A550;
  }
  else
  {
    objc_msgSend_bu_booksGroupContainerURL(MEMORY[0x24BDBCF48], v5, v6, v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v9;
}

+ (BOOL)isUnitTesting
{
  if (qword_253F3C640 != -1)
    dispatch_once(&qword_253F3C640, &unk_24F08BA68);
  return (byte_25592A540 | byte_253F3B140) != 0;
}

+ (id)containerIdentifier
{
  return (id)*MEMORY[0x24BE0FBA8];
}

+ (void)setUnitTesting:(BOOL)a3
{
  byte_25592A540 = a3;
}

+ (NSURL)documentsURL
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)objc_opt_class();
  objc_msgSend_containerURL(v2, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v7, v8, (uint64_t)CFSTR("Documents"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v11;
}

@end
