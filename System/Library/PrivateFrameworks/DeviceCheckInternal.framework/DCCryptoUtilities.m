@implementation DCCryptoUtilities

+ (id)identityCertificateOptions
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x24BDAC8D0];
  v2 = +[DCCryptoUtilities generateTTL](DCCryptoUtilities, "generateTTL");
  _DCLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[DCCryptoUtilities identityCertificateOptions].cold.1(v2, v3);

  v4 = (void *)MEMORY[0x24BDBCED8];
  v16[0] = *MEMORY[0x24BE2C480];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE2C470];
  v17[0] = v5;
  v17[1] = MEMORY[0x24BDBD1C0];
  v7 = *MEMORY[0x24BE2C3D0];
  v16[1] = v6;
  v16[2] = v7;
  v8 = *MEMORY[0x24BE2C3C8];
  v17[2] = CFSTR("2bit-identity");
  v17[3] = CFSTR("2bit-identity");
  v9 = *MEMORY[0x24BE2C3C0];
  v16[3] = v8;
  v16[4] = v9;
  v17[4] = MEMORY[0x24BDBD1C0];
  v16[5] = *MEMORY[0x24BE2C448];
  v15 = *MEMORY[0x24BE2C458];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_variant_allows_internal_security_policies())
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
    if (objc_msgSend(v13, "BOOLForKey:", CFSTR("DCIgnoreExistingKeychainItems")))
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v9);

  }
  if ((MEMORY[0x22768F1C4]() & 1) == 0)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v6);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2C468]);
  return v12;
}

+ (unsigned)generateTTL
{
  return arc4random_uniform(0x40561u) + 262080;
}

+ (void)identityCertificateOptions
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109632;
  v2[1] = 262080;
  v3 = 1024;
  v4 = a1;
  v5 = 1024;
  v6 = 525600;
  _os_log_debug_impl(&dword_224FB2000, a2, OS_LOG_TYPE_DEBUG, "Attempting to generate certificate data... (%dh/%dh/%dh)", (uint8_t *)v2, 0x14u);
}

@end
