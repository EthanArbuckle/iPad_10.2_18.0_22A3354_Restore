@implementation NSDictionary(NNHeadlineSyncHelpers)

- (uint64_t)sync_expirationDate
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_expirationDate"));
}

- (uint64_t)sync_sections
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_sections"));
}

- (uint64_t)sync_headlineCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_headlineCount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)sync_identifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_identifier"));
}

- (uint64_t)sync_name
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_name"));
}

- (unint64_t)sync_type
{
  void *v1;
  unint64_t v2;
  NSObject *v3;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_type"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  if (v2 >= 6)
  {
    NNSetupCompanionSyncLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = v2;
      _os_log_impl(&dword_2197E6000, v3, OS_LOG_TYPE_INFO, "Unknown type %lu", (uint8_t *)&v5, 0xCu);
    }

    return 0;
  }
  return v2;
}

- (uint64_t)sync_title
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_title"));
}

- (uint64_t)sync_excerpt
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_excerpt"));
}

- (uint64_t)sync_headlines
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_headlines"));
}

- (uint64_t)sync_publisherName
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_publisherName"));
}

- (uint64_t)sync_publisherIdentifier
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_publisherIdentifier"));
}

- (uint64_t)sync_colorHexString
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_colorHexString"));
}

- (uint64_t)sync_thumbnailImageData
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_thumbnailImageData"));
}

- (uint64_t)sync_publisherLogoImageData
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_publisherLogoImageData"));
}

- (uint64_t)sync_NewsURLString
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("sync_NewsURLString"));
}

@end
