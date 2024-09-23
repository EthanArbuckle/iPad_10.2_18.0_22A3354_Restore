@implementation CLLocation

- (unint64_t)preservePrivacyForGeoHash:(void *)a1
{
  void *v4;
  unint64_t v5;

  if (!a1)
    return 0;
  -[CLLocation readDeviceSpecificSalt](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CLLocation sha256HashForGeohash:salt:]((uint64_t)a1, a2, v4) & 0xFFFFFFFFFFFFFC00;

  return v5;
}

- (uint64_t)sha256HashForGeohash:(void *)a3 salt:
{
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  unsigned __int8 md[16];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v4 = a3;
  if (a1)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "appendBytes:length:", &v8, 8);
    if (v4)
      objc_msgSend(v5, "appendData:", v4);
    *(_OWORD *)md = 0u;
    v10 = 0u;
    v6 = objc_retainAutorelease(v5);
    CC_SHA256((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), md);
    a1 = *(_QWORD *)md;

  }
  return a1;
}

- (id)readDeviceSpecificSalt
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  objc_msgSend(v2, "dataForKey:", CFSTR("CDPrivacyPreservingLocationHashDeviceSpecificSalt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CLLocation setSaltToUserDefaults:scheme:](a1, v2, CFSTR("CDPrivacyPreservingLocationHashDeviceSpecificSalt"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_INFO, "PrivacyPreservingLocationHash: Created a new salt for privacy preservation.", v6, 2u);
    }

  }
  return v3;
}

- (id)setSaltToUserDefaults:(void *)a3 scheme:
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[CLLocation randomData]((uint64_t)a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1)
    {
      objc_msgSend(v5, "setObject:forKey:", a1, v6);
      v7 = a1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[CLLocation setSaltToUserDefaults:scheme:].cold.1(v8);

    }
  }

  return a1;
}

- (id)randomData
{
  void *v1;
  const __SecRandom *v2;
  id v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
    v3 = objc_retainAutorelease(v1);
    if (SecRandomCopyBytes(v2, 8uLL, (void *)objc_msgSend(v3, "mutableBytes")))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setSaltToUserDefaults:(os_log_t)log scheme:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_219056000, log, OS_LOG_TYPE_FAULT, "PrivacyPreservingLocationHash: Tried to generate a salt for privacy preservation, but got back an empty NSData object", v1, 2u);
}

@end
