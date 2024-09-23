@implementation ALSCGreenClient

- (ALSCGreenClient)init
{
  ALSCGreenClient *v2;
  ALSCGreenClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ALSCGreenClient;
  v2 = -[ALSCGreenClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ALSCGreenClient _attemptReadingValuesFromDiskAndUpdateFileState](v2, "_attemptReadingValuesFromDiskAndUpdateFileState");
  return v3;
}

- (BOOL)key1Value
{
  -[ALSCGreenClient _attemptReadingValuesFromDiskAndUpdateFileState](self, "_attemptReadingValuesFromDiskAndUpdateFileState");
  return self->_key1Value;
}

- (BOOL)key2Value
{
  -[ALSCGreenClient _attemptReadingValuesFromDiskAndUpdateFileState](self, "_attemptReadingValuesFromDiskAndUpdateFileState");
  return self->_key2Value;
}

- (BOOL)key3Value
{
  -[ALSCGreenClient _attemptReadingValuesFromDiskAndUpdateFileState](self, "_attemptReadingValuesFromDiskAndUpdateFileState");
  return self->_key3Value;
}

- (BOOL)_readGreenKeysFromDictionary:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("key1"));
  if (v5)
  {
    v6 = (void *)v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ALSCGreenClient setKey1Value:](self, "setKey1Value:", objc_msgSend(v6, "BOOLValue"));
  }
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("key2"));
  if (v7)
  {
    v8 = (void *)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ALSCGreenClient setKey2Value:](self, "setKey2Value:", objc_msgSend(v8, "BOOLValue"));
  }
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("key3"));
  if (v9)
  {
    v10 = (void *)v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ALSCGreenClient setKey3Value:](self, "setKey3Value:", objc_msgSend(v10, "BOOLValue"));
  }
  v11 = objc_msgSend(a3, "objectForKey:", CFSTR("state"));
  if (v11)
  {
    v12 = (void *)v11;
    LOBYTE(v11) = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v12, "integerValue") > 0;
  }
  return v11;
}

- (BOOL)_attemptReadingValuesFromDiskAndUpdateFileState
{
  BOOL result;

  if (self->_cachingAllowed)
    return 1;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.plist")) & 1) == 0)return self->_cachingAllowed;
  result = -[ALSCGreenClient _readGreenKeysFromDictionary:](self, "_readGreenKeysFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Application Support/com.apple.palette.green.plist")));
  self->_cachingAllowed = result;
  return result;
}

- (void)setKey1Value:(BOOL)a3
{
  self->_key1Value = a3;
}

- (void)setKey2Value:(BOOL)a3
{
  self->_key2Value = a3;
}

- (void)setKey3Value:(BOOL)a3
{
  self->_key3Value = a3;
}

@end
