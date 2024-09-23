@implementation NSMutableDictionary(IDSMetadataURLType)

- (void)setIdsMetadataFileURLType:()IDSMetadataURLType
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("BLTFileURLType"));

}

- (void)setIdsMetadataFileKey:()IDSMetadataURLType
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_msgSend(a3, "copy");
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v4, CFSTR("BLTFileURLKey"));

  }
}

@end
