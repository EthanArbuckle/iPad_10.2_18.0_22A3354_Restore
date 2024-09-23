@implementation ENExposureDetectionHistoryFile

- (ENExposureDetectionHistoryFile)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureDetectionHistoryFile *v7;
  uint64_t v8;
  NSDate *processDate;
  uint64_t v10;
  NSNumber *keyCount;
  void *v12;
  uint64_t v13;
  NSNumber *matchCount;
  uint64_t v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *metadata;
  uint64_t v19;
  uint64_t v20;
  ENRegion *sourceRegion;
  ENExposureDetectionHistoryFile *v22;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ENExposureDetectionHistoryFile;
  v7 = -[ENExposureDetectionHistoryFile init](&v24, sel_init);
  if (!v7)
  {
    if (a4)
    {
      ENErrorF(2);
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_15:
    v22 = 0;
    goto LABEL_12;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_15;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", xpc_dictionary_get_double(v6, "date"));
  processDate = v7->_processDate;
  v7->_processDate = (NSDate *)v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v6, "keyCt"));
  v10 = objc_claimAutoreleasedReturnValue();
  keyCount = v7->_keyCount;
  v7->_keyCount = (NSNumber *)v10;

  xpc_dictionary_get_value(v6, "mtKC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v6, "mtKC"));
    v13 = objc_claimAutoreleasedReturnValue();
    matchCount = v7->_matchCount;
    v7->_matchCount = (NSNumber *)v13;

  }
  xpc_dictionary_get_value(v6, "meta");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
  {
    if (MEMORY[0x20BD2F7B8](v15) != MEMORY[0x24BDACFA0])
    {
      if (a4)
      {
        ENErrorF(2);
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_21:
      v22 = 0;
      goto LABEL_11;
    }
    v17 = (NSDictionary *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        ENErrorF(2);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_21;
    }
    metadata = v7->_metadata;
    v7->_metadata = v17;

  }
  if (!CUXPCDecodeNSString())
    goto LABEL_21;
  v19 = objc_opt_class();
  ENXPCDecodeSecureObjectIfPresent(v6, "regionData", v19, a4);
  v20 = objc_claimAutoreleasedReturnValue();
  sourceRegion = v7->_sourceRegion;
  v7->_sourceRegion = (ENRegion *)v20;

  v22 = v7;
LABEL_11:

LABEL_12:
  return v22;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSData *fileHash;
  NSData *v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  double v10;
  NSNumber *matchCount;
  void *v12;
  NSString *sourceAppBundleIdentifier;
  const char *v14;
  ENRegion *sourceRegion;
  xpc_object_t xdict;

  v4 = a3;
  fileHash = self->_fileHash;
  if (fileHash)
  {
    v6 = objc_retainAutorelease(fileHash);
    v7 = -[NSData bytes](v6, "bytes");
    if (v7)
      v8 = (const char *)v7;
    else
      v8 = "";
    v9 = -[NSData length](v6, "length");

    xpc_dictionary_set_data(v4, "fileHash", v8, v9);
  }
  -[NSDate timeIntervalSinceReferenceDate](self->_processDate, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(v4, "date", v10);
  xpc_dictionary_set_uint64(v4, "keyCt", -[NSNumber unsignedLongLongValue](self->_keyCount, "unsignedLongLongValue"));
  matchCount = self->_matchCount;
  if (matchCount)
    xpc_dictionary_set_uint64(v4, "mtKC", -[NSNumber unsignedLongLongValue](matchCount, "unsignedLongLongValue"));
  if (self->_metadata)
  {
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v4, "meta", v12);

  }
  sourceAppBundleIdentifier = self->_sourceAppBundleIdentifier;
  xdict = v4;
  v14 = -[NSString UTF8String](objc_retainAutorelease(sourceAppBundleIdentifier), "UTF8String");
  if (v14)
    xpc_dictionary_set_string(xdict, "aBid", v14);

  sourceRegion = self->_sourceRegion;
  if (sourceRegion)
    ENXPCEncodeSecureObject(xdict, "regionData", sourceRegion, 0);

}

- (id)description
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v13;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v4 = 0;

  -[NSData bytes](self->_fileHash, "bytes", v13);
  -[NSData length](self->_fileHash, "length");
  -[NSData length](self->_fileHash, "length");
  NSAppendPrintF();
  v5 = v4;

  if (self->_sourceAppBundleIdentifier)
  {
    NSAppendPrintF_safe();
    v6 = v5;

    v5 = v6;
  }
  if (self->_sourceRegion)
  {
    NSAppendPrintF_safe();
    v7 = v5;

    v5 = v7;
  }
  NSAppendPrintF_safe();
  v8 = v5;

  NSAppendPrintF_safe();
  v9 = v8;

  if (self->_matchCount)
  {
    NSAppendPrintF_safe();
    v10 = v9;

    v9 = v10;
  }
  if (self->_metadata)
  {
    NSAppendPrintF();
    v11 = v9;

    v9 = v11;
  }
  return v9;
}

- (NSData)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)processDate
{
  return self->_processDate;
}

- (void)setProcessDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)keyCount
{
  return self->_keyCount;
}

- (void)setKeyCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier;
}

- (void)setSourceAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ENRegion)sourceRegion
{
  return self->_sourceRegion;
}

- (void)setSourceRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceRegion, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_matchCount, 0);
  objc_storeStrong((id *)&self->_keyCount, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_processDate, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
}

@end
