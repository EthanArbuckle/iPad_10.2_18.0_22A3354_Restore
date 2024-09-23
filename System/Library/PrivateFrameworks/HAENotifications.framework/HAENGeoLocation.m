@implementation HAENGeoLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->immutableDescription, 0);
  objc_storeStrong((id *)&self->timestamp, 0);
  objc_storeStrong((id *)&self->countryCode, 0);
}

- (unsigned)source
{
  return self->source;
}

- (HAENGeoLocation)init
{
  HAENGeoLocation *v2;
  id v3;
  uint64_t v4;
  NSString *countryCode;
  NSDate *timestamp;
  void *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  NSString *immutableDescription;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HAENGeoLocation;
  v2 = -[HAENGeoLocation init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE0A230]);
    objc_msgSend(v3, "getPreferenceFor:", *MEMORY[0x24BE0A1B8]);
    v4 = objc_claimAutoreleasedReturnValue();
    countryCode = v2->countryCode;
    v2->countryCode = (NSString *)v4;

    timestamp = v2->timestamp;
    *(int8x8_t *)&v2->source = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v2->countryCode == 0), 0x1FuLL)), (int8x8_t)0xFF00000001, (int8x8_t)0x10000000002);
    v2->timestamp = 0;

    -[HAENGeoLocation fetchGeoLocation](v2, "fetchGeoLocation");
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = v2->countryCode;
    -[HAENGeoLocation describeSource](v2, "describeSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("HAENGeoLocation: [%@, %@, %@]"), v8, v9, v2->timestamp);
    v10 = objc_claimAutoreleasedReturnValue();
    immutableDescription = v2->immutableDescription;
    v2->immutableDescription = (NSString *)v10;

  }
  return v2;
}

- (id)describeSource
{
  unsigned int v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = self->source - 2;
  v3 = CFSTR("unknown");
  v4 = CFSTR("unknown");
  if (v2 <= 3)
    v4 = off_24D19F528[v2];
  if (self->sourceDevice == 256)
    v3 = CFSTR("local");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v4, v3);
}

- (void)fetchGeoLocation
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSDate *v7;
  NSString *countryCode;
  NSString *v9;
  NSDate *timestamp;
  NSDate *v11;
  int8x8_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->source == 2)
  {
    HAENotificationsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[HAENGeoLocation description](self, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_2144B3000, v3, OS_LOG_TYPE_DEFAULT, "Geo Location Country Code is overriden %@", buf, 0xCu);

    }
  }
  else
  {
    *(_DWORD *)buf = 1;
    objc_msgSend(MEMORY[0x24BE3CBB8], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v5, "countryCodeWithSource:updatedAtTime:", buf, &v13);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = (NSDate *)v13;

    countryCode = self->countryCode;
    self->countryCode = v6;
    v9 = v6;

    timestamp = self->timestamp;
    self->timestamp = v7;
    v11 = v7;

    v12 = (int8x8_t)vld1_dup_f32((const float *)buf);
    *(int8x8_t *)&self->source = vand_s8(v12, (int8x8_t)0xFF00000000FFLL);

  }
}

- (id)description
{
  return self->immutableDescription;
}

- (NSString)countryCode
{
  return self->countryCode;
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (unsigned)sourceDevice
{
  return self->sourceDevice;
}

- (NSString)immutableDescription
{
  return self->immutableDescription;
}

@end
