@implementation CKRecordZoneID(CKRecordZoneID)

+ (id)brc_containerMetadataZoneID
{
  id v0;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  return (id)objc_msgSend(v0, "initWithZoneName:ownerName:", *MEMORY[0x1E0D10DA0], *MEMORY[0x1E0C94730]);
}

+ (id)brc_zoneHealthZoneID
{
  id v0;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  return (id)objc_msgSend(v0, "initWithZoneName:ownerName:", *MEMORY[0x1E0D10E20], *MEMORY[0x1E0C94730]);
}

+ (id)brc_sideCarZoneID
{
  id v0;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  return (id)objc_msgSend(v0, "initWithZoneName:ownerName:", *MEMORY[0x1E0D11150], *MEMORY[0x1E0C94730]);
}

@end
