@implementation ENExposureDetectionHistorySession

- (ENExposureDetectionHistorySession)init
{
  void *v3;
  ENExposureDetectionHistorySession *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ENExposureDetectionHistorySession initWithUUID:](self, "initWithUUID:", v3);

  return v4;
}

- (ENExposureDetectionHistorySession)initWithUUID:(id)a3
{
  id v4;
  ENExposureDetectionHistorySession *v5;
  uint64_t v6;
  NSUUID *UUID;
  ENExposureDetectionHistorySession *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ENExposureDetectionHistorySession;
  v5 = -[ENExposureDetectionHistorySession init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    v8 = v5;
  }

  return v5;
}

- (ENExposureDetectionHistorySession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureDetectionHistorySession *v7;
  NSDate *v8;
  NSDate *date;
  int v10;
  uint64_t v11;
  ENRegion *v12;
  ENRegion *region;
  ENExposureDetectionHistorySession *v14;

  v6 = a3;
  if (!CUXPCDecodeNSUUID())
    goto LABEL_14;
  v7 = -[ENExposureDetectionHistorySession initWithUUID:](self, "initWithUUID:", 0);
  if (!v7)
  {
    if (a4)
    {
      ENErrorF(2);
      self = 0;
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    self = 0;
    goto LABEL_14;
  }
  self = v7;
  if (!CUXPCDecodeNSString())
    goto LABEL_14;
  v8 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", xpc_dictionary_get_double(v6, "date"));
  date = self->_date;
  self->_date = v8;

  if (!CUXPCDecodeNSString())
    goto LABEL_14;
  v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    self->_fileCount = 0;
    goto LABEL_8;
  }
  if (v10 == 5)
  {
LABEL_14:
    v14 = 0;
    goto LABEL_10;
  }
LABEL_8:
  self->_matchCount = xpc_dictionary_get_uint64(v6, "mtKC");
  v11 = objc_opt_class();
  ENXPCDecodeSecureObjectIfPresent(v6, "regionData", v11, a4);
  v12 = (ENRegion *)objc_claimAutoreleasedReturnValue();
  region = self->_region;
  self->_region = v12;

  if (!CUXPCDecodeNSString())
    goto LABEL_14;
  self = self;
  v14 = self;
LABEL_10:

  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  NSString *exposureClassificationIdentifier;
  id v8;
  const char *v9;
  uint64_t fileCount;
  ENRegion *region;
  NSString *systemBuildVersion;
  id v13;
  const char *v14;
  NSUUID *v15;
  id v16;
  unsigned __int8 uuid[8];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NSString UTF8String](objc_retainAutorelease(self->_appBundleIdentifier), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "aBid", v5);
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(v4, "date", v6);
  exposureClassificationIdentifier = self->_exposureClassificationIdentifier;
  v8 = v4;
  v9 = -[NSString UTF8String](objc_retainAutorelease(exposureClassificationIdentifier), "UTF8String");
  if (v9)
    xpc_dictionary_set_string(v8, "expCID", v9);

  fileCount = self->_fileCount;
  if (fileCount)
    xpc_dictionary_set_uint64(v8, "fileCt", fileCount);
  xpc_dictionary_set_uint64(v8, "mtKC", self->_matchCount);
  region = self->_region;
  if (region)
    ENXPCEncodeSecureObject(v8, "regionData", region, 0);
  systemBuildVersion = self->_systemBuildVersion;
  v13 = v8;
  v14 = -[NSString UTF8String](objc_retainAutorelease(systemBuildVersion), "UTF8String");
  if (v14)
    xpc_dictionary_set_string(v13, "sysBV", v14);

  v15 = self->_UUID;
  if (v15)
  {
    *(_QWORD *)uuid = 0;
    v18 = 0;
    v16 = v13;
    -[NSUUID getUUIDBytes:](v15, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v16, "sessID", uuid);

  }
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

  if (self->_appBundleIdentifier)
  {
    NSAppendPrintF_safe();
    v5 = v4;

    v4 = v5;
  }
  if (self->_region)
  {
    NSAppendPrintF_safe();
    v6 = v4;

    v4 = v6;
  }
  NSAppendPrintF_safe();
  v7 = v4;

  NSAppendPrintF_safe();
  v8 = v7;

  NSAppendPrintF_safe();
  v9 = v8;

  NSAppendPrintF_safe();
  v10 = v9;

  if (self->_exposureClassificationIdentifier)
  {
    NSAppendPrintF_safe();
    v11 = v10;

    v10 = v11;
  }
  return v10;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)exposureClassificationIdentifier
{
  return self->_exposureClassificationIdentifier;
}

- (void)setExposureClassificationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)fileCount
{
  return self->_fileCount;
}

- (void)setFileCount:(unint64_t)a3
{
  self->_fileCount = a3;
}

- (unint64_t)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(unint64_t)a3
{
  self->_matchCount = a3;
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_exposureClassificationIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
