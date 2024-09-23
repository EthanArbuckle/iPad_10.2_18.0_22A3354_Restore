@implementation APVersionTestData

- (APVersionTestData)init
{
  const char *v2;
  uint64_t v3;
  APVersionTestData *v4;
  uint64_t v5;
  NSArray *testURLS;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *directoryURLs;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)APVersionTestData;
  v4 = -[APVersionTestData init](&v12, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    testURLS = v4->_testURLS;
    v4->_testURLS = (NSArray *)v5;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    directoryURLs = v4->_directoryURLs;
    v4->_directoryURLs = (NSArray *)v9;

  }
  return v4;
}

- (id)subdirectoriesAtURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  int isEqualToString;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend_directoryURLs(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v10 = (void *)v7,
        objc_msgSend_lastPathComponent(v4, v8, v9),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v11, v12, (uint64_t)CFSTR("APCS")),
        v11,
        v10,
        isEqualToString))
  {
    objc_msgSend_directoryURLs(self, v8, v9);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_testURLS(self, v8, v9);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

- (void)setTestURLS:(id)a3
{
  objc_storeStrong((id *)&self->_testURLS, a3);
}

- (void)setDirectoryURLs:(id)a3
{
  objc_storeStrong((id *)&self->_directoryURLs, a3);
}

- (NSArray)testURLS
{
  return self->_testURLS;
}

- (NSArray)directoryURLs
{
  return self->_directoryURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryURLs, 0);
  objc_storeStrong((id *)&self->_testURLS, 0);
}

@end
