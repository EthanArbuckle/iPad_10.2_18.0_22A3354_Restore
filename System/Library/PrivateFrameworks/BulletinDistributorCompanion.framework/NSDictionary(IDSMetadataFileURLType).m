@implementation NSDictionary(IDSMetadataFileURLType)

- (uint64_t)idsMetadataFileURLType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("BLTFileURLType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (uint64_t)idsMetadataFileKey
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("BLTFileURLKey"));
}

@end
