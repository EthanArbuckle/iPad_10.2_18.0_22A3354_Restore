@implementation BLJaliscoVersion

+ (id)persistentStoreFileName
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@.sqlite"), CFSTR("BKJaliscoServerSource"), CFSTR("v09182016"));
}

+ (id)defaultIdentifier
{
  return CFSTR("BKJaliscoServerSource");
}

+ (id)schemaVersion
{
  return CFSTR("v09182016");
}

@end
