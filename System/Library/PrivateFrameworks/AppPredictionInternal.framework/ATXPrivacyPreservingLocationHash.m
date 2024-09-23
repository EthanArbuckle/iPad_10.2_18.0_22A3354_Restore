@implementation ATXPrivacyPreservingLocationHash

+ (int64_t)privacyPreservingGeohashForLocation:(id)a3 locationEnabled:(BOOL)a4
{
  return +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:locationHashLevel:locationEnabled:](ATXPrivacyPreservingLocationHash, "privacyPreservingGeohashForLocation:locationHashLevel:locationEnabled:", a3, 16, a4);
}

+ (int64_t)privacyPreservingCoarseGeohashForLocation:(id)a3 locationEnabled:(BOOL)a4
{
  return +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:locationHashLevel:locationEnabled:](ATXPrivacyPreservingLocationHash, "privacyPreservingGeohashForLocation:locationHashLevel:locationEnabled:", a3, 13, a4);
}

+ (int64_t)privacyPreservingZoom7GeohashForLocation:(id)a3 locationEnabled:(BOOL)a4
{
  return +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:locationHashLevel:locationEnabled:](ATXPrivacyPreservingLocationHash, "privacyPreservingGeohashForLocation:locationHashLevel:locationEnabled:", a3, 7, a4);
}

+ (int64_t)privacyPreservingGeohashForLocation:(id)a3 locationHashLevel:(int)a4 locationEnabled:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    if (v7)
    {
      v9 = objc_msgSend(v7, "atx_locationHashWithLevel:", v6);
      if (+[ATXPrivacyPreservingLocationHash geohashCollidesWithKnownLocationTypeForGeohash:](ATXPrivacyPreservingLocationHash, "geohashCollidesWithKnownLocationTypeForGeohash:", v9))
      {
        v10 = 0;
      }
      else
      {
        v10 = v9;
      }
      v11 = +[ATXPrivacyPreservingLocationHash preservePrivacyForGeoHash:](ATXPrivacyPreservingLocationHash, "preservePrivacyForGeoHash:", v10);
    }
    else
    {
      v11 = -2;
    }
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

+ (int64_t)geohashCollidesWithKnownLocationTypeForGeohash:(int64_t)a3
{
  return (unint64_t)a3 > 0xFFFFFFFFFFFFFFFDLL;
}

+ (int64_t)preservePrivacyForGeoHash:(int64_t)a3
{
  void *v4;
  int64_t v5;

  +[ATXPrivacyPreservingLocationHash readDeviceSpecificSalt](ATXPrivacyPreservingLocationHash, "readDeviceSpecificSalt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ATXPrivacyPreservingLocationHash dropLastTenBitsOfSHA256Hash:](ATXPrivacyPreservingLocationHash, "dropLastTenBitsOfSHA256Hash:", +[ATXPrivacyPreservingLocationHash sha256HashForGeohash:salt:](ATXPrivacyPreservingLocationHash, "sha256HashForGeohash:salt:", a3, v4));

  return v5;
}

+ (id)readDeviceSpecificSalt
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "dataForKey:", CFSTR("ATXPrivacyPreservingLocationHashDeviceSpecificSalt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[ATXPrivacyPreservingLocationHash setSaltToUserDefaults:scheme:](ATXPrivacyPreservingLocationHash, "setSaltToUserDefaults:scheme:", v3, CFSTR("ATXPrivacyPreservingLocationHashDeviceSpecificSalt"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "ATXPrivacyPreservingLocationHash: Created a new salt for privacy preservation.", v7, 2u);
    }

  }
  return v4;
}

+ (id)setSaltToUserDefaults:(id)a3 scheme:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  +[ATXPrivacyPreservingLocationHash randomData](ATXPrivacyPreservingLocationHash, "randomData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "setObject:forKey:", v7, v6);
    v8 = v7;
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[ATXPrivacyPreservingLocationHash setSaltToUserDefaults:scheme:].cold.1(v9);

  }
  return v7;
}

+ (id)randomData
{
  void *v2;
  const __SecRandom *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v4 = objc_retainAutorelease(v2);
  if (SecRandomCopyBytes(v3, 8uLL, (void *)objc_msgSend(v4, "mutableBytes")))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (int64_t)sha256HashForGeohash:(int64_t)a3 salt:(id)a4
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  int64_t v9;
  unsigned __int8 md[16];
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = a4;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "appendBytes:length:", &v9, 8);
  if (v4)
    objc_msgSend(v5, "appendData:", v4);
  *(_OWORD *)md = 0u;
  v11 = 0u;
  v6 = objc_retainAutorelease(v5);
  CC_SHA256((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), md);
  v7 = *(_QWORD *)md;

  return v7;
}

+ (int64_t)dropLastTenBitsOfSHA256Hash:(int64_t)a3
{
  return a3 & 0xFFFFFFFFFFFFFC00;
}

+ (void)setSaltToUserDefaults:(os_log_t)log scheme:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXPrivacyPreservingLocationHash: Tried to generate a salt for privacy preservation, but got back an empty NSData object", v1, 2u);
}

@end
